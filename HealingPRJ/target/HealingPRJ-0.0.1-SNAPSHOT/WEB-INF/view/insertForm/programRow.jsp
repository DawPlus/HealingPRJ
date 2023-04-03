<%@page import="poly.dto.ProgramInsertDTO"%>
<%@page import="poly.dto.PreventInsertDTO"%>
<%@page import="poly.dto.HealingInsertDTO"%>
<%@page import="static poly.util.CmmUtil.nvl"%>
<%@page import="static poly.util.CmmUtil.convertXSS"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<ProgramInsertDTO> prList = (List<ProgramInsertDTO>)request.getAttribute("prList");
	int[] groupMargin = { 5, 5, 10, 5, 5, 10, 5, 5, 10 };
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
	
	
	<%for(int i = 0; i < prList.size(); i++)  { %>
	<div class="insertForm" style="width: 1550px; height: 40px;" name="form-main" id="child<%=i%>">
		<button onclick="delete_info(<%=i%>)" name="form-delete" style="font-size:70%; display:block; margin: 5px 5px 0px 0px; float: left;">X</button>
		<div style="width: 85px; float: left; margin-right: 5px;">
			<select class="form-control" name="form-sex" style="height: 35px;">
				<option><%=nvl(prList.get(i).getSex()) %></option>
				<%@ include file="/WEB-INF/view/insertForm/sex.jsp"%>
			</select>
		</div>
		<div style="width: 65px; float: left; margin-right: 5px;">
			<input class="form-control" type="number" name="form-age" placeholder="연령" value="<%=nvl(prList.get(i).getAge()) %>">
		</div>
		<div style="width: 90px; float: left; margin-right: 5px;">
			<select class="form-control" name="form-residence" style="height: 35px;">
				<option><%=nvl(prList.get(i).getResidence()) %></option>
				<%@ include file="/WEB-INF/view/insertForm/residences.jsp"%>
			</select>
		</div>
		<div style="width: 140px; float: left; margin-right: 5px;">
			<select class="form-control" name="form-job" style="height: 35px;">
				<option><%=nvl(prList.get(i).getJob()) %></option>
				<%@ include file="/WEB-INF/view/insertForm/jobs.jsp"%>
			</select>
		</div>
		<div style="width: 90px; float: left; margin-right: 5px;">
			<select class="form-control" name="form-type" style="height: 35px;">
				<%if(convertXSS(prList.get(i).getType()).equals("참여자")) { %>
					<option><%=convertXSS(prList.get(i).getType())%></option>
					<option>인솔자</option>
				<%} else {%>
					<option><%=convertXSS(prList.get(i).getType())%></option>
					<option>참여자</option>
				<%} %>
			</select>
		</div>
		<%
		// 반복문을 돌려서 문항 개수만큼 문항 만들기
		List<String> scoreList = prList.get(i).getScoreString2List();
		for(int j = 0; j < scoreList.size(); j++) { 
			if(j==scoreList.size()-1 && convertXSS(prList.get(i).getType()).equals("참여자")) { %>
				<div style="width: 65px; float: left; margin-right:10px;">
					<input style="display:none;" class="form-control" name="form-score<%=j+1 %>" placeholder="점수" value='0'>
				</div>
			<%} else {%>
				<div style="width: 65px; float: left; margin-right:<%=groupMargin[j]%>px;">
					<input class="form-control" style="" name="form-score<%=j+1 %>" placeholder="점수">
				</div>
			<%} 
		  } 
		  
		if(convertXSS(prList.get(i).getType()).equals("참여자")) { %>
			<div style="width: 140px; float: left; margin-right: 5px; text-algin: center;">
				<input style="margin-left:75px" class="form-control" name="form-opinion1" placeholder="기타의견">
			</div>
		<%} else {%>
			<div style="width: 140px; float: left; margin-right: 5px; text-algin: center;">
				<input class="form-control" name="form-opinion1" placeholder="기타의견">
			</div>
		<%}%>
	</div>
	<% }  %>
	<div class="new-field"></div>
	
</body>
</html>