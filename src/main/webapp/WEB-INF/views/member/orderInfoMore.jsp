<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<body>
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
									<div>${list.payNum}</div>
									<div id="${list.payNum }_date" title="${list.payDate }">(${list.payDate })</div>
									<div id="${list.payNum}_storeName">${list.storeName }</div>
									<c:if test="${list.review eq 0 }">
									<div title="${list.payNum}" name="${list.storeNum }" class="survey_btn btn" data-toggle="modal" data-target="#myModal" style="outline: 0px; border-color: #999;">
										<i class="fa fa-pencil-square-o" style="font-size:24px;color:black"></i>
										<span style="font-weight: bold; color: black">리뷰 쓰기</span>
										<span id="${list.payNum }_dday" style="color: green; font-weight: bold;"></span>
										${list.review }
									</div>
									</c:if>
									<c:if test="${list.review eq 1 }">
									<div title="${list.payNum}" name="${list.storeNum }" class="survey_btn btn"  style="outline: 0px; border-color: #999;">
										<i class="fa fa-pencil-square-o" style="font-size:24px;color:#999"></i>
										<span style="font-weight: bold; color: black">작성 완료</span>
										${list.review }
									</div>
									</c:if>
									
									
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
</body>

<script type="text/javascript">
 	

	 

	
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
	
	
	

</script>
