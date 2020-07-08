<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/boot.jsp"></c:import>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/indexStyle.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Insert title here</title>
<style type="text/css">
input{
	display: none;
}
</style>
</head>

<body>
<form action="../member/memberMenu" method="post" id="frm">
		<!-- Modal -->
			
				<!-- Modal content-->
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">나만의 메뉴</h4>
					</div>
					
					<div class="modal-body" style="height: 100%;">
							<select id="menu">
								<option>샌드위치 선택</option>
								<c:forEach items="${list}" var="list">
									<c:if test="${list.sale eq 1 }">
										<option value="${list.menuNum}">
											${list.name }
										</option>
									</c:if>
								</c:forEach>
							</select>
							<img id="swImg" alt="" src="../images/menu/SW1_M01.jpg" width="200px;">
						<hr style="background-color: #f1a03c; height: 3px;">
						
						
						<input  name="index_num" id="index_num" value="" readonly="readonly">
						
						<c:forEach items="${list }" var="list">
							<div style="display: none" id="${list.menuNum}_show" class="show_hide">
								<div style="margin-bottom: 15px;">빵 사이즈 선택</div>
								<div>
								<input type="radio" value="${list.menuNum}" name="menuNum" id="${list.menuNum}_menuNum">
								
								<input  type="radio" title="${list.menuNum}" class="${list.menuNum}_sizebox" id="${list.menuNum}_15" name="breadSize" checked="checked" value="15">
									<label for="${list.menuNum}_15">
										<i id="${list.menuNum}_15box" class='fas fa-check-square' style='font-size:20px;color:gray'></i>
										15cm
										<span id="${list.menuNum}_price" title="${list.menuPrice}"></span>
									</label>
								</div>
								<div>
								<input  type="radio" title="${list.menuNum}" class="${list.menuNum}_sizebox" id="${list.menuNum}_30" name="breadSize" value="30">
									<label for="${list.menuNum}_30">
										<i id="${list.menuNum}_30box" class='fas fa-check-square' style='font-size:20px; color:gray'></i>
										30cm
										<span id="${list.menuNum}_price30" title="${list.menuPrice30 }"></span>
									</label>
								</div>
								<hr style="background-color: #f1a03c; height: 1px;">
							<div id="${list.menuNum }_img" title="${list.menuCode }_${list.menuNum }"></div>
							</div>
						</c:forEach>
						
						
						<div style="display: none;" class="menu_show">
							<div style="margin-bottom: 15px;">빵  선택</div>
							<div class="row">
							<div class="col-xs-2" style="width: 200px;">
							<c:forEach items="${ingre}" var="BR">
								<c:if test="${BR.ingreCode eq 'BR'}">
									<div>
										<label for="${BR.ingreNum}">
											<input type="radio" class="br_choice" title="${BR.ingreNum}_sel" id="${BR.ingreNum }" name="ingreNum" value="${BR.ingreNum}">
											<i id="${BR.ingreNum}_sel" title="${BR.ingreNum }" class='br_sel fas fa-check-square' style='font-size:20px;color:gray'></i>
											${BR.name } 
										</label>
									</div>
								</c:if>
							</c:forEach>
							</div>
							<div class="col-xs-2"><img id="breadImg" style="width: 150px;" alt="" src=""></div>
							</div>
							<hr style="background-color: #f1a03c; height: 1px;">
							
							
							
							<div style="margin-bottom: 15px;">토스팅</div>
							<div>
								<input type="radio" id="toastingY" name="breadToasting" class="t_choice" title="t_y" value="1">
								<label for="toastingY">
									<i  id="t_y" class='t_sel fas fa-check-square' style='font-size:20px;color:gray'></i>
									토스팅 함
								</label>
							</div>
							<div>
								<input type="radio" id="toastingN" name="breadToasting" class="t_choice" title="t_n" value="0">
								<label for="toastingN">
									<i id="t_n" class='t_sel fas fa-check-square' style='font-size:20px;color:gray'></i>
									토스팅 안함
								</label>	
							</div>
							<hr style="background-color: #f1a03c; height: 1px;">
							
							<div style="margin-bottom: 15px;">치즈 선택</div>
							<div class="row">
							<div class="col-xs-2" style="width: 200px;">
							<c:forEach items="${ingre}" var="CZ">
								<c:if test="${CZ.ingreCode eq 'CZ' }">
									<div>
										<label for="${CZ.ingreNum}">
											<input type="checkbox" id="${CZ.ingreNum}" title="${CZ.ingreNum}_sel" name="ingreNum" value="${CZ.ingreNum }" class="cz_choice">
											<i id="${CZ.ingreNum}_sel" title="${CZ.ingreNum }" class='cz_sel fas fa-check-square' style='font-size:20px;color:gray'></i>
											${CZ.name } 
										</label>
									</div>
								</c:if>
							
							</c:forEach>
							</div>
							<div class="col-xs-2"><img id="czImg" style="width: 100px;" alt="" src=""></div>
							</div>
							<hr style="background-color: #f1a03c; height: 1px;">
							
							
							<div style="margin-bottom: 15px;">제외할 야채</div>
							<div class="row">
							<div class="col-xs-2" style="width: 200px;">
							<c:forEach items="${ingre}" var="VG">
								<c:if test="${VG.ingreCode eq 'VG' }">
									<div>
										<input type="checkbox" class="vg_choice" id="${VG.ingreNum }" name="ingreNum" value="${VG.ingreNum }">
										<label for="${VG.ingreNum }">
											<i id="${VG.ingreNum }_sel" class='vg_sel fas fa-minus-square' style='font-size:20px;color:gray'></i>
											${VG.name } 
										</label>
									</div>
								</c:if>
							
							</c:forEach>
							</div>
							</div>
							<hr style="background-color: #f1a03c; height: 1px;">
							
							
							<div style="margin-bottom: 15px;">소스</div>
							<div class="row" id="so_count">
							<div class="col-xs-2" style="width: 200px;">
							<c:forEach items="${ingre }" var="SO">
								<c:if test="${SO.ingreCode eq 'SO'}">
									<div>
										<input type="checkbox" class="so_choice" id="${SO.ingreNum}" name="ingreNum" value="${SO.ingreNum }">
										<label for="${SO.ingreNum}">
											<i id="${SO.ingreNum }_sel" class='fas fa-check-square' style='font-size:20px;color:gray'></i>
											${SO.name }
										</label>
									
									</div>
									
								</c:if>
							</c:forEach>
							</div>
							<div class="col-xs-2" id="soImg"><img style="width: 100px; height: px;" alt="" src=""></div>
							</div>
							<hr style="background-color: #f1a03c; height: 1px;">
							
							<div style="margin-bottom: 15px;">추가 재료</div>
							<div class="row">
							<div class="col-xs-2" style="width: 200px; padding-right: 0px;">
							<c:forEach items="${ingre}" var="AD">
								<c:if test="${AD.ingreCode eq 'AD'}">
									<div>
										<input type="checkbox" class="ad_choice" id="${AD.ingreNum}" name="ingreNum" value="${AD.ingreNum }">
										<label for="${AD.ingreNum }">
											<i id="${AD.ingreNum }_sel" class='fas fa-check-square' style='font-size:20px;color:gray'></i>
											${AD.name } <span style="font-size: 12px;">(+<span class="price">${AD.price }</span>)</span>
										</label>
									</div>
								</c:if>
							</c:forEach>
							</div>
							</div>
							<div class="row">
								<div id="adImg"></div>
							</div>
							<hr style="background-color: #f1a03c; height: 1px;">
							
								<input type="radio" class="set_check" id="no_set" name="setting" checked="checked" title="no_set_img" value="0">
								<label for="no_set">
									<i id="no_set_img" class='fas fa-check-square' style='font-size:20px;color:gray'></i>
									단품
								</label>
									
								<input type="radio" class="set_check" id="set" name="setting" title="set_img" value="1" >
								<label for="set">
									<i id="set_img" class='fas fa-check-square' style='font-size:20px;color:gray'></i>
									세트(+1,900원)
								</label>
							<hr style="background-color: #f1a03c; height: 1px;">
							<!-- 세트메뉴 -->
							<div style="display: none" id="side_show">
							
								<div style="margin-bottom: 15px;">음료</div>
								<div class="row">
								<div class="col-xs-2" style="width: 200px;">
									<c:forEach items="${setSide }" var="side">
										<c:if test="${side.menuCode eq 'SI1' }">
										<div>
											<input type="radio" id="${side.menuNum }" name="drink" class="drink" value="${side.menuNum }">
											<label for="${side.menuNum }">
												<i id="${side.menuNum }_img" class='drink fas fa-check-square' style='font-size:20px;color:gray'></i>
												${side.name }
											</label>
										</div>
										</c:if>
									</c:forEach>
								</div>
								<div class="col-xs-2"><img id="drinkImg" style="width: 100px;" alt="" src=""></div>
								</div>
								<hr style="background-color: #f1a03c; height: 1px;">
								<div style="margin-bottom: 15px;">쿠키</div>
								<div>
								<div class="row">
								<div class="col-xs-2" style="width: 250px;">
									<c:forEach items="${setSide }" var="side">
										<c:if test="${side.menuCode eq 'SI2' }">
										<div>
											<input type="radio" id="${side.menuNum }" name="cookie" class="cookie" value="${side.menuNum }">
											<label for="${side.menuNum }">
												<i id="${side.menuNum }_img" class='cookie fas fa-check-square' style='font-size:20px;color:gray'></i>
												${side.name }
											</label>
										</div>
										</c:if>
									</c:forEach>
								</div>
								<div class="col-xs-2"><img id="cookieImg" style="width: 100px;" alt="" src=""></div>
								</div>
								</div>
							
							</div>
							
							<!-- 세트메뉴 -->
						</div>
						
								
					</div>
					<div class="modal-footer" style="margin-top: 40px;text-align: center;">
						<button type="button" id="btn_submit" style="background-color: green; color:white; border: 0px;">저장</button>
					</div>

	</form>
