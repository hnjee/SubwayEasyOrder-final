<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUBWAY 이용 방법</title>
<c:import url="../template/boot.jsp"></c:import>
<link rel="stylesheet" type="text/css" href="../css/howToUseStyle.css">
<link rel="stylesheet" type="text/css"  href="../css/headerStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/footerStyle.css">
<link href="../css/subway/ui.utilization.css" rel="stylesheet" type="text/css">
<link href="../css/subway/ui.common.css" rel="stylesheet" type="text/css">
<link href="../css/subway/aos.css" rel="stylesheet" type="text/css"> 
<script src="../js/subway/aos.js" type="text/javascript"></script>
<script src="../js/subway/ui.common.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>


</head>
<body>

<div id="wrap">
<!-- header start -->
<c:import url="../jsp/header.jsp"></c:import>
<!-- header end -->

<!-- main start -->
<div class="main_wrapper" id="container">

<div id="content">
				<h2 class="subTitle" style="padding: 25px 0 20px; font-size: 37px;">써브웨이 이용방법</h2>

				<!-- 써브웨이 이용방법 -->
				<div class="utilization_subway_wrapper">
					<div class="tab">
						<ul>
							<li class="active"><a href="#store_order">매장에서 주문하기</a></li>
							<li><a href="#order_tip">주문 TIP</a></li>
						</ul>
					</div>

					<!-- 매장에서 주문하기 s -->
					<div class="utilization_subway_content" id="store_order" style="display:block;">
						<div class="slider_wrapper">
							<div class="step_content">
								<ol>
									<li class="active"><div class="step">STEP<strong>1</strong></div></li>
									<li class=""><div class="step">STEP<strong>2</strong></div></li>
									<li class=""><div class="step">STEP<strong>3</strong></div></li>
									<li class=""><div class="step">STEP<strong>4</strong></div></li>
									<li><div class="step">STEP<strong>5</strong></div></li>
								</ol>
							</div>
							<div class="img_content">
								<ol>
									<!-- 20180202 -->
									<li class="active" style="left: 50%; margin-left: -585px;"><div class="img" style="width: 700px;"><img alt="메뉴 선택" src="../images/img_store_order01.png"></div></li>
									<li style="margin-left: -280px; left: 100%;"><div class="img" style="width: 560px;"><img alt="빵 선택 " src="../images/img_store_order02.png"></div></li>
									<li style="margin-left: 560px; left: 100%;"><div class="img" style="width: 560px;"><img alt="토핑 추가" src="../images/img_store_order03.png"></div></li>
									<li style="margin-left: 560px; left: 100%;"><div class="img" style="width: 560px;"><img alt="야채&amp;소스 선택" src="../images/img_store_order04.png"></div></li>
									<li style="margin-left: 560px;"><div class="img"><img alt="세트 선택" src="../images/img_store_order05.png"></div></li>
									<!--// 20180202 -->
								</ol>
							</div>
							<div class="info_content">
								<p class="step_num">STEP 1</p>
								<ol>
									<li class="active" style="opacity: 1; margin-top: 0px;">
										<strong>메뉴 선택</strong>
										<p class="txt1">메뉴를 고르세요.<br>샌드위치(15cm 또는 30cm)와<br>찹샐러드 중 선택 가능합니다.</p>
										<div class="btns_wrapper">
											
										</div>
									</li>
									<li class="active" style="">
										<strong>빵 선택 <span>(찹샐러드 선택 시 제외)</span></strong>
										<p class="txt1">매장에서 직접 구운 6가지 종류 중<br>고객님이 원하는 빵으로<br>추가비용 없이 선택 가능합니다.</p>
										<div class="btns_wrapper">
											
										</div>
									</li>
									<li class="" style="">
										<strong>추가토핑 선택</strong>
										<p class="txt1">나만의 메뉴를 더욱 풍성하게 즐기세요.</p>
										<div class="btns_wrapper">
											
										</div>
									</li>
									<li class="" style="">
										<strong>야채&amp;소스 선택</strong>
										<p class="txt1">나만의 스타일을 완성하는 단계!<br>원하지 않는 야채는 빼고 좋아하는 야채는 더하세요. <br>오늘의 기분에 맞는 소스를 선택해주세요. </p>
										<div class="btns_wrapper">
											
										</div>
									</li>
									<li>
										<strong>세트 선택</strong>
										<p class="txt1">세트로 구매하시면 할인혜택을 <br>받으실 수 있습니다. 쿠키, 스프세트와 함께 <br>더욱 든든하고 알차게 즐기세요.</p>
										<div class="btns_wrapper">
											
										</div>
									</li>
								</ol>
							</div>

							<div class="arr_controls">
								<a class="prev arr" href="#none" style="background-image: url('../images/icon_event_slider_arr.png');">prev</a>
								<a class="next arr" href="#none" style="background-image: url('../images/icon_event_slider_arr.png');">next</a>
							</div>
						</div>
					</div>
					<!--// 매장에서 주문하기 e -->

					<!-- 주문 TIP s -->
					<div class="utilization_subway_content" id="order_tip" style="display:none;">
						<div class="order_tip_wrapper">
							<!-- 스테이크&치즈 -->
							<div class="section01">
								<div class="visual">
									<div class="content">
										<p class="txt_q"><em>완벽한 한끼</em>를 원하신다면?</p>
										<strong>스테이크 &amp; 치즈</strong>
										<p>
											고급스러운 스테이크와 고소한 프리미엄 치즈의 콜라보<br>
											신선한 야채와 함께 푸짐하고 건강한 완벽한 한끼가 완성됩니다!<br>
											다양한 토핑을 추가해 나만의 한끼 메뉴를 즐겨보세요.
										</p>

										<div class="sandwich">
											<img alt="스테이크 &amp; 치즈" data-aos="fade-left" src="../images/utilization/img_sandwich01.png">
										</div>
									</div>
								</div>
								<div class="tip_intro">
									<div class="content">
										<strong>더 맛있게 즐기는 <span>TIP</span></strong>
										<ul>
											<li>
												<div class="img"><img alt="CHEESE" src="../images/utilization/img_cheese.jpg"></div>
												<em>CHEESE</em>
												<p>더블치즈로 치즈와 쇠고기의<br>완벽한 조화!</p>
											</li>
											<li>
												<div class="img"><img alt="SAUCE" src="../images/utilization/img_sauce01.jpg"></div>
												<em>SAUCE</em>
												<p>달콤하게 즐기고 싶다면 스윗어니언+마요네즈!<br>스테이크의 맛을 즐기고 싶다면 후추만 톡톡!</p>
											</li>
											<li class="bul02"><!-- 20180213 -->
												<div class="img"><img alt="VEGETABLE" src="../images/utilization/img_vegetable.jpg"></div>
												<em>VEGETABLE</em>
												<p>토마토, 오이를 빼면<br>고기의 풍미를 즐길 수 있습니다.</p>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<!--// 스테이크&치즈 -->
							<!-- 로스트치킨 -->
							<div class="section02">
								<div class="visual">
									<div class="content">
										<p class="txt_q"><em>다이어트</em>중이라면?</p>
										<strong>로스트치킨</strong>
										<p>
											퍽퍽한 닭가슴살은 이제 그만!<br>
											로스트 치킨 샐러드는 150kcal로 더 가볍게 즐길 수 있습니다.<br>
											저칼로리 샌드위치와 샐러드로 맛있고 즐겁게 다이어트하세요.
										</p>

										<div class="sandwich">
											<img alt="로스트치킨" data-aos="fade-left" src="../images/utilization/img_sandwich02.png">
										</div>
									</div>
								</div>
								<div class="tip_intro">
									<div class="content">
										<strong>더 맛있게 즐기는 <span>TIP</span></strong>
										<ul>
											<li>
												<div class="img"><img alt="SALAD" src="../images/utilization/img_salad.jpg"></div>
												<em>SALAD</em>
												<p>로스트치킨은 샐러드로 드셔도 좋습니다.<br>몸짱의 비결은 써브웨이로부터!</p>
											</li>
											<li>
												<div class="img"><img alt="SAUCE" src="../images/utilization/img_sauce02.jpg"></div>
												<em>SAUCE</em>
												<p>랜치드레싱으로 고소하게 즐겨보세요!</p>
											</li>
											<li class="bul02">
												<div class="img"><img alt="TOPPING" src="../images/utilization/img_topping.jpg"></div>
												<em>TOPPING</em>
												<p>올리브, 피클, 할라피뇨를 빼고 드시면,<br>담백한 닭가슴살의 육즙을<br>제대로 즐길 수 있습니다.</p>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<!--// 로스트치킨 -->
							<!-- 써브웨이 클럽 -->
							<div class="section03">
								<div class="visual">
									<div class="content">
										<p class="txt_q"><em>건강</em>을 생각한다면?</p>
										<strong>써브웨이 클럽</strong>
										<p>
											고기의 단백질과 야채의 비타민으로 영양UP!<br>
											절임류 야채를 제외해서 저염식으로, 올리브오일을 넣어 지방은 DOWN!<br>
											써브웨이 클럽으로 건강한 하루를 보내세요.
										</p>

										<div class="sandwich">
											<img alt="써브웨이 클럽" data-aos="fade-left" src="../images/utilization/img_sandwich03.png">
										</div>
									</div>
								</div>
								<div class="tip_intro">
									<div class="content">
										<strong>더 맛있게 즐기는 <span>TIP</span></strong>
										<ul>
											<li>
												<div class="img"><img alt="SAUCE" src="../images/utilization/img_sauce03.jpg"></div>
												<em>SAUCE</em>
												<p>올리브오일과 후추를 살짝 뿌리면,<br>짜지않고 담백한 행복한 맛을 느낄 수 있습니다.</p>
											</li>
											<li class="bul02">
												<div class="img"><img alt="CHEESE" src="../images/utilization/img_cheese.jpg"></div>
												<em>CHEESE</em>
												<p>치즈를 빼고 칠면조,쇠고기,돼지고기의<br>완벽한 조화를 느껴보세요!</p>
											</li>
											<li class="bul02">
												<div class="img"><img alt="TOPPING" src="../images/utilization/img_topping.jpg"></div>
												<em>TOPPING</em>
												<p>올리브, 피클, 할라피뇨를 빼고 드시면<br>야채들의 싱싱한 맛을 하나하나 느끼실 수<br>있습니다.</p>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<!--// 써브웨이 클럽 -->
						</div>
					</div>
					<!--// 주문 TIP e -->
				</div>
				<!--// 써브웨이 이용방법 -->
			</div>


