<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ page import ="poly.util.CmmUtil" %>
<%@ page import ="poly.dto.ProgramInsertDTO" %>
<%@ page import ="poly.dto.SearchDTO" %>
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
</head>
<body>
   <!-- 상단 제목 -->
   <div style="width: 1000px; height: 40px; text-align: center;">
      <h3>프로그램 만족도</h3>
   </div>
   <div class="col-md-12">
		<div class="panel panel-default chat">
  <div style="display: table inline-block; padding: 10px; border-collapse: collapse; font-size: 10px; text-align: center;">
		<div style=" display: table-row; width: 950px; border: 1px solid black;">
			<div style="display: table-cell; width: 150px; height:60px; border-right: 1px solid black; background-color: #ccc;'"><br>주제어 1</div>
			<div style="display: table-cell; width: 150px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><br>주제어 2</div>
			<div style="display: table-cell; width: 150px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><br>주제어3</div>
			<div style="display: table-cell;">
				<div style="width: auto; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">강사</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 50px; line-height:30px; height: 30px; border-right: 1px solid black;">전문성</div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;">성실성</div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;">반응성</div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;">평균</div>
				</div>
			</div>
			<div style="display: table-cell;">
				<div style="width: auto; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">내용구성</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;">체계성</div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;">적합성</div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;">흥미성</div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;">평균</div>
				</div>
			</div>
			<div style="display: table-cell;">
				<div style="width: auto; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">효과성</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;">학습성</div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;">재참여</div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;">추천</div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;">평균</div>
				</div>
			</div>
			<div style="display: table-cell; width: 100px; height: 60px;background-color: #ccc; "><br>평균</div>
		</div>
		<!-- for문 실행 -->
		<% for( int i=0; i<rList.size(); i++){ %>
		 <div style="display: table-row; width: 950px; border: 1px solid black;">
			<div style="display: table-cell; width: 100px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=c_1 %></div>
			<div style="display: table-cell; width: 100px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=c_2 %></div>
			<div style="display: table-cell; width: 100px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=c_3 %></div>
			<div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=rList.get(i).getScore1() %></div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=rList.get(i).getScore2() %></div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=rList.get(i).getScore3() %></div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=rList.get(i).getAvg1()%></div>
				</div>
			</div>
			<div style="display: table-cell;">
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=rList.get(i).getScore4() %></div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=rList.get(i).getScore5() %></div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=rList.get(i).getScore6() %></div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=rList.get(i).getAvg2()%></div>
				</div>
			</div>
			<div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=rList.get(i).getScore7() %></div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=rList.get(i).getScore8() %></div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=rList.get(i).getScore9() %></div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=rList.get(i).getAvg3()%></div>
				</div>
			</div>
			<div style="display: table-cell; width: 100px; height: 30px; border-right: 1px solid black;">
				<%=rList.get(i).getAvg4()%>
			</div>
		</div> 
		<%} %>
		 <div style="display: table-row; width: 950px; border: 1px solid black;">
			<div style="display: table-cell; width: 100px; line-height:30px;height: 30px; border-right: 1px solid black;"></div>
			<div style="display: table-cell; width: 100px; line-height:30px;height: 30px; border-right: 1px solid black;"></div>
			<div style="display: table-cell; width: 100px; line-height:30px;height: 30px; border-right: 1px solid black;">통계</div>
			<div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=AvgList.get(0).getScore1() %></div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=AvgList.get(0).getScore2() %></div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=AvgList.get(0).getScore3() %></div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=AvgList.get(0).getAvg1()%></div>
				</div>
			</div>
			<div style="display: table-cell;">
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=AvgList.get(0).getScore4() %></div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=AvgList.get(0).getScore5() %></div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=AvgList.get(0).getScore6() %></div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=AvgList.get(0).getAvg2()%></div>
				</div>
			</div>
			<div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=AvgList.get(0).getScore7() %></div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=AvgList.get(0).getScore8() %></div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=AvgList.get(0).getScore9() %></div>
					<div style="display: table-cell; width: 50px; line-height:30px;height: 30px; border-right: 1px solid black;"><%=AvgList.get(0).getAvg3()%></div>
				</div>
			</div>
			<div style="display: table-cell; width: 100px; height: 30px; border-right: 1px solid black;">
				<%=AvgList.get(0).getAvg4()%>
			</div>
		</div> 
	</div>
	</div>
	</div>
</body>
</html>