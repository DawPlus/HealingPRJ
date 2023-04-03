<%@page import="static poly.util.CmmUtil.nvl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Boolean basic_end = nvl((Boolean)session.getAttribute("basic_end"));
	String agency = (basic_end) ? (String)session.getAttribute("agency") : "";
	String openday = (basic_end) ? (String)session.getAttribute("openday") : "";
	// 1. 프로그램 결과 입력에서 저장 -> 기관명 및 시작일자를 세션에 올리고 '만족도 및 효과평가' 입력 화면으로 이동하여 세션 정보를 받는다.
	// 2. DB에서 '만족도 및 효과평가' 입력이 모두 끝나면 proc에서 세션에 있는 basic_end의 값을 false로 초기화 시킨다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> 
				</button>
				<a class="navbar-brand" href="/insertForm/serviceInsertForm.do" style="margin-left: 1%;"><span>하이</span>힐링원</a>
			</div>
		</div>
		<!-- /.container-fluid -->
	</nav>

</body>
</html>