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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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









	<div class="container" style="margin-bottom:500px; margin-top: 100px;">
		
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
						<th style="width: 60%;">주문 내역</th>
						<th>결제 금액</th>
						<th>상세 보기</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list" varStatus="i">
						
						<c:if test="${list.productPrice gt 0 }">
							<tr style="background-color: white;">
								<td class="rowSet">
									<c:if test="${list.refund eq 1 }">
										<del>
										<div>${list.payNum}</div>
										<div id="${list.payNum }_date" title="${list.payDate }">(${list.payDate })</div>
										<div id="${list.payNum}_storeName">${list.storeName }</div>
										</del>
										<div style="color: #f1a03c">환불</div>
										
									</c:if>
									<c:if test="${list.refund eq 0 }">
										<div>${list.payNum}</div>
										<div id="${list.payNum }_date" title="${list.payDate }">(${list.payDate })</div>
										<div id="${list.payNum}_storeName">${list.storeName }</div>
										
										<c:if test="${list.review eq 0 }">
										<div title="${list.payNum}" name="${list.storeNum }" class="survey_btn btn" data-toggle="modal" data-target="#myModal" style="outline: 0px; border-color: #999;">
											<i class="fa fa-pencil-square-o" style="font-size:24px;color:black"></i>
											<span style="font-weight: bold; color: black">리뷰 쓰기</span>
											<span id="${list.payNum }_dday" style="color: green; font-weight: bold;"></span>
										</div>
										</c:if>
										<c:if test="${list.review eq 1 }">
										<div title="${list.payNum}" name="${list.storeNum }" class="survey_btn btn"  style="outline: 0px; border-color: #999;cursor:default;">
											<i class="fa fa-pencil-square-o" style="font-size:24px;color:#999"></i>
											<span style="font-weight: bold; color: black">작성 완료</span>
										</div>
										</c:if>
									</c:if>
									
									
								</td>
								<td><div>${list.name }(${list.codeDesc })-<c:if test="${list.setting eq null }">단품</c:if><c:if test="${list.setting ne null }">세트</c:if></div></td>
								<td class="rowSet2" id="${list.payNum}_total">${list.totalPrice}</td>
								<td class="rowSet3">
						          <span class="btn glyphicon glyphicon-hand-right detail_btn" title="${list.payNum}" id="${list.payNum}" style="color: white; background-color: #009223"></span>
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
			<span class="count" hidden="hidden" >${findNum.payNum }</span>
			
		</c:forEach>
		<c:if test="${!empty list }">
		<div class="row">
			<div id="addBtn" style="border-radius:30px; height:50px; line-height:45px; border: 3px solid #009223; width: 10%;margin: 0 auto; text-align: center; font-weight: bold; color: #009223;">더 보기</div>
		</div>
		</c:if>
	</div>
	
	
	
	 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="font-weight: bold;"></h4>
        </div>
        <div class="modal-body">
          <div style="font-weight: bold; font-size: 30px;"><div class="col-sm-4">맛</div>
          
          	<c:forEach begin="1" end="5" varStatus="i">
	          	<i class="fa fa-star taste" id="taste_${i.index}" title="${i.index }" style="font-size:48px;color:#999;"></i>
          	</c:forEach>
          	
          </div>
          <div style="font-weight: bold; font-size: 30px;"><div class="col-sm-4">위생</div>
          	<c:forEach begin="1" end="5" varStatus="i">
	          	<i class="fa fa-star hygiene" id="hygiene_${i.index}" title="${i.index }" style="font-size:48px;color:#999;"></i>
          	</c:forEach>
          	
          </div>
          <div style="font-weight: bold; font-size: 30px;"><div class="col-sm-4">친절</div>
          	<c:forEach begin="1" end="5" varStatus="i">
	          	<i class="fa fa-star kind" id="kind_${i.index}" title="${i.index }" style="font-size:48px;color:#999;"></i>
          	</c:forEach>
          	
          </div>
          
          
          <form>
		    <div class="form-group">
		      <label for="comment">Comment:</label>
		      <textarea class="form-control" rows="5" id="comment"></textarea>
		    </div>
		  </form>
          
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default write" >리뷰 작성</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  
  
