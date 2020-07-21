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
	width: 160px;
	display: inline-block;
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
.txt {
    margin-bottom: 30px;
    font-size: 20px;
    line-height: 32px;
    letter-spacing: -1px;
    color: #666666;
    text-align: center;
}
input::placeholder {
  color: gray;
  font-weight: bold;
  opacity: 0.6;
}
#msg{
	position: relative;
    margin: 16px 0 35px;
    padding-left: 20px;
    font-size: 16px;
    line-height: 26px;
    color: #999999;
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
				<button id="pwChange" type="button" style="border:0px; outline:0px; float: right; font-size: 16px;">비밀번호 변경</button>
				</h2>
				
				<div class="write_info">
					<span class="write_left">이름<img style="margin-left: 5px;" alt="" src="../images/icon_ess.png"></span><span class="write_right"><input id="name" style="border:0px; outline: 0px;" type="text" value="${member.name }" name="name"></span>
				</div>
				<div id="namec"></div>
				<input hidden="hidden" type="checkbox" id="namebox" class="joinCheck" checked="checked">
				<div class="write_info">
					<span class="write_left">휴대전화<img style="margin-left: 5px;" alt="" src="../images/icon_ess.png"></span><span class="write_right"><input id="phone" style="border:0px; outline: 0px;" type="text" value="${member.phone }" name="phone" maxlength="13"> </span>
				</div>
				<div id="phonec"></div>
				<input hidden="hidden" type="checkbox" id="phonebox" class="joinCheck" checked="checked">
			</div>
		</div>
		<div style="text-align: center; margin-top: 100px;">
			<button type="button" id="memberSecession" class="butt" style="width: 126px; border: 2px #009223 solid;color: #009223;">회원 탈퇴</button>
			<button type="button" id="memberUpdate" class="butt" style="width: 197px; background: #009223;color: white;">회원정보 변경</button>
		</div>
		<input hidden="hidden" type="text" name="id" value="${member.id }">
		</form>
	</div>


	<!-- Modal -->
  <div class="row modal fade" id="myModal" role="dialog">
    <div class="modal-dialog" style="width:60%; height:90%;">
     <button type="button" style="margin-top:30px; width: 30px; opacity: 1;" class="close" data-dismiss="modal"><img src="../images/icon_popup_close.png"></button>
    <div style="width:95%;height:100%; background-color: #ffc300; border-radius: 30px;">
      <!-- Modal content-->
      <div class="modal-content" style=" padding:40px 50px; top:3%; margin:auto; background: white; width: 95%; height: 95%; border-radius: 30px">
        	<h2 style="margin-bottom:50px; padding-bottom:30px; text-align: center; color: #009223;font-weight: bold; border-bottom: 5px solid #009223;">비밀번호 변경</h2>
       		<p class="txt">개인정보 보호를 위해 주기적으로 변경해 주세요.<br>
				타인에게 비밀번호가 노출되지 않도록 주의해 주세요.
			<div class="write_info">
				<span class="write_left">현재 비밀번호<img style="margin-left: 5px;" alt="" src="../images/icon_ess.png"></span><input id="now_pw" placeholder="현재 비밀번호"  style="border:0px; outline: 0px;" type="password"  >
			</div>
			<div class="write_info">
				<span class="write_left">새 비밀번호<img style="margin-left: 5px;" alt="" src="../images/icon_ess.png"></span><input id="pw" name="pw" placeholder="비밀번호 변경"  style="border:0px; outline: 0px;" type="password" maxlength="13"> 
			</div>
			<p id="msg">4~12자 영문 대 소문자, 숫자, 특수문자를 사용하세요.<br>반드시 현재의 비밀번호와 다르게 입력해 주세요.
			<div class="write_info">
				<span class="write_left" style="">새 비밀번호 확인<img style="margin-left: 5px;" alt="" src="../images/icon_ess.png"></span><input id="pwCheck" placeholder="비밀번호 변경" style="border:0px; outline: 0px;" type="password"  maxlength="13">
			</div>
			<span id="wrong-msg" style="color: #ff4b06;font-size: 16px; font-weight: bold;"></span>
			<div style="text-align: center;">
				<button data-dismiss="modal" class="butt" style="width: 126px; border: 2px #009223 solid;color: #009223;" type="button">취소</button>
				<button type="button" id="change_btn" class="butt" style="margin-left:7px; width: 126px; background: #009223;color: white;">변경하기</button>
			</div>
			
      </div>
    </div>
      
    </div>
  </div>
  

	<c:import url="../jsp/footer.jsp"></c:import>
</body>

<script type="text/javascript">
	$("#change_btn").click(function(){
		var now_pw = $("#now_pw").val();
		$.ajax({
			type:'post',
			url:'member/pwCheck',
			data:{
				now_pw:now_pw
			}, success:function(data){
				if(data){
					var pw = $("#pw").val();
					var id = "${member.id}";
					var pwCheck=$("#pwCheck").val();
					var check = /^(?=.*\d)(?=.*[a-z])^[a-z0-9A-Z!@#\$%\^\&*\)\(+=._-]{4,12}$/;
					if(check.test(pw)){
						if(pw==pwCheck){
							$("#wrong-msg").text("");
							if(pw==now_pw){
								$("#wrong-msg").text("현재 비밀번호와 다른 비밀번호로 변경해주세요.");	
							} else{
								$.ajax({
									type:'post',
									url:'member/pwUpdate',
									data:{
										id:id,
										pw:pw
									},success:function(data){
										$("#pw").html(data);
									}
									
								});

							}
						} else{
							$("#wrong-msg").text("비밀번호가 일치하지 않습니다.");
						}
					}else{
						$("#wrong-msg").text("비밀번호 양식을 맞춰주세요.");
						alert("비밀번호 양식을 맞춰주세요.");
					}
				} else{
					alert("현재비밀번호가 맞지않습니다.");
				}
			}
		});
		
	});
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

	function popup(){
		var url="myMenuCustom";
		var name="test";
		var option="width=500,height=500,location=no";
		window.open(url,name,option);
	}
	$("#pwChange").click(function(){
		$("#myModal").modal();
	});

	$("#memberSecession").click(function(){
		if(confirm("정말 탈퇴 하시겠습니까?")){
			location.href="./memberSecession";
		}
	});
</script>
</html>