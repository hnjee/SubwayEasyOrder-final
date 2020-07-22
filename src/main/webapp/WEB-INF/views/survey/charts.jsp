<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>Survey Charts</title>
<!-- SideBar(vendor) -->
	<c:import url="../template/vendor.jsp"></c:import>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="../css/survey.css">  
</head>
<body id="page-top">
  <div id="wrapper">
      <!-- Sidebar -->
    <c:import url="../sales/sideBar.jsp"></c:import>
    
        
	<!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
 	<a href="${pageContext.request.contextPath}/member/adminIndex"><img class="Sales Management" alt="" src="../images/subway_logo.png" style="margin:70px 700px 0px" ></a>
	 <div class="owner_id" style="margin-left:88%;">${member.id}</div>
	 <div id="line" style="border: solid 2.5px white; margin-top: 30px" ></div>
 	
 	<!-- Main Content -->
      <div id="content" style="margin-top: 30px;">

        <!-- Begin Page Content -->
        <div class="container-fluid">
           <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Survey Chart</h1>
          
        <!-- Content Row -->
          <div class="row" >
			<div class="col-xl-8 col-lg-7">
				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">Month</li>
					<li class="tab-link" data-tab="tab-2">Year</li>
					<li class="tab-link" data-tab="tab-3">Total</li>
				</ul>

              <!-- Area Chart -->

              
              <!-- month chart/ id=myAreaChart -->
              <div id="tab-1" class="tab-content current">
              <div class="card1 card card1 shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary text-chart" style="display: inline;">월별 설문조사</h6>
	               <div style="margin-left:10px; display: inline;">

	                </div>
                </div>
                <div class="card-body-1 card-body">
                  <div class="chart-area">
                    <canvas id="myAreaChart"></canvas>
                  </div>
                  
	                <div id="LineColor">
	                <span style="margin-left: 70%; margin-top: 20px;" >
	                <span style="margin-right:15px; display:inline-block; width:80px;height:27px; background:#92A8D1;" ><span style="color: white; padding:10px;">메뉴(맛)</span></span>
	                <span style=" margin-right:15px;display:inline-block;width:53px;height:27px; background:#eb6390; "><span style="color: white; padding:10px;">위생</span></span>
	                <span style=" display:inline-block;width:53px;height:27px; background:#63ebc9; "><span style="color: white; padding:10px;">친절</span></span>
	                </span>
	                </div>
	                
                </div> 
              </div> 
              </div>
              
              <!-- year chart -->
              <div id="tab-2" class="tab-content">
              <div class="card card1 shadow mb-4">

                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary text-chart" style="display: inline;">연별 통계</h6>
	               <div style="margin-left:10px; display: inline;">
	                </div>
                </div>
                <div class="card-body card-body-1">
                  <div class="chart-area">
                    <canvas id="yearChart"></canvas>
                  </div>
                  <div id="LineColor">
	                <span style="margin-left: 70%; margin-top: 20px;" >
	                <span style="margin-right:15px; display:inline-block; width:80px;height:27px; background:#92A8D1;" ><span style="color: white; padding:10px;">메뉴(맛)</span></span>
	                <span style=" margin-right:15px;display:inline-block;width:53px;height:27px; background:#eb6390; "><span style="color: white; padding:10px;">위생</span></span>
	                <span style=" display:inline-block;width:53px;height:27px; background:#63ebc9; "><span style="color: white; padding:10px;">친절</span></span>
	                </span>
	                </div>
                </div>
              </div>
              </div>
			<!-- monthTotal -->
              <div id="tab-3" class="tab-content">
              <div class="card card1 shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary text-chart" style="display: inline;">이달의 총점</h6>
	               <div style="margin-left:10px; display: inline;">
	                </div>
                </div>
                <div class="card-body card-body-1">
                  <div class="chart-area">
                    <canvas id="monthTotal"></canvas>
                  </div>
                  <span style=" margin-left: 85%; margin-top: 20px;display:inline-block;width:90px;height:27px; background:#27b079; "><span style="color: white; padding:10px;">총점 평균</span></span>
                  
                </div>
              </div>
              </div>
              </div>
			
		<!---------------------------------- 막대그래프 시작------------------------------------->
			<div class="col-xl-8 col-lg-7-bar" style="margin-top: 50px;">
				<ul class="tabs-bar">
					<li class="tab-link current-bar" data-tab="tab-4">Today</li>
					<li class="tab-link" data-tab="tab-5">Total</li>
				</ul>
              
              <!-- month chart/ id=myAreaChart -->
              <div id="tab-4" class="tab-content-bar current-bar">
              <div class="card card1 shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary text-chart-bar" style="display: inline;">오늘의 설문조사</h6>
	               <div style="margin-left:10px; display: inline;">

	                </div>
                </div>
                <div class="card-body card-body-1">
                  <div class="chart-area">
                    <canvas id="thisBar"></canvas>
                  </div>
                  
	                <div id="LineColor">
	                <span style="margin-left: 70%; margin-top: 20px;" >
	                <span style="margin-right:15px; display:inline-block; width:80px;height:27px; background:#7faeeb;" ><span style="color: white; padding:10px;">메뉴(맛)</span></span>
	                <span style=" margin-right:15px;display:inline-block;width:53px;height:27px; background:#eb7fb8; "><span style="color: white; padding:10px;">위생</span></span>
	                <span style=" display:inline-block;width:53px;height:27px; background:#8ed171; "><span style="color: white; padding:10px;">친절</span></span>
	                </span>
	                </div>
	                
                </div> 
              </div> 
              </div>
              
              <!-- 막대 total chart -->
              <div id="tab-5" class="tab-content-bar">
              <div class="card card1 shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary text-chart-bar" style="display: inline;">오늘의 통계</h6>
	               <div style="margin-left:10px; display: inline;">
	                </div>
                </div>
                <div class="card-body card-body-1">
                  <div class="chart-area">
                    <canvas id="total-Bar"></canvas>
                  </div>
                  <div id="LineColor">
	               <span style=" margin-left: 85%; margin-top: 20px;display:inline-block;width:90px;height:27px; background:#27b079; "><span style="color: white; padding:10px;">총점 평균</span></span>
	          
	                </div>
                </div>
              </div>
              </div>

              </div>


          
