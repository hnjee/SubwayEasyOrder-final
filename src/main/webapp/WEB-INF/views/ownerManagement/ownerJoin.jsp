<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUSBWAY'S MEMBER MANAGMENT</title>

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
	 	<div id="line" style="border: solid 2.5px white; margin-top: 22.5px" ></div>
		  <p>가맹점 등록</p>
		  <form action="./ownerJoin" method="post" enctype="multipart/form-data" id="frm">
			  <div class="form-group">
				 <label for="usr">아이디:</label>
			      <input type="text" class="form-control" id="id" name="id" >
			   </div>
			  <div class="form-group">
				 <label for="usr">비밀번호:</label>
			      <input type="password" class="form-control" id="pw" name="pw">
			   </div>
<!-- 			   <div class="form-group">
				 <label for="usr">매장이름:</label>
			      <input type="text" class="form-control" id="name" name="name">
			   </div>
			   <div class="form-group">
				 <label for="usr" style="display: block;">핸드폰번호:</label>
			      <input style="width: 50px;display: inline;" type="tel" class="form-control" id="phone" name="phone" maxlength="4">-
			      <input style="width: 50px;display: inline;" type="tel" class="form-control" id="phone2" name="phone2" maxlength="4">-
			      <input style="width: 50px;display: inline;" type="tel" class="form-control" id="phone3" name="phone3" maxlength="4">
			   </div> -->
			   <div class="form-group">
				 <label for="usr">매장번호:</label>
			      <input type="text" class="form-control" id="storeNum" name="storeNum">
			   </div>
			   <div class="form-group">
				 <label for="usr">직책번호:</label>
			      <input type="text" class="form-control" id="level" name="level">
			   </div>
			   			   
			   <button type="submit" class="btn btn-primary">Submit</button>
		  </form>
		</div>
		

    
 
    
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
</html>