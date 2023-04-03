<%@page import="org.apache.poi.util.RLEDecompressingInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import ="poly.util.CmmUtil" %>
<%@ page import ="poly.dto.SearchDTO" %>
<%@ page import ="java.util.List" %>
<%

	List<SearchDTO> rList = (List<SearchDTO>)request.getAttribute("HealList");
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
      <h3>힐링 서비스 효과평가</h3>
   </div>
   <div class="col-md-12">
		<div class="panel panel-default chat">
		<div style="display: table inline-block; padding: 10px; border-collapse: collapse; font-size: 10px; text-align: center;">
		<div style=" display: table-row;  border: 1px solid black;">
			<div style="display: table-cell; width: 40px; height:60px; border-right: 1px solid black; background-color: #ccc;"><br><br>ID</div>
			<div style="display: table-cell; width: 40px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><br><br>성명</div>
			<div style="display: table-cell; width: 40px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><br><br>성별</div>
			<div style="display: table-cell; width: 40px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><br><br>연령</div>
			<div style="display: table-cell; width: 40px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><br><br>거주지</div>
			<div style="display: table-cell; width: 40px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><br><br>직업</div>
			<div style="display: table-cell; width: 60px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><br>참여<br>프로그램</div>
			<div style="display: table-cell; width: 60px; height: 60px; border-right: 1px solid black;background-color: #ccc;"><br>과거 스트레스<br>해소 및 힐링 <br>서비스경험</div> 
			<div style="display: table-cell;">
				<div style="width:auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">영역</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 40px; height: 45px; border-right: 1px solid black;background-color: #ccc;">평가<br>시점</div>
				</div>
			</div>
			<div style="display: table-cell;">
				<div style="width:auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">1.욕구충족</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 40px; height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 1</div>
					<div style="display: table-cell; width: 40px; height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 2</div>
				</div>
			</div>
			<div style="display: table-cell;">
				<div style="width:auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">2.긍정정서</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 3</div>
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 4</div>
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 5</div>
				</div>
			</div>
			<div style="display: table-cell;">
				<div style="width:auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">3.자기이해</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 6</div>
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 7</div>
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 8</div>
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 9</div>
				</div>
			</div>
			<div style="display: table-cell;">
				<div style="width:auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">4.마음관리기술</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 10</div>
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 11</div>
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 12</div>
				</div>
			</div>
			<div style="display: table-cell;">
				<div style="width:auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">5.정서능력측면</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 1</div>
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 2</div>
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 3</div>
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 4</div>
				</div>
			</div>
			<div style="display: table-cell;">
				<div style="width:auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">6.영성측면</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 5</div>
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 6</div>
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 7</div>
				</div>
			</div>
			<div style="display: table-cell;">
				<div style="width:auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">7.삶의 조망측면</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 8</div>
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 9</div>
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;"><br>문항 10</div>
				</div>
			</div>
			<div style="display: table-cell;">
				<div style="width:auto; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc;">영역</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 40px; height: 45px; border-right: 1px solid black;background-color: #ccc;">평가<br>시점</div>
				</div>
			</div>
			<div style="display: table-cell;">
				<div style="width:auto; height: 30px; border-bottom: 1px solid black; background-color: #ccc;">평균(0~6점)</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;">욕구<br>충족</div>
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;">긍정<br>정서</div>
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;">자기<br>이해</div>
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;">마음<br>관리<br>기술</div>
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;">정서<br>능력<br>측면</div>
					<div style="display: table-cell; width: 40px;height: 45px; border-right: 1px solid black;background-color: #ccc;">영성<br>측면</div>
					<div style="display: table-cell; width: 40px;height: 45px; background-color: #ccc;">삶의<br>조망<br>측면</div>
				</div>
			</div>
		</div>
		 <%for(int i=0; i<rList.size(); i++){ %>
		<div style="display: table-row;  border: 1px solid black;">
		  	<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;"><br><%= i+1 %></div>
			<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;"><br><%=CmmUtil.nvl(rList.get(i).getName())%></div>
			<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;"><br><%=CmmUtil.nvl(rList.get(i).getSex())%></div>
			<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;"><br><%=CmmUtil.nvl(rList.get(i).getAge())%></div>
			<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;"><br><%=CmmUtil.nvl(rList.get(i).getResidence())%></div>
			<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;"><br><%=CmmUtil.nvl(rList.get(i).getJob())%></div>
			<div style="display: table-cell; width: 60px; height: 40px; border-right: 1px solid black;"><br><%=CmmUtil.nvl(rList.get(i).getPtcprogram())%></div>
			<div style="display: table-cell; width: 60px; height: 40px; border-right: 1px solid black;"><br><%=CmmUtil.nvl(rList.get(i).getPast_stress_experience())%></div>
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black">사전</div>
					<div style="line-height:20px; height: 20px">사후</div>
				</div>
			</div>
			<!--욕구충족  -->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore1())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore23())%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore2())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore24())%></div>
				</div>
			</div>
			<!--긍정정서  -->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore3())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore25())%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore4())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore26())%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore5())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore27())%></div>
				</div>
			</div>
			<!--자기이해  -->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore6())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore28())%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore7())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore29())%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore8())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore30())%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore9())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore31())%></div>
				</div>
			</div>
			<!--마음관리기술 -->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore10())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore32())%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore11())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore33())%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore12())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore34())%></div>
				</div>
			</div>
			<!--정서능력측면-->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore13())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore35())%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore14())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore36())%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore15())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore37())%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore16())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore38())%></div>
				</div>
			</div>
			<!--영서측면-->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore17())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore39())%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore18())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore40())%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore19())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore41())%></div>
				</div>
			</div>
			<!--삶의조망측면-->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore20())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore42())%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore21())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore43())%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getScore22())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getScore44())%></div>
				</div>
			</div>
			<!--영역-->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black">사전</div>
					<div style="line-height:20px; height: 20px">사후</div>
				</div>
			</div>
			<!--평균-->
			<div style="display: table-cell; ">
				<div style="display: table-cell; width: 40px; height: 40px;border-right: 1px solid black; ">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getAvg1())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getAvg8())%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getAvg2())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getAvg9())%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getAvg3())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getAvg10())%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getAvg4())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getAvg11())%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getAvg5())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getAvg12())%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getAvg6())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getAvg13())%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; ">
					<div style="line-height:20px;  height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(rList.get(i).getAvg7())%></div>
					<div style="line-height:20px; height: 20px"><%=CmmUtil.nvl(rList.get(i).getAvg14())%></div>
				</div>
			</div>
	   </div>
		<%} %>
		<div style="display: table-row;  border: 1px solid black;">
		  	<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;"><br></div>
			<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;"><br></div>
			<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;"><br></div>
			<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;"><br></div>
			<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;"><br></div>
			<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;"><br></div>
			<div style="display: table-cell; width: 60px; height: 40px; border-right: 1px solid black;"><br></div>
			<div style="display: table-cell; width: 60px; height: 40px; border-right: 1px solid black;"><br>통계</div>
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black">사전</div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black">사후</div>
					<div style="line-height:20px; height: 20px">차이값</div>
				</div>
			</div>
			<!--욕구충족  -->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore1())%></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore23())%></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore23())-Double.parseDouble(AvgList.get(0).getScore1()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore2())%></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore24())%></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore24())-Double.parseDouble(AvgList.get(0).getScore2()))*100.0)/100.0%></div>
				</div>
			</div>
			<!--긍정정서  -->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore3())%></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore25())%></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore25())-Double.parseDouble(AvgList.get(0).getScore3()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore4())%></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore26())%></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore26())-Double.parseDouble(AvgList.get(0).getScore4()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore5())%></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore27())%></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore27())-Double.parseDouble(AvgList.get(0).getScore5()))*100.0)/100.0%></div>
				</div>
			</div>
			<!--자기이해  -->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore6())%></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore28())%></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore28())-Double.parseDouble(AvgList.get(0).getScore6()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore7())%></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore29())%></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore29())-Double.parseDouble(AvgList.get(0).getScore7()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore8())%></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore30())%></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore30())-Double.parseDouble(AvgList.get(0).getScore8()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore9())%></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore31())%></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore31())-Double.parseDouble(AvgList.get(0).getScore9()))*100.0)/100.0%></div>
				</div>
			</div>
			<!--마음관리기술 -->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore10())%></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore32())%></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore32())-Double.parseDouble(AvgList.get(0).getScore10()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore11())%></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore33())%></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore33())-Double.parseDouble(AvgList.get(0).getScore11()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore12())%></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore34())%></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore34())-Double.parseDouble(AvgList.get(0).getScore12()))*100.0)/100.0%></div>
				</div>
			</div>
			<!--정서능력측면-->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore13())%></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore35())%></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore35())-Double.parseDouble(AvgList.get(0).getScore13()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore14())%></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore36())%></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore36())-Double.parseDouble(AvgList.get(0).getScore14()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore15())%></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore37())%></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore37())-Double.parseDouble(AvgList.get(0).getScore15()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore16())%></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore38())%></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore38())-Double.parseDouble(AvgList.get(0).getScore16()))*100.0)/100.0%></div>
				</div>
			</div>
			<!--영서측면-->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore17())%></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore39())%></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore39())-Double.parseDouble(AvgList.get(0).getScore17()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore18())%></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore40())%></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore40())-Double.parseDouble(AvgList.get(0).getScore18()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore19())%></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore41())%></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore41())-Double.parseDouble(AvgList.get(0).getScore19()))*100.0)/100.0%></div>
				</div>
			</div>
			<!--삶의조망측면-->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore20())%></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore42())%></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore42())-Double.parseDouble(AvgList.get(0).getScore20()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore21())%></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore43())%></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore43())-Double.parseDouble(AvgList.get(0).getScore21()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore22())%></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=CmmUtil.nvl(AvgList.get(0).getScore44())%></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getScore44())-Double.parseDouble(AvgList.get(0).getScore22()))*100.0)/100.0%></div>
				</div>
			</div>
			<!--영역-->
			<div style="display: table-cell;">
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black">사전</div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black">사후</div>
					<div style="line-height:20px; height: 20px">차이값</div>
				</div>
			</div>
			<!--평균-->
			<div style="display: table-cell; ">
				<div style="display: table-cell; width: 40px; height: 40px;border-right: 1px solid black; ">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getAvg1() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getAvg8() %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getAvg8())-Double.parseDouble(AvgList.get(0).getAvg1()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getAvg2() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getAvg9() %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getAvg9())-Double.parseDouble(AvgList.get(0).getAvg2()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getAvg3() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getAvg10() %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getAvg10())-Double.parseDouble(AvgList.get(0).getAvg3()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getAvg4() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getAvg11() %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getAvg11())-Double.parseDouble(AvgList.get(0).getAvg4()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getAvg5() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getAvg12() %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getAvg12())-Double.parseDouble(AvgList.get(0).getAvg5()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; border-right: 1px solid black;">
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getAvg6() %></div>
					<div style="line-height:20px; height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getAvg13() %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getAvg13())-Double.parseDouble(AvgList.get(0).getAvg6()))*100.0)/100.0%></div>
				</div>
				<div style="display: table-cell; width: 40px; height: 40px; ">
					<div style="line-height:20px;  height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getAvg7() %></div>
					<div style="line-height:20px;  height:20px;   border-bottom: 1px solid black"><%=AvgList.get(0).getAvg14() %></div>
					<div style="line-height:20px; height: 20px"><%=Math.round((Double.parseDouble(AvgList.get(0).getAvg14())-Double.parseDouble(AvgList.get(0).getAvg7()))*100.0)/100.0%></div>
				</div>
			</div>
	   </div>
     </div>
     </div>
</body>
</html>