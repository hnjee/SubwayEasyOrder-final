<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"  href="../css/headerStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/menuSelectStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/footerStyle.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style type="text/css">
.agree_font{
	color: #666666;
    font-size: 18px;
    font-weight: 300px;
    letter-spacing: -0.05em;
    padding-bottom: 5px;
}
body {
    font-size: 16px;
    color: #666666;
    font-family: font_ns, sans-serif;
}
.agree_box{
	width: 550px;
	height: 150px;
	overflow: auto;
	font-size: 13px;
	color: #bbbbbb;
	margin-bottom: 30px;
	
}
.sel{
	margin-bottom: 30px;

}
.far{
	font-size: 30px;
	color: #bbbbbb;
	padding: 5px 5px 5px 0px;
}
.btn{
	width: 200px;
	height: 50px;
	color: white;
	font-size: 25px;
	
	
}
span{
	color: green;
}



</style>
</head>
<body>
	<c:import url="../jsp/header.jsp"></c:import>
	<div class="container" style="padding-bottom: 200px;">
		<div class="row" style="text-align: center; margin: 30px 0 40px 0;">
			<h1 style="font-weight: bold; ">회원가입</h1>
		</div>
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				
			
			
				<div class="agree_font">
					<input type="checkbox" id="check_all" hidden="hidden">
					<label for="check_all">
					
						<div class="row">
							<div class="col-sm-1">
								<i class='far fa-check-circle' id="all_box"></i>
							</div>
							<div class="col-sm-11">
								정보수집 및 이용,개인정보 위탁,위치정보 이용약관(선택),<br>이벤트 문자 수신(선택)에 모두 동의합니다.
							</div>
						</div>
						
					</label>
				</div>
			
			
			
				<div class="agree_font">
					<input type="checkbox" class="check" id="check1" hidden="hidden">
					<label for="check1">
						<i class='far fa-check-circle' id='check1_box'></i>
						정보수집 및 이용동의 <span>(필수)</span>
					</label>
					
					
		
				</div>
				
				
				<div class="agree_box" style="border: 1px solid black">
					'서브웨이인터내셔날 비브이' 의 광고를 담당하는 써브웨이 프랜차이즈 광고 기금 트러스트는 (이하 '회사') 는 문의 및
					가맹신청 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.<br /> <br /> ο 수집항목<br />
					필수항목 : 이름, 이메일, 연락처<br /> 선택항목 : 기타문의사항<br /> <br /> ο 개인정보 수집방법 :
					홈페이지(문의 및 가맹신청)<br /> <br /> ■ 개인정보의 수집 및 이용목적<br /> 회사는 수집한 개인정보를
					다음의 목적을 위해 활용합니다.<br /> <br /> ο 신청자 관리<br /> 서비스 이용에 따른 가입 의사 확인,
					연령확인, 불만처리 등 민원처리, 고지사항 전달<br /> (민원처리를 위해 해당 매장 및 매장 담당 지사에 성함 및
					연락처가 전달될 수 있음을 알려드립니다.)<br /> <br /> ο 마케팅 및 광고에 활용<br /> 이벤트 등 광고성
					정보 전달, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계<br /> <br /> ■ 개인정보의 보유 및 이용기간<br />
					원칙적으로, 개인정보 수집 및 이용목적이 달성된 후(회원 탈퇴 등)에는 귀하의 개인정보를 지체 없이 파기합니다. 단,
					관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를
					보관합니다.<br /> <br /> 계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한
					법률)<br /> 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래등에서의 소비자보호에 관한 법률)

				</div>
				
				<div class="agree_font">
					<input type="checkbox" class="check" id="check2" hidden="hidden">
						<label for="check2">
							<i class='far fa-check-circle' id= 'check2_box'></i>
							개인정보 위탁동의<span>(필수)</span>
						</label>
				</div>
				<div style="border: 1px solid black;" class="agree_box">
					개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.<br />
					<br /> 회사는 개인정보 취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.<br />
					<br /> ο 본 방침은 : 2018 년 1 월 31 일 부터 시행됩니다.<br />
					<br /> 써브웨이인터내셔날 비브이는 (이하 '회사'는) 고객님의 개인정보 를 중요시하며, "정보통신망 이용촉진 및
					정보보호"에 관한 법률을 준수하고 있습니다.

				</div>
				
				<div class="agree_font sel">
					<input type="checkbox" class="check" id="check3" hidden="hidden">
					<label for="check3">
							<i class='far fa-check-circle' id= 'check3_box'></i>
							위치정보 이용약관 동의 (선택)
					</label>
				</div>
				
				
				<div class="agree_font sel">
					<input type="checkbox" class="check" id="check4" hidden="hidden">
					<label for="check4">
						<i class='far fa-check-circle' id ='check4_box'></i>
						이벤트 문자 수신 (선택)
							
					</label>
				</div>
			
			
			<div class="col-sm-6">
				<div class="btn" id="cancel" style="background: #ffbe00;">취소</div>
			</div>
			
			
			<div class="col-sm-6">
				<div class="btn" id="submit" style="background: rgb(0, 152, 61);">확인</div>
		
			</div>
			
			
			
			</div>
			<div class="col-sm-3">
				
			</div>
			
		
		</div>
	
	</div>
	<c:import url="../jsp/footer.jsp"></c:import>
</body>
<script type="text/javascript">
	$("#submit").click(function(){
		var count = 0 ;
		$(".check").each(function(){
			var id=$(this).attr("id");
			if(id=="check1" || id=="check2"){
				if($(this).prop("checked")){
					count++;
				}
			}
		});
		if(count==2){
			location.href="./memberJoin2";
		} else{
			alert("필수항목을 모두 체크해주세요.");
		}
	});


	$("#cancel").click(function(){
		location.href="/";
	});
	$("label").mouseover(function(){
		$("label").css({
			'cursor' : 'pointer'
		});
	});
	$("#check_all").click(function(){
		var result = false;
		if($("#check_all").prop("checked")){
			result=true;
		}
		$(".check").prop("checked",result);
		if(result){
			$(".far").css({
				'color':'rgb(0, 152, 61)'
			});
		} else{
			$(".far").css({
				'color':'#bbbbbb'
			});
		}
	});
	$(".check").click(function(){
		var result = true;
		var id = $(this).attr("id");
		if($(this).prop("checked")){
			$("#"+id+"_box").css({
				'color':'rgb(0, 152, 61)'
			});
		} else {
			$("#"+id+"_box").css({
				'color':'#bbbbbb'
			});
		}
		$(".check").each(function(){
			if(!$(this).prop("checked")){
				result = false;
			}
		});
		$("#check_all").prop("checked",result);
		if(result){
			$("#all_box").css({
				'color':'rgb(0, 152, 61)'
			});
		} else {
			$("#all_box").css({
				'color':'#bbbbbb'
			});
		}
	});

</script>

</html>