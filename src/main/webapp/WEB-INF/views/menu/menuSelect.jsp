<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="../css/headerStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/menuSelectStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/footerStyle.css">
<c:import url="../template/boot.jsp"></c:import>
</head>
<body>
<!-- header start -->
<c:import url="../jsp/header.jsp"></c:import>
<!-- header end -->

<!-- top start -->
<div id="top"> 
	<div id="cate1">
	<ul>
		<li>
			<a href="menuList?menuCode=SW" id="SW">샌드위치</a>
		</li>
		<li>
			<a href="menuList?menuCode=WR" id="WR">랩</a>
		</li>
		<li>
			<a href="menuList?menuCode=SA" id="SA">샐러드</a>
		</li>
		<li style="margin-right: 0; ">
			<a href="menuList?menuCode=SI" id="SI">사이드</a>
		</li>
	</ul>
	</div>
</div>
<script>
	var cd = "${menu.menuCode}";
	var co = cd.substring(0,2);
	$("#"+co).addClass("active");		
	var soldout = "";
</script>
<!-- top end -->

<!-- content start -->
<div id="menuSelect_content">
<!-- menu_order start -->
<form action="../cart/cartInsert" method="post" name="menuForm">
<div id="menu_order">
	<!-- hd start (menu info) -->
	<div class="hd">   
		<div class="category"> <a class="active" href="#"> ${menu.codeDesc}</a></div>
		<h2 class="name">${menu.name}</h2>
        <span class="cal">${menu.menuPrice}원</span> 
         <c:if test="${sw eq true}">
        <span class="cal"> / ${menu.menuPrice30}원 </span>
        </c:if>
        <div class="menu_img">
    		<img alt="${menu.name}" src="../images/menu/${menu.menuCode}_${menu.menuNum}.jpg">
    	</div>
    	<p class="summary" style="white-space:pre-line;">
    		${menu.desc}
    	</p>
    </div>
    <!-- hd end (menu info) -->
    
	<input type="hidden" name="menuNum" value="${menu.menuNum}">
	<input type="hidden" name="menuCode" value="${menu.menuCode}">
    <!-- custom start -->
    <c:if test="${custom eq true}">
    <div class="custom">
	    <c:if test="${sw eq true}">
    	<div class="select" id="size_select" style="margin-top: 80px;">
    		<h2>사이즈 선택</h2>
    		<div class="select_btn" id="btn15">
    			<input type="radio" id="input_size15" name="breadSize" value="15" checked="checked" style="display: none;">
    			<label for="15cm">15cm ${menu.menuPrice}원</label><br>
    		</div>
    		
    		<div class="select_btn" id="btn30">
    			<input type="radio" id="input_size30" name="breadSize" value="30" style="display: none;">
    			<label for="30cm">30cm ${menu.menuPrice30}원</label><br>
    		</div>
    	</div>
    	<div class="select" id="br_select">
    		<h2>빵 선택</h2>
    		<c:forEach items="${bread}" var="b" varStatus="i">
    		<div class="ing">
	    		<c:forEach items="${ingreOut}" var="io">
					<c:if test="${b.ingreNum eq io}">
						<div class="label2">
							<span class="new">품절</span>
						</div>
						<script type="text/javascript">
							soldout = "#br${i.index}";
						</script>
					</c:if>
				</c:forEach>
    			
    			<img src="../images/ingredient/${b.ingreCode}_${b.ingreNum}.jpg">
    			<div>
		    		<input type="radio" class="br" name="ingreNum" title="${b.name}" value="${b.ingreNum}" id="br${i.index}">
					<label>${b.name}</label>
				</div>
				<script type="text/javascript">
					$(soldout).attr("disabled", true);
				</script>
			</div>
			</c:forEach>
    	</div>
    	<div class="select" id="toasting_select" style="margin-top: 40px;">
    		<h2>토스팅 선택</h2>
    		<div class="select_btn" id="btntos1">
    			 <input type="radio" id="input_tos1" name="breadToasting" value="1" checked="checked" style="display: none;">
				 <label>토스팅 함</label><br>
    		</div>
    		<div class="select_btn" id="btntos0">
    			<input type="radio" id="input_tos0" name="breadToasting" value="0" style="display: none;">
				<label>토스팅 하지 않음</label><br>
    		</div>
    	</div>
    	</c:if>
    	
    	<div class="select" id="cz_select">
    	<h2>치즈 선택</h2> 
    	<p>(최대 1개)</p><br>
    		<c:forEach items="${cheese}" var="c" varStatus="i">
    		<div class="ing">
    			<c:forEach items="${ingreOut}" var="io">
					<c:if test="${c.ingreNum eq io}">
						<div class="label2">
							<span class="new">품절</span>
						</div>
						<script type="text/javascript">
							soldout = "#cz${i.index}";
						</script>
					</c:if>
				</c:forEach>
				
    			<img src="../images/ingredient/${c.ingreCode}_${c.ingreNum}.jpg">
    			<div>
		    		<input onclick="czChecked(this);" type="checkbox" name="ingreNum" class="cz" value="${c.ingreNum}"  title="${c.name}" id="cz${i.index}">
					<label>${c.name}</label>
				</div>
				<script type="text/javascript">
					$(soldout).attr("disabled", true);
				</script>
			</div>
			</c:forEach>
    		
    	</div>
    	<div class="select" id="ve_select">
    		<h2>제외할 야채 선택</h2>
    		<c:forEach items="${vege}" var="v" varStatus="i">
    		<div class="ing">
    			<c:forEach items="${ingreOut}" var="io">
					<c:if test="${v.ingreNum eq io}">
						<div class="label2">
							<span class="new">품절</span>
						</div>
						<script type="text/javascript">
							soldout = "#ve${i.index}";
						</script>
					</c:if>
				</c:forEach>
    			<img src="../images/ingredient/${v.ingreCode}_${v.ingreNum}.jpg">
    			<div>
		    		<input type="checkbox" name="ingreNum" class="ve" value="${v.ingreNum}"  title="${v.name}" id="ve${i.index}">
					<label>${v.name} 제외</label>
				</div>
				<script type="text/javascript">
					$(soldout).attr("disabled", true);
				</script>
			</div>
			</c:forEach>
    	</div>
    	<div class="select" id="so_select">
    		<h2>소스 선택</h2>
    		<p>(최대 3개)</p><br>
    		<c:forEach items="${sauce}" var="s" varStatus="i">
    		<div class="ing">
    			<c:forEach items="${ingreOut}" var="io">
					<c:if test="${s.ingreNum eq io}">
						<div class="label2">
							<span class="new">품절</span>
						</div>
						<script type="text/javascript">
							soldout = "#so${i.index}";
						</script>
					</c:if>
				</c:forEach>
    			<img src="../images/ingredient/${s.ingreCode}_${s.ingreNum}.jpg">
    			<div>
		    		<input onclick="soChecked(this);" type="checkbox" name="ingreNum" class="so" value="${s.ingreNum}"  title="${s.name}" id="so${i.index}">
					<label>${s.name}</label>
				</div>
				<script type="text/javascript">
					$(soldout).attr("disabled", true);
				</script>
			</div>
			</c:forEach>
    	</div>
    	<div class="select" id="add_select">
    		<h2>추가 재료 선택</h2>
    		<c:forEach items="${add}" var="a" varStatus="i">
    		<div class="ing" style="height: 125px;">
    			<c:forEach items="${ingreOut}" var="io">
					<c:if test="${a.ingreNum eq io}">
						<div class="label2">
							<span class="new">품절</span>
						</div>
						<script type="text/javascript">
							soldout = "#${a.name}";
						</script>
					</c:if>
				</c:forEach>
    			<img src="../images/ingredient/${a.ingreCode}_${a.ingreNum}.jpg">
    			<div>
		    		<input onclick="addIng(this);" type="checkbox" name="ingreNum"  class="add" value="${a.ingreNum}" title="${a.price}" id="${a.name}">
					<label>${a.name}</label>
					<label style="padding-left:15px;">(+${a.price}원)</label>
				</div>
				<script type="text/javascript">
					$(soldout).attr("disabled", true);
				</script>
			</div>
			</c:forEach>
    	</div>
      </div>
    </c:if>
    <!-- custom end -->
    
    <!-- set start -->
    <c:if test="${setmenu eq true}">
   	<div class="select" id="set_select">
   		<h2>세트 선택</h2>
   		<div class="select_btn" id="btnset0" data-toggle="collapse" data-target="#setSelect.in">
   			  <input onclick="setOff();" type="radio" id="input_set0" name="setting" value="0" checked style="display: none;">
		 	  <label>단품주문</label><br>
   		</div>
   		<div class="select_btn" id="btnset1" data-toggle="collapse" data-target="#setSelect:not(.in)">
   			<input onclick="setOn();" type="radio" name="setting" id="setON" value="1" style="display: none;">
		  	<label>세트주문(+1900원)</label><br>
   		</div>
   		<div id="setSelect" class="collapse">
	   		<h3>쿠키</h3> 
			<div id="div_co">
	   		<c:forEach items="${cookies}" var="coo" varStatus="i">
	   			<div class="ing">
		   			<c:forEach items="${menuOut}" var="mo">
						<c:if test="${coo.menuNum eq mo}">
							<div class="label2">
								<span class="new">품절</span>
							</div>
							<script type="text/javascript">
								soldout = "#coo${i.index}";
							</script>
						</c:if>
					</c:forEach>
	    			<img src="../images/menu/${coo.menuCode}_${coo.menuNum}.jpg">
	    			<div>
			    		<input type="radio" name="coo" class="cs" value="${coo.menuNum}" title="${coo.name}" id="coo${i.index}">  
		  				<label>${coo.name}</label><br>
					</div>
					<script type="text/javascript">
						$(soldout).attr("disabled", true);
					</script>
				</div>
	   		</c:forEach>
	   		</div>
	   		
	   		<h3>음료</h3>
	   		<div id="div_dr">
	   		<c:forEach items="${drinks}" var="drink" varStatus="i">
	   			<div class="ing" style="height: 125px;">
	   				<c:forEach items="${menuOut}" var="mo">
						<c:if test="${drink.menuNum eq mo}">
							<div class="label2">
								<span class="new">품절</span>
							</div>
							<script type="text/javascript">
								soldout = "#drink${i.index}";
							</script>
						</c:if>
					</c:forEach>
	    			<img src="../images/menu/${drink.menuCode}_${drink.menuNum}.jpg">
	    			<div>
			    		<input type="radio" name="drink" class="ds" value="${drink.menuNum}" title="${drink.name}" id="drink${i.index}">
		  				<label>${drink.name}</label><br>
					</div>
					<script type="text/javascript">
						$(soldout).attr("disabled", true);
					</script>
				</div>
	   		</c:forEach>
	   		</div>
		  </div>
   	</div>
	</c:if>
	<!-- set end -->
	
