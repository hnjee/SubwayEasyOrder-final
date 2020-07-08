<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${check eq 'fail'}">
	<div style="color: red;">${msg }<input type="checkbox" class="joinCheck" hidden="hidden"></div>
</c:if>
<c:if test="${check ne 'fail'}">
	<div style="color: green;">${msg } <input class="joinCheck" type="checkbox" checked="checked" hidden="hidden"></div>
</c:if>
