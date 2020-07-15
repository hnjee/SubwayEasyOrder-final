<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.section{
	width: 1170px;
	height: 300px;
	margin-bottom: 15px;
	text-align: center;
}
.my_info{
    background-color: #ffffff;
    border: 6px solid #ffc300;
    border-top-left-radius: 50px;
    
}
.my_search{
	background-color: #ffc300;
    border-top-right-radius: 10px;
}
.my_box{
	padding-top: 42px;
    height: 300px;
    width: 370px;
    margin-left: 15px;
    float: left;
}
.my_point{
    background-color: #009223;
}
.my_order{
	background-color: #9631a8;
}
.my_coupon{
	background-color: #ff8300;
    border-bottom-right-radius: 50px;
}
.my_card{
	background-color: #00a9ec;
}
.sub_title{
    text-align: center;
    font-size: 40px;
    color: #292929;
    font-weight: bold !important;
    letter-spacing: -0.05em;
    padding: 73px 0 50px;
    font-family: 'font_sw';
    
}
.title{
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 20px;
    color: #ffffff;
}
.my_btn{
    border: 2px solid #ffffff;
    color: #ffffff;
    position: absolute;
    margin-left: -63px;
    width: 126px;
    border-radius: 30px;
    height: 36px;
    line-height: 36px;
    font-weight: bold;
    margin-top: 70px;
}
.count{
	margin-top: 30px;
	color: #ffffff;
}
#id{
	font-size: 30px;
}
.name{
	overflow: hidden;
    color: #292929;
    font-size: 20px;
    font-weight: bold;
    line-height: 78px;
    height: 100%;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<link rel="stylesheet" type="text/css"  href="../css/headerStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/menuSelectStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/footerStyle.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/indexStyle.css">

<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
	<c:import url="../jsp/header.jsp"></c:import>

	




	<div class="container" style="padding-bottom: 200px;">
		
<%-- 		<div class="row">
				<div class="col-sm-4">
					<a href="${pageContext.request.contextPath}/store/storeSearch">
						<i class="material-icons" style="font-size:48px;color:#009223;" >my_location</i>
						<div style="color: gray;">가까운 매장</div>
					</a>
				</div>
				<div class="col-sm-4">
					<a href="${pageContext.request.contextPath}/member/memberOrderInfo">
						<i class='fas fa-file-invoice-dollar' style='font-size:48px;color:#f1a03c'></i>
						<div style="color: gray;">주문내역</div>
					</a>
				</div>
				<div class="col-sm-4">
					<a href="${pageContext.request.contextPath}/member/memberMenu">
						<img alt="" height="48px;" src="${pageContext.request.contextPath}/images/sandwich.png">
						<div style="color: gray;">나만의 메뉴</div>
					</a>
				</div>
			


		</div> --%>
			<h2 class="sub_title">MY SUB</h2>
			
			<section class="section">
				<div class="my_box my_info" style="padding-top: 35px;">
					<div style="margin-left: 0px;" class="row">
						<img alt="" src="../images/img_profile_male.png" style="margin-left: 15px; float: left;">
						<p style="margin: 30px 30px 0 0;">
						<strong id="id">
						${member.name }님
						<br>
						반갑습니다!
						</strong>
					</div>
					<div class="row">
						<a href="./memberInfo" class="btn"><span class="my_btn" style="color: gray; border-color: gray; margin-top: 18px;">회원 정보 변경</span></a>
					</div>
				
				</div>	
					
					
					
				<div class="my_box my_point">
					<span class="title">멤버십 포인트</span>
					<div class="count">
						<h1><strong>${member.oriPoint }</strong>P</h1>
					</div>
					<div>
						<a href="./memberPoint" class="btn"><span class="my_btn">포인트 관리</span></a>
					</div>
				</div>
						
				<div class="my_box my_search">
					<span class="title">내 주변 매장</span>
					<div class="count">
						<h1>　</h1>
					</div>
					<div>
						<a href="../store/storeSearch" class="btn"><span class="my_btn">매장 검색</span></a>
					</div>
				</div>		
					
			</section>
			<section class="section">
				<div class="my_box my_order">
					<span class="title">주문내역</span>
					<div class="count">
						<h1><strong>${orderCount }</strong>개</h1>
					</div>
					<div>
						<a href="./memberOrderInfo" id="orderListNum" class="btn"><span class="my_btn">주문내역 관리</span></a>
					</div>
				</div>	
					
				<div class="my_box my_card">
					<span class="title">나만의 메뉴</span>
					<div class="count">
						<h1>　</h1>
					</div>
					<div>
						<a href="./memberMenu" class="btn"><span class="my_btn">나만의 메뉴 관리</span></a>
					</div>
				</div>	
				
					
				<div class="my_box my_coupon">
					<span class="title">쿠폰</span>
					<div class="count">
						<h1>　</h1>
					</div>
					<div>
						<a href="#" class="btn"><span class="my_btn">쿠폰 관리</span></a>
					</div>
				</div>		
					
			</section>
			<div style="margin-top: 210px;font-size: 28px; color:#292929;font-weight: bold;letter-spacing: -0.05em;padding-bottom: 38px;">
				<div class="col-sm-6">
					<div>
					    자주 찾는 매장
					</div>
					<c:forEach items="${store }" var="store">
						<div class="row" style="border: 1px solid #e5e5e5; margin-bottom: 5px;">
							<div class="col-sm-10">
								<img class="delete" title="${store.storeNum }" alt="" src="../images/icon_bookmark.png">
								<span class="name">${store.name }</span>
							</div>
							<div class="col-sm-2">
								<i class="material-icons delete" title="${store.storeNum }" style="font-size: 40px; color:#e5e5e5; text-align: center;top: 15px; position: absolute;">clear</i>
							</div>	
						</div>
					</c:forEach>
					
					<c:forEach begin="${storeCount }" end="2">
						<div class="regStore"
							style="text-align:center; color: #999999; font-size: 20px; font-weight: bold; line-height: 80px; height: 80px;">매장	추가
							<img style="top: -3px; position: relative;" height="22px" width="22px" alt="" src="../images/icon_add.png">
						</div>
					</c:forEach>
				</div>
				<div class="col-sm-6">이벤트</div>
			</div>
		</div>
		
		

		
		
		
		<c:forEach items="${ findNum}" var="list" varStatus="i">
			<span hidden="hidden" class="num_count"  style=" color: black;">${list.payNum }</span>
		</c:forEach>
		
		

	
	<c:import url="../jsp/footer.jsp"></c:import>
	
	
	
</body>
<script type="text/javascript">
var payNum = "check";
var prePaynum="check";
var total_count=0;
var count=0;
var detail_count=new Array();
$(".num_count").each(function(){
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
if(detail_count.length==0){
	detail_count[1]=0;
} 
if(detail_count.length==1){
	detail_count[1]=count;
}
for(var i=0;i<detail_count.length;i++){
	console.log("count:"+detail_count[i]);
	
}
console.log("count:"+detail_count.length);
$("#orderListNum").attr("href","./memberOrderInfo?startNum=0&lastNum="+detail_count[1]);
</script>

<script type="text/javascript">
	$(".content").css({
		'height':'126px'
	});
	$(".regStore").css({
		'cursor':'pointer'
	});
	$(".delete").css({
		'cursor':'pointer'
	});
	$(".delete").click(function(){
		var storeNum = $(this).attr("title");
		var id="${member.id}";
		if(confirm("자주찾는 매장에서 삭제하시겠습니까?")){
			location.href="./oftenStoreDel?storeNum="+storeNum+"&id="+id;
		}
	});

	$(".regStore").click(function(){
		location.href="../store/storeList";
	});
</script>
</html>