</div>
<!-- menu_order end -->
<!-- menu_banner start -->
<div id="menu_banner">
	<div id="banner">
		<div class="ba">
			<label>메뉴</label><br>
			<span>${menu.name}</span>
			
			<span id="mp">
			<c:if test="${sw eq true}">
	        <span >15cm</span>
	        </c:if>
			(${menu.menuPrice}원)</span><br>
		</div>
		
		<c:if test="${custom eq true}">
			<div class="ba">
				<label>커스텀</label><br>
				
				<c:if test="${sw eq true}">
					<span>- 빵: </span>
					<span id="brse"> </span><br>
					
					<span>- 토스팅 여부: </span>
					<span id="tose">토스팅 함</span><br>
				</c:if>
				
				<span>- 치즈: </span> 
				<span id="czse"> </span><br>
				
				<span>- 제외 야채: </span>
				<span id="vese"> 
					<c:forEach items="${vege}" var="v" >
						<span id="${v.name}" style="display: none;">${v.name}</span>
					</c:forEach>
				</span><br>
				
				<span>- 소스: </span>
				<span id="sose"> 
					<c:forEach items="${sauce}" var="s" >
						<span id="${s.name}" style="display: none;">${s.name}</span>
					</c:forEach>
				</span><br>
				
				<span>- 추가재료: </span>
				<span id="adse"> 
					<c:forEach items="${add}" var="a" >
						<span id="${a.name}" style="display: none;">${a.name}(${a.price}원)</span>
					</c:forEach>
				</span><br>
			</div>
		</c:if>
		
		<c:if test="${setmenu eq true}">
			<div id="setse" style="display:none;" class="ba">
				<label>세트</label> <br>
				<span>- 쿠키:  </span>
				<span id="cose"> </span><br>
				<span>- 음료:  </span>
				<span id="drse"> </span><br>
			</div>
		</c:if>
		
		<div class="ba" style="position: static;">
			<label>수량</label><br>
			<input type="button" class="cntBtn" id="cntDown" value="-" style="position: relative; left: 27px; top:1px; z-index: 100">
			<input type="text" name="productCount" id="productCount" value=1 readonly="readonly" style="position: relative; left: -20px;">	
			<input type="button" class="cntBtn" id="cntUp" value="+" style="position: relative; right: 65px;top:1px; "><br>
		</div>		
				
		<div class="ba" style="border:none;">
			<label style="display: inline-block;">총 금액</label>	
			<input type="text" name="productPrice" id="tot" value="${menu.menuPrice}" readonly="readonly">	
			<label>원</label>
			<input type="hidden" id="menuPrice30" value="${menu.menuPrice30}">
			<input type="button" onclick="setValid()" value="주문하기" id="orderBtn">
		</div>
	</div>
