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
    width: 80px;
}
</style>
</head>
<div>
	 	 <a href="../"><img class="Sales Management" alt="" src="../images/subway_logo.png" style="margin:80px 400px 0px" ></a>
	 		 <div class="owner_id" style="margin-left:90%;">${member.id}</div>
	 <div id="line" style="border: solid 2.5px white; margin-top: 23px" ></div>
</div>