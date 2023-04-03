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
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="/resources/js/common.js"></script>


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
	<!-- 차트 ajax -->
<script>
	function search(){
		var content1 = $("#content1").val();
		var sub1 = $("#sub1").val();
		var content2 = $("#content2").val();
		var sub2 = $("#sub2").val();
		var content3 = $("#content3").val();
		var sub3 = $("#sub3").val();
		var effect = $("#effect").val();
		var url="";
		if(content1.trim() == "" && content2.trim() == "" && content3.trim() == ""){
			doSwal("주제어를 입력하세요.", "");
			console.log(1);
			return false;
		}
		
		if(content1 == null){
			content_1 = "%%";
		}
		if(content2 == null){
			content_2 = "%%";
		}
		if(content3 == null){
			content_3 = "%%";
		}
		
		if(effect=="program"){
			url = "Program_chart.do";
		}else if(effect == "facility"){
			url="Facility_chart.do";
		}else if(effect == "counseling"){
			url="Counseling_chart.do";
		}else if(effect == "prevent"){
			url="Prevent_chart.do";
		}else if(effect == "healing"){
			url="Healing_chart.do";
		}
		
		console.log(effect);
		console.log(sub1); 
		console.log(content1); 
		console.log(sub2); 
		console.log(content2); 
		console.log(sub3); 
		console.log(content3); 
		  $.ajax({
			url : url,
			type : 'post',
			 data :  {content1 : content1,content2 : content2,content3 : content3,
				 	  sub1 : sub1,sub2 : sub2,sub3 : sub3,url: url	} , 
			success : function(data) {
				console.log("성공");
				/* console.log(data); */
				$("#resProgram_chart").html(data);
			},
			error:function (e){
				alert("error");
			}
		}) 
	}
</script>
<script src="/lumino/js/jquery-1.11.1.min.js"></script>
	<script src="/lumino/js/bootstrap.min.js"></script>
	<script src="/lumino/js/chart.min.js"></script>
	<script src="/lumino/js/chart-data.js"></script>
	<script src="/lumino/js/easypiechart.js"></script>
	<script src="/lumino/js/easypiechart-data.js"></script>
	<script src="/lumino/js/bootstrap-datepicker.js"></script>
	<script src="/lumino/js/custom.js"></script>
</head>
<body>
 <!--top jsp  -->
	<div>
	  <%@ include file="/WEB-INF/view/top.jsp" %>
	 <%@ include file="/WEB-INF/view/sidebar.jsp" %>
	</div>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">만족도 및 효과평가 결과검색</li>
				<li class="active">주제어별 만족도 및 효과평가 </li>
			</ol>
		</div>
		<!--/.row-->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">주제어별 만족도 및 효과평가 </h1>
			</div>
		</div><!--/.row-->
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body" style="padding-bottom:0px;">
						<label for="" style="margin: 0px 65px 0px 65px;">입력 양식</label>
						<label for="" style="margin: 0px 79px 0px 113px;">주제어1</label>
						<label for="" style="margin: 0px 73px 0px 73px;">주제어2</label>
						<label for="" style="margin: 0px 73px 0px 86px;">주제어3</label>
					</div>
					<div class="panel-body" style="padding-top:7px;">
					<div style="display: inline-flex;">
							&nbsp;&nbsp; <span class="input-group input-group-lg"style="width: 225px;"> 
							<select id="effect"name="effect"class="form-control" style="border-radius: 5px; width:195px;">
									<option value="program">프로그램 만족도</option>
									<option value="facility">시설서비스 환경 만족도</option>
									<option value="counseling">상담&치유 서비스</option>
									<option value="prevent">예방 서비스</option>
									<option value="healing">힐링 서비스</option>
							</select>
							</span>
					</div>
					<div style="display:inline-flex">
						<% for(int i =1; i<= 3; i++) { %>
						&nbsp;&nbsp;
							<select id="sub<%=i%>" name="sub<%=i%>" class="form-control" style="border-radius: 5px; width: 99px; height: 50px; margin-right:7px;">
								<option value="X">해당없음</option>
								<option value="AGENCY">기관명</option>
								<option value="SEX">성별</option>
								<option value="AGE">연령(만)</option>
								<option value="REGIDENCE">거주지</option>
								<option value="JOB">직업</option>
								<option value="OPENDAY">시작일자</option>
								<option value="PLACE">장소</option>
								<option value="TEACHER">강사</option>
								<option value="PROGRAM_NAME">프로그램이름</option>
								<option value="BUNYA">분야</option>
							</select> 
							<input type="text" id="content<%=i%>"name="content<%=i%>" placeholder="주제어<%=i%> 입력" class="form-control" style="border-radius: 5px;width: 100px; height: 50px; margin: 0px 15px 0px 0px;">
						<% } %>
						<button type="button" onClick="JavaScript:search();"class="btn-success" tabindex="-1" value="검색" style="margin: 7px 0px 0px 0px; height:35px"><i class="fa fa-search"></i></button> 
					</div>
					</div>
				</div>
			</div>
			<div id="resProgram_chart"></div>
		</div>
	</div>

</body>
</html>