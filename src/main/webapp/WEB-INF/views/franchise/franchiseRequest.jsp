<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUBWAY 가맹점 신청</title>
<c:import url="../template/boot.jsp"></c:import>
<link rel="stylesheet" type="text/css"  href="../css/headerStyle.css"> 
<link rel="stylesheet" type="text/css"  href="../css/footerStyle.css">

<link href="../css/subway/ui.commonFranchise.css" rel="stylesheet" type="text/css">
<link href="../css/subway/mCustomScrollbar.css" rel="stylesheet" type="text/css">
<script src="../js/subway/ui.common.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>


</head>
<body>

<div id="wrap">
<!-- header start -->
<c:import url="../jsp/header.jsp"></c:import>
<!-- header end -->

<!-- main start -->
<div class="main_wrapper" id="container">
	
	<div id="content">
				<div class="inquiry_wrapper">
					<h2 class="subTitle">가맹신청ㆍ문의</h2>

					<div class="content">
						<form id="frm" method="post" name="frm" action="../franchise/franchiseRequest">
						<div class="pd_agree_wrapper">
							<!-- 개인정보수집 및 이용동의 -->
							<div class="pd_agree">
								<h3>개인정보수집 및 이용동의</h3>
								<!-- 20180131 -->
								<div class="scroll_wrapper mCustomScrollbar _mCS_1"><div id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0"><div id="mCSB_1_container" class="mCSB_container" style="position: relative; top: -300px; left: 0px;" dir="ltr">
									'서브웨이인터내셔날 비브이' 의 광고를 담당하는 써브웨이 프랜차이즈 광고 기금 트러스트는 (이하 '회사') 는 문의 및 가맹신청 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.<br><br>
									ο 수집항목<br>
									필수항목 : 이름, 이메일, 연락처<br>
									선택항목 : 기타문의사항<br><br>
									ο 개인정보 수집방법 : 홈페이지(문의 및 가맹신청)<br><br>
									■ 개인정보의 수집 및 이용목적<br>
									회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br><br>
									ο 신청자 관리<br>
									서비스 이용에 따른 가입 의사 확인, 연령확인, 불만처리 등 민원처리, 고지사항 전달<br>
									(민원처리를 위해 해당 매장 및 매장 담당 지사에 성함 및 연락처가 전달될 수 있음을 알려드립니다.)<br><br>
									ο 마케팅 및 광고에 활용<br>
									 이벤트 등 광고성 정보 전달, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계<br><br>
									■ 개인정보의 보유 및 이용기간<br>
									원칙적으로, 개인정보 수집 및 이용목적이 달성된 후(회원 탈퇴 등)에는 귀하의 개인정보를 지체 없이 파기합니다. 단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.<br><br>
									계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)<br>
									소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래등에서의 소비자보호에 관한 법률)
								</div><div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: block;"><div class="mCSB_draggerContainer"><div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; display: block; height: 50px; max-height: 140px; top: 100px;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>
								<!--// 20180131 -->
								<!-- checkbox -->
								<label class="form_checkbox">
									<input name="agree1" id="agree1" type="checkbox">
									<span class="icon"></span>개인정보수집 및 이용에 동의합니다. <em>(필수)</em>
								</label>
								<!--// checkbox -->
							</div>
							<!--// 개인정보수집 및 이용동의 -->
							<!-- 개인정보 위탁동의 -->
							<div class="pd_agree">
								<h3>개인정보 위탁동의</h3>
											<!-- 20180131 -->
								<div class="scroll_wrapper mCustomScrollbar _mCS_2"><div id="mCSB_2" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" tabindex="0" style="max-height: none;"><div id="mCSB_2_container" class="mCSB_container" style="position:relative; top:0; left:0;" dir="ltr">
									개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.<br><br>
									회사는 개인정보 취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.<br><br>
									 ο 본 방침은 : 2018 년 1 월 31 일 부터 시행됩니다.<br><br>
									써브웨이인터내셔날 비브이는 (이하 '회사'는) 고객님의 개인정보 를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.
								</div><div id="mCSB_2_scrollbar_vertical" class="mCSB_scrollTools mCSB_2_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: block;"><div class="mCSB_draggerContainer"><div id="mCSB_2_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; display: block; height: 150px; max-height: 140px;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>
								<!--// 20180131 -->
								<!-- checkbox -->
								<label class="form_checkbox">
									<input name="agree2" id="agree2" type="checkbox">
									<span class="icon"></span>개인정보 위탁에 동의합니다. <em>(필수)</em>
								</label>
								<!--// checkbox -->
							</div>
							<!--// 개인정보 위탁동의 -->
						</div>

						<h3 class="h_title">가맹점 신청하기</h3>

						<!-- board list s -->
						<div class="board_write_wrapper">
							<p class="rt_note">필수입력사항<span class="ess"></span></p>
							<table>
								<caption>문의 작성하기 테이블</caption>
								<colgroup>
									<col width="130px">
									<col width="*">
								</colgroup>
								<tbody>
								
									<tr>
										<th scope="col">이름<span class="ess"></span></th>
										<td>
											<span class="form_text" style="width:100%">
												<input class="input" maxlength="10" name="ownerName" placeholder="이름을 입력해주세요" type="text" value="">
											</span>
										</td>										
									</tr>
									<tr>
										<th scope="col">가맹점 명<span class="ess"></span></th>
										<td>
											<span class="form_text" style="width:100%">
												<input class="input" maxlength="10" name="storeName" placeholder="가맹점 이름을 입력해주세요" type="text" value="">
											</span>
										</td>
									</tr>									
									<tr>
										<th scope="col">이메일<span class="ess"></span></th>
										<td>
											<span class="form_text" style="width:200px">
												<input class="input" maxlength="50" name="email1" placeholder="이메일" type="text" value="">
											</span>
											<span class="em">@</span>
											<span class="form_text" style="width:200px">
												<input class="input" maxlength="50" name="email2" id="setDomain" type="text" value="">
											</span>
											<div class="form_select" style="width:196px; margin-left:7px;">
												<select id="emailDomain" name="dmain" onchange="change()">
													<option value="">직접입력</option>
													<option value="naver.com">naver.com</option>
													<option value="hanmail.net">hanmail.net</option>
													<option value="hotmail.com">hotmail.com</option>
													<option value="nate.com">nate.com</option>
													<option value="empas.com">empas.com</option>
													<option value="dreamwiz.com">dreamwiz.com</option>
													<option value="lycos.co.kr">lycos.co.kr</option>
													<option value="korea.com">korea.com</option>
													<option value="gmail.com">gmail.com</option>
													<option value="hanmir.com">hanmir.com</option>
												</select>
											</div>
										</td>
									</tr>									
									<tr>
										<th scope="col">주소<span class="ess"></span></th>
										<td>
											<span class="form_text" style="width:100%">
												<input class="input" maxlength="50" name="address" placeholder="정확한 매장 주소를 입력해주세요" type="text" value="">
											</span>
										</td>
									</tr>
									<tr>
										<th scope="col">내용</th>
										<td>
											<span class="form_textarea" style="width:100%">
												<textarea cols="5" maxlength="500" name="memo" placeholder="가맹점 신청과 관련된 문의사항을 작성해 주세요. 
