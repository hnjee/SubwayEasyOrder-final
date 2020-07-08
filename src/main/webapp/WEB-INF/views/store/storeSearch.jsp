<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/indexStyle.css">
<title>Insert title here</title>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" type="text/css"  href="../css/headerStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/menuSelectStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/footerStyle.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<c:import url="../template/boot.jsp"></c:import>
<style type="text/css">
.talkbubble {
	width: 50px;
	height: 50px;
	background: rgb(0, 152, 61);
	position: relative;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 10px;
	-ms-transform: rotate(270deg); /* IE 9 */
	-webkit-transform: rotate(270deg); /* Chrome, Safari, Opera */
	transform: rotate(270deg);
	opacity: 0.7;
}

.talkbubble:before {
	content: "";
	position: absolute;
	right: 100%;
	top: 12px;
	width: 0;
	height: 0;
	border-top: 13px solid transparent;
	border-right: 13px solid rgb(0, 152, 61);
	border-bottom: 13px solid transparent;
}
</style>

</head>
<body>
	<c:import url="../jsp/header.jsp"></c:import>
	<div class="container-fulid mb-5">
		
		<div class="row">
			<div class="col-sm-2">
				
			</div>
			<div class="col-sm-8" style="text-align: center; height: 27px;">
				<div style="border: 2px solid green; width: 40%;height: 52px; margin-left: 30%;">
					<input id="search" onkeydown="enter();" size="15" type="text" style="border:0px; height:100%;width:80%; outline: 0;float: left;">
					<button id="btn" style="width: 20%;height: 100%;background-color: #f1a03c; border: 0px; outline: 0">
						<i class="fa fa-search" style="font-size:20px;color:white"></i>
					</button>
				
				</div>
				<i class="material-icons" style="font-size:25px;color:#009223;" >my_location</i>
				<span style="font-weight: bold; font-size: 20px;" id="location"></span>
				<div id="map" style="margin-top:30px; width: 100%; height: 500px;"></div>
			</div>
			<div class="col-sm-2"></div>
		</div>
		
		
		
	</div>







<script type="text/javascript">
	$("#btn").click(function(){
		var text = $("#search").val();
		console.log(text);
		location.href="./storeSearch2?search="+text;
	});
		
	function enter(){
		if(event.keyCode == 13){
			$("#btn").click();

		}
	}
	
</script>







<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e8f222776d2a9d10e62a6e476046e2d1&libraries=services,clusterer,drawing"></script>

<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 5 // 지도의 확대 레벨 
	}; 
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	

	
	//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	
	// GeoLocation을 이용해서 접속 위치를 얻어옵니다
	navigator.geolocation.getCurrentPosition(function(position) {
	    
	    var lat = position.coords.latitude, // 위도 ,y
	        lon = position.coords.longitude; // 경도 ,x
	    
	    var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	        message = '<div style="padding:5px;">내 위치</div>'; // 인포윈도우에 표시될 내용입니다
	    
	    // 마커와 인포윈도우를 표시합니다
	    displayMarker(locPosition, message);
	    var geocoder = new kakao.maps.services.Geocoder();

	    var coord = new kakao.maps.LatLng(lat, lon);
	    var callback = function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	            console.log(result[0].address.address_name);
	            console.log(result[0]);
	            var location = result[0].address.address_name;
	            $("#location").text(location);
	        }
	    };

	    geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
//========================================================================
	    var places = new kakao.maps.services.Places();

	    var callback = function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	        	var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다
	        	
	       		imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
	        	imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	        	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	            console.log(result);
	            console.log(result.length);
	          
	            
	            for(var i=0;i<result.length;i++){
		            var lat = result[i].y;
		            var lon = result[i].x;
		            var locPosition2 = new kakao.maps.LatLng(lat, lon);
		            var name = result[i].place_name;
		            message = '<div style="padding:5px;">SubWay</div>';
		            //displayMarker(locPosition2, message,markerImage);
		            
		            var content = '<div class="talkbubble" class="mt-5" id="'+i+'">' + 
		    					  '<img src="../images/sb.PNG"'+
		    					  'style="width: 35px; height: 35px; margin:7px 0 0 7px;'+
		    				 	  '-ms-transform: rotate(90deg); /* IE 9 */ ' +
		    				 	  '-webkit-transform: rotate(90deg); /* Chrome, Safari, Opera */'+
		    				  	  'transform: rotate(90deg);">'+
		    					  '</div>';	

		        	// 커스텀 오버레이가 표시될 위치입니다 
		        	var position = locPosition2; 
		        	
		        	// 커스텀 오버레이를 생성합니다
		        	var customOverlay = new kakao.maps.CustomOverlay({
		        	    position: position,
		        	    content: content,
		        	    xAnchor: 0.5,
		        	    yAnchor: 1.4
		        	});
		        	
		        	// 커스텀 오버레이를 지도에 표시합니다
		        	customOverlay.setMap(map);   
					
			           
		        }
	            map.setCenter(locPosition);
	            $(".talkbubble").each(function(){
					var i = $(this).attr("id");
					$(this).mouseover(function(){
						$(this).css({
							'cursor':'pointer'
						});
						var markerPosition  = new kakao.maps.LatLng(result[i].y, result[i].x); 
						var infowindow = new kakao.maps.InfoWindow({
						    map: map,
						    position: new kakao.maps.LatLng(result[i].y, result[i].x),
						    content: result[i].place_name
						});
						var marker = new kakao.maps.Marker({
							image:markerImage,
						    position: markerPosition
						});
						infowindow.setZIndex(10);
						infowindow.open(map,marker);
						$(this).mouseout(function(){
							infowindow.close();
						});
						
						
						
					});
					$(this).click(function(){
						var msg = result[i].place_name;
						var name = msg.replace("써브웨이 ","");
						if(confirm(msg+"에서 주문하시겠습니까?")){
							$.ajax({
								type:'GET',
								url:"./findStore",
								data:{
									name:name	
								},success:function(data){
									if(data=='null'){
										alert("서비스 준비중인 매장입니다.");
									} else {
										location.href="../menu/cateList?storeNum="+data;
									}
								}
								

							});							

						} else{
							console.log("아뇨");

						}
						

					});
					
				});

	            
	        }
	        
	    };
	    
	    places.keywordSearch('서브웨이', callback,{location:locPosition,radius:1500});
//========================================================================
	    
	        
	  });
	
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	
	var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	    message = 'geolocation을 사용할수 없어요..'
	    
	displayMarker(locPosition, message);
	}
	
	//지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message,image) {
	


		
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({  
	    map: map, 
	    position: locPosition,
	    image:image
	}); 
	
	var iwContent = message, // 인포윈도우에 표시할 내용
	    iwRemoveable = true;
	
	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    content : iwContent,
	    removable : iwRemoveable
	});
	
	// 인포윈도우를 마커위에 표시합니다 
	infowindow.open(map, marker);
	
	// 지도 중심좌표를 접속위치로 변경합니다
	map.setCenter(locPosition);

	// 인포 윈도우 삭제
	infowindow.close();
	
	}
	
//---------------------------------------------------------------------------


  







</script>
</body>

</html>