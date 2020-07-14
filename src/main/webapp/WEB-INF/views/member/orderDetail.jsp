<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<link rel="stylesheet" type="text/css"  href="../css/headerStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/menuSelectStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/footerStyle.css">
<style type="text/css">
#detail::-webkit-scrollbar{
	display: none;
}
</style>
</head>
<div id="detail" style="text-align: center; width: 100%; max-height: 500px; overflow: scroll;">
	<img src="../images/subway_logo.png" width="30%">
	<div style="font-weight: bold;" id="storeName2">asd</div>
	<hr style="background-color: green; height: 3px; margin: 5 auto;">
	<div style="text-align: left; ; vertical-align: middle;">
		<div style="font-weight: bold; text-align: center;">
			주문번호 : <span id="payNum"></span>
			<div id="payDate" style="color: gray; font-size: 14px;"></div>
		</div>
		<hr style="background-color: #ffe17f; height: 3px;">
		
		<c:forEach items="${select }" var="select" varStatus="i">
			<c:if test="${select.productPrice gt 0 }">
			
			<div class="row">
				<div class="col-sm-9">
					<div style="padding-left:10px;  font-size: 14px; font-weight: bold;">
						${select.name }(${select.codeDesc })
						<div>
							<span class="price">${select.productPrice }</span>
							${select.productCount }개
						</div> 
					</div>
					<div style="font-size: 12px; padding-left: 10px;">
						<c:if test="${select.setting eq null }">단품</c:if><c:if test="${select.setting ne null }">세트(+1,900원)</c:if>
					</div>
					<c:if test="${select.menuPrice30 ne 0 }">
						<div style="font-size: 12px; padding-left: 10px;">
							(기본 15cm: <span class="price">${select.menuPrice }</span>)
							
						</div>
					</c:if>
					<c:forEach items="${ingre[i.index]}" var="ingre">
						<div>
							<c:if test="${ingre.ingreCode eq 'BR'}">
							
								<div style="font-size: 12px; margin-top: 5px;">
									<i class='fas fa-plus-square' style='font-size:15px;color:#009223;padding-left: 10px;'></i>
									빵 : 
									${ingre.ingreName }
									${ingre.breadSize }cm
									<c:if test="${ingre.breadToasting eq 1 }">토스팅 O</c:if>
									<c:if test="${ingre.breadToasting eq 0 }">토스팅 X</c:if>
									<c:if test="${ingre.breadSize eq 30 }">
										<span style="font-weight: bold;">
											+<span class="price">${select.menuPrice30-select.menuPrice }</span>
										</span>
									</c:if>
									<c:if test="${ingre.breadSize eq 15 }">
										<span style="font-weight: bold;">
											+0원
										</span>
									</c:if>
								</div>
							</c:if>
							
							<c:if test="${ingre.ingreCode eq 'CZ'}">
							
								<div style="font-size: 12px; margin-top: 5px;">
									<i class='fas fa-plus-square' style='font-size:15px;color:#009223;padding-left: 10px;'></i>
									치즈 : 
									${ingre.ingreName }

								</div>
							</c:if>
							<c:if test="${ingre.ingreCode eq 'SO'}">
							
								<div style="font-size: 12px; margin-top: 5px;">
									<i class='fas fa-plus-square' style='font-size:15px;color:#009223;padding-left: 10px;'></i>
									소스 : 
									${ingre.ingreName }

								</div>
							</c:if>
							<c:if test="${ingre.ingreCode eq 'AD'}">
							
								<div style="font-size: 12px; margin-top: 5px;">
									<i class='fas fa-plus-square' style='font-size:15px;color:#009223;padding-left: 10px;'></i>
									추가 : 
									${ingre.ingreName }
									<span style="font-weight: bold;">
										+<span class="price">${ingre.ingrePrice}</span>
									</span>

								</div>
							</c:if>
							<c:if test="${ingre.ingreCode eq 'VG'}">
							
								<div style="font-size: 12px; margin-top: 5px;">
									<i class='fas fa-minus-square' style='font-size:15px;color:#f1a03c;padding-left: 10px;'></i>
									야채 : 
									${ingre.ingreName }

								</div>
							</c:if>
							
							
						
							
						</div>
					</c:forEach>
					
				</div>
				<div class="col-sm-3">
					<div class="row" >
						<span class="price">${select.productPrice*select.productCount }</span>
							<div style="font-size: 10px;">
								(<span class="price">${select.productPrice }</span>
								<span>${select.productCount }개</span>)
							</div>
					</div>
				</div>
				
			</div>
			
		
			<c:forEach items="${select2 }" var="sel">
				<c:if test="${sel.productPrice eq 0 and sel.setting eq select.setting}">
					<div style="font-size: 12px; margin-top: 5px;">
						<i class='fas fa-plus-square' style='font-size:15px;color:#009223;padding-left: 10px;'></i>
						세트 : 
						${sel.name }
						(${sel.codeDesc })
						<span style="font-weight: bold;">
							+<span>0원</span>
						</span>

					</div>
				</c:if>
			</c:forEach>
			<hr style="background-color: #ffe17f; height: 1px;">
			</c:if>
		</c:forEach>
		

	</div>
	<hr style="background-color: green; height: 3px; margin: 5 auto;">
	<div style="padding-bottom: 20px;">
		총 결제금액 : <span id="totalPrice"></span>
	</div>
	
</div>

<script type="text/javascript">



	$(".price").each(function(){
		var price = $(this).text();
		price = addComma(price);
		$(this).text(price);

	});
	var title=$(".glyphicon-hand-left").attr("title");
	title=title+"_storeName"
	var storeName = $("#"+title).text();
	$("#storeName2").text(storeName);
		
</script>
</html>

