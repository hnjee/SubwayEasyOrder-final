<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �Ϸ�</title>
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
					
					<!-- �ȳ� -->
					<div class="step-wrap" style="font-size: 30px; font-weight: 200;line-height: 35px;">
						<strong style="font-weight: 800;font-size: 33px;">${store.name}</strong> ���� <br>
						�ֹ��� �Ϸ�Ǿ����ϴ�. 
					
					</div>
					<!-- //�ּ� -->
					
					<!-- ���� -->
					<div class="step-wrap" style="margin-top:30px;margin-bottom:160px; font-size: 19px; font-weight: 400; line-height: 28px;">
						�ֹ� ��� �޴� �غ� ���۵˴ϴ�.<br>
						�ϼ� ��, ������ �Ⱦ��� �ּ���. 
					
					</div>
					<!-- //���� -->
					
					<!-- ���� -->
					<div class="step-wrap" style="font-size: 15px; font-weight: 300; line-height: 30px;">
						�ֹ��� ����� ���, �ش� �������� ��ȭ�Ͽ� ����� �ֽñ� �ٶ��, <br>
						���� �Ϸ��Ŀ��� ��Ұ� ���� ������ ������ �ֽñ� �ٶ��ϴ�.<br>
						�ֹ� ������ ���� ���� > �ֹ� ��ȸ ���� ��ȸ�� �����մϴ�.
						 
					
					</div>
					<!-- //���� -->
				
					</div>	
						<!-- �ֹ��ϱ� ��ư -->
								
						<div class="btn-wrap">
						
							<a href="${pageContext.request.contextPath}/menu/menuList" class="btn-type btn-type-brd">
							���ο� �ֹ�</a>
							<!-- <a href="" class="btn-type v3 btn-order">�ֹ��ϱ�</a> -->
							<a href="/" class="btn-type v3 btn-order">Ȩ ����</a>
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