<%@page import="poly.dto.UpdateListDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<UpdateListDTO> uList = (List<UpdateListDTO>)request.getAttribute("uList");
%>
<%@ page import ="static poly.util.CmmUtil.convertXSS" %>
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
	
	<!--Custom Font-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

	<!-- 홍두표 - 나눔스퀘어 폰트 불러오기 -->
	<style>
		@import url(https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css);
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


</head>
<body>
	<!--/.sidebar Sart-->
	<%@ include file="/WEB-INF/view/top.jsp"%>
	<%@ include file="/WEB-INF/view/sidebar.jsp"%>
	<!--/.sidebar End-->
	
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">수정 및 삭제</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">입력 양식 조회</h1>
			</div>
		</div><!--/.row-->
		
		
		
		
		<!--홍석민이 만들고 있음	-->
		<div class="row">
			<!--고르기버튼 include -->
			<%@ include file="/WEB-INF/view/updateForm/select.jsp"%>
			<div class="col-md-12">
				
				<div class="panel panel-default chat">
				
					<div class="panel-heading" style="display: flex;height: auto !important;flex-flow: row-reverse;">
						<div style="flex: auto;flex-basis: auto;white-space: nowrap;display: inline-flex;overflow: hidden;">
							<div style="margin-right: 15px;">
								<h4 style="float : left; margin: 13px 10px 13px 0px;">기관명</h4> 
								<div style="width: 120px;float: left;margin-right: 10px;flex: auto;flex-basis: auto;white-space: nowrap;max-width: 300px;">
									<input class="form-control form-agency" name='form-agency' placeholder="기관명">
								</div>
							</div>
							<div style="float: left; margin: 0px 10px 0px 0px;">
								<input type="button" class="btn btn-default btn-sm healing-btn" value="조회" onclick="getUpdateList()">
							</div>
						</div>
					</div>
					<div class="panel-body" style="overflow-x: hidden; height: auto; overflow-y: hidden;">
						<ul class="todo-list">
						<!-- 홍두표 - 직원 계정 목록 -->
							<li class="todo-list-item">
								<div class="checkbox" style="width: 10%;">
									<!-- 번호 -->
									<label for="">번호</label>
								</div>
								<div class="checkbox" style="width: 20%; margin-right: 20%;">
									<!-- 직원명 -->
									<label for="">기관명</label>
								</div>
								<div class="checkbox" style="width: 10%; margin-right: 3%;">
									<!-- 권한 -->
									<label for="">실시일자</label>
								</div>
								<div class="checkbox" style="width: 6%; margin-right: 2%;">
									<label style="padding-left: 0px">삭제</label>
								</div> <!-- 삭제 -->
							</li>
						</ul>
						<ul class="todo-list" id="getList">
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/lumino/js/jquery-1.11.1.min.js"></script>
	<script src="/lumino/js/bootstrap.min.js"></script>
	<script src="/lumino/js/chart.min.js"></script>
	<script src="/lumino/js/chart-data.js"></script>
	<script src="/lumino/js/easypiechart.js"></script>
	<script src="/lumino/js/easypiechart-data.js"></script>
	<script src="/lumino/js/bootstrap-datepicker.js"></script>
	<script src="/lumino/js/custom.js"></script>
	<script type="text/javascript" src="/resources/js/common.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
	let tb_name = "";
	
	function updateForm(selectTable) {
		$("#getList").empty();
		let table_name = $(selectTable).val();
		console.log(table_name);
		tb_name = table_name;
		$.ajax({
			url: "/updateForm/getList.do",
			type: "POST",
			data: {'table_name':table_name}, 
			async: false,
			success:function(result) {
				console.table(result);
				if(table_name=='basic_info') { 
					for(let i=0; i<result.length; i++) {
						result[i]["agency"] = convertXSS(result[i]["agency"]);
						let new_div = `<li class="todo-list-item userDetail"><div class="checkbox" style="width: 10%;">`
										+ `<label for="">` + (i+1) + `</label></div><div class="checkbox" style="width: 40%;">`
										+ `<a class="trash updateDetail" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["openday"] + `"><label for="" >` + result[i]["agency"] + `</label></div><div class="checkbox" style="width: 10%; margin-right: 4%;"></a>`
										+ `<label for="">` + result[i]["openday"] + `</label></div><div class="checkbox" style="width: 6%; margin-right: 3%;">`
										+ `<a class="trash deleteForm" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["openday"] + `"><span class="fa fa-trash"></span></a></div></li>`;
						$("#getList").append(new_div);
					}
					//입력양식 삭제
				 	$('.deleteForm').click(function() {
						location.href = "/updateForm/deleteForm.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&openday=" + $(this).attr('data-openday');
					}) 
					//수정하러 이동
				 	$('.updateDetail').click(function() {
						location.href = "/updateForm/updateDetail.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&openday=" + $(this).attr('data-openday');
					}) 
				} else if(table_name=='service_env_satisfaction') { 
					for(let i=0; i<result.length; i++) {
						let new_div = `<li class="todo-list-item userDetail"><div class="checkbox" style="width: 10%;">`
										+ `<label for="">` + (i+1) + `</label></div><div class="checkbox" style="width: 40%;">`
										+ `<a class="trash updateDetail" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["eval_date"] + `"><label for="" >` + result[i]["agency"] + `</label></div><div class="checkbox" style="width: 10%; margin-right: 4%;"></a>`
										+ `<label for="">` + result[i]["eval_date"] + `</label></div><div class="checkbox" style="width: 6%; margin-right: 3%;">`
										+ `<a class="trash deleteForm" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["eval_date"] + `"><span class="fa fa-trash"></span></a></div></li>`;
						$("#getList").append(new_div);
					}
					//입력양식 삭제
				 	$('.deleteForm').click(function() {
						location.href = "/updateForm/deleteForm.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&openday=" + $(this).attr('data-openday');
					}) 
					//수정하러 이동
				 	$('.updateDetail').click(function() {
						location.href = "/updateForm/updateDetail.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&openday=" + $(this).attr('data-openday');
					}) 
				} else if(table_name=='program_satisfaction') { 
					for(let i=0; i<result.length; i++) {
						let new_div = `<li class="todo-list-item userDetail"><div class="checkbox" style="width: 10%;">`
										+ `<label for="">` + (i+1) + `</label></div><div class="checkbox" style="width: 40%;">`
										+ `<a class="trash updateDetail" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["eval_date"] + `" data-program_name="` + result[i]["program_name"] + `"><label for="" >` + result[i]["agency"]  + `(` +result[i]["program_name"] + `)</label></div><div class="checkbox" style="width: 10%; margin-right: 4%;"></a>`
										+ `<label for="">` + result[i]["eval_date"] + `</label></div><div class="checkbox" style="width: 6%; margin-right: 3%;">`
										+ `<a class="trash deleteForm" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["eval_date"] + `" data-program_name="` + result[i]["program_name"] + `"><span class="fa fa-trash"></span></a></div></li>`;
						$("#getList").append(new_div);
					}
					//입력양식 삭제
				 	$('.deleteForm').click(function() {
						location.href = "/updateForm/deleteForm.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&openday=" + $(this).attr('data-openday') + "&program_name=" + $(this).attr('data-program_name');
					}) 
					//수정하러 이동
				 	$('.updateDetail').click(function() {
						location.href = "/updateForm/updateDetail.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&openday=" + $(this).attr('data-openday') + "&program_name=" + $(this).attr('data-program_name');
					}) 
				}else if(table_name=='hrv_service' || table_name=='vibra_service') { 
					for(let i=0; i<result.length; i++) {
						let new_div = `<li class="todo-list-item userDetail"><div class="checkbox" style="width: 10%;">`
										+ `<label for="">` + (i+1) + `</label></div><div class="checkbox" style="width: 40%;">`
										+ `<a class="trash updateDetail" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["openday"] + `" data-pv="` + result[i]["pv"] + `"><label for="" >` + result[i]["agency"] + `(` +result[i]["pv"] + `)</label></div><div class="checkbox" style="width: 10%; margin-right: 4%;"></a>`
										+ `<label for="">해당없음</label></div><div class="checkbox" style="width: 6%; margin-right: 3%;">`
										+ `<a class="trash deleteForm" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["openday"] + `" data-pv="` + result[i]["pv"] + `"><span class="fa fa-trash"></span></a></div></li>`;
						$("#getList").append(new_div);
					}	
					//입력양식 삭제
				 	$('.deleteForm').click(function() {
						location.href = "/updateForm/deleteForm.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&pv=" + $(this).attr('data-pv');
					}) 
					//수정하러 이동
				 	$('.updateDetail').click(function() {
						location.href = "/updateForm/updateDetail.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&pv=" + $(this).attr('data-pv');
					})
				} else if(table_name=='counsel_service') {
					for(let i=0; i<result.length; i++) {
						let session = result[i]['session'].substring(0,2);
						console.log(session);
						let new_div = `<li class="todo-list-item userDetail"><div class="checkbox" style="width: 10%;">`
										+ `<label for="">` + (i+1) + `</label></div><div class="checkbox" style="width: 40%;">`
										+ `<a class="trash updateDetail" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["eval_date"] + `" data-pv="` + result[i]["pv"] + `"><label for="" >` + result[i]["agency"] + `(` + session + `)</label></div><div class="checkbox" style="width: 10%; margin-right: 4%;"></a>`
										+ `<label for="">` + result[i]["eval_date"] + `</label></div><div class="checkbox" style="width: 6%; margin-right: 3%;">`
										+ `<a class="trash deleteForm" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["eval_date"] + `" data-pv="` + result[i]["pv"]+ `"><span class="fa fa-trash"></span></a></div></li>`;
						$("#getList").append(new_div);
					}	
					//입력양식 삭제
				 	$('.deleteForm').click(function() {
						location.href = "/updateForm/deleteForm.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&openday=" + $(this).attr('data-openday')  + "&pv=" + $(this).attr('data-pv');
					}) 
					//수정하러 이동
				 	$('.updateDetail').click(function() {
						location.href = "/updateForm/updateDetail.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&openday=" + $(this).attr('data-openday')  + "&pv=" + $(this).attr('data-pv');
					}) 
				}else {
					for(let i=0; i<result.length; i++) {
						let new_div = `<li class="todo-list-item userDetail"><div class="checkbox" style="width: 10%;">`
										+ `<label for="">` + (i+1) + `</label></div><div class="checkbox" style="width: 40%;">`
										+ `<a class="trash updateDetail" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["eval_date"] + `" data-pv="` + result[i]["pv"] + `"><label for="" >` + result[i]["agency"] + `(` +result[i]["pv"] + `)</label></div><div class="checkbox" style="width: 10%; margin-right: 4%;"></a>`
										+ `<label for="">` + result[i]["eval_date"] + `</label></div><div class="checkbox" style="width: 6%; margin-right: 3%;">`
										+ `<a class="trash deleteForm" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["eval_date"] + `" data-pv="` + result[i]["pv"] + `"><span class="fa fa-trash"></span></a></div></li>`;
						$("#getList").append(new_div);
					}	
					//입력양식 삭제
				 	$('.deleteForm').click(function() {
						location.href = "/updateForm/deleteForm.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&openday=" + $(this).attr('data-openday')  + "&pv=" + $(this).attr('data-pv');
					}) 
					//수정하러 이동
				 	$('.updateDetail').click(function() {
						location.href = "/updateForm/updateDetail.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&openday=" + $(this).attr('data-openday')  + "&pv=" + $(this).attr('data-pv');
					}) 
				}
			},
			error:function(e) {
				console.log(e);
			}
		});
	}
	
	function getUpdateList() {
		$("#getList").empty();
		let table_name = tb_name;
		let agency = document.getElementsByName('form-agency')[0].value;
		$.ajax({
			url: "/updateForm/getAgencyList.do",
			type: "POST",
			data: {'agency':agency, 'table_name':table_name},
			async: false,
			success:function(result) {
				if(table_name=='basic_info') { 
					for(let i=0; i<result.length; i++) {
						result[i]["agency"] = convertXSS(result[i]["agency"]);
						let new_div = `<li class="todo-list-item userDetail"><div class="checkbox" style="width: 10%;">`
										+ `<label for="">` + (i+1) + `</label></div><div class="checkbox" style="width: 40%;">`
										+ `<a class="trash updateDetail" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["openday"] + `"><label for="" >` + result[i]["agency"] + `</label></div><div class="checkbox" style="width: 10%; margin-right: 4%;"></a>`
										+ `<label for="">` + result[i]["openday"] + `</label></div><div class="checkbox" style="width: 6%; margin-right: 3%;">`
										+ `<a class="trash deleteForm" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["openday"] + `"><span class="fa fa-trash"></span></a></div></li>`;
						$("#getList").append(new_div);
					}
					//입력양식 삭제
				 	$('.deleteForm').click(function() {
						location.href = "/updateForm/deleteForm.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&openday=" + $(this).attr('data-openday');
					}) 
					//수정하러 이동
				 	$('.updateDetail').click(function() {
						location.href = "/updateForm/updateDetail.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&openday=" + $(this).attr('data-openday');
					}) 
				} else if(table_name=='service_env_satisfaction') { 
					for(let i=0; i<result.length; i++) {
						let new_div = `<li class="todo-list-item userDetail"><div class="checkbox" style="width: 10%;">`
										+ `<label for="">` + (i+1) + `</label></div><div class="checkbox" style="width: 40%;">`
										+ `<a class="trash updateDetail" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["eval_date"] + `"><label for="" >` + result[i]["agency"] + `</label></div><div class="checkbox" style="width: 10%; margin-right: 4%;"></a>`
										+ `<label for="">` + result[i]["eval_date"] + `</label></div><div class="checkbox" style="width: 6%; margin-right: 3%;">`
										+ `<a class="trash deleteForm" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["eval_date"] + `"><span class="fa fa-trash"></span></a></div></li>`;
						$("#getList").append(new_div);
					}
					//입력양식 삭제
				 	$('.deleteForm').click(function() {
						location.href = "/updateForm/deleteForm.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&openday=" + $(this).attr('data-openday');
					}) 
					//수정하러 이동
				 	$('.updateDetail').click(function() {
						location.href = "/updateForm/updateDetail.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&openday=" + $(this).attr('data-openday');
					}) 
				} else if(table_name=='program_satisfaction') { 
					for(let i=0; i<result.length; i++) {
						let new_div = `<li class="todo-list-item userDetail"><div class="checkbox" style="width: 10%;">`
										+ `<label for="">` + (i+1) + `</label></div><div class="checkbox" style="width: 40%;">`
										+ `<a class="trash updateDetail" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["eval_date"] + `" data-program_name="` + result[i]["program_name"] + `"><label for="" >` + result[i]["agency"]  + `(` +result[i]["program_name"] + `)</label></div><div class="checkbox" style="width: 10%; margin-right: 4%;"></a>`
										+ `<label for="">` + result[i]["eval_date"] + `</label></div><div class="checkbox" style="width: 6%; margin-right: 3%;">`
										+ `<a class="trash deleteForm" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["eval_date"] + `" data-program_name="` + result[i]["program_name"] + `"><span class="fa fa-trash"></span></a></div></li>`;
						$("#getList").append(new_div);
					}
					//입력양식 삭제
				 	$('.deleteForm').click(function() {
						location.href = "/updateForm/deleteForm.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&openday=" + $(this).attr('data-openday') + "&program_name=" + $(this).attr('data-program_name');
					}) 
					//수정하러 이동
				 	$('.updateDetail').click(function() {
						location.href = "/updateForm/updateDetail.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&openday=" + $(this).attr('data-openday') + "&program_name=" + $(this).attr('data-program_name');
					}) 
				} else if(table_name=='hrv_service' || table_name=='vibra_service') { 
					for(let i=0; i<result.length; i++) {
						let new_div = `<li class="todo-list-item userDetail"><div class="checkbox" style="width: 10%;">`
										+ `<label for="">` + (i+1) + `</label></div><div class="checkbox" style="width: 40%;">`
										+ `<a class="trash updateDetail" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["openday"] + `" data-pv="` + result[i]["pv"] + `"><label for="" >` + result[i]["agency"] + `(` +result[i]["pv"] + `)</label></div><div class="checkbox" style="width: 10%; margin-right: 4%;"></a>`
										+ `<label for="">해당없음</label></div><div class="checkbox" style="width: 6%; margin-right: 3%;">`
										+ `<a class="trash deleteForm" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["openday"] + `" data-pv="` + result[i]["pv"] + `"><span class="fa fa-trash"></span></a></div></li>`;
						$("#getList").append(new_div);
					}	
					//입력양식 삭제
				 	$('.deleteForm').click(function() {
						location.href = "/updateForm/deleteForm.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&pv=" + $(this).attr('data-pv');
					}) 
					//수정하러 이동
				 	$('.updateDetail').click(function() {
						location.href = "/updateForm/updateDetail.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&pv=" + $(this).attr('data-pv');
					})
				} else if(table_name=='counsel_service') {
					for(let i=0; i<result.length; i++) {
						let session = result[i]['session'].substring(0,2);
						console.log(session);
						let new_div = `<li class="todo-list-item userDetail"><div class="checkbox" style="width: 10%;">`
										+ `<label for="">` + (i+1) + `</label></div><div class="checkbox" style="width: 40%;">`
										+ `<a class="trash updateDetail" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["eval_date"] + `" data-pv="` + result[i]["pv"] + `"><label for="" >` + result[i]["agency"] + `(` + session + `)</label></div><div class="checkbox" style="width: 10%; margin-right: 4%;"></a>`
										+ `<label for="">` + result[i]["eval_date"] + `</label></div><div class="checkbox" style="width: 6%; margin-right: 3%;">`
										+ `<a class="trash deleteForm" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["eval_date"] + `" data-pv="` + result[i]["pv"]+ `"><span class="fa fa-trash"></span></a></div></li>`;
						$("#getList").append(new_div);
					}	
					//입력양식 삭제
				 	$('.deleteForm').click(function() {
						location.href = "/updateForm/deleteForm.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&openday=" + $(this).attr('data-openday')  + "&pv=" + $(this).attr('data-pv');
					}) 
					//수정하러 이동
				 	$('.updateDetail').click(function() {
						location.href = "/updateForm/updateDetail.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&openday=" + $(this).attr('data-openday')  + "&pv=" + $(this).attr('data-pv');
					}) 
				}else {
					for(let i=0; i<result.length; i++) {
						let new_div = `<li class="todo-list-item userDetail"><div class="checkbox" style="width: 10%;">`
										+ `<label for="">` + (i+1) + `</label></div><div class="checkbox" style="width: 40%;">`
										+ `<a class="trash updateDetail" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["eval_date"] + `" data-pv="` + result[i]["pv"] + `"><label for="" >` + result[i]["agency"] + `(` +result[i]["pv"] + `)</label></div><div class="checkbox" style="width: 10%; margin-right: 4%;"></a>`
										+ `<label for="">` + result[i]["eval_date"] + `</label></div><div class="checkbox" style="width: 6%; margin-right: 3%;">`
										+ `<a class="trash deleteForm" data-table="` + table_name + `" data-agency="` + result[i]["agency"] + `" data-openday="` + result[i]["eval_date"] + `" data-pv="` + result[i]["pv"] + `"><span class="fa fa-trash"></span></a></div></li>`;
						$("#getList").append(new_div);
					}	
					//입력양식 삭제
				 	$('.deleteForm').click(function() {
						location.href = "/updateForm/deleteForm.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&openday=" + $(this).attr('data-openday')  + "&pv=" + $(this).attr('data-pv');
					}) 
					//수정하러 이동
				 	$('.updateDetail').click(function() {
						location.href = "/updateForm/updateDetail.do?table_name=" + $(this).attr('data-table') + "&agency=" +  $(this).attr('data-agency') + "&openday=" + $(this).attr('data-openday')  + "&pv=" + $(this).attr('data-pv');
					}) 
				}
			},
			error:function(e) {
				console.log(e);
			}
		});
	}
	</script>	
</body>
</html>