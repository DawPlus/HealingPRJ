<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="poly.util.CmmUtil" %>
<%@ page import ="poly.dto.BasicInfoPageDTO" %>

<%
String reg_id = (String) session.getAttribute("user_name");

%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>하이힐링원 통계프로그램</title>
<link href="/lumino/css/bootstrap.min.css" rel="stylesheet">
<link href="/lumino/css/font-awesome.min.css" rel="stylesheet">
<link href="/lumino/css/datepicker3.css" rel="stylesheet">
<link href="/lumino/css/styles.css" rel="stylesheet">
<link rel="stylesheet" href="/css/checkstyle.css">

<!-- 자바스크립트 alert 디자인 -->
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
</style>
<!-- 홍두표 - 나눔스퀘어 폰트 불러오기 -->

<!-- submit css -->
<style>
.button, .tick {
	display: flex;
	justify-content: center;
	align-items: center;
	font-family: sans-serif;
}

.button {
	width: 300px;
	height: 80px;
	background: #28a745;
	border-radius: 6px;
	transition: all .3s cubic-bezier(0.67, 0.17, 0.40, 0.83);
}

.button svg {
	transform: rotate(180deg);
	transition: all .5s;
}

.button__circle {
	width: 120px;
	height: 120px;
	background: mediumseagreen;
	border-radius: 50%;
	transform: rotate(-180deg);
}

.button:hover {
	cursor: pointer;
}

.tick {
	color: white;
	font-size: 2em;
	transition: all .9s;
}
</style>

</head>

