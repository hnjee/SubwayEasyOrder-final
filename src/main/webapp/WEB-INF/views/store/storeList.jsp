<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<link rel="stylesheet" type="text/css"  href="../css/headerStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/footerStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/storeListStyle.css"> 
</head>
<body>
<!-- header start -->
<c:import url="../jsp/header.jsp"></c:import>
<!-- header end -->

<div id="store_main">
	<div id="store_title">
		<h2>주문매장 선택</h2>
	</div>
	
	<div id="store_selectbar">	
		<a href="javascript:void(0);">
			<div id="searchBar" class="selectbar baractive"> 매장찾기 </div>
		</a>
		<a href="./myStoreList?cases=${cases}">
			<div id="myBar" class="selectbar"> 자주 찾는 매장 </div>
		</a>
	</div>
	
	<div id="store_contents">
		<div id="store_list">
			<div class="form_search">
				<form action="./storeList" method="post" id="mapFrm">
					<input type="text" name="address" id="keyword" maxlength="30"placeholder="지역 또는 매장명 입력" value="${address}">
					<input type="hidden" name="cases" value="${cases}">
					<button type="submit" class="btn_search"></button>
				</form>
			</div>
			<div id="list_wrap">
			<c:if test="${st eq 1}">
				<p class="search_total">
					검색 결과 <strong id="uiResultCount">${storeCnt}</strong>건
				</p>
				</c:if>
				<div id="store_searchRes">
					<ul>
					<c:forEach items="${list}" var="vo" varStatus="i">
						<li>	
							<div class="store_name">
								<strong class="s_name">${vo.name}</strong>
								<label class="my_bookmark">	
									<i class="i_star" id="star${i.index}" title="${vo.storeNum}" onclick="myOnOff(this)"></i>
								</label>
								<c:if test="${vo.best eq 1}">
									<div id="best">
										<p>우수매장</p> 
										<img src="../images/trophy_icon-icons.com_49969.png"/>
									</div> 
								</c:if>
									
								<c:if test="${vo.orderable eq 1}">
									<a href="./storeUpdate?storeNum=${vo.storeNum}&cases=${cases}"><em class="on">주문하기</em></a>
								</c:if>
								<c:if test="${vo.orderable eq 0}">
									<em>주문불가</em> 
								</c:if>
								
							</div>
							
							<script type="text/javascript">
								<c:forEach items="${myNums}" var="my">
									if("${vo.storeNum}" == "${my}"){
										$("#star${i.index}").addClass("myOn");
									}
								</c:forEach>

								function myOnOff(a){
									var cName = $(a).attr("class");
									if(cName.includes("myOn")){
										var res = confirm("자주 찾는 매장에서 삭제하시겠습니까?");
										if(res){
											$.get("myStoreDelete?returnUrl=storeList&storeNum="+a.title, function(){
												$(a).removeClass("myOn");
											});
										}

									} else{
										var res = confirm("자주 찾는 매장에 추가하시겠습니까?");
										if(res){
											$.get("myStoreInsert?storeNum="+a.title, function(){
												$(a).addClass("myOn");
											});
										}
									}								
								}
							</script>
							
							<div class="storeInfo">
								<span class="s_address">${vo.address}</span>
								<span class="s_telNumber">연락처: ${vo.telNumber}</span>
								<span class="s_hours">영업시간: ${vo.hours}</span>
							</div>
						</li>
					</c:forEach>
					</ul>
				</div>	
			</div>
			
		</div>
		
		<div id="store_map">
			<!-- 지도 불러오기 -->
			 <div aria-hidden="false" class="_10v3f8y9">
				<aside aria-label="검색 기반 위치 핀이 표시되는 지도" class="_zdxht7" style="height: 85vh; padding-top: 80px; margin-top: -80px; position: sticky; top: 0px;">
					<div data-veloute="map/GoogleMap" style="position: relative; width: 100%; height: 100%;">
						<div style="height: 100%; background-color: rgb(230, 227, 223); position: relative; overflow: hidden;">
							<div style="height: 100%; width: 100%; position: absolute; top: 0px; left: 0px; background-color: rgb(229, 227, 223);">
								<div class="gm-style" style="position: absolute; z-index: 0; left: 0px; top: 0px; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px;">
									<div id="map" style="z-index: -1;position: absolute;width: 100%;height: 100%;top: 0px;left: 0px;border: none;"></div>
								</div>
							</div>
						</div>
					</div>
				</aside>
			</div>
			<!-- 지도 불러오기 끝 -->
		</div>
	</div>

</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e8f222776d2a9d10e62a6e476046e2d1&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(37.5579038249194,126.909600161339), // 지도의 중심좌표
    level: 5 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
//마커를 표시할 위치와 내용을 가지고 있는 객체 배열 만들기 
var positions = [];
<c:forEach items="${list}" var="store">		
	console.log("${store.address}");
	var content = '<div class="store_map_layer">'	
	+	'<div class="head">'		
	+		'<strong>${store.name}</strong>'		
	+		'<a href="#none" class="btn_close" onclick="closeOverlay()">닫기</a>'	
	+	'</div>	'
	+	'<div class="info">	'	
	+		'<dl>	'		
	+			'<dt>주소</dt>'	
	+		'	<dd>${store.address}</dd>'	
	+		'	<dt>연락처</dt> '
	+		'	<dd>${store.telNumber}</dd>'
	+		'	<dt>영업시간</dt>	'
	+		'	<dd>${store.hours}</dd>	'				
	+		'</dl>'	
	+	'</div>'	
	+	'<div class="foot">'		
	+		'<a href="javascript:void(0);" class="btn_order on" id="ord_fast" data-storcd="69383"><span>주문하기</span></a>'
	+	'</div>'
	+ '</div>';
	var address = "${store.address}";
	var p = {content: content, address: address};
	positions.push(p);
</c:forEach>

//지도 중심 설정 
var geocoder = new kakao.maps.services.Geocoder();
geocoder.addressSearch(positions[0].address,function(result,status){
	if (status === kakao.maps.services.Status.OK) { 
		var locCode = new kakao.maps.LatLng(result[0].y, result[0].x); 
		map.setCenter(locCode);
	}
});

//마커, 인포윈도우 생성
for (var i = 0; i < positions.length; i ++) {
	var content = positions[i].content;
	geocoder.addressSearch(positions[i].address,function(result,status){
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: new kakao.maps.LatLng(result[0].y, result[0].x) // 마커의 위치
	    });

	    // 오버레이를 생성 
	    var overlay = new kakao.maps.CustomOverlay({
	        content: content,
	        map: map,
	        position: marker.getPosition()       
	    });

	 	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	        overlay.setMap(map);
	    });

	  //커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	    function closeOverlay() {
	        overlay.setMap(null);     
	    }
	});
}

</script> 

<!-- footer start -->
<c:import url="../jsp/footer.jsp"></c:import>
<!-- footer end -->
	
</body>
</html>