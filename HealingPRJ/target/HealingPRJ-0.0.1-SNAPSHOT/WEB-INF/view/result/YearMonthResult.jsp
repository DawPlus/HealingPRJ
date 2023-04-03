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
	
<script src="/lumino/js/jquery-1.11.1.min.js"></script>
	<script src="/lumino/js/bootstrap.min.js"></script>
	<script src="/lumino/js/chart.min.js"></script>
	<script src="/lumino/js/chart-data.js"></script>
	<script src="/lumino/js/easypiechart.js"></script>
	<script src="/lumino/js/easypiechart-data.js"></script>
	<script src="/lumino/js/bootstrap-datepicker.js"></script>
	<script src="/lumino/js/custom.js"></script>
	<!-- 홍두표 - 나눔스퀘어 폰트 불러오기 -->
	<!-- 차트 ajax -->
	<script>
	function search(){
		var openday = $("#openday").val();
		var endday = $("#endday").val();
		console.log(openday);
		console.log(endday);
		var day = {"openday":openday,"endday":endday};
		  $.ajax({
			url : 'YearMonthResult_chart.do',
			type : 'post',
			data :  day,
			success : function(data) {
				console.log("성공");
				console.log(data);
				$("#YearMonthResult_chart").html(data);
			},
			error:function (e){
				alert("error");
			}
		}) 
	}
	function info_print() {
		var initBody = document.body.innerHTML;
		window.onbeforeprint = function () {
			document.body.innerHTML = document.getElementById("YearMonthResult_chart").innerHTML;
		}
		window.onafterprint = function () {
			document.body.innerHTML = initBody;
		}

		window.print();

	}

</script>
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
				<li class="active">연·월 통계</li>
			</ol>
		</div><!--/.row-->
			<!--단체별 운영결과 검색창   -->
		<!-- <div class="row">
			<div class="col-lg-3">
					   <div style="display: inline-flex;">
						  <div class="input-group input-group-lg" style="width: 30%;">
							 <div class="form-group justify-content-center">
								<label class="col-md-2 control-label">참여일자</label>
								<div class="col-md-10">
									<input type='date' name="openday" id="openday"
										style="font-size: 16pt" ;/> <input type='date' name="endday"
										id="endday" style="font-size: 16pt" ;/>

								</div>
							</div>
							 <button type="button" onClick="search()" class="btn btn-default" tabindex="-1" value="검색"><i class="fa fa-search"></i></button>
					      </div>
					   </div>
			</div>
		</div>	/.main -->
		<div class="row">
				<div class="col-md-9">
					<label class="col-md-10 control-label">참여일자</label>
				</div>
				<div class="col-md-9">
					<input type='date' name="openday" id="openday"style="font-size: 16pt" /> ~ <input type='date' name="endday" id="endday"style="font-size: 16pt" />  
					<button type="button" onClick="JavaScript:search();"class="btn-success" tabindex="-1" value="검색"> <i class="fa fa-search"></i>
					</button>
					<input type="button" value="인쇄" onClick="info_print()" />
				</div>
		</div>
		<div id="YearMonthResult_chart"></div>
	</div>

</body>
</html>