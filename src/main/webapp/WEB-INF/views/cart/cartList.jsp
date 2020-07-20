<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<link rel="stylesheet" type="text/css" href="../css/cartListStyle.css">
<link rel="stylesheet" type="text/css" href="../css/headerStyle.css">
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
	<form action="../payment/paymentOngoing" method="post" id="formSubmit" name="testform">
	<section id="content">
		<div class="sub-type cart" style="padding-bottom: 100px;">
			<div class="inner-box">
				<div class="page-title-wrap" style="position: relative; margin-top: 50px;">
					<h2 class="page-title">장바구니</h2>
					<div class="depth-area">
						<ol>
							<li style="font-size: 25px; font-weight: 400;" id="home0"><a href="/">홈</a></li>
							<li><strong>장바구니</strong></li>
						</ol>
					</div>
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
                            <div class="btn-wrap">
                               <a href="../store/storeList?cases=1" class="btn-type4-brd">수정</a>
                            </div>
                         </div>
                   
                         
					</div>
					<!-- //주소 -->
					<!-- 주문 내역 -->
					<div class="step-wrap">
						<div class="title-wrap">
						<h3 class="title-type">
							<strong>주문내역</strong>
						</h3>
						<span class="summary side"> 
							<a href="./cartDeleteAll?id=">전체 삭제</a>
						</span>
						</div>
						<div class="cart-list">
							<!-- 각 항목의 개수를 분리시키기 위해 status 사용 -->
							
							<ul style="margin-top: 20px; padding-left: 0px;">

								<li class="category">								
									<div>상품정보</div>
									<div>추가토핑</div>
									<div>수량</div>
									<div>금액</div>
									<div></div>
								</li>
								<c:forEach items="${list}" var="vo" varStatus="status">
								<c:if test="${vo.productPrice eq 0}">
									<input type="hidden" name="setMenuNum" value="${vo.productNum}" class="purchase${vo.setting}"/>
								</c:if>		
								<c:if test="${vo.productPrice gt 0}">
								<li class="row" id="sold-out0">
											
									<div class="prd-info">
										<div id="check${status.index}" style="float: left;">
										<input type="checkbox" title="${vo.productNum}" id="box${vo.productNum}" class="box" style="margin-right: 7px;" checked="checked"/>
										<input type="hidden" name="productNum" value="${vo.productNum}" class="purchase${vo.productNum}"/>
										<input type="hidden" id="counts${status.index}" name="productCount" value="${vo.productCount}" class="purchase${vo.productNum}"/>
										</div>
										
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
											<c:if test="${customs.ingredientVO.ingreCode eq 'BR'}">
											<li>
												<span>${customs.ingredientVO.name}, ${customs.breadSize}cm
												<c:if test="${customs.breadToasting eq 1}">, 토스팅</c:if>
												<a class="close"> 
												<span class="hidden">삭제</span>
												</a></span>
											</li>
											</c:if>
											
											<!-- 30cm인 경우 -->
											<c:catch>
											<c:if test="${vo.customVOs[0].breadSize eq 30}">
												<div class="option">${vo.menuVO.menuPrice30+1900} 원</div>
												<input id="menuPrice${status.index}" type="hidden" value="${vo.menuVO.menuPrice30+1900}">
											</c:if>
											</c:catch>
											
											<!-- 15cm인 경우 -->
											<c:catch>
											<c:if test="${vo.customVOs[0].breadSize ne 30}">
												<div class="option">${vo.menuVO.menuPrice+1900} 원</div>
												<input id="menuPrice${status.index}" type="hidden" value="${vo.menuVO.menuPrice+1900}">
											</c:if>
											</c:catch>
											
											
											
										</c:if> 
										
										<!-- 세트 아님 -->
										<c:if test="${vo.setting eq null}">
											<!-- 30cm인 경우 -->
											<c:catch>
											<c:if test="${vo.customVOs[0].breadSize eq 30}">
												<div class="option">${vo.menuVO.menuPrice30} 원</div>
												<input id="menuPrice${status.index}" type="hidden" value="${vo.menuVO.menuPrice30}">
											</c:if>
											</c:catch>
											
											<c:catch>
											<c:if test="${vo.customVOs[0].breadSize ne 30}">
											<div class="option">${vo.menuVO.menuPrice} 원</div>
											<input id="menuPrice${status.index}" type="hidden" value="${vo.menuVO.menuPrice}">
											</c:if>
											</c:catch>
										</c:if>
										<!-- <div class="price">
												${vo.menuVO.menuPrice}
										</div>-->
									</div>
									</div>
											
									<div class="prd-option" style="width: 320px;">
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
											<Strong>+${customs.ingredientVO.price} 원</Strong>
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
							          <span class="input-group-btn">
							              <button type="button" id="menuSub${status.index}" class="btn btn-default btn-number" data-type="minus">
							                  <span class="glyphicon glyphicon-minus"></span>
							              </button>
							          </span>
							          <input type="text" id="menuCount${status.index}"class="form-control input-number" style="background-color: white;" readonly="readonly" value="${vo.productCount}">
							          <span class="input-group-btn">
							              <button type="button" id="menuAdd${status.index}" class="btn btn-default btn-number" data-type="plus">
							                  <span class="glyphicon glyphicon-plus"></span>
							              </button>
							          </span>
							        </div>
									</div>
									
									
									<!-- 메뉴 당 최종 가격 표시 -->
									<div class="prd-total">
									<!-- 세트인경우, 세트에 추가 토핑 한 경우, 단품인 경우 -->
									<!-- js로 계산해서 메뉴 당  total 값을 넣어주기  -->
									<c:if test="${vo.customVOs ne null}">	
										<input type="text" style="border: none; width: 80px; text-align: right;" id="menuTotalPrice${status.index}" readonly="readonly"> 원
										<input type="hidden" id="num${status.index}" value="${vo.productNum}">
										<input type="hidden" id="menuTotalPrice${vo.productNum}">
																
									</c:if>
									</div>
									
									
									<div class="prd-delete">
										<a href="./cartDelete?productNum=${vo.productNum}" class="btn-close">
											<span class="hidden">삭제</span>
										</a>
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
							<div class="text-type">
								* 포인트 입력 후 적용하고 할인 혜택을 받으세요!<br> * 포인트는 현금 처럼 사용가능합니다.<br> 
							</div>
							<div>
							 <table class="table table-striped" style="margin-top: 10px;width: 480px;">
							 <tr><th style="width: 200px;">잔여 포인트</th><th style="width: 200px;">사용 포인트</th><th style="width: 80px;"></th></tr>
							 <tr><td>${member.oriPoint} 포인트</td><td><input id="pointInput" name="point" type="text" value="0" style="width:100px; border: none;">포인트</td><td><button type="button" id="pointBtn">적용</button></td></tr>
							 
							 </table>
							</div>
							<div class="total-price2 side">
							
									
								<p>
									총 금액 
									<input type="text" style="border: none; width: 155px; text-align: right;font-weight: 600; font-size: 25px;padding-right: 7px;" readonly="readonly" id="totalPrice"> 원
								</p>
							</div>
						</div>
						<!-- //총 주문 금액 -->
						<!-- 주문하기 버튼 -->
								
						<div class="btn-wrap">
							<button type="submit" onclick="submitfunc(1)" class="btn-type btn-type-brd">
							메뉴 추가하기</button>
							<!-- <a href="" class="btn-type v3 btn-order">주문하기</a> -->
							<button type="submit" id="button1" onclick="submitfunc(2)" class="btn-type v3 btn-order">주문하기</button>
						</div>
						<!-- //주문하기 버튼 -->
						<input type="hidden" id="menuNames">
					
					</article>
			</div>
		</div>
	</section>
	</form>
