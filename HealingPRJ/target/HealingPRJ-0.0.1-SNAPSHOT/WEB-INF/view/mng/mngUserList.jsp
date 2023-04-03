<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="java.util.List" %>
<%@ page import ="poly.dto.UserDTO" %>
<%@ page import ="static poly.util.CmmUtil.nvl" %>
<%@ page import ="static poly.util.CmmUtil.convertXSS" %>
<%

	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd  HH:mm");
	String datestr = sdf.format(cal.getTime());
	System.out.println(datestr);
%>
<%
	List<UserDTO> uList = (List<UserDTO>)request.getAttribute("uList");
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

<script>
	
</script>

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
				<li class="active">직원 계정 관리</li>
			</ol>
		</div>
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">직원 계정 관리</h1>
			</div>
		</div>
		<!--/.row-->

		<!-- 홍두표 - 직원 계정 관리 -->
		<div class="panel panel-default" style="min-height: 700px;">
			<div class="panel-heading"
				style="height: auto; border-bottom: none; margin-bottom: 3%;">
				<div>직원 계정 목록</div>

			</div>

			<div class="panel-body">
				<ul class="todo-list">
					<!-- 홍두표 - 직원 계정 목록 -->
					<li class="todo-list-item">
						<div class="checkbox" style="width: 10%;">
							<!-- 번호 -->
							<label for="">번호</label>
						</div>
						<div class="checkbox" style="width: 20%; margin-right: 20%;">
							<!-- 직원명 -->
							<label for="">직원명</label>
						</div>
						<div class="checkbox" style="width: 10%; margin-right: 3%;">
							<!-- 권한 -->
							<label for="">권한</label>
						</div>
						<div class="checkbox" style="width: 6%; margin-right: 2%;">
							<label style="padding-left: 0px">삭제</label>
						</div> <!-- 삭제 -->
					</li>
					<li class="todo-list-item"
						style="padding: 1px 0px 1px 0px; border-top: 1px solid #dddddd; margin: 0px 20px 0px 25px;">
					</li>
					
					<%
						for(int i=0; i<uList.size(); i++) {
					%>
							<li class="todo-list-item userDetail" data-userNo="<%=i+1%>">
							<div class="checkbox" style="width: 10%;">
								<!-- 번호 -->
								<label for=""><%=i+1%></label>
							</div>
							<div class="checkbox" style="width: 20%; margin-right: 20%;">
								<!-- 직원명 -->
								<label for="" ><%=convertXSS(uList.get(i).getUser_name())%></label>
								<%
									if(uList.get(i).getValue().equals("1")) {
								%>
									<a type="button" class="btn btn-md btn-success agreeWait"
									data-name="<%=convertXSS(uList.get(i).getUser_name())%>" data-id="<%=convertXSS(uList.get(i).getUser_id()) %>"
									style="height: 22px; padding: 1px;">승인대기중</a>
								<%
									}
								%>
								<!-- 홍두표 - 승인 여부 컬럼값으로 조건문 처리 -->
							</div>
							
							<%
								if(uList.get(i).getValue().equals("3")) {
							%>		
								<div class="checkbox" style="width: 10%; margin-right: 3%;">
									<!-- 권한 -->
									<label for="">관리자</label>
								</div>
							<%
								} else {
							%>
								<div class="checkbox" style="width: 10%; margin-right: 3%;">
									<!-- 권한 -->
									<label for="">직원</label>
								</div>
							<%	
								}
							%>
							<div class="checkbox" style="width: 6%; margin-right: 2%;">
								<a class="trash deleteUser" data-deleteId="<%=convertXSS(uList.get(i).getUser_id())%>"><span class="fa fa-trash"></span></a>
							</div> <!-- 삭제 -->
						</li>
						
							
					<%
						}
					%>
					

				</ul>

			</div>
		</div>


		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default chat" style="word-break: break-all;">

				</div>
			</div>
		</div>

		<!--  -->


	</div>

	<script src="/lumino/js/jquery-1.11.1.min.js"></script>
	<script src="/lumino/js/bootstrap.min.js"></script>
	<script src="/lumino/js/chart.min.js"></script>
	<script src="/lumino/js/chart-data.js"></script>
	<script src="/lumino/js/easypiechart.js"></script>
	<script src="/lumino/js/easypiechart-data.js"></script>
	<script src="/lumino/js/bootstrap-datepicker.js"></script>
	<script src="/lumino/js/custom.js"></script>
	<script>
		$('.deleteUser').click(function() {
					location.href = "/user/deleteUser.do?user_id="
							+ $(this).attr('data-deleteId');
		})
		$('.agreeWait').click(
				function() {
					$('.userDetail').unbind();
					isAllow = confirm($(this).attr('data-name')
							+ "님의 가입 신청을 승인하시겠습니까?");
					if (isAllow) {
						/*ajax 위치 */
						let user_id = $(this).attr('data-id');
						$.ajax({
							url : "/user/approveUser.do",
							type : "POST",
							data : {
								"user_id" : user_id
							},
							success : function(result) {
								alert("승인되었습니다.");
								window.location.reload();
							},
							error : function(e) {
								console.log(e);
							}
						});
						/*ajax 위치 */
					} else {
						return false;
					}
				})
	</script>

</body>
</html>