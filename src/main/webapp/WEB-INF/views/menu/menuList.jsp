<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<link rel="stylesheet" type="text/css"  href="../css/headerStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/menuListStyle.css">
<link rel="stylesheet" type="text/css"  href="../css/footerStyle.css">

</head>
<body>
<!-- header start -->
<c:import url="../jsp/header.jsp"></c:import>
<!-- header end -->


<div id="menuList_content">
	<div id="top"> 
		<div id="cate1">
		<ul id="myCate">
			<li>
				<a href="menuList?menuCode=SW" id="SW">샌드위치</a>
			</li>
			<li>
				<a href="menuList?menuCode=WR" id="WR">랩</a>
			</li>
			<li>
				<a href="menuList?menuCode=SA" id="SA">샐러드</a>
			</li>
			<li style="margin-right: 0;">
				<a href="menuList?menuCode=SI" id="SI">사이드</a>
			</li>
		</ul>
		</div>
	</div>
	
	<div class="menu_list_wrapper">
		<div id="wrapper">
			<div id="cate2">
				<ul>
					<c:if test="${fn:contains(menuCode, 'SW')}">
						<li><a href="menuList?menuCode=SW" id="SW0">All</a></li>
						<li><a href="menuList?menuCode=SW1" id="SW10" >클래식</a></li>
						<li><a href="menuList?menuCode=SW2" id="SW20">프레쉬&amp;라이트</a></li>
						<li><a href="menuList?menuCode=SW3" id="SW30">프리미엄</a></li>
						<li><a href="menuList?menuCode=SW4" id="SW40">아침메뉴</a></li>
						<script>
							$("#SW").addClass("active");
							var ct = "#"+"${menuCode}"+"0";
							$(ct).addClass("active");	
						</script>
					</c:if>
					
					<c:if test="${fn:contains(menuCode, 'WR')}">
						<li><a href="menuList?menuCode=WR" id="WR0">All</a></li>
						<li><a href="menuList?menuCode=WR1" id="WR10">시그니처 랩</a></li>
						<li><a href="menuList?menuCode=WR2" id="WR20">미니 랩</a></li>
						<script>
							$("#WR").addClass("active");
							var ct = "#"+"${menuCode}"+"0";
							$(ct).addClass("active");	
						</script>
					</c:if>
					
					<c:if test="${fn:contains(menuCode, 'SA')}">
						<li><a href="menuList?menuCode=SA" id="SA0">All</a></li>
						<li><a href="menuList?menuCode=SA1" id="SA10">클래식</a></li>
						<li><a href="menuList?menuCode=SA2" id="SA20">프레쉬&amp;라이트</a></li>
						<li><a href="menuList?menuCode=SA3" id="SA30">프리미엄</a></li>
						<script>
							$("#SA").addClass("active");
							var ct = "#"+"${menuCode}"+"0";
							$(ct).addClass("active");	
						</script>
					</c:if>
					
					<c:if test="${fn:contains(menuCode, 'SI')}">
						<li><a href="menuList?menuCode=SI" id="SI0">All</a></li>
						<li><a href="menuList?menuCode=SI1" id="SI10">음료</a></li>
						<li><a href="menuList?menuCode=SI2" id="SI20">쿠키&amp;칩</a></li>
						<li><a href="menuList?menuCode=SI3" id="SI30">수프</a></li>
						<li><a href="menuList?menuCode=SI4" id="SI40">사이드</a></li>
						<script>
							$("#SI").addClass("active");
							var ct = "#"+"${menuCode}"+"0";
							$(ct).addClass("active");	
						</script>
					</c:if>
				</ul>
			</div>
			
			<div id="menuList">
				<ul>
					<c:forEach items="${list}" var="vo" varStatus="i">
						<li style="z-index: 1;" id="menu${i.index}">
							<a href="./menuSelect?menuNum=${vo.menuNum}">
								<c:forEach items="${menuOut}" var="mo">
									<c:if test="${vo.menuNum eq mo}">
										<div class="layer1">
									
										</div>
										<div class="soldout1"> 
											  	<h1>SOLD OUT</h1>
										</div>
										<script type="text/javascript">
											//매진 클릭안되게
											var soldout = "#menu${i.index}";
											$(soldout).addClass("noclick");
										</script>
									</c:if>
								</c:forEach>
								<div class="layer2">
									<div class="img"><img src="../images/menu/${vo.menuCode}_${vo.menuNum}.jpg" alt="메뉴 사진" style="width: 270px; height: 189px;"></div>
									<strong class="tit">${vo.name}</strong>
									<span class="price">${vo.menuPrice}원</span>
								</div>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
	</div>
	
		
	</div>
</div>
<!-- footer start -->
<c:import url="../jsp/footer.jsp"></c:import>
<!-- footer end -->

</body>
</html>