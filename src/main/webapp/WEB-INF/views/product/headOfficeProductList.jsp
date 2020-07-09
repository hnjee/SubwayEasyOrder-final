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
	<link rel="stylesheet" type="text/css" href="../css/productListStyle.css">

</head>
<body>
 <div id="wrapper">
 	<!-- Sidebar -->
    <c:import url="../headOfficeSales/sideBar.jsp"></c:import>
    <!-- End of Sidebar -->
    
    
    <div class="container">
    
    <!-- header -->
	<c:import url="../headOfficeSales/adminHeader.jsp"></c:import>
	
	<h3 id="titleName" style="margin-top: 50px;">상품 관리</h3>
	
	<form action="./headOfficeProductList">
		<div class="serach">
		
		    <select class="" id="iSearch" name="kind">
			    <option value="menuNum">메뉴번호</option>
			    <option value="menuCode">메뉴코드</option>
				<option value="name">메뉴이름</option>
				<option value="sale">판매여부</option>
			</select>
			 
			<span style="padding-top: 25px; margin-bottom: 25px;">  
	            <input type="text" id="search" name="search">
	           <button class="btn btn-default" type="submit"><i class='fas fa-search'></i></button> 
	        </span> 
			<input type="button" class="btn-subway-gray SD" value="선택삭제">
	    </div>
    </form>
	       <table>
	    <thead>
	      <tr>
	      	<th><input class="checks" id="allCheck" type="checkbox"></th>    
	        <th>메뉴번호</th>
	        <th>메뉴코드</th>
	        <th>메뉴명</th>
	        <th>가격(15cm)</th>
	        <th>가격(30cm)</th>
	        <th>단종여부</th>
	        <th> 비고</th>

	      </tr>
	    </thead>
	    
	    <c:forEach items="${product}" var="vo"> 

	    <tbody>
	      <tr>
	      	<td><input class="rowCheck checks" type="checkbox" name="${vo.menuNum}" ></td>
	        <td id="num">${vo.menuNum}</td>
	        <td>${vo.menuCode}</td>
	        <td>${vo.name}</td>
	        <td>${vo.menuPrice}원</td>
	        <td>${vo.menuPrice30}원</td>
	        <c:if test="${vo.sale eq '0'}">
	        <td>단종</td>
	        </c:if> 
	        <c:if test="${vo.sale eq '1'}">
			<td>판매중</td>
			</c:if> 
			<td>
			<c:if test="${vo.sale eq '0'}">
			<div><button class="btn-subway-gray Soldout" type="button" data-toggle="modal" data-target="#myModal" data-notifyid="${vo.menuNum}" data-nonotifyid="${vo.sale}" >품절 해제</button></div>
			</c:if>
			
			<c:if test="${vo.sale eq '1'}">
			<div><button class="btn-subway-gray Soldout" type="button" data-toggle="modal" data-target="#myModal" data-notifyid="${vo.menuNum}" data-nonotifyid="${vo.sale}">품절</button></div>
			</c:if>
			
			<div><a href="./productUpdate?menuNum=${vo.menuNum}"><button class="btn-subway-gray" type="button"> 수정</button></a></div>
			<div><button class="btn-subway-gray del" type="button" title="${vo.menuNum}"> 삭제</button></div>
			</td>
	
	      </tr>	   
	    </tbody>
	    </c:forEach>
	  </table>
	  
	 <!-- modal -->
<div class="modal modal-center fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-center" role="document">
    <div class="modal-content">
    
       <div class="modal-header">
       <div class="subway_logo1"style="text-align: center; margin-left: 30%;" href="./headOfficeProductList" >
        <img src="../images/subway_logo.png" alt="X">
        <div class="modal-title" id="myModalLabel" style="font-size:24px; padding-top: 15px;">품절 안내</div>
        </div> 
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        
        <div class="modal-body"style="padding:40px 40px; text-align: center;" >  
        
         <div style="display: none; font-size: 18px;" class="title0"> 단종 하시겠습니까?</div>
 
         <div style="display: none; font-size: 18px;" class="title1"> 단종 해제 하시겠습니까?</div>
        
       
        <div class="btn">
        <button type="button" class="btn btn-success" id="yes" style="margin: 3px 3px 0px 5px">YES</button>
        <button type="button" class="btn btn-subway-gray" data-dismiss="modal">NO</button>
        </div>
        <div class="cado title0" ><img src="../images/cado.png"  style="width:110px;" alt="cado"></div>
		<div class="cado2 title1" ><img src="../images/cado2.png"  style="width:110px; height: 152px;" alt="cado2"></div>
     </div> 
    </div>
  </div>
</div> 
<!-- end Modal -->
	  
	  

	<!-- Pager -->
	
	<c:if test="${pager.totalPage>0}">
	<div style="margin: 0 auto;">
	 <ul class="pagination justify-content-center" style="margin:20px">
	 <c:if test="${pager.curPage>1}">
		<li class="page-item" ><a class="page-link" href="./headOfficeProductList?curPage=${pager.curPage-1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
	</c:if>
	
	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
		 <li class="page-item"><a class="page-link" href="./headOfficeProductList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
	</c:forEach>
	
	<c:if test="${pager.curPage<pager.totalPage}">
	  	<li class="page-item"><a class="page-link" href="./headOfficeProductList?curPage=${pager.curPage+1}&kind=${pager.kind}&search=${pager.search}">다음</a></li>
	</c:if>
	 </ul>
	</div>
</c:if>
    </div><!-- end container -->
 </div><!-- end wrapper -->   
  
      <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
	     

</body>

	<!-- Bootstrap core JavaScript-->
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>

	<script src="../js/product/headOfficeProductList.js"></script>

	
</html>