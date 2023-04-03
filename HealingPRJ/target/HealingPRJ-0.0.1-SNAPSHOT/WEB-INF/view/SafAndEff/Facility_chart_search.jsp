<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ page import ="poly.util.CmmUtil" %>
<%@ page import ="poly.dto.SearchDTO" %>
<%@ page import ="java.util.List" %>
<%

	List<SearchDTO> rList = (List<SearchDTO>)request.getAttribute("rList");
	List<SearchDTO> avgList = (List<SearchDTO>)request.getAttribute("avgList");
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
   <p style="transform: translateY(15px);">
   <!-- 상단 제목 -->
	<div style="width: 1000px; height: 40px; text-align: center;">
		<h3>시설 서비스 환경 만족도</h3>
	</div>
	<div class="col-md-12">
		<div class="panel panel-default chat" style="overflow-x: scroll;">
			<div class="panel-heading" style="display: inline-block; height: auto;  ">
				<div style="display: table inline-block; padding: 10px; width : 2400px; border-collapse: collapse; font-size: 10px; text-align: center;">
				<div style=" display: table-row;  border: 1px solid black;">
					<div style="display: table-cell; width: 140px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><p style="transform: translateY(15px);">주제어 1</div>
					<div style="display: table-cell; width: 140px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><p style="transform: translateY(15px);">주제어 2</div>
					<div style="display: table-cell; width: 140px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><p style="transform: translateY(15px);">주제어 3</div> 
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
					<div style="display: table-cell; width: 350px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><p style="transform: translateY(15px);">기타의견</p></div> 
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
					<div style="display: table-cell; width: 350px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><p style="transform: translateY(15px);">기타의견</p></div> 
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
							<div style="display: table-cell; width: 40px; height: 52px; border-right: 1px solid black;background-color: #ccc;">숙소</div>
							<div style="display: table-cell; width: 40px; height: 52px; border-right: 1px solid black;background-color: #ccc;">식당</div>
							<div style="display: table-cell; width: 40px; height: 52px; line-height:120%;border-right: 1px solid black;background-color: #ccc;">프로그램 <br>장소</div>
							<div style="display: table-cell; width: 40px; height: 52px; border-right: 1px solid black;background-color: #ccc;">숲(야외)</div>
							<div style="display: table-cell; width: 40px; height: 52px; border-right: 1px solid black;background-color: #ccc;">운영</div>
							<div style="display: table-cell; width: 40px; height: 52px; border-right: 1px solid black;background-color: #ccc;">식사</div>
							<div style="display: table-cell; width: 40px; height: 52px; line-height:90%;background-color: #ccc; "><p style="transform: translateY(-5px);">잠재적<br>관광<br>수요</div>
						</div>
					</div> 
				</div>
				<%for(int i=0; i<rList.size(); i++) { %>
				  <div style="display: table-row; border: 1px solid black;">
					<div style="display: table-cell; width: 140px; height: auto; border-right: 1px solid black;"><%=c_1%></div>
					<div style="display: table-cell; width: 140px; height: auto; border-right: 1px solid black;"><%=c_2 %></div>
					<div style="display: table-cell; width: 140px; height: auto; border-right: 1px solid black;"><%=c_3%></div>
					<div style="display: table-cell;">
						<div style="display: table-cell; width: 40px; height: auto; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i).getScore1())%></div>
						<div style="display: table-cell; width: 40px; height: auto; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i).getScore2())%></div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell; width: 40px; height: auto; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i).getScore3())%></div>
						<div style="display: table-cell; width: 40px;height: auto; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i).getScore4())%></div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell; width: 40px; height: auto; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i).getScore5())%></div>
						<div style="display: table-cell; width: 40px; height: auto; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i).getScore6())%></div>
						<div style="display: table-cell; width: 40px; height: auto; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i).getScore7())%></div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell; width: 40px; height: auto; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i).getScore8())%></div>
						<div style="display: table-cell; width: 40px; height: auto; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i).getScore9())%></div>
						<div style="display: table-cell; width: 40px; height: auto; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i).getScore10())%></div>
					</div>
					<div style="display: table-cell; width: 240px; height: auto; border-right: 1px solid black;"><pre style="font-size: 10px; border: 0px; font-family: 'NanumSquare'; background-color: transparent; padding: 0px; margin: 0px;"><%=CmmUtil.nvl(rList.get(i).getFacility_opinion()) %></pre></div>
					<div style="display: table-cell;">
						<div style="display: table-cell; width: 40px; height: auto; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i).getScore11()) %></div>
						<div style="display: table-cell; width: 40px; height: auto; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i).getScore12()) %></div>
						<div style="display: table-cell; width: 40px; height: auto; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i).getScore13()) %></div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell; width: 40px; height: auto; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i).getScore14()) %></div>
						<div style="display: table-cell; width: 40px; height: auto; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i).getScore15()) %></div>
						<div style="display: table-cell; width: 40px; height: auto; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i).getScore16()) %></div>
					</div>
					<div style="display: table-cell; width: 240px; height: auto; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i).getOperatoin_opinion()) %></div>
					<div style="display: table-cell;">
						<div style="display: table-cell; width: 40px; height: auto; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i).getScore17()) %></div>
						<div style="display: table-cell; width: 40px; height: auto; border-right: 1px solid black;"><%=CmmUtil.nvl(rList.get(i).getScore18()) %></div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell; width: 40px; height: auto;border-right: 1px solid black; "><%=Math.round((Double.parseDouble(rList.get(i).getScore1())+Double.parseDouble(rList.get(i).getScore2()))/2*100)/100.0 %></div>
						<div style="display: table-cell; width: 40px; height: auto;border-right: 1px solid black; "><%=Math.round((Double.parseDouble(rList.get(i).getScore3())+Double.parseDouble(rList.get(i).getScore4()))/2*100)/100.0 %></div>
						<div style="display: table-cell; width: 40px; height: auto;border-right: 1px solid black; "><%=Math.round((Double.parseDouble(rList.get(i).getScore5())+Double.parseDouble(rList.get(i).getScore6())+Double.parseDouble(rList.get(i).getScore7()))/3*100)/100.0 %></div>
						<div style="display: table-cell; width: 40px; height: auto;border-right: 1px solid black; "><%=Math.round((Double.parseDouble(rList.get(i).getScore8())+Double.parseDouble(rList.get(i).getScore9())+Double.parseDouble(rList.get(i).getScore10()))/3*100)/100.0 %> </div>
						<div style="display: table-cell; width: 40px; height: auto;border-right: 1px solid black; "><%=Math.round((Double.parseDouble(rList.get(i).getScore11())+Double.parseDouble(rList.get(i).getScore12())+Double.parseDouble(rList.get(i).getScore13()))/3*100)/100.0 %></div>
						<div style="display: table-cell; width: 40px; height: auto;border-right: 1px solid black; "><%=Math.round((Double.parseDouble(rList.get(i).getScore14())+Double.parseDouble(rList.get(i).getScore15())+Double.parseDouble(rList.get(i).getScore16()))/3*100)/100.0 %></div>
						<div style="display: table-cell; width: 40px; height: auto; "><%=Math.round((Double.parseDouble(rList.get(i).getScore17())+Double.parseDouble(rList.get(i).getScore18()))/2*100)/100.0 %> </div>
					</div>
				</div>
				<% } %>
				<div style="display: table-row; border: 1px solid black;">
					<div style="display: table-cell; width: 60px; height: 30px; border-right: 1px solid black;">통계</div>
					<div style="display: table-cell; width: 60px; height: 30px; border-right: 1px solid black;"></div>
					<div style="display: table-cell; width: 60px; height: 30px; border-right: 1px solid black;">평균</div>
					<div style="display: table-cell;">
						<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore1())%></div>
						<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore2())%></div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore3())%></div>
						<div style="display: table-cell; width: 40px;height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore4())%></div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore5())%></div>
						<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore6())%></div>
						<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore7())%></div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore8())%></div>
						<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore9())%></div>
						<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore10())%></div>
					</div>
					<div style="display: table-cell; width: 60px; height: 30px; border-right: 1px solid black;"></div>
					<div style="display: table-cell;">
						<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore11())%></div>
						<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore12())%></div>
						<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore13())%></div>
					</div>
					<div style="display: table-cell;">
						<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore14())%></div>
						<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore15())%></div>
						<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore16())%></div>
					</div>
					<div style="display: table-cell; width: 60px; height: 30px; border-right: 1px solid black;"></div>
					<div style="display: table-cell;">
						<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore17())%></div>
						<div style="display: table-cell; width: 40px; height: 30px; border-right: 1px solid black;"><%=CmmUtil.nvl(avgList.get(0).getScore18())%></div>
					</div>
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
</body>
</html>