</body>

<script type="text/javascript">



var val = opener.document.getElementById("index_num").value;
$("#index_num").val(val);


// -----------------------------------------------------------
var menu = opener.document.getElementById("menuNum").value;
var ingreNum = opener.document.getElementById("ingre_num").value;
var bSize = opener.document.getElementById("bread_size").value;
var toast = opener.document.getElementById("toasting_c").value;
var ingreNumList=ingreNum.split(",");
var count=0;

console.log(menu);






// ==========================================빵,쿠키,음료 정보
if(menu!='샌드위치 선택'){
	//------------쿠키 음료 
	var setting = opener.document.getElementById(val+"_ingrePrice_set").value;
	var drinkNum = opener.document.getElementById(val+"_drink").value;
	var cookieNum = opener.document.getElementById(val+"_cookie").value;
	if(setting>0){
		$("#set").prop("checked",true);
		$("#"+drinkNum).prop("checked",true);
		$("#"+cookieNum).prop("checked",true);
	}


	//--------------빵
	var menuPrice = $("#" + menu + "_price").attr("title");
	var menuPrice30 = $("#" + menu + "_price30").attr("title");
	var commaPrice = addComma(menuPrice);
	var commaPrice30 = addComma(menuPrice30);
	commaPrice = "(" + commaPrice + ")";
	commaPrice30 = "(" + commaPrice30 + ")";
	$("#" + menu + "_price").text(commaPrice);
	$("#" + menu + "_price30").text(commaPrice30);
	box(menu);
	$("." + menu + "_sizebox").click(function() {
		$("." + menu + "_sizebox").each(function() {
			box(menu);
		});
	});
} 
//=============================================


