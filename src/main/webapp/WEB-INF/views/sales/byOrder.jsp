<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>By Order</title>

	<!-- SideBar(vendor) -->
	<c:import url="../template/vendor.jsp"></c:import>
    
    <!-- Calendar -->
    <c:import url="../template/calendar.jsp"></c:import>

    <!-- css -->
    <link rel="stylesheet" type="text/css" href="../css/by.css">  
    
	<base target="_self">
</head>
<body>
 <div id="wrapper">

    <!-- Sidebar -->
    <c:import url="./sideBar.jsp"></c:import>
    <!-- End of Sidebar -->
	
	<!-- Main Page -->
	<div class="container">
	
    <!-- header -->
	<c:import url="./adminHeader.jsp"></c:import>
	
	<h3 id="titleName" style="margin-top: 50px;">건별 매출</h3>
	
	<form action="./byOrder">
	<div class="serach">
		<div style="padding-top: 25px; margin-bottom: 25px">
            <i class='fas fa-calendar-alt' style='font-size:20px;'></i>
            <input type="text" name="from" id="from" readonly="readonly" style="display: inline;" value="${from}"> - 
            <input type="text" name="to" id="to" readonly="readonly" value="${to}">
            <button class="btn-subway" type="submit" id=serach">검색</button>
        </div>
    </div>
    </form>
    <table class="table table-hover">
	    <thead>
	      <tr>
	        <th>주문일시</th>
	        <th>주문번호</th>
	        <th>상품명</th>
	        <th>금액</th>
	        <th>결제수단</th>
	      </tr>
	    </thead>
	    <c:forEach items="${byOrder}" var="O"> 
	    <tbody>
	      <tr>
	        <td>${O.payDate}</td>
	        <td data-toggle="modal" data-target="#myModal" data-notifyid="${O.payNum}">${O.payNum}</td>
	        <td>${O.name}</td>
	        <td>${O.totalPrice}원</td>
	        <td>카드</td>
	      </tr>
	    </tbody>
	    </c:forEach>
	  </table>

<!-- Modal -->

<div class="modal modal-center fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    
      <div class="modal-header">
 
        <div style="text-align: center; margin-left: 30%;" href="./byOrder" class="image-popup">
        <img src="../images/modal_subway_logo.jpg" alt=""><h5>매출 상세 정보</h5></div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      
      <div class="modal-body">
		<div class="body-header">
		
		</div>      
		<div class="body-main">
       	
       		<h6 style="border-top-style: dotted;"></h6>
    
       		<table class="table table-bordered" style="text-align: center; width: 100%;">
       			<tr>
       				<th>주문일시</th>
       				<td id="Pdate"></td>
       			</tr>
       			<tr>
       				<th>주문아이디</th>
       				<td id="PId"></td>
       			</tr>
       			<tr>
       				<th>주문상품</th>
       				<td id="Pname"></td>
       			</tr>
       			<tr>
       				<th>주문번호</th>
       				<td id="Pnum"></td>
       			</tr>
       			<tr>
       				<th>주문금액</th>
       				<td id="Pprice"></td>
       			</tr>
    
       			
       		</table>

       		<div class="button" style="text-align: center;">
       		<button type="button" class="btn btn-danger" id="refund">거래취소</button>
       		</div>

        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        
      </div>
    </div>
  </div>
  
 </div><!-- End Modal -->

<!-- Pager -->
<c:if test="${pager.totalPage>0}">
	<div style="margin: 0 auto;">
	  	<ul class="pagination justify-content-center" style="margin:20px 0">	
	  	<c:if test="${pager.curPage>1}">
			    <li class="page-item"><a class="page-link" href="./byOrder?curPage=${pager.curPage-1}&from=${from}&to=${to}">이전</a></li>
		</c:if>	 
			
	  	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    <li class="page-item"><a class="page-link" href="./byOrder?curPage=${i}&from=${from}&to=${to}">${i}</a></li>
	 	 </c:forEach>
	 	 
	 	 <c:if test="${pager.curPage<pager.totalPage}">
			    <li class="page-item"><a class="page-link" href="./byOrder?curPage=${pager.curPage+1}&from=${from}&to=${to}">다음</a></li>
		</c:if>
	
		</ul>
	
  </div>
	</c:if>

  
    </div> <!-- End Main Area -->
   
</div>
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
<!-- Calendar -->
<script src="../js/calendar.js"></script>
<!-- byOrder -->
<script src="../js/sales/byOrder.js"></script>

</html>