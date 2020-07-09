<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>SUSBWAY'S MANAGMENT INGREDIENT</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>  
	
	<!-- SideBar(vendor) -->
	<c:import url="../template/vendor.jsp"></c:import>   


    <!-- css -->
    <link rel="stylesheet" type="text/css" href="../css/by.css">  

</head>

<body>
<div id="wrapper">
  	<!-- Sidebar -->
  <c:import url="../headOfficeSales/sideBar.jsp"></c:import>
    <!-- End of Sidebar -->
    
		<div class="container">
	    <!-- header -->
		<c:import url="../headOfficeSales/adminHeader.jsp"></c:import>
	
		  <h2>headOfficeProductRegister</h2>
		  <form action="./product${path}" method="post" enctype="multipart/form-data" id="frm">
		  <p>상품 ${path}</p>
			  <div class="form-group">
				 <label for="usr">menuNum:</label>
				 <c:if test="${path eq 'Insert'}">
				 <input type="text" class="form-control" id="ingreNum" name="menuNum" value="">
				 </c:if>
				 <c:if test="${path eq 'Update'}">
			      <input type="text" class="form-control" id="ingreNum" name="menuNum" value="${productVO.menuNum}" readonly="readonly">
			      </c:if>
			   </div>
			  <div class="form-group">
				 <label for="usr">menuCode:</label>
			      <input type="text" class="form-control" id="ingreCode" name="menuCode" value="${productVO.menuCode}">
			   </div>
			   <div class="form-group">
				 <label for="usr">name:</label>
			      <input type="text" class="form-control" id="name" name="name" value="${productVO.name}">
			   </div>
			   <div class="form-group">
				 <label for="usr">menuPrice(15cm):</label>
			      <input type="number" class="form-control" id="price" name="menuPrice" value="${productVO.menuPrice}">
			   </div>
			   <div class="form-group">
				 <label for="usr">menuPrice(30cm):</label>
			      <input type="number" class="form-control" id="price" name="menuPrice30" value="${productVO.menuPrice30}">
			   </div>
			   <div class="form-group">
				 <label for="usr">sale:</label>
			      <input type="number" class="form-control" id="sale" name="sale" value="${productVO.sale}">
			   </div>
			   <div class="form-group">
				 <label for="usr">Contents:</label>
			      <input type="text" class="form-control" id="desc" name="desc" value="${productVO.desc}">
			   </div>
			   
			   <div class="form-group">
			      <input type="file" class="form-control-file border" name="files">
			   </div>
			   
			   <button type="submit" class="btn btn-primary">Submit</button>
		  </form>
		</div>
</div>
</body>

    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- Bootstrap core JavaScript-->
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>
</html>