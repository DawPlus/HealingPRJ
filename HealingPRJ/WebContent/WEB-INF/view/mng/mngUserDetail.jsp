<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	String userNo = (String) request.getAttribute("userNo");
%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>하이힐링원 통계프로그램</title>
<link href="/lumino/css/bootstrap.min.css" rel="stylesheet">
<link href="/lumino/css/font-awesome.min.css" rel="stylesheet">
<link href="/lumino/css/datepicker3.css" rel="stylesheet">
<link href="/lumino/css/styles.css" rel="stylesheet">

<!--Custom Font-->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->



<!-- 홍두표 - 나눔스퀘어 폰트 불러오기 -->
<style>
@import
	url(https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css)
	;

body {
	text-decoration: none;
	text-decoration-line: none;
	text-decoration-thickness: initial;
	text-decoration-style: initial;
	text-decoration-color: initial;
	font-family: 'NanumSquare';
	font-size: 20px;
	font-weight: 500;
}

input[type=password] {
	font-family: none;
}

input[type=text], input[type=password] {
	width: 180px;
}

input {
	height: 20px;
	line-height: 14px;
	padding: 2px 5px;
	vertical-align: middle;
	border: 1px solid #999;
	background: #f0f0f0;
	color: #666;
	font-size: 13px;
}

.tab_ln {
	border-top: 1px solid #e1e1e1;
}

.tab_fld {
	display: inline-block;
	text-align: left;
	background: #f1f1f1;
	padding: 5px 9px 5px 15px;
	border-right: 1px solid #cccccc;
	margin-right: -5px;
	font-size: 15px;
	width: 150px;
	color: #3e3e3e;
}

.tab_val {
	display: inline-block;
	padding: 5px 9px 5px;
	font-size: 15px;
}

input[type=checkbox], input[type=radio] {
	margin: 0px;
	line-height: normal;
}

.astk {
	display: inline-block;
	color: orangered;
	font-size: 20px;
	position: relative;
	top: 6px;
	font-weight: bold;
	margin-bottom: 0px;
}

.valid_res {
	color: orangered;
	font-size: small;
	display: inline-block;
	vertical-align: middle;
}
</style>


