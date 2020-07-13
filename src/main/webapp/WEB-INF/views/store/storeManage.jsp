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

 <base target="_self">
</head>
<body>
 <div id="wrapper">
 	<!-- Sidebar -->
    <c:import url="../sales/sideBar.jsp"></c:import>
    <!-- End of Sidebar -->
    
    
    <div class="container">
    
    <!-- header -->
	<c:import url="../sales/adminHeader.jsp"></c:import>
	
	<h3 id="titleName" style="margin-top: 50px;">매장 정보 관리</h3>
	
	<form action="./storeManage" method="post">
		<div style="line-height: 18px;">		
		    
					<div class="form-group">
						<label class="control-label col-sm-2" for="name"></label>
						<div class="col-sm-10">
							<div>매장 명</div>
							<input type="text" class="form-control" 
								placeholder="Enter ID" name="name" value="${store.name}" readonly="readonly">						
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="address"></label>
						<div class="col-sm-10">
							<div>매장 주소</div>
							<input type="text" class="form-control"
								value="${store.address}" name="address">													
						</div>
						
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="telNumber"></label>
						<div class="col-sm-10">
							<div>매장 전화번호 ( - 포함 )</div>
							<input type="text" class="form-control"
								value="${store.telNumber}" name="telNumber">
						</div>
						
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2" for="hours"></label>
						<div class="col-sm-10">
							<div>영업 시간 ( 오픈 시간 ~ 마감 시간 )</div>
							<input type="text" class="form-control"
								value="${store.hours}" name="hours">
						</div>
					</div>
					
					

					
				<div class="form-group">
					<label class="control-label col-sm-2"></label>
					<div class="col-sm-10">
						<button type="submit" class="btn" id="btn"
						 style="width:60%; height:60px;
						  background-color:green;margin-left:190px;
						  font-size:18px; text-align:center; color: white; padding-top: 15px;">수정하기</button>
					</div>
				</div>	
				
			 
			

	    </div>
    </form>
	       






    </div><!-- end container -->
    
 </div><!-- end wrapper -->   
  
      <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

</body>

	<!-- Custom scripts for all pages-->
	<script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>
	<!-- Bootstrap core JavaScript-->
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- productList -->
	<script src="../js/product/productList.js"></script>
</html>