<c:import url="../jsp/footer.jsp"></c:import>
<script type="text/javascript">
	$(".fa-star").css({
		'cursor':'pointer'
	});
	
	
	
	function grade(item){
		$("."+item).click(function(){
			$("."+item).removeClass(item+"_point");
			var grade = $(this).attr("title");
			for(var i=1;i<6;i++){
				$("#"+item+"_"+i).css({
					'color':'gray'
				});
				if(i==grade){
					for(var j=0;j<i+1;j++){
						$("#"+item+"_"+j).css({
							'color':'#f1a03c'
						});
					}
				}
			}
		$(this).addClass(item+"_point");
		});

	}



	
	
	var id = "${member.id}";
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
		}
		if(total_count%5==1 && payNum!=prePaynum){
			detail_count.push(count-1);
		}
	});
	
	console.log(total_count);
	$("#addBtn").css({
		'cursor':'pointer'
	});

	var clickCount=0;
	$("#addBtn").click(function(){
	clickCount++;
	var startNum = detail_count[clickCount];
	var lastNum = detail_count[clickCount+1]*1-startNum;
	if(!lastNum){
		lastNum=count-startNum;			//마지막 페이지 계산
		$("#addBtn").remove();
	}
	console.log("s :"+startNum);
	console.log("l:"+lastNum);
	console.log("f:"+count);
		$.ajax({
			type:'get',
			url:'./orderInfoMore',
			data:{
				id:id,
				startNum:startNum,
				lastNum:lastNum
			},success:function(data){
				$("#addPage").append(data.trim());
				$(".detail_btn").unbind('click');	//다른 페이지에 같은 이벤트를 사용시 중복되어 적용이 안되어서 삭제 후
				detail_pointer();					// 재 실행
				
			}
		});
	});
</script>	


<script type="text/javascript">
$(document).ready(function() {
	//파라미터 숨기기
	//history.replaceState({}, null, location.pathname);

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
		
		
	});
	detail_pointer();
	function detail_pointer(){

	$(".detail_btn").click(function(){
		var payNum = $(this).attr("title");
		var total=$("#"+payNum+"_total").text();
		total = addComma(total);
		$("#"+payNum+"_total").text(total);
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
	}
	



	
	function addComma(x) {
		x = x.toString().replace("원", "");
		x = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		x = x+"원";
		return x;
	}

	$(".survey_btn").each(function(){
		var date = new Date();
		date.setDate(date.getDate()-7);
		var title=$(this).attr("title");
		var payDate=$("#"+title+"_date").attr("title");
		payDate = new Date(payDate);

		if(date>payDate){
			$(this).children().css({
				'color':'#999',
			});
			$(this).addClass("expiration");
			$(this).removeClass("survey_btn");
		}
		var dday= payDate.getTime()-date.getTime();
		var result = Math.floor(dday / (1000 * 60 * 60 * 24));    // gap을 일(밀리초 * 초 * 분 * 시간)로 나눈다. 이 때 -1 을 곱해야 날짜차이가 맞게 나온다.
		console.log(result);
		if(result>0){
			$("#"+title+"_dday").text("D-"+result);
			
			
		} else{
			$(this).removeAttr("data-toggle");
			$(this).removeAttr("data-target");
		}
	});
	$(".expiration").click(function(){
		alert("리뷰 작성 기간이 지났습니다.");
	});


		grade("taste");
		grade("hygiene");
		grade("kind");

	
	var payNum,storeNum;
	
	$(".survey_btn").click(function(){
		$("#taste_1").addClass("taste_point");
		$("#hygiene_1").addClass("hygiene_point");
		$("#kind_1").addClass("kind_point");
		$("#taste_1").css({
			'color':'#f1a03c'
		});
		$("#hygiene_1").css({
			'color':'#f1a03c'
		});
		$("#kind_1").css({
			'color':'#f1a03c'
		});
		payNum=$(this).attr("title");
		storeNum=$(this).attr("name");
		var storeName = $("#"+payNum+"_storeName").text();
		$(".modal-title").text(storeName);
	});


	$(".write").click(function(){
		var taste=$(".taste_point").attr("title")*1;
		var hygiene= $(".hygiene_point").attr("title")*1;
		var kindness=$(".kind_point").attr("title")*1;
		var comment = $("#comment").val();
		console.log(taste,hygiene,kindness,comment);
		console.log(payNum,storeNum);
		$.ajax({
			type:'post',
			url:'./surveyInsert',
			data:{
				taste:taste,
				kindness:kindness,
				hygiene:hygiene,
				comment:comment,
				storeNum:storeNum,
				payNum:payNum
			},
			success:function(){
				alert("리뷰작성 완료");
				location.reload();
			}
		});
	});
	
	
</script>


</body>
</html>