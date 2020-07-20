<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>SUBWAY EASY ORDER</title>
<c:import url="./template/boot.jsp"></c:import>
<link rel="stylesheet" type="text/css" href="./css/indexStyle.css">
<link rel="stylesheet" type="text/css"  href="./css/headerStyle.css"> 
<link rel="stylesheet" type="text/css"  href="./css/footerStyle.css"> 
</head>
<body>
<div id="wrap">

<!-- header start -->
<c:import url="./jsp/header.jsp"></c:import>
<!-- header end -->


<!-- main start -->
<div class="main_wrapper" id="container">
<div class="main_tap_event_wrapper">
	<div class="bx-wrapper" style="max-width: 100%;">
		<div class="bx-viewport" aria-live="polite" style="width: 100%; overflow: hidden; position: relative; height: 440px;">
			<ul style="width: 4215%; position: relative; transition-duration: 0.5s; transform: translate3d(-3806px, 0px, 0px);">
				<li style="float: left; list-style: none; position: relative; width: 1903px;" class="bx-clone" aria-hidden="true">
					<div class="wrap">
						<a href="#">
							<div class="img"><img alt="이탈리안 미니 랩" src="/upload/banner/main_PC_1920x440_20200528061058713.jpg"></div>
						</a>
					</div>
				</li>
				<li style="float: left; list-style: none; position: relative; width: 1903px;" aria-hidden="true">
					<div class="wrap">
							<a href="#">
								<div class="img"><img alt="유자 로티세리 치킨 윈도우" src="../images/00_써브웨이_Main_02_20200427112753722.jpg"></div>
							</a>
					</div>
				</li>
				<li aria-hidden="false" style="float: left; list-style: none; position: relative; width: 1903px;">
					<div class="wrap">
							<a href="#">
								<div class="img"><img alt="썹!프라이즈_5~6월 (햄콤보)" src="../images/main_PC_1920x440_20200427112254027.jpg"></div>
							</a>
					</div>
				</li>
				<li aria-hidden="true" style="float: left; list-style: none; position: relative; width: 1903px;">
					<div class="wrap">
							<a href="#">
								<div class="img"><img alt="써브웨이 리유저블 텀블러" src="../images/upload/banner/main_PC_1920x440_20200529050816305.jpg"></div>
							</a>
					</div>
				</li>
				<li style="float: left; list-style: none; position: relative; width: 1903px;" aria-hidden="true">
					<div class="wrap">
							<a href="#">
								<div class="img"><img alt="이탈리안 미니 랩" src="../images/main_PC_1920x440_20200528061058713.jpg"></div>
							</a>
					</div>
				</li>
				<li style="float: left; list-style: none; position: relative; width: 1903px;" class="bx-clone" aria-hidden="true">
						<div class="wrap">
								<a href="#">
									<div class="img"><img alt="유자 로티세리 치킨 윈도우" src="../images/00_써브웨이_Main_02_20200427112753722.jpg"></div>
								</a>
						</div>
				</li>
			</ul>
		</div>
		<div class="bx-controls bx-has-controls-direction bx-has-pager">
			<div class="bx-pager bx-default-pager">
				<div class="bx-pager-item"><a href="" data-slide-index="0" class="bx-pager-link">1</a></div>
				<div class="bx-pager-item"><a href="" data-slide-index="1" class="bx-pager-link active">2</a></div>
				<div class="bx-pager-item"><a href="" data-slide-index="2" class="bx-pager-link">3</a></div>
				<div class="bx-pager-item"><a href="" data-slide-index="3" class="bx-pager-link">4</a></div>
			</div>
		</div>
	</div>
	
	<div class="quick_link">
		<div class="quick_link_content">
			<div class="store">
				<a href="store/storeList" style="padding-top: 27px;">
					<img src="../images/icon_map.png" style=" width: 24px; height: 30px; position: relative; top:-3px; margin-right:8px">
					<strong style="display: inline;">주문하기</strong>
				</a>
			</div>
			<div class="franchise">
				<a href="./cart/howToUse" style="padding-top: 27px;">
				<img src="../images/icon_franchise.png"  style=" width: 34px; height: 30px; position: relative; top:-3px; margin-right:8px">
				<strong style="display: inline;">이용방법</strong>
				
				</a>
			</div>
		</div>
	</div>
</div>