$("#set").each(function(){
	if($(this).prop("checked")){
		$("#side_show").show();
	}
});
$("#set").click(function(){
	$("#side_show").show();
});
$("#no_set").click(function(){
	$("#side_show").hide();
	$(".cookie").prop("checked",false);
	$(".drink").prop("checked",false);
	$(".cookie").css({
		'color':'gray'
	})
	$(".drink").css({
		'color':'gray'
	})
	$("#cookieImg").attr("src","");
	$("#drinkImg").attr("src","");

	
});





function side_set(side){
	$("."+side).each(function(){
		var id = $(this).attr("id");
		if($(this).prop("checked")){
			$("#"+id+"_img").css({
				'color' : 'rgb(0, 152, 61)'
			});
			if(side=='drink'){
				$("#drinkImg").attr("src","../images/menu/SI1_"+id+".jpg");
			}  else if(side=='cookie'){
				$("#cookieImg").attr("src","../images/menu/SI2_"+id+".jpg");
			} 
		}
	});
	$("."+side).click(function(){
		$("."+side).each(function(){
			var id = $(this).attr("id");
			console.log(id);
			if($(this).prop("checked")){
				$("#"+id+"_img").css({
					'color' : 'rgb(0, 152, 61)'
				});
				if(side=='drink'){
					$("#drinkImg").attr("src","../images/menu/SI1_"+id+".jpg");
				} else if(side=='cookie'){
					$("#cookieImg").attr("src","../images/menu/SI2_"+id+".jpg");
				} 
			} else{
				$("#"+id+"_img").css({
					'color' : 'gray'
				});
			}
		});
	});
}
side_set("drink");
side_set("cookie");

