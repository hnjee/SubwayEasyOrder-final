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
					<h2 class="page-title">�����ϱ�</h2>
				</div>
				
				<article class="cart-area pay">
					<!-- �ּ� -->
					<div class="step-wrap">
						<div class="title-wrap">
                                <h3 class="title-type"><strong>�����ֹ�</strong></h3>
                        </div>
                        
						<div class="deli-info">
							<div class="address">
								${store.name} (${store.telNumber})
							</div>
                            <p class="sub-address">[���θ�] ${store.address}</p>
                            
                         </div> 
					</div>
					<!-- //�ּ� -->
					
					<!-- �ֹ� ���� -->
					<div class="step-wrap">
						<div class="title-wrap">
						<h3 class="title-type">
							<strong>�ֹ�����</strong>
						</h3>
						
						</div>
						<div class="cart-list">
							<!-- �� �׸��� ������ �и���Ű�� ���� status ��� -->
							
							<ul style="margin-top: 25px; padding-left: 0px;">

								<li class="category">								
									<div>��ǰ����</div>
									<div>�߰�����</div>
									<div>����</div>
									<div>�ݾ�</div>
								
								</li>
								<c:forEach items="${list}" var="vo" varStatus="status">
								<c:if test="${vo.productPrice gt 0}">
								<li class="row" id="sold-out0">
											
									<div class="prd-info">
										
										<div class="prd-img">
											<img src="../images/menu/${vo.menuVO.menuCode}_${vo.menuNum}.jpg" alt="�޴� ����">
										</div>
									<div class="prd-cont">
										<div class="subject">${vo.menuVO.name}</div>
										<input type="hidden" value="${vo.menuVO.name}" class="menuName">
										
										<!-- ��Ʈ �޴� -->
										<c:if test="${vo.setting ne null}">
											<div class="option"><strong>��Ʈ</strong></div>
											<div class="option" id ="${vo.productNum}"></div>
										</c:if>
										
									</div>
									</div>
											
									<div class="prd-option" style="width: 380px;">
									<ul style="list-style: none; padding-left: 0px;">
										<c:if test="${vo.customVOs ne null}">
										<input id="customPrice${status.index}" type="hidden" value="${vo.customPrice}">
										<c:forEach items="${vo.customVOs}" var="customs">
										<!-- ��, ���� ��ä, �߰�����  ���� -->
										<c:if test="${customs.ingredientVO.ingreCode eq 'BR'}">
										<li>
											<span>${customs.ingredientVO.name}, ${customs.breadSize}cm
											<c:if test="${customs.breadToasting eq 1}">, �佺��</c:if>
											<a class="close"> 
											<span class="hidden">����</span>
											</a></span>
										</li>
										</c:if>
										
										<c:if test="${customs.ingredientVO.ingreCode eq 'VG'}">
										<li>
											<span><strong>���� ��ä : </strong>${customs.ingredientVO.name}
											<a class="close"> 
											<span class="hidden">����</span>
											</a></span>
										</li>
										</c:if>
										
										<c:if test="${customs.ingredientVO.ingreCode eq 'CZ'}">
										<li>
											<span><strong>ġ�� ���� :</strong> ${customs.ingredientVO.name}
											<a class="close"> 
											<span class="hidden">����</span>
											</a></span>
										</li>
										</c:if>
										
										<c:if test="${customs.ingredientVO.ingreCode eq 'SO'}">
										<li>
											<span><strong>�ҽ� ���� :</strong> ${customs.ingredientVO.name}
											<a class="close"> 
											<span class="hidden">����</span>
											</a></span>
										</li>
										</c:if>
										
										<c:if test="${customs.ingredientVO.ingreCode eq 'AD'}">
										<li>
											<span><strong>�߰� ���� :</strong> ${customs.ingredientVO.name}
											<Strong> +${customs.ingredientVO.price} ��</Strong>
											<a class="close"> 
											<span class="hidden">����</span>
											</a></span>
										</li>
										</c:if>
										
										</c:forEach>
										</c:if>
									</ul>
									</div>
									
								
									<div class="center" style="width: 150px; margin: 40px auto;">
									<div class="input-group">
							          <p style="font-size: 15px;">${vo.productCount} ��</p>
							        </div>
									</div>
									
									
									<!-- �޴� �� ���� ���� ǥ�� -->
									<div class="prd-total">
									<!-- ��Ʈ�ΰ��, ��Ʈ�� �߰� ���� �� ���, ��ǰ�� ��� -->
									<!-- js�� ����ؼ� �޴� ��  total ���� �־��ֱ�  -->
									
										<p>${vo.productCount*vo.productPrice} ��</p>						
									</div>

									
								</li>
								</c:if>
								</c:forEach>
	
							</ul>
							
							</div>
						</div>
						
						<!-- //�ֹ� ���� -->
						<!-- �� �ֹ� �ݾ� -->
						<div class="step-wrap total-wrap">
							
							<div class="total-price2 side">	
							<div class="side1">
							<div class="text-type" style="font-size: 16px;font-weight: 600;">
								${point} 
							</div>
							<div class="text-type" style="font-size: 16px;">
								 ����Ʈ ���
							</div>
							</div>	
								<p>
									�� �ݾ� 
									<input type="text" style="border: none; width: 155px; text-align: right;font-weight: 600; font-size: 25px;padding-right: 7px;" readonly="readonly" id="totalPrice"> ��
								</p>
							</div>
						</div>
						<!-- //�� �ֹ� �ݾ� -->
						<!-- �ֹ��ϱ� ��ư -->
						<form id="formOut">
						<c:forEach items="${list}" var="cartVO">	
							<input type="hidden" value="${cartVO.productNum}" name="productNum">
							<input type="hidden" id="paramPrice" name="totalPrice">
							<input type="hidden" id="paramPoint" value="${point}" name="point">
							
						</c:forEach>
						</form>	
						
						<div class="btn-wrap">
							<a href="../menu/menuList?storeNum=${member.storeNum}" class="btn-type btn-type-brd">
							�޴� �߰��ϱ�</a>
							<!-- <a href="" class="btn-type v3 btn-order">�ֹ��ϱ�</a> -->
							<button type="button" id="buttonPay" class="btn-type v3 btn-order">�����ϱ�</button>
						</div>
						<!-- //�ֹ��ϱ� ��ư -->
						<!-- //�ֹ��ϱ� ��ư -->
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
	
		// ����Ʈ ��� �� �� 
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
				price: totalPrice, //���� �����Ǵ� ����
				application_id: "5ef3ffe48f07510027eed6d3",
				name: '������ �ڸ���(��)', //����â���� ������ �̸�
				pg: '',
				method: '', //��������, �Է����� ������ �������� ���ú��� ȭ���� �����մϴ�.
				show_agree_window: 0, // ��Ʈ���� ���� ���� â ���̱� ����
				items: [
					{
						item_name: '���� ������', //��ǰ��
						qty: 1, //����
						unique: '123', //�ش� ��ǰ�� �������� primary key
						price: 5000, //��ǰ �ܰ�
						cat1: 'TOP', // ��ǥ ��ǰ�� ī�װ� ��, 50���� �̳�
						cat2: 'Ƽ����', // ��ǥ ��ǰ�� ī�װ� ��, 50���� �̳�
						cat3: '���� Ƽ', // ��ǥ��ǰ�� ī�װ� ��, 50���� �̳�
					}
				],
				user_info: {
					username: '����� �̸�',
					email: '����� �̸���',
					addr: '����� �ּ�',
					phone: '010-1234-4567'
				},
				order_id: '����order_id_1231', //���� �ֹ���ȣ��, �����Ͻ� ���� �����ּž� �մϴ�.
				params: {callback1: '�״�� �ݹ���� ���� 1', callback2: '�״�� �ݹ���� ���� 2', customvar1234: '������ �������'},
				account_expire_at: '2018-05-25', // ������� �ԱݱⰣ ���� ( yyyy-mm-dd �������� �Է����ּ���. ������¸� ����˴ϴ�. )
				extra: {
				    start_at: '2019-05-10', // ���� ���� ������ - �������� �������� ������ �� �� ���Ϸκ��� ������ ������ Billing key ����
					end_at: '2022-05-10', // ������� ������ -  �Ⱓ ���� - ������
			        vbank_result: 1, // ������� ���� ���, ������� ���â�� ����(1), ����(0), �̼����� ��(1)
			        quota: '0,2,3' // �����ݾ��� 5���� �̻�� �Һΰ��� �������� ������ �� ����, [0(�Ͻú�), 2����, 3����] ���, �̼����� 12�������� ���
				}
			})
			
			.error(function (data) {
				//���� ����� ������ �߻��ϸ� ����˴ϴ�.
				console.log(data);
				console.log('���� �߻�');
				var form = document.getElementById('formOut');
				form.setAttribute('method', 'post');
				form.setAttribute('action', "./paymentFail");
				form.submit();
				
			})
			
			.cancel(function (data) {
				//������ ��ҵǸ� ����˴ϴ�.
				console.log(data);
				console.log('���� ���');
				var form = document.getElementById('formOut');
				form.setAttribute('method', 'post');
				form.setAttribute('action', "./paymentFail");
				form.submit();
			})
			
			
			.ready(function (data) {
				// ������� �Ա� ���¹�ȣ�� �߱޵Ǹ� ȣ��Ǵ� �Լ��Դϴ�.
				console.log(data);
			})
			
			.confirm(function (data) {
				//������ ����Ǳ� ���� ����Ǹ�, �ַ� ��� Ȯ���ϴ� ������ ���ϴ�.
				//���� - ī�� ��������� ��� �� �κ��� ������� �ʽ��ϴ�.
				console.log(data);
				var enable = true; // ��� ���� ���� ���� Ȥ�� �ٸ� ó��
				if (enable) {
					BootPay.transactionConfirm(data); // ������ ������ ���� ó���� �Ѵ�.
				} else {
					BootPay.removePaymentWindow(); // ������ ���� ������ ���� â�� �ݰ� ������ �������� �ʴ´�.
				}
			})
			
			.close(function (data) {
			    // ����â�� ������ ����˴ϴ�. (����,����,��ҿ� ������� ��� �����)
			    console.log(data);
			   	console.log("�ݱ�");
			   	
			})
			
			.done(function (data) {
				//������ ���������� �Ϸ�Ǹ� ����˴ϴ�
				//����Ͻ� ������ �����ϱ� ���� ���� ��ȿ�� ������ �Ͻñ� ��õ�մϴ�.				
				console.log(data);
				console.log("����");
				
				var form = document.getElementById('formOut');
				form.setAttribute('method', 'post');
				form.setAttribute('action', "./paymentSuccess");
				form.submit();
			});
	
			});
	</script>


</body>
</html>