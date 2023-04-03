<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.ProgramInsertDTO"%>
<%@ page import="poly.dto.SearchDTO"%>
<%@ page import="java.util.List"%>
<%
	List<SearchDTO> rList = (List<SearchDTO>) request.getAttribute("rList");
	List<SearchDTO> AvgList = (List<SearchDTO>) request.getAttribute("AvgList");
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
		<h3>프로그램 만족도</h3>
	</div>
	<div class="col-md-12">
		<div class="panel panel-default chat">
			<div
				style="display: table inline-block; padding: 10px; border-collapse: collapse; font-size: 10px; text-align: center;">
				<div style="display: table-row; border: 1px solid black;">
					<div
						style="display: table-cell; width: 30px; height: 60px; border-right: 1px solid black;background-color: #ccc;">
						<br>
						<br>ID
					</div>
					<div
						style="display: table-cell; width: 120px; height: 60px; border-right: 1px solid black;background-color: #ccc;">
						<br>
						<br>프로그램명
					</div>
					<div
						style="display: table-cell; width: 60px; height: 60px; border-right: 1px solid black;background-color: #ccc;">
						<br>
						<br>강사명
					</div>
					<div
						style="display: table-cell; width: 120px; height: 60px; border-right: 1px solid black;background-color: #ccc;">
						<br>
						<br>장소
					</div>
					<div style="display: table-cell;">
						<div
							style="width: auto; height: 20px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">강사</div>
						<div style="display: table-cell;">
							<div
								style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;background-color: #ccc;">
								<br>문항1
							</div>
							<div
								style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;background-color: #ccc;">
								<br>문항2
							</div>
							<div
								style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;background-color: #ccc;">
								<br>문항3
							</div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div
							style="width: auto; height: 20px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">구성/품질</div>
						<div style="display: table-cell;">
							<div
								style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;background-color: #ccc;">
								<br>문항4
							</div>
							<div
								style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;background-color: #ccc;">
								<br>문항5
							</div>
							<div
								style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;background-color: #ccc;">
								<br>문항6
							</div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div
							style="width: auto; height: 20px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">효과성</div>
						<div style="display: table-cell;">
							<div
								style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;background-color: #ccc;">
								<br>문항7
							</div>
							<div
								style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;background-color: #ccc;">
								<br>문항8
							</div>
							<div
								style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;background-color: #ccc;">
								<br>문항9
							</div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div
							style="width: auto; height: 20px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">기타의견</div>
						<div style="display: table-cell;">
							<div
								style="display: table-cell; width: 400px; height: 40px; border-right: 1px solid black;background-color: #ccc;"></div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div
							style="width: auto; height: 20px; border-bottom: 1px solid black;background-color: #ccc;">평균</div>
						<div style="display: table-cell;">
							<div
								style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;background-color: #ccc;">
								<br>강사
							</div>
							<div
								style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;background-color: #ccc;">
								구성<br>품질
							</div>
							<div
								style="display: table-cell; width: 40px; height: 39px;background-color: #ccc;">
								<br>효과성
							</div>
						</div>
					</div>
				</div>
				<%
					for (int i = 1; i <= rList.size(); i++) {
				%>
				<div style="display: table-row; border: 1px solid black;">
					<div
						style="display: table-cell; width: 30px;  height: 30px;line-height:30px; border-right: 1px solid black;"><%=i%></div>
					<div
						style="display: table-cell; width: 60px;  height: 30px;line-height:30px;  border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i - 1).getProgram_name())%>
					</div>
					<div
						style="display: table-cell; width: 60px; height: 30px; line-height:30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i - 1).getTeacher())%>
					</div>
					<div
						style="display: table-cell; width: 60px;  height: 30px;line-height:30px;  border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i - 1).getPlace())%>
					</div>
					<div>
						<div style="display: table-cell;">
							<div
								style="display: table-cell; width: 40px;  height: 30px;line-height:30px;  border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i - 1).getScore1())%></div>
							<div
								style="display: table-cell; width: 40px;  height: 30px;line-height:30px;  border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i - 1).getScore2())%></div>
							<div
								style="display: table-cell; width: 40px;  height: 30px;line-height:30px;  border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i - 1).getScore3())%></div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell;">
							<div
								style="display: table-cell; width: 40px;  height: 30px;line-height:30px;  border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i - 1).getScore4())%></div>
							<div
								style="display: table-cell; width: 40px;  height: 30px; line-height:30px; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i - 1).getScore5())%></div>
							<div
								style="display: table-cell; width: 40px;  height: 30px;line-height:30px;  border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i - 1).getScore6())%></div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell;">
							<div
								style="display: table-cell; width: 40px;  height: 30px;line-height:30px;  border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i - 1).getScore7())%></div>
							<div
								style="display: table-cell; width: 40px;  height: 30px;line-height:30px;  border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i - 1).getScore8())%></div>
							<div
								style="display: table-cell; width: 40px;  height: 30px;line-height:30px;  border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i - 1).getScore9())%></div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell;">
							<div
								style="display: table-cell; width: 400px;  height: 30px;line-height:30px;  border-right: 1px solid black;"><%=rList.get(i - 1).getEtc_opinion()%></div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell;">
							<div
								style="display: table-cell; width: 40px;  height: 30px;line-height:30px;  border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i - 1).getAvg1())%></div>
							<div
								style="display: table-cell; width: 40px;  height: 30px;line-height:30px;  border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i - 1).getAvg2())%></div>
							<div
								style="display: table-cell; width: 40px;  height: 30px;line-height:30px;  "><%=CmmUtil.nvl(rList.get(i - 1).getAvg3())%></div>
						</div>
					</div>
				</div>
				<%
					}
				%>
				<div style="display: table-row; border: 1px solid black;">
					<div style="display: table-cell; width: 30px; line-height: 30px; height: 30px; border-right: 1px solid black;"></div>
					<div style="display: table-cell; width: 60px; line-height: 30px; height: 30px; border-right: 1px solid black;"></div>
					<div style="display: table-cell; width: 60px; line-height: 30px; height: 30px; border-right: 1px solid black;"></div>
					<div style="display: table-cell; width: 60px; line-height: 30px; height: 30px; border-right: 1px solid black;"> 통계</div>
					<div>
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 40px; line-height: 30px; height: 30px; border-right: 1px solid black;"><%=AvgList.get(0).getScore1() %></div>
							<div style="display: table-cell; width: 40px; line-height: 30px; height: 30px; border-right: 1px solid black;"><%=AvgList.get(0).getScore2() %></div>
							<div style="display: table-cell; width: 40px; line-height: 30px; height: 30px; border-right: 1px solid black;"><%=AvgList.get(0).getScore3() %></div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell;">
							<div
								style="display: table-cell; width: 40px; line-height: 30px; height: 30px; border-right: 1px solid black;"><%=AvgList.get(0).getScore4() %></div>
							<div
								style="display: table-cell; width: 40px; line-height: 30px; height: 30px; border-right: 1px solid black;"><%=AvgList.get(0).getScore5() %></div>
							<div
								style="display: table-cell; width: 40px; line-height: 30px; height: 30px; border-right: 1px solid black;"><%=AvgList.get(0).getScore6() %></div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell;">
							<div
								style="display: table-cell; width: 40px; line-height: 30px; height: 30px; border-right: 1px solid black;"><%=AvgList.get(0).getScore7() %></div>
							<div
								style="display: table-cell; width: 40px; line-height: 30px; height: 30px; border-right: 1px solid black;"><%=AvgList.get(0).getScore8() %></div>
							<div
								style="display: table-cell; width: 40px; line-height: 30px; height: 30px; border-right: 1px solid black;"><%=AvgList.get(0).getScore9() %></div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 400px;  height: 30px;line-height:30px;  border-right: 1px solid black;"">-</div>
						</div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell;">
							<div
								style="display: table-cell; width: 40px; line-height: 30px; height: 30px; border-right: 1px solid black;"><%=AvgList.get(0).getAvg1() %></div>
							<div
								style="display: table-cell; width: 40px; line-height: 30px; height: 30px; border-right: 1px solid black;"><%=AvgList.get(0).getAvg2() %></div>
							<div
								style="display: table-cell; width: 40px; line-height: 30px; height: 30px; "><%=AvgList.get(0).getAvg3() %></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>