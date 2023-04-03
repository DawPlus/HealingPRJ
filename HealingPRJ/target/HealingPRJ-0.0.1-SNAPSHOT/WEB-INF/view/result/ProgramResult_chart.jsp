<%@page import="sun.swing.BakedArrayList"%>
<%@page import="poly.dto.HrvInsertDTO"%>
<%@page import="poly.util.CmmUtil"%>
<%@page import="org.apache.commons.math3.analysis.function.Exp"%>
<%@page import="poly.dto.IncomeDTO"%>
<%@page import="sun.invoke.empty.Empty"%>
<%@page import="poly.dto.BasicInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="static poly.util.CmmUtil.nvl" %>
<%@ page import ="static poly.util.CmmUtil.convertXSS" %>
<%@ page import ="poly.dto.BasicInfoDTO" %>
<%@ page import ="poly.dto.ServiceInsertDTO" %>
<%@ page import ="poly.dto.SearchDTO" %>
<%@ page import ="poly.dto.ExpenseDTO" %>
<%@ page import ="java.util.List" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%

	List<BasicInfoDTO> basicList = (List<BasicInfoDTO>)request.getAttribute("basicList");
	List<IncomeDTO> IncomeList = (List<IncomeDTO>)request.getAttribute("IncomeList");
	List<ServiceInsertDTO> serviceList = (List<ServiceInsertDTO>)request.getAttribute("serviceList");
	List<ServiceInsertDTO> ProgramEffect = (List<ServiceInsertDTO>)request.getAttribute("ProgramEffect");
	List<HrvInsertDTO> HrvList = (List<HrvInsertDTO>)request.getAttribute("HrvList");
	List<String> rlist = (List<String>)request.getAttribute("ProgramEffect");
	List<ExpenseDTO> ExpenseList = (List<ExpenseDTO>)request.getAttribute("ExpenseList");
	int[] operation = (int[])request.getAttribute("operationList");
	String[][] ProgramName = (String[][])request.getAttribute("ProgramName");
	Double[][] ProgramSaf = (Double[][])request.getAttribute("ProgramSaf");
	
	/* 프로그램 만족도 평균 구하기   */
	int count=0,count_in=0,count_out=0,count_1=0;
	String[] teacher_avg = new String[14];
	String[] content_avg = new String[14];
	String[] effect_avg = new String[14];
	String[] program_avg = new String[14];
	String[][] Program_saf =  new String[14][9];
	for(int i=0; i<7; i++){
		count_1 = count_1 + operation[0+3*i];
		count_in = count_in + operation[1+3*i];
		count_out = count_out + operation[2+3*i];
	}
	count =0;
	 for(int i=0; i<14; i++){
		teacher_avg[i] = " ";
		content_avg[i] = " ";
		effect_avg[i] = " ";
		program_avg[i] = " ";
	} 
	for(int i=0; i<14; i++){
		if(ProgramSaf[i][0]+ProgramSaf[i][1]+ProgramSaf[i][0]>0){
			if(ProgramSaf[i][0]>0){
				count++;
			}
			if(ProgramSaf[i][1]>0){
				count++;
			}
			if(ProgramSaf[i][2]>0){
				count++;
			}
			teacher_avg[i] = String.format("%.2f",(ProgramSaf[i][0]+ProgramSaf[i][1]+ProgramSaf[i][2])/count);
			count=0;
		}
	}
	
	for(int i=0; i<14; i++){
		if(ProgramSaf[i][3]+ProgramSaf[i][4]+ProgramSaf[i][5]>0){
			if(ProgramSaf[i][3]>0){
				count++;
			}
			if(ProgramSaf[i][4]>0){
				count++;
			}
			if(ProgramSaf[i][5]>0){
				count++;
			}
			content_avg[i] = String.format("%.2f",(ProgramSaf[i][3]+ProgramSaf[i][4]+ProgramSaf[i][5])/count);
			count=0;
		}
	}
	for(int i=0; i<14; i++){
		if(ProgramSaf[i][6]+ProgramSaf[i][7]+ProgramSaf[i][8]>0){
			if(ProgramSaf[i][6]>0){
				count++;
			}
			if(ProgramSaf[i][7]>0){
				count++;
			}
			if(ProgramSaf[i][8]>0){
				count++;
			}
			effect_avg[i]  = String.format("%.2f",(ProgramSaf[i][6]+ProgramSaf[i][7]+ProgramSaf[i][8])/count);
			count=0;
		}
	}
	for(int i=0; i<14; i++){
		if(ProgramSaf[i][6]+ProgramSaf[i][7]+ProgramSaf[i][8]>0){
			if(ProgramSaf[i][6]>0){
				count++;
			}
			if(ProgramSaf[i][7]>0){
				count++;
			}
			if(ProgramSaf[i][8]>0){
				count++;
			}
			effect_avg[i]  = String.format("%.2f",(ProgramSaf[i][6]+ProgramSaf[i][7]+ProgramSaf[i][8])/count);
			count=0;
		}
	}
	for(int i=0; i<14; i++){
		if(teacher_avg[i] !=" " || content_avg[i]!=" " || effect_avg[i]!=" "){
			if(teacher_avg[i]!=" "){
				count++;
			}else{
				teacher_avg[i] = "0.0";
			}
			if(content_avg[i]!=" "){
				count++;
			}else{
				content_avg[i] = "0.0";
			}
			if(effect_avg[i] !=" "){
				count++;
			}else{
				effect_avg[i] ="0.0";
			}
			program_avg[i] =  String.format("%.2f",(Double.parseDouble(teacher_avg[i])+ Double.parseDouble(content_avg[i])+ Double.parseDouble(effect_avg[i]))/count);
			count=0;
		}
	}
	
	 for(int i=0; i<14; i++){
			if(teacher_avg[i].equals("0.0")){
				teacher_avg[i] = " ";
			}
			if(content_avg[i].equals("0.0")){
				content_avg[i] = " ";
			}
			if(effect_avg[i].equals("0.0")){
				effect_avg[i] = " ";
			}
			
		} 

 	for(int i=0; i<14; i++){
 		for(int j=0; j<9; j++){
 			if(ProgramSaf[i][j] == 0.0){
 				Program_saf[i][j] = " ";
 			}else{
 				Program_saf[i][j] = Double.toString(ProgramSaf[i][j]);
 			}
 		}
 	}
	int part =0;
	int lead =0;
	int room_part_room=0;
	int room_part_peaple =0;
	int meal =0;
 	part = Integer.parseInt(basicList.get(0).getPart_man_cnt()) + Integer.parseInt(basicList.get(0).getPart_woman_cnt());
 	lead = Integer.parseInt(basicList.get(0).getLead_man_cnt()) + Integer.parseInt(basicList.get(0).getLead_woman_cnt());
 	room_part_room = Integer.parseInt(basicList.get(0).getRoom_part_room())+Integer.parseInt(basicList.get(0).getRoom_lead_room())+Integer.parseInt(basicList.get(0).getRoom_etc_room());
 	room_part_peaple = Integer.parseInt(basicList.get(0).getRoom_part_people())+Integer.parseInt(basicList.get(0).getRoom_lead_people())+Integer.parseInt(basicList.get(0).getRoom_etc_people());
 	meal = Integer.parseInt(basicList.get(0).getMeal_part())+Integer.parseInt(basicList.get(0).getMeal_lead())+Integer.parseInt(basicList.get(0).getMeal_etc());
 	/* 지출금액 합 */
 	double expense_sum =0.0;
 	double pre_expense_sum =0.0;
 	if(ExpenseList != null){
 	for(int i=0; i<ExpenseList.get(4).getPrice1().size(); i++){
 		expense_sum = expense_sum +  Double.parseDouble(ExpenseList.get(4).getPrice1().get(i));
 	}
 	for(int i=0; i<ExpenseList.get(5).getPrice1().size(); i++){
 		expense_sum = expense_sum +  Double.parseDouble(ExpenseList.get(5).getPrice1().get(i));
 	}
 	for(int i=0; i<ExpenseList.get(6).getPrice1().size(); i++){
 		expense_sum = expense_sum +  Double.parseDouble(ExpenseList.get(6).getPrice1().get(i));
 	}
 	for(int i=0; i<ExpenseList.get(7).getPrice1().size(); i++){
 		expense_sum = expense_sum +  Double.parseDouble(ExpenseList.get(7).getPrice1().get(i));
 	}
 	for(int i=0; i<ExpenseList.get(12).getPrice1().size(); i++){
 		expense_sum = expense_sum +  Double.parseDouble(ExpenseList.get(12).getPrice1().get(i));
 	}
 	for(int i=0; i<ExpenseList.get(13).getPrice1().size(); i++){
 		expense_sum = expense_sum +  Double.parseDouble(ExpenseList.get(13).getPrice1().get(i));
 	}
 	for(int i=0; i<ExpenseList.get(14).getPrice1().size(); i++){
 		expense_sum = expense_sum +  Double.parseDouble(ExpenseList.get(14).getPrice1().get(i));
 	}
 	for(int i=0; i<ExpenseList.get(15).getPrice1().size(); i++){
 		expense_sum = expense_sum +  Double.parseDouble(ExpenseList.get(15).getPrice1().get(i));
 	}
 	
 	for(int i=0; i<4; i++){
 		pre_expense_sum = pre_expense_sum +  Double.parseDouble(ExpenseList.get(i).getPrice1().get(0));
 	}
 	for(int i=8; i<12; i++){
 		pre_expense_sum = pre_expense_sum +  Double.parseDouble(ExpenseList.get(i).getPrice1().get(0));
 	}
 	}
 	/* 수익사업 */
 	double income_sum =0;
 	if(IncomeList != null){
 	for(int j=0; j<5; j++){
	 	for(int i=0; i<IncomeList.get(j).getPrice1().size(); i++){
	 		income_sum = income_sum +  Double.parseDouble(IncomeList.get(j).getPrice1().get(i));
	 	}
 	}
 	}
 	/*  */


