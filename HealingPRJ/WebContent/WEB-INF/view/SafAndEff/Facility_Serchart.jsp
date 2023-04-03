<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	   <%@ page import ="poly.util.CmmUtil" %>
<%@ page import ="poly.dto.ServiceInsertDTO" %>
<%@ page import ="java.util.List" %>
<%

	List<ServiceInsertDTO> rList = (List<ServiceInsertDTO>)request.getAttribute("rList");
	List<ServiceInsertDTO> avgList = (List<ServiceInsertDTO>)request.getAttribute("avgList");
	
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
.cell_20_no_right{
	style="display: table-cell; 
	width: 20px; 
	line-height:20px;
	height: 20px; 
	border-right: 1px solid black;"
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
		<h3>시설 서비스 환경 만족도</h3>
	</div>
	<div class="col-md-12">
	<div class="panel panel-default chat" style="overflow-x: scroll;">
			<div class="panel-heading" style="display: inline-block; height: auto;  ">
			<div style="display: table inline-block; padding: 10px; border-collapse: collapse; font-size: 10px; text-align: center; width:2800px;">
				<div style=" display: table-row;  border: 1px solid black;">
					<div style="display: table-cell; width: 30px; height:60px; border-right: 1px solid black;background-color: #ccc;"><p style="transform: translateY(15px);">순번</div>
					<div style="display: table-cell; width: 120px; height:60px; border-right: 1px solid black;background-color: #ccc;"><p style="transform: translateY(15px);">실시일자</div>
					<div style="display: table-cell; width: 240px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><p style="transform: translateY(15px);">기관명</div>
					<div style="display: table-cell; width: 60px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><p style="transform: translateY(15px);">참여프로그램</div>
					<div style="display: table-cell; width: 40px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><p style="transform: translateY(15px);">성별</div>
					<div style="display: table-cell; width: 40px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><p style="transform: translateY(15px);">연령</div>
					<div style="display: table-cell; width: 40px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><p style="transform: translateY(15px);">거주지</div>
					<div style="display: table-cell; width: 80px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><p style="transform: translateY(15px);">직업</div> 
					<div style="display: table-cell;">
					<div style="width: auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">숙소</div>
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px;  height: 52px; border-right: 1px solid black;background-color: #ccc;">문항1</div>
							<div style="display: table-cell; width: 40px; height: 52px; border-right: 1px solid black;background-color: #ccc;">문항2</div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div style="width: auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">식당</div>
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px;  height: 52px; border-right: 1px solid black;background-color: #ccc;">문항3</div>
							<div style="display: table-cell; width: 40px; height: 52px; border-right: 1px solid black;background-color: #ccc;">문항4</div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div style="width: auto;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">프로그램 장소</div>
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px;  height:52px; border-right: 1px solid black;background-color: #ccc;">문항5</div>
							<div style="display: table-cell; width: 40px; height: 52px; border-right: 1px solid black;background-color: #ccc;">문항6</div>
							<div style="display: table-cell; width: 40px; height: 52px; border-right: 1px solid black;background-color: #ccc;">문항7</div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div style="width: auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">숲(야외)</div>
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px; height: 52px; border-right: 1px solid black;background-color: #ccc;">문항8</div>
							<div style="display: table-cell; width: 40px; height: 52px; border-right: 1px solid black;background-color: #ccc;">문항9</div>
							<div style="display: table-cell; width: 40px; height: 52px; border-right: 1px solid black;background-color: #ccc;">문항10</div>
						</div>
					</div>
					<div style="display: table-cell; width: 350px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><p style="transform: translateY(15px);">기타의견</div> 
					<div style="display: table-cell;">
						<div style="width: auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">운영</div>
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px;  height: 52px; border-right: 1px solid black;background-color: #ccc;">문항1</div>
							<div style="display: table-cell; width: 40px; height: 52px; border-right: 1px solid black;background-color: #ccc;">문항2</div>
							<div style="display: table-cell; width: 40px;;height: 52px; border-right: 1px solid black;background-color: #ccc;">문항3</div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div style="width: auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">식사</div>
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px; height: 52px; border-right: 1px solid black;background-color: #ccc;">문항4</div>
							<div style="display: table-cell; width: 40px; height: 52px; border-right: 1px solid black;background-color: #ccc;">문항5</div>
							<div style="display: table-cell; width: 40px; height: 52px; border-right: 1px solid black;background-color: #ccc;">문항6</div>
						</div>
					</div>
					<div style="display: table-cell; width: 350px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><p style="transform: translateY(15px);">기타의견</div> 
					<div style="display: table-cell;">
						<div style="width: auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">잠재적 관광수요</div>
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px; height: 52px; border-right: 1px solid black;background-color: #ccc;">문항7</div>
							<div style="display: table-cell; width: 40px; height: 52px; border-right: 1px solid black;background-color: #ccc;">문항8</div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div style="width: auto; height: 30px; border-bottom: 1px solid black;background-color: #ccc;">평균</div>
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px; height: 42px; border-right: 1px solid black;background-color: #ccc;">숙소</div>
							<div style="display: table-cell; width: 40px; height: 42px; border-right: 1px solid black;background-color: #ccc;">식당</div>
							<div style="display: table-cell; width: 40px; height: 42px; line-height:120%;border-right: 1px solid black;background-color: #ccc;">프로그램 <br>장소</div>
							<div style="display: table-cell; width: 40px; height: 42px; border-right: 1px solid black;background-color: #ccc;">숲(야외)</div>
							<div style="display: table-cell; width: 40px; height: 42px; border-right: 1px solid black;background-color: #ccc;">운영</div>
							<div style="display: table-cell; width: 40px; height: 42px; border-right: 1px solid black;background-color: #ccc;">식사</div>
							<div style="display: table-cell; width: 40px; height: 42px; line-height:90%;background-color: #ccc; "><p style="transform: translateY(-5px);">잠재적<br>관광<br>수요</div>
						</div>
					</div> 
				</div>
				<%for(int i=1; i<= rList.size(); i++) { %>
				  <div style="display: table-row; border: 1px solid black;">
					<div style="display: table-cell; width: 30px; height: 30px; border-right: 1px solid black;"><%=i %></div>
					<div style="display: table-cell; width: 60px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getOpenday()) %></div>
					<div style="display: table-cell; width: 80px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getAgency()) %></div>
					<div style="display: table-cell; width: 60px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getPtcProgram())%></div>
					<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getSex())%></div>
					<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getAge()) %></div>
					<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getResidence()) %></div>
					<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getJob())%></div>
					<div>
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getScore1())%></div>
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getScore2())%></div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getScore3())%></div>
							<div style="display: table-cell; width: 40px;height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getScore4())%></div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getScore5())%></div>
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getScore6())%></div>
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getScore7())%></div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getScore8())%></div>
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getScore9())%></div>
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getScore10())%></div>
						</div>
					</div>
					<div style="display: table-cell; width: 350px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getFacility_opinion()) %></div>
					<div style="display: table-cell;">
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getScore11()) %></div>
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getScore12()) %></div>
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getScore13()) %></div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getScore14()) %></div>
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getScore15()) %></div>
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getScore16()) %></div>
						</div>
					</div>
					<div style="display: table-cell; width: 350px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getOperation_opinion()) %></div>
					<div style="display: table-cell;">
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getScore17()) %></div>
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i-1).getScore18()) %></div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px; height: 30px;border-right: 1px solid black; "><%=Math.round((Double.parseDouble(rList.get(i-1).getScore1())+Double.parseDouble(rList.get(i-1).getScore2()))/2*100.0)/100.0 %></div>
							<div style="display: table-cell; width: 40px; height: 30px;border-right: 1px solid black; "><%=Math.round((Double.parseDouble(rList.get(i-1).getScore3())+Double.parseDouble(rList.get(i-1).getScore4()))/2*100.0)/100.0 %></div>
							<div style="display: table-cell; width: 40px; height: 30px;border-right: 1px solid black; "><%=Math.round((Double.parseDouble(rList.get(i-1).getScore5())+Double.parseDouble(rList.get(i-1).getScore6())+Double.parseDouble(rList.get(i-1).getScore7()))/3*100.0)/100.0 %></div>
							<div style="display: table-cell; width: 40px; height: 30px;border-right: 1px solid black; "><%=Math.round((Double.parseDouble(rList.get(i-1).getScore8())+Double.parseDouble(rList.get(i-1).getScore9())+Double.parseDouble(rList.get(i-1).getScore10()))/3*100.0)/100.0 %></div>
							<div style="display: table-cell; width: 40px; height: 30px;border-right: 1px solid black; "><%=Math.round((Double.parseDouble(rList.get(i-1).getScore11())+Double.parseDouble(rList.get(i-1).getScore12())+Double.parseDouble(rList.get(i-1).getScore13()))/3*100.0)/100.0 %></div>
							<div style="display: table-cell; width: 40px; height: 30px;border-right: 1px solid black; "><%=Math.round((Double.parseDouble(rList.get(i-1).getScore14())+Double.parseDouble(rList.get(i-1).getScore15())+Double.parseDouble(rList.get(i-1).getScore16()))/3*100.0)/100.0 %></div>
							<div style="display: table-cell; width: 40px; height: 30px; "><%=Math.round((Double.parseDouble(rList.get(i-1).getScore17())+Double.parseDouble(rList.get(i-1).getScore18()))/2*100.0)/100.0 %></div>
						</div>
					</div>
				</div>
				<% } %> 
				 <div style="display: table-row; border: 1px solid black;">
					<div style="display: table-cell; width: 30px; height: 30px; border-right: 1px solid black;">통계</div>
					<div style="display: table-cell; width: 60px; height: 30px; border-right: 1px solid black;"></div>
					<div style="display: table-cell; width: 80px; height: 30px; border-right: 1px solid black;"></div>
					<div style="display: table-cell; width: 60px; height: 30px; border-right: 1px solid black;"></div>
					<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"></div>
					<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"></div>
					<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"></div>
					<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;">평균</div>
					<div>
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore1())%></div>
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore2())%></div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore3())%></div>
							<div style="display: table-cell; width: 40px;height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore4())%></div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore5())%></div>
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore6())%></div>
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore7())%></div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore8())%></div>
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore9())%></div>
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore10())%></div>
						</div>
					</div>
					<div style="display: table-cell; width: 60px; height: 30px; border-right: 1px solid black;"></div>
					<div style="display: table-cell;">
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore11())%></div>
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore12())%></div>
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore13())%></div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore14())%></div>
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore15())%></div>
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore16())%></div>
						</div>
					</div>
					<div style="display: table-cell; width: 60px; height: 30px; border-right: 1px solid black;"></div>
					<div style="display: table-cell;">
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore17())%></div>
							<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore18())%></div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px; height: 30px;border-right: 1px solid black; "><%=Math.round((Double.parseDouble(avgList.get(0).getScore1())+Double.parseDouble(avgList.get(0).getScore2()))/2*100.0)/100.0 %></div>
							<div style="display: table-cell; width: 40px; height: 30px;border-right: 1px solid black; "><%=Math.round((Double.parseDouble(avgList.get(0).getScore3())+Double.parseDouble(avgList.get(0).getScore4()))/2*100.0)/100.0  %></div>
							<div style="display: table-cell; width: 40px; height: 30px;border-right: 1px solid black; "><%=Math.round((Double.parseDouble(avgList.get(0).getScore5())+Double.parseDouble(avgList.get(0).getScore6())+Double.parseDouble(avgList.get(0).getScore7()))/3*100.0)/100.0  %></div>
							<div style="display: table-cell; width: 40px; height: 30px;border-right: 1px solid black; "><%=Math.round((Double.parseDouble(avgList.get(0).getScore8())+Double.parseDouble(avgList.get(0).getScore9())+Double.parseDouble(avgList.get(0).getScore10()))/3*100.0)/100.0  %></div>
							<div style="display: table-cell; width: 40px; height: 30px;border-right: 1px solid black; "><%=Math.round((Double.parseDouble(avgList.get(0).getScore11())+Double.parseDouble(avgList.get(0).getScore12())+Double.parseDouble(avgList.get(0).getScore13()))/3*100.0)/100.0  %></div>
							<div style="display: table-cell; width: 40px; height: 30px;border-right: 1px solid black; "><%=Math.round((Double.parseDouble(avgList.get(0).getScore14())+Double.parseDouble(avgList.get(0).getScore15())+Double.parseDouble(avgList.get(0).getScore16()))/3*100.0)/100.0  %></div>
							<div style="display: table-cell; width: 40px; height: 30px; "><%=Math.round((Double.parseDouble(avgList.get(0).getScore17())+Double.parseDouble(avgList.get(0).getScore18()))/2*100.0)/100.0  %></div>
						</div>
					</div>
				</div> 
			</div>
		</div>
	</div>
	</div>
	</body>
</html>