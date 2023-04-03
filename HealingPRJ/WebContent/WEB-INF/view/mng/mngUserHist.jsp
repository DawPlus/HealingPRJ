<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="java.util.List" %>
<%@ page import ="poly.dto.HistoryDTO" %>
<%@ page import ="poly.dto.UserDTO" %>
<%@ page import ="static poly.util.CmmUtil.nvl" %>
<%@ page import ="static poly.util.CmmUtil.convertXSS" %>


<%
	List<HistoryDTO> hList = (List<HistoryDTO>)request.getAttribute("hList");
	List<UserDTO> rList = (List<UserDTO>)request.getAttribute("rList");
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


</head>
<body>
	<!--/.sidebar Sart-->
	<%@ include file="/WEB-INF/view/top.jsp"%>
	<%@ include file="/WEB-INF/view/sidebar.jsp"%>
	<!--/.sidebar End-->

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"> <em class="fa fa-home"></em>
				</a></li>
				<li class="active">관리자 모드</li>
				<li class="active">사용자 이용 기록 조회</li>
			</ol>
		</div>
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">사용자 이용 기록 조회</h1>
			</div>
		</div>
		<!--/.row-->

		<!-- 홍두표 - 사용자 이용 기록 조회 -->
		<div class="panel panel-default ">
			<div class="panel-heading">
				<h4 style="float : left; margin: 13px 10px 13px 0px;">사용자 이용 기록 | </h4>
				<h4 style="float : left; margin: 13px 10px 13px 0px;">작성자</h4> 
				<div style="width: 120px;float: left;margin-right: 10px;flex: auto;flex-basis: auto;white-space: nowrap;max-width: 300px;">
					<select class="form-control form-reg_id" id="form-reg_id" style="width: 200px; border-radius: 5px; margin: 4px 0px 0px 0px;">
						<option value="작성자">작성자</option>
						<%for(int i=0; i<rList.size(); i++)  {%>
						<option value="<%=convertXSS(rList.get(i).getUser_name())%>"><%=convertXSS(rList.get(i).getUser_name())%></option>
						<%} %>
					</select>
				</div>
				<div style="float: left; margin: 2px 10px 2px 77px;">
					<input type="button" class="btn btn-default btn-sm" value="조회" onclick="search()">
				</div>
			</div>

			<div class="panel-body timeline-container" id="main-div">
				<ul class="timeline" id="timeline">
					<%for(int i=0; i<hList.size(); i++) { 
						if(i==19) { 
							break;
						}
						if(hList.get(i).getReg_id().equals("관리자")) {
					%>
							<li>
								<div class="timeline-badge primary">
									<i class="glyphicon glyphicon-user"></i>
								</div>
								<div class="timeline-panel">
									<div class="timeline-heading">
										<span class="timeline-title" style="display: inline-block; margin-bottom: 3px; font-size: smaller;"><%=convertXSS(hList.get(i).getReg_id())%> | </span> 
										<span style="display: inline-block; font-size: small"><%=convertXSS(hList.get(i).getDate())%></span>
									</div>
									<div class="timeline-body">
										<span><%=convertXSS(hList.get(i).getDescription())%></span>
									</div>
								</div>
							</li>
						<%							
						} else {
						%>
						<li>
							<div class="timeline-badge">
								<i class="glyphicon glyphicon-user"></i>
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<span class="timeline-title"
										style="display: inline-block; margin-bottom: 3px; font-size: smaller;"><%=convertXSS(hList.get(i).getReg_id())%>
										- 직원 | </span> <span style="display: inline-block; font-size: small"><%=convertXSS(hList.get(i).getDate())%></span>
								</div>
								<div class="timeline-body">
									<span><%=convertXSS(hList.get(i).getDescription())%></span>
								</div>
							</div>
						</li>
					<%
						}
					} 
					%>
				</ul>
			</div>
		</div>

		<!--관리자 복사용 -->
		<li style="display: none;">
			<div class="timeline-badge primary">
				<i class="glyphicon glyphicon-user"></i>
			</div>
			<div class="timeline-panel">
				<div class="timeline-heading">
					<span class="timeline-title"
						style="display: inline-block; margin-bottom: 3px; font-size: smaller;">홍두표
						- 관리자 | </span> <span style="display: inline-block; font-size: small">2021-03-24
						15:36</span>
				</div>
				<div class="timeline-body">
					<span>이재훈(님) 권한 변경</span>
				</div>
			</div>
		</li>

		<!--직원 복사용 -->
		<li style="display:none;">
			<div class="timeline-badge">
				<i class="glyphicon glyphicon-user"></i>
			</div>
			<div class="timeline-panel">
				<div class="timeline-heading">
					<span class="timeline-title"
						style="display: inline-block; margin-bottom: 3px; font-size: smaller;">홍석민
						- 직원 | </span> <span style="display: inline-block; font-size: small">2021-03-24
						14:00</span>
				</div>
				<div class="timeline-body">
					<span>해당 일자에 홈페이지 접속</span>
				</div>
			</div>
		</li>

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
		function search() {
			let reg_id = document.getElementById('form-reg_id').value;
			
			$.ajax({
				url: "/mng/mngGetUserHist/searchList.do",
				type: "POST",
				data: {"reg_id" : reg_id}, 
				success:function(result) {
					if(result.length==0) { 
						alert('조회 결과가 없습니다.');
						return false;
					} 
					console.log(result[0].reg_id);
					$('#timeline').css("display","none");
					let a = document.getElementById('main-div');
					let text = "<ul class='timeline'>";
					for(var i=0; i<result.length; i++) { 
						text += "<li>";
						text += "<div class='timeline-badge'><i class='glyphicon glyphicon-user'></i>";
						text += "</div><div class='timeline-panel'>";
						text += "<div class='timeline-heading'><span class='timeline-title' style='display: inline-block; margin-bottom: 3px; font-size: smaller;'>";
						text +=  result[i].reg_id + " - 직원 | </span> ";
						text += "<span style='display: inline-block; font-size: small'>"+result[i].date + "</span></div>";
						text += "<div class='timeline-body'><span>"+result[i].description+"</span>";
						text += "</div></div></li>";
					}
					text += "</ul>";
					a.innerHTML = text;
				},
				error:function(e) {
					console.log(e);
				}
			});
		}
	</script>

</body>
</html>