$(".set_check").each(function(){
	var id = $(this).attr("title");
	if($(this).prop("checked")){
		$("#"+id).css({
			'color' : 'rgb(0, 152, 61)'
		});
		
	} else{
		$("#"+id).css({
			'color' : 'gray'
		});
	}
});

$(".set_check").click(function(){
	$(".set_check").each(function(){
		var id = $(this).attr("title");
		if($(this).prop("checked")){
			$("#"+id).css({
				'color' : 'rgb(0, 152, 61)'
			});
		} else{
			$("#"+id).css({
				'color' : 'gray'
			});
		}
	});
});




$("#"+menu+"_menuNum").prop("checked","checked");
console.log(ingreNumList);
if(ingreNumList[0]!=""){
	for(var i=0;i<ingreNumList.length;i++){
		var id = ingreNumList[i];
		var ingre_class = $("#"+id).attr("class");
		$("#"+id).prop("checked","checked");
		$("#"+id+"_sel").css({
			'color' : 'rgb(0, 152, 61)'
		});
		if(ingre_class=="vg_choice"){
			$("#"+id+"_sel").css({
				'color' : '#f1a03c'
			});
		}
		if(ingre_class=="so_choice"){
			count++;
		}
	}

	
} else{
	console.log("Check");
}


if(bSize=='15'){
	$("#"+menu+"_15").prop("checked","checked");
	$("#"+menu+"_15box").css({
		'color' : 'rgb(0, 152, 61)'
	});
	
} else{
	$("#"+menu+"_30").prop("checked","checked");
	$("#"+menu+"_30box").css({
		'color' : 'rgb(0, 152, 61)'
	});
}
if(toast=='1'){
	$("#toastingY").prop("checked","checked");
	$("#t_y").css({
		'color' : 'rgb(0, 152, 61)'
	});
} else{
	$("#toastingN").prop("checked","checked");
	$("#t_n").css({
		'color' : 'rgb(0, 152, 61)'
	});
}
$("#menu").val(menu);


var mnumcheck = $("#menu option:selected").val();
if(mnumcheck!="샌드위치 선택"){
	$(".show_hide").hide();
	$("#"+menu+"_show").show();
	$(".menu_show").show();
	$("#index_num").val(val);
		
	
}
var img_code = $("#"+menu+"_img").attr("title");
if(img_code!=null){
	$("#swImg").attr("src","../images/menu/"+img_code+".jpg");
} else {
	$("#swImg").attr("src","");
}
//-----------------------------------------------------------------------


