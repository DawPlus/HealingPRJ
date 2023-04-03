<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.SearchDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="java.util.List" %>
<%

	List<SearchDTO> rList = (List<SearchDTO>)request.getAttribute("rList");
	List<SearchDTO> AvgList = (List<SearchDTO>)request.getAttribute("AvgList");
String c_1 = (String)request.getAttribute("c_1");
String c_2 = (String)request.getAttribute("c_2");
String c_3 = (String)request.getAttribute("c_3");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>주제어별 통계</title>
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
<style>
.cell_30_bot_right {
	width: 50px;
	height: 30px;
	line-height: 30px;
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	text-align: center;
}

.cell_30_no_right {
	width: 50px;
	height: 30px;
	line-height: 30px;
	border-right: 1px solid black;
	text-align: center;
}

.cell_30_bot_no {
	width: 50px;
	height: 30px;
	line-height: 30px;
	border-bottom: 1px solid black;
	text-align: center;
}

.cell_30 {
	width: 50px;
	height: 30px;
	line-height: 30px;
	text-align: center;
}

.cell_60_bot_right {
	width: 50px;
	height: 60px;
	line-height: 60px;
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	text-align: center;
}

.cell_60_no_right {
	width: 50px;
	height: 60px;
	line-height: 60px;
	border-right: 1px solid black;
	text-align: center;
}

.cell_60_bot_no {
	width: 50px;
	height: 60px;
	line-height: 60px;
	border-bottom: 1px solid black;
	text-align: center;
}

.cell_60 {
	width: 50px;
	height: 60px;
	line-height: 60px;
	text-align: center;
}
</style>


