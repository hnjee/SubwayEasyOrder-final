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
		<a href="./storeList?cases=${cases}">
			<div id="searchBar" class="selectbar"> 매장찾기 </div>
		</a>
		<a href="javascript:void(0);">
			<div id="myBar" class="selectbar baractive"> 자주 찾는 매장 </div>
		</a>
	</div>

	<div id="store_contents">
	<c:if test="${myCnt eq 0}">
		<div id="myEmpty"> 
			<div style="padding: 150px 0">
				<p>자주 찾는 매장 정보가 없습니다.<br> 자주 찾는 매장은 MY-SUB 페이지에서 설정이 가능합니다.</p>
			</div>
		</div>
	</c:if>
	<c:if test="${myCnt ne 0}">
		<div id="myStoreList">
			<div id="ms1">
				자주 찾는 매장 (등록 매장 <strong>${myCnt}</strong>개)
			</div>
			<div>
				<table class="often_list">
					<colgroup>
						<col width="166px">
						<col width="*">
						<col width="200px">
						<col width="144px">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">매장명</th>
							<th scope="col">매장주소</th>
							<th scope="col">연락처</th>
							<th scope="col">주문상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${myList}" var="my">
						<tr>
							<td>
								<div class="store_name">
									<label class="my_bookmark" style="float: left;  line-height: 69px;">
										<input onclick="myOff(this)" type="checkbox" data-frno="31" data-idx="8576" title="${my.storeNum}">
										<i class="i_star myOn"></i>
									</label>								
									<span style="float: left; position: absolute; top:2px;">${my.name}</span>
								</div>
							</td>
							<td>
								<div>${my.address}</div>
							</td>
							<td>
								<div class="store_tel tel" style="color: #999;">${my.telNumber}</div>
							</td>
							<td>
								<c:if test="${my.orderable eq 0}">
									<div class="store_status" onclick="noPop();"><a href="javascript:void(0);">주문불가</a></div>
								</c:if>
								<c:if test="${my.orderable ne 0}">
									<div class="store_status"><a class="on" href="./storeUpdate?storeNum=${my.storeNum}&cases=${cases}">주문하기</a></div>
								</c:if>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>

	<script type="text/javascript">
		function noPop(){
			alert("현재 주문이 불가능한 매장입니다.");
		}
		function myOff(a){
			var res = confirm("자주 찾는 매장에서 삭제하시겠습니까?");
			if(res){
				location.href="myStoreDelete?returnUrl=myStoreList&storeNum="+a.title; 
			} 
		}
	</script>
		
	</div>

</div>

<!-- footer start -->
<c:import url="../jsp/footer.jsp"></c:import>
<!-- footer end -->
	
</body>
</html>