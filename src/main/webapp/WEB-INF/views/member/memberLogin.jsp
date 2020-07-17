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
</head>
<body>
<c:import url="../jsp/header.jsp"></c:import>
	<div class="container" style="position: relative;">
		<div class="row" style="text-align: center;">
			<a href="/">
				<img alt="" src="../images/subway_logo.jpg" width="200px;"height="112.44px;" >
			</a>
		</div>
		<div class="row" style="text-align: center;">
			
			<div class="col-sm-4"></div>
			<div class="col-sm-4" style="padding: 0px; margin-left: 30px;">
				<form action="./memberLogin" method="post">
					<div class="form-group">
						
						<div class="col-sm-12" style="margin-bottom: 15px;">
							<input style="height: 60px;" type="text" class="form-control" id="id"
								placeholder="아이디" name="id" maxlength="12">
							
						</div>
					</div>

					<div class="form-group">
						
						<div class="col-sm-12" style="margin-bottom: 15px;">
							<input style="height: 60px;" type="password" class="form-control" id="pw"
								placeholder="비밀번호" name="pw" maxlength="12">
							
						</div>
						
					</div>



	
					<div class="col-sm-12">
						<button type="submit" style="width: 100%; height: 50px; background-color: rgb(0, 152, 61);color: white; border-radius: 5px; border: 0px;">로그인</button>
					</div>
				</form>
				<div style="margin-top: 30px;" class="col-sm-12">
					
					<button id="memberJoin" style="width:100%; height: 40px; border: 0px; outline: white;">회원가입</button>
					
					
				</div>
				
				
			</div>
			<div class="col-sm-4">
				
			</div>
			
		</div>
	
	</div>
	<div style="position: absolute; bottom:0; width: 100%;">
	<c:import url="../jsp/footer.jsp"></c:import>
	</div>
</body>
<script type="text/javascript">
	$("#memberJoin").click(function(){
		location.href="./memberJoin";
	});
</script>
</html>