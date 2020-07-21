<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SUSBWAY'S MANAGMENT</title>

	<!-- SideBar(vendor) -->
	<c:import url="../template/vendor.jsp"></c:import>
	    
	<!-- Calendar -->
	<c:import url="../template/calendar.jsp"></c:import>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- Bootstrap core JavaScript-->
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>

	
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="../css/by.css">  
	
</head>

<body id="page-top">
 <div id="wrapper">

    <!-- Sidebar -->
    <c:import url="./sideBar.jsp"></c:import>
    <!-- End of Sidebar -->
    
	<div class="container">
    <!-- header -->
	<c:import url="./adminHeader.jsp"></c:import>
	
	<h3 id="titleName" style="margin-top: 50px;">요일별 매출</h3>
	
	<form action="./byDay">
	<div class="serach">
		<div style="padding-top: 25px; margin-bottom: 25px;">
            <i class='fas fa-calendar-alt' style='font-size:20px;'></i> <input type="text"  value="${from}" id="from" name="from" readonly="readonly" style="display: inline;"> - 
            <input type="text" id="to" name="to" readonly="readonly" value="${to}"> 
            <input hidden="" name="today" value="" id="today">
            <button class="btn-subway" type="submit">검색</button>
        </div>
    </div>
    </form>
		
	  <table>
	    <thead>
	      <tr>
	        <th>요일</th>
	        <th>총합</th>
	        <th>카드</th>
	        <th>빌수</th>
	      </tr>
	    </thead>
	    
	    <c:forEach items="${dayList}" var="vo"> 
	    <tbody>
	      <tr>
	        <td>${vo.day2}</td>
	        <td><fmt:formatNumber value="${vo.totalPrice}" type="number"></fmt:formatNumber>원</td>
	        <td><fmt:formatNumber value="${vo.totalPrice}" type="number"></fmt:formatNumber>원</td>
	        <td>${vo.count}건</td>

	      </tr>	   
	    </tbody>
	    </c:forEach>
	  </table>
    
    
    
    
    </div><!-- end container -->
    
 </div><!-- end wrapper -->   
  
      <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

</body>
	<!-- calendar.js -->
	<script src="../js/calendar.js"></script>
	
	<script src="../js/by.js"></script>
</html>