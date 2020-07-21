<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<link rel="stylesheet" type="text/css"  href="../css/headerStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/menuSelectStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/footerStyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/indexStyle.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style type="text/css">
.text{
	float: right;
}
.textBlock{
	border-right:1px solid #9999;
	height: 60px;
	display: inline-table;
}
.blockIn{
	display:table-cell; 
	vertical-align: middle; 
	font-weight: bold; 
	color: #999;
}
</style>
</head>
<body>
<c:import url="../jsp/header.jsp"></c:import>
	<div class="container" style="margin-bottom: 500px;">
		<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4" style="text-align: center; margin-top: 100px; background-color: #009223;border-radius:40px; ">
			<p style="height:70px; line-height:70px; font-weight: bold;font-family: 'font_sw', 'font_ns';font-size: 35px; color: white;">포인트
			<span class="comma">${member.oriPoint }</span>		
		</div>
		<div class="col-sm-4"></div>
		</div>
		<div class="row">
			<hr style="background-color: #ffe17f; height: 3px;">
			<div style="font-weight: bold; font-size: 20px;">포인트 사용 내역</div>
			<hr style="background-color: #9999; height: 1px;">
		</div>
		
		<c:forEach items="${point }" var="point">
				<div class="row" style=" margin-bottom: 50px;">
					<div class="col-sm-1">
						<c:if test="${point.pointStat eq 1 or point.pointStat eq 4}">
							<i class="fa fa-plus-circle" style="font-size:60px;color:#009223"></i>
						</c:if>
						<c:if test="${point.pointStat eq 0 }">
							<i class="fa fa-minus-circle" style="font-size:60px;color:#f1a03c"></i>
						</c:if>
						<c:if test="${point.pointStat eq 2 }">
							<i class="material-icons" style="font-size:51.44px;color:#009223">settings_backup_restore</i>
						</c:if>
						<c:if test="${point.pointStat eq 3 }">
							<i class="material-icons" style=" font-size:51.44px;color:#f1a03c">settings_backup_restore</i>
						</c:if>
					</div>
					<div class="col-sm-4 textBlock">
						<c:if test="${point.pointStat eq 0 || point.pointStat eq 1}">
							<div class="blockIn">
								결제 번호<span class="text">${point.payNum }</span><br>
								결제 날짜<span class="text">${point.pointDate }</span>
							</div>
						</c:if>
						<c:if test="${point.pointStat eq 4}">
							<div class="blockIn">
								결제 번호<span class="text">${point.payNum }</span><br>
								설문응답 날짜<span class="text">${point.pointDate }</span>
							</div>
						</c:if>
						<c:if test="${point.pointStat eq 2 || point.pointStat eq 3}">
							<div class="blockIn">
								결제 번호<span class="text">${point.payNum }</span><br>
								환불 날짜<span class="text">${point.pointDate }</span>
							</div>
						</c:if>
					</div>
					<div class="col-sm-4 textBlock">
						<c:if test="${point.pointStat eq 1 || point.pointStat eq 4}">
							<div class="blockIn">
								원래 포인트<span class="text comma">${point.oriPoint }</span><br>
								적립 포인트<span class="text comma" style="color: #009223">${point.curPoint }</span>
							</div>
						</c:if>
						<c:if test="${point.pointStat eq 0 }">
							<div class="blockIn">
								원래 포인트<span class="text comma">${point.oriPoint }</span><br>
								사용 포인트<span class="text comma" style="color: #f1a03c">${point.curPoint }</span>
							</div>
						</c:if>
						<c:if test="${point.pointStat eq 2 }">
							<div class="blockIn">
								원래 포인트<span class="text comma">${point.oriPoint }</span><br>
								돌려 받은 포인트<span class="text comma" style="color: #009223">${point.curPoint }</span>
							</div>
						</c:if>
						<c:if test="${point.pointStat eq 3 }">
							<div class="blockIn">
								원래 포인트<span class="text comma">${point.oriPoint }</span><br>
								환불 차감 포인트<span class="text comma" style="color: #f1a03c">${point.curPoint }</span>
							</div>
						</c:if>
					</div>
					<div class="col-sm-3 textBlock" style="border: 0px;">
						<div class="blockIn">
							잔여 포인트<span class="text comma" style="color:black;">${point.totalPoint }</span>
						</div>
					</div>
				</div>
		</c:forEach>
		
		<div id="addPage">
			
		</div>
		
		
		<div id="addBtn" style="border-radius:30px; height:50px; line-height:45px; border: 3px solid #009223; width: 10%;margin: 0 auto; text-align: center; font-weight: bold; color: #009223;">더 보기</div>
	</div>
<c:import url="../jsp/footer.jsp"></c:import>

</body>
<script type="text/javascript">
var id = "${member.id}";
var startNum=0;
$("#addBtn").css({
	'cursor':'pointer'
});

$("#addBtn").click(function(){
	startNum=startNum+5;
	$.ajax({
		type:'get',
		url:'./pointViewMore',
		data:{
			id:id,
			startNum:startNum
		},success:function(data){
			$("#addPage").append(data.trim());
			$(".comma").each(function(){
				var point=$(this).text();
				point = addComma(point);
				$(this).text(point);
			});
		}
	});
});

function addComma(x) {
	x = x.toString().replace("P", "");
	x = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	x = x+"P";
	return x;
}

$(".comma").each(function(){
	var point=$(this).text();
	point = addComma(point);
	$(this).text(point);
});

</script>
</html>