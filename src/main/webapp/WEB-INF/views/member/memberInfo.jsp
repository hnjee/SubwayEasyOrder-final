<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/headerStyle.css">
<link rel="stylesheet" type="text/css" href="../css/menuSelectStyle.css">
<link rel="stylesheet" type="text/css" href="../css/footerStyle.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>

<style type="text/css">
.input_set dl {
	background-color: #fff;
	overflow: hidden;
	border: 1px solid #e5e5e5;
	padding: 22px 30px;
}

input {
	vertical-align: middle;
	font-family: font_ns, sans-serif;
	outline: none;
}

.form_text input {
	width: 90%;
	border: 0;
	background: transparent;
	height: 45px;
	color: #292929;
	font-size: 16px;
	text-indent: 15px;
}

.input_set dt {
	float: left;
	position: relative;
	font-weight: 300;
	width: 120px;
	line-height: 35px;
	letter-spacing: -0.05em;
}

dd {
	display: block;
	margin-inline-start: 40px;
}

.write_info_wrap .input_set dd .form_text input {
	height: 35px;
	line-height: 35px;
	text-indent: 20px;
	letter-spacing: -0.05em;
}

dt {
	font-size: 14px;
	color: #666666;
	font-family: font_ns, sans-serif;
}
.inquiry_notice {
    background: #f6f6f6 url(../images/icon_exc.png) 25px 50% no-repeat;
    display: flex;
    color: #999999;
    flex-direction: column;
    justify-content: center;
    font-size: 13px;
    margin-top: 20px;
    padding: 15px 15px 19px 81px;
    min-height: 52px;
    margin: 0 auto;
    width: 874px;
    line-height: 130%;
}
</style>
</head>


<body>

	<c:import url="../jsp/header.jsp"></c:import>
	<div class="container" style="margin-bottom: 190px;">
		<div class="row" style="text-align: center;">
			<h2 style="padding: 73px 0 18px; font-weight: bold; font-size: 35px;">비밀번호
				확인</h2>
			<p style="color: #666666; font-size: 16px; letter-spacing: -0.3px;">
				회원가입 시 등록한 비밀번호를 재입력 해주세요.

				<section class="form_box" style="padding: 87px 100px 0 100px;">
					<div class="write_info_wrap">
						<!-- 입력1세트 -->
						<div class="input_set">
							<dl>
								<dt>
									아이디<span class="ess"></span>
								</dt>
								<dd>
									<span class="form_text" style="width: 500px;"> <input
										style="color: black;" readonly="" type="text"
										value="${member.id }" />
									</span>

								</dd>
							</dl>
						</div>
						<!--// 입력1세트 -->
						<div class="input_set">
							<dl>
								<dt>
									비밀번호<span class="ess"></span>
								</dt>
								<dd>
									<span class="form_text"> <input class="chk-value"
										id="pw" name="pw" placeholder="비밀번호 입력" type="password" />
									</span>
								</dd>
							</dl>
						</div>
					</div>
				</section>
			<div class="inquiry_notice">
				<ul>
					<li style="color: #999999; font-size: 13px;text-align: left;padding-top: 15px;">개인정보 보호를 위해 주기적으로 비밀번호를 변경해 주시고, 타인에게 비밀번호가 노출되지 않도록 주의해
						주세요.</li>
				</ul>
			</div>
			<button style="border:0px; margin-top:140px; display:inline-block; vertical-align:middle; background-color:#009223;color: white;width: 170px;border-radius: 30px;"><span style="height: 50px;line-height: 50px;font-weight: bold;font-size: 18px;">확인</span></button>
		</div>
	</div>



	<c:import url="../jsp/footer.jsp"></c:import>
</body>
</html>