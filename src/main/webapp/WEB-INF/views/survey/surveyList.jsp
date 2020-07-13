<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Survey List</title>

	<!-- SideBar(vendor) -->
	<c:import url="../template/vendor.jsp"></c:import>
    
    <!-- Calendar -->
    <c:import url="../template/calendar.jsp"></c:import>
    
    <!-- css -->
	<link rel="stylesheet" type="text/css" href="../css/by.css">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<style type="text/css">
	.card{
		
		height: 250px; 
		width: 300px;
		float: left;
		margin-left: 40px;
		margin-top: 30px;
	}
	.tb{
		font-size: 13px;
		height: 200px;
	}
	.star_rating{
		margin-left: 60px;
		float: left;
		width: 100px;
		margin-top: 5px;
	}
	.title{
		float: left;
		font-weight: bold;
		margin-top: 5px;
		margin-left: 10px;
	}
	.comment{
		float: left;
		width: 90%;
		height: 80px;
		margin-left: 10px;
		margin-top: 5px;
	}
	.on{
		color: red;
	}



</style>
</head>
<body>

 <div id="wrapper">
 
 	<!-- Sidebar -->
    <c:import url="../sales/sideBar.jsp"></c:import>
    <!-- End of Sidebar -->
    
    <!-- Main Page -->
	<div class="container">
	
    <!-- header -->
	<c:import url="../sales/adminHeader.jsp"></c:import>
	
	<form action="./surveyList">
	<div class="serach">
		<div style="padding-top: 25px; margin-bottom: 25px">
            <i class='fas fa-calendar-alt' style='font-size:20px;'></i>
            <input type="text" name="from" id="from" readonly="readonly" style="display: inline;" value="${from}"> - 
            <input type="text" name="to" id="to" readonly="readonly" value="${to}">
            <button class="btn-subway" type="submit" id=serach">검색</button>
        </div>
    </div>
    </form>
	
 	<!-- Main Page -->
	<div class="container">
    
       <div class="bg-light text-dark" style="border: 1px solid black; height: 600px; width: 100%">
	<c:forEach items="${survey}" var="S" varStatus="i">
     <div class="card">
      <div class="card-header py-1">${S.payNum}</div>
    	<div class="card-body tb">
			
		        <div class="title">메뉴맛 평가</div>
		        	<input class="taste" hidden="" value="${S.taste}">
		        		<div class="star_rating ta${i.index}">

					    </div>
					
				<div class="title">청결도 평가</div>
		        	<input class="star" hidden="" value="${S.hygiene}">
		        		<div class="star_rating">
						<a>★</a>
						<a>★</a>
						<a>★</a>
						<a>★</a>
						<a>★</a>
					    </div>
					
					
		      	<div class="title">친절도 평가</div>
		      		<input class="star" hidden="" value="${S.kindness}">
		        		<div class="star_rating">
						<a>★</a>
						<a>★</a>
						<a>★</a>
						<a>★</a>
						<a>★</a>
					    </div>

		      	<div class="title">기타</div>
		      	<input class="comment" type="text" value="${S.comment}" readonly="readonly">
 			
    	</div>
  	</div>
    	 </c:forEach>

 	</div>
 	
 	<!-- Pager -->
<c:if test="${pager.totalPage>0}">
	<div style="margin: 0 auto;">
	  	<ul class="pagination justify-content-center" style="margin:20px 0">	
	  	<c:if test="${pager.curPage>1}">
			    <li class="page-item"><a class="page-link" href="./surveyList?curPage=${pager.curPage-1}&from=${from}&to=${to}">이전</a></li>
		</c:if>	 
			
	  	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    <li class="page-item"><a class="page-link" href="./surveyList?curPage=${i}&from=${from}&to=${to}">${i}</a></li>
	 	 </c:forEach>
	 	 
	 	 <c:if test="${pager.curPage<pager.totalPage}">
			    <li class="page-item"><a class="page-link" href="./surveyList?curPage=${pager.curPage+1}&from=${from}&to=${to}">다음</a></li>
		</c:if>
	
		</ul>
	
  </div>
	</c:if>
 	
 </div> <!-- End Main Area -->
 </div>
 </div>
      <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

</body>
<script type="text/javascript">
$(document).ready(function() {
	$(".taste").each(function(){
		var taste = $(this).val();
		var html = "<a class='on'>★</a>";
for(var i=0;i<6;i++){
	if(taste==i){
		console.log("in");
		console.log(taste);
		var tas = taste*1;
		console.log(tas);
		for(var j=1;j<tas;j++){
		$(".ta"+i).append(html);
	}
		break;
	}
}	
});
});

</script>




<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Bootstrap core JavaScript-->
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="../js/sb-admin-2.min.js"></script>
<!-- Calendar -->
<script src="../js/calendar.js"></script>

</html>