</head>
<body>
	<!--/.sidebar Sart-->
	<%@ include file="/WEB-INF/view/top.jsp"%>
	<%@ include file="/WEB-INF/view/sidebar.jsp"%>
	<!--/.sidebar End-->

	<div class="col-sm-9 col-sm-offset-3 col-lg-6 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"> <em class="fa fa-home"></em>
				</a></li>
				<li class="active">관리자 모드</li>
				<li class="active">직원 계정 관리</li>
				<li class="active">직원 상세 정보</li>
			</ol>
		</div>
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">직원 상세 정보</h1>
			</div>
		</div>
		<!--/.row-->

		<!-- 홍두표 - 직원 상세 정보 -->
		<div class="panel panel-default" style="height: 600px;">
			<div class="panel-heading">직원 상세 정보</div>

			<div class="panel-body">
				<!-- <form class="form-horizontal" action="#" method="post">
					<fieldset> -->

				<!-- 사원번호 입력 -->
				<!-- <div class="form-group">
							<label class="col-md-3" for="name" style="width:180px">사원번호</label>
							<div class="col-md-5">
								<input name="empCode" type="text" placeholder="사원번호" class="form-control">
							</div>
						</div> -->

				<!-- 이름 입력 -->
				<!-- <div class="form-group">
							<label class="col-md-3" for="name" style="width:180px">이름</label>
							<div class="col-md-5">
								<input name="ename" type="text" placeholder="이름" class="form-control">
							</div>
						</div> -->

				<!-- 비밀번호 입력 -->
				<!-- <div class="form-group">
							<div class="">
								<label class="col-md-3" for="name" style="width:180px">비밀번호</label>
							</div>
							<div class="col-md-5">
								<input name="pwd" type="password" placeholder="비밀번호" class="form-control">
							</div>
							<div class="" style="color: orangered;font-size: small;display: inline;vertical-align: middle;">
								비밀번호가 일치하지 않습니다.
							</div>
						</div> -->

				<!-- 비밀번호 확인 입력 -->
				<!-- <div class="form-group">
							<label class="col-md-3" for="name" style="width:180px">비밀번호 확인</label>
							<div class="col-md-5">
								<input name="pwdChk" type="password" placeholder="비밀번호 확인" class="form-control">
							</div>
						</div> -->

				<!-- 권한 -->
				<!-- <div class="form-group">
							<label class="col-md-3" for="email" style="width:180px">권한</label>
							<div class="col-md-5" style="font-size:large;">
								<input name="radio" type="radio" value="" class=""> 관리자
								<input name="radio" type="radio" value="" class=""> 직원
							</div>
						</div> -->

				<!-- Message body -->
				<!-- <div class="form-group">
							<label class="col-md-2" for="message">Your message</label>
							<div class="col-md-5">
								<textarea class="form-control" id="message" name="message" placeholder="Please enter your message here..." rows="5"></textarea>
							</div>
						</div> -->

				<!-- Form actions -->
				<!-- <div class="form-group">
							<div class="col-md-12" style="text-align:center;">
								<button type="submit" class="btn btn-md btn-primary" onclick="validChk();return false;">수정</button>
								<button type="button" class="btn btn-default btn-md">취소</button>
							</div>
						</div>
					</fieldset>
				</form> -->
				<form>
					<div class="" style="width: 600px; background-color: white">
						<div style="margin: 7%;">
							<!-- 사원번호 입력 -->
							<div class="tab_ln" style="">
								<div class="tab_fld" style="">
									사원번호
									<p class="astk">&nbsp;*</p>
								</div>
								<div class="tab_val" style="">
									<input id="empCode" name="empCode" type="text"
										placeholder="BDH09211">
								</div>
							</div>

							<!-- 이름 입력 -->
							<div class="tab_ln" style="">
								<div class="tab_fld" style="">
									이 름
									<p class="astk">&nbsp;*</p>
								</div>
								<div class="tab_val" style="">
									<input id="ename" name="ename" type="text" placeholder="홍길동">
								</div>
							</div>

							<!-- 비밀번호 입력 -->
							<div class="tab_ln" style="">
								<div class="tab_fld" style="">비밀번호</div>
								<div class="tab_val" style="">
									<input name="pwd" id="pwd" type="password" placeholder="비밀번호">
								</div>
							</div>

							<!-- 비밀번호 확인 입력 -->
							<div class="tab_ln" style="">
								<div class="tab_fld" style="">비밀번호 확인</div>
								<div class="tab_val" style="">
									<input name="pwdChk" id="pwdChk" type="password"
										placeholder="비밀번호 확인">
								</div>
							</div>

							<!-- 권한 -->
							<div class="tab_ln"
								style="border-bottom: 1px solid #e1e1e1; margin-bottom: 20px;">
								<div class="tab_fld" style="">
									권한
									<p class="astk">&nbsp;*</p>
								</div>
								<div class="tab_val" style="">
									<span style="padding-left: 5px;"> <input type="radio"
										id="auth_1" name="auth" style="" checked> <label
										for="radio_auth_1"
										style="margin-bottom: 0px; font-weight: inherit;">관리자</label>
									</span> <span style="padding-left: 10px;"> <input type="radio"
										id="auto_2" name="auth" style=""> <label
										for="radio_auth_2"
										style="margin-bottom: 0px; font-weight: inherit;">직원</label>
									</span>
								</div>
							</div>
						</div>
						<!-- Form actions -->
						<div class="form-group">
							<div class="col-md-12" style="text-align: center;">
								<button type="submit" class="btn btn-md btn-primary"
									onclick="validAllChk();return false;">수정</button>
								<button type="button" class="btn btn-default btn-md">취소</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>

		<!-- 		<div style="width:200px; height:300px">sdf</div> -->
		<!-- <div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default chat" style="word-break: break-all;">
					사용중입니다.
				</div>
			</div>
		</div> -->


	</div>
	<!--/.main-->

	<script src="/lumino/js/jquery-1.11.1.min.js"></script>
	<script src="/lumino/js/bootstrap.min.js"></script>
	<script src="/lumino/js/chart.min.js"></script>
	<script src="/lumino/js/chart-data.js"></script>
	<script src="/lumino/js/easypiechart.js"></script>
	<script src="/lumino/js/easypiechart-data.js"></script>
	<script src="/lumino/js/bootstrap-datepicker.js"></script>
	<script src="/lumino/js/custom.js"></script>
	<script>
		/* 홍두표 - 유효성 검사 */
		function validAllChk() {
			var empCode = $('#empCode');
			var ename = $('#ename');
			var pwd = $('#pwd');
			var pwdChk = $('#pwdChk');

			/* 사원번호 유효성 검사 */
			if (empCode.val() != "") {
				alert("사원번호를 조회할 수 없습니다.");
				empCode.focus();
				return false;
			} else {
				$('#empCode_valid_res').text("");
			}

			/* 이름 유효성 검사 */
			if (ename.val() != "") {
				alert("이름을 정확히 기재해주시기 바랍니다.");
				ename.focus();
				return false;
			} else {
				$('#ename_valid_res').text("");
			}

			/* 비밀번호 유효성 검사 */
			if (pwd.val().includes('>') || pwd.val().includes('<')
					|| pwd.val().length < 8 || pwd.val().length > 20) {
				alert("비밀번호는 8~20자리이며, 반드시 영문자·숫자·특수문자를 혼합하여 입력하시기 바랍니다.\n\n입력가능 특수문자 : ~!@#$%^&*");
				pwd.focus();
				return false;
			} else {
				$('#pwd_valid_res').text("");
			}

			/* 비밀번호 확인 일치 여부 */
			if (pwd.val() != pwdChk.val()) {
				alert("비밀번호가 일치하지 않습니다.");
				pwdChk.focus();
				return false;
			} else {
				$('#pwdChk_valid_res').text("");
			}

		}
	</script>

</body>
</html>