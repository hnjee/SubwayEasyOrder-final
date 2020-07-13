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
<script>
function startTime() {
    var today = new Date();

    var year = today.getFullYear();
    var month = today.getMonth()+1;
	var date = today.getDate();
    
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    h = checkTime(h);
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('clock').innerHTML =
    year + "년 " + month + "월 " + date + "일 " + h + ":" + m + ":" + s;
    var t = setTimeout(startTime, 500);
}
function checkTime(i) {
    if (i < 10) {i = "0" + i}; // 숫자가 10보다 작을 경우 앞에 0을 붙여줌
    return i;
}
</script>
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
<body id="page-top" onload="startTime()">

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
			    <a href="/">
			        <img src="../images/logo_sm.png" alt="">
			    </a>
			</div>
          </form>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">
      
            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow" style="margin-right: 230px;">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline small" style="color: #f6c23e;"><strong>${member.name}</strong> &nbsp;&nbsp;가맹 점주 <!-- / 샌드위치 아티스트 -->  </span>
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
			
		 	
          <!-- Content Row -->
          <div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2" OnClick="location.href ='./orderList?orderInfo=0'" style="cursor:pointer;">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">접수 대기</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">${cases[0]} 건</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2" OnClick="location.href ='./orderList?orderInfo=1'" style="cursor:pointer;">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">처리중</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">${cases[1]+cases[2]} 건</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2" OnClick="location.href ='./orderList?orderInfo=3'" style="cursor:pointer;">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">완료</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">${cases[3]} 건</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-comments fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Content Row -->

          <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-gray-800">주문 접수</h6>  
                  <div id="clock" style="font-size: 14px; margin-right: 13px;"></div>               
                </div>
                
                
                
                <!-- Card Body -->
                <div class="card-body" style="min-height: 605px;">   
                	<form action="./orderList" method="post">  
                	<!-- post 넘길 변수 -->
                    <input type="hidden" id="setOrderInfo" name="orderInfo" value="${orderInfo}"></input>
                    <input type="hidden" id="setPayNum" name="payNum"></input>
                    <!--  변수 -->       
                    <ul style="margin-top: 20px; padding-left: 22px;" class="list-nav">	                    	                   
                    	<c:forEach items="${list}" var="vo">																						
								<li class="row" id="sold-out0" style="color: black; width: 94%;margin-left: 16px;">
									<div class="prd-info" style="margin-right: 10px;padding:10px;">										
									<div class="prd-img" style="padding-top:17px; width: 150px;height:100px;font-size: 21px;text-align: center; line-height: 31px;">
										${vo.payDate} <br>
										<div style="font-size: 33px;"><strong>${vo.payTime}</strong></div>
									</div>
									
									<div class="prd-cont" style="height: 25px;">		
										<c:if test="${vo.orderInfo eq 0}">
											<div class="option" style="text-align: center; color:green;font-size: 16px;">접수 대기 중</div>
										</c:if>	
										<c:if test="${vo.orderInfo eq 1}">
											<div class="option" style="text-align: center; color:blue;font-size: 16px;">준비 중</div>
										</c:if>	
										<c:if test="${vo.orderInfo eq 2}">
											<div class="option" style="text-align: center; color:red;font-size: 16px;">픽업 대기 중</div>
										</c:if>	
										<c:if test="${vo.orderInfo eq 3}">
											<div class="option" style="text-align: center; color:gray;font-size: 16px;">픽업 완료</div>
										</c:if>																								
									</div>
									</div>
										
									<div class="prd-option" style="width: 380px;padding: 30px 0px 0px 10px;margin-right: 10px;">
									<ul style="list-style: none; padding-left: 0px;">
										<li>
											<div style="margin-bottom: 15px;line-height: 28px;"> <strong>[ 메뉴  ${vo.menuCounts}개 ]</strong> &nbsp;${vo.totalPrice}원<br>
											결제 완료</div>
											<div> <strong>접수번호</strong>  &nbsp;${vo.payNum}<br>
											</div>											
										</li>									
									</ul>
									</div>
									
									
									
									<div style=" width: 120px;padding-top: 10px;padding-bottom: 10px;margin-top:15px; margin-right:18px;height: 120px;">		
											<c:if test="${vo.orderInfo eq 0}">
											<button type="submit" class="btn btn-confirm" title="${vo.orderInfo}" id="${vo.payNum}" style="padding-top:12px; width: 100%; background-color:#f6c23e;color:black;height: 100%;font-weight:600;font-size: 22px;text-align: center;">
												<span style="vertical-align:middle;">접수<br>하기</span>
											</button>
											</c:if>	
											<c:if test="${vo.orderInfo eq 1}">
											<button type="submit" class="btn btn-confirm" title="${vo.orderInfo}" id="${vo.payNum}" style="padding-top:12px; width: 100%; background-color:#f6c23e;color:black;height: 100%;font-weight:600;font-size: 22px;text-align: center;">
												<span style="vertical-align:middle;">준비<br>완료</span>
											</button>
											</c:if>	
											<c:if test="${vo.orderInfo eq 2}">
												<button type="submit" class="btn btn-confirm" title="${vo.orderInfo}" id="${vo.payNum}" style="padding-top:12px; width: 100%; background-color:#f6c23e;color:black;height: 100%;font-weight:600;font-size: 22px;text-align: center;">
												<span style="vertical-align:middle;">픽업<br>완료</span>
											</button>
											</c:if>										
									</div>
									
									
									<!-- 주문 내역서 출력 -->
									<div style=" width: 120px;padding-top: 10px;padding-bottom: 10px;margin-top:15px; height: 120px;">
										<a href="./" class="btn" data-toggle="modal" data-target="#myModal${vo.payNum}" style="padding-top:12px; width: 100%; background-color:whitesmoke;color:black;height: 100%;font-weight:600;font-size: 22px;text-align: center;">
											<span style="vertical-align:middle;">주문<br>내역</span>
										</a>
										
										<!-- set modal -->
										<div class="modal fade" id="myModal${vo.payNum}" role="dialog">
										    <div class="modal-dialog">
										      <!-- Modal content-->
										      <div class="modal-content">
										        <div class="modal-header">
										        	<div style="text-align: center; font-weight: 600; margin-left: 190px;">주문 내역서</div>
										          <button type="button" class="close" data-dismiss="modal" style="font-size: 20px;">&times;</button>
										          <h4 class="modal-title"></h4>
										        </div>
										        <div class="modal-body" style="padding-top: 18px;">
										          <div>&nbsp;&nbsp;&nbsp;&nbsp;<strong>결제 번호 :</strong> ${vo.payNum}</div>
										          <div>&nbsp;&nbsp;&nbsp;&nbsp;<strong>결제 날짜 :</strong> ${vo.payDate}&nbsp;${vo.payTime}</div>
										          <div style="border-bottom: 1px solid lightgray; height:16px; width: 97%;margin:0 auto;"></div>
										          
										          <c:if test="${vo.menuCounts gt 0}">
										          	<c:forEach items="${vo.orderItems}" var="order">
										          	<div>
											          	<div>
															<div style="width:100%; padding: 20px 20px 0px 20px;font-size: 16px;">
													          	<div><strong>${order.menuName}</strong>
													          	<div style="text-align: right;display: inline-block;float: right;">${order.productCount}개&nbsp;&nbsp; ${order.productPrice}원</div>
													          	<c:if test="${order.setting ne null}">
													          	<div>세트  번호 : <strong> ${order.setting}</strong></div>													        
													          	</c:if>
													          	</div>
													          	
													          	<!-- 세트 메뉴 -->													          	
													          	<!-- 커스텀 정보 -->
												          	
													          	<c:if test="${order.customVOs ne null}">
													          	<c:forEach items="${order.customVOs}" var="customs">													          														          	
																	<!-- 빵, 제외 야채, 추가토핑  구분 -->
																	<c:if test="${customs.ingredientVO.ingreCode eq 'BR'}">																	
																		${customs.ingredientVO.name}, ${customs.breadSize}cm
																		<c:if test="${customs.breadToasting eq 1}">, 토스팅<br></c:if>																															
																	</c:if>
																	
																	<c:if test="${customs.ingredientVO.ingreCode eq 'VG'}">															
																		<br><strong>제외 야채 : </strong>${customs.ingredientVO.name}																														
																	</c:if>
																	
																	<c:if test="${customs.ingredientVO.ingreCode eq 'CZ'}">														
																		<strong>치즈 :</strong> ${customs.ingredientVO.name}																															
																	</c:if>
																	
																	<c:if test="${customs.ingredientVO.ingreCode eq 'SO'}">
																		<br><strong>소스 :</strong> ${customs.ingredientVO.name}																																	
																	</c:if>
																	
																	<c:if test="${customs.ingredientVO.ingreCode eq 'AD'}">																	
																		<br><strong>추가 토핑 :</strong> ${customs.ingredientVO.name}																																		
																	</c:if>																
																</c:forEach>
													          	<!-- //커스텀 정보  -->
													          	</c:if>																									
													          														          													          	
													         </div>
														</div>																																					          	
										          	</div>										          											          	
										          	</c:forEach>
										          </c:if>
 
										        </div>
										        <div class="modal-footer">
										          <!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
										        </div>
										      </div>
										      
										    </div>
										  </div>
										<!-- end modal -->									
									</div>
									<!-- // 주문 내역서 출력 -->
								</li>
								</c:forEach>
							</ul>
							
							<div style="margin: 0 auto; width: 300px; margin-top: 30px;">
							<ul class="pagination">
							<c:if test="${paget.curPage>1}">
								<c:if test="${pager.curBlock gt 1}">
									<li><a href="./orderList?curPage=${pager.startNum-1}&orderInfo=${orderInfo}">이전</a></li>
								</c:if>
								
								<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
										<li><a href="./orderList?curPage=${i}&orderInfo=${orderInfo}">${i}</a></li>
								</c:forEach>
								
								<c:if test="${pager.curBlock lt pager.totalBlock}">
									<li><a href="./orderList?curPage=${pager.lastNum+1}&orderInfo=${orderInfo}">다음</a></li>
								</c:if>
							</c:if>
							</ul> 
							</div>
							
							</form>
                </div>
              </div>
            </div>

            <!-- Pie Chart -->
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-gray-800">단체 예약</h6>
                  <div class="dropdown no-arrow">
              		
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body small" style="padding-left: 24px; min-height: 180px;">
                	<table style="margin-bottom: 15px;">
                	<tr><td><strong>오후 5:00 &nbsp;&nbsp; 쌍용강북교육센터</strong></td></tr>
                	<tr><td>이탈리안비엠티 세트 30개</td></tr>
                	</table>
               		<table>
                	<tr><td><strong>오후 7:30 &nbsp;&nbsp; 홍익대학교</strong></td></tr>
                	<tr><td>에그마요 세트 15개</td></tr>
                	<tr><td>풀드포크 단품 3개</td></tr>
                	</table>
                 
                </div>
              </div>
            </div>
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
  
	var payments = [];
	<c:forEach items="${list}" var="pay">
		payments.push("${pay.payNum}");
	</c:forEach>
  
	$('.btn-confirm').click(function(){
		var orderInfo = $(this).attr('title');
		console.log(orderInfo);
		$('#setOrderInfo').val(orderInfo);
		
		// 버튼의 id = payNum 가져오기
		var payNum = $(this).attr('id');
		console.log(payNum);
		$('#setPayNum').val(payNum);
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