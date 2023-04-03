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
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse"><span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span></button>
				<a class="navbar-brand" href="#" style="margin-left: 1%;"><span>하이</span>힐링원</a>
				<ul class="nav navbar-top-links navbar-right">
					<li class="dropdown"><a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
						<em class="fa fa-envelope"></em><span class="label label-danger">15</span>
					</a>
						<ul class="dropdown-menu dropdown-messages">
							<li>
								<div class="dropdown-messages-box"><a href="profile.html" class="pull-left">
									<img alt="image" class="img-circle" src="http://placehold.it/40/30a5ff/fff">
									</a>
									<div class="message-body"><small class="pull-right">3 mins ago</small>
										<a href="#"><strong>John Doe</strong> commented on <strong>your photo</strong>.</a>
									<br /><small class="text-muted">1:24 pm - 25/03/2015</small></div>
								</div>
							</li>
							<li class="divider"></li>
							<li>
								<div class="dropdown-messages-box"><a href="profile.html" class="pull-left">
									<img alt="image" class="img-circle" src="http://placehold.it/40/30a5ff/fff">
									</a>
									<div class="message-body"><small class="pull-right">1 hour ago</small>
										<a href="#">New message from <strong>Jane Doe</strong>.</a>
									<br /><small class="text-muted">12:27 pm - 25/03/2015</small></div>
								</div>
							</li>
							<li class="divider"></li>
							<li>
								<div class="all-button"><a href="#">
									<em class="fa fa-inbox"></em> <strong>All Messages</strong>
								</a></div>
							</li>
						</ul>
					</li>
					<li class="dropdown"><a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
						<em class="fa fa-bell"></em><span class="label label-info">5</span>
					</a>
						<ul class="dropdown-menu dropdown-alerts">
							<li><a href="#">
								<div><em class="fa fa-envelope"></em> 1 New Message
									<span class="pull-right text-muted small">3 mins ago</span></div>
							</a></li>
							<li class="divider"></li>
							<li><a href="#">
								<div><em class="fa fa-heart"></em> 12 New Likes
									<span class="pull-right text-muted small">4 mins ago</span></div>
							</a></li>
							<li class="divider"></li>
							<li><a href="#">
								<div><em class="fa fa-user"></em> 5 New Followers
									<span class="pull-right text-muted small">4 mins ago</span></div>
							</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div><!-- /.container-fluid -->
	</nav>
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<div class="profile-sidebar">
			<div class="profile-userpic">
				<img src="http://placehold.it/50/30a5ff/fff" class="img-responsive" alt="">
			</div>
			<div class="profile-usertitle">
				<div class="profile-usertitle-name">관리자</div>
				<div class="profile-usertitle-status"><span class="indicator label-success"></span>사용중</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</form>
		<ul class="nav menu">
			<li class="active"><a href="#"><em class="fa fa-dashboard">&nbsp;</em> 프로그램 결과 입력</a></li>
			<li><a href="#"><em class="fa fa-calendar">&nbsp;</em> Widgets</a></li>
			<li><a href="#"><em class="fa fa-bar-chart">&nbsp;</em> Charts</a></li>
			<li><a href="#"><em class="fa fa-toggle-off">&nbsp;</em> UI Elements</a></li>
			<li><a href="#"><em class="fa fa-clone">&nbsp;</em> Alerts &amp; Panels</a></li>
			<li class="parent "><a data-toggle="collapse" href="#sub-item-1">
				<em class="fa fa-navicon">&nbsp;</em> Multilevel <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
				</a>
				<ul class="children collapse" id="sub-item-1">
					<li><a class="" href="#">
						<span class="fa fa-arrow-right">&nbsp;</span> Sub Item 1
					</a></li>
					<li><a class="" href="#">
						<span class="fa fa-arrow-right">&nbsp;</span> Sub Item 2
					</a></li>
					<li><a class="" href="#">
						<span class="fa fa-arrow-right">&nbsp;</span> Sub Item 3
					</a></li>
				</ul>
			</li>
			<li><a href="login.html"><em class="fa fa-power-off">&nbsp;</em> 관리자 모드</a></li>
		</ul>
	</div><!--/.sidebar-->
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">프로그램 결과 입력</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">프로그램 결과 입력</h1>
			</div>
		</div><!--/.row-->
		
		
		<!--홍석민이 만들고 있음  -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default chat" style="word-break: break-all;">
					hellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohelloohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohello
					hellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohelloohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohello
					hellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohelloohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohello
					hellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohelloohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohello
					hellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohelloohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohello
					
				</div>
			</div>
		</div>
		
		<!--  -->
		<!-- <div style=" display:table inline-block; padding:10px; border-collapse: collapse; font-size: 10px;text-align: center; ">
        <div style="display: table-cell; border:1px solid black; width: 50px; height: auto; vertical-align: middle; background-color: #ccc;">지출<br>금액</div>
        <div style="display: table-cell; border:1px solid black; width:100px; height: 60px; text-align: center;">
            <div style="display: table-cell; ">   
                <div style="width: 100px; height: 20px; border-bottom: 1px solid black; text-align: center; background-color: #ccc;">지출항목</div>
                <div style="display: table-row; width :150px; height: auto;">
                    <div style="display: table-cell">   
                         <div style="display: table-cell;width: 50px; height: 359px; border-bottom: 1px solid black;  border-right: 1px solid black; text-align: center; vertical-align: middle;">강사</div>
                    </div> 
                    <div style="display: table-cell; vertical-align: middle;">   
                        <div style="width: 50px; height: 140px;line-height:140px; border-bottom: 1px solid black;  text-align: center; vertical-align: middle;">강사비</div>
                        <div style="width: 50px; height: 140px;line-height:140px; border-bottom: 1px solid black;  text-align: center; vertical-align: middle;">교통비</div>
                        <div style="width: 50px; height: 60px; line-height:60px;border-bottom: 1px solid black;  text-align: center; vertical-align: middle;">보조강사비</div>
                        <div style="border-bottom: 1px solid black;width: 50px; height: 20px; text-align: center; vertical-align: middle;">식비</div>
                    </div> 
                </div>
                <div style="display: table-row; width :150px; height: 60px;">
                    <div style="display: table-cell">   
                         <div style="display: table-cell;width: 50px; height: 119px; border-bottom: 1px solid black;  border-right: 1px solid black; text-align: center; vertical-align: middle;">참가자</div>
                    </div> 
                    <div style="display: table-cell; vertical-align: middle;">   
                        <div style="width: 50px; height: 40px; line-height:40px;border-bottom: 1px solid black;  text-align: center;">숙박</div>
                        <div style="width: 50px; height: 40px; line-height:40px;border-bottom: 1px solid black;  text-align: center;">식비</div>
                        <div style="border-bottom: 1px solid black;width: 50px; height: 40px;line-height:40px; text-align: center;">쟤료비</div>
                    </div> 
                </div>
                <div style="width: 100px; height: 20px; border-bottom: 1px solid black; text-align: center;">예비비</div>
                <div style="width: 100px; height: 20px; text-align: center;">합계</div>
            </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width:100px; height: auto; text-align: center;">
            <div style="display: table-cell; ">   
                <div style="width: 150px; height: 20px; border-bottom: 1px solid black; text-align: center; background-color: #ccc;">기존예산</div>
                <div style="width: 150px; height: 140px; line-height:140px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 140px; line-height:140px; border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 60px;  line-height:60px;border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 20px;  line-height:20px;border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 40px;  line-height:40px;border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 40px;  line-height:40px;border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 40px;  line-height:40px; border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 20px;  line-height:20px;border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 20px;  line-height:20px;text-align: center;"></div>
            </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width:100px; height: auto; text-align: center;">
            <div style="display: table-cell; ">   
                <div style="width: 160px; height: 20px; border-bottom: 1px solid black; text-align: center; background-color: #ccc;">집행금액</div>
                <div style="width: 160px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 160px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 160px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 160px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 160px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 160px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 160px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 160px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 160px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 160px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 160px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 160px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 160px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 160px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 160px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 160px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 160px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 160px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 160px; height: 40px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 160px; height: 40px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 160px; height: 40px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 160px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 160px; height: 20px;  text-align: center;">
                </div>
            </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width:100px; height: auto; text-align: center;">
            <div style="display: table-cell; ">   
                <div style="width: 350px; height: 20px; border-bottom: 1px solid black; text-align: center; background-color: #ccc;">세부내역</div>
                <div style="width: 350px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 350px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 350px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 350px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 350px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 350px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 350px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 350px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 350px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 350px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 350px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 350px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 350px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 350px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 350px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 350px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 350px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 350px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 350px; height: 40px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 350px; height: 40px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 350px; height: 40px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 350px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 350px; height: 20px;  text-align: center;"></div>
            </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width:150px; height: auto; text-align: center;">
            <div style="display: table-cell; ">   
                <div style="width: 150px; height: 20px; border-bottom: 1px solid black; text-align: center; background-color: #ccc;">비고</div>
                <div style="width: 150px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 40px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 40px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 40px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 20px;  border-bottom: 1px solid black; text-align: center;"></div>
                <div style="width: 150px; height: 20px;  text-align: center;"></div>
            </div>
        </div>
    </div> --> 
		
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
		window.onload = function () {
	var chart1 = document.getElementById("line-chart").getContext("2d");
	window.myLine = new Chart(chart1).Line(lineChartData, {
	responsive: true,
	scaleLineColor: "rgba(0,0,0,.2)",
	scaleGridLineColor: "rgba(0,0,0,.05)",
	scaleFontColor: "#c5c7cc"
	});
};
	</script>
		
</body>
</html>