</div>
<!-- menu_banner end -->
</form>

	

</div>
<!-- content end -->

<!-- footer start -->
<c:import url="../jsp/footer.jsp"></c:import>
<!-- footer end -->

  
<script type="text/javascript">
	// Script 요소들 
	//가격에 콤마넣기 
	function addComma(x) {
	 	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	// banner fixed  
    $(window).scroll(  
	    function(){  
	    	var scroll = $(window).scrollTop(); //현재 스크롤위치 
 			if ($(window).scrollTop()>230){
	        	$('#banner').addClass("banner_fix");
	        	$('.banner_fix').css('top', '50px');
 			} else{
 				$('#banner').removeClass("banner_fix");
 	 		}
	    }  
	);   
	
 	// 배너에 값 보내기  
	$(".br").click(function(){
		$("#brse").html(this.title);
	});
	$(".cz").click(function(){
		$("#czse").html(this.title);
	});
	$(".ve").click(function(){
		var name = "#"+this.title;
		if(this.checked){
			$(name).addClass("showInline");
		} else{
			$(name).removeClass("showInline");
		}
	});
	$(".so").click(function(){
		var name = "#"+this.title;
		if(this.checked){
			$(name).addClass("showInline");
		} else{
			$(name).removeClass("showInline");
		}
	});
	$(".add").click(function(){
		var name = "#"+this.id;
		if(this.checked){
			$(name).addClass("showInline");
		} else{
			$(name).removeClass("showInline");
		}
	});
	$(".cs").click(function(){
		$("#cose").html(this.title);
	});
	$(".ds").click(function(){
		$("#drse").html(this.title);
	});
	
	// div 클릭 처리 
	$("#btn15").addClass("btnSelected");
	$("#btntos1").addClass("btnSelected");
	$("#btnset0").addClass("btnSelected");
	
	$("#btn15").click(function(){
		$("#input_size15").prop("checked", true);
		$("#btn30").removeClass("btnSelected");
		$("#btn15").addClass("btnSelected");
		size15cm();
	});
	$("#btn30").click(function(){
		$("#input_size30").prop("checked", true);
		$("#btn15").removeClass("btnSelected");
		$("#btn30").addClass("btnSelected");
		size30cm();
	});
	
	$("#btntos1").click(function(){
		$("#input_tos1").prop("checked", true);
		$("#btntos0").removeClass("btnSelected");
		$("#btntos1").addClass("btnSelected");
		$("#tose").html("토스팅 함");
	});
	$("#btntos0").click(function(){
		$("#input_tos0").prop("checked", true);
		$("#btntos1").removeClass("btnSelected");
		$("#btntos0").addClass("btnSelected");
		$("#tose").html("토스팅 하지 않음");
	});
	
	$("#btnset1").click(function(){
		$("#setON").prop("checked", true);
		$("#btnset0").removeClass("btnSelected");
		$("#btnset1").addClass("btnSelected");
		setOn();
	});
	$("#btnset0").click(function(){
		$("#input_set0").prop("checked", true);
		$("#btnset1").removeClass("btnSelected");
		$("#btnset0").addClass("btnSelected");
		setOff();
	});

	// 1. 재료 선택 제한 
	// 1-2) 치즈 최대 1개, 소스 최대 3개 선택 가능  		
	var czCnt = 0;							
	var soCnt = 0;
	var czMax = 1;							
	var soMax = 3;
	function czChecked(field){
		if (field.checked) {						
			czCnt += 1;								
		} else {										
			czCnt -= 1;								
		}
		if (czCnt > czMax) {						
			alert("치즈는 최대 "+czMax+"개까지만 선택가능합니다.");	
			field.checked = false;						
			czCnt -= 1;		
		}
	}
	function soChecked(field){
		if (field.checked) {						
			soCnt += 1;								
		} else {										
			soCnt -= 1;								
		}
		if (soCnt > soMax) {						
			alert("소스는 최대 "+soMax+"개까지만 선택가능합니다.");	
			field.checked = false;						
			soCnt -= 1;
		}				
	}

 	//2. 세트주문시 쿠키, 음료 고르기
 	//1) 쿠키 선택하면 쿠키 리스트, 음료 선택하면 음료 리스트  
 	function cookieSelect(){
 		$('#div_dr').css("display", "none");
		$('#div_co').css("display", "block");
	}
 	function drinkSelect(){
 		$('#div_dr').css("display", "block");
		$('#div_co').css("display", "none");	
	}
	
	//2) submit 검증
	function setValid(){
		var sw = "${sw}";
		var setmenu = "${setmenu}";
		
		if(setmenu == 'true'){
			var set = $('#setON').prop("checked");
			if(!set){
				//단품일때 
				if(sw == 'true'){
					//단품 샌드위치 - 빵 선택 검증 
					var radio_check = false;
					$(".br").each(function(index, item){
						if($(item).prop("checked")){
							radio_check = true;
						}
					});
					if(radio_check){
						menuForm.submit();
					} else{
						alert("빵을 선택해주세요");
					}
				} else{
					menuForm.submit();
				}
			} else{
				//세트일때 음료, 쿠키 선택 검증 
				if($(".ds:checked").length==0 || $(".cs:checked").length==0){
					alert('세트 음료와 쿠키를 모두 선택해주세요');
				} else{
					if(sw == 'true'){
						// 세트 검증 된 샌드위치
						// 빵 선택 추가 검증 
						var radio_check = false;
						$(".br").each(function(index, item){
							if($(item).prop("checked")){
								radio_check = true;
							}
						});
						if(radio_check){
							menuForm.submit();
						} else{
							alert("빵을 선택해주세요");
						}
					} else{
						// 세트 검증된 샌드위치 아닌 메뉴들 
						menuForm.submit();
					}	
				}
			}
		} else{
			menuForm.submit();
		}
	}
	//3) 다시 단품 선택하면 쿠키, 음료 선택 해제 -> 아래 setOff()에
		
	//3. 총 금액 계산
	var size15 = parseInt($("#tot").val());
	var size30 = parseInt($("#menuPrice30").val());
	var custom = 0;
	var setting = 0;
	var cnt = 1;  
	var totalOne = 0;
	if(!$("#sizeUP").prop("checked")){
		totalOne = size15;
	}
		
	//1) 15cm, 30cm 선택 	
	function size15cm(){
		totalOne = size15 + custom + setting;
		$("#tot").val(totalOne*cnt);
		$("#mp").html("15cm ("+size15+"원)");
	}
	function size30cm(){
		totalOne = size30 + custom + setting;
		$("#tot").val(totalOne*cnt);
		$("#mp").html("30cm ("+size30+"원)");
	}
	
	//2) 세트 선택
	function setOn(){
		setting = 1900;
		totalOne = totalOne + setting; 
		$("#tot").val(totalOne*cnt);
		$("#setse").addClass("showBlock");
	}

	//2-2) 다시 단품 클릭하면
 	function setOff(){
 		//쿠키, 음료 체크 해제 
 		$('.cs').prop("checked", false);
 		$('.ds').prop("checked", false);

		//가격 
 		totalOne = totalOne - setting; 
		$("#tot").val(totalOne*cnt);
		setting = 0;
		
		$("#cose").html("");
		$("#drse").html("");
		$("#setse").removeClass("showBlock");
	}
	
	//3) 추가재료 선택
	function addIng(a){
		var ad = parseInt(a.title);
		if(a.checked){
			totalOne = totalOne + ad; 
			custom = custom + ad;
		} else {
			totalOne = totalOne - ad; 
			custom = custom - ad;
		}
		$("#tot").val(totalOne*cnt);
	}

	//4) 수량 
	$('#cntUp').click(function(){
		//수량 조절 
		if(cnt<10){
			cnt++;
		}
		$('#productCount').val(cnt);

		//가격
		$("#tot").val(totalOne*cnt);
	});
	$('#cntDown').click(function(){
		//수량 조절 
		cnt = $('#productCount').val();
		if(cnt>1){
			cnt--;
			$('#productCount').val(cnt);	
		}
		$('#productCount').val(cnt);

		//가격
		$("#tot").val(totalOne*cnt);
	});
</script>
</body>
</html>