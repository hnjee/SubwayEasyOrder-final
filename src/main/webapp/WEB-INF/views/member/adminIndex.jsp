<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUBWAY SHOP ADMIN HOME</title>
<c:import url="../template/boot.jsp"></c:import>
<link rel="stylesheet" type="text/css"  href="../css/headerStyle.css">
 <link href="../css/subway/ui.adminIndex.css" rel="stylesheet" type="text/css">
 <link href="../css/subway/ui.commonAdmin.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"  href="../css/footerStyle.css">

</head>
<body>

<div id="wrap">
<!-- header start -->
<c:import url="../jsp/headerAdmin.jsp"></c:import>
<!-- header end -->

<div class="sandwich_artist_wrapper">
<div class="recruit">
	<div class="hd">
		<h3>관리자 모드</h3>
		<p>원하시는 기능을 선택하세요</p>
	</div>

	<div class="recruit_link">
		<div class="cont">		
		<c:if test="${member.level eq 3}">
		<div class="box">
			<a href="${pageContext.request.contextPath}/product/headOfficeProductList">
			<div class="logo"></div>
			<strong style="font-weight: 600;">메뉴 관리</strong>
			<span>바로가기</span>
			</a>
		</div>	
		<div class="box">
			<a href="${pageContext.request.contextPath}/headOfficeSales/chart">
			<div class="logo"></div>
			<strong style="font-weight: 600;">매출 관리</strong>
			<span>바로가기</span>
			</a>
		</div>	
		<div class="box">
			<a href="${pageContext.request.contextPath}/franchise/franchiseManage">
			<div class="logo"></div>
			<strong style="font-weight: 600;">가맹점 관리</strong>
			<span>바로가기</span>
			</a>
		</div>		
		</c:if>
		
		
		<c:if test="${member.level eq 1}">
		
		<div class="box">
			<a href="${pageContext.request.contextPath}/product/productList">
			<div class="logo"></div>
			<strong style="font-weight: 600;">메뉴 관리</strong>
			<span>바로가기</span>
			</a>
		</div>	
		<div class="box">
			<a href="${pageContext.request.contextPath}/payment/orderList">
			<div class="logo"></div>
			<strong style="font-weight: 600;">주문 현황 관리</strong>
			<span>바로가기</span>
			</a>
		</div>	
		</c:if>
		
		<c:if test="${member.level eq 2}">
		<div class="box">
			<a href="${pageContext.request.contextPath}/sales/chart">
			<div class="logo"></div>
			<strong style="font-weight: 600;">지점매출 관리</strong>
			<span>바로가기</span>
			</a>
		</div>
		<div class="box">
			<a href="${pageContext.request.contextPath}/product/productList">
			<div class="logo"></div>
			<strong style="font-weight: 600;">메뉴, 매장 관리</strong>
			<span>바로가기</span>
			</a>
		</div>	
		<div class="box">
			<a href="${pageContext.request.contextPath}/payment/orderList">
			<div class="logo"></div>
			<strong style="font-weight: 600;">주문 현황 관리</strong>
			<span>바로가기</span>
			</a>
		</div>
		</c:if>
		
		</div>
	</div>
</div>
</div>

<!-- header start -->
<c:import url="../jsp/footer.jsp"></c:import>
<!-- header end -->
</div>
</body>
</html>