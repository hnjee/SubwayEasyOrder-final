<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"  href="../css/headerStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/menuSelectStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/footerStyle.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style type="text/css">


div{
	font-size: 15px;
	font-weight: bold;
	margin-bottom: 10px;
}
.form-group{
	padding-bottom: 50px;
}


</style>
</head>
<body>
<c:import url="../jsp/header.jsp"></c:import>
	<div class="container" style="padding-bottom: 100px;">
		<div class="row" style="text-align: center;">
			<h1 style="font-weight: bold; ">회원가입</h1>
		</div>
		<div class="row">
			
			<div class="col-sm-3"></div>
			<div class="col-sm-5">
				<form action="./memberJoin2" method="post" id="frm">
					<div class="form-group">
						<label class="control-label col-sm-2" for="id"></label>
						<div class="col-sm-10">
							<div>아이디</div>
							<input type="text" class="form-control" id="id"
								placeholder="Enter ID" name="id" maxlength="12">
							<div id="idCheck">
								<input type="checkbox" class="joinCheck" hidden="hidden">
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="pw"></label>
						<div class="col-sm-10">
							<div>비밀번호</div>
							<input type="password" class="form-control" id="pw"
								placeholder="Enter Password" name="pw" maxlength="12">
							<div id="pc">
							
							</div>
							<input type="checkbox" id="pcbox" class="joinCheck" hidden="hidden">
						</div>
						
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="pwCheck"></label>
						<div class="col-sm-10">
							<div>비밀번호 확인</div>
							<input type="password" class="form-control" id="pwCheck"
								placeholder="Enter Password" name="pwCheck" maxlength="12">
							<div id="pc2">
							
							</div>
							<input type="checkbox" id="pcbox2" class="joinCheck" hidden="hidden">
						</div>
						
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2" for="name"></label>
						<div class="col-sm-10">
							<div>이름</div>
							<input type="text" class="form-control" id="name"
								placeholder="Enter Name" name="name" maxlength="12">
							<div id="namec">
							
							</div>
							<input type="checkbox" id="namebox" class="joinCheck" hidden="hidden">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2" for="phone"></label>
						<div class="col-sm-10">
							<div>휴대폰 번호</div>
							<input type="text" class="form-control" id="phone"
								placeholder="Enter Phone" name="phone" maxlength="13">
								
							<div id="phonec">
							
							</div>
							<input type="checkbox" id="phonebox" class="joinCheck" hidden="hidden">
						</div>
					</div>

					
				<div class="form-group">
					<label class="control-label col-sm-2"></label>
					<div class="col-sm-10">
						<div class="btn" id="btn"
						 style="width:100%; height:60px;
						  background-color:rgb(0, 152, 61);
						  font-size:20px; text-align:center; color: white; padding-top: 15px;">가입하기</div>
					</div>
				</div>	
				</form>
				
				
				
			
			
			
			</div>
			<div class="col-sm-3">
				
			</div>
			
		
		</div>
	
	</div>
	
	
		<c:import url="../jsp/footer.jsp"></c:import>
	
	
</body>

<script type="text/javascript">
	$("#id").blur(function(){
		var id = $("#id").val();
		$.ajax({
			type:'post',
			url:'member/idCheck',
			data : {
				id:id
			}, success: function(data){
				$("#idCheck").html(data.trim());
			}
		});
		
		
		
	});
	$("#pw").blur(function(){
		var pw = $("#pw").val();
		var pwCheck = /^(?=.*\d)(?=.*[a-z])^[a-z0-9A-Z!@#\$%\^\&*\)\(+=._-]{4,12}$/;
		if(pwCheck.test(pw)){
			$("#pc").html('<div style="color: green;">사용가능합니다.</div>');
			$("#pcbox").prop("checked",true);
		} else {
			$("#pc").html('<div style="color: red;">4~12자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</div>');
			$("#pcbox").prop("checked",false);
			$("#pw").val("");
		}
		$("#pwCheck").val("");
		$("#pc2").html('');
		$("#pcbox2").prop("checked",false);
		
	});
	$("#pwCheck").blur(function(){
		var pw = $("#pw").val();
		var pwCheck = $("#pwCheck").val();
		if(pw==pwCheck && pwCheck!=""){
			$("#pc2").html('<div style="color: green;">비밀번호가 일치합니다.</div>');
			$("#pcbox2").prop("checked",true);
		} else {
			$("#pc2").html('<div style="color: red;">비밀번호가 일치하지 않습니다.</div>');
			$("#pcbox2").prop("checked",false);
			$("#pw2").val("");

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

	$("#btn").click(function(){
		var check = true;
		$(".joinCheck").each(function(){
			if(!$(this).prop("checked")){
				check = false;
			}
		});
		if(check){
			$("#frm").submit();
			console.log("check");
		} else {
			alert("항목을 정확히 입력해주세요.");
		} 

	});
	$("#footer").css({
		'margin-bottom':'0px'
	});
	
	
</script>
</html>