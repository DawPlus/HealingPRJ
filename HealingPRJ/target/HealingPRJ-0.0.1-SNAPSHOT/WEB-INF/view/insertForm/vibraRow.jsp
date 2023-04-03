<%@page import="poly.dto.VibraInsertDTO"%>
<%@page import="static poly.util.CmmUtil.nvl"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<VibraInsertDTO> vList = (List<VibraInsertDTO>)request.getAttribute("vList");
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
	
	<%for(int i = 0; i < vList.size(); i++)  { %>
	<div class="insertForm rowdata" style="width:2400px; height: 45px;" name="form-main" id="child<%=i%>">
		<button onclick="delete_info(<%=i%>)" style="font-size:70%; display:block; margin-top:7px; margin-right:5px; float: left;">X</button>
		<div style="width: 120px; float: left; margin-right: 10px;">
			<input class="form-control" name="form-id" placeholder="ID" value="<%=nvl(vList.get(i).getId()) %>">
		</div>
		<div style="width: 120px; float: left; margin-right: 10px;">
			<input class="form-control" name="form-name" placeholder="이름" value="<%=nvl(vList.get(i).getName()) %>">
		</div>
		<div style="width: 190px; float: left; margin-right: 10px;">
			<input class="form-control" name="form-jumin1" placeholder="앞자리" style="width: 90px; float: left;" maxlength="6" value="<%=nvl(vList.get(i).getJumin()).substring(0, 6) %>">
			<p style="display: inline-flex; vertical-align: sub;">-</p>
			<input class="form-control" name="form-jumin2" placeholder="뒷자리" style="width: 90px; float: right;" maxlength="1" value="<%=nvl(vList.get(i).getJumin()).substring(6) %>">
		</div>
		<div style="width: 85px; float: left; margin-right: 10px;">
			<select class="form-control" name="form-sex" style="height: 35px;">
				<option><%=nvl(vList.get(i).getSex()) %></option>
				<%@ include file="/WEB-INF/view/insertForm/sex.jsp"%>
			</select>
		</div>
		<div style="width: 65px; float: left; margin-right: 10px;">
			<input class="form-control" type="number" name="form-age" placeholder="연령" value="<%=nvl(vList.get(i).getAge()) %>">
		</div>
		<div style="width: 160px; float: left; margin-right: 10px;">
			<input class="form-control" type="date" name="form-date" value="<%=nvl(vList.get(i).getDate()) %>">
		</div>
		
		<div style="width: 95px; float: left; margin-right: 5px;">
			<input class="form-control form-num1 num" data-id="<%=i%>" data-type="listA" name="form-num1" placeholder="수치">
		</div>
		<div class="listA state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>
		
		<div style="width: 95px; float: left; margin-right: 5px;">
			<input class="form-control form-num2 num" data-id="<%=i%>" data-type="listB" name="form-num2" placeholder="수치">
		</div>
		<div class="listB state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>
		
		<div style="width: 95px; float: left; margin-right: 5px;">
			<input class="form-control form-num3 num" data-id="<%=i%>" data-type="listC" name="form-num3" placeholder="수치">
		</div>
		<div class="listC state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>
		
		<div style="width: 95px; float: left; margin-right: 5px;">
			<input class="form-control form-num4 num" data-id="<%=i%>" data-type="listD" name="form-num4" placeholder="수치">
		</div>
		<div class="listD state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>
		
		<div style="width: 95px; float: left; margin-right: 5px;">
			<input class="form-control form-num5 num" data-id="<%=i%>" data-type="listE" name="form-num5" placeholder="수치">
		</div>
		<div class="listE state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>
		
		<div style="width: 95px; float: left; margin-right: 5px;">
			<input class="form-control form-num6 num" data-id="<%=i%>" data-type="listF" name="form-num6" placeholder="수치">
		</div>
		<div class="listF state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>
		
		<div style="width: 95px; float: left; margin-right: 5px;">
			<input class="form-control form-num7 num" data-id="<%=i%>" data-type="listG" name="form-num7" placeholder="수치">
		</div>
		<div class="listG state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>
		
		<div style="width: 95px; float: left; margin-right: 5px;">
			<input class="form-control form-num8 num" data-id="<%=i%>" data-type="listH" name="form-num8" placeholder="수치">
		</div>
		<div class="listH state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>
								
		<div style="width: 95px; float: left; margin-right: 5px;">
			<input class="form-control form-num9 num" data-id="<%=i%>" data-type="listI" name="form-num9" placeholder="수치">
		</div>
		<div class="listI state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>
		
		<div style="width: 95px; float: left; margin-right: 5px;">
			<input class="form-control form-num10 num" data-id="<%=i%>" data-type="listJ" name="form-num10" placeholder="수치">
		</div>
		<div class="listJ state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>
		
		<%
		// 반복문을 돌려서 문항 개수만큼 문항 만들기
		List<String> scoreList = vList.get(i).getScoreString2List();
		for(int j = 0; j < scoreList.size(); j++) { %>
			<input type="hidden" class="" name="compare<%=j+1 %>" value="<%=scoreList.get(j)%>">
		<% } %>
		
	</div>
	<%} %>
	<div class="new-field"></div>
	
	
	
</body>
</html>