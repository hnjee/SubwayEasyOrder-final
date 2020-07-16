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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/by.css">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/surveyList.css">
	

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
		<div style="padding-top: 25px;margin-left: 27px;">
            <i class='fas fa-calendar-alt' style='font-size:20px;'></i>
            <input type="text" name="from" id="from" readonly="readonly" style="display: inline;" value="${from}"> - 
            <input type="text" name="to" id="to" readonly="readonly" value="${to}">
            <button class="btn-subway" type="submit" id=serach">검색</button>
        <span><img alt="X" src="../images/img_profile_female.png" style="width: 50px;height: 50px; margin-left: 50%;" ></span>
        </div>
    </div>
    </form>
	
 	<!-- Main Page -->
	<div class="container">
    
    <div class="main s" >
    <div class="ss">
	<c:forEach items="${survey}" var="S" varStatus="i">
     <div class="card">
      <div class="card-header py-1" style="background-color:#afb3b1;"><strong style="color: white;">주문번호 - ${S.payNum}</strong></div>
    	<div class="card-body tb">
			
		        <div class="title">메뉴맛 평가</div>
		        	<input class="taste" hidden="" value="${S.taste}">
		        		<div class="star_rating ta${i.index}"></div>
					
				<div class="title">청결도 평가</div>
		        	<input class="hygiene" hidden="" value="${S.hygiene}">
		        		<div class="star_rating hy${i.index}"></div>
					
		      	<div class="title">친절도 평가</div>
		      		<input class="kindness" hidden="" value="${S.kindness}">
		        		<div class="star_rating ki${i.index}"></div>

		      	<div class="title">기타</div>
		      	<input class="comment" type="text" value="${S.comment}" readonly="readonly">
 			
    	</div>
  	</div>
    </c:forEach>
	</div>
 	</div>
 	
 	<!-- Pager -->
<c:if test="${pager.totalPage>0}">
	<div style="margin: 0 auto; ">
	  	<ul class="pagination justify-content-center" style="margin:20px 0;">	
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


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>
<!-- Calendar -->
<script src="${pageContext.request.contextPath}/js/calendar.js"></script>
<!-- SurveyList -->
<script src="${pageContext.request.contextPath}/js/survey/surveyList.js"></script>
</html>