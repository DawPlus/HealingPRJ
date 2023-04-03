<%@page import="poly.dto.HrvInsertDTO"%>

<%@page import="poly.dto.ExpenseDTO"%>
<%@page import="poly.dto.SearchDTO"%>
<%@page import="poly.dto.ServiceInsertDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="poly.util.CmmUtil" %>
<%@ page import ="poly.dto.ResidenceDTO" %>
<%@ page import ="poly.dto.IncomeDTO" %>
<%@ page import ="poly.dto.BasicInfoDTO" %>
<%@ page import ="java.util.List" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	int[][] partList = (int[][])request.getAttribute("partList");
	int[][] ageList = (int[][])request.getAttribute("ageList");
	int[][] incomeList = (int[][])request.getAttribute("incomeList");
	int[] bizList = (int[])request.getAttribute("bizList");
	List<BasicInfoDTO> roomList = (List<BasicInfoDTO>)request.getAttribute("roomList");
	List<HrvInsertDTO> HrvList = (List<HrvInsertDTO>)request.getAttribute("HrvList");
	List<ServiceInsertDTO> serviceList =(List<ServiceInsertDTO>)request.getAttribute("serviceList");
	double[] ExpenseList = (double[])request.getAttribute("ExpenseList");
	int[] IncomeSumList = (int[])request.getAttribute("IncomeSumList");
	List<String> rlist = (List<String>)request.getAttribute("ProgramEffect");
	double[][] programList = (double[][])request.getAttribute("programList");
	int[][] residenceList = (int[][])request.getAttribute("residenceList");
	int[][] supportList = (int[][])request.getAttribute("supportList");
	int[][] servicetype = (int[][])request.getAttribute("servicetype");
	int[][] peoplecount = (int[][])request.getAttribute("peoplecount");


	int[] operating_progrma = (int[]) request.getAttribute("operating_progrma");
	String openday = (String) request.getAttribute("openday");
	String endday = (String) request.getAttribute("endday");
	int[] sum_1 = new int[3];
	int[] sum_2 = new int[3];
	Double[] sum_3 = new Double[4];
	Double[] sum_4 = new Double[4];
	Double[] sum_5 = new Double[4];
	Double[] sum_6 = new Double[4];
	for (int i = 0; i < 7; i++) {
		sum_1[0] = sum_1[0] + operating_progrma[i * 3];
		sum_1[1] = sum_1[1] + operating_progrma[1 + i * 3];
		sum_1[2] = sum_1[2] + operating_progrma[2 + i * 3];
	}
	for (int i = 0; i < 13; i++) {
		sum_2[0] = sum_2[0] + operating_progrma[i * 3];
		sum_2[1] = sum_2[1] + operating_progrma[1 + i * 3];
		sum_2[2] = sum_2[2] + operating_progrma[2 + i * 3];
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>연·월 통계</title>
	<link href="/lumino/css/bootstrap.min.css" rel="stylesheet">
	<link href="/lumino/css/font-awesome.min.css" rel="stylesheet">
	<link href="/lumino/css/datepicker3.css" rel="stylesheet">
	<link href="/lumino/css/styles.css" rel="stylesheet">
	
	<!--Custom Font-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->



	<!-- 홍두표 - 나눔스퀘어 폰트 불러오기 -->
	<style>
		@import url(https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css);
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
		p {
			font-weight: bolder;
		}
	</style>
	<!-- 홍두표 - 나눔스퀘어 폰트 불러오기 -->


</head>
<body>
	 <!-- 상단 제목 -->
    <div style="width:1000px; height:60px;  border-collapse: collapse;font-size: 10px;">
        <div style="display: table-cell; width :790px;"></div>
        <div style="display: table-cell;">   
            <div style="width: 70px; line-height: 20px;height: 20px; border-top:1px solid black;border-bottom: 1px solid black;border-left: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">담당</div>
            <div style="width: 70px; line-height: 40px;height: 40px; border-bottom: 1px solid black; border-right: 1px solid black;border-left: 1px solid black;text-align: center; " ></div>
        </div> 
        <div style="display: table-cell">   
            <div style="width: 70px; line-height: 20px;height: 20px; border-top:1px solid black;border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">팀장</div>
            <div style="width: 70px; line-height: 40px;height: 40px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center; " ></div>
        </div> 
        <div style="display: table-cell">   
            <div style="width: 70px; line-height: 20px;height: 20px; border-top:1px solid black;border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">사무국장</div>
            <div style="width: 70px; line-height: 40px;height: 40px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center; " ></div>
        </div> 
    </div>
    <div style="width:1000px; height:40px;text-align: center;"><h3>하이힐링원 연*월 프로그램 실시 결과 보고</h3></div>
    <div style="width:1000px; height:20px;">
        <div style="display: table-cell;">
            <div style="display: table-cell;width: 200px; line-height: 30px;height: 20px;  "></div>
            <div style="display: table-cell;width: 200px; line-height: 30px;height: 20px;  "></div>
            <div style="display: table-cell;width: 200px; line-height: 30px;height: 20px;  "></div>
            <div style="display: table-cell;width: 200px; line-height: 30px;height: 20px;  "></div>
            <div style="display: table-cell;width: 200px; line-height: 30px;height: 20px; font-size: 8px;  ">기간 : &nbsp;&nbsp; &nbsp;<%=openday%>&nbsp; ~&nbsp; <%=endday %></div>
        </div>
    </div>
    <!-- 참가유형 -->
    <div style=" display:table inline-block; padding:10px; border-collapse: collapse; font-size: 10px;text-align: center; vertical-align: middle; ">
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 50px; line-height: 60px;height: 60px; text-align: center; background-color: #ccc !important;">참가유형</div>
            <div style=" border-bottom:1px solid black; width:50px; line-height: 30px;height: 30px; text-align: center;background-color: #ccc !important;">유형(건)</div>
            <div style=" width:50px; line-height: 30px;height: 30px; text-align: center;background-color: #ccc !important;">인원(수)</div>
        </div>
        <div style="display: table-cell; border:1px solid black; width:255px; height: 120px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:255px; line-height: 30px; height: 30px; text-align: center; background-color: #ccc !important;">연령대</div>
                <div style="display: table-cell">   
                    <div style="width: 50px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">아동</div>
                    <div style="width: 50px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center; " ><%=ageList[0][0] %></div>
                    <div style="width: 50px; line-height: 30px;height: 30px; border-right: 1px solid black; text-align: center;"><%=ageList[1][0] %></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">청소년</div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center; " ><%=ageList[0][1] %></div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-right: 1px solid black; text-align: center;"><%=ageList[1][1] %></div>
                </div> 
                <div style="display: table-cell; vertical-align: middle;">   
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">성인</div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center;"><%=ageList[0][2] %></div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-right: 1px solid black; text-align: center;"><%=ageList[1][2] %></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 52px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">노인</div>
                    <div style="width: 52px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center;"><%=ageList[0][3] %></div>
                    <div style="width: 52px; line-height: 30px;height: 30px; border-right: 1px solid black; text-align: center;"><%=ageList[1][3] %></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black;  text-align: center; background-color: #ccc !important;">계</div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black;text-align: center;"><%=ageList[0][4] %></div>
                    <div style="width: 51px; line-height: 30px;height: 30px; text-align: center;"><%=ageList[1][4] %></div>
                </div> 
              </div>  
         <div style="display: table-cell; border:1px solid black; width:304px; height: 120px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:304x; line-height: 30px; height: 30px; text-align: center; background-color: #ccc !important;">참가자 유형</div>
                <div style="display: table-cell">   
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">장애인</div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center;"><%=partList[0][0] %></div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-right: 1px solid black; text-align: center;"><%=partList[1][0]%></div>
                </div> 

                <div style="display: table-cell">   
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">저소득층</div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center;"><%=partList[0][1] %></div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-right: 1px solid black; text-align: center;"><%=partList[1][1]%></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">가족</div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center;"><%=partList[0][2] %></div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-right: 1px solid black; text-align: center;"><%=partList[1][2]%></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 50px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">중독</div>
                    <div style="width: 50px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center;"><%=partList[0][3] %></div>
                    <div style="width: 50px; line-height: 30px;height: 30px; border-right: 1px solid black; text-align: center;"><%=partList[1][3]%></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">교직원</div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center;"><%=partList[0][4] %></div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-right: 1px solid black; text-align: center;"><%=partList[1][4]%></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">기타</div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center;"><%=partList[0][5] %></div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-right: 1px solid black; text-align: center;"><%=partList[1][5]%></div>
                </div> 

                <div style="display: table-cell">   
                    <div style="width: 50px; line-height: 30px;height: 30px; border-bottom: 1px solid black;  text-align: center; background-color: #ccc !important;">계</div>
                    <div style="width: 50px; line-height: 30px;height: 30px; border-bottom: 1px solid black; text-align: center;"><%=partList[0][6] %></div>
                    <div style="width: 50px; line-height: 30px;height: 30px;  text-align: center;"><%=partList[1][6]%></div>
                </div> 
                
            </div>
            <div style="display: table-cell; border:1px solid black; width:204px; height: 120px; text-align: center;">
                <div style=" border-bottom:1px solid black; width:204px;line-height: 30px; height: 30px; text-align: center; background-color: #ccc !important;"> 수입구분</div>
                <div style="display: table-cell">   
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">녹색자금</div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center;"><%=incomeList[0][0] %></div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-right: 1px solid black; text-align: center;"><%=incomeList[1][0] %></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">바우처</div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center;"><%=incomeList[0][1] %></div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-right: 1px solid black; text-align: center;"><%=incomeList[1][1] %></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">기타</div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center;"><%=incomeList[0][2] %></div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-right: 1px solid black; text-align: center;"><%=incomeList[1][2] %></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black;  text-align: center; background-color: #ccc !important;">계</div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; text-align: center;"><%=incomeList[0][3] %></div>
                    <div style="width: 51px; line-height: 30px;height: 30px;  text-align: center;"><%=incomeList[1][3] %></div>
                </div> 
             </div>
             <div style="display: table-cell; border:1px solid black; width:152px; height: 120px; text-align: center;">
                <div style=" border-bottom:1px solid black; width:152px;line-height: 30px; height: 30px; text-align: center; background-color: #ccc !important;"> 사업목적</div>
                <div style="display: table-cell">   
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">사회공헌</div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center;"><%=bizList[0]%></div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-right: 1px solid black; text-align: center;"><%=bizList[3] %></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">수익사업</div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center;"><%=bizList[1] %></div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-right: 1px solid black; text-align: center;"><%=bizList[4] %></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 50px; line-height: 30px;height: 30px; border-bottom: 1px solid black; text-align: center; background-color: #ccc !important;">계</div>
                    <div style="width: 50px; line-height: 30px;height: 30px; border-bottom: 1px solid black; text-align: center;"><%=bizList[2] %></div>
                    <div style="width: 50px; line-height: 30px;height: 30px;  text-align: center;"><%=bizList[5] %></div>
                </div> 
            </div>
    </div>
    
    
    <!-- 지역  -->
  <% String[] list_1 = {"서울","부산","대구","인천","대전","광주","울산","경기","강원","폐광지역","충북","충남","세종","경북","경남","전북","전남","제주"}; %> 
     <!-- 지역구분 -->
     <div style=" display:table inline-block; padding:10px; border-collapse: collapse; font-size: 10px;text-align: center; ">
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 50px; line-height: 30px;height: 30px; text-align: center; background-color: #ccc !important;">지역</div>
            <div style=" border-bottom:1px solid black; width:50px; line-height: 30px;height: 30px; text-align: center;background-color: #ccc !important;">유형(건)</div>
            <div style=" width:50px; line-height: 30px;height: 30px; text-align: center;background-color: #ccc !important;">인원(수)</div>
        </div>
     <%for (int i =0; i<list_1.length;i++) { %>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 50px; line-height: 30px;height: 30px; text-align: center; background-color: #ccc !important;"><%=list_1[i] %></div>
            <div style=" border-bottom:1px solid black; width:50px; line-height: 30px;height: 30px; text-align: center;"><%=residenceList[0][i] %></div>
            <div style=" width:50px; line-height: 30px;height: 30px; text-align: center;"> <%=residenceList[1][i] %> </div>
        </div>
      <%} %>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle;" >
            <div style=" border-bottom:1px solid black;width:50px; line-height: 30px;height: 30px; text-align: center;background-color: #ccc !important;">계</div>
            <div style=" border-bottom:1px solid black;width:50px; line-height: 30px;height: 30px; text-align: center;"><%=residenceList[0][18] %></div>
            <div style=" width:50px; line-height: 30px;height: 30px; text-align: center;"><%=residenceList[1][18] %></div>
        </div>
       </div>
    
    
    <!--프로그램 시행개요 -->
    <div style=" display:table inline-block; padding:10px; border-collapse: collapse; font-size: 10px;text-align: center; ">
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 240px; vertical-align: middle;background-color: #ccc !important;">프로그램 <br>시행개요</div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 240px; ">
            <div style=" display: table-cell;border-bottom:1px solid black; width: 50px; height: 90px; vertical-align: middle; background-color: #ccc !important; ">구분</div>
            <div style=" border-bottom:1px solid black; width:50px; height: 30px;background-color: #ccc !important; ">
            	<p style="transform: translateY(7px);">수익사업</p>
            </div>
			<div style="border-bottom: 1px solid black; width: 50px; height: 30px; background-color: #ccc !important;">
				<p style="transform: translateY(7px);">사회공헌</p>
			</div>
			<div style="border-bottom: 1px solid black; width: 50px; height: 30px; background-color: #ccc !important;">
				<p style="transform: translateY(7px);">계</p>
			</div>
			<div style=" display: table-cell; width:50px; height: 60px; vertical-align: middle;background-color: #ccc !important; ">
				<p style="transform: translateY(7px);">객실배정</p>
			</div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 408px; height: 120px; vertical-align: middle;" >
            <div style="display: table-cell; border-bottom:1px solid black; width: 408px; height: 30px; background-color: #ccc !important;">
            	<p style="transform: translateY(7px);">참여인원(명)</p>
            </div>
            <div style="display: table;  width: 300px; height: 30px; ">
                <div style="display: table-cell; width :152px; height: 90px;">
                    <div style=" border-bottom:1px solid black; width:153px; height: 30px; border-right: 1px solid black;text-align: center; background-color: #ccc !important;"> 
                  		 <p style="transform: translateY(7px);">참여자(명)</p>
                    </div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 30px; border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">
                         	<p style="transform: translateY(7px);">남</p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=peoplecount[0][0] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=peoplecount[1][0] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=peoplecount[2][0] %></p>
                         </div>
                    </div> 
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 30px; border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">
                         	<p style="transform: translateY(7px);">여</p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=peoplecount[0][1] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=peoplecount[1][1] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=peoplecount[2][1] %></p>
                         </div>
                    </div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 30px; border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">
                         	<p style="transform: translateY(7px);">계</p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=peoplecount[0][2] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=peoplecount[1][2] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=peoplecount[2][2] %></p>
                         </div>
                    </div>
                </div>
                <div style="display: table-cell; width :152px; height: 90px;">
                    <div style=" border-bottom:1px solid black; width:153px; height: 30px; border-right: 1px solid black;text-align: center; background-color: #ccc !important;">
                    	<p style="transform: translateY(7px);">인솔자(명)</p>
                    </div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 30px; border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">
                         	<p style="transform: translateY(7px);">남</p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=peoplecount[0][3] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=peoplecount[1][3] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=peoplecount[2][3] %></p>
                         </div>
                    </div> 
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 30px; border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">
                         	<p style="transform: translateY(7px);">여</p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=peoplecount[0][4] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=peoplecount[1][4] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=peoplecount[2][4] %></p>
                         </div>
                    </div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 30px; border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">
                         	<p style="transform: translateY(7px);">남</p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=peoplecount[0][5] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=peoplecount[1][5] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=peoplecount[2][5] %></p>
                         </div>
                    </div>
                </div>
                <div style="display: table-cell; width :101px; height: 90px;">
                    <div style="display: table-cell">   
                         <div style=" display: table-;width: 51px; height: 60px; border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;background-color: #ccc !important;">
	                     	  <p style="transform: translateY(20px);">실인원</p>
                     	 </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
	                     	  <p style="transform: translateY(7px);"><%=peoplecount[0][6] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
	                     	  <p style="transform: translateY(7px);"> <%=peoplecount[1][6]%></p>
                      	  
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
	                     	  <p style="transform: translateY(7px);"><%=peoplecount[2][6] %></p>
                         </div>
                    </div> 
                    <div style="display: table-cell;">   
                        <div style=" display: table-cell;width: 51px; height: 59px; border-bottom: 1px solid black; text-align: center; background-color: #ccc !important; ">
                     	  <p style="transform: translateY(20px);">연인원</p>
                        </div>
                        <div style="border-bottom:1px solid black;width: 51px; height: 30px;  text-align: center;">
                     	 	 <p style="transform: translateY(7px);"><%=peoplecount[0][7] %></p>
                        </div>
                         <div style="border-bottom:1px solid black;width: 51px; height: 30px;  text-align: center;">
                     	  	<p style="transform: translateY(7px);"><%=peoplecount[1][7] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;width: 51px; height: 30px;  text-align: center;">
	                     	  <p style="transform: translateY(7px);"><%=peoplecount[2][7] %></p>
                         </div>
                    </div> 
                </div>
                </div>
                <div style="display: table-cell; width: 400px; height: 60px; ">
                    <div style="display:table-row">
                        <div style="border-right: 1px solid black; width:51px;height: 60px; background-color: #ccc !important;">
                        	<p style="transform: translateY(20px);">인원(명)</p>
                        </div>
                        <div style="display: table-cell;">
                            <div style="border-bottom:1px solid black;border-right: 1px solid black; width:51px;height: 30px;background-color: #ccc !important;">
                            	<p style="transform: translateY(7px);">참여자</p>
                            </div>
                            <div style="border-right: 1px solid black; width:51px;height: 30px;">
                            	<p style="transform: translateY(7px);"><%=roomList.get(0).getRoom_part_people() %></p>
                            </div>
                        </div>
                        <div style="display: table-cell;">
                            <div style="border-bottom:1px solid black;border-right: 1px solid black; width:51px;height: 30px;background-color: #ccc !important;">
                            	<p style="transform: translateY(7px);">인솔자</p>
                            </div>
                            <div style="border-right: 1px solid black; width:51px;height: 30px;">
                            	<p style="transform: translateY(7px);"><%=roomList.get(0).getRoom_lead_people() %></p>
                            </div>
                        </div>
                        <div style="display: table-cell;">
                            <div style="border-bottom:1px solid black;border-right: 1px solid black; width:51px;height: 30px;background-color: #ccc !important;">
                            	<p style="transform: translateY(7px);">기타</p>
                            </div>
                            <div style="border-right: 1px solid black; width:51px;height: 30px;">
                            	<p style="transform: translateY(7px);"><%=roomList.get(0).getRoom_etc_people() %></p>
                            </div>
                        </div>
                        <div style="display: table-cell; border-right: 1px solid black;">
                            <div style="border-bottom:1px solid black; width:101px;height: 30px;background-color: #ccc !important;">
                            	<p style="transform: translateY(7px);">계</p>
                            </div>
                            <div style=" width:101px;height: 30px;">
                            	<p style="transform: translateY(7px);"><%=Integer.parseInt(roomList.get(0).getRoom_part_people())+Integer.parseInt(roomList.get(0).getRoom_lead_people())+Integer.parseInt(roomList.get(0).getRoom_etc_people())%></p>
                            </div>
                        </div>
                        <div style="border-right: 1px solid black; width:51px;height: 60px;background-color: #ccc !important;">
                        	<p style="transform: translateY(20px);">객실(실)</p>
                        </div>
                        <div style="display: table-cell;">
                            <div style="border-bottom:1px solid black; width:51px;height: 30px;background-color: #ccc !important;">
                            	<p style="transform: translateY(7px);">참여자</p>
                            </div>
                            <div style=" width:50px;height: 30px;">
                           		<p style="transform: translateY(7px);"><%=roomList.get(0).getRoom_part_room() %></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <div style="display: table-cell; border:1px solid black; width: 203px; height: 120px; vertical-align: middle;" >
            <div style="display: table-cell; border-bottom:1px solid black; width: 204px; height: 30px; background-color: #ccc !important; ">
            	<p style="transform: translateY(7px);">지원사항</p>
            </div>
            <div style="display: table;  width: 204px; height: 30px; ">
                <div style="display: table-cell; width :152px; height: 90px;">
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 60px; border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;background-color: #ccc !important;">
                         	<p style="transform: translateY(20px);">프로그램</p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=supportList[0][0] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=supportList[1][0] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=supportList[2][0] %></p>
                         </div>
                    </div> 
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 60px; border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;background-color: #ccc !important;">
                         	<p style="transform: translateY(20px);">숙박</p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=supportList[0][1] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=supportList[1][1] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=supportList[2][1] %></p>
                         </div>
                    </div> 
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 60px; border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;background-color: #ccc !important;">
                         	<p style="transform: translateY(20px);">식사</p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=supportList[0][2] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=supportList[1][2] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=supportList[2][2] %></p>
                         </div>
                    </div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 60px; border-bottom: 1px solid black; border-left: 1px solid blac; text-align: center;background-color: #ccc !important;">
                         	<p style="transform: translateY(20px);">기타</p>
                         </div>
                         <div style="border-bottom:1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=supportList[0][3] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=supportList[1][3] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%=supportList[2][3] %></p>
                         </div>
                    </div>
                </div>
                </div>
                <div style="display: table-cell; width: 204px; height: 60px; ">
                    <div style="display:table-row">
                        <div style="display: table-cell;">
                            <div style="border-bottom:1px solid black;border-right: 1px solid black; width:51px;height: 30px;background-color: #ccc !important;">
                            	<p style="transform: translateY(7px);">인솔자</p>
                            </div>
                            <div style="border-right: 1px solid black; width:51px;height: 30px;">
                            	<p style="transform: translateY(7px);"><%=roomList.get(0).getRoom_lead_room() %></p>
                            </div>
                        </div>
                        <div style="display: table-cell;">
                            <div style="border-bottom:1px solid black;border-right: 1px solid black; width:51px;height: 30px;background-color: #ccc !important;">
                            	<p style="transform: translateY(7px);">기타</p>
                            </div>
                            <div style="border-right: 1px solid black; width:51px;height: 30px;">
                            	<p style="transform: translateY(7px);"><%=roomList.get(0).getRoom_etc_room() %></p>
                            </div>
                        </div>
                        <div style="display: table-cell;">
                            <div style="border-bottom:1px solid black; width:102px;height: 30px;background-color: #ccc !important;">
                            	<p style="transform: translateY(7px);">계</p>
                            </div>
                            <div style=" width:101px;height: 30px;">
                            	<p style="transform: translateY(7px);"><%=Integer.parseInt(roomList.get(0).getRoom_part_room())+Integer.parseInt(roomList.get(0).getRoom_lead_room())+Integer.parseInt(roomList.get(0).getRoom_etc_room())%></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <div style="display: table-cell; border:1px solid black; width: 306px; height: 120px; vertical-align: middle;" >
            <div style="display: table-cell; border-bottom:1px solid black; width: 306px; height: 30px; background-color: #ccc !important;">
           		 <p style="transform: translateY(7px);">서비스 유형</p>
            </div>
            <div style="display: table;  width: 200px; height: 30px; ">
                <div style="display: table-cell; width :150px; height: 90px;">
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 60px; border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;background-color: #ccc !important;">
                         	<p style="transform: translateY(20px);">산림교육</p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%= servicetype[0][0] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%= servicetype[1][0] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%= servicetype[2][0] %></p>
                         </div>
                    </div> 
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 60px; border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;background-color: #ccc !important;">
                         	<p style="transform: translateY(20px);">산림치유</p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%= servicetype[0][1] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%= servicetype[1][1] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%= servicetype[2][1] %></p>
                         </div>
                    </div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 60px; border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;background-color: #ccc !important;">
                         	<p style="transform: translateY(20px);">중독치유</p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%= servicetype[0][2] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%= servicetype[1][2] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%= servicetype[2][2] %></p>
                         </div>
                    </div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 60px; border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;background-color: #ccc !important;">
                         	<p style="transform: translateY(20px);">중독예방</p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%= servicetype[0][3] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%= servicetype[1][3] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%= servicetype[2][3] %></p>
                         </div>
                    </div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 60px; border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;background-color: #ccc !important;">
                         	<p style="transform: translateY(20px);">힐링</p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%= servicetype[0][4] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%= servicetype[1][4] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;border-right: 1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%= servicetype[2][4] %></p>
                         </div>
                    </div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 60px; border-bottom: 1px solid black; border-left: 1px solid blac; text-align: center;background-color: #ccc !important;">
                         	<p style="transform: translateY(20px);">기타</p>
                         </div>
                         <div style="border-bottom:1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%= servicetype[0][5] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%= servicetype[1][5] %></p>
                         </div>
                         <div style="border-bottom:1px solid black;width: 51px; height: 30px;  text-align: center;">
                         	<p style="transform: translateY(7px);"><%= servicetype[2][5] %></p>
                         </div>
                    </div>
                </div>
                </div>
                <div style="display: table-cell; width: 300px; height: 60px; ">
                    <div style="display:table-row">
                        <div style="border-right: 1px solid black; width:51px;height: 60px;background-color: #ccc !important;">
                        	<p style="transform: translateY(20px);">식사</p>
                        </div>
                        <div style="display: table-cell;">
                            <div style="border-bottom:1px solid black;border-right: 1px solid black; width:51px;height: 30px;background-color: #ccc !important;">
                            	<p style="transform: translateY(7px);">참여자</p>
                            </div>
                            <div style="border-right: 1px solid black; width:51px;height: 30px;">
                            	<p style="transform: translateY(7px);"><%= roomList.get(0).getMeal_part() %></p>
                            </div>
                        </div>
                        <div style="display: table-cell;">
                            <div style="border-bottom:1px solid black;border-right: 1px solid black; width:51px;height: 30px;background-color: #ccc !important;">
                            	<p style="transform: translateY(7px);">인솔자</p>
                            </div>
                            <div style="border-right: 1px solid black; width:51px;height: 30px;">
                            	<p style="transform: translateY(7px);"><%= roomList.get(0).getMeal_lead() %></p>
                            </div>
                        </div>
                        <div style="display: table-cell;">
                            <div style="border-bottom:1px solid black;border-right: 1px solid black; width:51px;height: 30px;background-color: #ccc !important;">
                            	<p style="transform: translateY(7px);">기타</p>
                            </div>
                            <div style="border-right: 1px solid black; width:51px;height: 30px;">
                            	<p style="transform: translateY(7px);"><%= roomList.get(0).getMeal_etc() %></p>
                            </div>
                        </div>
                        <div style="display: table-cell;">
                            <div style="border-bottom:1px solid black; width:101px;height: 30px;background-color: #ccc !important;">
                            	<p style="transform: translateY(7px);">계</p>
                            </div>
                            <div style=" width:101px;height: 30px;">
                            	<p style="transform: translateY(7px);"><%=Integer.parseInt(roomList.get(0).getMeal_part())+Integer.parseInt(roomList.get(0).getMeal_lead())+Integer.parseInt(roomList.get(0).getMeal_etc())%></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
    
    <!-- 프로그램 운영 및 만족도 -->
    <% String[] list_2 = {"산림교육","행위중독예방","산림치유","아트","릴렉싱","에너제틱","쿠킹"}; %>
    <div style=" display:table inline-block; padding:10px; border-collapse: collapse; font-size: 10px;text-align: center; ">
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 240px; vertical-align: middle; background-color: #ccc;">
            <div style=" display: flex;align-items: center;justify-content: center;border-bottom:1px solid black; width: 50px; height: 120px; text-align: center; background-color: #ccc !important;">프로그램 <br> 운영</div>
            <div style="display: flex;align-items: center;justify-content: center; width:50px; height: 120px; text-align: center; background-color: #ccc !important;">프로그램<br>만족도 </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 50px; line-height: 30px;height: 30px; text-align: center; background-color: #ccc !important;">구분</div>
            <div style=" border-bottom:1px solid black; width:50px; height: 30px; text-align: center;"> 프로그램(개)</div>
            <div style=" border-bottom:1px solid black; width:50px; ;height: 30px; text-align: center;"> 내부강사(명)</div>
            <div style=" border-bottom:1px solid black; width:50px; height: 30px; text-align: center;"> 외부강사(명)</div>
            <div style=" border-bottom:1px solid black; width:50px; line-height: 30px;height: 30px; text-align: center;"> 강사</div>
            <div style=" border-bottom:1px solid black; width:50px; line-height: 30px;height: 30px; text-align: center;"> 내용구성</div>
            <div style=" border-bottom:1px solid black; width:50px; line-height: 30px;height: 30px; text-align: center;">효과성 </div>
            <div style=" width:50px; line-height: 30px;height: 30px; text-align: center;">평균</div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 101px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 100px; line-height: 30px;height: 30px; text-align: center;background-color: #ccc !important; ">산림교육</div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[0] %></div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[1] %></div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[2] %></div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=programList[0][0] %> </div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=programList[1][0] %> </div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"> <%=programList[2][0] %></div>
            <div style=" width:100px; line-height: 30px;height: 30px; text-align: center;"><%=programList[3][0] %> </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 101px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 100px; line-height: 30px;height: 30px; text-align: center;background-color: #ccc !important; ">예방교육</div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[3] %></div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[4] %></div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[5] %></div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=programList[0][1] %> </div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=programList[1][1] %> </div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=programList[2][1] %> </div>
            <div style=" width:100px; line-height: 30px;height: 30px; text-align: center;"> <%=programList[3][1] %></div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 101px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 100px; line-height: 30px;height: 30px; text-align: center;background-color: #ccc !important; ">산림치유</div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[6] %></div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[7] %></div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[8] %></div>
             <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=programList[0][2] %> </div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=programList[1][2] %> </div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=programList[2][2] %> </div>
            <div style=" width:100px; line-height: 30px;height: 30px; text-align: center;"> <%=programList[3][2] %></div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 103px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 103px; line-height: 30px;height: 30px; text-align: center;background-color: #ccc !important; ">아트</div>
            <div style=" border-bottom:1px solid black; width:103px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[9] %></div>
            <div style=" border-bottom:1px solid black; width:103px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[10] %></div>
            <div style=" border-bottom:1px solid black; width:103px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[11] %></div>
             <div style=" border-bottom:1px solid black; width:103px; line-height: 30px;height: 30px; text-align: center;"><%=programList[0][3] %> </div>
            <div style=" border-bottom:1px solid black; width:103px; line-height: 30px;height: 30px; text-align: center;"><%=programList[1][3] %> </div>
            <div style=" border-bottom:1px solid black; width:103px; line-height: 30px;height: 30px; text-align: center;"><%=programList[2][3] %> </div>
            <div style=" width:103px; line-height: 30px;height: 30px; text-align: center;"> <%=programList[3][3] %></div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 102px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 102px; line-height: 30px;height: 30px; text-align: center;background-color: #ccc !important; ">릴렉싱</div>
            <div style=" border-bottom:1px solid black; width:102px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[12] %></div>
            <div style=" border-bottom:1px solid black; width:102px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[13] %></div>
            <div style=" border-bottom:1px solid black; width:102px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[14] %></div>
             <div style=" border-bottom:1px solid black; width:102px; line-height: 30px;height: 30px; text-align: center;"><%=programList[0][4] %> </div>
            <div style=" border-bottom:1px solid black; width:102px; line-height: 30px;height: 30px; text-align: center;"><%=programList[1][4] %> </div>
            <div style=" border-bottom:1px solid black; width:102px; line-height: 30px;height: 30px; text-align: center;"><%=programList[2][4] %> </div>
            <div style=" width:100px; line-height: 30px;height: 30px; text-align: center;"> <%=programList[3][4] %></div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 101px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 101px; line-height: 30px;height: 30px; text-align: center;background-color: #ccc !important; ">에너제틱</div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[15] %></div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[16] %></div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[17] %></div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=programList[0][5] %> </div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=programList[1][5] %> </div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=programList[2][5] %> </div>
            <div style=" width:100px; line-height: 30px;height: 30px; text-align: center;"> <%=programList[3][5] %></div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 101px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 101px; line-height: 30px;height: 30px; text-align: center;background-color: #ccc !important; ">쿠킹</div>
            <div style=" border-bottom:1px solid black; width:101px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[18] %></div>
            <div style=" border-bottom:1px solid black; width:101px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[19] %></div>
            <div style=" border-bottom:1px solid black; width:101px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[20] %></div>
             <div style=" border-bottom:1px solid black; width:101px; line-height: 30px;height: 30px; text-align: center;"><%=programList[0][6] %> </div>
            <div style=" border-bottom:1px solid black; width:101px; line-height: 30px;height: 30px; text-align: center;"><%=programList[1][6] %> </div>
            <div style=" border-bottom:1px solid black; width:101px; line-height: 30px;height: 30px; text-align: center;"><%=programList[2][6] %> </div>
            <div style=" width:101px; line-height: 30px;height: 30px; text-align: center;"> <%=programList[3][6] %></div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 101px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 101px; line-height: 30px;height: 30px; text-align: center;background-color: #ccc !important; ">이벤트</div>
            <div style=" border-bottom:1px solid black; width:101px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[18] %></div>
            <div style=" border-bottom:1px solid black; width:101px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[19] %></div>
            <div style=" border-bottom:1px solid black; width:101px; line-height: 30px;height: 30px; text-align: center;"><%=operating_progrma[20] %></div>
             <div style=" border-bottom:1px solid black; width:101px; line-height: 30px;height: 30px; text-align: center;"><%=programList[0][7] %> </div>
            <div style=" border-bottom:1px solid black; width:101px; line-height: 30px;height: 30px; text-align: center;"><%=programList[1][7] %> </div>
            <div style=" border-bottom:1px solid black; width:101px; line-height: 30px;height: 30px; text-align: center;"><%=programList[2][7] %> </div>
            <div style=" width:101px; line-height: 30px;height: 30px; text-align: center;"> <%=programList[3][8] %></div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 103px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 103px; line-height: 30px;height: 30px; text-align: center; background-color: #ccc !important;">합계/평균</div>
            <div style=" border-bottom:1px solid black; width:103px; line-height: 30px;height: 30px; text-align: center;"><%=sum_2[0] %> </div>
            <div style=" border-bottom:1px solid black; width:103px; line-height: 30px;height: 30px; text-align: center;"><%=sum_2[1] %> </div>
            <div style=" border-bottom:1px solid black; width:103px; line-height: 30px;height: 30px; text-align: center;"><%=sum_2[2] %> </div>
             <div style=" border-bottom:1px solid black; width:103px; line-height: 30px;height: 30px; text-align: center;"><%=programList[0][8] %> </div>
            <div style=" border-bottom:1px solid black; width:103px; line-height: 30px;height: 30px; text-align: center;"><%=programList[1][8] %> </div>
            <div style=" border-bottom:1px solid black; width:103px; line-height: 30px;height: 30px; text-align: center;"><%=programList[2][8] %> </div>
            <div style=" width:103px; line-height: 30px;height: 30px; text-align: center;"> <%=programList[3][8] %></div>
        </div>
    </div>
    
    <!-- 시설 서비스 만족도 -->
    <div style=" display:table inline-block; padding:10px; border-collapse: collapse; font-size: 10px;text-align: center; vertical-align: middle; ">
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle; background-color: #ccc !important;">시설<br>서비스<br>만족도</div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle; background-color: #ccc !important;">구분</div>
        
        <div style="display: table-cell; border:1px solid black; width:102px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:102px; height: 30px;line-height:30px;  text-align: center; background-color: #ccc !important;"> 숙소</div>
            <div style="display: table-cell">   
                <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">편리성</div>
                <div style="width: 51px; height: 30px;line-height:30px;  border-right: 1px solid black; text-align: center;"><%=serviceList.get(0).getScore1() %></div>
            </div> 
            <div style="display: table-cell; vertical-align: middle;">   
                <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black;  text-align: center; background-color: #ccc !important;">청결도</div>
                <div style="width: 51px; height: 30px;line-height:30px;   text-align: center;"><%=serviceList.get(0).getScore2() %></div>
            </div> 
        </div>   
        <div style="display: table-cell; border:1px solid black; width:101px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:101px; height: 30px;line-height:30px;  text-align: center; background-color: #ccc !important;"> 식당</div>
            <div style="display: table-cell">   
                <div style="width: 50px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">편리성</div>
                <div style="width: 50px; height: 30px;line-height:30px;  border-right: 1px solid black; text-align: center;"><%=serviceList.get(0).getScore3() %></div>
            </div> 
            <div style="display: table-cell; vertical-align: middle;">   
                <div style="width: 51px; height: 30px; line-height:30px; border-bottom: 1px solid black;  text-align: center; background-color: #ccc !important;">청결도</div>
                <div style="width: 51px; height: 30px;line-height:30px;  text-align: center;"><%=serviceList.get(0).getScore4() %></div>
            </div> 
        </div> 
        <div style="display: table-cell; border:1px solid black; width:152px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:152px; height: 30px;line-height:30px;  text-align: center; background-color: #ccc !important;"> 프로그램 장소</div>
            <div style="display: table-cell">   
                <div style="width: 50px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">편리성</div>
                <div style="width: 50px; height:30px; line-height:30px;  border-right: 1px solid black; text-align: center;"><%=serviceList.get(0).getScore5() %></div>
            </div> 
            <div style="display: table-cell; vertical-align: middle;">   
                <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">청결도</div>
                <div style="width: 51px; height: 30px;line-height:30px;  border-right: 1px solid black; text-align: center;"><%=serviceList.get(0).getScore6() %></div>
            </div> 
            <div style="display: table-cell; vertical-align: middle;">   
                <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black;  text-align: center; background-color: #ccc !important;">적절성</div>
                <div style="width: 51px; height: 30px;line-height:30px;    text-align: center;"><%=serviceList.get(0).getScore7() %></div>
            </div> 
        </div> 
        <div style="display: table-cell; border:1px solid black; width:152px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:152x; height: 30px;line-height:30px;  text-align: center; background-color: #ccc !important;"> 숲(야외)</div>
            <div style="display: table-cell">   
                <div style="width: 50px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">편리성</div>
                <div style="width: 50px; height: 30px;line-height:30px;  border-right: 1px solid black; text-align: center;"><%=serviceList.get(0).getScore8() %></div>
            </div> 
            <div style="display: table-cell; vertical-align: middle;">   
                <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">청결도</div>
                <div style="width: 51px; height: 30px;line-height:30px;  border-right: 1px solid black;  text-align: center;"><%=serviceList.get(0).getScore9() %></div>
            </div> 
            <div style="display: table-cell; vertical-align: middle;">   
                <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black;  text-align: center; background-color: #ccc !important;">적절성</div>
                <div style="width: 51px; height: 30px; line-height:30px;  text-align: center;"><%=serviceList.get(0).getScore10() %></div>
            </div> 
        </div> 
        <div style="display: table-cell; border:1px solid black; width:152px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:152px; height: 30px;line-height:30px;  text-align: center; background-color: #ccc !important;"> 운영</div>
            <div style="display: table-cell">   
                <div style="width: 50px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">운영방식</div>
                <div style="width: 50px; height: 30px;line-height:30px;  border-right: 1px solid black; text-align: center;"><%=serviceList.get(0).getScore11() %></div>
            </div> 
            <div style="display: table-cell; vertical-align: middle;">   
                <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">시간편성</div>
                <div style="width: 51px; height: 30px; line-height:30px; border-right: 1px solid black; text-align: center;"><%=serviceList.get(0).getScore12() %></div>
            </div> 
            <div style="display: table-cell; vertical-align: middle;">   
                <div style="width: 51px; height: 30px; line-height:30px; border-bottom: 1px solid black;  text-align: center; background-color: #ccc !important;">직원친절</div>
                <div style="width: 51px; height: 30px; line-height:30px;  text-align: center;"><%=serviceList.get(0).getScore13() %></div>
            </div> 
        </div> 
        <div style="display: table-cell; border:1px solid black; width:152px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:152px; height: 30px; line-height:30px; text-align: center; background-color: #ccc !important;"> 식사</div>
            <div style="display: table-cell">   
                <div style="width: 50px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">신선도</div>
                <div style="width: 50px; height: 30px; line-height:30px; border-right: 1px solid black; text-align: center;"><%=serviceList.get(0).getScore14() %></div>
            </div> 
            <div style="display: table-cell; vertical-align: middle;">   
                <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">다양성</div>
                <div style="width: 51px; height: 30px; line-height:30px; border-right: 1px solid black; text-align: center;"><%=serviceList.get(0).getScore15() %></div>
            </div> 
            <div style="display: table-cell; vertical-align: middle;">   
                <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black;  text-align: center; background-color: #ccc !important;">영양</div>
                <div style="width: 51px; height: 30px;line-height:30px;   text-align: center;"><%=serviceList.get(0).getScore16() %></div>
            </div> 
        </div> 
        <div style="display: table-cell; border:1px solid black; width:101px; height: 90px; text-align: center;">
            <div style=" display: table-cell; border-bottom:1px solid black; width:101px;height: 59px;line-height:30px;  text-align: center; background-color: #ccc !important; "> 평균</div>
            <div style="width: 101px; height: 30px;line-height:30px;   text-align: center;"><%=serviceList.get(0).getAvg() %></div> 
        </div> 
    </div>
    
    <!-- 효과성 분석 -->
    <div style=" display:table inline-block; padding:10px; border-collapse: collapse; font-size: 10px;text-align: center; vertical-align: middle; ">
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 120px; vertical-align: middle; background-color: #ccc !important;">효과성<br>분석</div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 120px; vertical-align: middle;" >
            <div style=" display: table;border-bottom:1px solid black; width:50px; line-height:60px;height: 60px; text-align: center; vertical-align: middle;background-color: #ccc !important; ">구분</div>
            <div style=" border-bottom:1px solid black; width:50px; line-height:30px; height: 30px; text-align: center; background-color: #ccc !important;"> 사전</div>
            <div style=" width:50px; line-height:30px;height: 30px; text-align: center; background-color: #ccc !important;"> 사후</div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 306px; height: 120px; vertical-align: middle;" >
            <div style="display: table-cell; border-bottom:1px solid black; width: 306px; height: 30px;line-height:30px;  background-color: #ccc !important;">프로그램 효과성</div>
            <div style="display: table;  width: 300px; height: 30px; ">
                <div style="display: table-cell; width :102px; height: 90px;">
                    <div style=" border-bottom:1px solid black; width:102px; height: 30px; line-height:30px; border-right: 1px solid black;text-align: center; background-color: #ccc !important;"> 예방효과</div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;"><%=rlist.get(0) %></div>
                         <div style="border-right: 1px solid black;width: 51px; height: 30px; line-height:30px;  text-align: center;"><%=rlist.get(1) %></div>
                    </div> 
                    <div style="display: table-cell; vertical-align: middle;">   
                        <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; "><%=rlist.get(2) %></div>
                        <div style="border-right: 1px solid black;width: 51px; height: 30px;line-height:30px;  text-align: center;"><%=rlist.get(3) %></div>
                    </div> 
                </div>
                <div style="display: table-cell; width :102px; height: 90px;">
                    <div style=" border-bottom:1px solid black; width:102px; height: 30px;line-height:30px;  border-right: 1px solid black;text-align: center; background-color: #ccc !important;">상담치유효과</div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;"><%=rlist.get(4) %></div>
                         <div style="border-right: 1px solid black;width: 51px; height: 30px;line-height:30px;   text-align: center;"><%=rlist.get(5) %></div>
                    </div> 
                    <div style="display: table-cell; vertical-align: middle;">   
                        <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; "><%=rlist.get(6) %></div>
                        <div style="border-right: 1px solid black;width: 51px; height: 30px;line-height:30px;  text-align: center;"><%=rlist.get(7) %></div>
                    </div> 
                </div>
                <div style="display: table-cell; width :102px; height: 90px;">
                    <div style=" border-bottom:1px solid black; width:102px; height: 30px;line-height:30px; text-align: center; background-color: #ccc !important;"> 힐링효과</div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;"><%=rlist.get(8) %></div>
                         <div style="border-right: 1px solid black;width: 51px; height: 30px;line-height:30px;   text-align: center;"><%=rlist.get(9) %></div>
                    </div> 
                    <div style="display: table-cell; vertical-align: middle;">   
                        <div style="width: 51px; height: 30px; line-height:30px; border-bottom: 1px solid black; text-align: center; "><%=rlist.get(10) %></div>
                        <div style="width: 51px; height: 30px; line-height:30px; text-align: center;"><%=rlist.get(11) %></div>
                    </div> 
                </div>
            </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 500px; height: 120px; vertical-align: middle;" >
            <div style="display: table-cell; border-bottom:1px solid black; width: 510px; height: 30px;line-height:30px;  background-color: #ccc !important;">자율신경검사 효과성</div>
            <div style="display: table;  width: 510px; height: 30px; ">
                <div style="display: table-cell; width :102px; height: 90px;">
                    <div style=" border-bottom:1px solid black; width:102px; height: 30px;line-height:30px;  border-right: 1px solid black;text-align: center; background-color: #ccc !important;"> 자율신경활성도</div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;">사전</div>
                         <div style="border-right: 1px solid black;width: 51px; height: 30px; line-height:30px;  text-align: center;"><%=HrvList.get(0).getNum1() %></div>
                    </div> 
                    <div style="display: table-cell; vertical-align: middle;">   
                        <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; ">사후</div>
                        <div style="border-right: 1px solid black;width: 51px; height: 30px;line-height:30px;  text-align: center;"><%=HrvList.get(0).getNum6() %></div>
                    </div> 
                </div>
                <div style="display: table-cell; width :102px; height: 90px;">
                    <div style=" border-bottom:1px solid black; width:102px; height: 30px;line-height:30px;  border-right: 1px solid black;text-align: center; background-color: #ccc!important;">자율신경 균형도</div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;">사전</div>
                         <div style="border-right: 1px solid black;width: 51px; height: 30px;line-height:30px;   text-align: center;"><%=HrvList.get(0).getNum2() %></div>
                    </div> 
                    <div style="display: table-cell; vertical-align: middle;">   
                        <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; ">사후</div>
                        <div style="border-right: 1px solid black;width: 51px; height: 30px;line-height:30px;  text-align: center;"><%=HrvList.get(0).getNum7() %></div>
                    </div> 
                </div>
                <div style="display: table-cell; width :102px; height: 90px;">
                    <div style=" border-bottom:1px solid black; border-right: 1px solid black;width:102px; height: 30px;line-height:30px; text-align: center; background-color: #ccc!important;"> 스트레스 저항도</div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;">사전</div>
                         <div style="border-right: 1px solid black;width: 51px; height: 30px;line-height:30px;   text-align: center;"><%=HrvList.get(0).getNum3() %></div>
                    </div> 
                    <div style="display: table-cell; vertical-align: middle;">   
                        <div style="width: 51px; height: 30px; line-height:30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; ">사후</div>
                        <div style="width: 51px; height: 30px;  line-height:30px;text-align: center; border-right: 1px solid black;"><%=HrvList.get(0).getNum8() %></div>
                    </div> 
                </div>
                <div style="display: table-cell; width :102px; height: 90px;">
                    <div style=" border-bottom:1px solid black; border-right: 1px solid black; width:102px; height: 30px;line-height:30px; text-align: center; background-color: #ccc!important;"> 스트레스 지수</div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;">사전</div>
                         <div style="border-right: 1px solid black;width: 51px; height: 30px; line-height:30px;  text-align: center;"><%=HrvList.get(0).getNum4() %></div>
                    </div> 
                    <div style="display: table-cell; vertical-align: middle;">   
                        <div style="width: 51px; height: 30px; line-height:30px; border-bottom: 1px solid black;border-right: 1px solid black; text-align: center; ">사후</div>
                        <div style="width: 51px; height: 30px; line-height:30px;  text-align: center; border-right: 1px solid black;"><%=HrvList.get(0).getNum9() %></div>
                    </div> 
                </div>
                <div style="display: table-cell; width :102px; height: 90px;">
                    <div style=" border-bottom:1px solid black; width:102px; height: 30px;line-height:30px; text-align: center; background-color: #ccc!important;"> 피로도</div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;">사전</div>
                         <div style="border-right: 1px solid black;width: 51px; height: 30px;line-height:30px;   text-align: center;"><%=HrvList.get(0).getNum5() %></div>
                    </div> 
                    <div style="display: table-cell; vertical-align: middle;">   
                        <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; text-align: center; ">사후</div>
                        <div style="width: 51px; height: 30px;line-height:30px;  text-align: center;"><%=HrvList.get(0).getNum10() %></div>
                    </div> 
                </div>
                
            </div>
            
        </div>
        <div style="display: table-cell; border:1px solid black; width: 100px; height: 120px; vertical-align: middle;background-color: #ccc!important; "></div>
    </div>
    <!-- 지출 및 매출 금액 -->
     <div style=" display:table inline-block; padding:10px; border-collapse: collapse; font-size: 10px;text-align: center; vertical-align: middle; ">
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle; background-color: #ccc;">지출 및<br>매출<br>금액</div>
        <div style="display: table-cell; border:1px solid black; width: auto; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:auto; line-height:30px;height: 30px; text-align: center; background-color: #ccc;"> 지출(천원)</div>
                <div style="display: table-cell">   
                    <div style="width: 55px; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc;">강사비</div>
                    <div style="width: 55px;line-height:30px; height: 30px;  border-right: 1px solid black;text-align: center; " ><fmt:formatNumber value="<%=ExpenseList[0] %>" pattern="#,###"/></div>
                </div> 
                <div style="display: table-cell; vertical-align: middle;">   
                    <div style="width: 55px; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc;">강사교통비</div>
                    <div style="width: 55px; line-height:30px;height: 30px; border-right: 1px solid black;text-align: center;"><fmt:formatNumber value="<%=ExpenseList[1] %>" pattern="#,###"/></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 55px; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc;">강사식비</div>
                    <div style="width: 55px; line-height:30px;height: 30px;  border-right: 1px solid black;text-align: center;"><fmt:formatNumber value="<%=ExpenseList[2] %>" pattern="#,###"/></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 55px; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc;">보조강사비</div>
                    <div style="width: 55px; line-height:30px;height: 30px;  border-right: 1px solid black;text-align: center;"><fmt:formatNumber value="<%=ExpenseList[3] %>" pattern="#,###"/></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 55px; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc;">참가자숙박</div>
                    <div style="width: 55px; line-height:30px;height: 30px;  border-right: 1px solid black;text-align: center;"><fmt:formatNumber value="<%=ExpenseList[4] %>" pattern="#,###"/></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 55px; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc;">참가자식비</div>
                    <div style="width: 55px; line-height:30px;height: 30px;  border-right: 1px solid black;text-align: center;"><fmt:formatNumber value="<%=ExpenseList[5] %>" pattern="#,###"/></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 55px; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc;">재료비</div>
                    <div style="width: 55px; line-height:30px;height: 30px;  border-right: 1px solid black;text-align: center;"><fmt:formatNumber value="<%=ExpenseList[6] %>" pattern="#,###"/></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 55px;line-height:30px; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc;">기타비</div>
                    <div style="width: 55px; line-height:30px;height: 30px;  border-right: 1px solid black;text-align: center;"><fmt:formatNumber value="<%=ExpenseList[7] %>" pattern="#,###"/></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 55px;line-height:30px; height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc;">예비비</div>
                    <div style="width: 55px; line-height:30px;height: 30px;  border-right: 1px solid black;text-align: center;"><fmt:formatNumber value="<%=ExpenseList[8] %>" pattern="#,###"/></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 67px; line-height:30px;height: 30px; border-bottom: 1px solid black;  text-align: center; background-color: #ccc;">합계</div>
                    <div style="width: 67px; line-height:30px;height: 30px; text-align: center;"><fmt:formatNumber value="<%=ExpenseList[9] %>" pattern="#,###"/></div>
                </div> 
        </div>
        <div style="display: table-cell; border:1px solid black; width:auto; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:405px; line-height:30px;height: 30px; text-align: center; background-color: #ccc;"> 수입(천원)</div>
                <div style="display: table-cell">   
                    <div style="width: 50px; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc;">프로그램</div>
                    <div style="width: 50px; line-height:30px;height: 30px;  border-right: 1px solid black;text-align: center; " ><fmt:formatNumber value="<%=IncomeSumList[0] %>" pattern="#,###"/></div>
                </div> 
                <div style="display: table-cell; vertical-align: middle;">   
                    <div style="width: 50px; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc;">숙박비</div>
                    <div style="width: 50px;line-height:30px; height: 30px; border-right: 1px solid black;text-align: center;"><fmt:formatNumber value="<%=IncomeSumList[1] %>" pattern="#,###"/></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 50px; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc;">식사비</div>
                    <div style="width: 50px; line-height:30px;height: 30px;  border-right: 1px solid black;text-align: center;"><fmt:formatNumber value="<%=IncomeSumList[2] %>" pattern="#,###"/></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 50px; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc;">쟤료비</div>
                    <div style="width: 50px; line-height:30px;height: 30px;  border-right: 1px solid black;text-align: center;"><fmt:formatNumber value="<%=IncomeSumList[3] %>" pattern="#,###"/></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 50px; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc;">기타비</div>
                    <div style="width: 50px; line-height:30px;height: 30px;  border-right: 1px solid black;text-align: center;"><fmt:formatNumber value="<%=IncomeSumList[4] %>" pattern="#,###"/></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 70px; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc;">합계</div>
                    <div style="width: 70px; line-height:30px;height: 30px;  border-right: 1px solid black;text-align: center;"><fmt:formatNumber value="<%=IncomeSumList[5] %>" pattern="#,###"/></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 85px; line-height:30px;height: 30px; border-bottom: 1px solid black; text-align: center; background-color: #ccc;">최종금액</div>
                    <div style="width: 85px; line-height:30px;height: 30px;  text-align: center;"><fmt:formatNumber value="<%=IncomeSumList[6] %>" pattern="#,###"/></div>
                </div> 
        </div>
    </div> 
</div>
</body>
</html>