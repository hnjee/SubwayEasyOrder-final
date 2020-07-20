<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>

<link rel="stylesheet" type="text/css" href="../css/headerStyle.css">
<link rel="stylesheet" type="text/css" href="../css/paymentOngoingStyle.css">
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
					<h2 class="page-title">결제하기</h2>
				</div>
				
				<article class="cart-area pay">
					<!-- 주소 -->
					<div class="step-wrap">
						<div class="title-wrap">
                                <h3 class="title-type"><strong>포장주문</strong></h3>
                        </div>
                        
						<div class="deli-info">
							<div class="address">
								${store.name} (${store.telNumber})
							</div>
                            <p class="sub-address">[도로명] ${store.address}</p>
                            
                         </div> 
					</div>
					<!-- //주소 -->
					
					<!-- 주문 내역 -->
					<div class="step-wrap">
						<div class="title-wrap">
						<h3 class="title-type">
							<strong>주문내역</strong>
						</h3>
						
						</div>
						<div class="cart-list">
							<!-- 각 항목의 개수를 분리시키기 위해 status 사용 -->
							
							<ul style="margin-top: 25px; padding-left: 0px;">

								<li class="category">								
									<div>상품정보</div>
									<div>추가토핑</div>
									<div>수량</div>
									<div>금액</div>
								
								</li>
								<c:forEach items="${list}" var="vo" varStatus="status">
								<c:if test="${vo.productPrice gt 0}">
								<li class="row" id="sold-out0">
											
									<div class="prd-info">
										
										<div class="prd-img">
											<img src="../images/menu/${vo.menuVO.menuCode}_${vo.menuNum}.jpg" alt="메뉴 사진">
										</div>
									<div class="prd-cont">
										<div class="subject">${vo.menuVO.name}</div>
										<input type="hidden" value="${vo.menuVO.name}" class="menuName">
										
										<!-- 세트 메뉴 -->
										<c:if test="${vo.setting ne null}">
											<div class="option"><strong>세트</strong></div>
											<div class="option" id ="${vo.productNum}"></div>
										</c:if>
										
									</div>
									</div>
											
									<div class="prd-option" style="width: 380px;">
									<ul style="list-style: none; padding-left: 0px;">
										<c:if test="${vo.customVOs ne null}">
										<input id="customPrice${status.index}" type="hidden" value="${vo.customPrice}">
										<c:forEach items="${vo.customVOs}" var="customs">
										<!-- 빵, 제외 야채, 추가토핑  구분 -->
										<c:if test="${customs.ingredientVO.ingreCode eq 'BR'}">
										<li>
											<span>${customs.ingredientVO.name}, ${customs.breadSize}cm
											<c:if test="${customs.breadToasting eq 1}">, 토스팅</c:if>
											<a class="close"> 
											<span class="hidden">삭제</span>
											</a></span>
										</li>
										</c:if>
										
										<c:if test="${customs.ingredientVO.ingreCode eq 'VG'}">
										<li>
											<span><strong>제외 야채 : </strong>${customs.ingredientVO.name}
											<a class="close"> 
											<span class="hidden">삭제</span>
											</a></span>
										</li>
										</c:if>
										
										<c:if test="${customs.ingredientVO.ingreCode eq 'CZ'}">
										<li>
											<span><strong>치즈 선택 :</strong> ${customs.ingredientVO.name}
											<a class="close"> 
											<span class="hidden">삭제</span>
											</a></span>
										</li>
										</c:if>
										
										<c:if test="${customs.ingredientVO.ingreCode eq 'SO'}">
										<li>
											<span><strong>소스 선택 :</strong> ${customs.ingredientVO.name}
											<a class="close"> 
											<span class="hidden">삭제</span>
											</a></span>
										</li>
										</c:if>
										
										<c:if test="${customs.ingredientVO.ingreCode eq 'AD'}">
										<li>
											<span><strong>추가 토핑 :</strong> ${customs.ingredientVO.name}
											<Strong> +${customs.ingredientVO.price} 원</Strong>
											<a class="close"> 
											<span class="hidden">삭제</span>
											</a></span>
										</li>
										</c:if>
										
										</c:forEach>
										</c:if>
									</ul>
									</div>
									
								
									<div class="center" style="width: 150px; margin: 40px auto;">
									<div class="input-group">
							          <p style="font-size: 15px;">${vo.productCount} 개</p>
							        </div>
									</div>
									
									
									<!-- 메뉴 당 최종 가격 표시 -->
									<div class="prd-total">
									<!-- 세트인경우, 세트에 추가 토핑 한 경우, 단품인 경우 -->
									<!-- js로 계산해서 메뉴 당  total 값을 넣어주기  -->
									
										<p>${vo.productCount*vo.productPrice} 원</p>						
									</div>

									
								</li>
								</c:if>
								</c:forEach>
	
							</ul>
							
							</div>
						</div>
						
						<!-- //주문 내역 -->
						<!-- 총 주문 금액 -->
						<div class="step-wrap total-wrap">
							
							<div class="total-price2 side">	
							<div class="side1">
							<div class="text-type" style="font-size: 16px;font-weight: 600;">
								${point} 
							</div>
							<div class="text-type" style="font-size: 16px;">
								 포인트 사용
							</div>
							</div>	
								<p>
									총 금액 
									<input type="text" style="border: none; width: 155px; text-align: right;font-weight: 600; font-size: 25px;padding-right: 7px;" readonly="readonly" id="totalPrice"> 원
								</p>
							</div>
						</div>
						<!-- //총 주문 금액 -->
						<!-- 주문하기 버튼 -->
						<form id="formOut">
						<c:forEach items="${list}" var="cartVO">	
							<input type="hidden" value="${cartVO.productNum}" name="productNum">
							<input type="hidden" id="paramPrice" name="totalPrice">
							<input type="hidden" id="paramPoint" value="${point}" name="point">
							
						</c:forEach>
						</form>	
						
						<div class="btn-wrap">
							<a href="../menu/menuList?storeNum=${member.storeNum}" class="btn-type btn-type-brd">
							메뉴 추가하기</a>
							<!-- <a href="" class="btn-type v3 btn-order">주문하기</a> -->
							<button type="button" id="buttonPay" class="btn-type v3 btn-order">결제하기</button>
						</div>
						<!-- //주문하기 버튼 -->
						<!-- //주문하기 버튼 -->
						<input type="hidden" id="menuNames">
						<input type="hidden" id="payStatus">
					</article>
			</div>
		</div>
	</section>