$("#btn_submit").click(function(){
	var menuNum = $("#menu option:selected").val();
	var result = false;
	var check = 0;
	$("."+menuNum+"_sizebox").each(function(){
		if($(this).prop("checked")){
			result=true;
		}
	});
	
	result = result_check("br_choice",check,result);
	check=0;
	result = result_check("t_choice",check,result);
	check=0;
	result = result_check("cz_choice",check,result);
	var count=0;
	if($("#set").prop("checked") && result){
		$(".cookie").each(function(){
			if($(this).prop("checked")){
				count++
			}
		});
		$(".drink").each(function(){
			if($(this).prop("checked")){
				count++
			}
		});
		if(count==0 || count==1){
			result=false;
		}
	}
	if(result){
		frm.submit();
		opener.parent.location="./memberMenuReload";
		window.close();
	} else {
		alert("정보를 다 입력");
	}
	
	

});


$("label").css({
	'cursor':'pointer'
});


$(".so_choice").each(function() {
	if($(this).prop("checked")){
		var img = 'SO_'+$(this).val()+'.jpg';
		var img_id = 'SO_'+$(this).val();
		$("#soImg").append('<div class="imgRemove" id="'+img_id+'"><img style="width: 100px;" alt="" src="../images/ingredient/'+img +'"></div>'); 

	} 
	$(this).click(function() {
		var id = $(this).attr("id");
		id = id + "_sel";
		if ($(this).prop("checked")) {
			$("#" + id).css({
				'color' : 'rgb(0, 152, 61)'
			});
			count++;
			var img = 'SO_'+$(this).val()+'.jpg';
			var img_id = 'SO_'+$(this).val();
			$("#soImg").append('<div class="imgRemove" id="'+img_id+'"><img style="width: 100px;" alt="" src="../images/ingredient/'+img +'"></div>'); 
		} else {
			$("#" + id).css({
				'color' : 'gray'
			});
			count--;
			var img_id = 'SO_'+$(this).val();
			$("#"+img_id).remove();
			
		}

		if (count > 3 && $(this).prop("checked")) {
			alert("소스는 3개");
			$(this).prop("checked", false);
			$("#" + id).css({
				'color' : 'gray'
			});
			count--;
			var img_id = 'SO_'+$(this).val();
			$("#"+img_id).remove();
		}
		console.log(count);

	i
	});
	
	

});

	$(".vg_choice").each(function() {
		$(this).click(function() {
			var id = $(this).attr("id");
			id = id + "_sel";
			if ($(this).prop("checked")) {
				$("#" + id).css({
					'color' : '#f1a03c'
				});

			} else {
				$("#" + id).css({
					'color' : 'gray'
				});

			}

		});
	});

	$(".br_choice").each(function() {
		$(this).click(function() {
			var id = $(this).attr("title");
			$(".br_sel").css({
				'color' : 'gray'
			});
			$("#" + id).css({
				'color' : 'rgb(0, 152, 61)'
			});

			var img = 'BR_'+$(this).val()+'.jpg';
			$("#breadImg").attr("src","../images/ingredient/"+img); 
		});
			var img = 'BR_'+$(this).val()+'.jpg';
			$("#breadImg").attr("src","../images/ingredient/"+img); 

	});

	$(".t_choice").each(function() {
		$(this).click(function() {
			var id = $(this).attr("title");
			$(".t_sel").css({
				'color' : 'gray'
			});
			$("#" + id).css({
				'color' : 'rgb(0, 152, 61)'
			});
		});

	});
	$(".cz_choice").each(function() {
		$(this).click(function() {
			$(".cz_choice").prop("checked", false);
			$(this).prop("checked", true);
			var id = $(this).attr("title");
			$(".cz_sel").css({
				'color' : 'gray'
			});
			$("#" + id).css({
				'color' : 'rgb(0, 152, 61)'
			});
			var img = 'CZ_'+$(this).val()+'.jpg';
			$("#czImg").attr("src","../images/ingredient/"+img); 
		});
			var img = 'CZ_'+$(this).val()+'.jpg';
			$("#czImg").attr("src","../images/ingredient/"+img); 
	});

	$(".ad_choice").each(function() {
		if($(this).prop("checked")){
			var img = 'AD_'+$(this).val()+'.jpg';
			var img_id = 'AD_'+$(this).val();
			$("#adImg").append('<span class="imgRemove" id="'+img_id+'"><img style="width: 100px;" alt="" src="../images/ingredient/'+img +'"></span>'); 
		}
		$(this).click(function() {
			var id = $(this).attr("id");
			id = id + "_sel";
			if ($(this).prop("checked")) {
				$("#" + id).css({
					'color' : 'rgb(0, 152, 61)'
				});
				var img = 'AD_'+$(this).val()+'.jpg';
				var img_id = 'AD_'+$(this).val();
				$("#adImg").append('<span class="imgRemove" id="'+img_id+'"><img style="width: 100px;" alt="" src="../images/ingredient/'+img +'"></span>'); 

			} else {
				$("#" + id).css({
					'color' : 'gray'
				});
				var img_id = 'AD_'+$(this).val();
				$("#"+img_id).remove();
			}
		});
	});

	
	$("#menu").change(function() {
		count = 0;
		$(".imgRemove").remove();
		$("#breadImg").attr("src","");
		$("#czImg").attr("src","");
		$("input").prop("checked", false);
		$(".fas").css({
			'color' : 'gray'
		});
		$(".so_choice").prop("checked", false);
		var menuNum = $("#menu option:selected").val();
		if (menuNum != "샌드위치 선택") {
			var menuPrice = $("#" + menuNum + "_price").attr("title");
			var menuPrice30 = $("#" + menuNum + "_price30").attr("title");
			var commaPrice = addComma(menuPrice);
			var commaPrice30 = addComma(menuPrice30);
			var img_code = $("#"+menuNum+"_img").attr("title");
			$("#swImg").attr("src","../images/menu/"+img_code+".jpg");
			commaPrice = "(" + commaPrice + ")";
			commaPrice30 = "(" + commaPrice30 + ")";
			$("#" + menuNum + "_price").text(commaPrice);
			$("#" + menuNum + "_price30").text(commaPrice30);
		
			console.log("menuNum : " + menuNum);
			console.log($(this).val());
			var id = $(this).val();
			id = id + "_show";
			$(".show_hide").hide();
			$("#" + id).show();
			$(".menu_show").show();

			$("#" + menuNum + "_menuNum").prop("checked", true);

			box(menuNum);
			$("." + menuNum + "_sizebox").click(function() {
				$("." + menuNum + "_sizebox").each(function() {
					box(menuNum);
				});
			});

		} else {
			$("#swImg").attr("src","");
			$(".show_hide").hide();
			$(".menu_show").hide();
			$("input").val("");
			$("#index_num").val(val);
		}

	});
	$(".price").each(function(){
		var price=$(this).text();
		price = addComma(price);
		$(this).text(price);
	});
	function addComma(x) {
		x = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		x = x + "원";
		return x;
	}
	function box(menuNum) {

		if ($("#" + menuNum + "_15").prop("checked")) {
			$("#" + menuNum + "_15box").css({
				'color' : 'rgb(0, 152, 61)'
			});
			$("#" + menuNum + "_30box").css({
				'color' : 'gray'
			});
		} else if ($("#" + menuNum + "_30").prop("checked")) {
			$("#" + menuNum + "_15box").css({
				'color' : 'gray'
			});
			$("#" + menuNum + "_30box").css({
				'color' : 'rgb(0, 152, 61)'
			});
		}

	}

	function result_check(id, check, result) {
		$("." + id).each(function() {
			if ($(this).prop("checked")) {
				check++;
			}
		});
		if (check == 0) {
			result = false;
		}
		return result;
	}
</script>
</html>