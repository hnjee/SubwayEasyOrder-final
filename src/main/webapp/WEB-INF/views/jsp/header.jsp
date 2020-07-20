<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div id="header">
    <div class="content">
	    <h1 class="logo">
	    	<a href="/">subway</a>
	    </h1>
	    <nav id="gnb">
	    	<ul>
                <li>
                    <a class="dp1" href="${pageContext.request.contextPath}/menu/showMenuList" >메뉴소개</a>
                    
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/cart/howToUse" class="dp1" >이용방법</a>
                    
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/store/storeList" class="dp1">온라인 주문</a>
                    
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/store/storeSearch" class="dp1" >매장찾기</a>
                    
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/franchise/franchiseRequest" class="dp1">가맹점</a>
                    
                </li>
            </ul>
	    </nav>
		<div class="util_menu">
		<c:if test="${member eq null }">
	        <ul>
	           <li><a href="${pageContext.request.contextPath}/member/memberLogin">로그인</a></li>
	           <li><a href="${pageContext.request.contextPath}/member/memberJoin">회원가입</a></li>
	           <li><a class="global_subway" href="${pageContext.request.contextPath}/cart/cartList">Go to Cart</a></li>
	           
	        </ul>
		</c:if>
		<c:if test="${member ne null }">
			<ul> 
				<li><a href="${pageContext.request.contextPath}/member/memberLogout">로그아웃</a></li>
	      		<li><a href="${pageContext.request.contextPath}/member/memberPage">마이페이지</a></li>
	      		<li><a href="${pageContext.request.contextPath}/cart/cartList" style="padding: 5px 10px; line-height: 0px;">
	     			 	<img src="../images/icon_cart.png" style="width:15px; height: 15px;">
	      		</a></li>
			</ul>
		</c:if>
    </div>
	</div>
</div>