<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<body>
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
	
	

</script>