문의하실 내용을 구체적으로 작성해 주시면 더욱 빠르고 정확한 답변을 드릴 수 있습니다." rows="10" style="height:230px;"></textarea>
											</span>
										</td>
									</tr>
									
								</tbody>
							</table>

							<div class="agree_info">
								<p>신청·문의사항에 대한 답변은 메일로 발송됩니다.  동의하시겠습니까?</p>
								<!-- checkbox -->
								<label class="form_checkbox">
									<input name="agree3" type="checkbox">
									<span class="icon"></span>예, 동의합니다.
								</label>
								<!--// checkbox -->
							</div>

							<div class="inquiry_notice">
								<ul>
									<li>· 문의가 집중되거나 주말의 경우 답변이 지연될 수 있습니다. 최대한 빠르게 답변 드리도록 하겠습니다.</li>
									<li>· 욕설, 비속어, 비방성 등의 부적절한 단어 포함되어 있는 경우, 답변 진행이 어려울 수 있습니다.</li>
								</ul>
							</div>
						</div>

						<div class="btns_wrapper">
							<a class="btn bgc_white" href="../" style="width:126px;"><span>취소</span></a>
							<button type="submit" class="btn bgc_point i_reg" id="submitBtn" style="width:170px;"><span style="width: 70px; margin-left: 25px;">등록하기</span></button>
						</div>
						</form>
					</div>
				</div>
			</div>


</div>
<!-- main end -->

<!-- footer start -->
<c:import url="../jsp/footer.jsp"></c:import>
<!-- footer end -->


<script type="text/javascript">
	function change(){
		$('#setDomain').val($("#emailDomain option:selected").val());
	}

	
	$('#submitBtn').on("click", function(event){
		var agree1 = $('#agree1').prop("checked");
		var agree2 = $('#agree2').prop("checked");
		var agree3 = $('#agree3').prop("checked");
		console.log(agree1);
		
		if(agree1 == false || agree2 == false || agree3 == false){
			alert("약관에 동의하세요.");
			event.preventDefault();
		}

		var inputs = document.getElementsByClassName('input');
		 for (var i = 0; i < inputs.length; i++){
			    if (inputs[i].value == ""){
					event.preventDefault();
			    }
			    
			  }
		
		//if(!$('.input').val()){
		//	alert("필수 사항을 모두 채워주세요");
		//	event.preventDefault();
		//}
				
	});
	

	
	
</script>

</div>
</body>
</html>