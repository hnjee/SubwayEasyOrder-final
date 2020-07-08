<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>결제 완료</title>
<c:import url="../template/boot.jsp"></c:import>

<link rel="stylesheet" type="text/css" href="../css/headerStyle.css">
<link rel="stylesheet" type="text/css" href="../css/paymentSucStyle.css">
<link rel="stylesheet" type="text/css"  href="../css/footerStyle.css"> 
<style type="text/css">
	ul{
		list-style-type:none; 
	}

</style>
</head>
<body>

<!-- header start -->
<c:import url="../jsp/header.jsp"></c:import>
<!-- header end -->

<div class="container" style="padding-left: 0px;">
	<section id="content">
		<div class="sub-type cart" style="padding-bottom: 100px;">
			<div class="inner-box">
				<div class="page-title-wrap" style="position: relative; margin-top: 50px;">
					
				</div>
				
				<article class="cart-area pay">
					<div id="wrap-img" style="padding: 50px 50px 50px 50px; background-position:right;opacity:0.7; background-repeat:no-repeat; background-image: url('../images/sub_character.png');">
					
					<!-- 안내 -->
					<div class="step-wrap" style="font-size: 30px; font-weight: 200;line-height: 35px;">
						<strong style="font-weight: 800;font-size: 33px;">${store.name}</strong> 으로 <br>
						주문이 완료되었습니다. 
					
					</div>
					<!-- //주소 -->
					
					<!-- 설명 -->
					<div class="step-wrap" style="margin-top:30px;margin-bottom:160px; font-size: 19px; font-weight: 400; line-height: 28px;">
						주문 즉시 메뉴 준비가 시작됩니다.<br>
						완성 후, 빠르게 픽업해 주세요. 
					
					</div>
					<!-- //설명 -->
					
					<!-- 설명 -->
					<div class="step-wrap" style="font-size: 15px; font-weight: 300; line-height: 30px;">
						주문을 취소할 경우, 해당 매장으로 전화하여 취소해 주시기 바라며, <br>
						접수 완료후에는 취소가 되지 않으니 양해해 주시기 바랍니다.<br>
						주문 내역은 나의 정보 > 주문 조회 에서 조회가 가능합니다.
						 
					
					</div>
					<!-- //설명 -->
				
					</div>	
						<!-- 주문하기 버튼 -->
								
						<div class="btn-wrap">
						
							<a href="${pageContext.request.contextPath}/menu/menuList" class="btn-type btn-type-brd">
							새로운 주문</a>
							<!-- <a href="" class="btn-type v3 btn-order">주문하기</a> -->
							<a href="/" class="btn-type v3 btn-order">홈 으로</a>
						</div>
					</article>
			</div>
		</div>
	</section>
</div>

<!-- footer start -->
<c:import url="../jsp/footer.jsp"></c:import>
<!-- footer end -->


</body>
</html>