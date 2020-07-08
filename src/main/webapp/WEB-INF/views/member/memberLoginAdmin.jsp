<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUBWAY SHOP ADMIN</title>
<c:import url="../template/boot.jsp"></c:import>
<link href="../css/subway/ui.adminLogin.css" rel="stylesheet" type="text/css">
</head>
<body>
	<body id="login_wrapper">
<div class="logo">
    <a href="/">
        <img src="../images/logo_sm.png" alt="">
    </a>
</div>

<div class="login_content">
	
	<form action="./memberLoginAdmin" method="post">
    <h3>SUBWAY 매장관리자 사이트 로그인</h3>
    <div class="form-group">
        <input type="text" class="form-text" style="font-size:14px; width: 400px;" name="id" placeholder="아이디" id="username" value="">
    </div>
    <div class="form-group">
        <input type="password" class="form-text" style="font-size:14px; width: 400px;" name="pw" placeholder="비밀번호" id="password" value="">
    </div>

    <button type="submit" class="btn_login" id="ui_login_btn">로그인</button>
    <p>
        <a href="/managerResetPw">관리자 비밀번호 초기화</a>
    </p>
    <p>
        본 시스템은 등록된 관리자에 한하여 사용하실 수 있습니다.<br>
        불법적인 접근 및 사용 시 관련 법규에 의해 처벌 될 수 있습니다.
    </p>
    </form>
</div>
<div class="copyright">© 2017 Doctor’s Associates Inc. SUBWAY® is a registered trademark of Doctor’s Associates Inc.. All rights reserved.</div>




	
	
	
</body>
</html>