<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="static poly.util.CmmUtil.nvl" %>
<%
	String user_name = nvl((String) session.getAttribute("user_name"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	if ("<%=user_name%>") {
		console.log("<%=user_name%>");
	} else {
		alert("세션이 만료되었습니다.");
		location.href = "/login.do";
	}
</script>
</head>
<body>
	<!-- .sidebar start -->
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<div class="profile-sidebar">
			<div class="profile-userpic" style="display: inline-block;float: left; text-align: center; -webkit-writing-mode: vertical-rl;">
				<div class="fa fa-user-circle fa-2x" style="display: block; width: 50px; height:50px; margin: 10px 0px 0px 10px"></div>
			</div>
			<div class="profile-usertitle">
				<div class="profile-usertitle-name"><%=user_name %></div>
				<div class="profile-usertitle-status">
					<span class="indicator label-success"></span>사용중
				</div>
			</div>
			<div style="text-align: center;margin: 1.6em 1em; display: inline-flex;">
				<a type="button" class="btn btn-md btn-warning"
					style="height: 22px; padding: 1px;" href="/user/logout.do">로그아웃</a>
			</div>
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		<ul class="nav menu">
			<li class=""><a href="/insertOperateResult.do"><em
					class="fa fa-list-ul">&nbsp;</em> 프로그램 결과 입력</a></li>
					
			<li class="parent"><a href="/result/ProgramList.do"><em
					class="fa fa-file-text-o">&nbsp;</em> 운영 결과 보고 검색</a></li>

			<li class="parent"><a data-toggle="collapse" href="#sub-item-1">
					<em class="fa fa-bar-chart">&nbsp;</em> 운영 통계 검색<span
					data-toggle="collapse" href="#sub-item-1" class="icon pull-right">
						<em class="fa fa-plus"></em>
				</span>
			</a>
				<ul class="children collapse" id="sub-item-1">
					<li><a class="" href="/result/YearMonthResult.do"> <span
							class="fa fa-arrow-right">&nbsp;</span> 연·월 통계
					</a></li>
					<li><a class="" href="/searchResult/search.do"> <span
							class="fa fa-arrow-right">&nbsp;</span> 주제어별 프로그램 통계 검색
					</a></li>
				</ul></li>
			
			<li class="parent"><a href="/insertForm/serviceInsertForm.do"><em class="fa fa-clone">&nbsp;</em> 만족도 및 효과평가 입력</a></li>
			
			<li class="parent"><a data-toggle="collapse" href="#sub-item-2">
					<em class="fa fa-search">&nbsp;</em> 만족도 및 효과평가 결과검색 <span
					data-toggle="collapse" href="#sub-item-2" class="icon pull-right">
						<em class="fa fa-plus"></em>
				</span>
			</a>
				<ul class="children collapse" id="sub-item-2">
					<li><a class="" href="/SaE/ProgramResult.do"> <span
							class="fa fa-arrow-right">&nbsp;</span> 단체별 만족도 및 효과평가
					</a></li>
					<li><a class="" href="/SaE/SearchResult.do"> <span
							class="fa fa-arrow-right">&nbsp;</span> 주제어별 만족도 및 효과평가
					</a></li>
				</ul></li>
			
			<li class="parent"><a data-toggle="collapse" href="#sub-item-3">
					<em class="fa fa-power-off">&nbsp;</em> 관리자모드 <span
					data-toggle="collapse" href="#sub-item-4" class="icon pull-right">
						<em class="fa fa-plus"></em>
				</span>
			</a>
				<ul class="children collapse" id="sub-item-3">
					<li><a class="" href="/mng/mngGetUserList.do"> <span
							class="fa fa-arrow-right">&nbsp;</span> 직원 계정 관리
					</a></li>
					<li><a class="" href="/mng/mngGetUserHist.do"> <span
							class="fa fa-arrow-right">&nbsp;</span> 사용자 이용 기록 조회
					</a></li>
					<li><a class="" href="/mng/mngUpdatePage.do"> <span
							class="fa fa-arrow-right">&nbsp;</span> 운영 결과 항목 수정
					</a></li>
				</ul></li>
			<li class="parent"><a href="/updateForm/updateList.do"><em class="fa fa-clone">&nbsp;</em> 수정 및 삭제</a></li>
		</ul>
	</div>
	<!--/.sidebar end-->

</body>
<script src="/lumino/js/jquery-1.11.1.min.js"></script>
<script src="/lumino/js/bootstrap.min.js"></script>
<script src="/lumino/js/chart.min.js"></script>
<script src="/lumino/js/chart-data.js"></script>
<script src="/lumino/js/easypiechart.js"></script>
<script src="/lumino/js/easypiechart-data.js"></script>
<script src="/lumino/js/bootstrap-datepicker.js"></script>
<script src="/lumino/js/custom.js"></script>



<script>
	/*menu handler*/
	$(function() {
		var url = window.location.pathname;
		var activePage = url.substring(url.lastIndexOf('/') + 1);
		$('.nav li a').each(
				function() {
					var currentPage = this.href.substring(this.href
							.lastIndexOf('/') + 1);

					if (activePage == currentPage) {
						$(".nav").find(".active").removeClass("active");
						$(this).parent().addClass('active');
						$(this).addClass('active');
					}
				});
	})
</script>

</html>