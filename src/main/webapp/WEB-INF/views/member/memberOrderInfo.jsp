<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<link rel="stylesheet" type="text/css"  href="../css/headerStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/menuSelectStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/footerStyle.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style type="text/css">
th{
	color: gray;
	font-weight: bold;
	text-align: center;
}
td{
	color: gray;
	font-weight: bold;
	text-align: center;
	
}
.table>tbody>tr>td{
	vertical-align: middle;
	border-bottom: 1px solid #ddd;
	border-top: 0px;
}
.table>thead>tr>th {
    vertical-align: bottom;
    border-bottom: 2px solid #fff;
}

#detail{
	border-radius: 30px;
	width: 80%;
	height: 100%;
	border: solid green 3px;
	box-shadow: 5px 10px #ffe17f;
	
	/* background-color:rgb(0,128,0,0.5); */
	
}

</style>
</head>
<body>
	<c:import url="../jsp/header.jsp"></c:import>









	<div class="container" style="padding-bottom: 200px; margin-top: 100px;">
		
		<div class="row">
		<c:if test="${empty list}">
			<div style="text-align: center;">
				<h2 style="font-weight: bold; margin-bottom: 100px;">최근 주문 내역</h2>
				<img alt="" src="../images/icon_exc_sm.png">
				<p style="font-weight: bold; color: #999; margin: 50px 0 100px 0;">최근 주문 내역이 없습니다.
			</div>
		</c:if>
			<!-- ==========================================================================================  -->
		<div class="col-sm-10" id="addPage">
		
			
			<c:if test="${!empty list }">
			
			<div style="font-weight: bold; font-size: 30px;">결제 내역</div>
			<hr style="background-color: green; height: 1px;">
			<table class="table">
				<thead>
					<tr style="background-color: rgba(255, 195, 0, 0.5);">
						<th>주문 번호</th>
						<th>주문 내역</th>
						<th>결제 금액</th>
						<th>상세 보기</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list" varStatus="i">
						<c:if test="${list.productPrice gt 0 }">
							<tr style="background-color: white;">
								<td class="rowSet">
									<div>${list.payNum}</div>
									<div id="${list.payNum }_date">(${list.payDate })</div>
									<div id="${list.payNum}_storeName">${list.storeName }</div>
								</td>
								<td><div>${list.name }(${list.codeDesc })-<c:if test="${list.setting eq null }">단품</c:if><c:if test="${list.setting ne null }">세트</c:if></div></td>
								<td class="rowSet2" id="${list.payNum}_total">${list.totalPrice}</td>
								<td class="rowSet3">
						          <span class="btn glyphicon glyphicon-hand-right detail_btn" title="${list.payNum}" style="color: white; background-color: #009223"></span>
								</td>
							</tr>
						
						</c:if>
						
						
					</c:forEach>
					
					
				</tbody>
				
			</table>
			</c:if>
		</div>
		<div class="col-sm-2">
				<div id="orderDetail" style=" width: 350px; position: absolute;">
					
				</div>
		
		</div>
		</div>
		
		
		<c:forEach items="${findNum }" var="findNum" varStatus="i">
			<span class="count" >${findNum.payNum }</span>
			
		</c:forEach>
		<div class="row">
			<div id="addBtn" style="border-radius:30px; height:50px; line-height:45px; border: 3px solid #009223; width: 10%;margin: 0 auto; text-align: center; font-weight: bold; color: #009223;">더 보기</div>
		</div>
	</div>
	
<c:import url="../jsp/footer.jsp"></c:import>
<script type="text/javascript">
	var id = "${member.id}";
	var finalNum="${i.count}";
	console.log(finalNum);
	var payNum = "check";
	var prePaynum="check";
	var total_count=0;
	var count=0;
	var detail_count=new Array();
	
	$(".count").each(function(){
		prePaynum=payNum;
		count++;
		if(payNum!=$(this).text()){
			payNum = $(this).text();
			total_count++;
			console.log(total_count);
		}
		if(total_count%5==1 && payNum!=prePaynum){
			console.log(payNum = $(this).text());
			console.log("-----------------------");
			detail_count.push(count-1);
		}
	});
	console.log(total_count);
	console.log(detail_count);
	

	$("#addBtn").css({
		'cursor':'pointer'
	});

	var clickCount=0;
	$("#addBtn").click(function(){
	clickCount++;
	console.log(clickCount);
	var startNum = detail_count[clickCount];
	var lastNum = detail_count[clickCount+1]*1-startNum;
		$.ajax({
			type:'get',
			url:'./orderInfoMore',
			data:{
				id:id,
				startNum:startNum,
				lastNum:lastNum
			},success:function(data){
				$("#addPage").append(data.trim());
				
				
			}
		});
	});
</script>	


<script type="text/javascript">
$(document).ready(function() {

	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#orderDetail").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		/* 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 */

		$("#orderDetail").stop().animate({
			"top" : newPosition
		}, 500);

	}).scroll();

});
	
	

	
	$(".rowSet").each(function(){
		var rows = $(".rowSet:contains('"+$(this).text()+"')");
		var rows2=rows.siblings(".rowSet2");
		var rows3=rows.siblings(".rowSet3");
		if(rows.length>1){
			rows.eq(0).attr("rowspan",rows.length);
			rows2.eq(0).attr("rowspan",rows.length);
			rows3.eq(0).attr("rowspan",rows.length);
			rows.not(":eq(0)").remove();
			rows2.not(":eq(0)").remove();
			rows3.not(":eq(0)").remove();
		}
		

	});
	
	$(".detail_btn").each(function(){
		var payNum = $(this).attr("title");
		var total=$("#"+payNum+"_total").text();
		total = addComma(total);
		
		$("#"+payNum+"_total").text(total);
		$(this).click(function(){
			var date=$("#"+payNum+"_date").text();
			if($(this).attr("id")!='close'){
				$.ajax({
					type:'get',
					url:'./orderDetail',
					data:{
						payNum:payNum
					},success:function(data){
						$("#orderDetail").html(data.trim());
						$("#payNum").text(payNum);
						$("#totalPrice").text(total);
						$("#payDate").text(date);
					}
		
				});
				$("#close").attr("class","btn glyphicon glyphicon-hand-right detail_btn");
				$("#close").css({
					'background-color':'green'
				});
				$("#close").attr("id","");
				$(this).attr("class","btn glyphicon glyphicon-hand-left detail_btn");
				$(this).attr("id","close");
				$(this).css({
					'background-color':'#f1a03c'
				});
			} else {
				$("#close").attr("class","btn glyphicon glyphicon-hand-right detail_btn");
				$("#close").css({
					'background-color':'#009223'
				});
				$("#close").attr("id","");
				$("#orderDetail").html('');
			}

			
			
			
			
			
			

			
		});
	});
	
	
	function addComma(x) {
		x = x.toString().replace("원", "");
		x = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		x = x+"원";
		return x;
	}
</script>


</body>
</html>