<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:import url="../template/boot.jsp"></c:import>
<link rel="stylesheet" type="text/css"  href="../css/headerStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/menuSelectStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/footerStyle.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/indexStyle.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style type="text/css">
.detail{
	border-radius: 30px;
	width: 80%;
	height: 100%;
	border: solid green 3px;
	box-shadow: 5px 10px #ffe17f;
	
	
	/* background-color:rgb(0,128,0,0.5); */
	
}
.orderAble{
	color:#999; 
	height:25px; 
	font-size:13px;
	font-weight:bold; 
	line-height:25px;
	text-align:center; 
	width:60%; 
	border: 1px solid #999; 
	border-radius: 12.5px;
	display: inline-block;
}
input{
	display: none;
}
.store_btn{
	cursor: pointer;
}
th{
 text-align: center;
}
td{
	text-align: center;
	font-weight: bold;
	color: #999;
	
}
</style>

</head>
<body>
	<c:import url="../jsp/header.jsp"></c:import>
	
	<div class="container" id="refresh" style="margin-top: 100px;">
		<div style="font-weight: bold; font-size: 30px;">나만의 메뉴</div>
		<hr style="background-color: green; height: 1px;">
		
		<c:forEach begin="0" end="1" varStatus="i">
			<div class="row" style="margin-bottom: 50px;">
				<c:forEach begin="1" end="3" varStatus="j">
					<div class="col-sm-4" style="margin-bottom: 100px;">
						<div class="detail" style="text-align: center;">
							<img src="../images/subway_logo.png" width="33%">
							<hr style="background-color: green; height: 3px; margin: 5 auto;">
							<div style="padding-bottom: 40px;" id="${j.index+i.index*3}" class="my_menu">
							
								<c:forEach items="${myMenu }" var="myMenu">
									<c:if test="${myMenu.index_num eq j.index+i.index*3}">
										<c:if test="${myMenu.menuNum eq null }">
											<i class='fas fa-plus-circle pop' style='font-size:100px;color:gray; opacity: 0.3;' title="${j.index+i.index*3}"></i>
											
										</c:if>
										<c:if test="${myMenu.menuNum ne null }">
											<div style="font-weight: bold;">
												${myMenu.name }
												<c:if test="${myMenu.setting eq 1 }">(세트)</c:if>
												<c:if test="${myMenu.setting eq 0 }">(단품)</c:if>
											</div>
											<input id="${myMenu.index_num}_menuNum" type="text" value="${myMenu.menuNum}">
											<hr style="background-color: #ffe17f; height: 3px;">
											<div style="text-align: left; padding-left: 10px;">
											<c:forEach items="${mmList }" var="mmList">
												<c:if test="${mmList.index_num eq j.index+i.index*3}">
													<c:if test="${mmList.ingreCode eq 'BR' }">
														<div style="font-weight: bold;">
														빵:${mmList.ingreName } ${myMenu.breadSize }cm 
														<c:if test="${myMenu.breadToasting eq 1 }">토스팅 O<input type="text" value="1" id="${myMenu.index_num}_toast"></c:if>
														<c:if test="${myMenu.breadToasting eq 0 }">토스팅 X<input type="text" value="0" id="${myMenu.index_num}_toast"></c:if>
														</div>
														<div style="font-size: 13px;">기본 15cm : (<span title="${myMenu.index_num}_ingrePrice" class="ingre_tag price ${myMenu.index_num}_ingrePrice">${myMenu.menuPrice }</span>)
															<c:if test="${myMenu.breadSize eq 30 }">
																<input type="text" value="30" id="${myMenu.index_num}_bSize">
																<span style="font-weight: bold;">
																	+<span class="price ${myMenu.index_num}_ingrePrice">${myMenu.menuPrice30-myMenu.menuPrice }</span>
																</span>
															</c:if>
															<c:if test="${myMenu.breadSize eq 15 }">
																<input type="text" value="15" id="${myMenu.index_num}_bSize">
																<span style="font-weight: bold;">
																	+0원
																</span>
															</c:if>
														</div>
														<c:if test="${myMenu.setting eq 1 }"><span style="font-size: 13px;">세트:(+1,900원)</span></span></c:if>
													</c:if>
													
													
													<c:if test="${mmList.ingreCode eq 'CZ' }">
														<div style="font-size: 12px; margin-top: 5px;">
															<i class='fas fa-plus-square' style='font-size:15px;color:#009223;padding-left: 10px;'></i>
															치즈 : 
															${mmList.ingreName }
														</div>
													</c:if>
													<c:if test="${mmList.ingreCode eq 'SO' }">
														<div style="font-size: 12px; margin-top: 5px;">
															<i class='fas fa-plus-square' style='font-size:15px;color:#009223;padding-left: 10px;'></i>
															소스 : 
															${mmList.ingreName }
														</div>
													</c:if>
													<c:if test="${mmList.ingreCode eq 'AD' }">
														<div style="font-size: 12px; margin-top: 5px;">
															<i class='fas fa-plus-square' style='font-size:15px;color:#009223;padding-left: 10px;'></i>
															추가 : 
															${mmList.ingreName }
															<span style="font-weight: bold;">
																+<span class="price ${myMenu.index_num}_ingrePrice">${mmList.ingrePrice}</span>
															</span>
														</div>
													</c:if>
													<c:if test="${mmList.ingreCode eq 'VG' }">
														<div style="font-size: 12px; margin-top: 5px;">
															<i class='fas fa-minus-square' style='font-size:15px;color:#f1a03c;padding-left: 10px;'></i>
															야채 : 
															${mmList.ingreName }
														</div>
													</c:if>
													
													
												</c:if>
											</c:forEach>
											<c:if test="${myMenu.setting eq 1 }">
												<c:forEach items="${setSide }" var="side">
													<c:if test="${side.menuNum eq myMenu.cookie }">
														<div style="font-size: 12px; margin-top: 5px;">
																	<i class='fas fa-plus-square' style='font-size:15px;color:#009223;padding-left: 10px;'></i>
																	세트 : ${side.name }(쿠키)<span style="font-weight: bold;">+0원</span>
																	
														</div>
														<input id="${myMenu.index_num }_cookie" type="text" value="${side.menuNum }">
													</c:if>
													<c:if test="${side.menuNum eq myMenu.drink }">
														<div style="font-size: 12px; margin-top: 5px;">
																	<i class='fas fa-plus-square' style='font-size:15px;color:#009223;padding-left: 10px;'></i>
																	세트 : ${side.name }(음료)<span style="font-weight: bold;">+0원</span>
																	
														</div>
														<input id="${myMenu.index_num }_drink" type="text" value="${side.menuNum }">
													</c:if>
												</c:forEach>
												<input id="${myMenu.index_num }_ingrePrice_set" value="1900">
												
												
											</c:if>
											<c:if test="${myMenu.setting eq 0 }">
												<input id="${myMenu.index_num }_drink" type="text" value="0">
												<input id="${myMenu.index_num }_cookie" type="text" value="0">
												<input id="${myMenu.index_num }_ingrePrice_set" value="0">
											</c:if>
											</div>
											<hr style="background-color: #ffe17f; height: 3px;">
											<div style="font-weight: bold;">메뉴 가격 : <span id="${myMenu.index_num}_ingrePrice"></span></div>
											<hr style="background-color: #ffe17f; height: 1px;">
											<div>
												<button class="btn order" name="${myMenu.menuNum }" title="${myMenu.id_index }" style="background-color: rgb(241, 160, 60);color: white">주문</button>
												<button class="btn update" id="${myMenu.index_num}" name="${myMenu.ingreNum }" title="${myMenu.id_index}" style="background-color: rgb(0, 146, 35);color: white">수정</button>
												<button class="btn delete" title="${myMenu.id_index }" style="background-color: red;color: white">삭제</button>
												
											</div>
											<div>
											</div>
							
											
										</c:if>
										
									</c:if>
								</c:forEach>
								
								
							</div>
						</div>
						
					</div>
				</c:forEach>
				
			</div>
		</c:forEach>

		
	</div>
	<c:forEach items="${menuOut }" var="out" varStatus="i">
		<c:forEach items="${menuOut[i.index]}" var="menu">
			<input type="text" class="${menu.menuNum }_out" value="${menu.storeNum }">
		</c:forEach>
	</c:forEach>
	
	
	 <!-- Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog modal-lg">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">주문할 매장</h4>
	        </div>
	        <div class="modal-body">
	          <p style="font-weight: bold;">최근 주문한 매장</p>
	          <c:forEach items="${lastStore }" var="last">
	          	<c:forEach items="${allStore }" var="allStore">
	          		<c:if test="${last.storeNum eq allStore.storeNum }">
	          			<div class="row store_btn" id="${allStore.storeNum }_${allStore.orderable}_title" style="margin-bottom: 20px;" name="${allStore.name }" title="${allStore.storeNum }">
		          			<div class="col-sm-6" style="height:25px; line-height:25px; font-size: 15px; color:#999; font-weight: bold;">${allStore.name }</div>
		          			<div class="col-sm-6">
		          			<c:if test="${allStore.orderable eq 0 }"><span class="orderAble" style="width: 19.31%;"> 주문불가 </span></c:if> 
			        		<c:if test="${allStore.orderable eq 1 }"><span class="orderAble" style="background-color: #009223;color: white; border: 0px; width: 19.31%;">주문가능</span></c:if>
		          			</div>
	          			</div>
	          		</c:if>
	          		
	          	</c:forEach>
	          </c:forEach>
	        <hr style="background-color: #ffe17f; height: 3px;">
	        <table>
	        	<colgroup>
	        		<col width="150px;">
	        		<col width="400px;">
	        		<col width="300px;">
	        		<col width="150px;">
	        	</colgroup>
	        	<thead>
	        		<tr style="border-bottom: 4px solid #009223; text-align: center;">
	        			<th>매장명</th>
	        			<th>매장주소</th>
	        			<th>연락처</th>
	        			<th>주문</th>
	        		</tr>
	        	</thead>
	        	<tbody>
	        		<c:forEach items="${allStore }" var="all">
		        		<tr class="store_btn"  id="${all.storeNum }_${all.orderable}" name="${all.name }" title="${all.storeNum }" style="font-size: 13px; font-family: font_ns, sans-serif;height: 80px; ">
	        				<td>${all.name }</td>
	        				<td>${all.address }</td>
	        				<td>${all.telNumber }</td>
	        				<td>
		        				<c:if test="${all.orderable eq 0 }"><span class="orderAble"> 주문불가 </span></c:if> 
		        				<c:if test="${all.orderable eq 1 }"><span class="orderAble" style="background-color: #009223;color: white; border: 0px;">주문가능</span></c:if> 
	        				</td>
	        			</tr>
	        		</c:forEach>
	        	</tbody>
	        </table>
	   
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
	<input id="menuNum">
	<input id="index_num">
	<input id="ingre_num">
	<input id="bread_size">
	<input id="toasting_c">
	
