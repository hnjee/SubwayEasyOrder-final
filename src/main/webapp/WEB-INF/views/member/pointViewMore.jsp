<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
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
	<c:if test="${empty point }">
		<input hidden="hidden" id="remove" value="1">
	</c:if>
</body>
<script type="text/javascript">
if($("#remove").val()=='1'){
	$("#addBtn").remove();
	
}
</script>
</html>