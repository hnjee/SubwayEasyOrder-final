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
			    <option value="id">아이디</option>
				<option value="name">매장이름</option>
				<option value="storeNum">매장번호</option>
			</select>
			 
			<span style="padding-top: 25px; margin-bottom: 25px;">  
	            <input type="text" id="search" name="search">
	           <button class="btn btn-default" type="submit"><i class='fas fa-search'></i></button> 
	        </span> 
	        <input style="margin-left: 58%;" type="button" class=del-btn-all value="선택삭제">

	    </div>
    </form>

	  <table>
	    <thead>
	      <tr>    
	        <th><input class="checks" id="allCheck" type="checkbox"></th>
	        <th>아이디</th>
	        <th>매장이름</th>
	        <th>매장연락처</th>
	        <th>매장고유번호</th>
	        <th>직급</th>    
	        <th> 비고</th>
	      </tr>
	    </thead>
	    
	    <c:forEach items="${ownerList}" var="vo"> 
	    <tbody>
	      <tr>
	       <td><input class="rowCheck checks" type="checkbox" name="${vo.id}" ></td>
	        <td>${vo.id}</td>
	        <td>${vo.name}</td>
	        <td>${vo.phone}-${vo.phone2}-${vo.phone3}</td>
	        <td>${vo.storeNum}</td>
			<c:if test="${vo.level eq '1'}">
	        <td>${vo.name} 직원</td>
	        </c:if> 
	        <c:if test="${vo.level eq '2'}">
	        <td>${vo.name} 점주</td>
	        </c:if> 
	        <td>
	        <div><a href="./ownerUpdate?id=${vo.id}"><button class="btn-subway-gray" type="button"> 수정</button></a></div>
			<div><a href="./ownerDelete?id=${vo.id}"><button class="btn-subway-gray deleteOne" type="button"> 삭제</button></a></div>
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
			
	  	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    <li class="page-item"><a class="page-link" href="./ownerList?curPage=${i}">${i}</a></li>
	 	 </c:forEach>
	 	 
	 	 <c:if test="${pager.curPage<pager.totalPage}">
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

</html>