<!-----------------------------------------------------------------------------------------------------------------------------  -->
            <!-- Donut Chart -->
            <div style="margin-left: 1100px; position: absolute; margin-top: 50px; width: 550px;" >
              <div class="card shadow mb-3">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3" >
                  <h6 class="m-0 font-weight-bold text-primary text-chart">만족도 현황</h6>
                </div>
            
                 <!-- Card Body -->
                <div class="card-body"  style="height: 500px;">
                  <div class="chart-pie pt-4">
                    <%-- <canvas id="myPieChart"></canvas> --%>
                    <div id="surveyPieChart" style="height: 400px; width: 100%;">
                    <!-- Pie -->
					<div hidden="hidden">
						<input id="ta" value="${pie.taSum}">
						<input id="hy" value="${pie.hySum}">
						<input id="ki" value="${pie.kiSum}">
						
						<input id="tap" value="${pie.taPercent}">
						<input id="hyp" value="${pie.hyPercent}">
						<input id="kip" value="${pie.kiPercent}">

					</div>
					</div>
                  </div>
                </div>
              </div>
            </div> <!-- 도넛그래프 끝 -->
            


         </div>
         <!-- row --> 
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

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

	<!--month -->
	<div hidden="hidden">
		<c:forEach items="${surveyMonth}" var="list" varStatus="i" >
			${list.taste}
			<input  type="text" value="${list.taste}" class="taste">
			${list.hygiene}
			<input  type="text" value="${list.hygiene}" class="hygiene">
			${list.kindness}
			<input  type="text" value="${list.kindness}" class="kindness">
		</c:forEach>
	</div>
	<!-- year -->
		<div hidden="hidden">
		<c:forEach items="${surveyYear}" var="list" varStatus="i" >
			${list.taste}
			<input  type="text" value="${list.taste}" class="taste-year">
			${list.hygiene}
			<input  type="text" value="${list.hygiene}" class="hygiene-year">
			${list.kindness}
			<input  type="text" value="${list.kindness}" class="kindness-year">
		</c:forEach>
	</div>
	
	<!-- survey-month-chart -->
		<div hidden="hidden">
		<c:forEach items="${monthTotal}" var="list" varStatus="i" >
			${list.totalScore}
			<input  type="text" value="${list.totalScore}" class="monthTotal">
		</c:forEach>
		</div>
	<!-- thisBar -->
		<div hidden="hidden">
		<c:forEach items="${thisBar}" var="list" varStatus="i" >
			${list.taste}
			<input  type="text" value="${list.taste}" class="taste-Bar">
			${list.hygiene}
			<input  type="text" value="${list.hygiene}" class="hygiene-Bar">
			${list.kindness}
			<input  type="text" value="${list.kindness}" class="kindness-Bar">
		</c:forEach>
		</div>
		
	<!-- totalBar -->
		<div hidden="hidden">
		<c:forEach items="${totalBar}" var="list" varStatus="i" >
			{list.total}
			<input  type="text" value="${list.total}" class="total-Bar">
		</c:forEach>
		</div>
<script src="../js/survey/survey-month-chart.js"></script>
<script src="../js/survey/survey-year-chart.js"></script>
<script src="../js/survey/survey-total-chart.js"></script>
<script src="../js/survey/survey-barMonth-chart.js"></script>
<script src="../js/survey/survey-barTotal-chart.js"></script>
<script src="../js/survey/survey-pie-chart.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<!-- month chart.js -->
</body>

<script type="text/javascript">
$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	});

});

$(document).ready(function(){
	
	$('ul.tabs-bar li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs-bar li').removeClass('current-bar');
		$('.tab-content-bar').removeClass('current-bar');

		$(this).addClass('current-bar');
		$("#"+tab_id).addClass('current-bar');
	});

});
</script>
</html>