<div id="showMenu">
<div class="section_subway_menu">
	<div class="hd">
		<h2>Subway's Menu</h2>

		<div class="tab">
			<ul>
				<li class="active"><a href="">클래식</a></li>
				<li><a href="">프레쉬&amp;라이트</a></li>
				<li><a href="">프리미엄</a></li>
				<li><a href="">아침메뉴</a></li>
			</ul>
		</div>
	</div>
	
	<div class="subway_menu_slider_wrapper">
		<!-- 클래식 -->
		<div class="subway_menu_slider active" id="sandwich_cl" style="left:0">
			<div class="bx-wrapper" style="max-width: 1200px;"><div class="bx-viewport" aria-live="polite" style="width: 100%; overflow: hidden; position: relative; height: 320px;"><div style="width: 2215%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
				<ul aria-hidden="false" style="float: left; list-style: none; position: relative; width: 1200px;">
					<li style="margin: 0px 0px 0px 30px; width: 260px;">
						<a href="/sandwichView?param=cl06">
							<div class="wrap">
								<div class="img"><img alt="에그마요" src="../images/menu/SW1_M01.jpg"></div>
								<strong class="title">에그마요</strong>
								<p>친환경 인증 받은 농장에서 생산된 달걀과<br>고소한 마요네즈가 만나 더 부드러운<br>스테디셀러</p><!-- 20180207 -->
							</div>
						</a>
					</li>
					<li style="margin: 0px 0px 0px 30px; width: 260px;">
						<a href="/sandwichView?param=cl01">
							<div class="wrap">
								<div class="img"><img alt="이탈리안 비엠티" src="../images/menu/SW1_M02.jpg"></div>
								<strong class="title">이탈리안 비엠티</strong>
								<p>7시간 숙성된 페퍼로니, 살라미<br>그리고 햄이 만들어내는 최상의 조화!<br>전세계가 사랑하는 No.1 베스트셀러!<br>Biggest Meatiest Tastiest, It's B.M.T.!</p><!-- 20180207 -->
							</div>
						</a>
					</li>
					<li style="margin: 0px 0px 0px 30px; width: 260px;">
						<a href="/sandwichView?param=cl02">
							<div class="wrap">
								<div class="img"><img alt="비엘티" src="../images/menu/SW1_M03.jpg"></div>
								<strong class="title">비엘티</strong>
								<p>오리지널 아메리칸 베이컨의<br>풍미와 바삭함 그대로~</p><!-- 20180207 -->
							</div>
						</a>
					</li>
					<li style="margin: 0px 0px 0px 30px; width: 260px;">
						<a href="/sandwichView?param=cl03">
							<div class="wrap">
								<div class="img"><img alt="미트볼" src="../images/menu/SW1_M04.jpg"></div>
								<strong class="title">미트볼</strong>
								<p>이탈리안 스타일 비프 미트볼에<br>써브웨이만의 풍부한 토마토 향이 살아있는<br>마리나라소스를 듬뿍</p><!-- 20180207 -->
							</div>
						</a>
					</li>
				</ul>
				<ul aria-hidden="true" style="float: left; list-style: none; position: relative; width: 1200px;">
					<li>
						<a href="/sandwichView?param=cl04">
							<div class="wrap">
								<div class="img"><img alt="햄" src="../images/menu/sandwich_cl04.jpg"></div>
								<strong class="title">햄</strong>
								<p>기본 중에 기본!<br>풍부한 햄이 만들어내는<br>입 안 가득 넘치는 맛의 향연</p><!-- 20180207 -->
							</div>
						</a>
					</li>
					<li>
						<a href="/sandwichView?param=cl05">
							<div class="wrap">
								<div class="img"><img alt="참치" src="../images/menu/sandwich_cl05.jpg"></div>
								<strong class="title">참치</strong>
								<p>남녀노소 누구나 좋아하는<br>담백한 참치와 고소한 마요네즈의<br>완벽한 조화</p><!-- 20180207 -->
							</div>
						</a>
					</li>
				</ul>
			</div></div><div class="bx-controls bx-has-controls-direction"><div class="bx-controls-direction"><a class="bx-prev" href="">Prev</a><a class="bx-next" href="">Next</a></div></div></div>
		</div>
		<!--// 클래식 -->
		<!-- 프레쉬&amp;라이트 -->
		<div class="subway_menu_slider" id="sandwich_fl">
			<div class="bx-wrapper" style="max-width: 1200px;"><div class="bx-viewport" aria-live="polite" style="width: 100%; overflow: hidden; position: relative; height: 320px;"><div style="width: 2215%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
				<ul aria-hidden="false" style="float: left; list-style: none; position: relative; width: 1200px;">
					<li>
						<a href="/sandwichView?param=fl01">
							<div class="wrap">
								<div class="img"><img alt="로티세리 바비큐 치킨" src="../images/menu/sandwich_fl01.jpg"></div>
								<strong class="title">로티세리 바비큐 치킨</strong>
								<p>촉촉한 바비큐 치킨의 풍미가득.<br>손으로 찢어 더욱 부드러운 치킨의 혁명</p><!-- 20180207 -->
							</div>
						</a>
					</li>
					<li>
						<a href="/sandwichView?param=fl02">
							<div class="wrap">
								<div class="img"><img alt="로스트 치킨" src="../images/menu/sandwich_fl02.jpg"></div>
								<strong class="title">로스트 치킨</strong>
								<p>오븐에 구워 담백한 저칼로리<br>닭가슴살의 건강한 풍미</p><!-- 20180207 -->
							</div>
						</a>
					</li>
					<li>
						<a href="/sandwichView?param=fl04">
							<div class="wrap">
								<div class="img"><img alt="써브웨이 클럽" src="../images/menu/sandwich_fl04.jpg"></div>
								<strong class="title">써브웨이 클럽</strong>
								<p>명실공히 시그니처 써브!<br>터키, 비프, 포크 햄의 완벽한 앙상블</p><!-- 20180207 -->
							</div>
						</a>
					</li>
					<li>
						<a href="/sandwichView?param=fl05">
							<div class="wrap">
								<div class="img"><img alt="터키" src="../images/menu/sandwich_fl05.jpg"></div>
								<strong class="title">터키</strong>
								<p>280kcal로 슬림하게 즐기는<br>오리지날 터키 샌드위치</p><!-- 20180207 -->
							</div>
						</a>
					</li>
				</ul>
				<ul aria-hidden="true" style="float: left; list-style: none; position: relative; width: 1200px;">
					<li>
						<a href="/sandwichView?param=fl06">
							<div class="wrap">
								<div class="img"><img alt="베지" src="../images/menu/sandwich_fl06.jpg"></div>
								<strong class="title">베지</strong>
								<p>갓 구운 빵과 신선한 7가지 야채로<br>즐기는 깔끔한 한끼</p><!-- 20180207 -->
							</div>
						</a>
					</li>
				</ul>
			</div></div><div class="bx-controls bx-has-controls-direction"><div class="bx-controls-direction"><a class="bx-prev" href="">Prev</a><a class="bx-next" href="">Next</a></div></div></div>
		</div>
		<!--// 프레쉬&amp;라이트 -->
		<!-- 프리미엄 -->
		<div class="subway_menu_slider" id="sandwich_pm">
			<div class="bx-wrapper" style="max-width: 1200px;"><div class="bx-viewport" aria-live="polite" style="width: 100%; overflow: hidden; position: relative; height: 320px;"><div style="width: 2215%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
				<ul aria-hidden="false" style="float: left; list-style: none; position: relative; width: 1200px;">
					<li>
						<a href="/sandwichView?param=pm10">
							<div class="wrap">
								<div class="img"><img alt="쉬림프" src="../images/menu/sandwich_pm10.jpg"></div>
								<strong class="title">쉬림프</strong>
								<p> 탱글한 식감이 그대로 살아있는 통새우가<br>5마리 들어가 한 입 베어 먹을 때 마다<br>진짜 새우의 풍미가 가득</p>
							</div>
						</a>
					</li>
					<li>
						<a href="/sandwichView?param=pm08">
							<div class="wrap">
								<div class="img"><img alt="풀드포크" src="../images/menu/sandwich_pm08.jpg"></div>
								<strong class="title">풀드포크</strong>
								<p>7시간 저온 훈연한 미국 정통 스타일의<br>리얼 바비큐 풀드포크는 오직 써브웨이에서</p><!-- 20180207 -->
							</div>
						</a>
					</li>
					<li>
						<a href="/sandwichView?param=pm01">
							<div class="wrap">
								<div class="img"><img alt="스테이크&amp;치즈" src="../images/menu/sandwich_pm01.jpg"></div>
								<strong class="title">스테이크&amp;치즈</strong>
								<p>육즙이 쫙~<br>풍부한 비프 스테이크의 풍미가 입안 한가득</p><!-- 20180207 -->
							</div>
						</a>
					</li>
					<li>
						<a href="/sandwichView?param=pm02">
							<div class="wrap">
								<div class="img"><img alt="터키 베이컨 아보카도" src="../images/menu/sandwich_pm02.jpg"></div>
								<strong class="title">터키 베이컨 아보카도</strong>
								<p>담백한 터키와 바삭한 베이컨 환상조합에<br>부드러운 아보카도는 신의 한수</p><!-- 20180207 -->
							</div>
						</a>
					</li>
				</ul>
				<ul aria-hidden="true" style="float: left; list-style: none; position: relative; width: 1200px;">
					<li>
						<a href="/sandwichView?param=pm04">
							<div class="wrap">
								<div class="img"><img alt="써브웨이 멜트" src="../images/menu/sandwich_pm04.jpg"></div>
								<strong class="title">써브웨이 멜트</strong>
								<p>자신있게 추천하는 터키, 햄, 베이컨의<br>완벽한 맛의 밸런스</p><!-- 20180207 -->
							</div>
						</a>
					</li>
					<li>
						<a href="/sandwichView?param=pm06">
							<div class="wrap">
								<div class="img"><img alt="스파이시 이탈리안" src="../images/menu/sandwich_pm06.jpg"></div>
								<strong class="title">스파이시 이탈리안</strong>
								<p>살라미, 페퍼로니가 입안 한가득!<br>쏘 핫한 이탈리아의 맛</p><!-- 20180207 -->
							</div>
						</a>
					</li>
					<li>
						<a href="/sandwichView?param=pm07">
							<div class="wrap">
								<div class="img"><img alt="치킨 데리야끼" src="../images/menu/sandwich_pm07.jpg"></div>
								<strong class="title">치킨 데리야끼</strong>
								<p>담백한 치킨 스트립에 달콤짭쪼름한 써브웨이<br>특제 데리야끼 소스와의 환상적인 만남</p><!-- 20180207 -->
							</div>
						</a>
					</li>
				</ul>
			</div></div><div class="bx-controls bx-has-controls-direction"><div class="bx-controls-direction"><a class="bx-prev" href="">Prev</a><a class="bx-next" href="">Next</a></div></div></div>
		</div>
		<!--// 프리미엄 -->
		<!-- 아침메뉴 -->
		<div class="subway_menu_slider" id="sandwich_bf">
			<div class="bx-wrapper" style="max-width: 1200px;"><div class="bx-viewport" aria-live="polite" style="width: 100%; overflow: hidden; position: relative; height: 320px;"><div style="width: 1215%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
				<ul aria-hidden="false" style="float: left; list-style: none; position: relative; width: 1200px;">
					<li>
						<a href="/sandwichView?param=bf01">
							<div class="wrap">
								<div class="img"><img alt="블랙 포레스트햄 &amp; 에그, 치즈" src="../images/menu/sandwich_bf01.jpg"></div>
								<strong class="title">블랙 포레스트햄 &amp; 에그, 치즈</strong>
								<p>푹신한 오믈렛과 햄의 가장 클래식한 조화</p>
							</div>
						</a>
					</li>
					<li>
						<a href="/sandwichView?param=bf02">
							<div class="wrap">
								<div class="img"><img alt="웨스턴, 에그 &amp; 치즈" src="../images/menu/sandwich_bf02.jpg"></div>
								<strong class="title">웨스턴, 에그 &amp; 치즈</strong>
								<p>토마토, 피망, 양파 세가지 야채가 더해져<br>더욱 신선한 하루 시작</p><!-- 20180207 -->
							</div>
						</a>
					</li>
					<li>
						<a href="/sandwichView?param=bf03">
							<div class="wrap">
								<div class="img"><img alt="베이컨, 에그 &amp; 치즈" src="../images/menu/sandwich_bf03.jpg"></div>
								<strong class="title">베이컨, 에그 &amp; 치즈</strong>
								<p>오리지널 아메리칸 베이컨으로<br>더욱 풍성한 아침 식사</p><!-- 20180207 -->
							</div>
						</a>
					</li>
					<li>
						<a href="/sandwichView?param=bf04">
							<div class="wrap">
								<div class="img"><img alt="스테이크, 에그 &amp; 치즈" src="../images/menu/sandwich_bf04.jpg"></div>
								<strong class="title">스테이크, 에그 &amp; 치즈</strong>
								<p>육즙 가득 비프 스테이크로<br>든든한 아침 식사</p><!-- 20180207 -->
							</div>
						</a>
					</li>
				</ul>
			</div></div><div class="bx-controls bx-has-controls-direction"><div class="bx-controls-direction"><a class="bx-prev disabled" href="">Prev</a><a class="bx-next disabled" href="">Next</a></div></div></div>
		</div>
		<!--// 아침메뉴 -->
	</div>
</div>
</div>
</div>
<!-- main end -->


<!-- footer start -->
<c:import url="./jsp/footer.jsp"></c:import>
<!-- footer end -->

</div>
</body>
</html>