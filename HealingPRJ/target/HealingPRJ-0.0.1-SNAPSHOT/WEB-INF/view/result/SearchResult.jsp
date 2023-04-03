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
	<script src"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


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
		
		if(content1 == ""){
			content1 ="%%"
		}
		if(content2 == ""){
			content2 ="%%"
		}
		if(content3 == ""){
			content3 ="%%"
		}
		console.log(content1);
		
		  $.ajax({
			url : 'SearchResult_chart.do',
			type : 'post',
			 data :  {content1 : content1,content2 : content2,content3 : content3,
				 	  sub1 : sub1,sub2 : sub2,sub3 : sub3	} , 
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
				<li class="active">운영 통계 검색</li>
				<li class="active">주제어별 프로그램 통계 검색</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">주제어별 프로그램 통계 검색 </h1>
			</div>
		</div><!--/.row-->
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body" style="padding-bottom:0px;">
						<label for="" style="margin: 0px 90px 0px 80px;">주제어1</label>
						<label for="" style="margin: 0px 73px 0px 95px;">주제어2</label>
						<label for="" style="margin: 0px 73px 0px 86px;">주제어3</label>
					</div>
					<div class="panel-body" style="padding-top:7px;">
						<div style="display:inline-flex">
							<% for(int i =1; i<= 3; i++) { %>
							&nbsp;&nbsp;
								<select id="sub<%=i%>" name="sub<%=i%>" class="form-control" style="border-radius: 5px; width: 99px; height: 50px; margin-right:7px;">
									<option value="X">해당없음</option>
									<option value="AGENCY">단체명</option>
									<option value="OM">OM</option>
									<option value="DAYS_TO_STAY">체류기간</option>
									<option value="REGIDENCE">거주지역</option>
									<option value="SUPPORT">지원사항</option>
									<option value="BIZ_PURPOSE">사업목적</option>
									<option value="PART_TYPE">참가자유형</option>
									<option value="AGE_TYPE">연령대</option>
									<option value="INCOME_TYPE">수입구분</option>
									<option value="SERVICE_TYPE">서비스유형</option>
								</select> 
								<input type="text" id="content<%=i%>"name="content<%=i%>" placeholder="Search" class="form-control" style="border-radius: 5px;width: 100px; height: 50px; margin: 0px 15px 0px 0px;">
							&nbsp;&nbsp;
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