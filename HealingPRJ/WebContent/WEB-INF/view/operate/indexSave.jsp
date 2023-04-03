<%@page import="poly.dto.IncomeDTO"%>
<%@page import="poly.dto.ExpenseDTO"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="java.util.List" %>
<%@ page import ="java.util.Arrays" %>
<%@ page import ="poly.dto.BasicInfoPageDTO" %>
<%@ page import ="poly.dto.BasicInfoDTO" %>
<%@ page import ="static poly.util.CmmUtil.convertXSS" %>

<%
String reg_id = (String) session.getAttribute("user_name");
BasicInfoPageDTO bDTO = (BasicInfoPageDTO) request.getAttribute("bDTO");
String [] support = bDTO.getSupport().split(",");
String [] income_type = bDTO.getIncome_type().split(",");
String [] part_type = bDTO.getPart_type().split(",");
String [] biz_purpose = bDTO.getBiz_purpose().split(",");
String [] program_in_out = bDTO.getProgram_in_out().split(",");
String [] service_type = bDTO.getService_type().split(",");
String [] age_type = bDTO.getAge_type().split(",");
List<BasicInfoDTO> basicInfoList = (List<BasicInfoDTO>) request.getAttribute("basicInfoList");
Map<String, List<ExpenseDTO>> expenseMap = (Map<String, List<ExpenseDTO>>) request.getAttribute("expenseMap");
Map<String, List<IncomeDTO>> incomeMap = (Map<String, List<IncomeDTO>>) request.getAttribute("incomeMap");
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
	font-family: "NanumSquare";
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

