<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SUBWAY SHOP ADMIN</title>
<c:import url="../template/boot.jsp"></c:import>
<!-- Custom fonts for this template-
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
-->

<!-- Custom styles for this template-->
<link href="../payment/css/sb-admin-2.min.css" rel="stylesheet">
<style type="text/css">
body{
	font-size: 17px;
}
.text-xs {
    font-size: 14px;
}
.container, .container-fluid, .container-lg, .container-md, .container-sm, .container-xl {
    padding-left: 250px;
    padding-right: 250px;
}
.h5, h5 {
    font-size: 20px;
}
.h6, h6 {
    font-size: 14px;
}
.dropdown .dropdown-menu {
    font-size: 13px;
}
.pb-3, .py-3 {
    padding-left: 22px;
}
.list-nav > li {
	border-top: 1px solid #dddddd;
	margin-top: 20px;
}
.list-nav > li:first-child {
 	border-top: none;
  	margin-top: 0px;
}
.list-nav > li:not(:first-child) {
	padding-top: 10px;
}
.modal-dialog {
    max-width: 500px;
    margin: 160px auto;
}
.modal-body {
    min-height: 450px;
}

.pagination > li > a {
	color: black;

}

</style>
</head>
<body id="page-top">
  <!-- Page Wrapper -->
  <div id="wrapper">
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">
        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light topbar mb-4 static-top shadow" style="background-color: green;">
          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>
          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="logo" style="padding-left: 230px;">
			    <a href="${pageContext.request.contextPath}/member/adminIndex">
			        <img src="../images/logo_sm.png" alt="">
			    </a>
			</div>
          </form>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">
      
            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow" style="margin-right: 230px;">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline small" style="color: #f6c23e;"><strong>본사</strong> &nbsp;&nbsp;관리자 <!-- / 샌드위치 아티스트 -->  </span>
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="../member/adminIndex">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                 		Admin Home
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>              
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>             
            </li>
          </ul>
        </nav>
        <!-- End of Topbar -->
        <!-- Begin Page Content -->
        <div class="container-fluid">
          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">          
          </div>

          <div class="row">
            <!-- Area Chart -->
            <div class="col-lg-10">
              <div class="card shadow mb-4" style="min-height: 790px;">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between" style="height: 50px;">
                  <h6 class="m-0 font-weight-bold text-gray-800" style="font-size: 17px;">가맹점 신청 현황</h6>                             
                </div>
                
                <!-- Card Body -->
                <div class="card-body" style="min-height: 605px;">   
                	<form action="./franchiseManage" method="post">  
                	<!-- post 넘길 변수 -->
                    <input type="hidden" id="requestNum" name="requestNum"></input>
                    <!--  변수 -->       
                    <ul style="margin-top: 20px; padding-left: 22px;" class="list-nav">	                    	                   
                    	<c:forEach items="${list}" var="vo">	
                    	<c:if test="${vo.requestInfo eq 0}">																					
								<li class="row" id="sold-out0" style="color: black; width: 94%;margin-left: 16px;">
									<div class="prd-info" style="margin-right: 10px;padding:10px;">										
									<div class="prd-img" style="padding-top:17px; width: 150px;height:100px;font-size: 19px;text-align: center; line-height: 31px;">
										${vo.requestDate} <br>		
										<div style="font-size: 24px; margin-top: 7px;font-weight: 600;">${vo.storeName}</div>							
									</div>									
									<div class="prd-cont" style="height: 25px;">								
										<div class="option" style="text-align: center; color:blue;font-size: 16px;">접수 신청</div>																												
									</div>
									</div>
										
									<div class="prd-option" style="width: 390px;padding: 30px 0px 0px 10px;margin-right: 10px;">
									<ul style="list-style: none; padding-left: 0px;">
										<li>
											<div style="margin-bottom: 15px;line-height: 26px;font-size: 15px;"> <strong>접수 번호</strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${vo.requestNum}<br>
											<strong>점주 이름 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong> ${vo.ownerName}<br>
											<strong style="font-weight: 500;">Email &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong> ${vo.email1}@${vo.email2}<br>
											<strong>매장 주소 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong> ${vo.address}</div>																		
										</li>									
									</ul>
									</div>
		
									<!-- 문의 사항 출력 -->
									<div style=" width: 330px; border-left:1px solid lightgray; padding-top: 10px;padding-left: 17px;margin-top:21px; margin-right:20px; height: 120px;font-size: 15px;">
										<div style="margin-bottom: 5px; font-weight: 600;">문의 사항</div>
										<div>${vo.memo}</div>										
									</div>
									<!-- // 문의 사항 -->
									
									<div style=" width: 90px;padding-top: 10px;padding-bottom: 10px;margin-top:15px; margin-right:18px;height: 90px;">													
										<button type="submit" class="btn btn-confirm" title="${vo.requestNum}" style="width: 100%;  background-color:lightgray;color:black;height: 120%;font-weight:600;font-size: 20px;text-align: center;">
											<span style="vertical-align:middle;">신청 <br>허가</span>
										</button>																	
									</div>					
								</li>
								</c:if>
								</c:forEach>
							</ul>
					</form>
                </div>
              </div>
            </div>
			<a style="float: left; display:block; width: 120px; height: 40px;font-size: 15px;
			margin-left: 7px;padding-top: 8px; background-color: #fff; border-color: #ccc;color: black; font-weight: 600;" class="btn" href="../ownerManagement/ownerList">가맹점 관리</a>
			
          </div>
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
		
		
		
      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2020</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>


	<script type="text/javascript">
	$('.btn').click(function(){
		var requestNum = $(this).attr('title');
		$('#requestNum').val(requestNum);
		});
	

	</script>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="./js/sb-admin-2.min.js"></script>

	
  <!-- Page level plugins -->
  <script src="vendor/chart.js/Chart.min.js"></script>



</body>

</html>