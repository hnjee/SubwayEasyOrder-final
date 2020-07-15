<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/headerStyle.css">
<link rel="stylesheet" type="text/css" href="../css/menuSelectStyle.css">
<link rel="stylesheet" type="text/css" href="../css/footerStyle.css">
<meta charset="UTF-8">
<style type="text/css">
.form_box{
	padding: 87px 100px 0 100px;
}
.write_info{
	margin: 30px 0 30px 0;
    padding: 0;
    line-height: 120%;
    font-size: 16px;
    color: #666666;
    font-family: font_ns, sans-serif;
    background-color: #fff;
    overflow: hidden;
    border: 1px solid #e5e5e5;
    padding: 22px 30px;
   
}
.write_left{
	font-weight: bold;
	font-size: 16px;
}
.write_right{
	float: right;
}
.butt{
	height: 50px;
	border-radius: 30px;
	border: 0px;
	font-size: 18px;
	font-weight: bold;
}

</style>
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>


</head>


<body>

	<c:import url="../jsp/header.jsp"></c:import>
	<div class="container" style="margin-bottom: 190px;">
		<div class="row" style="text-align: center;">
			<h2 style="padding: 73px 0 18px; font-weight: bold; font-size: 35px;">정보변경</h2>
			
		</div>
		<form action="../member/memberInfo2" method="POST" name="Update">
		<div class="form_box">
			<div class="write_info" style="border: 0px;">
				<h2 style="font-weight: bold;font-size: 26px; margin-bottom: 26px;">회원가입 정보
				<button style="border:0px; outline:0px; float: right; font-size: 16px;">비밀번호 변경</button>
				</h2>
				
				<div class="write_info">
					<span class="write_left">이름</span><span class="write_right"><input id="name" style="border:1px #9999 solid; outline: 0px;" type="text" value="${member.name }" name="name"></span>
				</div>
				<div id="namec"></div>
				<input hidden="hidden" type="checkbox" id="namebox" class="joinCheck" checked="checked">
				<div class="write_info">
					<span class="write_left">휴대전화</span><span class="write_right"><input id="phone" style="border:1px #9999 solid; outline: 0px;" type="text" value="${member.phone }" name="phone" maxlength="13"> </span>
				</div>
				<div id="phonec"></div>
				<input hidden="hidden" type="checkbox" id="phonebox" class="joinCheck" checked="checked">
			</div>
		</div>
		<div style="text-align: center; margin-top: 100px;">
			<button type="button" class="butt" style="width: 126px; border: 2px #009223 solid;color: #009223;">회원 탈퇴</button>
			<button type="button" id="memberUpdate" class="butt" style="width: 197px; background: #009223;color: white;">회원정보 변경</button>
		</div>
		<input hidden="hidden" type="text" name="id" value="${member.id }">
		</form>
	</div>



	<c:import url="../jsp/footer.jsp"></c:import>
</body>

<script type="text/javascript">
	var check = "${check}";
	if(check=='pass'){
		
	} else {
		location.href="./memberInfo";
	}
	

	var autoHypenPhone = function(str){
	      str = str.replace(/[^0-9]/g, '');
	      var tmp = '';
	      if( str.length < 4){
	          return str;
	      }else if(str.length < 7){
	          tmp += str.substr(0, 3);
	          tmp += '-';
	          tmp += str.substr(3);
	          return tmp;
	      }else if(str.length < 11){
	          tmp += str.substr(0, 3);
	          tmp += '-';
	          tmp += str.substr(3, 3);
	          tmp += '-';
	          tmp += str.substr(6);
	          return tmp;
	      }else{              
	          tmp += str.substr(0, 3);
	          tmp += '-';
	          tmp += str.substr(3, 4);
	          tmp += '-';
	          tmp += str.substr(7);
	          return tmp;
	      }
	  
	      return str;
	}
	var pn = "${member.phone}";
	pn = autoHypenPhone(pn);
	$("#phone").val(pn);

	var phoneNum = document.getElementById('phone');

	phoneNum.onkeyup = function(){
	  console.log(this.value);
	  this.value = autoHypenPhone( this.value ) ;  
	}

	$("#phone").blur(function(){
		var phone = $("#phone").val();
		var phoneCheck = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
		if(phoneCheck.test(phone)){
			$("#phonec").html('');
			$("#phonebox").prop("checked",true);
		} else {
			$("#phonec").html('<div style="color: red;">휴대폰 번호를 정확히 입력해주세요.</div>');
			$("#phonebox").prop("checked",false);

		}
		
	});

	$("#name").blur(function(){
		var name = $("#name").val();
		var nameCheck = /^[가-힣a-zA-Z]{2,12}$/;
		if(nameCheck.test(name)){
	 		$("#namec").html('');
			$("#namebox").prop("checked",true);

		} else {
	 		$("#namec").html('<div style="color: red;">한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)</div>');
			$("#namebox").prop("checked",false);

		}

	});
	$("#memberUpdate").click(function(){
		var result = true;
		$(".joinCheck").each(function(){
			if(!$(this).prop("checked")){
				result = false;
			}
		});
		if(result){
			Update.submit();
		} else{
			alert("정보를 제대로 입력해주세요.");
		}
	});
</script>
</html>