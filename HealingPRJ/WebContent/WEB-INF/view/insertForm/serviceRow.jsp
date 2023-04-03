<%@page import="poly.dto.ServiceInsertDTO"%>
<%@page import="static poly.util.CmmUtil.nvl"%>
<%@page import="static poly.util.CmmUtil.convertXSS"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<ServiceInsertDTO> sList = (List<ServiceInsertDTO>)request.getAttribute("sList");
	int[] groupWidth = { 60, 60, 60, 60, 110, 110, 110, 60, 60, 65, 140, 60, 60, 60, 60, 60, 60, 140, 115, 115 };
	int[] groupMargin = { 10, 10, 10, 10, 5, 5, 5, 10, 10, 10, 5, 10, 10, 10, 10, 10, 10, 5, 10, 10 };
	String[] form_name = { "score1", "score2", "score3", "score4", "score5", "score6", "score7", "score8", "score9", "score10", 
			"opinion1", "score11", "score12", "score13", "score14", "score15", "score16","opinion2", "score17", "score18" };
	String[] form_placeholder = { "점수", "점수", "점수", "점수", "점수", "점수", "점수", "점수", "점수", "점수", 
			"기타의견", "점수", "점수", "점수", "점수", "점수", "점수","기타의견", "점수", "점수" };
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- start---/. 페이지 로딩 후 바로 자바스크립트 함수를 실행하는 부분 -->
	<script>
// 	1. 사전인지 중간인지 값 변경해주어야 함
// 	2. 공통 데이터 값 변경해주어야 함
		
	</script>
	<!-- 페이지 로딩 후 바로 자바스크립트 함수를 실행하는 부분 ./---end -->
</head>
<body>
	
	
	
	<%for (int i = 0; i < sList.size(); i++) { %>
	<div class="insertForm" style="width: 2400px; height: 40px" name="form-main" id="child<%=i%>">
		<button onclick="delete_info(<%=i%>)" style="font-size:70%; display:block; margin: 5px 5px 0px 0px; float: left;" class="delButton<%=i%>">X</button>
		<div style="width: 85px; float: left; margin-right: 10px;">
			<select class="form-control" name="form-sex" style="height: 35px;">
				<option><%=nvl(sList.get(i).getSex()) %></option>
				<%@ include file="/WEB-INF/view/insertForm/sex.jsp"%>
			</select>
		</div>
		<div style="width: 60px; float: left; margin-right: 10px;">
			<input class="form-control" type="number" name="form-age" placeholder="연령" value="<%=nvl(sList.get(i).getAge()) %>">
		</div>
		<div style="width: 90px; float: left; margin-right: 10px;">
			<select class="form-control" name="form-residence" style="height: 35px;">
				<option><%=nvl(sList.get(i).getResidence()) %></option>
				<%@ include file="/WEB-INF/view/insertForm/residences.jsp"%>
			</select>
		</div>
		<div style="width: 140px; float: left; margin-right: 10px;">
			<select class="form-control" name="form-job" style="height: 35px;">
				<option><%=nvl(sList.get(i).getJob()) %></option>
				<%@ include file="/WEB-INF/view/insertForm/jobs.jsp"%>
			</select>
		</div>
		<%
		// 반복문을 돌려서 문항 개수만큼 문항 만들기
		List<String> scoreList = sList.get(i).getScoreString2List();
		for(int j = 0; j < groupMargin.length; j++) { %>
		<div style="width: <%=groupWidth[j] %>px; float: left; margin-right: <%=groupMargin[j] %>px;">
			<input class="form-control" type="number" name="form-<%=form_name[j] %>" placeholder="<%=form_placeholder[j] %>">
		</div>
		<%} %>
	</div>
	<%} %>
	<div class="new-field"></div>
	
	<script type="text/javascript">
		document.getElementsByName('form-ptcProgram')[0].value = "<%=convertXSS(sList.get(0).getPtcProgram())%>";
		document.getElementsByName('form-eval_date')[0].value = "<%=convertXSS(sList.get(0).getEval_date())%>";
	</script>
</body>
</html>