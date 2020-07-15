<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SUSBWAY'S MANAGMENT</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>


	<!-- SideBar(vendor) -->
	<c:import url="../template/vendor.jsp"></c:import>   


    <!-- css -->
    <link rel="stylesheet" type="text/css" href="../css/by.css">  
    <link rel="stylesheet" type="text/css" href="../css/ingredient.css">  

</head>

<body>
 <div id="wrapper">

    <!-- Sidebar -->
    <c:import url="../headOfficeSales/sideBar.jsp"></c:import>
    <!-- End of Sidebar -->
    
	<div class="container">
	 <a href="../"><img class="Sales Management" alt="" src="../images/subway_logo.png" style="margin:30px 400px 0px" ></a>
	 	 <div style="margin-left:88%" value="${storeName}">${storeName}</div>
	 <div id="line" style="border: solid 2.5px white; margin-top: 22.5px" ></div>
	<h3 id="titleName" style="margin-top: 50px;">가맹점 관리</h3>

	<form action="./ownerList">
		<div class="serach">

		    <select class="" id="iSearch" name="kind">
			    <option value="name">매장이름</option>
				<option value="address">주소</option>
				<option value="storeNum">매장번호</option>
			</select>
			 
			<span style="padding-top: 25px; margin-bottom: 25px;">  
	            <input type="text" id="search" name="search">
	           <button class="btn btn-default" type="submit"><i class='fas fa-search'></i></button> 
	          	<span style="font-size: 12px; font-weight:bolder; cursor: pointer;" id="bestList" title="${vo.storeNum}">베스트매장순</span>
	          	<span style="margin-left:10px; font-size: 12px; font-weight:bolder; cursor: pointer;"title="${vo.storeNum}" >워스트매장순</span>
		        <span style="margin-left: 35%;cursor: pointer; padding: 4px;" class=del-btn-all >선택삭제</span>
				<span style="cursor: pointer;" id="bestReset" class=bestStore title="${vo.storeNum}" >리셋</span>
				<span style="cursor: pointer;" id=bestClick class=bestStore >확인</span>
	        </span> 
	    </div>
    </form>

	  <table>
	    <thead>
	      <tr>    
	        <th><input class="checks" id="allCheck" type="checkbox"></th>
	        <th>매장이름(번호)</th>
	        <th>주소</th>
	        <th>매장연락처</th>
	        <th>주문여부</th>
	        <th>평점</th>
	        <th>매장선정</th>
	        <th>비고</th>
	      </tr>
	    </thead>
	    
	    <c:forEach items="${ownerList}" var="vo"> 
	    <tbody>
	      <tr>
	       <td><input class="rowCheck checks" type="checkbox" name="${vo.storeNum}" ></td>
	        <td>${vo.name}(${vo.storeNum})</td>
	        <td>${vo.address}</td>
	        <td>${vo.telNumber}</td>
 			<c:if test="${vo.orderable eq '0'}">
	        <td>주문 불가능</td>
	        </c:if> 
	        <c:if test="${vo.orderable eq '1'}">
	        <td>주문 가능</td>
	        </c:if> 
	        <td>${vo.storeScore}점</td>
	         <c:if test="${vo.best eq '0'}">
	        <td>일반매장</td>
	        </c:if> 
	        <c:if test="${vo.best eq '1'}">
	        <td>베스트매장</td>
	        </c:if> 
	        <td>	      
			<div><button class="btn-subway-gray deleteOne" type="button" title=${vo.storeNum}> 삭제</button></div>
	        </td>			
	      </tr>	   
	    </tbody>
	    </c:forEach>
	  </table>
	     
<!-- Paging -->
<c:if test="${pager.totalPage>0}">
	<div style="margin: 0 auto;">
	  	<ul class="pagination justify-content-center" style="margin:20px 0">	
	  	
	  	<c:if test="${pager.curPage>1}">
			    <li class="page-item"><a class="page-link" href="./ownerList?curPage=${pager.startNum-1}">이전</a></li>
		</c:if>	 
			
	  	<c:forEach begin="${pager.startNum}" end="${pager.lastNum-1}" var="i">
			    <li class="page-item"><a class="page-link" href="./ownerList?curPage=${i}">${i}</a></li>
	 	 </c:forEach>
	 	 
	 	 <c:if test="${pager.curPage+1<pager.totalPage}">
			    <li class="page-item"><a class="page-link" href="./ownerList?curPage=${pager.lastNum+1}">다음</a></li>
		</c:if>
		
		</ul>
  </div>
	</c:if>
 <!-- Paging end -->  
    
    
    </div><!-- end container -->
    
 </div><!-- end wrapper -->   
  
      <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

</body>
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- Bootstrap core JavaScript-->
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>
	<!-- calendar.js -->
	<script src="../js/calendar.js"></script>
	
	<script src="../js/owner/ownerList.js" type="text/javascript"></script>


</html>