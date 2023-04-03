<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    
    String msg = CmmUtil.nvl((String)request.getAttribute("msg"));
	String url = CmmUtil.nvl((String)request.getAttribute("url"));
    
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/lumino/js/jquery-1.11.1.min.js"></script>
<script src="/lumino/js/bootstrap.min.js"></script>
<script src="/lumino/js/chart.min.js"></script>
<script src="/lumino/js/chart-data.js"></script>
<script src="/lumino/js/easypiechart.js"></script>
<script src="/lumino/js/easypiechart-data.js"></script>
<script src="/lumino/js/bootstrap-datepicker.js"></script>
<script src="/lumino/js/custom.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript">

	doSwal("<%=msg%>","","warning");

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>redirect</title>
</head>
<body>
</body>
</html>