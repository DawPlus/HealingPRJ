<%@page import="static poly.util.CmmUtil.convertXSS"%>
<%@page import="poly.dto.SearchDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="java.util.List" %>
	
<%

	List<SearchDTO> rList = (List<SearchDTO>)request.getAttribute("PreventList");
	List<SearchDTO> AvgList = (List<SearchDTO>)request.getAttribute("AvgList");

	
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

</head>
<body>
	<!-- 상단 제목 -->
	<div style="width: 1000px; height: 40px; text-align: center;">
		<h3>예방 서비스 효과평가</h3>
	</div>
	<div class="col-md-12">
		<div class="panel panel-default chat">
		<div style="display: table inline-block; padding: 10px; border-collapse: collapse; font-size: 10px; text-align: center;">
		<div style=" display: table-row;  border: 1px solid black;">
			<div style="display: table-cell; width: 50px; height:60px; border-right: 1px solid black; background-color: #ccc;"><br><br>ID</div>
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><br><br>성명</div>
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><br><br>성별</div>
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><br><br>거주지</div>
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><br><br>직업</div>
			<div style="display: table-cell; width: 50px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><br>참여<br>프로그램</div>
			<div style="display: table-cell; width: 70px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><br>과거 스트레스<br>해소 및 힐링 <br>서비스경험</div> 
			<div style="display: table-cell;">
				<div style="width:auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">영역</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 50px; height: 45px; border-right: 1px solid black;background-color: #ccc;">평가<br>시점</div>
				</div>
			</div>
			<div style="display: table-cell;">
				<div style="width:auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">1.중독특징이해</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 50px; height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 1</div>
					<div style="display: table-cell; width: 50px; height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 2</div>
					<div style="display: table-cell; width: 50px; height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 3</div>
				</div>
			</div>
			<div style="display: table-cell;">
				<div style="width:auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">2.핵심증상이해</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 50px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 4</div>
					<div style="display: table-cell; width: 50px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 5</div>
					<div style="display: table-cell; width: 50px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 6</div>
				</div>
			</div>
			<div style="display: table-cell;">
				<div style="width:auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">3.문제대응방법이해</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 50px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 7</div>
					<div style="display: table-cell; width: 50px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 8</div>
					<div style="display: table-cell; width: 50px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 9</div>
					<div style="display: table-cell; width: 50px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 10</div>
				</div>
			</div>
			<div style="display: table-cell;">
				<div style="width:auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">4.활동역량</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 50px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 11</div>
					<div style="display: table-cell; width: 50px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 12</div>
				</div>
			</div>
			<div style="display: table-cell;">
				<div style="width:auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">5.심리적면역력강화법</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 50px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 13</div>
					<div style="display: table-cell; width: 50px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 14</div>
					<div style="display: table-cell; width: 50px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 15</div>
					<div style="display: table-cell; width: 50px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 16</div>
					<div style="display: table-cell; width: 50px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 17</div>
				</div>
			</div>
			<div style="display: table-cell;">
				<div style="width:auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">6.삶의 질</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 50px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 18</div>
					<div style="display: table-cell; width: 50px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 19</div>
					<div style="display: table-cell; width: 50px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 20</div>
				</div>
			</div>
			<div style="display: table-cell;">
				<div style="width:auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">영역</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 50px; height: 45px; border-right: 1px solid black;background-color: #ccc;">평가<br>시점</div>
				</div>
			</div>
			<div style="display: table-cell;">
				<div style="width:auto; height: 30px; border-bottom: 1px solid black;background-color: #ccc;">평균(0~6점)</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 50px;height: 45px; border-right: 1px solid black;background-color: #ccc;">중독특징이해</div>
					<div style="display: table-cell; width: 50px;height: 45px; border-right: 1px solid black;background-color: #ccc;">핵짐증상이해</div>
					<div style="display: table-cell; width: 50px;height: 45px; border-right: 1px solid black;background-color: #ccc;">문제대응방법</div>
					<div style="display: table-cell; width: 50px;height: 45px; border-right: 1px solid black;background-color: #ccc;">활동역량</div>
					<div style="display: table-cell; width: 50px;height: 45px; border-right: 1px solid black;background-color: #ccc;">심리적<br>면역력<br>강화법</div>
					<div style="display: table-cell; width: 50px;height: 45px; background-color: #ccc;"><br>삶의질</div>
				</div>
			</div>
		</div>
		<% for(int i=0; i<rList.size(); i++){ %>
		<div style="display: table-row;  border: 1px solid black;">
		  	<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;"><br><%=i+1 %></div>
			<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;"><br><%=rList.get(i).getName() %></div>
			<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;"><br><%=rList.get(i).getSex() %></div>
			<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;"><br><%=rList.get(i).getResidence() %></div>
			<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;"><br><%=rList.get(i).getJob() %></div>
			<div style="display: table-cell; width: 70px; height: 40px; border-right: 1px solid black;"><br><%=rList.get(i).getPtcprogram() %></div>
			<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;"><br><%=rList.get(i).getPast_stress_experience() %></div>
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black">사전</div>
					<div style="line-height:20px; height: 20px">사후</div>
				</div>
			</div>
			
			<!-- 중독특징이해-->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getScore1()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getScore21()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getScore2()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getScore22()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getScore3()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getScore23()) %></div>
				</div>
			</div>
			<!-- 핵심증상이해-->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getScore4()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getScore24()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getScore5()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getScore25()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getScore6()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getScore26()) %></div>
				</div>
			</div>
			<!-- 문제대응방법이해-->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getScore7()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getScore27()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getScore8()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getScore28()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getScore9()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getScore29()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getScore10()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getScore30()) %></div>
				</div>
			</div>
			<!-- 활동역량-->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getScore11()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getScore31()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getScore12()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getScore32()) %></div>
				</div>
			</div>
			<!-- 심리적면역력 강화법  -->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getScore13()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getScore33()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getScore14()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getScore34()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getScore15()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getScore35()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getScore16()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getScore36()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getScore17()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getScore37()) %></div>
				</div>
			</div>
			<!-- 삶의 질   -->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getScore18()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getScore38()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getScore19()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getScore39()) %></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getScore20()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getScore40()) %></div>
				</div>
			</div>
			<!--영역  -->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black">사전</div>
					<div style="line-height:20px; height: 20px">사후</div>
				</div>
			</div>
			<!--평균  -->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 55px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getAvg1()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getAvg7()) %></div>
				</div>
				<div style="display: table-cell; width: 55px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getAvg2()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getAvg8()) %></div>
				</div>
				<div style="display: table-cell; width: 55px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getAvg3()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getAvg9()) %></div>
				</div>
				<div style="display: table-cell; width: 55px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getAvg4()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getAvg10()) %></div>
				</div>
				<div style="display: table-cell; width: 55px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getAvg5()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getAvg11()) %></div>
				</div>
				<div style="display: table-cell; width: 55px; height: 40px;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(rList.get(i).getAvg6()) %></div>
					<div style="line-height:20px; height: 20px"><%=convertXSS(rList.get(i).getAvg12()) %></div>
				</div>
			</div>
		</div> 
		<%} %>
		<div style="display: table-row;  border: 1px solid black;">
		  	<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;"></div>
			<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;"></div>
			<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;"></div>
			<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;"></div>
			<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;"></div>
			<div style="display: table-cell; width: 70px; height: 40px; border-right: 1px solid black;"></div>
			<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;"><br>통계</div>
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black">사전</div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black">사후</div>
					<div style="line-height:20px; height: 20px">차이값</div>
				</div>
			</div>
			
			<!-- 중독특징이해-->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore1()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore21()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore21())-Double.parseDouble(AvgList.get(0).getScore1()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore2()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore22()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore22())-Double.parseDouble(AvgList.get(0).getScore2()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore3()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore23()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore23())-Double.parseDouble(AvgList.get(0).getScore3()))*100.0)/100.0%></div>
				</div>
			</div>
			<!-- 핵심증상이해-->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore4()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore24()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore24())-Double.parseDouble(AvgList.get(0).getScore4()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore5()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore25()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore25())-Double.parseDouble(AvgList.get(0).getScore5()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore6()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore26()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore26())-Double.parseDouble(AvgList.get(0).getScore6()))*100.0)/100.0%></div>
				</div>
			</div>
			<!-- 문제대응방법이해-->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore7()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore27()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore27())-Double.parseDouble(AvgList.get(0).getScore7()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore8()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore28()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore28())-Double.parseDouble(AvgList.get(0).getScore8()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore9()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore29()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore29())-Double.parseDouble(AvgList.get(0).getScore9()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore10()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore30()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore30())-Double.parseDouble(AvgList.get(0).getScore10()))*100.0)/100.0%></div>
				</div>
			</div>
			<!-- 활동역량-->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore11()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore31()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore31())-Double.parseDouble(AvgList.get(0).getScore11()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore12()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore32()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore32())-Double.parseDouble(AvgList.get(0).getScore12()))*100.0)/100.0%></div>
				</div>
			</div>
			<!-- 심리적면역력 강화법  -->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore13()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore33()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore33())-Double.parseDouble(AvgList.get(0).getScore13()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore14()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore34()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore34())-Double.parseDouble(AvgList.get(0).getScore14()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore15()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore35()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore35())-Double.parseDouble(AvgList.get(0).getScore15()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore16()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore36()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore36())-Double.parseDouble(AvgList.get(0).getScore16()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore17()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore37()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore37())-Double.parseDouble(AvgList.get(0).getScore17()))*100.0)/100.0%></div>
				</div>
			</div>
			<!-- 삶의 질   -->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore18()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore38()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore38())-Double.parseDouble(AvgList.get(0).getScore18()))*100.0)/100.0%></div>
				</div>
				
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore19()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore39()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore39())-Double.parseDouble(AvgList.get(0).getScore19()))*100.0)/100.0%></div>
				</div>
				
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore19()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getScore39()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore39())-Double.parseDouble(AvgList.get(0).getScore19()))*100.0)/100.0%></div>
				</div>
				
			</div>
			<!--영역  -->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 50px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black">사전</div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black">사후</div>
					<div style="line-height:20px; height: 20px">차이값</div>
				</div>
			</div>
			<!--평균  -->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 55px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getAvg1()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getAvg7()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getAvg7())-Double.parseDouble(AvgList.get(0).getAvg1()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 55px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getAvg2()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getAvg8()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getAvg8())-Double.parseDouble(AvgList.get(0).getAvg2()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 55px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getAvg3()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getAvg9()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getAvg9())-Double.parseDouble(AvgList.get(0).getAvg3()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 55px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getAvg4()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getAvg10()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getAvg10())-Double.parseDouble(AvgList.get(0).getAvg4()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 55px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getAvg5()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getAvg11()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getAvg11())-Double.parseDouble(AvgList.get(0).getAvg5()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 55px; height: 40px; ">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getAvg6()) %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=convertXSS(AvgList.get(0).getAvg12()) %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getAvg12())-Double.parseDouble(AvgList.get(0).getAvg6()))*100.0)/100.0%></div>
				</div>
			</div> 
		</div> 
	   </div>
     </div>
     </div>
</body>
</html>