</head>
<body>
	<!-- 상단 제목 -->
	<div style="width: 1000px; height: 40px; text-align: center;">
		<h3>상담&치유 서비스 만족도</h3>
	</div>
	<div class="col-md-12">
		<div class="panel panel-default chat">
		<div style="display: table inline-block; padding: 10px; border-collapse: collapse; font-size: 10px; text-align: center;">
		<div style=" display: table-row;  border: 1px solid black;">
			<div style="display: table-cell; width: 50px; height:60px; border-right: 1px solid black; background-color: #ccc;"><br><br>주제어 1</div>
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><br><br>주제어 2</div>
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><br><br>주제어 3</div>
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><br><br>내담자 <br>보고</div> 
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><br><br>시작 회기</div> 
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><br><br>중간 회기</div> 
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><br><br>종결 회기</div> 
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><br><br>상담자<br>기록</div> 
			<div style="display: table-cell;">
				<div style="width:auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">1.협력수준</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 50px; height: 30px; border-right: 1px solid black;background-color: #ccc;">변화<br> 동기</div>
					<div style="display: table-cell; width: 50px; height: 30px; border-right: 1px solid black;background-color: #ccc;">신뢰<br>(라포)</div>
					<div style="display: table-cell; width: 50px; height: 30px; border-right: 1px solid black;background-color: #ccc;">서비스<br>이해</div>
				</div>
			</div>
			<div style="display: table-cell;">
				<div style="width:auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">2.문제증상</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 50px;height: 30px; border-right: 1px solid black;background-color: #ccc;">조절<br>실패</div>
					<div style="display: table-cell; width: 50px;height: 30px; border-right: 1px solid black;background-color: #ccc;">현저성</div>
					<div style="display: table-cell; width: 50px;height: 30px; border-right: 1px solid black;background-color: #ccc;">문제적<br>결과</div>
				</div>
			</div>
			<div style="display: table-cell;">
				<div style="width:auto;height: 30px; border-bottom: 1px solid black; background-color: #ccc;">3.표적영역</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 50px;height: 30px; border-right: 1px solid black;background-color: #ccc;">자기<br>조절력</div>
					<div style="display: table-cell; width: 50px; height: 30px; border-right: 1px solid black;background-color: #ccc;">부정<br>정서</div>
					<div style="display: table-cell; width: 50px; height: 30px; border-right: 1px solid black;background-color: #ccc;">편향된<br>신념</div>
					<div style="display: table-cell; width: 50px; height: 30px; border-right: 1px solid black;background-color: #ccc;">역기능적 &nbsp;자기도식</div>
					<div style="display: table-cell; width: 50px; height: 30px; border-right: 1px solid black;background-color: #ccc;">대인관계 &nbsp;기술부족</div>
					<div style="display: table-cell; width: 50px; height: 30px; border-right: 1px solid black;background-color: #ccc;">대인<br>민감성</div>
					<div style="display: table-cell; width: 50px; height: 30px; border-right: 1px solid black;background-color: #ccc;">관계/유능 &nbsp;욕구부족</div>
					<div style="display: table-cell; width: 50px; height: 30px; background-color: #ccc;">긍정<br>정서</div>
					<div style="display: table-cell; width: 50px; height: 30px; border-right: 1px solid black;background-color: #ccc;">삶의<br>만족</div>
					<div style="display: table-cell; width: 50px; height: 30px; border-right: 1px solid black;background-color: #ccc;">자기<br>이해</div>
					<div style="display: table-cell; width: 50px; height: 30px; border-right: 1px solid black;background-color: #ccc;">자기<br>수용</div>
					<div style="display: table-cell; width: 50px; height: 30px; border-right: 1px solid black;background-color: #ccc;">마음관리 &nbsp;기술/기회</div>
					<div style="display: table-cell; width: 50px; height: 30px; background-color: #ccc;">스마트폰 &nbsp;활용역량</div>
				</div>
			</div>
		</div>
		<%for(int i=0; i<rList.size(); i++){%>
		<div style="display: table-row;  border: 1px solid black;">
		  	<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;"><br><%=c_1 %></div>
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;"><br><%=c_2 %></div>
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;"><br><%=c_3 %></div>
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
				<div style="line-height:20px; height:20px;   border-bottom: 1px solid black">회당시간</div>
				<div style="line-height:40px;height: 40px">월 사용료</div>
			</div>
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
				<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getTime_1()) %></div>
				<div style="line-height:40px;height: 40px"><%=CmmUtil.nvl(rList.get(i).getCost_1()) %></div>
			</div>
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
				<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getTime_2()) %></div>
				<div style="line-height:40px;height: 40px"><%=CmmUtil.nvl(rList.get(i).getCost_2()) %></div>
			</div>
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
				<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getTime_3()) %></div>
				<div style="line-height:40px;height: 40px"><%=CmmUtil.nvl(rList.get(i).getCost_3()) %></div>
			</div>
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
				<div style="line-height:20px; height:20px;   border-bottom: 1px solid black">사전</div>
				<div style="line-height:20px; height:20px;   border-bottom: 1px solid black">중간</div>
				<div style="line-height:20px; height: 20px">사후</div>
			</div>
			<!-- 협력수준  -->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore1()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore20()) %></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore39()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore2()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore21()) %></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore40()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore3()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore22()) %></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore41()) %></div>
				</div>
			</div>
			<!--문제증상  -->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore4()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore23()) %></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore42()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore5()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore24()) %></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore43()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore6()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore25()) %></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore44()) %></div>
				</div>
			</div>
			<!-- 표적영역  -->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore7()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore26()) %></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore45()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore8()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore27()) %></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore46()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore9()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore28()) %></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore47()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore10()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore29()) %></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore48()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore11()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore30()) %></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore49()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore12()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore31()) %></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore50()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore13()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore32()) %></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore51()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore14()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore33()) %></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore52()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore15()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore34()) %></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore53()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore16()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore35()) %></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore54()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore17()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore36()) %></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore55()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore18()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore37()) %></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore56()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore19()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore38()) %></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore57()) %></div>
				</div>
			</div>
		</div> 
	<%} %>
		<div style="display: table-row;  border: 1px solid black;">
		  	<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;"></div>
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;"></div>
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;"></div>
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;"></div>
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;"></div>
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;"></div>
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;"></div>
			
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
				<div style="line-height:20px; height:20px;   border-bottom: 1px solid black">사전</div>
				<div style="line-height:20px; height:20px;   border-bottom: 1px solid black">사후</div>
				<div style="line-height:20px; height: 20px">차이값</div>
			</div>
			<!-- 협력수준  -->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore1() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore20() %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore20()) -Double.parseDouble(AvgList.get(0).getScore1()))*100)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore2() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore21() %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore21()) -Double.parseDouble(AvgList.get(0).getScore2()))*100)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;  border-bottom: 1px solid black"><%=AvgList.get(0).getScore3() %></div>
					<div style="line-height:20px; height:20px;  border-bottom: 1px solid black"><%=AvgList.get(0).getScore22() %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore22()) -Double.parseDouble(AvgList.get(0).getScore3()))*100)/100.0%></div>
				</div>
			</div>
			<!--문제증상  -->
			 <div style="display: table-cell;">
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore4() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore23() %></div>
					<div style="line-height:20px; height: 20px"><%= Math.round((Double.parseDouble(AvgList.get(0).getScore23()) -Double.parseDouble(AvgList.get(0).getScore4()))*100)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore5() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore24() %></div>
					<div style="line-height:20px; height: 20px"><%= Math.round((Double.parseDouble(AvgList.get(0).getScore24()) -Double.parseDouble(AvgList.get(0).getScore5()))*100)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore6() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore25() %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore25()) -Double.parseDouble(AvgList.get(0).getScore6()))*100)/100.0%></div>
				</div>
			</div>
		<!-- 	표적영역  -->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore7() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore26() %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore26()) -Double.parseDouble(AvgList.get(0).getScore7()))*100)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore8() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore27() %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore27()) -Double.parseDouble(AvgList.get(0).getScore8()))*100)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore9() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore28() %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore28()) -Double.parseDouble(AvgList.get(0).getScore9()))*100)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore10() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore29() %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore29()) -Double.parseDouble(AvgList.get(0).getScore10()))*100)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore11() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore30() %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore30()) -Double.parseDouble(AvgList.get(0).getScore11()))*100)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore12() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore31() %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore31()) -Double.parseDouble(AvgList.get(0).getScore12()))*100)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore13() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore32() %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore32()) -Double.parseDouble(AvgList.get(0).getScore13()))*100)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore14() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore33() %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore33()) -Double.parseDouble(AvgList.get(0).getScore14()))*100)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore15() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore34() %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore34()) -Double.parseDouble(AvgList.get(0).getScore15()))*100)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore16() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore35() %></div>
					<div style="line-height:20px; height: 20px"><%= Math.round((Double.parseDouble(AvgList.get(0).getScore35()) -Double.parseDouble(AvgList.get(0).getScore16()))*100)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore17() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore36() %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore36()) -Double.parseDouble(AvgList.get(0).getScore17()))*100)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore18() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore37() %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore37()) -Double.parseDouble(AvgList.get(0).getScore18()))*100)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 60px;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore19() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getScore38() %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore38()) -Double.parseDouble(AvgList.get(0).getScore19()))*100)/100.0%></div>
				</div>
			</div> 
		</div> 
		</div>
	   </div>
     </div>
</body>
</html>