<body class="show">
	<%@ include file="/WEB-INF/view/top.jsp"%>
	<%@ include file="/WEB-INF/view/sidebar.jsp"%>

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"> <em class="fa fa-home"></em>
				</a></li>
				<li class="active">프로그램 결과 입력</li>
			</ol>
		</div>
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">프로그램 결과 입력</h1>
			</div>
		</div>
		<!--/.row-->


		<!-- 입력서식  -->
		<div class="row">

			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading clearfix">프로그램 결과 입력</div>
					<div class="panel-body">

						<!-- form 시작 -->
						<div class="form-horizontal row-border">
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">단체명</label>
								<div class="col-md-10">
									<input type="text" name="agency" class="form-control"
										placeholder="직접입력" style="font-size: 16pt;">
								</div>
							</div>
							<hr>
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">OM</label>
								<div class="col-md-10">
									<input type="text" name="om" class="form-control"
										placeholder="직접입력" style="font-size: 16pt;">
								</div>
							</div>
							<hr>
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">참여일자</label>
								<div class="col-md-10">
									<input type='date' name="openday" id="openday"
										style="font-size: 16pt" /> <input type='date' name="endday"
										id="endday" style="font-size: 16pt" />

								</div>
							</div>
							<hr>
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">체류기간(일)</label>
								<div class="col-md-10">
									<span class="help-block " id="tostay"></span>
								</div>
							</div>
							<hr>
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">거주지역</label>
								<div class="col-md-10">
									<select class="form-control input-lg" name="residence"
										id="residence" style="width: 200px; border-radius: 5px;">
										<%@ include file="/WEB-INF/view/insertForm/residences.jsp"%>
										<option value="폐광지역">폐광지역</option>
									</select>
								</div>
							</div>
							<hr>
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">참여인원</label>
								<div class="col-md-10">
									<label class="checkbox-inline">참여자 </label> <br />

									<div class="col-xs-6" style="display: inline-flex;">
										<label class="col-xs-3 control-label">남자</label>
										<div class="col-xs-5">
											<input type="number" name="part_man_cnt" class="form-control perChange"
												id="per01" placeholder="명" style="font-size: 16pt">
										</div>

										<label class="col-xs-3 control-label">여자</label>
										<div class="col-xs-5">
											<input type="number" name="part_woman_cnt" class="form-control perChange"
												id="per02" placeholder="명" style="font-size: 16pt">
										</div>
									</div>
								</div>

								<label class="col-md-2 control-label"></label>
								<div class="col-md-10">
									<label class="checkbox-inline">인솔자 </label> <br />

									<div class="col-xs-6" style="display: inline-flex;">
										<label class="col-xs-3 control-label">남자</label>
										<div class="col-xs-5">
											<input type="number" name="lead_man_cnt" class="form-control perChange"
												id="per03" placeholder="명" style="font-size: 16pt">
										</div>

										<label class="col-xs-3 control-label">여자</label>
										<div class="col-xs-5">
											<input type="number" name="lead_woman_cnt" class="form-control perChange"
												id="per04" placeholder="명" style="font-size: 16pt">
										</div>
									</div>
								</div>

								<div class="col-md-5 control-label">
									<label class="checkbox-inline"> <span
										class="help-block " id="total_people">실인원 : 참여자+인솔자 </span>
									</label> <label class="checkbox-inline"> <span
										class="help-block" id="total_people_days">연인원 :
											실인원×체류기간</span>
									</label>
								</div>
							</div>

							<hr>
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">지원사항</label>
								<div class="col-md-10">
									
								</div>
							</div>

							<hr>
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">사업목적</label>
								<div class="col-md-10">
									
								</div>
							</div>

							<hr>
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">참가자유형</label>
								<div class="col-md-10">
									
									%>
								</div>
							</div>
							
							<hr>
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">연령대</label>
								<div class="col-md-10">
									
								</div>
							</div>
							
							<hr>
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">수입구분</label>
								<div class="col-md-10">
									
								</div>
							</div>

							<hr>
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">서비스유형</label>
								<div class="col-md-10">
									
								</div>
							</div>
							<hr>
							<div id="test00">
								<div style="float: right; padding-right: 100px;">
									<span id="box1"><input type="button" value="추가"
											class="btn btn-success btn-md" style="font-size: 18px;"></span>
									<span id="box2"><input type="button" value="삭제"
											class="btn btn-danger btn-md" style="font-size: 18px;"></span>
								</div>
								<div class="form-group justify-content-center" id="test">
									<!--프로그램명 추가  -->
									<label class="col-md-2 control-label">프로그램명</label>
									<div class="col-md-1">
										<input type="text" name="programName" class="form-control"
											placeholder="프로그램명" style="font-size: 16pt;">
									</div>
									<!--분야 추가  -->
									<label class="col-md-1 control-label" style="width:103px;">분야</label>
									<div class="col-md-1">
										<select class="form-control input-lg" name="bunya"
											style="border-radius: 5px; font-size: 15pt;">
											<option value="">선택</option>
											
										</select>
									</div>
									<!--강사명 추가 -->
									<label class="col-md-1 control-label" style="width:103px;">강사명</label>
									<div class="col-md-1">
										<input type="text" name="teacher" class="form-control"
											placeholder="이름" style="font-size: 16pt;">
									</div>
									<label class="col-md-1 control-label" style="width:103px;">내부강사</label>
									<div class="col-md-1">
										<input type="number" name="in_tutor" class="form-control"
											placeholder="명" style="font-size: 16pt;">
									</div>

									<label class="col-md-1 control-label" style="width:103px;">외부강사</label>
									<div class="col-md-1">
										<input type="number" name="out_tutor" class="form-control"
											placeholder="명" style="font-size: 16pt;">
									</div>

								</div>


							</div>

							<hr>

							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">객실</label>
								<div class="col-md-10">
									<label class="checkbox-inline">참여자 </label> <br />

									<div class="col-xs-6" style="display: inline-flex;">
										<label class="col-xs-3 control-label">인원</label>
										<div class="col-xs-5">
											<input type="number" name="room_part_people"
												class="form-control roomChange" id="room01" placeholder="명"
												style="font-size: 16pt;">
										</div>

										<label class="col-xs-3 control-label">객실</label>
										<div class="col-xs-5">
											<input type="number" name="room_part_room" class="form-control roomChange"
												id="room02" placeholder="객실" style="font-size: 16pt;">
										</div>
									</div>
								</div>

								<label class="col-md-2 control-label"></label>
								<div class="col-md-10">
									<label class="checkbox-inline">인솔자 </label> <br />

									<div class="col-xs-6" style="display: inline-flex;">
										<label class="col-xs-3 control-label">인원</label>
										<div class="col-xs-5">
											<input type="number" name="room_lead_people"
												class="form-control roomChange" id="room03" placeholder="명"
												style="font-size: 16pt;">
										</div>

										<label class="col-xs-3 control-label">객실</label>
										<div class="col-xs-5">
											<input type="number" name="room_lead_room" class="form-control roomChange"
												id="room04" placeholder="객실" style="font-size: 16pt;">
										</div>
									</div>
								</div>

								<label class="col-md-2 control-label"></label>
								<div class="col-md-10">
									<label class="checkbox-inline">기타 </label> <br />

									<div class="col-xs-6" style="display: inline-flex;">
										<label class="col-xs-3 control-label">인원</label>
										<div class="col-xs-5">
											<input type="number" name="room_etc_people"
												class="form-control roomChange" id="room05" placeholder="명"
												style="font-size: 16pt;">
										</div>

										<label class="col-xs-3 control-label">객실</label>
										<div class="col-xs-5">
											<input type="number" name="room_etc_room" class="form-control roomChange"
												id="room06" placeholder="객실" style="font-size: 16pt;">
										</div>
									</div>
								</div>

								<div class="col-md-5 control-label">
									<label class="checkbox-inline"> <span
										class="help-block " id="total_room_person"> 총인원 : </span>
									</label> <label class="checkbox-inline"> <span
										class="help-block" id="total_room_count"> 총객실 : </span>
									</label>
								</div>
							</div>
							<hr />

							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">식사</label>
								<div class="col-md-10">
									<label class="control-label">
									<input class="form-control" type="number" name="meal_type" id="meal" min='0' max='12' step='1' required
									style="width: 100px; font-size: 20px; margin-bottom: 10px;" placeholder="횟수">
									</label>
								</div>

								<div class="form-group justify-content-center"
									style="display: inline-flex;">

									<label class="col-md-3 control-label"></label>
									<div class="col-md-2.5">
										<label class="checkbox-inline">참여자</label> <br />

										<div class="col-md-10" style="display: inline-flex;">
											<label class="col-md-4 control-label">인원</label>
											<div class="col-md-6">
												<input type="number" name="meal_part" class="form-control"
													placeholder="명" style="font-size: 16pt;">
											</div>
										</div>
									</div>

									<div class="col-md-2.5">
										<label class="checkbox-inline">인솔자</label> <br />

										<div class="col-md-10" style="display: inline-flex;">
											<label class="col-md-4 control-label">인원</label>
											<div class="col-md-6">
												<input type="number" name="meal_lead" class="form-control"
													placeholder="명" style="font-size: 16pt;">
											</div>
										</div>
									</div>

									<div class="col-md-2.5">
										<label class="checkbox-inline">기타</label> <br />

										<div class="col-md-10" style="display: inline-flex;">
											<label class="col-md-4 control-label">인원</label>
											<div class="col-md-6">
												<input type="number" name="meal_etc" class="form-control"
													placeholder="명" style="font-size: 16pt;">
											</div>
										</div>
									</div>

								</div>
							</div>
							<hr />
							<hr />
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">프로그램 소감</label>
								<div class="col-md-10">
									<textarea name="program_opinion"
										class="form-control" style="font-size: 13pt" rows="7"
										cols="100"></textarea>
								</div>
							</div>
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">시설서비스 소감 <br>(식사 포함)</label>
								<div class="col-md-10">
									<textarea name="service_opinion"
										class="form-control" style="font-size: 13pt" rows="7"
										cols="100"></textarea>
								</div>
							</div>

							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">종합의견 및 불편사항</label>
								<div class="col-md-10">
									<textarea name="overall_opinion"
										class="form-control" style="font-size: 13pt" rows="7"
										cols="100"></textarea>
								</div>
							</div>
							<hr />
							
							
							
							<!-- 지출금액 -->
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">지출금액</label>
								<div class="col-md-10" style="margin-bottom : 30px;">
									<!--기존예산 강사  -->
									<label class="checkbox-inline" >예정금액-강사 </label> <br />

									<div class="col-md-10" style="height:60px">
										<label class="col-md-1 control-label">강사비</label>
										<div class="col-md-2">
											<input type="number" name="gangsaYejungGangsa_price" class="form-control" placeholder="금액(천원)" style="font-size: 13pt;">
										</div>
										
										<label class="col-md-1 control-label">보조강사비</label>
										<div class="col-md-2">
											<input type="number" name="gangsaYejungBojoGangsa_price" class="form-control"  placeholder="금액(천원)" style="font-size: 13pt;">
										</div>

										<label class="col-md-1 control-label">교통비</label>
										<div class="col-md-2">
											<input type="number" name="gangsaYejungGyotong_price" class="form-control"  placeholder="금액(천원)" style="font-size: 13pt;">
										</div>

										<label class="col-md-1 control-label">식비</label>
										<div class="col-md-2">
											<input type="number" name="gangsaYejungGyotong_price" class="form-control" placeholder="금액(천원)" style="font-size: 13pt;">
										</div>
									</div>
									
									<!--집행금액 강사  -->
									<label class="checkbox-inline" style="inline-size: -webkit-fill-available;">집행금액-강사 </label> <br />
									
									<div class="col-md-10" style="height:60px" id="gangsaJeaphangGangsa0">
										<div style="float: right; width: 125px; height:60px">
											<span id="gangsaJeaphangGangsa_add"><input type="button" value="추가"
												class="btn btn-success btn-md" style="font-size: 18px;"></span>
											<span id="gangsaJeaphangGangsa_del"><input type="button" value="삭제"
												class="btn btn-danger btn-md" style="font-size: 18px;"></span>
										</div>
										<label class="col-md-1 control-label">강사비</label>
										<div class="col-md-2">
											<input type="number" name="gangsaJeaphangGangsa_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
										</div>
										<div class="col-md-4">
											<input type="text" name="gangsaJeaphangGangsa_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
										</div>
										<div class="col-md-3">
											<input type="text" name="gangsaJeaphangGangsa_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
										</div>
									</div>
									<div id="gangsaJeaphangGangsa_box">
									</div>
									<!--집행금액 보조강사  -->
									<div class="col-md-10" style="height:60px" id="gangsaJeaphangBojoGangsa0">
										<div style="float: right; width: 125px; height:60px">
											<span id="gangsaJeaphangBojoGangsa_add"><input type="button" value="추가"
												class="btn btn-success btn-md" style="font-size: 18px;"></span>
											<span id="gangsaJeaphangBojoGangsa_del"><input type="button" value="삭제"
												class="btn btn-danger btn-md" style="font-size: 18px;"></span>
										</div>
										<label class="col-md-1 control-label">보조강사비</label>
										<div class="col-md-2">
											<input type="number" name="gangsaJeaphangBojoGangsa_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
										</div>
										<div class="col-md-4">
											<input type="text" name="gangsaJeaphangBojoGangsa_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
										</div>
										<div class="col-md-3">
											<input type="text" name="gangsaJeaphangBojoGangsa_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
										</div>
									</div>
									<div id="gangsaJeaphangBojoGangsa_box">
									</div>
									<!--집행금액 교통비  -->
									<div class="col-md-10" style="height:60px" id="gangsaJeaphangGyotong0">
										<div style="float: right; width: 125px; height:60px">
											<span id="gangsaJeaphangGyotong_add"><input type="button" value="추가"
												class="btn btn-success btn-md" style="font-size: 18px;"></span>
											<span id="gangsaJeaphangGyotong_del"><input type="button" value="삭제"
												class="btn btn-danger btn-md" style="font-size: 18px;"></span>
										</div>
										<label class="col-md-1 control-label">교통비</label>
										<div class="col-md-2">
											<input type="number" name="gangsaJeaphangGyotong_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
										</div>
										<div class="col-md-4">
											<input type="text" name="gangsaJeaphangGyotong_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
										</div>
										<div class="col-md-3">
											<input type="text" name="gangsaJeaphangGyotong_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
										</div>
									</div>
									<div id="gangsaJeaphangGyotong_box">
									</div>
									<!--  -->
									<!--집행금액 식사비  -->
									<div class="col-md-10" style="height:60px" id="gangsaJeaphangSiksa0">
										<div style="float: right; width: 125px; height:60px">
											<span id="gangsaJeaphangSiksa_add"><input type="button" value="추가"
												class="btn btn-success btn-md" style="font-size: 18px;"></span>
											<span id="gangsaJeaphangSiksa_del"><input type="button" value="삭제"
												class="btn btn-danger btn-md" style="font-size: 18px;"></span>
										</div>
										<label class="col-md-1 control-label">식사비</label>
										<div class="col-md-2">
											<input type="number" name="gangsaJeaphangSiksa_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
										</div>
										<div class="col-md-4">
											<input type="text" name="gangsaJeaphangSiksa_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
										</div>
										<div class="col-md-3">
											<input type="text" name="gangsaJeaphangSiksa_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
										</div>
									</div>
									<div id="gangsaJeaphangSiksa_box">
									</div>
									<!--  -->
									<!--예정금액 참가자  -->
									<label class="checkbox-inline" style="inline-size: -webkit-fill-available;">예정금액-참가자 </label> <br />
									<div class="col-md-10" style="height:60px">
										<label class="col-md-1 control-label">숙박비</label>
										<div class="col-md-2">
											<input type="number" name="charmgaYejungSookbak_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
										</div>

										<label class="col-md-1 control-label">식사비</label>
										<div class="col-md-2">
											<input type="number" name="charmgaYejungSiksa_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
										</div>

										<label class="col-md-1 control-label">재료비</label>
										<div class="col-md-2">
											<input type="number" name="charmgaYejungJaeryo_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
										</div>
										
										<label class="col-md-1 control-label">예비비</label>
										<div class="col-md-2">
											<input type="number" name="charmgaYejungYebi_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
										</div>
									</div>
									<!--집행금액 참가자  -->
									<label class="checkbox-inline" style="inline-size: -webkit-fill-available;">집행금액-참가자 </label> <br />
									
									<div class="col-md-10" style="height:60px" id="charmgaJeaphangSookbak0">
										<div style="float: right; width: 125px; height:60px">
											<span id="charmgaJeaphangSookbak_add"><input type="button" value="추가"
												class="btn btn-success btn-md" style="font-size: 18px;"></span>
											<span id="charmgaJeaphangSookbak_del"><input type="button" value="삭제"
												class="btn btn-danger btn-md" style="font-size: 18px;"></span>
										</div>
										<label class="col-md-1 control-label">숙박비</label>
										<div class="col-md-2">
											<input type="number" name="charmgaJeaphangSookbak_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
										</div>
										<div class="col-md-4">
											<input type="text" name="charmgaJeaphangSookbak_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
										</div>
										<div class="col-md-3">
											<input type="text" name="charmgaJeaphangSookbak_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
										</div>
									</div>
									<div id="charmgaJeaphangSookbak_box">
									</div>
									<!--  -->
									<!--집행금액 참가 식사비  -->
									<div class="col-md-10" style="height:60px" id="charmgaJeaphangSiksa0">
										<div style="float: right; width: 125px; height:60px">
											<span id="charmgaJeaphangSiksa_add"><input type="button" value="추가"
												class="btn btn-success btn-md" style="font-size: 18px;"></span>
											<span id="charmgaJeaphangSiksa_del"><input type="button" value="삭제"
												class="btn btn-danger btn-md" style="font-size: 18px;"></span>
										</div>
										<label class="col-md-1 control-label">식사비</label>
										<div class="col-md-2">
											<input type="number" name="charmgaJeaphangSiksa_price0" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
										</div>
										<div class="col-md-4">
											<input type="text" name="charmgaJeaphangSiksa_detail0" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
										</div>
										<div class="col-md-3">
											<input type="text" name="charmgaJeaphangSiksa_note0" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
										</div>
									</div>
									<div id="charmgaJeaphangSiksa_box">
									</div>
									<!--  -->
									<!--집행금액 참가 재료비  -->
									<div class="col-md-10" style="height:60px" id="charmgaJeaphangJaeryo0">
										<div style="float: right; width: 125px; height:60px">
											<span id="charmgaJeaphangJaeryo_add"><input type="button" value="추가"
												class="btn btn-success btn-md" style="font-size: 18px;"></span>
											<span id="charmgaJeaphangJaeryo_del"><input type="button" value="삭제"
												class="btn btn-danger btn-md" style="font-size: 18px;"></span>
										</div>
										<label class="col-md-1 control-label">재료비</label>
										<div class="col-md-2">
											<input type="number" name="charmgaJeaphangJaeryo_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
										</div>
										<div class="col-md-4">
											<input type="text" name="charmgaJeaphangJaeryo_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
										</div>
										<div class="col-md-3">
											<input type="text" name="charmgaJeaphangJaeryo_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
										</div>
									</div>
									<div id="charmgaJeaphangJaeryo_box">
									</div>
									<!--  -->
									<!--집행금액 참가 기타  -->
									<div class="col-md-10" style="height:60px" id="charmgaJeaphangGita0">
										<div style="float: right; width: 125px; height:60px">
											<span id="charmgaJeaphangGita_add"><input type="button" value="추가"
												class="btn btn-success btn-md" style="font-size: 18px;"></span>
											<span id="charmgaJeaphangGita_del"><input type="button" value="삭제"
												class="btn btn-danger btn-md" style="font-size: 18px;"></span>
										</div>
										<label class="col-md-1 control-label">기타</label>
										<div class="col-md-2">
											<input type="number" name="charmgaJeaphangGita_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
										</div>
										<div class="col-md-4">
											<input type="text" name="charmgaJeaphangGita_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
										</div>
										<div class="col-md-3">
											<input type="text" name="charmgaJeaphangGita_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
										</div>
									</div>
									<div id="charmgaJeaphangGita_box">
									</div>
									<!--  -->
								</div>
							</div>
							<hr />
							<!--수입금액 -->
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">수입금액</label>
								<div class="col-md-10" style="margin-bottom : 30px;">
									<!--수입금액 프로그램  -->
									<div class="col-md-10" style="height:60px" id="suibProgram0">
										<div style="float: right; width: 125px; height:60px">
											<span id="suibProgram_add"><input type="button" value="추가"
												class="btn btn-success btn-md" style="font-size: 18px;"></span>
											<span id="suibProgram_del"><input type="button" value="삭제"
												class="btn btn-danger btn-md" style="font-size: 18px;"></span>
										</div>
										<label class="col-md-1 control-label">프로그램</label>
										<div class="col-md-2">
											<input type="number" name="suibProgram_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
										</div>
										<div class="col-md-4">
											<input type="text" name="suibProgram_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
										</div>
										<div class="col-md-3">
											<input type="text" name="suibProgram_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
										</div>
									</div>
									<div id="suibProgram_box">
									</div>
									<!--  -->
									<!--수입금액 숙박  -->
									<div class="col-md-10" style="height:60px" id="suibSookbak0">
										<div style="float: right; width: 125px; height:60px">
											<span id="suibSookbak_add"><input type="button" value="추가"
												class="btn btn-success btn-md" style="font-size: 18px;"></span>
											<span id="suibSookbak_del"><input type="button" value="삭제"
												class="btn btn-danger btn-md" style="font-size: 18px;"></span>
										</div>
										<label class="col-md-1 control-label">숙박비</label>
										<div class="col-md-2">
											<input type="number" name="suibSookbak_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
										</div>
										<div class="col-md-4">
											<input type="text" name="suibSookbak_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
										</div>
										<div class="col-md-3">
											<input type="text" name="suibSookbak_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
										</div>
									</div>
									<div id="suibSookbak_box">
									</div>
									<!--  -->
									<!--수입금액 식사  -->
									<div class="col-md-10" style="height:60px" id="suibSiksa0">
										<div style="float: right; width: 125px; height:60px">
											<span id="suibSiksa_add"><input type="button" value="추가"
												class="btn btn-success btn-md" style="font-size: 18px;"></span>
											<span id="suibSiksa_del"><input type="button" value="삭제"
												class="btn btn-danger btn-md" style="font-size: 18px;"></span>
										</div>
										<label class="col-md-1 control-label">식사비</label>
										<div class="col-md-2">
											<input type="number" name="suibSiksa_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
										</div>
										<div class="col-md-4">
											<input type="text" name="suibSiksa_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
										</div>
										<div class="col-md-3">
											<input type="text" name="suibSiksa_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
										</div>
									</div>
									<div id="suibSiksa_box">
									</div>
									<!--  -->
									<!--수입금액 재료 -->
									<div class="col-md-10" style="height:60px" id="suibJaeryo0">
										<div style="float: right; width: 125px; height:60px">
											<span id="suibJaeryo_add"><input type="button" value="추가"
												class="btn btn-success btn-md" style="font-size: 18px;"></span>
											<span id="suibJaeryo_del"><input type="button" value="삭제"
												class="btn btn-danger btn-md" style="font-size: 18px;"></span>
										</div>
										<label class="col-md-1 control-label">재료비</label>
										<div class="col-md-2">
											<input type="number" name="suibJaeryo_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
										</div>
										<div class="col-md-4">
											<input type="text" name="suibJaeryo_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
										</div>
										<div class="col-md-3">
											<input type="text" name="suibJaeryo_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
										</div>
									</div>
									<div id="suibJaeryo_box">
									</div>
									<!--  -->
									<!--수입금액 기타  -->
									<div class="col-md-10" style="height:60px" id="suibGita0">
										<div style="float: right; width: 125px; height:60px">
											<span id="suibGita_add"><input type="button" value="추가"
												class="btn btn-success btn-md" style="font-size: 18px;"></span>
											<span id="suibGita_del"><input type="button" value="삭제"
												class="btn btn-danger btn-md" style="font-size: 18px;"></span>
										</div>
										<label class="col-md-1 control-label">기타</label>
										<div class="col-md-2">
											<input type="number" name="suibGita_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
										</div>
										<div class="col-md-4">
											<input type="text" name="suibGita_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
										</div>
										<div class="col-md-3">
											<input type="text" name="suibGita_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
										</div>
									</div>
									<div id="suibGita_box">
									</div>
									<!--  -->
									<!--수입금액 할인율  -->
									<div class="col-md-10" style="height:60px" id="suibDiscount0">
										<label class="col-md-1 control-label">할인율</label>
										<div class="col-md-2">
											<input type="number" name="suibDiscount_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
										</div>
										<div class="col-md-7">
											<input type="text" name="suibDiscount_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
										</div>
									</div>
									<!--  -->
								</div>
								
							</div>
							
							
							
							<div class="col-xs-12" style="text-align: center;">
								<button class="button" id="semiSaveButton" style="margin: 0 auto; display: inline-flex; background-color:#808080">
									<div class="container">
										<div class="tick" id="semiSaveTick"></div>
									</div>
								</button>
								<button class="button" id="button" style="margin: 0 auto; display: inline-flex">
									<div class="container">
										<div class="tick" id="tick"></div>
									</div>
								</button>
							</div>
						</div>
						<!-- form 끝 -->
					</div>

				</div>
			</div>
		</div>

	</div>

