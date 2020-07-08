<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="header">
    <div class="content">
	    <h1 class="logo">
	    	<a href="./adminIndex">subway</a>
	    </h1>
	    <nav id="gnb">
	    <!-- 
	    	<ul>
                <li>
                    <a class="dp1" href="#none" data-toggle="collapse" data-target=".dp2">메뉴소개</a>
                    <div class="dp2 collapse">
                        <ul>
                            <li><a href="/sandwichList">샌드위치</a></li>
                            <li><a href="/wrapList">랩</a></li>
                            <li><a href="/saladList">찹샐러드</a></li>
                            <li><a href="/sideDrink">스마일 썹</a></li>
                            <li><a href="/catering">단체메뉴</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#none" class="dp1" data-toggle="collapse" data-target=".dp2">이용방법</a>
                    <div class="dp2 collapse">
                        <ul>
                            <li><a href="/utilizationSubway">써브웨이 이용방법</a></li>
                            <li><a href="/utilizationGroupMenu">단체메뉴 이용방법</a></li>
                            <li><a href="/freshInfo">신선한 재료 소개</a></li>
							<li style="display:none;"><a href="#">App 주문서비스</a></li> 
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#none" class="dp1" data-toggle="collapse" data-target=".dp2">새소식</a>
                    <div class="dp2 collapse">
                        <ul>
                            <li><a href="/eventList">이벤트ㆍ프로모션</a></li>
                            <li><a href="/newsList">뉴스ㆍ공지사항</a></li>
                            <li><a href="/tvCommercial">광고영상</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#none" class="dp1" data-toggle="collapse" data-target=".dp2">써브웨이</a>
                    <div class="dp2 collapse">
                        <ul>
                            <li><a href="/subwayHistory">써브웨이 역사</a></li>
                            <li><a href="/subwayPromise">써브웨이 약속</a></li>
                            <li style="display:none;"><a href="#">써브웨이 사회공헌</a></li>
                            <li><a href="/subwaySandwichArtist">샌드위치 아티스트 지원</a></li>
                            <li><a href="/storeSearch">매장찾기</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#none" class="dp1" data-toggle="collapse" data-target=".dp2">가맹점</a>
                    <div class="dp2 collapse" style="opacity: 0; top: -20px;">
                        <ul>
                            <li><a href="/franchise">써브웨이 프랜차이즈</a></li>
                            <li><a href="/franchiseFaq">가맹관련 FAQ</a></li>
                            <li><a href="/franchiseInquiry">가맹신청ㆍ문의</a></li>
                            <li><a href="/franchiseBranchGuide">지사안내</a></li>
                            <li><a href="/franchiseInformation">사업설명회</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
             -->
	    </nav>
		<div class="util_menu">
		<c:if test="${member eq null }">
	        <ul>
	           <li><a href="${pageContext.request.contextPath}/member/memberLogin">로그인</a></li>
	           
	           
	           
	        </ul>
		</c:if>
		<c:if test="${member ne null }">
			<ul>
				<li><a href="${pageContext.request.contextPath}/member/adminLogout">로그아웃</a></li>
	      		<li><a href="/">게스트모드</a></li>
	      		<!-- <li><a class="global_subway" href="${pageContext.request.contextPath}/cart/cartList">Go to Cart</a></li> -->
			</ul>
		</c:if>
    </div>
	</div>
</div>