</div>


<!-- footer start -->
<c:import url="../jsp/footer.jsp"></c:import>
<!-- footer end -->

<script type="text/javascript">
	var counts = [];
	var prices = [];
	
	<c:forEach items="${list}" var="cartList">
		var ${cartList.productNum} =""; 
		counts.push("${cartList.productCount}");
		<c:if test="${cartList.productPrice gt 0}">
			prices.push("${cartList.productPrice}");
		</c:if>
		<c:if test="${cartList.setting ne null}">	
			<c:if test="${cartList.setting ne cartList.productNum}">
			${cartList.setting} = ${cartList.setting}+"${cartList.menuVO.name}";
			${cartList.setting} = ${cartList.setting} + ", ";
			</c:if>
		</c:if>
	</c:forEach>
	var loopNum = counts.length;
	console.log(loopNum);
	
	<c:forEach items="${list}" var="setDetail">
	<c:if test="${setDetail.setting ne null || setDetail.setting eq setDetail.productNum}">
		${setDetail.productNum} = ${setDetail.productNum}.substr(0, ${setDetail.productNum}.length-2);
		$("#"+"${setDetail.productNum}").text(${setDetail.productNum});
	</c:if>
	</c:forEach>
	
	for(var i = 0; i<counts.length;i++){
		priceControl(i);
		quantControl(i);		
	}
	makeTotalPrice();
	
	// 메뉴 하나 당 총 가격
	function priceControl(num){
						// num은 0,1,2, ...
		
		// 메뉴 갯수 가져오기
		var menuCount = parseInt($('#menuCount'+num).val());
		// 세트 유무까지 합친 가격
		var menuPrice = parseInt($('#menuPrice'+num).val());
		// 커스텀 추가 가격
		var customPrice =  parseInt($('#customPrice'+num).val());
		
		var totalPrice = (menuPrice+customPrice)*menuCount;
		//console.log(totalPrice);
		$('#menuTotalPrice'+num).val(totalPrice);
		var productNum = indexToNum(num);
		$('#menuTotalPrice'+productNum).val(totalPrice);
	}

	
	//status.index -> productNum 
	function indexToNum(indexNum){
		var productNum = $('#num'+indexNum).val();
		return productNum;
	} 
	
	// count 갯수 컨트롤 기능
	// 독립적인 +, -를 위해 함수 생성
	function quantControl(num){
		var menuCount = parseInt($('#menuCount'+num).val());		
		if( $('#menuCount'+num).val()==1){
			$('#menuSub'+num).attr('disabled', true);
		} else{
			$('#menuSub'+num).attr('disabled',false);
		}
		if( $('#menuCount'+num).val()==10){
			$('#menuAdd'+num).attr('disabled', true);
		} else{
			$('#menuAdd'+num).attr('disabled',false);
		}
				
		//버튼 클릭 후 설정 
		$('#menuAdd'+num).click(function(){	
			menuCount = menuCount+1;
			$('#menuCount'+num).val(menuCount);
			$('#counts'+num).val(menuCount);
			priceControl(num);
			if( $('#menuCount'+num).val()>1){
				$('#menuSub'+num).attr('disabled', false);
			}
			
			if($('#menuCount'+num).val()==10){
				$('#menuAdd'+num).attr('disabled', true);
			} else{
				$('#menuAdd'+num).removeAttr('disabled');
			}
			
			makeTotalPrice();
		});
		$('#menuSub'+num).click(function(){
			
			menuCount = menuCount-1;
			$('#menuCount'+num).val(menuCount);
			$('#counts'+num).val(menuCount);
			priceControl(num);
			if( $('#menuCount'+num).val()<10){
				$('#menuAdd'+num).attr('disabled', false);
			}
			
			if( $('#menuCount'+num).val()==1){
				$('#menuSub'+num).attr('disabled', true);
			} else{
				$('#menuSub'+num).attr('disabled',false);
			}
			makeTotalPrice();
		});
	}
	
	//완전 총가격 초기 값 생성
	function makeTotalPrice(){
		var totalPrice =0;
		for(i=0; i<loopNum; i++){		
			var menuTotalPrice = 0;
			if(parseInt($('#menuTotalPrice'+i).val())){
				menuTotalPrice = parseInt($('#menuTotalPrice'+i).val());
			}
			
			// 해당 체크박스 해제 시 menuTotalPrice 0 원으로 
			
			if(!$('#box'+indexToNum(i)).prop('checked')){
				menuTotalPrice =0;
			}
			console.log('menuPrice'+i+': '+menuTotalPrice);
			totalPrice = totalPrice + menuTotalPrice;
		}
		$('#totalPrice').val(totalPrice);
	}

	
	// checkbox가 checked=false 경우에만 input disable 주기
	$('.box').click(function(){
		var index = $(this).attr('title'); 		// index는 productNum
		var totalPrice = parseInt($('#totalPrice').val());
		var curPrice = parseInt($('#menuTotalPrice'+index).val());
	
		console.log($('#menuTotalPrice'+index).val());
		console.log($('#box'+index).prop('checked'));
		
		if(!$(this).prop('checked')){
			//totalPrice = totalPrice - curPrice;
			//$('#totalPrice').val(totalPrice);
			makeTotalPrice();
			$('.purchase'+index).attr('disabled','disabled');
		}
		if($(this).prop('checked')){
			//totalPrice = totalPrice + curPrice;
			//$('#totalPrice').val(totalPrice);
			makeTotalPrice();
			$('.purchase'+index).removeAttr('disabled');
		}
	});

	
	$('#pointInput').blur(function(){
		var maxPoint = ${member.oriPoint};
		console.log(maxPoint);
		if($('#pointInput').val()>maxPoint){
			alert('포인트가 부족합니다.');
			$('#pointInput').val(0);
		}
	});
	
	
	// 포인트 적용
	$('#pointBtn').click(function(){
		makeTotalPrice();
		var totalPrice = $('#totalPrice').val();
		var point = $('#pointInput').val();
		totalPrice = totalPrice - point;
		$('#totalPrice').val(totalPrice);
		});

	
	// 카트가 비어있다면 다음페이지로 넘어가지 않게
	if(loopNum<1){
	$('#formSubmit').on("submit", function(event) {
       event.preventDefault();
       // process form
    });
	}
	
	// NaN to 0
	function getNum(val) {
		   if (isNaN(val)) {
		     return 0;
		   }
		   return val;
		}
	
	//literally, addComma
	function addComma(x) {
    	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	function submitfunc(index){
		if(index==1){
			document.testform.action = "../menu/menuList";
		}
		if(index==2){
			document.testform.action = "../payment/paymentOngoing";
		}
	}
	
	
	</script>

	
</body>
</html>