<c:import url="../jsp/footer.jsp"></c:import>
</body>
<script type="text/javascript">
	$(".store_btn").each(function(){
		var title=$(this).attr("title");
		var id=$(this).attr('id');
		var check = title+"_0";
		if(check==id){
			$(this).removeClass("store_btn");
			$("#"+title+"_0_title").removeClass("store_btn");
		}
	});


/* 	$(".order").click(function(){
		var check = true;
		$("#myModal").modal();
		var id=$(this).attr("title");
		var name=$(this).attr("name");
		$(".store_btn").each(function(){
			var storeNum=$(this).attr("title");
			var name2=$(this).attr("name");
			$(this).click(function(){
		 	$("."+name+"_out").each(function(){
				if($(this).val()==storeNum){
					check=false;
				}
			}); 
			
			console.log("check");
			console.log(storeNum);
			if(confirm(name2+"으로 주문하시겠습니까?")){
				location.href="./memberMenuOrder?id_index="+id+"&menuNum="+name+"&storeNum="+storeNum;
			}
			});
		});
	}); */

	var id=0;
	var name=0;
	var check=true;
	$(".order").each(function(){
		$(this).click(function(){
			$("#myModal").modal();
			id=$(this).attr("title");
			name=$(this).attr("name");
		});
	});


	$(".store_btn").each(function(){
		var storeNum=$(this).attr("title");
		var name2=$(this).attr("name");
		$(this).click(function(){
			$("."+name+"_out").each(function(){
				if($(this).val()==storeNum){
					check=false;
				}
			});
			if(check){
				if(confirm(name2+"으로 주문하시겠습니까?")){
					location.href="./memberMenuOrder?id_index="+id+"&menuNum="+name+"&storeNum="+storeNum;
				}
			} else{
				alert("해당 메뉴가 품절인 매장입니다.\n다른매장을 이용해주세요.");
				check=true;
			}
		});
	});

	
	$(".pop").click(function(){
		$("#menuNum").val("샌드위치 선택");
		$("#ingre_num").val(null);
		var winObj = window.open("myMenuCustom",  "popupNo1", "width=490px, height=630px,location=no,toolbar=no,resizable=no,menubar=no,scrollbars=yes");
		
	});
	
	$(".pop").css({
		'cursor':'pointer'
	});

	$(".update").each(function(){
		$(this).click(function(){
			var id = $(this).attr("id");
			$("#menuNum").val($("#"+id+"_menuNum").val());
			$("#bread_size").val($("#"+id+"_bSize").val());
			$("#toasting_c").val($("#"+id+"_toast").val());
			var id_index = $(this).attr("title");
			var ingre_num = $(this).attr("name");
			$("#ingre_num").val(ingre_num);
			var winObj = window.open("myMenuCustom",  "popupNo1", "resizable=no,width=490px, height=630px,location=no,toolbar=no,menubar=no,scrollbars=yes");
		});
	});

	
	$(".delete").each(function(){
		$(this).click(function(){
			console.log($(this).attr("title"));
			var id_index = $(this).attr("title");
			if(confirm("이 메뉴를 삭제하시겠습니까?")){
				$.ajax({
					type:'GET',
					url:"./myMenuDelete",
					data:{
						id_index:id_index
					},
					success:function(){
						alert("성공");
						location.href="./memberMenu";
					}
				});
			}
			
		});
	});
	
	
	$(".my_menu").each(function(){
		$(this).click(function(){
			$("#index_num").val($(this).attr("id"));
			
		});
	});
	var menuPrice=0;
	
	$(".ingre_tag").each(function(){
		var id=$(this).attr("title");
		var set_price = id+"_set";
		$("."+id).each(function(){
			menuPrice=menuPrice+$(this).text()*1;
		});
		menuPrice = menuPrice + $("#"+set_price).val()*1;
		menuPrice = addComma(menuPrice);
		$("#"+id).text(menuPrice);
		menuPrice=0;
	});
	
	$(".price").each(function(){
		var price = $(this).text();
		menuPrice = menuPrice+price;
		price = addComma(price);
		$(this).text(price);

	});
	function addComma(x) {
		x = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		x = x+"원";
		return x;
	}


</script>
</html>