<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Sales Manage</title>

	<!-- SideBar(vendor) -->
	<c:import url="../template/vendor.jsp"></c:import>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">

ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	background: #ededed;
	color: #222;
}

.tab-content{
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content.current{
	display: inherit;
}

.text-chart{
	color: #030303!important;
}
.owner_id{
    display: block;
    border: 1px solid #dddddd;
    border-radius: 50px;
    height: 28px;
    line-height: 28px;
    background-color: #fff;
    color: #666666;
    font-size: 18px;
    letter-spacing: -0.02em;
    padding: 0 13px;
    width: 78px;
}
</style>
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <c:import url="./sideBar.jsp"></c:import>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
	 <a href="../"><img class="Sales Management" alt="" src="../images/subway_logo.png" style="margin:80px 700px 0px" ></a>
	<div  class="owner_id" style="margin-left:88%">${member.id}</div>
	 
	 <div id="line" style="border: solid 2.5px white; margin-top: 22.5px" ></div>

      <!-- Main Content -->
      <div id="content" style="margin-top: 30px;">

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Sales Chart</h1>

          <!-- Content Row -->
          <div class="row">

            <div class="col-xl-8 col-lg-7">
				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">Month</li>
					<li class="tab-link" data-tab="tab-2">Week</li>
					<li class="tab-link" data-tab="tab-3">Year</li>
				</ul>

              <!-- Area Chart -->

              
              <!-- month chart/ id=myAreaChart -->
              <div id="tab-1" class="tab-content current">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary text-chart" style="display: inline;">올해 월 매출</h6>
	               <div style="margin-left:10px; display: inline;">
 	               <!--  <select>
	                	<option>Year</option>
	                	<option selected="selected">Month</option>
	                	<option>Week</option>
	                </select>  -->
	                </div>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="myAreaChart"></canvas>
                  </div>
                </div>
              </div>
              </div>
              
			<!-- week chart -->
              <div id="tab-2" class="tab-content">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary text-chart" style="display: inline;">이번 달 주매출</h6>
	               <div style="margin-left:10px; display: inline;">
	                </div>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="myAreaChart_week"></canvas>
                  </div>
                </div>
              </div>
              </div>
              
              <!-- year chart -->
              <div id="tab-3" class="tab-content">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary text-chart" style="display: inline;">연 매출</h6>
	               <div style="margin-left:10px; display: inline;">
	                </div>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="myAreaChart_year"></canvas>
                  </div>
                </div>
              </div>
              </div>
    <!--  -------------------------------------------------------------------------------------------------------------------- -->          
              <!-- Bar Chart -->
              <div class="card shadow mb-4" >
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary text-chart">이번 달 시간대별 매출 </h6>
                </div>
                <div class="card-body">
                  <div class="chart-bar">
                    <canvas id="myBarChart"></canvas>
                  </div>
                  <hr>
                  <%--  <code>/js/demo/chart-bar-demo.js</code> file. --%>
                </div>
              </div>

            </div>
<!-----------------------------------------------------------------------------------------------------------------------------  -->
            <!-- Donut Chart -->
            <div class="col-xl-4 col-lg-5 " style="margin-top: 50px;">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary text-chart">상품별 매출 현황</h6>
                </div>
            
                <!-- Card Body -->
                <div class="card-body" style="height: 500px;">
                  <div class="chart-pie pt-4">
                    <%-- <canvas id="myPieChart"></canvas> --%>
                    <div id="chartContainer" style="height: 400px; width: 100%;">
                    <!-- Pie(product) -->
					<div hidden="hidden">
						<input id="sw" value="${pChart.swCount}">
						<input id="sa" value="${pChart.saCount}">
						<input id="si" value="${pChart.siCount}">
						<input id="wr" value="${pChart.wrCount}">
						<input id="gr" value="${pChart.grCount}">
						
						<input id="swp" value="${pChart.swPercent}">
						<input id="sap" value="${pChart.saPercent}">
						<input id="sip" value="${pChart.siPercent}">
						<input id="wrp" value="${pChart.wrPercent}">
						<input id="grp" value="${pChart.grPercent}">
						
					</div>
					</div>
                  </div>
                </div>
              </div>
            </div>
   
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
      
      <!--  Footer
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
          </div>
        </div>
      </footer>
      End of Footer -->
      
    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Bootstrap core JavaScript-->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="../vendor/chart.js/Chart.min.js"></script>

	<!-- month -->
	<div hidden="hidden">
		<c:forEach items="${monthChart}" var="list" varStatus="i" >
			${list.totalPrice}
			${i.index}
			<input  type="text" value="${list.totalPrice}"  class="c1" id="id3_${i.index}">
		</c:forEach>
	</div>
	<!-- week -->
	<div hidden="hidden">
		<c:forEach items="${weekChart}" var="list" varStatus="i" >
			${list.totalPrice}
			${i.index}
			<input  type="text" value="${list.totalPrice}" class="week"id="week_${i.index}">
		</c:forEach>
	</div>
	
	 <!-- year -->
    <div hidden="hidden">
		<c:forEach items="${yearChart}" var="list" varStatus="i" >
			${list.totalPrice}
			${i.index}
			<input  type="text" value="${list.totalPrice}" class="year" id="year_${i.index}">
		</c:forEach>
	</div>
	
	
	<!-- time -->
	<div hidden="hidden">
		<c:forEach items="${timeChart}" var="list" varStatus="i" >
			${list.totalPrice}
			${i.index}
			<input  type="text" value="${list.totalPrice}"  class="time" id="time_${i.index}">
		</c:forEach>
	</div>

	
	
  <!-- Page level custom scripts -->
  
  <script src="../js/headOfficeDemo/chart-area-demo.js"></script>
  <script src="../js/headOfficeDemo/chart-area-week-demo.js"></script>
  <script src="../js/headOfficeDemo/chart-area-year-demo.js"></script>
  
  <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
  
  <script src="../js/headOfficeDemo/chart-pie-demo.js"></script>
  <script src="../js/headOfficeDemo/chart-bar-demo.js"></script>
	
</body>
<script type="text/javascript">

$(document).ready(function(){
		
		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		})

	})

</script>

</html>