</div>
	
<!-- footer start -->
<c:import url="../jsp/footer.jsp"></c:import>
<!-- footer end -->


	<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.2.min.js" type="application/javascript"></script>
	<script type="text/javascript">


		var counts = [];
		var totalPrice =0;
		var productNum = [];
		<c:forEach items="${list}" var="cartList">
			var ${cartList.productNum} =""; 	
			counts.push("${cartList.productCount}");
			
			<c:if test="${cartList.setting ne null}">	
				<c:if test="${cartList.setting ne cartList.productNum}">
				${cartList.setting} = ${cartList.setting}+"${cartList.menuVO.name}";
				${cartList.setting} = ${cartList.setting} + ", ";
				</c:if>		
			</c:if>
			totalPrice = totalPrice + ${cartList.productPrice*cartList.productCount};
			
		</c:forEach>
	
		// 포인트 사용 시 값 
		totalPrice = totalPrice - ${point};
		$('#totalPrice').val(totalPrice);
		$('#paramPrice').val(totalPrice);
		
	
	
		<c:forEach items="${list}" var="setDetail">
		<c:if test="${setDetail.setting ne null || setDetail.setting eq setDetail.productNum}">
			${setDetail.productNum} = ${setDetail.productNum}.substr(0, ${setDetail.productNum}.length-2);
			$("#"+"${setDetail.productNum}").text(${setDetail.productNum});
		</c:if>
		</c:forEach>

		/*
		<c:forEach items="${list}" var="cartVO">
			productNum.push(${cartVO.productNum});
		</c:forEach>
		*/
		
	
		/*
		var payPrice = $('#totalPrice').val();
		var menuNames = "";
		
		<c:forEach items="${list}" var="cart2" varStatus="stat">	
			<c:if test="${stat.index eq 0}">
				menuNames = menuNames+"${cart2.menuVO.name}";
			</c:if>		
			<c:if test="${stat.index gt 0}">
				menuNames =menuNames + ", ";
				menuNames =	menuNames+"${cart2.menuVO.name}";
			</c:if>
		</c:forEach>
		*/

		$('#buttonPay').click(function(){
			BootPay.request({
				price: totalPrice, //실제 결제되는 가격
				application_id: "5ef3ffe48f07510027eed6d3",
				name: '써브웨이 코리아(주)', //결제창에서 보여질 이름
				pg: '',
				method: '', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
				show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
				items: [
					{
						item_name: '나는 아이템', //상품명
						qty: 1, //수량
						unique: '123', //해당 상품을 구분짓는 primary key
						price: 5000, //상품 단가
						cat1: 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
						cat2: '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
						cat3: '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
					}
				],
				user_info: {
					username: '사용자 이름',
					email: '사용자 이메일',
					addr: '사용자 주소',
					phone: '010-1234-4567'
				},
				order_id: '고유order_id_1231', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
				params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
				account_expire_at: '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
				extra: {
				    start_at: '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
					end_at: '2022-05-10', // 정기결제 만료일 -  기간 없음 - 무제한
			        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
			        quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
				}
			})
			
			.error(function (data) {
				//결제 진행시 에러가 발생하면 수행됩니다.
				console.log(data);
				console.log('에러 발생');
				var form = document.getElementById('formOut');
				form.setAttribute('method', 'post');
				form.setAttribute('action', "./paymentFail");
				form.submit();
				
			})
			
			.cancel(function (data) {
				//결제가 취소되면 수행됩니다.
				console.log(data);
				console.log('결제 취소');
				var form = document.getElementById('formOut');
				form.setAttribute('method', 'post');
				form.setAttribute('action', "./paymentFail");
				form.submit();
			})
			
			
			.ready(function (data) {
				// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
				console.log(data);
			})
			
			.confirm(function (data) {
				//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
				//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
				console.log(data);
				var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
				if (enable) {
					BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
				} else {
					BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
				}
			})
			
			.close(function (data) {
			    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
			    console.log(data);
			   	console.log("닫기");
			   	
			})
			
			.done(function (data) {
				//결제가 정상적으로 완료되면 수행됩니다
				//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.				
				console.log(data);
				console.log("성공");
				
				var form = document.getElementById('formOut');
				form.setAttribute('method', 'post');
				form.setAttribute('action', "./paymentSuccess");
				form.submit();
			});
	
			});
	</script>


</body>
</html>