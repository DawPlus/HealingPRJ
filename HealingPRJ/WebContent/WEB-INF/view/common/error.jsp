<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>하이힐링원 - 에러 페이지</title>
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
	
	<style>
		@import url(https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css);
		
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
	<!-- 홍두표 - 나눔스퀘어 폰트 불러오기 및 css 클래스 분리 -->
	
	<!-- start---/. 페이지 로딩 후 바로 자바스크립트 함수를 실행하는 부분 -->
	<script>
	
	
	</script>
	<!-- 페이지 로딩 후 바로 자바스크립트 함수를 실행하는 부분 ./---end -->
	
</head>
<body>
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse"><span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span></button>
				<a class="navbar-brand" href="#"><span>하이</span>힐링원</a>
			</div>
		</div><!-- /.container-fluid -->
	</nav>
	<!--/.sidebar-->
		
	<div class="col-xs-12" style="">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">페이지 오류 안내</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
			</div>
		</div><!--/.row-->
		
		<div class="panel panel-container">
			
			<div class="panel" style="text-align: center; height: 150px;">
				<h1>죄송합니다</h1>
				<h2>요청하신 페이지를 찾을 수 없습니다.</h2>
			</div>
			<div class="panel" style="height: 100%; padding-bottom:3%; margin: 30px 300px;">
				<p>요청하신 페이지는 찾을수 없는 페이지 입니다.</p>
				<p>방문하시려는 페이지의 주소가 잘못 입력되었거나, 페이지의 주소가 변경 혹은 <br>삭제되어 요청하신 페이지를 찾을 수 없습니다.</p>
				<button class="btn btn-primary back-page">이전화면 보기</button>
			</div>
		</div>
		
		<div class="row">
			
			<div class="col-sm-12">
				<p class="back-link"><!-- Lumino Theme by  --><a href="#">하이힐링원 통계프로그램</a></p>
			</div>
		</div><!--/.row-->
	</div>	<!--/.main-->
	
	<script src="/lumino/js/jquery-1.11.1.min.js"></script>
	<script src="/lumino/js/bootstrap.min.js"></script>
	<script src="/lumino/js/chart.min.js"></script>
	<script src="/lumino/js/chart-data.js"></script>
	<script src="/lumino/js/easypiechart.js"></script>
	<script src="/lumino/js/easypiechart-data.js"></script>
	<script src="/lumino/js/bootstrap-datepicker.js"></script>
	<script src="/lumino/js/custom.js"></script>
	<script>
		let backPage = document.getElementsByClassName("back-page")[0];
		backPage.addEventListener('click', function() {
			history.back();
		});
	</script>
		
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	

</body>
</html>