.healing-btn {
	width: 145px;
	height: 40px;
	font-size: large;
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

.modal {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal.show {
	display: block;
}

.modal_body {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 440px;
	height: 600px;
	padding: 40px;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
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
				<li class="active">중간저장</li>
			</ol>
		</div>
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">중간저장</h1>
			</div>
		</div>
		<!--/.row-->


		<!-- 입력서식  -->
		<div class="row">

			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading clearfix">프로그램 결과 입력 > 중간저장
					</div>
					<div class="panel-body">

						<!-- form 시작 -->
						<div class="form-horizontal row-border">
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">단체명</label>
								<div class="col-md-10">
									<input type="text" name="agency" class="form-control"
										placeholder="직접입력" style="font-size: 16pt;" value="<%=convertXSS(basicInfoList.get(0).getAgency()).trim()%>">
								</div>
							</div>
							<hr>
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">OM</label>
								<div class="col-md-10">
									<input type="text" name="om" class="form-control"
										placeholder="직접입력" style="font-size: 16pt;" value="<%=convertXSS(basicInfoList.get(0).getOm()).trim()%>">
								</div>
							</div>
							<hr>
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">참여일자</label>
								<div class="col-md-10">
									<input type="date" name="openday" id="openday"
										style="font-size: 16pt" value="<%=convertXSS(basicInfoList.get(0).getOpenday()).trim()%>" /> <input type="date" name="endday"
										id="endday" style="font-size: 16pt" value="<%=convertXSS(basicInfoList.get(0).getEndday()).trim()%>"/>

								</div>
							</div>
							<hr>
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">체류기간(일)</label>
								<div class="col-md-10">
									<span class="help-block " id="tostay"><%=convertXSS(basicInfoList.get(0).getDays_to_stay()).trim()%></span>
								</div>
							</div>
							<hr>
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">거주지역</label>
								<div class="col-md-10">
									<select class="form-control input-lg" name="residence"
										id="residence" style="width: 200px; border-radius: 5px;">
										<option value="<%=convertXSS(basicInfoList.get(0).getResidence())%>"><%=convertXSS(basicInfoList.get(0).getResidence()).trim()%></option>
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
												id="per01" placeholder="명" style="font-size: 16pt" value="<%=convertXSS(basicInfoList.get(0).getPart_man_cnt())%>">
										</div>

										<label class="col-xs-3 control-label">여자</label>
										<div class="col-xs-5">
											<input type="number" name="part_woman_cnt" class="form-control perChange"
												id="per02" placeholder="명" style="font-size: 16pt" value="<%=convertXSS(basicInfoList.get(0).getPart_woman_cnt())%>">
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
												id="per03" placeholder="명" style="font-size: 16pt" value="<%=convertXSS(basicInfoList.get(0).getLead_man_cnt())%>">
										</div>

										<label class="col-xs-3 control-label">여자</label>
										<div class="col-xs-5">
											<input type="number" name="lead_woman_cnt" class="form-control perChange"
												id="per04" placeholder="명" style="font-size: 16pt" value="<%=convertXSS(basicInfoList.get(0).getLead_woman_cnt())%>">
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
									<%
										for(int i=0; i<support.length; i++) {
									%>
										<label class="checkbox-wrap checkbox-success"> <input
											type="checkbox" name="support" id="<%=support[i]%>" value="<%=support[i]%>"><%=support[i]%><span
											class="checkmark"></span>
										</label>
									<%
										}
									%>		
								</div>
							</div>

							<hr>
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">사업목적</label>
								<div class="col-md-10">
									<%
										for(int i=0; i<biz_purpose.length; i++) {
									%>
										<label class="checkbox-wrap checkbox-success"> <input
											type="radio" name="biz_purpose" id="<%=biz_purpose[i]%>biz_purpose" value="<%=biz_purpose[i]%>"><%=biz_purpose[i]%><span
											class="checkmark"></span>
										</label>
									<%
										}
									%>
								</div>
							</div>

							<hr>
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">참가자유형</label>
								<div class="col-md-10">
									<%
										for(int i=0; i<part_type.length; i++) {
									%>
										<label class="checkbox-wrap checkbox-success"> <input
											type="radio" name="part_type" id="<%=part_type[i]%>part_type" value="<%=part_type[i]%>"><%=part_type[i]%><span
											class="checkmark"></span>
										</label>
									<%
										}
									%>
								</div>
							</div>
							
							<hr>
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">연령대</label>
								<div class="col-md-10">
									<%
										for(int i=0; i<age_type.length; i++) {
									%>
										<label class="checkbox-wrap checkbox-success"> <input
											type="radio" name="age_type" id="<%=age_type[i]%>age_type" value=<%=age_type[i]%>><%=age_type[i]%><span
											class="checkmark"></span>
										</label>
									<%
										}
									%>
								</div>
							</div>
							
							<hr>
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">수입구분</label>
								<div class="col-md-10">
									<%
										for(int i=0; i<income_type.length; i++) {
									%>
										<label class="checkbox-wrap checkbox-success"> <input
											type="radio" name="income_type" id="<%=income_type[i]%>income_type" value="<%=income_type[i]%>"><%=income_type[i]%><span
											class="checkmark"></span>
										</label>
									<%
										}
									%>
								</div>
							</div>

							<hr>
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">서비스유형</label>
								<div class="col-md-10">
									<%
										for(int i=0; i<service_type.length; i++) {
									%>
										<label class="checkbox-wrap checkbox-success"> <input
											type="radio" name="service_type" id="<%=service_type[i]%>service_type" value="<%=service_type[i]%>"><%=service_type[i]%><span
											class="checkmark"></span>
										</label>
									<%
										}
									%>
								</div>
							</div>
							<hr>
							<div id="test00">
								<div style="float: right; padding-right: 85px;">
									<span id="box1"><input type="button" value="추가"
											class="btn btn-success btn-md" style="font-size: 18px;"></span>
									<span id="box2"><input type="button" value="삭제"
											class="btn btn-danger btn-md" style="font-size: 18px;"></span>
								</div>
								<div class="form-group justify-content-center" id="test">
									<!--프로그램명 추가  -->
									<label class="col-md-2 control-label">프로그램명</label>
									<%if(basicInfoList.get(0).getProgram_in_out2().size() == 0) { %>
										<div class="col-md-1">
											<input type="text" name="programName" class="form-control"
												placeholder="프로그램명" style="font-size: 16pt;">
										</div>
										<!--분야 추가  -->
										<label class="col-md-1 control-label" style="width:103px;">분야</label>
										<div class="col-md-1">
											<select class="form-control input-lg" name="bunya"
												style="border-radius: 5px; font-size: 15pt;">
												<option value=" ">선택</option>
												<%
													for(int i=0; i<program_in_out.length; i++) {
														
												%>
													<option value="<%=program_in_out[i]%>"><%=program_in_out[i]%></option>
												<%
													}
												%>
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
									<%} else {%>
										<div class="col-md-1">
											<input type="text" name="programName" class="form-control"
												placeholder="프로그램명" style="font-size: 16pt;" value="<%=basicInfoList.get(0).getProgram_in_out2().get(0).trim()%>">
										</div>
										<!--분야 추가  -->
										<label class="col-md-1 control-label" style="width:103px;">분야</label>
										<div class="col-md-1">
											<select class="form-control input-lg" name="bunya"
												style="border-radius: 5px; font-size: 15pt;">
												<option value="<%=basicInfoList.get(0).getProgram_in_out2().get(1)%>"><%=basicInfoList.get(0).getProgram_in_out2().get(1)%></option>
												<%
													for(int i=0; i<program_in_out.length; i++) {
														
												%>
													<option value="<%=program_in_out[i]%>"><%=program_in_out[i]%></option>
												<%
													}
												%>
											</select>
										</div>
										<!--강사명 추가 -->
										<label class="col-md-1 control-label" style="width:103px;">강사명</label>
										<div class="col-md-1">
											<input type="text" name="teacher" class="form-control"
												placeholder="이름" style="font-size: 16pt;" value="<%=basicInfoList.get(0).getProgram_in_out2().get(2).trim()%>">
										</div>
										<label class="col-md-1 control-label" style="width:103px;">내부강사</label>
										<div class="col-md-1">
											<input type="number" name="in_tutor" class="form-control"
												placeholder="명" style="font-size: 16pt;" value="<%=basicInfoList.get(0).getProgram_in_out2().get(3)%>">
										</div>
	
										<label class="col-md-1 control-label" style="width:103px;">외부강사</label>
										<div class="col-md-1">
											<input type="number" name="out_tutor" class="form-control"
												placeholder="명" style="font-size: 16pt;" value="<%=basicInfoList.get(0).getProgram_in_out2().get(4)%>">
										</div>
									<%} %>
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
												style="font-size: 16pt;" value="<%=convertXSS(basicInfoList.get(0).getRoom_part_people())%>">
										</div>

										<label class="col-xs-3 control-label">객실</label>
										<div class="col-xs-5">
											<input type="number" name="room_part_room" class="form-control roomChange"
												id="room02" placeholder="객실" style="font-size: 16pt;" value="<%=convertXSS(basicInfoList.get(0).getRoom_part_room())%>">
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
												style="font-size: 16pt;" value="<%=convertXSS(basicInfoList.get(0).getRoom_lead_people())%>">
										</div>

										<label class="col-xs-3 control-label">객실</label>
										<div class="col-xs-5">
											<input type="number" name="room_lead_room" class="form-control roomChange"
												id="room04" placeholder="객실" style="font-size: 16pt;" value="<%=convertXSS(basicInfoList.get(0).getRoom_lead_room())%>">
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
												style="font-size: 16pt;" value="<%=convertXSS(basicInfoList.get(0).getRoom_etc_people())%>">
										</div>

										<label class="col-xs-3 control-label">객실</label>
										<div class="col-xs-5">
											<input type="number" name="room_etc_room" class="form-control roomChange"
												id="room06" placeholder="객실" style="font-size: 16pt;" value="<%=convertXSS(basicInfoList.get(0).getRoom_etc_room())%>">
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
									<input class="form-control" type="number" name="meal_type" id="meal" min="0" max="12" step="1" required
									style="width: 100px; font-size: 20px; margin-bottom: 10px;" placeholder="횟수"value="<%=convertXSS(basicInfoList.get(0).getMeal_type())%>">
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
													placeholder="명" style="font-size: 16pt;" value="<%=convertXSS(basicInfoList.get(0).getMeal_part())%>">
											</div>
										</div>
									</div>

									<div class="col-md-2.5">
										<label class="checkbox-inline">인솔자</label> <br />

										<div class="col-md-10" style="display: inline-flex;">
											<label class="col-md-4 control-label">인원</label>
											<div class="col-md-6">
												<input type="number" name="meal_lead" class="form-control"
													placeholder="명" style="font-size: 16pt;" value="<%=convertXSS(basicInfoList.get(0).getMeal_lead())%>">
											</div>
										</div>
									</div>

									<div class="col-md-2.5">
										<label class="checkbox-inline">기타</label> <br />

										<div class="col-md-10" style="display: inline-flex;">
											<label class="col-md-4 control-label">인원</label>
											<div class="col-md-6">
												<input type="number" name="meal_etc" class="form-control"
													placeholder="명" style="font-size: 16pt;" value="<%=convertXSS(basicInfoList.get(0).getMeal_etc())%>">
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
										cols="100"><%=convertXSS(basicInfoList.get(0).getProgram_opinion()).trim()%></textarea>
								</div>
							</div>
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">시설서비스 소감 <br>(식사 포함)</label>
								<div class="col-md-10">
									<textarea name="service_opinion"
										class="form-control" style="font-size: 13pt" rows="7"
										cols="100"><%=convertXSS(basicInfoList.get(0).getService_opinion()).trim()%></textarea>
								</div>
							</div>

							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">종합의견 및 불편사항</label>
								<div class="col-md-10">
									<textarea name="overall_opinion"
										class="form-control" style="font-size: 13pt" rows="7"
										cols="100"><%=convertXSS(basicInfoList.get(0).getOverall_opinion()).trim()%></textarea>
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
										<div class="col-md-2" id="강사예정강사비">
											<%if(expenseMap.get("강사예정강사비").size()==0){ %>
												<input type="hidden" value="강사예정강사비 " name="expense_type">
												<input type="number" name="expense_price" class="form-control" placeholder="금액(천원)" style="font-size: 13pt;">
												<input type="hidden" name="expense_detail" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
												<input type="hidden" name="expense_note" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<%} else {%>
												<input type="hidden" value="강사예정강사비 " name="expense_type">
												<input type="number" name="expense_price" class="form-control" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("강사예정강사비").get(0).getPrice()%>">
												<input type="hidden" name="expense_detail" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
												<input type="hidden" name="expense_note" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<%}%>
										</div>
										
										<label class="col-md-1 control-label">보조강사비</label>
										<div class="col-md-2">
											<%if(expenseMap.get("강사예정보조강사비").size()==0){ %>
												<input type="hidden" value="강사예정보조강사비 " name="expense_type">
												<input type="number" name="expense_price" class="form-control"  placeholder="금액(천원)" style="font-size: 13pt;">
												<input type="hidden" name="expense_detail" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
												<input type="hidden" name="expense_note" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<%} else {%>
												<input type="hidden" value="강사예정보조강사비 " name="expense_type">
												<input type="number" name="expense_price" class="form-control"  placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("강사예정보조강사비").get(0).getPrice()%>">
												<input type="hidden" name="expense_detail" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
												<input type="hidden" name="expense_note" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<%}%>
										</div>

										<label class="col-md-1 control-label">교통비</label>
										<div class="col-md-2">
											<%if(expenseMap.get("강사예정교통비").size()==0){ %>
												<input type="hidden" value="강사예정교통비 " name="expense_type">
												<input type="number" name="expense_price" class="form-control"  placeholder="금액(천원)" style="font-size: 13pt;">
												<input type="hidden" name="expense_detail" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
												<input type="hidden" name="expense_note" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<%} else {%>
												<input type="hidden" value="강사예정교통비 " name="expense_type">
												<input type="number" name="expense_price" class="form-control"  placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("강사예정교통비").get(0).getPrice()%>">
												<input type="hidden" name="expense_detail" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
												<input type="hidden" name="expense_note" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<%}%>
										</div>

										<label class="col-md-1 control-label">식비</label>
										<div class="col-md-2">
											<%if(expenseMap.get("강사예정식사비").size()==0){ %>
												<input type="hidden" value="강사예정식사비 " name="expense_type">
												<input type="number" name="expense_price" class="form-control" placeholder="금액(천원)" style="font-size: 13pt;">
												<input type="hidden" name="expense_detail" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
												<input type="hidden" name="expense_note" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<%} else {%>
												<input type="hidden" value="강사예정식사비 " name="expense_type">
												<input type="number" name="expense_price" class="form-control" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("강사예정식사비").get(0).getPrice()%>">
												<input type="hidden" name="expense_detail" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
												<input type="hidden" name="expense_note" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<%}%>
										</div>
									</div>
									
									<!--집행금액 강사  -->
									<label class="checkbox-inline" style="inline-size: -webkit-fill-available;">집행금액-강사 </label> <br />
										<div id="gangsaJeaphangGangsa_box">
										<%if(expenseMap.get("강사집행강사비").size()==0) {%>
											<div class="col-md-10" style="height:60px" name="강사집행강사비">
												<input type="hidden" value="강사집행강사비 " name="expense_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('expense gangsaJeaphangGangsa 강사집행강사비')"></span>
													<span ><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('expense gangsaJeaphangGangsa 강사집행강사비')"></span>
												</div>
												<label class="col-md-1 control-label">강사비</label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
												</div>
											</div>
										<%} %>	
										<%for(int i=0; i<expenseMap.get("강사집행강사비").size(); i++) { 
											if(i==0) {%>
											<div class="col-md-10" style="height:60px" name="강사집행강사비">
												<input type="hidden" value="강사집행강사비 " name="expense_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('expense gangsaJeaphangGangsa 강사집행강사비')"></span>
													<span ><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('expense gangsaJeaphangGangsa 강사집행강사비')"></span>
												</div>
												<label class="col-md-1 control-label">강사비</label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("강사집행강사비").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("강사집행강사비").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("강사집행강사비").get(i).getNote())%>">
												</div>
											</div>
											<%}	 else{%>
											
											<div class="col-md-10" style="height:60px"" name="강사집행강사비">
												<input type="hidden" value="강사집행강사비 " name="expense_type">
												<div style="float: right; width: 125px; height:60px">
												</div>
												<label class="col-md-1 control-label">   </label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("강사집행강사비").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("강사집행강사비").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("강사집행강사비").get(i).getNote())%>">
												</div>
											</div>
											<%}
										} %>
									</div>
									<!--집행금액 보조강사  -->
									<div id="gangsaJeaphangBojoGangsa_box">
									<%if(expenseMap.get("강사집행보조강사비").size()==0) {%>
											<div class="col-md-10" style="height:60px" name="강사집행보조강사비">
												<input type="hidden" value="강사집행보조강사비 " name="expense_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('expense gangsaJeaphangBojoGangsa 강사집행보조강사비')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('expense gangsaJeaphangBojoGangsa 강사집행보조강사비')"></span>
												</div>
												<label class="col-md-1 control-label">보조강사비</label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
												</div>
											</div>
										<%} %>	
									<%for(int i=0; i<expenseMap.get("강사집행보조강사비").size(); i++) { 
											if(i==0) {%>
											<div class="col-md-10" style="height:60px" name="강사집행보조강사비">
												<input type="hidden" value="강사집행보조강사비 " name="expense_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('expense gangsaJeaphangBojoGangsa 강사집행보조강사비')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('expense gangsaJeaphangBojoGangsa 강사집행보조강사비')"></span>
												</div>
												<label class="col-md-1 control-label">보조강사비</label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("강사집행보조강사비").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("강사집행보조강사비").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("강사집행보조강사비").get(i).getNote())%>">
												</div>
											</div>
											<%} else{%>
											<div class="col-md-10" style="height:60px" name="강사집행보조강사비">
												<input type="hidden" value="강사집행보조강사비 " name="expense_type">
												<label class="col-md-1 control-label">     </label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("강사집행보조강사비").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("강사집행보조강사비").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("강사집행보조강사비").get(i).getNote())%>">
												</div>
											</div>
											<%}
										} %>
									</div>
									<!--집행금액 교통비  -->
									<div id="gangsaJeaphangGyotong_box">
									<%if(expenseMap.get("강사집행교통비").size()==0) {%>
											<div class="col-md-10" style="height:60px" name="강사집행교통비">
												<input type="hidden" value="강사집행교통비 " name="expense_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('expense gangsaJeaphangGyotong 강사집행교통비')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('expense gangsaJeaphangGyotong 강사집행교통비')"></span>
												</div>
												<label class="col-md-1 control-label">교통비</label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
												</div>
											</div>
										<%} %>	
									<%for(int i=0; i<expenseMap.get("강사집행교통비").size(); i++) { 
											if(i==0) {%>
											<div class="col-md-10" style="height:60px" name="강사집행교통비">
												<input type="hidden" value="강사집행교통비 " name="expense_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('expense gangsaJeaphangGyotong 강사집행교통비')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('expense gangsaJeaphangGyotong 강사집행교통비')"></span>
												</div>
												<label class="col-md-1 control-label">교통비</label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("강사집행교통비").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("강사집행교통비").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("강사집행교통비").get(i).getNote())%>">
												</div>
											</div>
											<%} else{%>
											<div class="col-md-10" style="height:60px" name="강사집행교통비">
												<input type="hidden" value="강사집행교통비 " name="expense_type">
												<label class="col-md-1 control-label">   </label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("강사집행교통비").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("강사집행교통비").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("강사집행교통비").get(i).getNote())%>">
												</div>
											</div>
											<%}
										} %>
									</div>
									<!--  -->
									<!--집행금액 식사비  -->
									<div id="gangsaJeaphangSiksa_box">
									<%if(expenseMap.get("강사집행식사비").size()==0) {%>
											<div class="col-md-10" style="height:60px" name="강사집행식사비">
												<input type="hidden" value="강사집행식사비 " name="expense_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('expense gangsaJeaphangSiksa 강사집행식사비')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('expense gangsaJeaphangSiksa 강사집행식사비')"></span>
												</div>
												<label class="col-md-1 control-label">식사비</label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
												</div>
											</div>
										<%} %>
									<%for(int i=0; i<expenseMap.get("강사집행식사비").size(); i++) { 
											if(i==0) {%>
											<div class="col-md-10" style="height:60px" name="강사집행식사비">
												<input type="hidden" value="강사집행식사비 " name="expense_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('expense gangsaJeaphangSiksa 강사집행식사비')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('expense gangsaJeaphangSiksa 강사집행식사비')"></span>
												</div>
												<label class="col-md-1 control-label">식사비</label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("강사집행식사비").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("강사집행식사비").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("강사집행식사비").get(i).getNote())%>">
												</div>
											</div>
											<%} else{%>
											<div class="col-md-10" style="height:60px" name="강사집행식사비">
												<input type="hidden" value="강사집행식사비 " name="expense_type">
												<label class="col-md-1 control-label">   </label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("강사집행식사비").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("강사집행식사비").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("강사집행식사비").get(i).getNote())%>">
												</div>
											</div>
											<%}
										} %>
									</div>
									<!--  -->
									<!--예정금액 참가자  -->
									<label class="checkbox-inline" style="inline-size: -webkit-fill-available;">예정금액-참가자 </label> <br />
									<div class="col-md-10" style="height:60px">
										<label class="col-md-1 control-label">숙박비</label>
										<div class="col-md-2">
											<%if(expenseMap.get("고객예정숙박비").size()==0){ %>
											<input type="hidden" value="고객예정숙박비 " name="expense_type">
											<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<input type="hidden" name="expense_detail" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<input type="hidden" name="expense_note" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<%} else {%>
											<input type="hidden" value="고객예정숙박비 " name="expense_type">
											<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("고객예정숙박비").get(0).getPrice()%>">
											<input type="hidden" name="expense_detail" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<input type="hidden" name="expense_note" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<%}%>
										</div>

										<label class="col-md-1 control-label">식사비</label>
										<div class="col-md-2">
											<%if(expenseMap.get("고객예정식사비").size()==0){ %>
											<input type="hidden" value="고객예정식사비 " name="expense_type">
											<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<input type="hidden" name="expense_detail" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<input type="hidden" name="expense_note" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<%} else {%>
											<input type="hidden" value="고객예정식사비 " name="expense_type">
											<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("고객예정식사비").get(0).getPrice()%>">
											<input type="hidden" name="expense_detail" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<input type="hidden" name="expense_note" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<%}%>
										</div>

										<label class="col-md-1 control-label">재료비</label>
										<div class="col-md-2">
											<%if(expenseMap.get("고객예정재료비").size()==0){ %>
											<input type="hidden" value="고객예정재료비 " name="expense_type">
											<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<input type="hidden" name="expense_detail" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<input type="hidden" name="expense_note" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<%} else {%>
											<input type="hidden" value="고객예정재료비 " name="expense_type">
											<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("고객예정재료비").get(0).getPrice()%>">
											<input type="hidden" name="expense_detail" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<input type="hidden" name="expense_note" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<%}%>
										</div>
										<label class="col-md-1 control-label">예비비</label>
										<div class="col-md-2">
											<%if(expenseMap.get("고객예정예비비").size()==0){ %>
											<input type="hidden" value="고객예정예비비 " name="expense_type">
											<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<input type="hidden" name="expense_detail" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<input type="hidden" name="expense_note" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<%} else {%>
											<input type="hidden" value="고객예정예비비 " name="expense_type">
											<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("고객예정예비비").get(0).getPrice()%>">
											<input type="hidden" name="expense_detail" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<input type="hidden" name="expense_note" value="" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
											<%}%>
											
										</div>
									</div>
									<!--집행금액 참가자  -->
									<label class="checkbox-inline" style="inline-size: -webkit-fill-available;">집행금액-참가자 </label> <br />
									<div id="charmgaJeaphangSookbak_box">
									<%if(expenseMap.get("고객집행숙박비").size()==0) {%>
											<div class="col-md-10" style="height:60px" name="고객집행숙박비">
												<input type="hidden" value="고객집행숙박비 " name="expense_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('expense charmgaJeaphangSookbak 고객집행숙박비')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('expense charmgaJeaphangSookbak 고객집행숙박비')"></span>
												</div>
												<label class="col-md-1 control-label">숙박비</label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
												</div>
											</div>
										<%} %>
									<%for(int i=0; i<expenseMap.get("고객집행숙박비").size(); i++) { 
											if(i==0) {%>
											<div class="col-md-10" style="height:60px" name="고객집행숙박비">
												<input type="hidden" value="고객집행숙박비 " name="expense_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('expense charmgaJeaphangSookbak 고객집행숙박비')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('expense charmgaJeaphangSookbak 고객집행숙박비')"></span>
												</div>
												<label class="col-md-1 control-label">숙박비</label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("고객집행숙박비").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("고객집행숙박비").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("고객집행숙박비").get(i).getNote())%>">
												</div>
											</div>
											<%} else{%>
											<div class="col-md-10" style="height:60px" name="고객집행숙박비">
												<input type="hidden" value="고객집행숙박비 " name="expense_type">
												<label class="col-md-1 control-label">   </label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("고객집행숙박비").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("고객집행숙박비").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("고객집행숙박비").get(i).getNote())%>">
												</div>
											</div>
											<%}
										} %>
									</div>
									<!--  -->
									<!--집행금액 참가 식사비  -->
									<div id="charmgaJeaphangSiksa_box">
									<%if(expenseMap.get("고객집행식사비").size()==0) {%>
											<div class="col-md-10" style="height:60px" name="고객집행식사비">
												<input type="hidden" value="고객집행식사비 " name="expense_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('expense charmgaJeaphangSiksa 고객집행식사비')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('expense charmgaJeaphangSiksa 고객집행식사비')"></span>
												</div>
												<label class="col-md-1 control-label">식사비</label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
												</div>
											</div>
										<%} %>
									<%for(int i=0; i<expenseMap.get("고객집행식사비").size(); i++) { 
											if(i==0) {%>
											<div class="col-md-10" style="height:60px" name="고객집행식사비">
												<input type="hidden" value="고객집행식사비 " name="expense_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('expense charmgaJeaphangSiksa 고객집행식사비')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('expense charmgaJeaphangSiksa 고객집행식사비')"></span>
												</div>
												<label class="col-md-1 control-label">식사비</label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("고객집행식사비").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("고객집행식사비").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("고객집행식사비").get(i).getNote())%>">
												</div>
											</div>
											<%} else{%>
											<div class="col-md-10" style="height:60px" name="고객집행식사비">
												<input type="hidden" value="고객집행식사비 " name="expense_type">
												<label class="col-md-1 control-label">   </label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("고객집행식사비").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("고객집행식사비").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("고객집행식사비").get(i).getNote())%>">
												</div>
											</div>
											<%}
										} %>
									</div>
									<!--  -->
									<!--집행금액 참가 재료비  -->
									<div id="charmgaJeaphangJaeryo_box">
									<%if(expenseMap.get("고객집행재료비").size()==0) {%>
											<div class="col-md-10" style="height:60px" name="고객집행재료비">
												<input type="hidden" value="고객집행재료비 " name="expense_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('expense charmgaJeaphangJaeryo 고객집행재료비')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('expense charmgaJeaphangJaeryo 고객집행재료비')"></span>
												</div>
												<label class="col-md-1 control-label">재료비</label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
												</div>
											</div>
										<%} %>
									<%for(int i=0; i<expenseMap.get("고객집행재료비").size(); i++) { 
											if(i==0) {%>
											<div class="col-md-10" style="height:60px" name="고객집행재료비">
												<input type="hidden" value="고객집행재료비 " name="expense_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('expense charmgaJeaphangJaeryo 고객집행재료비')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('expense charmgaJeaphangJaeryo 고객집행재료비')"></span>
												</div>
												<label class="col-md-1 control-label">재료비</label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("고객집행재료비").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("고객집행재료비").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("고객집행재료비").get(i).getNote())%>">
												</div>
											</div>
											<%} else{%>
											<div class="col-md-10" style="height:60px" name="고객집행재료비">
												<input type="hidden" value="고객집행재료비 " name="expense_type">
												<label class="col-md-1 control-label">   </label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("고객집행재료비").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("고객집행재료비").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("고객집행재료비").get(i).getNote())%>">
												</div>
											</div>
											<%}
										} %>
									</div>
									<!--  -->
									<!--집행금액 참가 기타  -->
									<div id="charmgaJeaphangGita_box">
									<%if(expenseMap.get("고객집행기타비").size()==0) {%>
											<div class="col-md-10" style="height:60px" name="고객집행기타비">
												<input type="hidden" value="고객집행기타비 " name="expense_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('expense charmgaJeaphangGita 고객집행기타비')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('expense charmgaJeaphangGita 고객집행기타비')"></span>
												</div>
												<label class="col-md-1 control-label">기타</label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
												</div> 
											</div>
										<%} %>
									<%for(int i=0; i<expenseMap.get("고객집행기타비").size(); i++) { 
											if(i==0) {%>
											<div class="col-md-10" style="height:60px" name="고객집행기타비">
												<input type="hidden" value="고객집행기타비 " name="expense_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('expense charmgaJeaphangGita 고객집행기타비')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('expense charmgaJeaphangGita 고객집행기타비')"></span>
												</div>
												<label class="col-md-1 control-label">기타</label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("고객집행기타비").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("고객집행기타비").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("고객집행기타비").get(i).getNote())%>">
												</div> 
											</div>
											<%} else{%>
											<div class="col-md-10" style="height:60px" name="고객집행기타비">
												<input type="hidden" value="고객집행기타비 " name="expense_type">
												<label class="col-md-1 control-label">  </label>
												<div class="col-md-2">
													<input type="number" name="expense_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=expenseMap.get("고객집행기타비").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="expense_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("고객집행기타비").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="expense_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(expenseMap.get("고객집행기타비").get(i).getNote())%>">
												</div>
											</div>
											<%}
										} %>
									</div>
									<!--  -->
								</div>
							</div>
							<hr />
							<!--수입금액 -->
							<div class="form-group justify-content-center">
								<label class="col-md-2 control-label">수입금액</label>
								<div class="col-md-10" style="margin-bottom : 30px;">
									<div id="suibProgram_box">
									<!--수입금액 프로그램  -->
									<%if(incomeMap.get("프로그램").size()==0) {%>
											<div class="col-md-10" style="height:60px" name="프로그램">
												<input type="hidden" value="프로그램" name="suib_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('suib suibProgram 프로그램')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('suib suibProgram 프로그램')"></span>
												</div>
												<label class="col-md-1 control-label">프로그램</label>
												<div class="col-md-2">
													<input type="number" name="suib_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
												</div>
												<div class="col-md-4">
													<input type="text" name="suib_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
												</div>
												<div class="col-md-3">
													<input type="text" name="suib_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
												</div>
											</div>
										<%} %>
									<%for(int i=0; i<incomeMap.get("프로그램").size(); i++) { 
											if(i==0) {%>
											<div class="col-md-10" style="height:60px" name="프로그램">
												<input type="hidden" value="프로그램" name="suib_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('suib suibProgram 프로그램')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('suib suibProgram 프로그램')"></span>
												</div>
												<label class="col-md-1 control-label">프로그램</label>
												<div class="col-md-2">
													<input type="number" name="suib_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=incomeMap.get("프로그램").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="suib_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(incomeMap.get("프로그램").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="suib_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(incomeMap.get("프로그램").get(i).getNote())%>">
												</div>
											</div>
											<%} else{%>
											<div class="col-md-10" style="height:60px" name="프로그램">
												<input type="hidden" value="프로그램" name="suib_type">
												<label class="col-md-1 control-label">    </label>
												<div class="col-md-2">
													<input type="number" name="suib_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=incomeMap.get("프로그램").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="suib_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(incomeMap.get("프로그램").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="suib_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(incomeMap.get("프로그램").get(i).getNote())%>">
												</div>
											</div>
											<%}
										} %>
									</div>
									<!--  -->
									<!--수입금액 숙박  -->
									<div id="suibSookbak_box">
									<%if(incomeMap.get("숙박비").size()==0) {%>
											<div class="col-md-10" style="height:60px" name="숙박비">
												<input type="hidden" value="숙박비" name="suib_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('suib suibSookbak 숙박비')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('suib suibSookbak 숙박비')"></span>
												</div>
												<label class="col-md-1 control-label">숙박비</label>
												<div class="col-md-2">
													<input type="number" name="suib_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
												</div>
												<div class="col-md-4">
													<input type="text" name="suib_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
												</div>
												<div class="col-md-3">
													<input type="text" name="suib_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
												</div>
											</div>
										<%} %>
									<%for(int i=0; i<incomeMap.get("숙박비").size(); i++) { 
											if(i==0) {%>
											<div class="col-md-10" style="height:60px" name="숙박비">
												<input type="hidden" value="숙박비" name="suib_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('suib suibSookbak 숙박비')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('suib suibSookbak 숙박비')"></span>
												</div>
												<label class="col-md-1 control-label">숙박비</label>
												<div class="col-md-2">
													<input type="number" name="suib_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=incomeMap.get("숙박비").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="suib_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(incomeMap.get("숙박비").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="suib_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(incomeMap.get("숙박비").get(i).getNote())%>">
												</div>
											</div>
											<%} else{%>
											<div class="col-md-10" style="height:60px" name="숙박비">
												<input type="hidden" value="숙박비" name="suib_type">
												<label class="col-md-1 control-label">   </label>
												<div class="col-md-2">
													<input type="number" name="suib_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=incomeMap.get("숙박비").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="suib_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(incomeMap.get("숙박비").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="suib_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(incomeMap.get("숙박비").get(i).getNote())%>">
												</div>
											</div>
											<%}
										} %>
									</div>
									<!--  -->
									<!--수입금액 식사  -->
									<div id="suibSiksa_box">
									<%if(incomeMap.get("식사비").size()==0) {%>
											<div class="col-md-10" style="height:60px" name="식사비">
												<input type="hidden" value="식사비" name="suib_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('suib suibSiksa 식사비')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('suib suibSiksa 식사비')"></span>
												</div>
												<label class="col-md-1 control-label">식사비</label>
												<div class="col-md-2">
													<input type="number" name="suib_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
												</div>
												<div class="col-md-4">
													<input type="text" name="suib_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
												</div>
												<div class="col-md-3">
													<input type="text" name="suib_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
												</div>
											</div>
										<%} %>
										<%for(int i=0; i<incomeMap.get("식사비").size(); i++) { 
											if(i==0) {%>
											<div class="col-md-10" style="height:60px" name="식사비">
												<input type="hidden" value="식사비" name="suib_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('suib suibSiksa 식사비')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('suib suibSiksa 식사비')"></span>
												</div>
												<label class="col-md-1 control-label">식사비</label>
												<div class="col-md-2">
													<input type="number" name="suib_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=incomeMap.get("식사비").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="suib_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(incomeMap.get("식사비").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="suib_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(incomeMap.get("식사비").get(i).getNote())%>">
												</div>
											</div>
											<%} else{%>
											<div class="col-md-10" style="height:60px" name="식사비">
												<input type="hidden" value="식사비" name="suib_type">
												<label class="col-md-1 control-label">   </label>
												<div class="col-md-2">
													<input type="number" name="suib_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=incomeMap.get("식사비").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="suib_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(incomeMap.get("식사비").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="suib_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(incomeMap.get("식사비").get(i).getNote())%>">
												</div>
											</div>
											<%}
										} %>
									</div>
									<!--  -->
									<!--수입금액 재료 -->
									<div id="suibJaeryo_box">
									<%if(incomeMap.get("재료비").size()==0) {%>
											<div class="col-md-10" style="height:60px" name="재료비">
												<input type="hidden" value="재료비" name="suib_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('suib suibJaeryo 재료비')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('suib suibJaeryo 재료비')"></span>
												</div>
												<label class="col-md-1 control-label">재료비</label>
												<div class="col-md-2">
													<input type="number" name="suib_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
												</div>
												<div class="col-md-4">
													<input type="text" name="suib_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
												</div>
												<div class="col-md-3">
													<input type="text" name="suib_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
												</div>
											</div>
										<%} %>
									<%for(int i=0; i<incomeMap.get("재료비").size(); i++) { 
											if(i==0) {%>
											<div class="col-md-10" style="height:60px" name="재료비">
												<input type="hidden" value="재료비" name="suib_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('suib suibJaeryo 재료비')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('suib suibJaeryo 재료비')"></span>
												</div>
												<label class="col-md-1 control-label">재료비</label>
												<div class="col-md-2">
													<input type="number" name="suib_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=incomeMap.get("재료비").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="suib_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(incomeMap.get("재료비").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="suib_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(incomeMap.get("재료비").get(i).getNote())%>">
												</div>
											</div>
											<%} else{%>
											<div class="col-md-10" style="height:60px" name="재료비">
												<input type="hidden" value="재료비" name="suib_type">
												<label class="col-md-1 control-label">   </label>
												<div class="col-md-2">
													<input type="number" name="suib_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=incomeMap.get("재료비").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="suib_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(incomeMap.get("재료비").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="suib_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(incomeMap.get("재료비").get(i).getNote())%>">
												</div>
											</div>
											<%}
										} %>
									</div>
									<!--  -->
									<!--수입금액 기타  -->
									<div id="suibGita_box">
									<%if(incomeMap.get("기타").size()==0) {%>
											<div class="col-md-10" style="height:60px" name="기타">
												<input type="hidden" value="기타" name="suib_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('suib suibGita 기타')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('suib suibGita 기타')"></span>
												</div>
												<label class="col-md-1 control-label">기타</label>
												<div class="col-md-2">
													<input type="number" name="suib_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
												</div>
												<div class="col-md-4">
													<input type="text" name="suib_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;">
												</div>
												<div class="col-md-3">
													<input type="text" name="suib_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
												</div>
											</div>
										<%} %>
									<%for(int i=0; i<incomeMap.get("기타").size(); i++) { 
											if(i==0) {%>
											<div class="col-md-10" style="height:60px" name="기타">
												<input type="hidden" value="기타" name="suib_type">
												<div style="float: right; width: 125px; height:60px">
													<span><input type="button" value="추가"
														class="btn btn-success btn-md" style="font-size: 18px;" onclick="total_add('suib suibGita 기타')"></span>
													<span><input type="button" value="삭제"
														class="btn btn-danger btn-md" style="font-size: 18px;" onclick="total_del('suib suibGita 기타')"></span>
												</div>
												<label class="col-md-1 control-label">기타</label>
												<div class="col-md-2">
													<input type="number" name="suib_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=incomeMap.get("기타").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="suib_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(incomeMap.get("기타").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="suib_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(incomeMap.get("기타").get(i).getNote())%>">
												</div>
											</div>
											<%} else{%>
											<div class="col-md-10" style="height:60px" name="기타">
												<input type="hidden" value="기타" name="suib_type">
												<label class="col-md-1 control-label">  </label>
												<div class="col-md-2">
													<input type="number" name="suib_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=incomeMap.get("기타").get(i).getPrice()%>">
												</div>
												<div class="col-md-4">
													<input type="text" name="suib_detail" class="form-control" id="" placeholder="세부내역" style="font-size: 13pt;" value="<%=convertXSS(incomeMap.get("기타").get(i).getDetail())%>">
												</div>
												<div class="col-md-3">
													<input type="text" name="suib_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(incomeMap.get("기타").get(i).getNote())%>">
												</div>
											</div>
											<%}
										} %>
									</div>
									<!--  -->
									<!--수입금액 할인율  -->
									<div class="col-md-10" style="height:60px">
										<input type="hidden" value="할인율" name="suib_type">
										<label class="col-md-1 control-label">할인율</label>
										<%if(incomeMap.get("할인율").size()==0){ %>
											<div class="col-md-2">
											<input type="number" name="suib_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;">
										</div>
										<div class="col-md-7">
											<input type="text" name="suib_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
											<input type="hidden" value="" name="suib_detail" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
										</div>
											<%} else {%>
											<div class="col-md-2">
											<input type="number" name="suib_price" class="form-control" id="" placeholder="금액(천원)" style="font-size: 13pt;" value="<%=incomeMap.get("할인율").get(0).getPrice()%>">
										</div>
										<div class="col-md-7">
											<input type="text" name="suib_note" class="form-control" id="" placeholder="비고" style="font-size: 13pt;" value="<%=convertXSS(incomeMap.get("할인율").get(0).getNote())%>">
											<input type="hidden" value="" name="suib_detail" class="form-control" id="" placeholder="비고" style="font-size: 13pt;">
										</div>
										<%}%>
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
<script type="text/javascript" src="/resources/js/common.js"></script>
<script>
	//홍두표 - 요소를 받고 값이 있으면 값을 반환, 없으면 데이터 타입에 맞는 디폴트 값 부여
	getOrDefaultValue = (factor) => {
		if(factor.value) {
			return factor.value;
		}
	    if(factor.type == 'text') {
	        return ' ';
	    }
	    if(factor.type == 'textarea') {
	        return ' ';
	    }
	    if(factor.type == 'date') {
	        alert('시작일자와 종료일자를 입력해주세요.');
	        return false;
	    }
	    if(factor.type == 'number') {
	        return 0;
	    }
	    if(factor.type == 'hidden') {
	        return ' ';
	    }
	}
	console.log('분야' + '<%=basicInfoList.get(0).getProgram_in_out2().get(1)%>');
	/******************** 중간저장 값 넣어 놓기 *****************************/
	//*************************실인원***********************************
	let total_people_save = document.getElementById('total_people');
	let peopleNum = parseInt(document.getElementsByName('part_man_cnt')[0].value) + parseInt(document.getElementsByName('part_woman_cnt')[0].value)
					+ parseInt(document.getElementsByName('lead_man_cnt')[0].value) + parseInt(document.getElementsByName('lead_woman_cnt')[0].value);
	total_people_save.innerHTML = "실인원 : " + peopleNum + "명";
	//*************************연인원***********************************
	let total_people_days_save = document.getElementById('total_people_days');
	let peopleYearNum = peopleNum * <%=convertXSS(basicInfoList.get(0).getDays_to_stay()).trim()%>;
	total_people_days_save.innerHTML = "연인원 : " + peopleYearNum + "명";
	//***********지원사항, 사업목적, 참가자유형, 연령대, 수입구분, 서비스유형*******
	let radioArr = [];
	<%
	String[] supportList = basicInfoList.get(0).getSupport().split(",");
	for(int i = 0; i < supportList.length; i++) {
			
		if(bDTO.getSupport().contains(convertXSS(supportList[i]))) {
	%> 
			radioArr.push("<%=convertXSS(supportList[i])%>"); 
	<%	}
	}
	%>
	<%if(Arrays.asList(biz_purpose).contains(convertXSS(basicInfoList.get(0).getBiz_purpose()))) {%>
		radioArr.push("<%=convertXSS(basicInfoList.get(0).getBiz_purpose())%>biz_purpose"); 
	<%}%>
	<%if(Arrays.asList(part_type).contains(convertXSS(basicInfoList.get(0).getPart_type()))) {%>
		radioArr.push("<%=convertXSS(basicInfoList.get(0).getPart_type())%>part_type"); 
	<%}%>
	<%if(Arrays.asList(age_type).contains(convertXSS(basicInfoList.get(0).getAge_type()))) {%>
		radioArr.push("<%=convertXSS(basicInfoList.get(0).getAge_type())%>age_type"); 
	<%}%>
	<%if(Arrays.asList(income_type).contains(convertXSS(basicInfoList.get(0).getIncome_type()))) {%>
		radioArr.push("<%=convertXSS(basicInfoList.get(0).getIncome_type())%>income_type"); 
	<%}%>
	<%if(Arrays.asList(service_type).contains(convertXSS(basicInfoList.get(0).getService_type()))){%>
		radioArr.push("<%=convertXSS(basicInfoList.get(0).getService_type())%>service_type"); 
	<%}%>
	for(let i=0; i<radioArr.length; i++) {
		console.log(radioArr[i]);
		$('#'+radioArr[i]).prop("checked", true);
	}
	//**************************총인원,총객실*****************************
	let total_room_person_save = document.getElementById('total_room_person');
	let roomPersonNum = parseInt(document.getElementsByName('room_part_people')[0].value) + parseInt(document.getElementsByName('room_lead_people')[0].value)
					+ parseInt(document.getElementsByName('room_etc_people')[0].value);
	total_room_person_save.innerHTML = "총인원 : " + roomPersonNum + "명";
	
	let total_room_count_save = document.getElementById('total_room_count');
	let roomNum = parseInt(document.getElementsByName('room_part_room')[0].value) + parseInt(document.getElementsByName('room_lead_room')[0].value)
					+ parseInt(document.getElementsByName('room_etc_room')[0].value);
	total_room_count_save.innerHTML = "총객실 : " + roomNum + "호";
	//**************************프로그램 명******************************
	let programSaveIndex = 1;
	let programSaveSize = "<%=basicInfoList.get(0).getProgram_in_out2().size()/5%>";
	let programSaveName = ["programName","bunya","teacher","in_tutor","out_tutor"];
	let programSaveInOut = "<%=basicInfoList.get(0).getProgram_in_out2()%>";
	programSaveInOut = programSaveInOut.substring(1,programSaveInOut.length-1).trim();
	programSaveInOutArr = programSaveInOut.split(",");
	console.log(programSaveInOutArr);
	console.log("programSaveSize : " + programSaveSize);
	if(programSaveSize>1) {
		for(let i=1; i<programSaveSize; i++) {
			programSaveIndex = i * 5;
			console.log("programSaveIndex : " + programSaveIndex);
			const saveBox = document.getElementById("test00");
			const saveTest = document.getElementById('test').innerHTML;
			const saveNewP = document.createElement('div');
			saveNewP.innerHTML = saveTest;
			saveNewP.setAttribute("id", "test" + i);
			saveNewP.setAttribute("class", "form-group justify-content-center");
			saveBox.appendChild(saveNewP);
			let x = 0;
			
			for(let j=programSaveIndex; j<programSaveIndex+5; j++) {
				console.log("j : " + j);
				console.log("x : " + x);
				document.getElementsByName(programSaveName[x])[i].value = programSaveInOutArr[j].trim();
				x++;
			}
		}
	}
	/*****************************************************************/
	

	// 참여일자 계산
	let L_TODAY = document.querySelector("#tostay");
	let days_to_stay = 0;
	endday.oninput = function (e) {
		console.log(e);
		var openday = document.getElementById("openday");
		var endday = document.getElementById("endday");
		days_to_stay = ((endday.valueAsDate.getTime() - openday.valueAsDate.getTime()) / 1000 / 60 / 60 / 24) + 1;
		
		console.info(days_to_stay + "일");
		tostay.innerHTML = days_to_stay;
	}
	// 참여일자 순서 바뀌어도 되게끔 추가
	let days_to_stay2 = 0;
	openday.oninput = function (e) {
		console.log(e);
		var openday2 = document.getElementById("openday");
		var endday2 = document.getElementById("endday");
		days_to_stay2 = ((endday2.valueAsDate.getTime() - openday2.valueAsDate.getTime()) / 1000 / 60 / 60 / 24) + 1;
		
		console.info(days_to_stay2 + "일");
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
		if(user1!="") {
			checkIndex++;
		} 
		if(user2!="") {
			checkIndex++;
		}
		if(user3!="") {
			checkIndex++;
		}
		if(user4!="") {
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
	var count = programSaveSize; // 전체 프로그램 행 개수
	box1.onclick = function () {
		if(count >= 7) {
			return doSwal("프로그램은 최대 7개까지만 가능합니다.", "");
		}
		const box = document.getElementById("test00");
		const test = document.getElementById("test").innerHTML;
		const newP = document.createElement("div");
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
	
	
	//통합 버튼
	total_add = function (fullname) {
		let type = fullname.split(" ")[0];
		let box = fullname.split(" ")[1];
		let value = fullname.split(" ")[2];
		console.log(box);
		let new_div = `<div class="col-md-10" style="height:60px" name="` + value + `"><input type="hidden" value="` + value + `" name="`+type+`_type"><label class="col-md-1 control-label">   </label><div class="col-md-2"><input type="number" name="`+type+`_price" class="form-control"placeholder="금액(천원)" style="font-size: 13pt;"></div><div class="col-md-4"><input type="text" name="`+type+`_detail" class="form-control" placeholder="세부내역" style="font-size: 13pt;"></div><div class="col-md-3"><input type="text" name="`+type+`_note" class="form-control"placeholder="비고" style="font-size: 13pt;"></div></div>`
		$("#" + box + "_box").append(new_div);
	}
	total_del = function (fullname) {
		let box = fullname.split(' ')[1];
		let label = fullname.split(' ')[2];
		let addedFormDiv = document.getElementById(box + "_box").lastElementChild;
		if(document.getElementsByName(label).length==1) { 
			doSwal("첫행은 삭제할 수 없습니다.", "");
			return false;
		} else { 
			addedFormDiv.remove();
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
		if(room01!="") {
			checkIndex++;
		} 
		if(room02!="") {
			checkIndex++;
		}
		if(room03!="") {
			checkIndex++;
		}
		if(room04!="") {
			checkIndex++;
		}
		if(room05!="") {
			checkIndex++;
		}
		if(room06!="") {
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
	
</script>
<script type="text/javascript">
///////////////////////////////////////////////////////////////////////////////
////////////////////////////////////저장 기능 시작//////////////////////////////////
	
	// [name]값을 받아 입력창이 비어 있는지 확인하는 함수 정의
	isEmpty = function (name, index) {
		return document.getElementsByName(name)[index].value.trim() == "";
	}
	// [name]값을 받아 입력창으로 커서를 이동시키는 함수 정의
	focusByName = function (name, index) {
		return document.getElementsByName(name)[index].focus();
	}
	
	// post 방식으로 Controller에 데이터 전달
	sendPost = function() {
		let form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action", "/");
		
		let openday = document.createElement("input");
		openday.setAttribute("name", "openday");
		openday.setAttribute("value", document.getElementsByName("openday")[0].value);
		form.appendChild(openday);
		
		let agency = document.createElement("input");
		agency.setAttribute("name", "agency");
		agency.setAttribute("value", document.getElementsByName("agency")[0].value);
		form.appendChild(agency);
		
		document.body.appendChild(form);
		form.submit();
	}
	
	
	// 중간 저장 버튼
	let semiSaveButton = document.querySelector("#semiSaveButton");
	let semiSavebuttonText = document.querySelector("#semiSaveTick");
	
	// 최종 저장 버튼 
	let button = document.querySelector("#button");
	let buttonText = document.querySelector("#tick");
	
	// 중간, 최종 둘다 한 변수로 사용 가능
	const tickMark = "<svg width=\"58\" height=\"45\" viewBox=\"0 0 58 45\" xmlns=\"http://www.w3.org/2000/svg\"><path fill=\"#fff\" fill-rule=\"nonzero\" d=\"M19.11 44.64L.27 25.81l5.66-5.66 13.18 13.18L52.07.38l5.65 5.65\"/></svg>";

	buttonText.innerHTML = "저장";
	semiSavebuttonText.innerHTML = "중간저장";
	
	
	// 입력된 데이터를 object객체에 저장(BasicInfoDTO 멤버변수와 자동 매핑되도록 동일한 이름 사용)
	let object = {};

	// 체크박스에서 체크된 항목만 object객체 내 배열에 담는 함수 정의
	pushByCheckedBox = function (name) {
		let j = 0;
		object[name] = "";
		document.getElementsByName(name).forEach(item => {
			if (item.checked) {
				object[name] += (item.parentNode.innerText + ",");
			}
		})
		if(object[name].length) { 
			object[name] = object[name].substring(0, object[name].length - 1);
		}
		
	}
	
	// 라디오박스에서 체크된 항목만 object객체 내 배열에 담는 함수 정의
	pushByRadioBox = function (name) {
		let j = 0;
		object[name] = "";
		document.getElementsByName(name).forEach(item => {
			if (item.checked) {
				object[name] = item.parentNode.innerText;
				return false;
			}
		});
	}


	// input태그에 입력된 값을 object객체에 담는 함수 정의
	pushByInputName = function (name) {
		object[name] = document.getElementsByName(name)[0].value.trim();
	}
	
	////////////////////////////////////중간 저장 기능 시작//////////////////////////////////
	semiSaveButton.addEventListener("click", function () {
		
		// 중간저장에서 필요한 최소한의 유효성 검사
		if(isEmpty("agency", 0)) {
			return focusByName("agency", 0);
		}
		if(isEmpty("om", 0)) {
			return focusByName("om", 0);
		}
		if(isEmpty("openday", 0)) {
			return focusByName("openday", 0);
		}
		if(isEmpty("endday", 0)) {
			return focusByName("endday", 0);
		}
		
		
		
		
		
		// 단체명
		pushByInputName("agency");
		
		// OM
		pushByInputName("om");
		
		// 참여일자(시작일,종료일)
		pushByInputName("openday");
		pushByInputName("endday");

		// 체류기간
		let days = document.getElementById("tostay");
		object["days_to_stay"] = parseInt(days.textContent);
		console.log(object["days_to_stay"]);
		if (parseInt(days.textContent) < 1) {
			doSwal("날짜 선택이 올바르지 않습니다.", "");
			return focusByName("endday", 0);
		}
		
		// 거주지역
		object["residence"] = $("#residence option:checked").text();	//selectbox
		
		// 참여인원
		pushByInputName("part_man_cnt");	// 참여자_남자
		pushByInputName("part_woman_cnt");	// 참여자_여자
		pushByInputName("lead_man_cnt");	// 인솔자_남자
		pushByInputName("lead_woman_cnt");	// 인솔자_여자
		
		// 지원사항
		pushByCheckedBox("support");
		
		// 사업구분
		pushByRadioBox("biz_purpose");
		
		// 참가자유형
		pushByRadioBox("part_type");
		
		// 연령대
		pushByRadioBox("age_type");
		
		// 수입목적
		pushByRadioBox("income_type");
		
		// 서비스유형
		pushByRadioBox("service_type");
		
		// 프로그램 중복선택가능
		for (let i = 0; i < $("input[name=programName]").length; i++) {
			object["program_in_out[" + i + "].programName"] = getOrDefaultValue($("input[name=programName]").get(i));	//selectbox
			object["program_in_out[" + i + "].in_tutor"] = getOrDefaultValue($("input[name=in_tutor]").get(i));
			object["program_in_out[" + i + "].out_tutor"] = getOrDefaultValue($("input[name=out_tutor]").get(i));
			object["program_in_out[" + i + "].teacher"] = getOrDefaultValue($("input[name=teacher]").get(i));
			object["program_in_out[" + i + "].bunya"] = getOrDefaultValue($("select[name=bunya]").get(i));
		}
		
		// 객실
		pushByInputName("room_part_people");	// 참여자_인원
		pushByInputName("room_part_room");		// 참여자_객실
		pushByInputName("room_lead_people");	// 인솔자_인원
		pushByInputName("room_lead_room");		// 인솔자_객실
		pushByInputName("room_etc_people");		// 기타_인원
		pushByInputName("room_etc_room");		// 기타_객실
		//유저 아이디 넣기
		object["reg_id"] = "<%=reg_id%>";
		// 식사
		pushByInputName("meal_type");	// 식사 수
		pushByInputName("meal_part");	// 참여자_인원
		pushByInputName("meal_lead");	// 인솔자_인원
		pushByInputName("meal_etc");	// 기타_인원
		
		
		
		// 프로그램 소감 [텍스트]
		pushByInputName("program_opinion");
		// 시설서비스 소감 [텍스트]
		pushByInputName("service_opinion");
		// 종합의견 [텍스트]
		pushByInputName("overall_opinion");
		
		object["progress_state"] = "P";
		
		
		
		
		let expense_type = document.getElementsByName("expense_type");
		let expense_price = document.getElementsByName("expense_price");
		let expense_detail = document.getElementsByName("expense_detail");
		let expense_note = document.getElementsByName("expense_note");
		let exp_i = 0;
		// 지출금액에 값을 object객체에 담는 함수 정의
		for (let i = 0; i < expense_type.length; i++) {
				object["expList[" + exp_i + "].type"] = getOrDefaultValue($("input[name=expense_type]").get(i)).trim();
				object["expList[" + exp_i + "].price"] = getOrDefaultValue($("input[name=expense_price]").get(i));
				object["expList[" + exp_i + "].detail"] = getOrDefaultValue($("input[name=expense_detail]").get(i));
				object["expList[" + exp_i + "].note"] = getOrDefaultValue($("input[name=expense_note]").get(i));
				exp_i++;
		}
	
		
		let suib_type = document.getElementsByName("suib_type");
		let suib_price = document.getElementsByName("suib_price");
		let suib_detail = document.getElementsByName("suib_detail");
		let suib_note = document.getElementsByName("suib_note");
		let inc_i = 0;
		// 수입금액에 값을 object객체에 담는 함수 정의
		for (let i = 0; i < suib_type.length; i++) {
				object["incList[" + inc_i + "].type"] = getOrDefaultValue($("input[name=suib_type]").get(i)).trim();
				object["incList[" + inc_i + "].price"] = getOrDefaultValue($("input[name=suib_price]").get(i));
				object["incList[" + inc_i + "].detail"] = getOrDefaultValue($("input[name=suib_detail]").get(i));
				object["incList[" + inc_i + "].note"] = getOrDefaultValue($("input[name=suib_note]").get(i));
				inc_i++;
		}
		
		
		
		
		// 중간저장 서식 불러와서 update 쿼리를 사용하기 때문에 basic_info_seq가 필요함
		object["basic_info_seq"] = "<%=basicInfoList.get(0).getBasic_info_seq()%>";
		
		
		
		
		
		// 중간 저장 버튼 -> 동그란 버튼으로 변환
		if (semiSavebuttonText.innerHTML !== "저장") {
			semiSavebuttonText.innerHTML = "저장";
		} if (semiSavebuttonText.innerHTML == "저장") {
			semiSavebuttonText.innerHTML = tickMark;
		}
		this.classList.toggle("button_circle");
		
		console.table(object);

		
		swal("중간저장 하시겠습니까?", "", "info", {
			buttons : ["취소", "확인"]
		}).then(function(confirm) {
			console.log(confirm);
			if (confirm) {
				// 프로그램 결과 데이터가 담긴 object객체를 컨트롤러로 전달 
				$.ajax({
					url: "/updateOperateResultProc.do",
					method: "post",
					data: object,
					success: function (res) {
						let content = res.split(",")[1];
						let type = res.split(",")[0];
						let title = (type == "success") ? "중간저장 되었습니다." : "저장되지 않았습니다.";
						// 1. 저장 후 만족도 및 효과평가 화면으로 이동
						// 2. 만족도 및 효과평가 사전/사후 차이값 비교
						swal(title, content, type, {
							timer : 3000,
							button : "확인"
						}).then(function() {
							// 저장 성공하면 "만족도 및 효과평가" 입력 화면으로 이동
							if (type == "success") {
								location.href = "/insertForm/serviceInsertForm.do";
							}
			 			});
					},
					error: function (err) {
						doSwal("입력을 처리할 수 없습니다.", "올바른 정보인지 확인 후 재요청 해주십시오.", "error");
					}
				});
			}
		});
		
	});
	////////////////////////////////////중간 저장 기능 끝//////////////////////////////

	
	
	
	
	
	
	
	
	
	
	
	////////////////////////////////////최종 저장 기능 시작////////////////////////////
	button.addEventListener("click", function () {
		
		// 미입력시 못넘어가도록 유효성 검사
		if(isEmpty("agency", 0)) {
			return focusByName("agency", 0);
		} 
		if(isEmpty("om", 0)) {
			return focusByName("om", 0);
		} 
		if(isEmpty("openday", 0)) {
			return focusByName("openday", 0);
		}  
		if(isEmpty("endday", 0)) {
			return focusByName("endday", 0);
		} 
		if(isEmpty("part_man_cnt", 0)) {
			return focusByName("part_man_cnt", 0);
		} 
		if(isEmpty("part_woman_cnt", 0)) {
			return focusByName("part_woman_cnt", 0);
		} 
		if(isEmpty("lead_man_cnt", 0)) {
			return focusByName("lead_man_cnt", 0);
		} 
		if(isEmpty("lead_woman_cnt", 0)) {
			return focusByName("lead_woman_cnt", 0);
		} 
		if(isEmpty("programName", 0)) {
			return focusByName("programName", 0);
		} 
		if(isEmpty("bunya", 0)) {
			return focusByName("bunya", 0);
		}
		if(isEmpty("teacher", 0)) {
			return focusByName("teacher", 0);
		} 
		if(isEmpty("in_tutor", 0)) {
			return focusByName("in_tutor", 0);
		} 
		if(isEmpty("out_tutor", 0)) {
			return focusByName("out_tutor", 0);
		} 
		if(isEmpty("room_part_people", 0)) {
			return focusByName("room_part_people", 0);
		} 
		if(isEmpty("room_part_room", 0)) {
			return focusByName("room_part_room", 0);
		} 
		if(isEmpty("room_lead_people", 0)) {
			return focusByName("room_lead_people", 0);
		} 
		if(isEmpty("room_lead_room", 0)) {
			return focusByName("room_lead_room", 0);
		} 
		if(isEmpty("room_etc_people", 0)) {
			return focusByName("room_etc_people", 0);
		} 
		if(isEmpty("room_etc_room", 0)) {
			return focusByName("room_etc_room", 0);
		} 
		if(isEmpty("meal_type", 0)) {
			return focusByName("meal_type", 0);
		} 
		if(isEmpty("meal_part", 0)) {
			return focusByName("meal_part", 0);
		} 
		if(isEmpty("meal_lead", 0)) {
			return focusByName("meal_lead", 0);
		} 
		if(isEmpty("meal_etc", 0)) {
			return focusByName("meal_etc", 0);
		}
	
		
		
		
		
		
		// 단체명
		pushByInputName("agency");
		
		// OM
		pushByInputName("om");
		
		// 참여일자(시작일,종료일)
		pushByInputName("openday");
		pushByInputName("endday");
		// 체류기간
		object["days_to_stay"] = document.getElementById("tostay").textContent;
		
		// 거주지역
		object["residence"] = $("#residence option:checked").text();	//selectbox
		
		// 참여인원
		pushByInputName("part_man_cnt");	// 참여자_남자
		pushByInputName("part_woman_cnt");	// 참여자_여자
		pushByInputName("lead_man_cnt");	// 인솔자_남자
		pushByInputName("lead_woman_cnt");	// 인솔자_여자
		
		// 지원사항
		pushByCheckedBox("support");
		
		if(!object["support"].trim()) {
			return focusByName("support", 0);
		}
		
		// 사업구분
		pushByRadioBox("biz_purpose");
		if(!object["biz_purpose"].trim()) {
			return focusByName("biz_purpose", 0);
		}
		
		// 참가자유형
		pushByRadioBox("part_type");
		if(!object["part_type"].trim()) {
			return focusByName("part_type", 0);
		}
		
		// 연령대
		pushByRadioBox("age_type");
		if(!object["age_type"].trim()) {
			return focusByName("age_type", 0);
		}
		
		// 수입목적
		pushByRadioBox("income_type");
		if(!object["income_type"].trim()) {
			return focusByName("income_type", 0);
		}
		
		// 서비스유형
		pushByRadioBox("service_type");
		if(!object["service_type"].trim()) {
			return focusByName("service_type", 0);
		}
		
		// 프로그램 중복선택가능
		for (let i = 0; i < $("input[name=programName]").length; i++) {
			object["program_in_out[" + i + "].programName"] = getOrDefaultValue($("input[name=programName]").get(i));	//selectbox
			object["program_in_out[" + i + "].in_tutor"] = getOrDefaultValue($("input[name=in_tutor]").get(i));
			object["program_in_out[" + i + "].out_tutor"] = getOrDefaultValue($("input[name=out_tutor]").get(i));
			object["program_in_out[" + i + "].teacher"] = getOrDefaultValue($("input[name=teacher]").get(i));
			object["program_in_out[" + i + "].bunya"] = getOrDefaultValue($("select[name=bunya]").get(i));
		}
		
		
		// 객실
		pushByInputName("room_part_people");	// 참여자_인원
		pushByInputName("room_part_room");		// 참여자_객실
		pushByInputName("room_lead_people");	// 인솔자_인원
		pushByInputName("room_lead_room");		// 인솔자_객실
		pushByInputName("room_etc_people");		// 기타_인원
		pushByInputName("room_etc_room");		// 기타_객실
		//유저 아이디 넣기
		object["reg_id"] = "<%=reg_id%>";
		// 식사
		pushByInputName("meal_type");	// 식사 수
		pushByInputName("meal_part");	// 참여자_인원
		pushByInputName("meal_lead");	// 인솔자_인원
		pushByInputName("meal_etc");	// 기타_인원
		
		
		
		// 프로그램 소감 [텍스트]
		pushByInputName("program_opinion");
		// 시설서비스 소감 [텍스트]
		pushByInputName("service_opinion");
		// 종합의견 [텍스트]
		pushByInputName("overall_opinion");
		
		object["progress_state"] = "E";
		
		
		
		
		
		
		let expense_type = document.getElementsByName("expense_type");
		let expense_price = document.getElementsByName("expense_price");
		let expense_detail = document.getElementsByName("expense_detail");
		let expense_note = document.getElementsByName("expense_note");
		let exp_i = 0;
		// 지출금액에 값을 object객체에 담는 함수 정의
		for (let i = 0; i < expense_type.length; i++) {
				object["expList[" + exp_i + "].type"] = getOrDefaultValue($("input[name=expense_type]").get(i)).trim();
				object["expList[" + exp_i + "].price"] = getOrDefaultValue($("input[name=expense_price]").get(i))
				object["expList[" + exp_i + "].detail"] = getOrDefaultValue($("input[name=expense_detail]").get(i))
				object["expList[" + exp_i + "].note"] = getOrDefaultValue($("input[name=expense_note]").get(i))
				exp_i++;
		}
	
		
		let suib_type = document.getElementsByName("suib_type");
		let suib_price = document.getElementsByName("suib_price");
		let suib_detail = document.getElementsByName("suib_detail");
		let suib_note = document.getElementsByName("suib_note");
		let inc_i = 0;
		// 수입금액에 값을 object객체에 담는 함수 정의
		for (let i = 0; i < suib_type.length; i++) {
				object["incList[" + inc_i + "].type"] = getOrDefaultValue($("input[name=suib_type]").get(i)).trim();
				object["incList[" + inc_i + "].price"] = getOrDefaultValue($("input[name=suib_price]").get(i))
				object["incList[" + inc_i + "].detail"] = getOrDefaultValue($("input[name=suib_detail]").get(i))
				object["incList[" + inc_i + "].note"] = getOrDefaultValue($("input[name=suib_note]").get(i))
				inc_i++;
		}
		

		
		
		
		// 중간저장 서식 불러와서 update 쿼리를 사용하기 때문에 basic_info_seq가 필요함
		object["basic_info_seq"] = "<%=basicInfoList.get(0).getBasic_info_seq()%>";
		
		
		
		
		
		
		
		// 최종 저장 버튼 -> 동그란 버튼으로 변환
		if (buttonText.innerHTML !== "저장") {
			buttonText.innerHTML = "저장";
		} if (buttonText.innerHTML === "저장") {
			buttonText.innerHTML = tickMark;
		}
		this.classList.toggle("button_circle");
		
		console.table(object);
		
		
		
		
		swal("최종저장 하시겠습니까?", "", "info", {
			buttons : ["취소", "확인"]
		}).then(function(confirm) {
			if (confirm) {
				// 프로그램 결과 데이터가 담긴 object객체를 컨트롤러로 전달 
				$.ajax({
					url: "/updateOperateResultProc.do",
					method: "post",
					data: object,
					success: function (res) {
						let content = res.split(",")[1];
						let type = res.split(",")[0];
						let title = (type == "success") ? "최종저장 되었습니다." : "저장되지 않았습니다.";
						swal(title, content, type, {
							button : "확인"
						}).then(function() {
							// 저장 성공하면 "만족도 및 효과평가" 입력 화면으로 이동
							if (type == "success") {
								location.href = "/insertForm/serviceInsertForm.do";
							}
			 			});
					},
					error: function (err) {
						doSwal("입력을 처리할 수 없습니다.", "올바른 정보인지 확인 후 재요청 해주십시오.", "error");
					}
				});
			}
 		});

	});
	
	////////////////////////////////////최종 저장 기능 끝////////////////////////////

////////////////////////////////////저장 기능 끝///////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

</script>
<!-- 페이지 내에서 이벤트가 발생하면 자바스크립트 함수를 실행하는 부분 ./---end -->
</html>