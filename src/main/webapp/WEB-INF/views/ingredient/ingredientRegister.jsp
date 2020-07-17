<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>SUSBWAY'S MANAGMENT INGREDIENT</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>  
	
<%-- 	<!-- SideBar(vendor) -->
	<c:import url="../template/vendor.jsp"></c:import>  --%>

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"> 
 
    <!-- Custom styles for this template-->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">
    
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="../css/by.css">  
    <link rel="stylesheet" type="text/css" href="../css/ingredient.css">  

</head>

<body id="page-top">
<div id="wrapper">
  <!-- Sidebar -->
    <c:import url="../headOfficeSales/sideBar.jsp"></c:import>
    <!-- End of Sidebar -->
    
		<div class="container">
	    <!-- header -->
		<c:import url="../headOfficeSales/adminHeader.jsp"></c:import>
		
		  <p>재료등록</p>
		  <form action="${path}" method="post" enctype="multipart/form-data" id="frm">
			  <div class="form-group">
				 <label for="usr">ingreNum:</label>
			      <input type="text" class="form-control" id="ingreNum" name="ingreNum" value="${ingredientVO.ingreNum}">
			   </div>
			  <div class="form-group">
				 <label for="usr">ingreCode:</label>
			      <input type="text" class="form-control" id="ingreCode" name="ingreCode" value="${ingredientVO.ingreCode}">
			   </div>
			   <div class="form-group">
				 <label for="usr">name:</label>
			      <input type="text" class="form-control" id="name" name="name" value="${ingredientVO.name}">
			   </div>
			   <div class="form-group">
				 <label for="usr">price:</label>
			      <input type="text" class="form-control" id="price" name="price" value="${ingredientVO.price}">
			   </div>
			   <div class="form-group">
				 <label for="usr">sale:</label>
			      <input type="text" class="form-control" id="sale" name="sale" value="${ingredientVO.sale}">
			   </div>
			   <div class="form-group">
			      <input type="file" class="form-control-file border" name="files"> <!--controller에 있는 파라미터 이름을 맞춰야 함 -->
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