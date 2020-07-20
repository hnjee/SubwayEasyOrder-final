<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<style type="text/css">
.owner_id{
    display: block;
    border: 1px solid #dddddd;
    border-radius: 50px;
    height: 28px;
    line-height: 28px;
    background-color: #fff;
    color: #666666;
    font-size: 18px;
    letter-spacing: -0.02em;
    padding: 0 13px;
    width: 115px;
}
</style>
</head>
<div>
 <a href="${pageContext.request.contextPath}/member/adminIndex"><img class="Sales Management" alt="" src="../images/subway_logo.png" style="margin:70px 400px 0px" ></a>
	 <div class="owner_id" style="margin-left:88%;">${member.id}</div>
	 
	 <div id="line" style="border: solid 2.5px white; margin-top: 33px" ></div>
</div>