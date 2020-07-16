<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>By Product</title>

	<!-- SideBar(vendor) -->
	<c:import url="../template/vendor.jsp"></c:import>
  
    <!-- Calendar -->
    <c:import url="../template/calendar.jsp"></c:import>
    
	<!-- Bootstrap core JavaScript-->
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>
	<!-- Calendar -->
	<script src="../js/calendar.js"></script>
    
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="../css/by.css"> 

</head>
<body id="page-top">

<!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <c:import url="./sideBar.jsp"></c:import>
    <!-- End of Sidebar -->

	<!-- Main Page -->
	<div class="container">
	
    <!-- header -->
	<c:import url="./adminHeader.jsp"></c:import>
	
	<h3 id="titleName" style="margin-top: 50px;">상품별 매출</h3>
	
	<form action="./byProduct" method="get">
	<div class="serach">
		<div style="padding-top: 25px; margin-bottom: 25px">
          	<i class='fas fa-calendar-alt' style='font-size:20px;'></i>
          	<input type="text" name="from" id="from" readonly="readonly" style="display: inline;" value="${from}"> - 
            <input type="text" name="to" id="to" readonly="readonly" value="${to}">
            <button class="btn-subway" type="submit" id=serach">검색</button>
        </div>
    </div> 
    </form>
    
     <table class="table table-hover" style="text-align: center;">
	    <thead>
	      <tr>
	        <th>카테고리</th>
	        <th>상품명</th>
	        <th>수량</th>
	        <th>매출액</th>
	      </tr>
	    </thead>
	    <tbody>
	    	<tr>
	    		<td colspan="2">총합</td>
	    		<td>${All.allMenuCount}</td>
	    		<td>${All.allMenuPrice}원</td>
	    	</tr>
		    <c:forEach items="${byProduct}" var="P"> 
	      <tr>
	        <td>${P.menuCode}</td>
	        <td>${P.name}</td>
	        <td>${P.productCount}</td>
	        <td>${P.productPrice}원</td>
	      </tr>	   
		    </c:forEach>
	    </tbody>
	  </table>
    
<!-- Pager -->
	<c:if test="${pager.totalPage>0}">
	<div style="margin: 0 auto;">
	  	<ul class="pagination justify-content-center" style="margin:20px 0">	
	  	
	  	<c:if test="${pager.curPage>1}">
			    <li class="page-item"><a class="page-link" href="./byProduct?curPage=${pager.curPage-1}&from=${from}&to=${to}">이전</a></li>
		</c:if>	 
			
	  	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    <li class="page-item"><a class="page-link" href="./byProduct?curPage=${i}&from=${from}&to=${to}">${i}</a></li>
	 	 </c:forEach>
	 	 
	 	 <c:if test="${pager.curPage<pager.totalPage}">
			    <li class="page-item"><a class="page-link" href="./byProduct?curPage=${pager.curPage+1}&from=${from}&to=${to}">다음</a></li>
		</c:if>
		
		</ul>
	
  </div>
</c:if>
    
    </div> <!-- End Main Area -->
    </div>
    
 <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
    
</body>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


</html>