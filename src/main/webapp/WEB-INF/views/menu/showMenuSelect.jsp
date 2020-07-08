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
<link rel="stylesheet" type="text/css"  href="../css/showMenuSelectStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/footerStyle.css">

</head>
<body>
<!-- header start -->
<c:import url="../jsp/header.jsp"></c:import>
<!-- header end -->

<!-- top start -->
<div id="top"> 
	<div id="cate1">
	<ul>
		<li>
			<a href="showMenuList?menuCode=SW" id="SW">샌드위치</a>
		</li>
		<li>
			<a href="showMenuList?menuCode=WR" id="WR">랩</a>
		</li>
		<li>
			<a href="showMenuList?menuCode=SA" id="SA">샐러드</a>
		</li>
		<li style="margin-right: 0; ">
			<a href="showMenuList?menuCode=SI" id="SI">사이드</a>
		</li>
	</ul>
	</div>
</div>
<script>
	var cd = "${menu.menuCode}";
	var co = cd.substring(0,2);
	$("#"+co).addClass("active");		
</script>
<!-- top end -->

<!-- content start -->
<div id="menuSelect_content">
<!-- menu_order start -->
<div id="menu_order">
	<!-- hd start (menu info) -->
	<div class="hd">   
		<div class="category"> <a class="active" href="#"> ${menu.codeDesc}</a></div>
		<h2 class="name">${menu.name}</h2>
        <span class="cal">${menu.menuPrice}원</span> 
        <div class="menu_img">
    		<img alt="${menu.name}" src="../images/menu/${menu.menuCode}_${menu.menuNum}.jpg">
    	</div>
    	<p class="summary" style="white-space:pre-line;">
    		${menu.desc}
    	</p>
    </div>
    <!-- hd end (menu info) -->
</div>
<!-- menu_order end -->

<!-- 세가지 원칙 -->
<div class="fresh3_wrapper">
<div>
	<div class="hd">
		<p>써브웨이만이 가지고 있는 세가지 원칙</p>
		<h3>
			<span>SUBWAY</span> 3 FRESH
		</h3>
	</div>
	<div class="content">
		<ol>
			<li style="margin-left:0">
				<div class="img">
					<img alt="매장에서 직접 구워낸 신선한 빵" src="../images/img_fresh3_01.jpg">
				</div>
				<div class="info">
					<span class="num">1</span> <strong>매장에서 직접 구워낸<br>신선한
						빵
					</strong>
					<p>
						매일 아침 각 매장에서 발효하고 직접 구워서<br>퀄러티 높은 신선한 빵을 제공합니다.
					</p>
				</div>
			</li>
			<li>
				<div class="img">
					<img alt="매일 배송되는 신선한 야채 제공" src="../images/img_fresh3_02.jpg">
				</div>
				<div class="info">
					<span class="num">2</span> <strong>매일 배송되는<br>신선한
						야채 제공
					</strong>
					<p>
						매장에서 직접 손질한 야채를<br>당일판매 원칙으로 제공하고 있습니다.
					</p>
				</div>
			</li>
			<li>
				<div class="img">
					<img alt="주문과 동시에 바로 만드는 신선함" src="../images/img_fresh3_03.jpg">
				</div>
				<div class="info">
					<span class="num">3</span> <strong>주문과 동시에<br>바로
						만드는 신선함
					</strong>
					<p>
						주문과 동시에 만들어지는 시스템으로<br>직접 눈으로 신선함을 확인하실 수 있습니다.
					</p>
				</div>
			</li>
		</ol>
	</div>
</div>
</div>
<!--// 세가지 원칙 -->

</div>
<!-- content end -->

<!-- footer start -->
<c:import url="../jsp/footer.jsp"></c:import>
<!-- footer end -->

  
</body>
</html>