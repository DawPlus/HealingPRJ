<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

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
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
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
<script>
	 function search(){
		 var effect = $("#effect").val();
		 console.log(effect);
		 var agency = $("#agency").val();
		 console.log(agency);
		 var openday = $("#openday").val();
		 console.log(openday);
		 var url = "Healing.do";
		  if(effect=="program"){
			 url="Program.do"
		 }else if(effect=="facility"){
			 url="Facility.do"
		 }else if(effect=="counseling"){
			 url="Counseling.do"
		 }else if(effect=="prevent"){
			 url="Prevent.do"
		 }else if(effect=="healing"){
			 url="Healing.do"
		 }
		  console.log(url);
		  var search = {"agency":agency, "openday":openday};
		  $.ajax({
			url : url,
			type : 'post',
			data : search,
			success : function(data) {
				console.log("성공");
				$("#ProgramResult_chart").html(data);
			},
			error:function (e){
				alert("단체명을 입력해주세요.");
			}
		})
	} 
</script>
<!-- 홍두표 - 나눔스퀘어 폰트 불러오기 -->


</head>
<body>
	<%@ include file="/WEB-INF/view/top.jsp" %>
	<%@ include file="/WEB-INF/view/sidebar.jsp" %>

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"> <em class="fa fa-home"></em>
				</a></li>
				<li class="active">만족도 및 효과평가 결과검색</li>
				<li class="active">단체별 만족도 및 효과평가</li>
			</ol>
		</div>
		<!--/.row-->
		<br>
		<div class="row">
				<div class="col-md-9">
					<label class="col-md-10 control-label">입력양식</label>
				</div>
				<div class="col-md-9" style="display:inline-flex">
				<select id="effect"name="effect"class="form-control" style="border-radius: 5px; width: 30%;">
						<option value="program">프로그램 만족도</option>
						<option value="facility">시설서비스 환경 만족도</option>
						<option value="counseling">상담&치유 서비스 효과평가</option>
						<option value="prevent">예방 서비스 효과평가</option>
						<option value="healing">힐링 서비스 효과평가</option>
				</select>
				</div>
				<div class="col-md-9">
					<label class="col-md-10 control-label">참여단체</label>
				</div>
				<div class="col-md-9" style="display:inline-flex">
					<input type="text" id="agency" name="agency" placeholder="기관명" class="form-control" style="width: 30%;">
					<button type="button" onClick="JavaScript:search();"class="btn-success" tabindex="-1" value="검색"> <i class="fa fa-search"></i>
					</button>
				</div>
		</div>
		<div id="ProgramResult_chart"></div>
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
		
</body>
</html>