</div>
<!-- main end -->

<!-- footer start -->
<c:import url="../jsp/footer.jsp"></c:import>
<!-- footer end -->

<script src="../js/subway/TweenMax.min.js" type="text/javascript"></script>
<script type="text/javascript">

subwayUtilization();
function subwayUtilization(){//써브웨이 이용방법
	var stepIndex = 0;
	var btnArr = $('#store_order .arr_controls .arr');
	var stepNum = $('#store_order .slider_wrapper .step_content ol li');
	var slider_img = $('#store_order .slider_wrapper .img_content ol li');
	var slider_info = $('#store_order .info_content ol li');
	var spd = 1;
	var eft = Power3.easeOut;

console.log("step 시작");
	
	store_order();//써브웨이 이용방법 : 매장에서 주문하기

	$('.utilization_subway_wrapper .tab ul li a').on('click', function(){//써브웨이 이용방법 : tab
		if($(this).parent('li').hasClass('active')){
			return false;
		}else{
			var tg = $(this).attr('href');
			$(this).parent('li').addClass('active').siblings('li').removeClass('active')
			$(tg).show().siblings('.utilization_subway_content').hide();

			if(tg == '#store_order'){
				stepIndex = 0;

				$('#store_order .step_num').text('STEP '+(stepIndex+1))
				$(stepNum).removeClass('prev active');
				$(stepNum).eq(stepIndex).addClass('active');
				$(slider_info).removeClass('active').attr('style','')
				$(slider_info).eq(stepIndex).addClass('active').css({'marginTop':'0','opacity':'1'})
				$(slider_img).attr('style','').removeClass('active');
				$(slider_img).find('.img').attr('style','');
				$(slider_img).eq(stepIndex).addClass('active').css({'left':'50%',marginLeft:'-585px'})

				TweenLite.to($(slider_img).eq(stepIndex).find('.img'),spd,{ease:eft,width:700})
				TweenLite.to($(slider_img).eq(stepIndex).next(),spd,{ease:eft,marginLeft:'-280'})
			}else{
				AOS.init({
					once:'data-aos-once',
					duration:600,
					easing: 'ease-out-ease',
					delay: 100,
				});
			}
			return false;
		}
	})


	function store_order(){//써브웨이 이용방법 : 매장에서 주문하기 20180131
		var prevIndex;

		$(slider_img).eq(stepIndex).css({'left':'50%',marginLeft:'-585px'})
		TweenLite.to($(slider_img).eq(stepIndex).find('.img'),spd,{ease:eft,width:700})
		TweenLite.to($(slider_img).eq(stepIndex).next(),spd,{ease:eft,marginLeft:'-280'})

		$(btnArr).on('click', function(){

			if(TweenMax.isTweening(slider_img)){
				return false;
			}else{
				prevIndex = stepIndex;
				if($(this).hasClass('prev')){
					if(stepIndex <= 0){
						return false;
					}else{
						stepIndex--;
						$(stepNum).eq(stepIndex).removeClass('prev').addClass('active')
						$(stepNum).eq(prevIndex).removeClass('active')

						TweenLite.to($(slider_img).eq(stepIndex).prev(),spd,{ease:eft,left:'0',marginLeft:'-280'})
						TweenLite.to($(slider_img).eq(prevIndex),spd,{ease:eft,left:'100%',marginLeft:'-280'})
						TweenLite.to($(slider_img).eq(prevIndex).find('.img'),spd,{ease:eft,width:560})
						TweenLite.to($(slider_img).eq(stepIndex),spd,{ease:eft,left:'50%',marginLeft:'-585'})
						TweenLite.to($(slider_img).eq(stepIndex).find('.img'),spd,{ease:eft,width:700})
						TweenLite.to($(slider_img).eq(prevIndex).next(),spd,{ease:eft,marginLeft:'560'})
					}
				}else{
					if(stepIndex >= 4){
						return false;
					}else{
						stepIndex++;
						$(stepNum).eq(stepIndex).addClass('active')
						$(stepNum).eq(prevIndex).removeClass('active').addClass('prev')

						TweenLite.to($(slider_img).eq(prevIndex).prev(),spd,{ease:eft,left:'-560',marginLeft:'-560'})
						TweenLite.to($(slider_img).eq(prevIndex),spd,{ease:eft,left:'0',marginLeft:'-280'})
						TweenLite.to($(slider_img).eq(prevIndex).find('.img'),spd,{ease:eft,width:560})
						TweenLite.to($(slider_img).eq(stepIndex),spd,{ease:eft,left:'50%',marginLeft:'-585'})
						TweenLite.to($(slider_img).eq(stepIndex).find('.img'),spd,{ease:eft,width:700})
						TweenLite.to($(slider_img).eq(stepIndex).next(),spd,{ease:eft,marginLeft:'-280'})
					}
				}

				$(slider_info).eq(prevIndex).removeClass('active').css('opacity','0')
				TweenLite.to($(slider_info).eq(stepIndex).addClass('active'),0.7,{ease:Power4.easeOut,marginTop:0,opacity:1,onComplete:function(){
					$(slider_info).eq(prevIndex).attr('style','')
				}});
				$('#store_order .step_num').text('STEP '+(stepIndex+1))
				return false;
			}
		})
	}
}


</script>
</div>
</body>
</html>