%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>프로그램 통계</title>
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
	</style>
	<!-- 홍두표 - 나눔스퀘어 폰트 불러오기 -->


</head>
<style>
        .cell_30_bot_right{
            width: 51px; height: 30px; line-height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;
        }
        .cell_30_no_right{
            width: 50px; height: 30px; line-height: 30px; border-right: 1px solid black; text-align: center;
        }
        .cell_30_bot_no{
            width: 50px; height: 30px; line-height: 30px; border-bottom: 1px solid black;text-align: center;
        }
        .cell_30_bot_no_100{
            width: 100px; height: 30px; line-height: 30px; border-bottom: 1px solid black;text-align: center;
        }
        .cell_30{
            width: 50px; height: 30px; line-height: 30px; text-align: center;
        }
        .cell_60_bot_right{
            width: 50px; height: 60px; line-height: 60px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;
        }
        .cell_60_no_right{
            width: 50px; height: 60px; line-height: 60px; border-right: 1px solid black; text-align: center;
        }
        .cell_60_bot_no{
            width: 50px; height: 60px; line-height: 60px; border-bottom: 1px solid black;text-align: center;
        }
        .cell_60{
            width: 50px; height: 60px; line-height: 60px; text-align: center;
        }

    </style>
<body>
	 <!-- 상단 제목 -->
    <div style="width:1000px; height:60px;  border-collapse: collapse;font-size: 10px;">
        <div style="display: table-cell; width :790px;"></div>
        <div style="display: table-cell;">   
            <div style="width: 70px; line-height: 20px;height: 20px; border-top:1px solid black;border-bottom: 1px solid black;border-left: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc;">담당</div>
            <div style="width: 70px; line-height: 40px;height: 40px; border-bottom: 1px solid black; border-right: 1px solid black;border-left: 1px solid black;text-align: center; " ></div>
        </div> 
        <div style="display: table-cell">   
            <div style="width: 70px; line-height: 20px;height: 20px; border-top:1px solid black;border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc;">팀장</div>
            <div style="width: 70px; line-height: 40px;height: 40px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center; " ></div>
        </div> 
        <div style="display: table-cell">   
            <div style="width: 70px; line-height: 20px;height: 20px; border-top:1px solid black;border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc;">사무국장</div>
            <div style="width: 70px; line-height: 40px;height: 40px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center; " ></div>
        </div> 
    </div>
    <div style="width:1000px; height:40px;text-align: center;"><h3>하이힐링원 프로그램 실시 결과 보고</h3></div>
    <div style="width:1000px; height:30px;">
        <div style="display: table-cell;">
            <div style="display: table-cell;width: 200px; line-height: 30px;height: 30px;  "></div>
            <div style="display: table-cell;width: 200px; line-height: 30px;height: 30px;  "></div>
            <div style="display: table-cell;width: 200px; line-height: 30px;height: 30px;  "></div>
            <div style="display: table-cell;width: 200px; line-height: 30px;height: 30px; font-size: 8px;  ">단체명 : &nbsp;&nbsp; &nbsp;<%=convertXSS(basicList.get(0).getAgency())%></div>
            <div style="display: table-cell;width: 200px; line-height: 30px;height: 30px; font-size: 8px;  ">om :   &nbsp;&nbsp; &nbsp;<%=convertXSS(basicList.get(0).getOm())%> </div>
        </div>
    </div>
    <!-- 참가유형 -->
    <div style=" display:table inline-block; padding:10px; border-collapse: collapse; font-size: 10px;text-align: center; ">
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 120px; vertical-align: middle; background-color: #ccc !important;">프로<br>그램<br>시행<br>개요</div>
        <div style="display: table-cell; border:1px solid black; width:150px; height: 120px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:152px;line-height: 30px; height: 30px; text-align: center; background-color: #ccc !important;"> 참여일자 및 기간</div>
            <div style="display: table-cell">   
                <div style="display:table-cell;vertical-align: middle;width: 101px; height: 60px; border-bottom: 1px solid black; border-right: 1px solid black;vertical-align: middle; text-align: center; background-color: #ccc !important;">참여일자</div>
                <div style="width: 101px; line-height:30px;height: 30px; border-right: 1px solid black;  text-align: center;"><%=basicList.get(0).getOpenday()%></div>
            </div> 
            <div style="display: table-cell; vertical-align: middle;">   
                <div style="display:table-cell;vertical-align: middle;width: 51px; height: 60px; border-bottom: 1px solid black;  text-align: center; background-color: #ccc !important;">체류일자</div>
                <div style="width: 51px; line-height:30px;height: 30px; text-align: center;"><%=convertXSS(basicList.get(0).getDays_to_stay())%></div>
            </div> 
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 120px; vertical-align: middle;" >
            <div style=" display:table-cell;vertical-align: middle;border-bottom:1px solid black; width:50px; height: 90px; text-align: center;background-color: #ccc !important; ">지역</div>
            <div style=" width:50px; line-height:30px;height: 30px; text-align: center; "><%=convertXSS(basicList.get(0).getResidence())%></div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 408px; height: 120px; vertical-align: middle;" >
            <div style="display: table-cell; border-bottom:1px solid black; width: 408px; height: 30px; background-color: #ccc !important;">참여인원(명)</div>
            <div style="display: table;  width: 306px; height: 30px; ">
                <div style="display: table-cell; width :153px; height: 90px;">
                    <div style=" border-bottom:1px solid black; width:153px; height: 30px; border-right: 1px solid black;text-align: center; background-color: #ccc !important;"> 참여자(명)</div>
                    <div style="display: table-cell">   
                         <div class="cell_30_bot_right">남</div>
                         <div style="border-right: 1px solid black;width: 51px; line-height:30px;height: 30px;  text-align: center;"><%=convertXSS(basicList.get(0).getPart_man_cnt())%></div>
                    </div> 
                    <div style="display: table-cell; vertical-align: middle;">   
                        <div class="cell_30_bot_right">여</div>
                        <div style="border-right: 1px solid black;width: 51px; line-height:30px;height: 30px; text-align: center;"><%=convertXSS(basicList.get(0).getPart_woman_cnt())%></div>
                    </div> 
                    <div style="display: table-cell; vertical-align: middle;">   
                        <div style="width: 51px; height: 30px; line-height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;">계</div>
                        <div style="border-right: 1px solid black;width: 51px; line-height:30px;height: 30px; text-align: center;"><%= part %></div>
                    </div>
                </div>
                <div style="display: table-cell; width :153px; height: 90px;">
                    <div style=" border-bottom:1px solid black; width:153px; height: 30px; border-right: 1px solid black;text-align: center; background-color: #ccc !important;">인솔자(명)</div>
                    <div style="display: table-cell">   
                         <div class="cell_30_bot_right">남</div>
                         <div style="border-right: 1px solid black;width: 51px; line-height:30px;height: 30px;  text-align: center;"><%=convertXSS(basicList.get(0).getLead_man_cnt())%></div>
                    </div> 
                    <div style="display: table-cell; vertical-align: middle;">   
                        <div class="cell_30_bot_right">여</div>
                        <div style="border-right: 1px solid black;width: 51px; line-height:30px;height: 30px; text-align: center;"><%=convertXSS(basicList.get(0).getLead_woman_cnt())%></div>
                    </div> 
                    <div style="display: table-cell; vertical-align: middle;">   
                        <div class="cell_30_bot_right">계</div>
                        <div style="border-right: 1px solid black;width: 51px; line-height:30px;height: 30px; text-align: center;"><%=lead %></div>
                    </div> 
                </div>
                <div style="display: table-cell; width :101px; height: 60px;">
                    <div style="display: table-cell">   
                         <div style=" display: table-cell;width: 50px; height: 59px; border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;background-color: #ccc !important;">
                         <br><br>실인원
                         </div>
                         <div style="border-right: 1px solid black;width: 50px; line-height:30px;height: 30px;  text-align: center;"><%= part + lead %></div>
                    </div> 
                    <div style="display: table-cell;">   
                        <div style=" display: table-cell;width: 51px; height: 59px; border-bottom: 1px solid black; text-align: center; background-color: #ccc !important; "><br><br>연인원</div>
                        <div style="width: 51px; line-height:30px;height: 30px; text-align: center;"><%= (part + lead)*Integer.parseInt(basicList.get(0).getDays_to_stay()) %></div>
                    </div> 
                </div>
            </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 100px; height: 120px; vertical-align: middle;" >
            <div style=" display:table-cell;vertical-align: middle;border-bottom:1px solid black; width:100px; height: 90px; text-align: center;background-color: #ccc !important; ">지원사항</div>
            <div style=" width:100px; height: 30px; line-height:30px; text-align: center;"><%=convertXSS(basicList.get(0).getSupport())%></div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 120px; vertical-align: middle;" >
            <div style=" display:table-cell;vertical-align: middle;border-bottom:1px solid black; width:50px; height: 90px; text-align: center;background-color: #ccc !important;vertical-align: middle; ">수입구분</div>
            <div style=" width:50px; height: 30px; line-height:30px;text-align: center; "><%=convertXSS(basicList.get(0).getIncome_type())%></div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 120px; vertical-align: middle;" >
            <div style=" display:table-cell;vertical-align: middle;border-bottom:1px solid black; width:50px; height: 90px; text-align: center;background-color: #ccc !important;vertical-align: middle; ">연령대</div>
            <div style=" width:50px; height: 30px; line-height:30px;text-align: center; "><%=convertXSS(basicList.get(0).getAge_type()) %></div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 120px; vertical-align: middle;" >
            <div style="display:table-cell;vertical-align: middle; border-bottom:1px solid black; width:50px; height: 90px; text-align: center;background-color: #ccc !important; ">참가자유형</div>
            <div style=" width:50px; height: 30px;line-height:30px; text-align: center; "><%=convertXSS(basicList.get(0).getPart_type())%></div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 120px; vertical-align: middle;" >
            <div style=" display:table-cell;vertical-align: middle;border-bottom:1px solid black; width:50px; height: 90px; text-align: center;background-color: #ccc !important; ">사업구분</div>
            <div style=" width:50px; height: 30px;line-height:30px; text-align: center; "><%=convertXSS(basicList.get(0).getBiz_purpose())%></div>
        </div>    
            
    </div>
     <!-- 프로그램 운영 -->
       <div style=" display:table inline-block; padding:10px; border-collapse: collapse; font-size: 10px;text-align: center; ">
        <div style="display: table-cell; border:1px solid black; width: 50px;  vertical-align: middle; background-color: #ccc !important;">프로그램<br>운영</div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 100px; line-height:30px;height: 30px; text-align: center; background-color: #ccc !important;">서비스유형</div>
            <div style="  border-bottom:1px solid black; width: 100px; line-height:90px;height: 90px; text-align: center; "><%=convertXSS(basicList.get(0).getService_type())%></div>
            <div style="   width: 100px; line-height:60px;height: 60px; text-align: center; ">객실배정 </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 50px; line-height:30px;height: 30px; text-align: center; background-color: #ccc !important;">구분</div>
            <div style=" border-bottom:1px solid black; width:50px; height: 30px; text-align: center;background-color: #ccc !important;">프로그램(개) </div>
            <div style=" border-bottom:1px solid black; width:50px; height: 30px; text-align: center;background-color: #ccc !important;">내부강사(명) </div>
            <div style=" border-bottom:1px solid black; width:50px; height: 30px; text-align: center;background-color: #ccc !important;"> 외부강사(명)</div>
            <div class="cell_60" style="background-color: #ccc !important;"> 인원(명) </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 100px; line-height:30px;height: 30px; text-align: center; background-color: #ccc !important;">산림교육</div>
            <div class="cell_30_bot_no_100"><%=operation[0]%> </div>
            <div class="cell_30_bot_no_100"><%=operation[1]%> </div>
            <div class="cell_30_bot_no_100"><%=operation[2]%> </div>
            <div >
	            <div class="cell_30_bot_no"style="background-color: #ccc !important;float : left;border-right:1px solid black;">참여자 </div>
	            <div class="cell_30_bot_no"style="background-color: #ccc !important;float : left;">인솔자</div>
            </div>
            <div>
            	<div class="cell_30_no_right"style="float: left;"><%=basicList.get(0).getRoom_part_people()%></div>
            	<div class="cell_30"style="float: left;"><%=basicList.get(0).getRoom_lead_people()%></div>
            </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 100px; line-height:30px;height: 30px; text-align: center; background-color: #ccc !important;">예방교육</div>
            <div class="cell_30_bot_no_100"> <%=operation[3]%></div>
            <div class="cell_30_bot_no_100"> <%=operation[4]%></div>
            <div class="cell_30_bot_no_100"> <%=operation[5]%></div>
            <div>
           	    <div class="cell_30_bot_no"style="background-color: #ccc !important;float : left;border-right:1px solid black;">기타 </div>
            	<div class="cell_30_bot_no_100"style="background-color: #ccc !important;">계 </div>
            </div>
            <div>
            	<div class="cell_30_no_right"style="float: left;"><%=convertXSS(basicList.get(0).getRoom_etc_people())%></div>
            	<div class="cell_30"style="float: left;"><%=room_part_peaple %></div>
            </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 100px; line-height:30px;height: 30px; text-align: center; background-color: #ccc !important;">산림치유</div>
            <div class="cell_30_bot_no_100"><%=operation[6]%> </div>
            <div class="cell_30_bot_no_100"> <%=operation[7]%></div>
            <div class="cell_30_bot_no_100"> <%=operation[8]%></div>
            <div>
            	<div class="cell_60_no_right"style="background-color: #ccc !important;float: left;">객실(실) </div>
            	<div style="float: left;" >
            		<div class="cell_30_bot_no"style="background-color: #ccc !important;">참여자 </div>
            		<div class="cell_30"><%=convertXSS(basicList.get(0).getRoom_part_room())%></div>
            	</div>
            </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 100px; line-height:30px;height: 30px; text-align: center; background-color: #ccc !important;">에너제틱</div>
            <div class="cell_30_bot_no_100"><%=operation[9]%> </div>
            <div class="cell_30_bot_no_100"><%=operation[10]%> </div>
            <div class="cell_30_bot_no_100"><%=operation[11]%> </div>
            <div>
           	    <div class="cell_30_bot_no"style="background-color: #ccc !important;float : left;border-right:1px solid black;">인솔자 </div>
            	<div class="cell_30_bot_no_100"style="background-color: #ccc !important;">기타 </div>
            </div>
            <div>
            	<div class="cell_30_no_right"style="float: left;"><%=convertXSS(basicList.get(0).getRoom_lead_room())%></div>
            	<div class="cell_30"style="float: left;"><%=convertXSS(basicList.get(0).getRoom_etc_room())%></div>
            </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 50px; line-height:30px;height: 30px; text-align: center; background-color: #ccc !important;">릴렉싱</div>
            <div  class="cell_30_bot_no"><%=operation[12]%> </div>
            <div  class="cell_30_bot_no"><%=operation[13]%> </div>
            <div  class="cell_30_bot_no"><%=operation[14]%> </div>
            <div class="cell_30_bot_no"style="background-color: #ccc !important;">계</div>
            <div class="cell_30"><%=room_part_room %></div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 50px; line-height:30px;height: 30px; text-align: center; background-color: #ccc !important;">아트</div>
            <div class="cell_30_bot_no"><%=operation[15]%> </div>
            <div class="cell_30_bot_no"><%=operation[16]%> </div>
            <div class="cell_30_bot_no"><%=operation[17]%> </div>
            <div class="cell_60"style="background-color: #ccc !important;">식사 </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 50px; line-height:30px;height: 30px; text-align: center; background-color: #ccc !important;">쿠킹</div>
            <div class="cell_30_bot_no"><%=operation[18]%> </div>
            <div class="cell_30_bot_no"><%=operation[19]%> </div>
            <div class="cell_30_bot_no"><%=operation[20]%> </div>
            <div class="cell_30_bot_no"style="background-color: #ccc !important;">참여자</div>
            <div class="cell_30"><%=convertXSS(Integer.toString(Integer.parseInt(basicList.get(0).getMeal_type())*Integer.parseInt(basicList.get(0).getMeal_part())))%> </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 50px; line-height:30px;height: 30px; text-align: center; background-color: #ccc !important;">이벤트</div>
            <div class="cell_30_bot_no"><%=operation[21]%> </div>
            <div class="cell_30_bot_no"><%=operation[22]%> </div>
            <div class="cell_30_bot_no"><%=operation[23]%> </div>
            <div class="cell_30_bot_no"style="background-color: #ccc !important;">인솔자</div>
            <div class="cell_30"> <%=convertXSS(Integer.toString(Integer.parseInt(basicList.get(0).getMeal_type())*Integer.parseInt(basicList.get(0).getMeal_lead())))%></div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 50px; line-height:30px;height: 30px; text-align: center; background-color: #ccc !important;">계</div>
            <div class="cell_30_bot_no"><%= count_1 %></div>
            <div class="cell_30_bot_no"><%= count_in %></div>
            <div class="cell_30_bot_no"><%= count_out %></div>
            <div class="cell_30_bot_no"style="background-color: #ccc !important;">기타</div>
            <div class="cell_30"><%=convertXSS(Integer.toString(Integer.parseInt(basicList.get(0).getMeal_type())*Integer.parseInt(basicList.get(0).getMeal_etc())))%> </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 50px; line-height:30px;height: 120px; text-align: center; background-color: #ccc !important;"></div>
            <div class="cell_30_bot_no"style="background-color: #ccc !important;">계</div>
            <div class="cell_30"><%=convertXSS(Integer.toString(Integer.parseInt(basicList.get(0).getMeal_type())*(Integer.parseInt(basicList.get(0).getMeal_part())+Integer.parseInt(basicList.get(0).getMeal_lead())+Integer.parseInt(basicList.get(0).getMeal_etc())))) %></div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle;background-color: #ccc !important;"></div>
        
    </div>
    
    <!-- 시설서비스 만족도 -->
    <div style=" display:table inline-block; padding:10px; border-collapse: collapse; font-size: 10px;text-align: center; ">
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle; background-color: #ccc !important;">시설서비스<br>만족도</div>
        <div style="display: table-cell; border:1px solid black; width:102px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:101px; line-height:30px;height: 30px; text-align: center; background-color: #ccc !important;"> 숙소 </div>
            <div style="display: table-cell">   
                <div style="width: 50px; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">편리</div>
                <div style="width: 50px; line-height:30px;height: 30px;  border-right: 1px solid black; text-align: center;"><%=nvl(serviceList.get(0).getScore1())%></div>
            </div>
            <div style="display: table-cell">   
                <div style="width: 51px;line-height:30px; height: 30px; border-bottom: 1px solid black; text-align: center; background-color: #ccc !important;">청결</div>
                <div style="width: 51px;line-height:30px; height: 30px; text-align: center;"><%=nvl(serviceList.get(0).getScore2())%></div>
            </div>
         </div>
        <div style="display: table-cell; border:1px solid black; width:102px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:101px; line-height:30px;height: 30px; text-align: center; background-color: #ccc !important;"> 식당 </div>
            <div style="display: table-cell">   
                <div style="width: 50px;line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">편리</div>
                <div style="width: 50px; line-height:30px;height: 30px;  border-right: 1px solid black; text-align: center;"><%=nvl(serviceList.get(0).getScore3())%></div>
            </div>
            <div style="display: table-cell">   
                <div style="width: 51px;line-height:30px; height: 30px; border-bottom: 1px solid black; text-align: center; background-color: #ccc !important;">청결</div>
                <div style="width: 51px; line-height:30px;height: 30px; text-align: center;"><%=nvl(serviceList.get(0).getScore4())%></div>
            </div>
         </div>
        <div style="display: table-cell; border:1px solid black; width:152px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:152px; line-height:30px;height: 30px; text-align: center; background-color: #ccc !important;"> 프로그램 장소 </div>
            <div style="display: table-cell">   
                <div style="width: 50px; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">만족도</div>
                <div style="width: 50px; line-height:30px;height: 30px;  border-right: 1px solid black; text-align: center;"><%=nvl(serviceList.get(0).getScore5())%></div>
            </div>
            <div style="display: table-cell">   
                <div style="width: 51px; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center; background-color: #ccc !important;">청결도</div>
                <div style="width: 51px; line-height:30px;height: 30px; border-right: 1px solid black;text-align: center;"><%=nvl(serviceList.get(0).getScore6())%></div>
            </div>
            <div style="display: table-cell">   
                <div style="width: 51px; line-height:30px;height: 30px; border-bottom: 1px solid black; text-align: center; background-color: #ccc !important;">풍경</div>
                <div style="width: 51px; line-height:30px;height: 30px; text-align: center;"><%=nvl(serviceList.get(0).getScore7())%></div>
            </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width:152px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:152px; line-height:30px;height: 30px; text-align: center; background-color: #ccc !important;"> 숲(야외) </div>
            <div style="display: table-cell">   
                <div style="width: 50px; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">만족도</div>
                <div style="width: 50px; line-height:30px;height: 30px;  border-right: 1px solid black; text-align: center;"><%=nvl(serviceList.get(0).getScore8())%></div>
            </div>
            <div style="display: table-cell">   
                <div style="width: 51px; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center; background-color: #ccc !important;">청결도</div>
                <div style="width: 51px; line-height:30px;height: 30px; border-right: 1px solid black;text-align: center;"><%=nvl(serviceList.get(0).getScore9())%></div>
            </div>
            <div style="display: table-cell">   
                <div style="width: 51px; line-height:30px;height: 30px; border-bottom: 1px solid black; text-align: center; background-color: #ccc !important;">풍경</div>
                <div style="width: 51px; line-height:30px;height: 30px; text-align: center;"><%=nvl(serviceList.get(0).getScore10())%></div>
            </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width:152px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:152px; line-height:30px;height: 30px; text-align: center; background-color: #ccc !important;"> 운영 </div>
            <div style="display: table-cell">   
                <div style="width: 50px; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">운영방식</div>
                <div style="width: 50px;line-height:30px; height: 30px;  border-right: 1px solid black; text-align: center;"><%=nvl(serviceList.get(0).getScore11())%></div>
            </div>
            <div style="display: table-cell">   
                <div style="width: 51px; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center; background-color: #ccc !important;">시간편성</div>
                <div style="width: 51px; line-height:30px;height: 30px; border-right: 1px solid black;text-align: center;"><%=nvl(serviceList.get(0).getScore12())%></div>
            </div>
            <div style="display: table-cell">   
                <div style="width: 51px; line-height:30px;height: 30px; border-bottom: 1px solid black; text-align: center; background-color: #ccc !important;">직원친절</div>
                <div style="width: 51px; line-height:30px;height: 30px; text-align: center;"><%=nvl(serviceList.get(0).getScore13())%></div>
            </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width:152px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:152px; line-height:30px;height: 30px; text-align: center; background-color: #ccc !important;"> 식사 </div>
            <div style="display: table-cell">   
                <div style="width: 50px; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">신선도</div>
                <div style="width: 50px; line-height:30px;height: 30px;  border-right: 1px solid black; text-align: center;"><%=nvl(serviceList.get(0).getScore14())%></div>
            </div>
            <div style="display: table-cell">   
                <div style="width: 51px; line-height:30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center; background-color: #ccc !important;">다양성</div>
                <div style="width: 51px; line-height:30px;height: 30px; border-right: 1px solid black;text-align: center;"><%=nvl(serviceList.get(0).getScore15())%></div>
            </div>
            <div style="display: table-cell">   
                <div style="width: 51px; line-height:30px;height: 30px; border-bottom: 1px solid black; text-align: center; background-color: #ccc !important;">영양</div>
                <div style="width: 51px; line-height:30px;height: 30px; text-align: center;"><%=nvl(serviceList.get(0).getScore16())%></div>
            </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 100px; height: 90px; vertical-align: middle;background-color: #ccc !important;"></div>
    </div>
    <!-- 프로그램 만족도 -->
    <div style=" display:table inline-block; padding:10px; border-collapse: collapse; font-size: 10px;text-align: center; ">
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 210px; vertical-align: middle; background-color: #ccc !important;">프로그램<br>만족도</div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 210px; vertical-align: middle; ">
            <div style=" display:table-cell;vertical-align: middle; border-bottom:1px solid black; width: 50px; height: 60px; text-align: center; background-color: #ccc !important; ">구분</div>
            <div style=" border-bottom:1px solid black; width:50px; height: 15px; text-align: center;">참여자</div>
            <div style=" border-bottom:1px solid black; width:50px; height: 15px; text-align: center;">인솔자 </div>
            <div style=" border-bottom:1px solid black; width:50px; height: 15px; text-align: center;">참여자</div>
            <div style=" border-bottom:1px solid black; width:50px; height: 15px; text-align: center;">인솔자 </div>
            <div style=" border-bottom:1px solid black; width:50px; height: 15px; text-align: center;">참여자</div>
            <div style=" border-bottom:1px solid black; width:50px; height: 15px; text-align: center;">인솔자</div>
            <div style=" border-bottom:1px solid black; width:50px; height: 15px; text-align: center;">참여자</div>
            <div style=" border-bottom:1px solid black; width:50px; height: 15px; text-align: center;">인솔자</div>
            <div style=" border-bottom:1px solid black; width:50px; height: 15px; text-align: center;">참여자</div>
            <div style=" border-bottom:1px solid black; width:50px; height: 15px; text-align: center;">인솔자</div>
            <div style=" border-bottom:1px solid black; width:50px; height: 15px; text-align: center;">참여자</div>
            <div style=" border-bottom:1px solid black; width:50px; height: 15px; text-align: center;">인솔자</div>
            <div style=" border-bottom:1px solid black; width:50px; height: 15px; text-align: center;">참여자</div>
            <div style=" width:50px; height: 15px; text-align: center;"> 인솔자</div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 210px; vertical-align: middle; ">
            <div style=" display:table-cell;vertical-align: middle; border-bottom:1px solid black; width: 50px; height: 60px; text-align: center; background-color: #ccc !important; ">분야</div>
            <div style=" border-bottom:1px solid black; width:50px; line-height:30px; height: 30px; text-align: center;"><%= ProgramName[0][0]%></div>
            <div style=" border-bottom:1px solid black; width:50px; line-height:30px;height: 30px; text-align: center;"><%= ProgramName[1][0]%></div>
            <div style=" border-bottom:1px solid black; width:50px; line-height:30px;height: 30px; text-align: center;"><%= ProgramName[2][0]%></div>
            <div style=" border-bottom:1px solid black; width:50px; line-height:30px;height: 30px; text-align: center;"><%= ProgramName[3][0]%></div>
            <div style=" border-bottom:1px solid black; width:50px; line-height:30px;height: 30px; text-align: center;"><%= ProgramName[4][0]%></div>
            <div style=" border-bottom:1px solid black; width:50px; line-height:30px;height: 30px; text-align: center;"><%= ProgramName[5][0]%></div>
            <div style=" width:50px; line-height:30px;height: 30px; text-align: center;"><%= ProgramName[6][0]%> </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 100px; height: 210px; vertical-align: middle; ">
            <div style=" display:table-cell;vertical-align: middle; border-bottom:1px solid black; width: 100px; height: 60px; text-align: center; background-color: #ccc !important; ">프로그램명</div>
            <div style=" border-bottom:1px solid black; width:100px; line-height:30px;height: 30px; text-align: center;"><%= ProgramName[0][1]%> </div>
            <div style=" border-bottom:1px solid black; width:100px; line-height:30px;height: 30px; text-align: center;"><%= ProgramName[1][1]%> </div>
            <div style=" border-bottom:1px solid black; width:100px; line-height:30px;height: 30px; text-align: center;"><%= ProgramName[2][1]%> </div>
            <div style=" border-bottom:1px solid black; width:100px; line-height:30px;height: 30px; text-align: center;"><%= ProgramName[3][1]%></div>
            <div style=" border-bottom:1px solid black; width:100px; line-height:30px;height: 30px; text-align: center;"><%= ProgramName[4][1]%></div>
            <div style=" border-bottom:1px solid black; width:100px; line-height:30px;height: 30px; text-align: center;"><%= ProgramName[5][1]%></div>
            <div style=" width:100px; line-height:30px;height: 30px; text-align: center;"><%= ProgramName[6][1]%> </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 210px; vertical-align: middle; ">
            <div style=" display:table-cell;vertical-align: middle; border-bottom:1px solid black; width: 50px; height: 60px; text-align: center; background-color: #ccc !important; ">강사명</div>
            <div style=" border-bottom:1px solid black; width:50px; line-height:30px;height: 30px; text-align: center;"><%= ProgramName[0][2]%> </div>
            <div style=" border-bottom:1px solid black; width:50px; line-height:30px;height: 30px; text-align: center;"><%= ProgramName[1][2]%> </div>
            <div style=" border-bottom:1px solid black; width:50px; line-height:30px;height: 30px; text-align: center;"><%= ProgramName[2][2]%> </div>
            <div style=" border-bottom:1px solid black; width:50px; line-height:30px;height: 30px; text-align: center;"><%= ProgramName[3][2]%></div>
            <div style=" border-bottom:1px solid black; width:50px; line-height:30px;height: 30px; text-align: center;"><%= ProgramName[4][2]%></div>
            <div style=" border-bottom:1px solid black; width:50px; line-height:30px;height: 30px; text-align: center;"><%= ProgramName[5][2]%></div>
            <div style=" width:50px; line-height:30px;height: 30px; text-align: center;"><%= ProgramName[6][2]%> </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width:203px; height: 120px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:203px; height: 30px; line-heght:30px; text-align: center; background-color: #ccc !important; "> 강사 </div>
            <div style="display: table-cell">   
                <div style="width: 50px; height: 31px; line-height:31px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">전문성</div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[0][0]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[1][0]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[2][0]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[3][0]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[4][0]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[5][0]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[6][0]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[7][0]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[8][0]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[9][0]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[10][0]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[11][0]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[12][0]%></div>
                <div style="width: 50px; height: 15px; border-right: 1px solid black; text-align: center;"><%=Program_saf[13][0]%></div>
            </div> 
            <div style="display: table-cell">   
                <div style="width: 51px; height: 31px; line-height:31px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">성실성</div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[0][1]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[1][1]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[2][1]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[3][1]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[4][1]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[5][1]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[6][1]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[7][1]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[8][1]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[9][1]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[10][1]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[11][1]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[12][1]%></div>
                <div style="width: 51px; height: 15px; border-right: 1px solid black; text-align: center;"><%=Program_saf[13][1]%></div>
            </div> 
            <div style="display: table-cell">   
                <div style="width: 51px; height: 31px;line-height:31px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">반응성</div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[0][2]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[1][2]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[2][2]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[3][2]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[4][2]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[5][2]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[6][2]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[7][2]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[8][2]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[9][2]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[10][2]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[11][2]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[12][2]%></div>
                <div style="width: 51px; height: 15px; border-right: 1px solid black; text-align: center;"><%=Program_saf[13][2]%></div>
            </div> 
            <div style="display: table-cell">   
                <div style="width: 51px; height: 31px;line-height:31px; border-bottom: 1px solid black;  text-align: center; background-color: #ccc !important;">평균</div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=teacher_avg[0]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=teacher_avg[1]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=teacher_avg[2]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=teacher_avg[3]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=teacher_avg[4]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=teacher_avg[5]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=teacher_avg[6]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=teacher_avg[7]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=teacher_avg[8]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=teacher_avg[9]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=teacher_avg[10]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=teacher_avg[11]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=teacher_avg[12]%></div>
                <div style="width: 51px; height: 15px;  text-align: center;"><%=teacher_avg[13]%></div>
            </div> 
        </div>
        <div style="display: table-cell; border:1px solid black; width:203px; height: 120px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:203px; height: 30px;line-heght:30px; text-align: center; background-color: #ccc !important;"> 내용구성 </div>
            <div style="display: table-cell">   
                <div style="width: 50px; height: 31px;line-height:31px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">체계성</div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[0][3]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[1][3]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[2][3]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[3][3]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[4][3]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[5][3]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[6][3]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[7][3]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[8][3]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[9][3]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[10][3]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[11][3]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[12][3]%></div>
                <div style="width: 50px; height: 15px; border-right: 1px solid black; text-align: center;"><%=Program_saf[13][3]%></div>
            </div> 
            <div style="display: table-cell">   
                <div style="width: 51px; height: 31px;line-height:31px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">적합성</div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[0][4]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[1][4]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[2][4]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[3][4]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[4][4]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[5][4]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[6][4]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[7][4]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[8][4]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[9][4]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[10][4]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[11][4]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[12][4]%></div>
                <div style="width: 51px; height: 15px; border-right: 1px solid black; text-align: center;"><%=Program_saf[13][1]%></div>
            </div> 
            <div style="display: table-cell">   
                <div style="width: 51px; height: 31px;line-height:31px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">흥미성</div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[0][5]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[1][5]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[2][5]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[3][5]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[4][5]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[5][5]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[6][5]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[7][5]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[8][5]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[9][5]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[10][5]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[11][5]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[12][5]%></div>
                <div style="width: 51px; height: 15px; border-right: 1px solid black; text-align: center;"><%=Program_saf[13][5]%></div>
            </div> 
            <div style="display: table-cell">   
                <div style="width: 51px; height: 31px;line-height:31px; border-bottom: 1px solid black;  text-align: center; background-color: #ccc !important;">평균</div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=content_avg[0] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=content_avg[1] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=content_avg[2] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=content_avg[3] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=content_avg[4] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=content_avg[5] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=content_avg[6] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=content_avg[7] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=content_avg[8] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=content_avg[9] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=content_avg[10] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=content_avg[11] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=content_avg[12] %></div>
                <div style="width: 51px; height: 15px;  text-align: center;"><%=content_avg[13]%></div>
            </div> 
        </div>
        <div style="display: table-cell; border:1px solid black; width:203px; height: 120px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:203px; height: 30px;line-heght:30px; text-align: center; background-color: #ccc !important;">효과성</div>
            <div style="display: table-cell">   
                <div style="width: 50px; height: 31px; line-height:31px;border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">학습성</div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[0][6]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[1][6]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[2][6]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[3][6]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[4][6]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[5][6]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[6][6]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[7][6]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[8][6]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[9][6]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[10][6]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[11][6]%></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[12][6]%></div>
                <div style="width: 50px; height: 15px; border-right: 1px solid black; text-align: center;"><%=Program_saf[13][6]%></div>
            </div> 
            <div style="display: table-cell">   
                <div style="width: 51px; height: 31px; line-height:31px;border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">재참여</div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[0][7]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[1][7]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[2][7]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[3][7]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[4][7]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[5][7]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[6][7]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[7][7]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[8][7]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[9][7]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[10][7]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[11][7]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[12][7]%></div>
                <div style="width: 51px; height: 15px; border-right: 1px solid black; text-align: center;"><%=Program_saf[13][7]%></div>
            </div> 
            <div style="display: table-cell">   
                <div style="width: 51px; height: 31px; line-height:31px;border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">추천</div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[0][8]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[1][8]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[2][8]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[3][8]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[4][8]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[5][8]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[6][8]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[7][8]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[8][8]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[9][8]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[10][8]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[11][8]%></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center;"><%=Program_saf[12][8]%></div>
                <div style="width: 51px; height: 15px; border-right: 1px solid black; text-align: center;"><%=Program_saf[13][5]%></div>
            </div> 
            <div style="display: table-cell">   
                <div style="width: 51px; height: 31px; line-height:31px;border-bottom: 1px solid black;  text-align: center; background-color: #ccc !important;">평균</div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=effect_avg[0] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=effect_avg[1] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=effect_avg[2] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=effect_avg[3] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=effect_avg[4] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=effect_avg[5] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=effect_avg[6] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=effect_avg[7] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=effect_avg[8] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=effect_avg[9] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=effect_avg[10] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=effect_avg[11] %></div>
                <div style="width: 51px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=effect_avg[12] %></div>
                <div style="width: 51px; height: 15px;  text-align: center;"><%=effect_avg[13] %></div>
            </div> 
        </div>
       
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 210px; vertical-align: middle; ">
            <div style=" display:table-cell;vertical-align: middle;border-bottom:1px solid black; width: 50px; height: 60px;  background-color: #ccc !important; ">전체<br>평균</div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=program_avg[0] %></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=program_avg[1] %></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=program_avg[2] %></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=program_avg[3] %></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=program_avg[4] %></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=program_avg[5] %></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=program_avg[6] %></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=program_avg[7] %></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=program_avg[8] %></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=program_avg[9] %></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=program_avg[10] %></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=program_avg[11] %></div>
                <div style="width: 50px; height: 15px; border-bottom: 1px solid black;  text-align: center;"><%=program_avg[12] %></div>
                <div style="width: 50px; height: 15px;  text-align: center;"><%=program_avg[13] %></div>
        </div>
    </div>
    <!-- 프로그램 효과성  -->
    <div style=" display:table inline-block; padding:10px; border-collapse: collapse; font-size: 10px;text-align: center; ">
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle; background-color: #ccc !important;">프로그램<br>효과</div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle; background-color: #ccc !important;">예방효과</div>
        <div style="display: table-cell; border:1px solid black; width:101px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:101px; height: 30px;line-height:30px;  text-align: center; background-color: #ccc!important;"> 총점 </div>
            <div style="display: table-cell">   
                <div style="width: 50px; height: 30px;line-height:30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">사전</div>
                <div style="width: 50px; height: 30px;line-height:30px;   border-right: 1px solid black; text-align: center;"><%=rlist.get(0) %></div>
            </div>
            <div style="display: table-cell">   
                <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; text-align: center; background-color: #ccc !important;">사후</div>
                <div style="width: 51px; height: 30px;line-height:30px;  text-align: center;"><%=rlist.get(1) %></div>
            </div>
         </div>
        <div style="display: table-cell; border:1px solid black; width:101px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:101px; height: 30px;line-height:30px;  text-align: center; background-color: #ccc !important;"> 평점 </div>
            <div style="display: table-cell">   
                <div style="width: 50px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">사전</div>
                <div style="width: 50px; height: 30px;line-height:30px;   border-right: 1px solid black; text-align: center;"><%=rlist.get(2) %></div>
            </div>
            <div style="display: table-cell">   
                <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; text-align: center; background-color: #ccc !important;">사후</div>
                <div style="width: 51px; height: 30px;line-height:30px;  text-align: center;"><%=rlist.get(3) %></div>
            </div>
         </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle; background-color: #ccc !important;">상담치유<br>효과</div>
        <div style="display: table-cell; border:1px solid black; width:101px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:101px; height: 30px;line-height:30px;  text-align: center; background-color: #ccc !important;"> 총점 </div>
            <div style="display: table-cell">   
                <div style="width: 50px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">사전</div>
                <div style="width: 50px; height: 30px;line-height:30px;   border-right: 1px solid black; text-align: center;"><%=rlist.get(4) %></div>
            </div>
            <div style="display: table-cell">   
                <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; text-align: center; background-color: #ccc !important;">사후</div>
                <div style="width: 51px; height: 30px;line-height:30px;  text-align: center;"><%=rlist.get(5) %></div>
            </div>
         </div>
        <div style="display: table-cell; border:1px solid black; width:101px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:101px; height: 30px;line-height:30px;  text-align: center; background-color: #ccc !important;"> 평점 </div>
            <div style="display: table-cell">   
                <div style="width: 50px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">사전</div>
                <div style="width: 50px; height: 30px;line-height:30px;   border-right: 1px solid black; text-align: center;"><%=rlist.get(6) %></div>
            </div>
            <div style="display: table-cell">   
                <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; text-align: center; background-color: #ccc !important;">사후</div>
                <div style="width: 51px; height: 30px;line-height:30px;  text-align: center;"><%=rlist.get(7) %></div>
            </div>
         </div>
        <div style="display: table-cell; border:1px solid black; width: 51px; height: 90px; vertical-align: middle; background-color: #ccc !important;">힐링효과</div>
        <div style="display: table-cell; border:1px solid black; width:101px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:101px; height: 30px;line-height:30px;  text-align: center; background-color: #ccc !important;"> 총점 </div>
            <div style="display: table-cell">   
                <div style="width: 50px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">사전</div>
                <div style="width: 50px; height: 30px;line-height:30px;   border-right: 1px solid black; text-align: center;"><%=rlist.get(8) %></div>
            </div>
            <div style="display: table-cell">   
                <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; text-align: center; background-color: #ccc !important;">사후</div>
                <div style="width: 51px; height: 30px;line-height:30px;  text-align: center;"><%=rlist.get(9) %></div>
            </div>
         </div>
        <div style="display: table-cell; border:1px solid black; width:101px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:101px; height: 30px;line-height:30px;  text-align: center; background-color: #ccc !important;"> 평점 </div>
            <div style="display: table-cell">   
                <div style="width: 50px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">사전</div>
                <div style="width: 50px; height: 30px;line-height:30px;   border-right: 1px solid black; text-align: center;"><%=rlist.get(10) %></div>
            </div>
            <div style="display: table-cell">   
                <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; text-align: center; background-color: #ccc !important;">사후</div>
                <div style="width: 51px; height: 30px;line-height:30px;  text-align: center;"><%=rlist.get(11) %></div>
            </div>
         </div>
         <div style="display: table-cell; border:1px solid black; width: 154px; height: 90px; vertical-align: middle; background-color: #ccc !important;"></div>
    </div>
    
    
    <!--자율신경검사 효과성  -->
    <div style=" display:table inline-block; padding:10px; border-collapse: collapse; font-size: 10px;text-align: center; ">
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 60px; vertical-align: middle; background-color: #ccc !important;">자율신경<br>검사<br>효과성</div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 60px; vertical-align: middle; background-color: #ccc !important;">자율신경<br>활성도</div>
        <div style="display: table-cell; border:1px solid black; width:100px; height: 60px; text-align: center;">
            <div style="display: table-cell">   
                <div style="width: 50px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">사전</div>
                <div style="width: 50px; height: 30px;line-height:30px;   border-right: 1px solid black; text-align: center;"><%=HrvList.get(0).getNum1() %></div>
            </div>
            <div style="display: table-cell">   
                <div style="width: 50px; height: 30px;line-height:30px;  border-bottom: 1px solid black; text-align: center; background-color: #ccc !important;">사후</div>
                <div style="width: 50px; height: 30px;line-height:30px;  text-align: center;"><%=HrvList.get(0).getNum6() %></div>
            </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 60px; vertical-align: middle; background-color: #ccc !important;">자율신경<br>균형도</div>
        <div style="display: table-cell; border:1px solid black; width:100px; height: 60px; text-align: center;">
            <div style="display: table-cell">   
                <div style="width: 52px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">사전</div>
                <div style="width: 52px; height: 30px;line-height:30px;   border-right: 1px solid black; text-align: center;"><%=HrvList.get(0).getNum2() %></div>
            </div>
            <div style="display: table-cell">   
                <div style="width: 50px; height: 30px;line-height:30px;  border-bottom: 1px solid black; text-align: center; background-color: #ccc !important;">사후</div>
                <div style="width: 50px; height: 30px;line-height:30px;  text-align: center;"><%=HrvList.get(0).getNum7() %></div>
            </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 60px; vertical-align: middle; background-color: #ccc !important;">스트레스<br>저항도</div>
        <div style="display: table-cell; border:1px solid black; width:100px; height: 60px; text-align: center;">
            <div style="display: table-cell">   
                <div style="width: 52px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">사전</div>
                <div style="width: 52px; height: 30px; line-height:30px;  border-right: 1px solid black; text-align: center;"><%=HrvList.get(0).getNum3() %></div>
            </div>
            <div style="display: table-cell">   
                <div style="width: 50px; height: 30px;line-height:30px;  border-bottom: 1px solid black; text-align: center; background-color: #ccc !important;">사후</div>
                <div style="width: 50px; height: 30px;line-height:30px;  text-align: center;"><%=HrvList.get(0).getNum8() %></div>
            </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 60px; vertical-align: middle; background-color: #ccc !important;">스트레스<br>지수</div>
        <div style="display: table-cell; border:1px solid black; width:100px; height: 60px; text-align: center;">
            <div style="display: table-cell">   
                <div style="width: 52px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">사전</div>
                <div style="width: 52px; height: 30px;line-height:30px;   border-right: 1px solid black; text-align: center;"><%=HrvList.get(0).getNum4() %></div>
            </div>
            <div style="display: table-cell">   
                <div style="width: 52px; height: 30px;line-height:30px;  border-bottom: 1px solid black; text-align: center; background-color: #ccc !important;">사후</div>
                <div style="width: 52px; height: 30px;line-height:30px;  text-align: center;"><%=HrvList.get(0).getNum9() %></div>
            </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 60px; vertical-align: middle; background-color: #ccc !important;">피로도</div>
        <div style="display: table-cell; border:1px solid black; width:100px; height: 60px; text-align: center;">
            <div style="display: table-cell">   
                <div style="width: 50px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">사전</div>
                <div style="width: 50px; height: 30px;line-height:30px;   border-right: 1px solid black; text-align: center;"><%=HrvList.get(0).getNum5() %></div>
            </div>
            <div style="display: table-cell">   
                <div style="width: 50px; height: 30px;line-height:30px;  border-bottom: 1px solid black; text-align: center; background-color: #ccc !important;">사후</div>
                <div style="width: 50px; height: 30px;line-height:30px;  text-align: center;"><%=HrvList.get(0).getNum10() %></div>
            </div>
        </div>
        <div style="display: table-cell; border:1px solid black; width: 154px; height: 60px; vertical-align: middle; background-color: #ccc !important;"></div>
    </div>
    
   <!--===========================================================================================================================================================================================   -->
    <!-- 소감  -->
    <div style=" display:table inline-block; padding:10px; border-collapse: collapse; font-size: 10px;text-align: center; ">
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle; background-color: #ccc !important;">소감</div>
        <div style="display: table-cell; border:1px solid black; width:100px; min-height: 90px; text-align: center;">
            <div style="display: table-cell; border-right: 1px solid black;">   
                <div style="width: 450px; height: 30px;line-height:30px; border-bottom: 1px solid black; text-align: center; background-color: #ccc !important;">프로그램 소감</div>
                <div style="width: 450px; min-height: 60px; text-align: center;vertical-align: middle"><pre style="font-size: 10px; border: 0px; font-family: 'NanumSquare'; background-color: transparent; padding: 5px; margin: 0px; white-space: pre-wrap;"><%=convertXSS(basicList.get(0).getProgram_opinion())%></pre></div>
            </div>
            <div style="display: table-cell">   
                <div style="width: 465px; height: 30px; line-height:30px; border-bottom: 1px solid black; text-align: center; background-color: #ccc !important;">시설 등 소감</div>
                <div style="width: 465px; min-height: 60px; text-align: center;vertical-align: middle"><pre style="font-size: 10px; border: 0px; font-family: 'NanumSquare'; background-color: transparent; padding: 5px; margin: 0px; white-space: pre-wrap;"><%=convertXSS(basicList.get(0).getService_opinion())%></pre></div>
            </div>
        </div>
    </div>
  <!--===========================================================================================================================================================================================   -->
    <!-- 종합의견 -->
    <div style=" display:table inline-block; padding:10px; border-collapse: collapse; font-size: 10px;text-align: center; ">
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle; background-color: #ccc !important;">프로그램<br>효과성</div>
        <div style="display: table-cell; border:1px solid black; width:916px; height: 60px; text-align: center;vertical-align: middle"><pre style="font-size: 10px; border: 0px; font-family: 'NanumSquare'; background-color: transparent; padding: 5px; margin: 0px; white-space: pre-wrap;"><%=convertXSS(basicList.get(0).getOverall_opinion())%></pre></div>
    </div>
     <br><br><br>
  <!--===========================================================================================================================================================================================   -->
    <!-- 지출금액 -->
   <% if(ExpenseList !=null) {%>
    <div style="display: table inline-block; padding: 10px; border-collapse: collapse; font-size: 10px; text-align: center;">
    	<div style="display: table-cell; border:1px solid black; width: 50px; height: auto; vertical-align: middle; background-color: #ccc !important;">지출<br>금액</div>
    	<div style="display: table-cell;border:1px solid black;">
				<div style="width:auto; height: 20px; border-bottom: 1px solid black; background-color: #ccc !important;">예정금액-강사</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 100px; height: 20px; border-right: 1px solid black;background-color: #ccc !important;">강사비(천원)</div>
					<div style="display: table-cell; width: 100px; height: 20px; border-right: 1px solid black;"><%=nvl(ExpenseList.get(0).getPrice1().get(0)) %></div>
					<div style="display: table-cell; width: 100px; height: 20px; border-right: 1px solid black;background-color: #ccc !important;">보조 강사비(천원)</div>
					<div style="display: table-cell; width: 100px; height: 20px; border-right: 1px solid black;"><%=nvl(ExpenseList.get(2).getPrice1().get(0)) %></div>
					<div style="display: table-cell; width: 100px; height: 20px; border-right: 1px solid black;background-color: #ccc !important;">교통비(천원)</div>
					<div style="display: table-cell; width: 100px; height: 20px; border-right: 1px solid black;"><%=nvl(ExpenseList.get(1).getPrice1().get(0)) %></div>
					<div style="display: table-cell; width: 100px; height: 20px; border-right: 1px solid black;background-color: #ccc !important;">식비(천원)</div>
					<div style="display: table-cell; width: 100px; height: 20px; "><%=nvl(ExpenseList.get(3).getPrice1().get(0)) %></div>
				</div>
				<div style="width:auto; height: 20px; border-top:1px solid black;border-bottom: 1px solid black; background-color: #ccc !important;">집행금액-강사</div>
				<div style="display: table-cell;">
					<div style="display: table-row">
						<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc !important;">강사비(천원)</div>
						<div style="display: table-cell; width: 553px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc !important;">세부내역</div>
						<div style="display: table-cell; width: 262px; height: 20px;border-bottom: 1px solid black; background-color: #ccc !important;">비고</div>
					</div>
					<%for(int i=0; i<ExpenseList.get(4).getPrice1().size(); i++){ %>
					<div style="display: table-row">
						<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><%=nvl(ExpenseList.get(4).getPrice1().get(i)) %></div>
						<div style="display: table-cell; width: 553px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><%=CmmUtil.convertXSS(ExpenseList.get(4).getDetail1().get(i)) %></div>
						<div style="display: table-cell; width: 262px; height: 20px;border-bottom: 1px solid black; "><%=CmmUtil.convertXSS(ExpenseList.get(4).getNote1().get(i)) %></div>
					</div>
					<%} %>
					<div style="display: table-row">
						<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc!important;">보조강사비(천원)</div>
						<div style="display: table-cell; width: 553px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc!important;">세부내역</div>
						<div style="display: table-cell; width: 262px; height: 20px;border-bottom: 1px solid black; background-color: #ccc !important;">비고</div>
					</div>
					<% for(int i=0; i<ExpenseList.get(6).getPrice1().size(); i++){ %>
					<div style="display: table-row">
						<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><%=nvl(ExpenseList.get(6).getPrice1().get(i)) %></div>
						<div style="display: table-cell; width: 553px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><%=CmmUtil.convertXSS(ExpenseList.get(6).getDetail1().get(i)) %></div>
						<div style="display: table-cell; width: 262px; height: 20px;border-bottom: 1px solid black; "><%=CmmUtil.convertXSS(ExpenseList.get(6).getNote1().get(i)) %></div>
					</div>
					<%} %>
					<div style="display: table-row">
						<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc!important;">교통비(천원)</div>
						<div style="display: table-cell; width: 553px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc!important;">세부내역</div>
						<div style="display: table-cell; width: 262px; height: 20px;border-bottom: 1px solid black; background-color: #ccc!important;">비고</div>
					</div>
					<%for(int i=0; i<ExpenseList.get(5).getPrice1().size(); i++){ %>
					<div style="display: table-row">
						<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><%=nvl(ExpenseList.get(5).getPrice1().get(i)) %></div>
						<div style="display: table-cell; width: 553px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><%=CmmUtil.convertXSS(ExpenseList.get(5).getDetail1().get(i)) %></div>
						<div style="display: table-cell; width: 262px; height: 20px;border-bottom: 1px solid black; "><%=CmmUtil.convertXSS(ExpenseList.get(5).getNote1().get(i)) %></div>
					</div>
					<%} %>
					<div style="display: table-row">
						<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc!important;">식사비(천원)</div>
						<div style="display: table-cell; width: 553px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc!important;">세부내역</div>
						<div style="display: table-cell; width: 262px; height: 20px;border-bottom: 1px solid black; background-color: #ccc!important;">비고</div>
					</div>
					<%for(int i=0; i<ExpenseList.get(7).getPrice1().size(); i++){ %>
					<div style="display: table-row">
						<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><%=nvl(ExpenseList.get(7).getPrice1().get(i)) %></div>
						<div style="display: table-cell; width: 553px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><%=CmmUtil.convertXSS(ExpenseList.get(7).getDetail1().get(i)) %></div>
						<div style="display: table-cell; width: 262px; height: 20px;border-bottom: 1px solid black; "><%=CmmUtil.convertXSS(ExpenseList.get(7).getNote1().get(i)) %></div>
					</div>
					<%} %>
				</div>
				<div style="width:auto; height: 20px; border-bottom: 1px solid black; background-color: #ccc!important;">예정금액-참가자</div>
				<div style="display: table-cell;">
					<div style="display: table-cell; width: 100px; height: 20px; border-right: 1px solid black;background-color: #ccc!important;">숙박비(천원)</div>
					<div style="display: table-cell; width: 100px; height: 20px; border-right: 1px solid black;"><fmt:formatNumber value="<%=nvl(ExpenseList.get(8).getPrice1().get(0)) %>" pattern="#,###"/></div>
					<div style="display: table-cell; width: 100px; height: 20px; border-right: 1px solid black;background-color: #ccc!important;">식사비(천원)</div>
					<div style="display: table-cell; width: 100px; height: 20px; border-right: 1px solid black;"><fmt:formatNumber value="<%=nvl(ExpenseList.get(9).getPrice1().get(0)) %>" pattern="#,###"/></div>
					<div style="display: table-cell; width: 100px; height: 20px; border-right: 1px solid black;background-color: #ccc!important;">쟤료비(천원)</div>
					<div style="display: table-cell; width: 100px; height: 20px; border-right: 1px solid black;"><fmt:formatNumber value="<%=nvl(ExpenseList.get(11).getPrice1().get(0)) %>" pattern="#,###"/></div>
					<div style="display: table-cell; width: 100px; height: 20px; border-right: 1px solid black;background-color: #ccc!important;">예비비(천원)</div>
					<div style="display: table-cell; width: 100px; height: 20px; "><fmt:formatNumber value="<%=nvl(ExpenseList.get(10).getPrice1().get(0)) %>" pattern="#,###"/></div>
				</div>
				<div style="width:auto; height: 20px; border-top:1px solid black;border-bottom: 1px solid black;background-color: #ccc!important;">집행금액-참가자</div>
				<div style="display: table-cell;">
					<div style="display: table-row">
						<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc !important;">숙박비(천원)</div>
						<div style="display: table-cell; width: 553px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc !important;">세부내역</div>
						<div style="display: table-cell; width: 262px; height: 20px;border-bottom: 1px solid black; background-color: #ccc !important;">비고</div>
					</div>
					<%for(int i=0; i<ExpenseList.get(13).getPrice1().size(); i++){ %>
					<div style="display: table-row">
						<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><fmt:formatNumber value="<%=nvl(ExpenseList.get(13).getPrice1().get(i)) %>" pattern="#,###"/></div>
						<div style="display: table-cell; width: 553px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><%=CmmUtil.convertXSS(ExpenseList.get(13).getDetail1().get(i)) %></div>
						<div style="display: table-cell; width: 262px; height: 20px;border-bottom: 1px solid black; "><%=CmmUtil.convertXSS(ExpenseList.get(13).getNote1().get(i)) %></div>
					</div>
					<%} %>
					<div style="display: table-row">
						<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc !important;">식사비(천원)</div>
						<div style="display: table-cell; width: 553px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc !important;">세부내역</div>
						<div style="display: table-cell; width: 262px; height: 20px;border-bottom: 1px solid black;background-color: #ccc !important; ">비고</div>
					</div>
					<%for(int i=0; i<ExpenseList.get(14).getPrice1().size(); i++){ %>
					<div style="display: table-row">
						<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><fmt:formatNumber value="<%=nvl(ExpenseList.get(14).getPrice1().get(i)) %>" pattern="#,###"/></div>
						<div style="display: table-cell; width: 553px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><%=CmmUtil.convertXSS(ExpenseList.get(14).getDetail1().get(i)) %></div>
						<div style="display: table-cell; width: 262px; height: 20px;border-bottom: 1px solid black; "><%=CmmUtil.convertXSS(ExpenseList.get(14).getNote1().get(i)) %></div>
					</div>
					<%} %>
					<div style="display: table-row">
						<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc !important;">쟤료비(천원)</div>
						<div style="display: table-cell; width: 553px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc !important;">세부내역</div>
						<div style="display: table-cell; width: 262px; height: 20px;border-bottom: 1px solid black; background-color: #ccc !important;">비고</div>
					</div>
					<%for(int i=0; i<ExpenseList.get(15).getPrice1().size(); i++){ %>
					<div style="display: table-row">
						<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><fmt:formatNumber value="<%=nvl(ExpenseList.get(15).getPrice1().get(i)) %>" pattern="#,###"/></div>
						<div style="display: table-cell; width: 553px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><%=CmmUtil.convertXSS(ExpenseList.get(15).getDetail1().get(i)) %></div>
						<div style="display: table-cell; width: 262px; height: 20px;border-bottom: 1px solid black; "><%=CmmUtil.convertXSS(ExpenseList.get(15).getNote1().get(i)) %></div>
					</div>
					<%} %>
					<div style="display: table-row">
						<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc !important;">기타(천원)</div>
						<div style="display: table-cell; width: 553px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc !important;">세부내역</div>
						<div style="display: table-cell; width: 262px; height: 20px;border-bottom: 1px solid black;background-color: #ccc !important; ">비고</div>
					</div>
					<%for(int i=0; i<ExpenseList.get(12).getPrice1().size(); i++){ %>
					<div style="display: table-row">
						<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><fmt:formatNumber value="<%=nvl(ExpenseList.get(12).getPrice1().get(i)) %>" pattern="#,###"/></div>
						<div style="display: table-cell; width: 553px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><%=CmmUtil.convertXSS(ExpenseList.get(12).getDetail1().get(i)) %></div>
						<div style="display: table-cell; width: 262px; height: 20px;border-bottom: 1px solid black;"><%=CmmUtil.convertXSS(ExpenseList.get(12).getNote1().get(i)) %></div>
					</div>
					<%} %>
					<div style="width:auto; height: 20px; border-bottom: 1px solid black; background-color: #ccc!important ;">합계</div>
						<div style="display: table-cell;">
							<div style="display: table-cell; width: 200px; height: 20px; border-right: 1px solid black;background-color: #ccc !important;">예산금액 합계</div>
							<div style="display: table-cell; width: 200px; height: 20px; border-right: 1px solid black;"><fmt:formatNumber value="<%=pre_expense_sum %>" pattern="#,###"/>    </div>
							<div style="display: table-cell; width: 200px; height: 20px; border-right: 1px solid black;background-color: #ccc !important;">집행금액 함계</div>
							<div style="display: table-cell; width: 262px; height: 20px; "><fmt:formatNumber value="<%=expense_sum %>" pattern="#,###"/></div>
						</div>
				</div>
		</div>
	</div>
	<%} %>
    <!--============================================================================== 수입금액 ==========================================================================================-->
    <%if(IncomeList != null){ %>
    <div style=" display:table inline-block; padding:10px; border-collapse: collapse; font-size: 10px;text-align: center; ">
        <div style="display: table-cell; border:1px solid black; width: 50px; height: auto; vertical-align: middle; background-color: #ccc !important;">수익<br>금액</div>
       	<div style="display: table-cell;">
				<div style="display: table-row; border-top: 1px solid black;">
					<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc !important;">수입항목</div>
					<div style="display: table-cell; width: 150px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc !important;">수입금액</div>
					<div style="display: table-cell; width: 450px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;background-color: #ccc !important;">세부내역</div>
					<div style="display: table-cell; width: 160px; height: 20px;border-bottom: 1px solid black; background-color: #ccc !important;">비고</div>
				</div>
				<%for(int i=0; i<IncomeList.get(4).getPrice1().size();i++) {%>
				<div style="display: table-row; border-top: 1px solid black;">
					<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;">프로그램(천원)</div>
					<div style="display: table-cell; width: 150px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><fmt:formatNumber value="<%=nvl(IncomeList.get(4).getPrice1().get(i)) %>" pattern="#,###"/></div>
					<div style="display: table-cell; width: 450px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><%=CmmUtil.convertXSS(IncomeList.get(4).getDetail1().get(i)) %></div>
					<div style="display: table-cell; width: 160px; height: 20px;border-bottom: 1px solid black; "><%=CmmUtil.convertXSS(IncomeList.get(4).getNote1().get(i)) %></div>
				</div>
				<%} %>
				<%for(int i=0; i<IncomeList.get(1).getPrice1().size();i++) {%>
				<div style="display: table-row; border-top: 1px solid black;">
					<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;">숙박비(천원)</div>
					<div style="display: table-cell; width: 150px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><fmt:formatNumber value="<%=nvl(IncomeList.get(1).getPrice1().get(i)) %>" pattern="#,###"/></div>
					<div style="display: table-cell; width: 450px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><%=CmmUtil.convertXSS(IncomeList.get(1).getDetail1().get(i)) %></div>
					<div style="display: table-cell; width: 160px; height: 20px;border-bottom: 1px solid black; "><%=CmmUtil.convertXSS(IncomeList.get(1).getNote1().get(i)) %></div>
				</div>
				<%} %>
				<%for(int i=0; i<IncomeList.get(2).getPrice1().size();i++) {%>
				<div style="display: table-row; border-top: 1px solid black;">
					<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;">식사비(천원)</div>
					<div style="display: table-cell; width: 150px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><fmt:formatNumber value="<%=nvl(IncomeList.get(2).getPrice1().get(i)) %>" pattern="#,###"/></div>
					<div style="display: table-cell; width: 450px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><%=CmmUtil.convertXSS(IncomeList.get(2).getDetail1().get(i)) %></div>
					<div style="display: table-cell; width: 160px; height: 20px;border-bottom: 1px solid black; "><%=CmmUtil.convertXSS(IncomeList.get(2).getNote1().get(i)) %></div>
				</div>
				<%} %>
				<%for(int i=0; i<IncomeList.get(3).getPrice1().size();i++) {%>
				<div style="display: table-row; border-top: 1px solid black;">
					<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;">쟤료비(천원)</div>
					<div style="display: table-cell; width: 150px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><fmt:formatNumber value="<%=nvl(IncomeList.get(3).getPrice1().get(i)) %>" pattern="#,###"/></div>
					<div style="display: table-cell; width: 450px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><%=CmmUtil.convertXSS(IncomeList.get(3).getDetail1().get(i)) %></div>
					<div style="display: table-cell; width: 160px; height: 20px;border-bottom: 1px solid black; "><%=CmmUtil.convertXSS(IncomeList.get(3).getNote1().get(i)) %></div>
				</div>
				<%} %>
				<%for(int i=0; i<IncomeList.get(0).getPrice1().size();i++) {%>
				<div style="display: table-row; border-top: 1px solid black;">
					<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;">기타(천원)</div>
					<div style="display: table-cell; width: 150px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><fmt:formatNumber value="<%=nvl(IncomeList.get(0).getPrice1().get(i)) %>" pattern="#,###"/></div>
					<div style="display: table-cell; width: 450px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><%=CmmUtil.convertXSS(IncomeList.get(0).getDetail1().get(i)) %></div>
					<div style="display: table-cell; width: 160px; height: 20px;border-bottom: 1px solid black; "><%=CmmUtil.convertXSS(IncomeList.get(0).getNote1().get(i)) %></div>
				</div>
				<%} %>
				<div style="display: table-row; border-top: 1px solid black;">
					<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;">계(천원)</div>
					<div style="display: table-cell; width: 150px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><fmt:formatNumber value="<%=income_sum %>" pattern="#,###"/></div>
					<div style="display: table-cell; width: 450px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><%=IncomeList.get(5).getPrice1().get(0) %>%</div>
					<div style="display: table-cell; width: 160px; height: 20px;border-bottom: 1px solid black; "><%=IncomeList.get(5).getNote1().get(0) %></div>
				</div>
				<div style="display: table-row; border-top: 1px solid black;">
					<div style="display: table-cell; width: 100px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;">최종금액(천원)</div>
					<div style="display: table-cell; width: 150px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"><fmt:formatNumber value="<%=income_sum *(100-Integer.parseInt(IncomeList.get(5).getPrice1().get(0)))/100 %>" pattern="#,###"/></div>
					<div style="display: table-cell; width: 450px; height: 20px;border-bottom: 1px solid black; border-right: 1px solid black;"></div>
					<div style="display: table-cell; width: 160px; height: 20px;border-bottom: 1px solid black; "></div>
				</div>
			</div>
			
			<div style="display: table-cell; border:1px solid black; width: 56px; height: auto; vertical-align: middle; background-color: #ccc !important;"></div>
    </div> 
    <%} %>
   
    


</div>
</body>
</html>