<%@page import="poly.dto.HrvInsertDTO"%>
<%@page import="static poly.util.CmmUtil.nvl"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<HrvInsertDTO> hrvList = (List<HrvInsertDTO>)request.getAttribute("hrvList");
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
<body onload="addE()">
	
	
	
	<%for(int i = 0; i < hrvList.size(); i++) { %>
	
	<div class="insertForm rowdata" style="width:2200px; height: 45px;" name="form-main" id="child<%=i%>">
		<button onclick="delete_info(<%=i%>)" style="font-size:70%; display:block; margin: 5px 5px 0px 0px; float: left;">X</button>
		<div style="width: 120px; float: left; margin-right: 10px;">
			<input class="form-control" name="form-id" placeholder="ID" value="<%=nvl(hrvList.get(i).getId()) %>">
		</div>
		<div style="width: 120px; float: left; margin-right: 10px;">
			<input class="form-control" name="form-name" placeholder="이름" value="<%=nvl(hrvList.get(i).getName()) %>">
		</div>
		<div style="width: 190px; float: left; margin-right: 10px;">
			<input class="form-control" name="form-jumin1" placeholder="앞자리" style="width: 90px; float: left;" maxlength="6" value="<%=nvl(hrvList.get(i).getJumin()).substring(0, 6) %>">-
			<input class="form-control" name="form-jumin2" placeholder="뒷자리" style="width: 90px; float: right;" maxlength="1" value="<%=nvl(hrvList.get(i).getJumin()).substring(6) %>">
		</div>
		<div style="width: 85px; float: left; margin-right: 10px;">
			<select class="form-control" name="form-sex" style="height: 35px;">
				<option><%=nvl(hrvList.get(i).getSex()) %></option>
				<%@ include file="/WEB-INF/view/insertForm/sex.jsp"%>
			</select>
		</div>
		<div style="width: 65px; float: left; margin-right: 10px;">
			<input class="form-control" type="number" name="form-age" placeholder="연령" value="<%=nvl(hrvList.get(i).getAge()) %>">
		</div>
		<div style="width: 160px; float: left; margin-right: 10px;">
			<input class="form-control" type="date" name="form-date" value="<%=nvl(hrvList.get(i).getDate()) %>">
		</div>
		
		<div style="width: 95px; float: left; margin-right: 5px;">
			<input class="form-control form-num1 num" type="text" data-id="<%=i%>" data-type="listA" name="form-num1" placeholder="수치">
		</div>
		<div class="listA state" style="width: 80px; float: left; margin-right: 5px; font-size: small;">&nbsp;</div>
		
		<div style="width: 95px; float: left; margin-right: 5px;">
			<input class="form-control form-num2 num" type="text" data-id="<%=i%>" data-type="listB" name="form-num2" placeholder="수치">
		</div>
		<div class="listB state" style="width: 80px; float: left; margin-right: 5px; font-size: small;">&nbsp;</div>
		
		<div style="width: 95px; float: left; margin-right: 5px;">
			<input class="form-control form-num3 num" type="text" data-id="<%=i%>" data-type="listC" name="form-num3" placeholder="수치">
		</div>
		<div class="listC state" style="width: 80px; float: left; margin-right: 5px; font-size: small;">&nbsp;</div>
		
		<div style="width: 95px; float: left; margin-right: 5px;">
			<input class="form-control form-num4 num" type="text" data-id="<%=i%>" data-type="listD" name="form-num4" placeholder="수치">
		</div>
		<div class="listD state" style="width: 55px; float: left; margin-right: 5px; font-size: small;">&nbsp;</div>
		
		<div style="width: 95px; float: left; margin-right: 5px;">
			<input class="form-control form-num5 num" type="text" data-id="<%=i%>" data-type="listE" name="form-num5" placeholder="수치">
		</div>
		<div class="listE state" style="width: 55px; float: left; margin-right: 5px; font-size: small;">&nbsp;</div>
		
		<div style="width: 95px; float: left; margin-right: 5px;">
			<input class="form-control form-num6 num" type="text" data-id="<%=i%>" data-type="listF" name="form-num6" placeholder="수치">
		</div>
		<div class="listF state" style="width: 55px; float: left; margin-right: 5px; font-size: small;">&nbsp;</div>
		
		<div style="width: 95px; float: left; margin-right: 5px;">
			<input class="form-control form-num7 num" type="text" data-id="<%=i%>" data-type="listG" name="form-num7" placeholder="수치">
		</div>
		<div class="listG state" style="width: 50px; float: left; margin-right: 5px; font-size: small;">&nbsp;</div>
		
		<div style="width: 90px; float: left; margin: 0px 15px;">
			<input class="form-control num" type="text" name="form-num8" placeholder="수치">
		</div>
		<%
		// 반복문을 돌려서 문항 개수만큼 문항 만들기
		List<String> scoreList = hrvList.get(i).getScoreString2List();
		for(int j = 0; j < scoreList.size(); j++) { %>
			<input type="hidden" class="" name="compare<%=j+1 %>" value="<%=scoreList.get(j)%>">
		<% } %>
	</div>
	
	<%} %>
	<div class="new-field"></div>
	
	<script type="text/javascript">
		let state = [];
		function addEvent() {
			document.querySelectorAll(".insertForm .form-num1").forEach(item => item.addEventListener("keyup",(e) => testA(e.target.dataset.type,e.target.value, e.target.dataset.id) ));
			document.querySelectorAll(".insertForm .form-num2").forEach(item => item.addEventListener("keyup",(e) => testB(e.target.dataset.type, e.target.value, e.target.dataset.id) ));
			document.querySelectorAll(".insertForm .form-num3").forEach(item => item.addEventListener("keyup",(e) => testC(e.target.dataset.type, e.target.value, e.target.dataset.id) ));
			document.querySelectorAll(".insertForm .form-num4").forEach(item => item.addEventListener("keyup",(e) => testD(e.target.dataset.type, e.target.value, e.target.dataset.id) ));
			document.querySelectorAll(".insertForm .form-num5").forEach(item => item.addEventListener("keyup",(e) => testE(e.target.dataset.type, e.target.value, e.target.dataset.id) ));
			document.querySelectorAll(".insertForm .form-num6").forEach(item => item.addEventListener("keyup",(e) => testF(e.target.dataset.type, e.target.value, e.target.dataset.id) ));
			document.querySelectorAll(".insertForm .form-num7").forEach(item => item.addEventListener("keyup",(e) => testG(e.target.dataset.type, e.target.value, e.target.dataset.id) ));
		}
		addEvent();
	</script>	
	
	
</body>
</html>