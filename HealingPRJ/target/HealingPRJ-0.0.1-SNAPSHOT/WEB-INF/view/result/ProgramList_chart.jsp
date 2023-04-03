<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="poly.dto.BasicInfoDTO" %>
<%@ page import ="java.util.List" %>
<%@ page import ="static poly.util.CmmUtil.nvl" %>
<%@ page import ="static poly.util.CmmUtil.convertXSS" %>
<%
	List<BasicInfoDTO> rList = (List<BasicInfoDTO>)request.getAttribute("rList");
%>
<!DOCTYPE html>
<html>
<head>
 </head>
<body>

		<%
			for (int i = 0; i < rList.size(); i++) {
		%>
			<tr>
				<td><%= i+1 %></td>
				<td id="AGENCY<%=i%>"><%= convertXSS(rList.get(i).getAgency())%></td>
				<td id="OPENDAY<%=i%>"><%= convertXSS(rList.get(i).getOpenday())%></td>
				<td><%= convertXSS(rList.get(i).getEndday())%></td>
				<td><%= Integer.parseInt(rList.get(i).getLead_man_cnt()) + Integer.parseInt(rList.get(i).getLead_woman_cnt())+ Integer.parseInt(rList.get(i).getPart_man_cnt()) + Integer.parseInt(rList.get(i).getPart_woman_cnt()) %></td>
				<td><%= convertXSS(rList.get(i).getOm()) %></td>
				<td><button type="button" onClick="search_1('<%=i%>');"class="btn-success" tabindex="-1" value="검색"> <i class="fa fa-search"></i></button></td>
			</tr>
		<%}%>
		
	
</body>
</html>