</body>
<!-- 스크립트 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>

	// 홍두표 - 요소를 받고 값이 있으면 값을 반환, 없으면 데이터 타입에 맞는 디폴트 값 부여
	getOrDefaultValue = (factor) => {
		if(!factor) {
			return factor.value;
		}
	    if(type == 'text') {
	        return '';
	    }
	    if(type == 'textarea') {
	        return '';
	    }
	    if(type == 'date') {
	        alert('시작일자와 종료일자를 입력해주세요.');
	        return false;
	    }
	    if(type == 'number') {
	        return 0;
	    }
	}

	// 참여일자 계산
	let L_TODAY = document.querySelector('#tostay');
	let days_to_stay = 0;
	endday.oninput = function (e) {
		console.log(e);
		var openday = document.getElementById("openday");
		var endday = document.getElementById("endday");
		days_to_stay = ((endday.valueAsDate.getTime() - openday.valueAsDate.getTime()) / 1000 / 60 / 60 / 24) + 1;
		
		console.info(days_to_stay + "일")
		if(days_to_stay < 1) {
			alert("날짜 선택이 올바르지 않습니다.");
			endday.value = "";
			return false;
		}
		tostay.innerHTML = days_to_stay;
	}
	// 참여일자 순서 바뀌어도 되게끔 추가
	let days_to_stay2 = 0;
	openday.oninput = function (e) {
		console.log(e);
		var openday2 = document.getElementById("openday");
		var endday2 = document.getElementById("endday");
		days_to_stay2 = ((endday2.valueAsDate.getTime() - openday2.valueAsDate.getTime()) / 1000 / 60 / 60 / 24) + 1;
		
		console.info(days_to_stay2 + "일")
		if(days_to_stay2 < 1) {
			alert("날짜 선택이 올바르지 않습니다.");
			endday2.value = "";
			return false;
		}
		tostay.innerHTML = days_to_stay2;
	}

	// 참여인원 계산
	var total = 0;
	$(".perChange").change(function() {
		var user1 = document.getElementById("per01").value;
		var user2 = document.getElementById("per02").value;
		var user3 = document.getElementById("per03").value;
		var user4 = document.getElementById("per04").value;
		var checkIndex = 0;
		if(user1!='') {
			checkIndex++;
		} 
		if(user2!='') {
			checkIndex++;
		}
		if(user3!='') {
			checkIndex++;
		}
		if(user4!='') {
			checkIndex++;
		}
		if(checkIndex==4) {
			total = parseInt(user1) + parseInt(user2) + parseInt(user3) + parseInt(user4);
		}
		var yeartotal = L_TODAY.textContent.replace("일", "");
		total_people.innerHTML = "실인원 : " + total + "명";
		total_people_days.innerHTML = "연인원 : " + (total * yeartotal) + "명";
		total = 0;
	})

	// 프로그램 추가 삭제 
	var count = 1;
	box1.onclick = function () {
		const box = document.getElementById("test00");
		const test = document.getElementById('test').innerHTML;
		const newP = document.createElement('div');
		newP.setAttribute("id", "test" + count);
		newP.setAttribute("class", "form-group justify-content-center");

		newP.innerHTML = test;
		box.appendChild(newP);
		count++;
	}
	
	box2.onclick = function () {

		var addedFormDiv = document.getElementById("test00");
		if (count > 1) { // 현재 폼이 두개 이상이면
			var addedDiv = document.getElementById("test" + (--count));
			// 마지막으로 생성된 폼의 ID를 통해 Div객체를 가져옴
			addedFormDiv.removeChild(addedDiv); // 폼 삭제 
		} else { // 마지막 폼만 남아있다면
			document.baseForm.reset(); // 폼 내용 삭제
		}

	}
	
	//집행내역 버튼
	var jeaphangGangsaGangsaCount=1;
	jeaphangGangsaGangsa_add.onclick = function () {
		
		let new_div = `<div class="col-md-10" style="height:60px" id="jeaphangGangsaGangsa`+jeaphangGangsaGangsaCount+`"><label class="col-md-1 control-label">   </label><div class="col-md-2"><input type="number" name="" class="form-control" id="lead_execute_invite" placeholder="금액(천원)" style="font-size: 13pt;"></div><div class="col-md-4"><input type="text" name="" class="form-control" id="lead_execute_transport" placeholder="세부내역" style="font-size: 13pt;"></div><div class="col-md-3"><input type="text" name="" class="form-control" id="lead_execute_transport" placeholder="비고" style="font-size: 13pt;"></div></div>`
		$("#jeaphangGangsaGangsa_box").append(new_div);
		jeaphangGangsaGangsaCount++;
    		
	}
	jeaphangGangsaGangsa_del.onclick = function () {
		var addedFormDiv = document.getElementById("jeaphangGangsaGangsa_box");
		if (jeaphangGangsaGangsaCount > 1) { // 현재 폼이 두개 이상이면
			var addedDiv = document.getElementById("jeaphangGangsaGangsa" + (--jeaphangGangsaGangsaCount));
			// 마지막으로 생성된 폼의 ID를 통해 Div객체를 가져옴
			addedFormDiv.removeChild(addedDiv); // 폼 삭제 
		} else { // 마지막 폼만 남아있다면
		}

	}
	///////////////////////////////////////////////////////////////////////////////
	//교통비 버튼
	var jeaphangGangsaGyotongCount=1;
	jeaphangGangsaGyotong_add.onclick = function () {
		
		let new_div = `<div class="col-md-10" style="height:60px" id="jeaphangGangsaGyotong`+jeaphangGangsaGyotongCount+`"><label class="col-md-1 control-label">   </label><div class="col-md-2"><input type="number" name="" class="form-control" id="lead_execute_invite" placeholder="금액(천원)" style="font-size: 13pt;"></div><div class="col-md-4"><input type="text" name="" class="form-control" id="lead_execute_transport" placeholder="세부내역" style="font-size: 13pt;"></div><div class="col-md-3"><input type="text" name="" class="form-control" id="lead_execute_transport" placeholder="비고" style="font-size: 13pt;"></div></div>`
		$("#jeaphangGangsaGyotong_box").append(new_div);
		jeaphangGangsaGyotongCount++;
    		
	}
	
	jeaphangGangsaGyotong_del.onclick = function () {
		var addedFormDiv = document.getElementById("jeaphangGangsaGyotong_box");
		if (jeaphangGangsaGyotongCount > 1) { // 현재 폼이 두개 이상이면
			var addedDiv = document.getElementById("jeaphangGangsaGyotong" + (--jeaphangGangsaGyotongCount));
			// 마지막으로 생성된 폼의 ID를 통해 Div객체를 가져옴
			addedFormDiv.removeChild(addedDiv); // 폼 삭제 
		} else { // 마지막 폼만 남아있다면
		}

	}
	///////////////////////////////////////////////////////////////////////////////
	//식사비 버튼
	var jeaphangGangsaSiksaCount=1;
	jeaphangGangsaSiksa_add.onclick = function () {
		
		let new_div = `<div class="col-md-10" style="height:60px" id="jeaphangGangsaSiksa`+jeaphangGangsaSiksaCount+`"><label class="col-md-1 control-label">   </label><div class="col-md-2"><input type="number" name="" class="form-control" id="lead_execute_invite" placeholder="금액(천원)" style="font-size: 13pt;"></div><div class="col-md-4"><input type="text" name="" class="form-control" id="lead_execute_transport" placeholder="세부내역" style="font-size: 13pt;"></div><div class="col-md-3"><input type="text" name="" class="form-control" id="lead_execute_transport" placeholder="비고" style="font-size: 13pt;"></div></div>`
		$("#jeaphangGangsaSiksa_box").append(new_div);
		jeaphangGangsaSiksaCount++;
    		
	}
	jeaphangGangsaSiksa_del.onclick = function () {
		var addedFormDiv = document.getElementById("jeaphangGangsaSiksa_box");
		if (jeaphangGangsaSiksaCount > 1) { // 현재 폼이 두개 이상이면
			var addedDiv = document.getElementById("jeaphangGangsaSiksa" + (--jeaphangGangsaSiksaCount));
			// 마지막으로 생성된 폼의 ID를 통해 Div객체를 가져옴
			addedFormDiv.removeChild(addedDiv); // 폼 삭제 
		} else { // 마지막 폼만 남아있다면
		}

	}
	///////////////////////////////////////////////////////////////////////////////
	//참가자 숙박비 버튼
	var jeaphangChamgaSokbakCount=1;
	jeaphangChamgaSokbak_add.onclick = function () {
		
		let new_div = `<div class="col-md-10" style="height:60px" id="jeaphangChamgaSokbak`+jeaphangChamgaSokbakCount+`"><label class="col-md-1 control-label">   </label><div class="col-md-2"><input type="number" name="" class="form-control" id="lead_execute_invite" placeholder="금액(천원)" style="font-size: 13pt;"></div><div class="col-md-4"><input type="text" name="" class="form-control" id="lead_execute_transport" placeholder="세부내역" style="font-size: 13pt;"></div><div class="col-md-3"><input type="text" name="" class="form-control" id="lead_execute_transport" placeholder="비고" style="font-size: 13pt;"></div></div>`
		$("#jeaphangChamgaSokbak_box").append(new_div);
		jeaphangChamgaSokbakCount++;
    		
	}
	jeaphangChamgaSokbak_del.onclick = function () {
		var addedFormDiv = document.getElementById("jeaphangChamgaSokbak_box");
		if (jeaphangChamgaSokbakCount > 1) { // 현재 폼이 두개 이상이면
			var addedDiv = document.getElementById("jeaphangChamgaSokbak" + (--jeaphangChamgaSokbakCount));
			// 마지막으로 생성된 폼의 ID를 통해 Div객체를 가져옴
			addedFormDiv.removeChild(addedDiv); // 폼 삭제 
		} else { // 마지막 폼만 남아있다면
		}

	}
	///////////////////////////////////////////////////////////////////////////////
	//참가자 식사비 버튼
	var jeaphangChamgaSiksaCount=1;
	jeaphangChamgaSiksa_add.onclick = function () {
		
		let new_div = `<div class="col-md-10" style="height:60px" id="jeaphangChamgaSiksa`+jeaphangChamgaSiksaCount+`"><label class="col-md-1 control-label">   </label><div class="col-md-2"><input type="number" name="" class="form-control" id="lead_execute_invite" placeholder="금액(천원)" style="font-size: 13pt;"></div><div class="col-md-4"><input type="text" name="" class="form-control" id="lead_execute_transport" placeholder="세부내역" style="font-size: 13pt;"></div><div class="col-md-3"><input type="text" name="" class="form-control" id="lead_execute_transport" placeholder="비고" style="font-size: 13pt;"></div></div>`
		$("#jeaphangChamgaSiksa_box").append(new_div);
		jeaphangChamgaSiksaCount++;
    		
	}
	jeaphangChamgaSiksa_del.onclick = function () {
		var addedFormDiv = document.getElementById("jeaphangChamgaSiksa_box");
		if (jeaphangChamgaSiksaCount > 1) { // 현재 폼이 두개 이상이면
			var addedDiv = document.getElementById("jeaphangChamgaSiksa" + (--jeaphangChamgaSiksaCount));
			// 마지막으로 생성된 폼의 ID를 통해 Div객체를 가져옴
			addedFormDiv.removeChild(addedDiv); // 폼 삭제 
		} else { // 마지막 폼만 남아있다면
		}

	}
	///////////////////////////////////////////////////////////////////////////////
	//참가자 식사비 버튼
	var jeaphangChamgaJaeRyoCount=1;
	jeaphangChamgaJaeRyo_add.onclick = function () {
		
		let new_div = `<div class="col-md-10" style="height:60px" id="jeaphangChamgaJaeRyo`+jeaphangChamgaJaeRyoCount+`"><label class="col-md-1 control-label">   </label><div class="col-md-2"><input type="number" name="" class="form-control" id="lead_execute_invite" placeholder="금액(천원)" style="font-size: 13pt;"></div><div class="col-md-4"><input type="text" name="" class="form-control" id="lead_execute_transport" placeholder="세부내역" style="font-size: 13pt;"></div><div class="col-md-3"><input type="text" name="" class="form-control" id="lead_execute_transport" placeholder="비고" style="font-size: 13pt;"></div></div>`
		$("#jeaphangChamgaJaeRyo_box").append(new_div);
		jeaphangChamgaJaeRyoCount++;
    		
	}
	jeaphangChamgaJaeRyo_del.onclick = function () {
		var addedFormDiv = document.getElementById("jeaphangChamgaJaeRyo_box");
		if (jeaphangChamgaJaeRyoCount > 1) { // 현재 폼이 두개 이상이면
			var addedDiv = document.getElementById("jeaphangChamgaJaeRyo" + (--jeaphangChamgaJaeRyoCount));
			// 마지막으로 생성된 폼의 ID를 통해 Div객체를 가져옴
			addedFormDiv.removeChild(addedDiv); // 폼 삭제 
		} else { // 마지막 폼만 남아있다면
		}

	}
	///////////////////////////////////////////////////////////////////////////////
	//참가자 기타 버튼
	var jeaphangChamgaGitaCount=1;
	jeaphangChamgaGita_add.onclick = function () {
		
		let new_div = `<div class="col-md-10" style="height:60px" id="jeaphangChamgaGita`+jeaphangChamgaGitaCount+`"><label class="col-md-1 control-label">   </label><div class="col-md-2"><input type="number" name="" class="form-control" id="lead_execute_invite" placeholder="금액(천원)" style="font-size: 13pt;"></div><div class="col-md-4"><input type="text" name="" class="form-control" id="lead_execute_transport" placeholder="세부내역" style="font-size: 13pt;"></div><div class="col-md-3"><input type="text" name="" class="form-control" id="lead_execute_transport" placeholder="비고" style="font-size: 13pt;"></div></div>`
		$("#jeaphangChamgaGita_box").append(new_div);
		jeaphangChamgaGitaCount++;
    		
	}
	jeaphangChamgaGita_del.onclick = function () {
		var addedFormDiv = document.getElementById("jeaphangChamgaGita_box");
		if (jeaphangChamgaGitaCount > 1) { // 현재 폼이 두개 이상이면
			var addedDiv = document.getElementById("jeaphangChamgaGita" + (--jeaphangChamgaGitaCount));
			// 마지막으로 생성된 폼의 ID를 통해 Div객체를 가져옴
			addedFormDiv.removeChild(addedDiv); // 폼 삭제 
		} else { // 마지막 폼만 남아있다면
		}

	}
	///////////////////////////////////////////////////////////////////////////////
	// 객실인원 계산
	var room_person = 0;
	var room_count = 0;
	$(".roomChange").change(function() {
		var room01 = document.getElementById("room01").value;
		var room02 = document.getElementById("room02").value;
		var room03 = document.getElementById("room03").value;
		var room04 = document.getElementById("room04").value;
		var room05 = document.getElementById("room05").value;
		var room06 = document.getElementById("room06").value;
		var checkIndex = 0;
		if(room01!='') {
			checkIndex++;
		} 
		if(room02!='') {
			checkIndex++;
		}
		if(room03!='') {
			checkIndex++;
		}
		if(room04!='') {
			checkIndex++;
		}
		if(room05!='') {
			checkIndex++;
		}
		if(room06!='') {
			checkIndex++;
		}
		if(checkIndex==6) {
			room_person = parseInt(room01) + parseInt(room03) + parseInt(room05);
			room_count = parseInt(room02) + parseInt(room04) + parseInt(room06);
		}
		total_room_person.innerHTML = "총인원 : " + room_person + "명";
		total_room_count.innerHTML = "총 객실 : " + room_count + "호";
		room_person = 0;
		room_count = 0;
	})
	
	
	// 중간 저장 버튼
	let semiSaveButton = document.querySelector('#semiSaveButton');
	let semiSavebuttonText = document.querySelector('#semiSaveTick');
	
	const semiSaveTickMark = "<svg width=\"58\" height=\"45\" viewBox=\"0 0 58 45\" xmlns=\"http://www.w3.org/2000/svg\"><path fill=\"#fff\" fill-rule=\"nonzero\" d=\"M19.11 44.64L.27 25.81l5.66-5.66 13.18 13.18L52.07.38l5.65 5.65\"/></svg>";
	
	// submit 버튼 
	let button = document.querySelector('#button');
	let buttonText = document.querySelector('#tick');
	
	const tickMark = "<svg width=\"58\" height=\"45\" viewBox=\"0 0 58 45\" xmlns=\"http://www.w3.org/2000/svg\"><path fill=\"#fff\" fill-rule=\"nonzero\" d=\"M19.11 44.64L.27 25.81l5.66-5.66 13.18 13.18L52.07.38l5.65 5.65\"/></svg>";

	buttonText.innerHTML = "저장";
	semiSavebuttonText.innerHTML = "중간저장";
	
	button.addEventListener('click', function () {
		
		//미입력시 못넘어가게
		if(document.getElementsByName('agency')[0].value.trim()=="") {
			return document.getElementsByName('agency')[0].focus();
		} else if(document.getElementsByName('om')[0].value.trim()=="") {
			return document.getElementsByName('om')[0].focus();
		} else if(document.getElementsByName('openday')[0].value.trim()=="") {
			return document.getElementsByName('openday')[0].focus();
		} else if(document.getElementsByName('part_man_cnt')[0].value.trim()=="") {
			return document.getElementsByName('part_man_cnt')[0].focus();
		} else if(document.getElementsByName('part_woman_cnt')[0].value.trim()=="") {
			return document.getElementsByName('part_woman_cnt')[0].focus();
		} else if(document.getElementsByName('lead_man_cnt')[0].value.trim()=="") {
			return document.getElementsByName('lead_man_cnt')[0].focus();
		} else if(document.getElementsByName('lead_woman_cnt')[0].value.trim()=="") {
			return document.getElementsByName('lead_woman_cnt')[0].focus();
		}  else if(document.getElementsByName('programName')[0].value.trim()=="") {
			return document.getElementsByName('programName')[0].focus();
		} else if(document.getElementsByName('teacher')[0].value.trim()=="") {
			return document.getElementsByName('teacher')[0].focus();
		} else if(document.getElementsByName('in_tutor')[0].value.trim()=="") {
			return document.getElementsByName('in_tutor')[0].focus();
		} else if(document.getElementsByName('out_tutor')[0].value.trim()=="") {
			return document.getElementsByName('out_tutor')[0].focus();
		} else if(document.getElementsByName('room_part_people')[0].value.trim()=="") {
			return document.getElementsByName('room_part_people')[0].focus();
		} else if(document.getElementsByName('room_part_room')[0].value.trim()=="") {
			return document.getElementsByName('room_part_room')[0].focus();
		} else if(document.getElementsByName('room_lead_people')[0].value.trim()=="") {
			return document.getElementsByName('room_lead_people')[0].focus();
		} else if(document.getElementsByName('room_lead_room')[0].value.trim()=="") {
			return document.getElementsByName('room_lead_room')[0].focus();
		} else if(document.getElementsByName('room_etc_people')[0].value.trim()=="") {
			return document.getElementsByName('room_etc_people')[0].focus();
		} else if(document.getElementsByName('room_etc_room')[0].value.trim()=="") {
			return document.getElementsByName('room_etc_room')[0].focus();
		} else if(document.getElementsByName('meal_type')[0].value.trim()=="") {
			return document.getElementsByName('meal_type')[0].focus();
		} else if(document.getElementsByName('meal_part')[0].value.trim()=="") {
			return document.getElementsByName('meal_part')[0].focus();
		} else if(document.getElementsByName('meal_lead')[0].value.trim()=="") {
			return document.getElementsByName('meal_lead')[0].focus();
		} else if(document.getElementsByName('meal_etc')[0].value.trim()=="") {
			return document.getElementsByName('meal_etc')[0].focus();
		} else if(document.getElementById('lead_budget_invite').value.trim()=="") {
			return document.getElementById('lead_budget_invite').focus();
		} else if(document.getElementById('lead_budget_transport').value.trim()=="") {
			return document.getElementById('lead_budget_transport').focus();
		} else if(document.getElementById('lead_budget_meal').value.trim()=="") {
			return document.getElementById('lead_budget_meal').focus();
		} else if(document.getElementById('lead_execute_invite').value.trim()=="") {
			return document.getElementById('lead_execute_invite').focus();
		} else if(document.getElementById('lead_execute_transport').value.trim()=="") {
			return document.getElementById('lead_execute_transport').focus();
		} else if(document.getElementById('lead_execute_meal').value.trim()=="") {
			return document.getElementById('lead_execute_meal').focus();
		} else if(document.getElementById('lead_detail_invite').value.trim()=="") {
			return document.getElementById('lead_detail_invite').focus();
		} else if(document.getElementById('lead_detail_transport').value.trim()=="") {
			return document.getElementById('lead_detail_transport').focus();
		} else if(document.getElementById('lead_detail_meal').value.trim()=="") {
			return document.getElementById('lead_detail_meal').focus();
		} else if(document.getElementById('part_budget_stay').value.trim()=="") {
			return document.getElementById('part_budget_stay').focus();
		} else if(document.getElementById('part_budget_meal').value.trim()=="") {
			return document.getElementById('part_budget_meal').focus();
		} else if(document.getElementById('part_budget_material').value.trim()=="") {
			return document.getElementById('part_budget_material').focus();
		} else if(document.getElementById('part_execute_stay').value.trim()=="") {
			return document.getElementById('part_execute_stay').focus();
		} else if(document.getElementById('part_execute_meal').value.trim()=="") {
			return document.getElementById('part_execute_meal').focus();
		} else if(document.getElementById('part_execute_material').value.trim()=="") {
			return document.getElementById('part_execute_material').focus();
		} else if(document.getElementById('part_detail_stay').value.trim()=="") {
			return document.getElementById('part_detail_stay').focus();
		} else if(document.getElementById('part_detail_meal').value.trim()=="") {
			return document.getElementById('part_detail_meal').focus();
		} else if(document.getElementById('part_detail_material').value.trim()=="") {
			return document.getElementById('part_detail_material').focus();
		} else if(document.getElementById('sub_budget').value.trim()=="") {
			return document.getElementById('sub_budget').focus();
		} else if(document.getElementById('sub_execute').value.trim()=="") {
			return document.getElementById('sub_execute').focus();
		} else if(document.getElementById('sub_detail').value.trim()=="") {
			return document.getElementById('sub_detail').focus();
		} else if(document.getElementById('program_income').value.trim()=="") {
			return document.getElementById('program_income').focus();
		} else if(document.getElementById('program_detail').value.trim()=="") {
			return document.getElementById('program_detail').focus();
		} else if(document.getElementById('stay_income').value.trim()=="") {
			return document.getElementById('stay_income').focus();
		} else if(document.getElementById('stay_detail').value.trim()=="") {
			return document.getElementById('stay_detail').focus();
		} else if(document.getElementById('meal_income').value.trim()=="") {
			return document.getElementById('meal_income').focus();
		} else if(document.getElementById('meal_detail').value.trim()=="") {
			return document.getElementById('meal_detail').focus();
		} else if(document.getElementById('rental_income').value.trim()=="") {
			return document.getElementById('rental_income').focus();
		} else if(document.getElementById('rental_detail').value.trim()=="") {
			return document.getElementById('rental_detail').focus();
		} else if(document.getElementById('discount').value.trim()=="") {
			return document.getElementById('discount').focus();
		} else if(document.getElementById('note').value.trim()=="") {
			return document.getElementById('note').focus();
		} 
		
		if (buttonText.innerHTML !== "저장") {
			buttonText.innerHTML = "저장";
		} else if (buttonText.innerHTML === "저장") {
			buttonText.innerHTML = tickMark;
		}
		this.classList.toggle('button__circle');
		
		
		// 입력된 데이터를 object객체에 저장(BasicInfoDTO 내부 필드와 자동 매핑되도록 동일한 이름 사용)
		let object = {};
		
		// 체크박스에서 체크된 항목만 object객체 내 배열에 담는 함수 정의
		pushByCheckedBox = (name) => {
			let j = 0;
			document.getElementsByName(name).forEach(item => {
				if (item.checked) {
					object[name] = item.parentNode.innerText;
					return false;
				}
			})	
		}
	
		// input태그에 입력된 값을 object객체에 담는 함수 정의
		pushByInputName = (name) => {
			object[name] = document.getElementsByName(name)[0].value.trim();
		}
	
		// 지출금액에 값을 object객체에 담는 함수 정의
		pushByExpense = (id) => {
			console.log(id);
			object['expDTO.' + id] = document.getElementById(id).value.trim();
		}
	
		// 수입금액에 값을 object객체에 담는 함수 정의
		pushByIncome = (id) => {
			console.log(id);
			object['incDTO.' + id] = document.getElementById(id).value.trim();
		}
		
		// 단체명
		pushByInputName('agency');
		
		// OM
		pushByInputName('om');
		
		// 참여일자(시작일,종료일)
		pushByInputName('openday');
		pushByInputName('endday');
		// 체류기간
		object['days_to_stay'] = document.getElementById('tostay').textContent;
		
		// 거주지역
		object['residence'] = $("#residence option:checked").text();	//selectbox
		
		// 참여인원
		pushByInputName('part_man_cnt');	// 참여자_남자
		pushByInputName('part_woman_cnt');	// 참여자_여자
		pushByInputName('lead_man_cnt');	// 인솔자_남자
		pushByInputName('lead_woman_cnt');	// 인솔자_여자
		
		// 지원사항
		pushByCheckedBox('support');
		
		// 사업구분
		pushByCheckedBox('biz_purpose');
		
		// 참가자유형
		pushByCheckedBox('part_type');
		
		// 연령대
		pushByCheckedBox('age_type');
		
		// 수입목적
		pushByCheckedBox('income_type');
		
		// 서비스유형
		pushByCheckedBox('service_type');
		
		// 프로그램 중복선택가능
		for (let i = 0; i < $('input[name="programName"]').length; i++) {
			object['program_in_out[' + i + '].programName'] = $('input[name="programName"]').get(i).value;	//selectbox
			object['program_in_out[' + i + '].in_tutor'] = $('input[name="in_tutor"]').get(i).value;
			object['program_in_out[' + i + '].out_tutor'] = $('input[name="out_tutor"]').get(i).value;
			object['program_in_out[' + i + '].teacher'] = $('input[name="teacher"]').get(i).value;
			object['program_in_out[' + i + '].bunya'] = $('select[name="bunya"]').get(i).value;
		}
		
		// 객실
		pushByInputName('room_part_people');	// 참여자_인원
		pushByInputName('room_part_room');		// 참여자_객실
		pushByInputName('room_lead_people');	// 인솔자_인원
		pushByInputName('room_lead_room');		// 인솔자_객실
		pushByInputName('room_etc_people');		// 기타_인원
		pushByInputName('room_etc_room');		// 기타_객실
		//유저 아이디 넣기
		object['reg_id'] = '<%=reg_id%>';
		// 식사
		pushByInputName('meal_type');	// 식사 수
		pushByInputName('meal_part');	// 참여자_인원
		pushByInputName('meal_lead');	// 인솔자_인원
		pushByInputName('meal_etc');	// 기타_인원
		
		// 프로그램 만족도 [파일첨부]
		// 시설서비스 만족도 [파일첨부]
		// 상담&치유 서비스 효과평가 [파일첨부]
		// 예방서비스 효과평가 [파일첨부]
		// 힐링서비스 효과평가 [파일첨부]
		// 자율신경검사 효과평가 [파일첨부]
		
		// 프로그램 소감 [텍스트]
		pushByInputName('program_opinion');
		// 시설서비스 소감 [텍스트]
		pushByInputName('service_opinion');
		// 종합의견 [텍스트]
		pushByInputName('overall_opinion');
		
		
		// 지출금액---------
		// 강사 - 기존예산 - 강사비
		pushByExpense('lead_budget_invite');
		// 강사 - 기존예산 - 교통비
		pushByExpense('lead_budget_transport');
		// 강사 - 기존예산 - 식비
		pushByExpense('lead_budget_meal');
		// 강사 - 집행금액 - 강사비
		pushByExpense('lead_execute_invite');
		// 강사 - 집행금액 - 교통비
		pushByExpense('lead_execute_transport');
		// 강사 - 집행금액 - 식비
		pushByExpense('lead_execute_meal');
		// 강사 - 세부내역 - 강사비
		pushByExpense('lead_detail_invite');
		// 강사 - 세부내역 - 교통비
		pushByExpense('lead_detail_transport');
		// 강사 - 세부내역 - 식비
		pushByExpense('lead_detail_meal');
		// 참가자 - 기존계산 - 숙박비
		pushByExpense('part_budget_stay');
		// 참가자 - 기존계산 - 식비
		pushByExpense('part_budget_meal');
		// 참가자 - 기존계산 - 재료비
		pushByExpense('part_budget_material');
		// 참가자 - 집행금액 - 숙박비 
		pushByExpense('part_execute_stay');
		// 참가자 - 집행금액 - 식비
		pushByExpense('part_execute_meal');
		// 참가자 - 집행금액 - 재료비
		pushByExpense('part_execute_material');
		// 참가자 - 세부내역 - 숙박비
		pushByExpense('part_detail_stay');
		// 참가자 - 세부내역 - 식비
		pushByExpense('part_detail_meal');
		// 참가자 - 세부내역 - 재료비
		pushByExpense('part_detail_material');
		// 예비비 - 기존예산
		pushByExpense('sub_budget');
		// 예비비 - 집행금액
		pushByExpense('sub_execute');
		// 예비비 - 세부내역
		pushByExpense('sub_detail');
		
		
		
		// 수입금액---------
		// 프로그램 - 수입금액
		pushByIncome('program_income');
		// 프로그램 - 세부내역
		pushByIncome('program_detail');
		// 숙박 - 수입금액
		pushByIncome('stay_income');
		// 숙박 - 세부내역
		pushByIncome('stay_detail');
		// 식사 - 수입금액
		pushByIncome('meal_income');
		// 식사 - 세부내역
		pushByIncome('meal_detail');
		// 대관 및 기타 - 수입금액
		pushByIncome('rental_income');
		// 대관 및 기타 - 세부내역
		pushByIncome('rental_detail');
		
		// 합계------------*/
		
		/* object['income_program'] = $("select[name=income_program] option:checked").text(); */	//selectbox
		
		//수입금액 할인율 및 비고
		pushByIncome('discount');
		pushByIncome('note');
		
		
		// 합계최종금액------*/
		


		// list[33].selectedOptions[0].innerText
		// list[33].type
		// document.getElementsByName('part_type').forEach((item,i)=> {
		// 	if(item.checked) {
		// 		object['part_type['+i+']'] = item.parentNode.innerText;
		// 		console.log(item.parentNode.innerText)
		// 	}
		// })
		

		console.table(object);
		// 프로그램 결과 데이터가 담긴 object객체를 컨트롤러로 전달 
		$.ajax({
			url: "/insertOperateResultProc.do",
			method: "post",
			data: object,
			success: function (res) {
				doSwal(res, "", "success");
				//window.location.reload();
			},
			error: function (err) {
				doSwal("입력을 처리할 수 없습니다.", "올바른 정보인지 확인 후 재요청 해주십시오.", "error");
			}
		});

	});

</script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<!-- 페이지 내에서 이벤트가 발생하면 자바스크립트 함수를 실행하는 부분 ./---end -->
</html>