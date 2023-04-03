<%@page import="poly.dto.HrvInsertDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="poly.dto.SearchDTO"%>
<%@page import="poly.dto.ServiceInsertDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="static poly.util.CmmUtil.nvl" %>
<%@ page import ="poly.dto.ResidenceDTO" %>
<%@ page import ="poly.dto.BasicInfoDTO" %>
<%@ page import ="java.util.List" %>
<%
	HashMap<String,String> residenceCountMap = (HashMap<String,String>)request.getAttribute("residenceCountMap");
	HashMap<String,String> residenceSumMap = (HashMap<String,String>)request.getAttribute("residenceSumMap");
	HashMap<String,String> partCountMap = (HashMap<String,String>)request.getAttribute("partCountMap");
	HashMap<String,String> partSumMap = (HashMap<String,String>)request.getAttribute("partSumMap");
	HashMap<String,String> bizCountMap = (HashMap<String,String>)request.getAttribute("bizCountMap");
	HashMap<String,String> bizSumMap = (HashMap<String,String>)request.getAttribute("bizSumMap");
	HashMap<String,List> proAvgMap = (HashMap<String,List>)request.getAttribute("proAvgMap");
	List<SearchDTO> serEnvList =(List<SearchDTO>)request.getAttribute("serEnvList");
	List<SearchDTO> HrvList =(List<SearchDTO>)request.getAttribute("HrvList");
	HashMap<String,String> effectMap = (HashMap<String,String>)request.getAttribute("effectMap");
	String[] proCountMap = (String[])request.getAttribute("proCountMap");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>연월 통계</title>
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
<body>
	 <!-- 상단 제목 -->
    
    <div style="width:1000px; height:20px;">
        <div style="display: table-cell;">
            <div style="display: table-cell;width: 200px; line-height: 30px;height: 20px;  "></div>
            <div style="display: table-cell;width: 200px; line-height: 30px;height: 20px;  "></div>
            <div style="display: table-cell;width: 200px; line-height: 30px;height: 20px;  "></div>
            <div style="display: table-cell;width: 200px; line-height: 30px;height: 20px;  "></div>
            <div style="display: table-cell;width: 200px; line-height: 30px;height: 20px; font-size: 8px;  "></div>
        </div>
    </div>
    <!-- 참가유형 -->
    <% String[] List_age ={"아동","청소년","성인","노인"}; %>
    <div style=" display:table inline-block; padding:10px; border-collapse: collapse; font-size: 10px;text-align: center; vertical-align: middle; ">
        <div style=" display:table inline-block; padding:10px; border-collapse: collapse; font-size: 10px;text-align: center; ">
         <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 50px; line-height: 60px;height: 60px; text-align: center; background-color: #ccc !important;">참가유형</div>
            <div style=" border-bottom:1px solid black; width:50px; line-height: 30px;height: 30px; text-align: center;background-color: #ccc !important;">유형(건)</div>
            <div style=" width:50px; line-height: 30px;height: 30px; text-align: center;background-color: #ccc !important;">인원(수)</div>
        </div>
        <div style="display: table-cell; border:1px solid black; width:auto; height: 120px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:auto; line-height: 30px; height: 30px; text-align: center; background-color: #ccc !important;">연령대</div>
            <% for(int i=0; i<List_age.length; i++) { %>
                <div style="display: table-cell">   
                    <div style="width: 50px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;"><%=List_age[i] %></div>
                    <div style="width: 50px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center; "><%=nvl(partCountMap.get(List_age[i])) %></div>
                    <div style="width: 50px; line-height: 30px;height: 30px; border-right: 1px solid black; text-align: center;"><%=nvl(partSumMap.get(List_age[i])) %></div>
                </div> 
              <%} %>
                <div style="display: table-cell">   
                    <div style="width: 50px; line-height: 30px;height: 30px; border-bottom: 1px solid black;  text-align: center; background-color: #ccc !important;">계</div>
                    <div style="width: 50px; line-height: 30px;height: 30px; border-bottom: 1px solid black; text-align: center; " ><%=nvl(partCountMap.get("연령합")) %></div>
                    <div style="width: 50px; line-height: 30px;height: 30px;  text-align: center;"><%=nvl(partSumMap.get("연령합")) %></div>
                </div> 
              </div>  
    <% String[] List_part ={"장애인","저소득","가족","중독","교직원","기타"}; %>
         <div style="display: table-cell; border:1px solid black; width:auto; height: 120px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:auto; line-height: 30px; height: 30px; text-align: center; background-color: #ccc !important;">참가자 유형</div>
            	<%for (int i =0; i<List_part.length; i++){ %>
                <div style="display: table-cell">   
                    <div style="width: 50px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;"><%=List_part[i] %></div>
                    <div style="width: 50px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center;"><%=nvl(partCountMap.get(List_part[i])) %></div>
                    <div style="width: 50px; line-height: 30px;height: 30px; border-right: 1px solid black; text-align: center;"><%=nvl(partSumMap.get(List_part[i])) %></div>
                </div> 
			<%} %>
                <div style="display: table-cell">   
                    <div style="width: 50px; line-height: 30px;height: 30px; border-bottom: 1px solid black;  text-align: center; background-color: #ccc !important;">계</div>
                    <div style="width: 50px; line-height: 30px;height: 30px; border-bottom: 1px solid black; text-align: center;"><%=nvl(partCountMap.get("참가자합")) %></div>
                    <div style="width: 50px; line-height: 30px;height: 30px;  text-align: center;"><%=nvl(partSumMap.get("참가자합")) %></div>
                </div> 
            </div>
            <div style="display: table-cell; border:1px solid black; width:204px; height: 120px; text-align: center;">
                <div style=" border-bottom:1px solid black; width:204px;line-height: 30px; height: 30px; text-align: center; background-color: #ccc !important;"> 수입구분</div>
                <div style="display: table-cell">   
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">녹색자금</div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center;"><%=nvl(bizCountMap.get("녹색자금"))%></div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-right: 1px solid black; text-align: center;"><%=nvl(bizSumMap.get("녹색자금"))%></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">산림복지</div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center;"><%=nvl(bizCountMap.get("산림복지"))%></div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-right: 1px solid black; text-align: center;"><%=nvl(bizSumMap.get("산림복지"))%></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">기타</div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center;"><%=nvl(bizCountMap.get("기타"))%></div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-right: 1px solid black; text-align: center;"><%=nvl(bizSumMap.get("기타"))%></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black;  text-align: center; background-color: #ccc !important;">계</div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; text-align: center;"><%=nvl(bizCountMap.get("수익합"))%></div>
                    <div style="width: 51px; line-height: 30px;height: 30px;  text-align: center;"><%=nvl(bizSumMap.get("수익합"))%></div>
                </div> 
             </div>
             <div style="display: table-cell; border:1px solid black; width:152px; height: 120px; text-align: center;">
                <div style=" border-bottom:1px solid black; width:152px;line-height: 30px; height: 30px; text-align: center; background-color: #ccc !important;"> 사업목적</div>
                <div style="display: table-cell">   
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">사회공헌</div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center;"><%=nvl(bizCountMap.get("사회공헌"))%></div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-right: 1px solid black; text-align: center;"><%=nvl(bizSumMap.get("사회공헌"))%></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">수익사업</div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-bottom: 1px solid black; border-right: 1px solid black;text-align: center;"><%=nvl(bizCountMap.get("수익사업"))%></div>
                    <div style="width: 51px; line-height: 30px;height: 30px; border-right: 1px solid black; text-align: center;"><%=nvl(bizSumMap.get("수익사업"))%></div>
                </div> 
                <div style="display: table-cell">   
                    <div style="width: 50px; line-height: 30px;height: 30px; border-bottom: 1px solid black; text-align: center; background-color: #ccc !important;">계</div>
                    <div style="width: 50px; line-height: 30px;height: 30px; border-bottom: 1px solid black; text-align: center;"><%=nvl(bizCountMap.get("사업합"))%></div>
                    <div style="width: 50px; line-height: 30px;height: 30px;  text-align: center;"><%=nvl(bizSumMap.get("사업합"))%></div>
                </div> 
            </div>
    </div>
    
    
    <!-- 지역  -->
  <% String[] list_res = {"서울","부산","대구","인천","대전","광주","울산","경기","강원","폐광지역","충북","충남","세종","경북","경남","전북","전남","제주"}; %> 
  <% String a = " "; %>
     <!-- 지역구분 -->
     <div style=" display:table inline-block; padding:10px; border-collapse: collapse; font-size: 10px;text-align: center; ">
         <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 50px; line-height: 30px;height: 30px; text-align: center; background-color: #ccc !important;">지역</div>
            <div style=" border-bottom:1px solid black; width:50px; line-height: 30px;height: 30px; text-align: center;background-color: #ccc !important;">유형(건)</div>
            <div style=" width:50px; line-height: 30px;height: 30px; text-align: center;background-color: #ccc !important;">인원(수)</div>
        </div>
     <%for (int i =0; i<list_res.length;i++) { %>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 50px; line-height: 30px;height: 30px; text-align: center; background-color: #ccc !important;"><%=list_res[i]%></div>
            <div style=" border-bottom:1px solid black; width:50px; line-height: 30px;height: 30px; text-align: center;"><%= nvl(residenceCountMap.get(list_res[i]))%></div>
            <div style=" width:50px; line-height: 30px;height: 30px; text-align: center;"><%= nvl(residenceSumMap.get(list_res[i]))%></div>
        </div>
      <%} %>
       <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle;" >
      	     <div style="  border-bottom:1px solid black; width: 50px; line-height: 30px;height: 30px; text-align: center; background-color: #ccc !important;">계</div>
            <div style=" border-bottom:1px solid black; width:50px; line-height: 30px;height: 30px; text-align: center;"><%= nvl(residenceCountMap.get("계")) %> </div>
            <div style=" width:50px; line-height: 30px;height: 30px; text-align: center;"><%= nvl(residenceSumMap.get("계"))%></div>
        </div>
       </div>
    
  
    
    <!-- 프로그램 운영 및 만족도 -->
    <% String[] list_pro = {"산림교육","예방교육","산림치유","아트","릴렉싱","에너제틱","쿠킹","이벤트"}; %>
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
        <%for (int i=0; i<list_pro.length; i++) {%>
        <div style="display: table-cell; border:1px solid black; width: 100px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 100px; line-height: 30px;height: 30px; text-align: center;background-color: #ccc !important; "><%=list_pro[i] %></div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=proCountMap[i*3] %></div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=proCountMap[i*3+1] %></div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=proCountMap[i*3+2] %></div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=proAvgMap.get(list_pro[i]).get(0) %></div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=proAvgMap.get(list_pro[i]).get(1) %></div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=proAvgMap.get(list_pro[i]).get(2) %></div>
            <div style=" width:100px; line-height: 30px;height: 30px; text-align: center;"><%=proAvgMap.get(list_pro[i]).get(3) %></div>
        </div>
       <%} %>
        <div style="display: table-cell; border:1px solid black; width: 100px; height: 90px; vertical-align: middle;" >
            <div style="  border-bottom:1px solid black; width: 100px; line-height: 30px;height: 30px; text-align: center; background-color: #ccc !important;">합계/평균</div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=proCountMap[39] %> </div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=proCountMap[40] %> </div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=proCountMap[41] %> </div>
             <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=proAvgMap.get("평균").get(0) %> </div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=proAvgMap.get("평균").get(1) %> </div>
            <div style=" border-bottom:1px solid black; width:100px; line-height: 30px;height: 30px; text-align: center;"><%=proAvgMap.get("평균").get(2) %>  </div>
            <div style=" width:100px; line-height: 30px;height: 30px; text-align: center;"><%=proAvgMap.get("평균").get(3) %>  </div>
        </div>
        
    </div> 
    
    <!-- 시설 서비스 만족도 -->
    <div style=" display:table inline-block; padding:10px; border-collapse: collapse; font-size: 10px;text-align: center; vertical-align: middle; ">
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle; background-color: #ccc !important;">시설<br>서비스<br>만족도</div>
        <div style="display: table-cell; border:1px solid black; width: 50px; height: 90px; vertical-align: middle; background-color: #ccc !important;" >구분</div>
        <div style="display: table-cell; border:1px solid black; width:102px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:102px; line-height:30px;height: 30px; text-align: center; background-color: #ccc !important;"> 숙소</div>
            <div style="display: table-cell">   
                <div style="width: 51px; height: 30px;line-height:30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">편리성</div>
                <div style="width: 51px; height: 30px;line-height:30px; border-right: 1px solid black; text-align: center;"><%=nvl(serEnvList.get(0).getScore1()) %></div>
            </div> 
            <div style="display: table-cell; vertical-align: middle;">   
                <div style="width: 51px; height: 30px;line-height:30px; border-bottom: 1px solid black;  text-align: center; background-color: #ccc !important;">청결도</div>
                <div style="width: 51px; height: 30px;line-height:30px;  text-align: center;"><%=nvl(serEnvList.get(0).getScore2()) %></div>
            </div> 
        </div>   
        <div style="display: table-cell; border:1px solid black; width:101px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:101px; height: 30px;line-height:30px; text-align: center; background-color: #ccc !important;"> 식당</div>
            <div style="display: table-cell">   
                <div style="width: 50px; height: 30px;line-height:30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">편리성</div>
                <div style="width: 50px; height: 30px;line-height:30px; border-right: 1px solid black; text-align: center;"><%=nvl(serEnvList.get(0).getScore3()) %></div>
            </div> 
            <div style="display: table-cell; vertical-align: middle;">   
                <div style="width: 51px; height: 30px;line-height:30px; border-bottom: 1px solid black;  text-align: center; background-color: #ccc !important;">청결도</div>
                <div style="width: 51px; height: 30px;line-height:30px; text-align: center;"><%=nvl(serEnvList.get(0).getScore4()) %></div>
            </div> 
        </div> 
        <div style="display: table-cell; border:1px solid black; width:152px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:152px; height: 30px;line-height:30px; text-align: center; background-color: #ccc !important;"> 프로그램 장소</div>
            <div style="display: table-cell">   
                <div style="width: 50px; height: 30px;line-height:30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">편리성</div>
                <div style="width: 50px; height:30px;line-height:30px;  border-right: 1px solid black; text-align: center;"><%=nvl(serEnvList.get(0).getScore5()) %></div>
            </div> 
            <div style="display: table-cell; vertical-align: middle;">   
                <div style="width: 51px; height: 30px;line-height:30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">청결도</div>
                <div style="width: 51px; height: 30px;line-height:30px; border-right: 1px solid black; text-align: center;"><%=nvl(serEnvList.get(0).getScore6()) %></div>
            </div> 
            <div style="display: table-cell; vertical-align: middle;">   
                <div style="width: 51px; height: 30px;line-height:30px; border-bottom: 1px solid black;  text-align: center; background-color: #ccc !important;">적절성</div>
                <div style="width: 51px; height: 30px;line-height:30px;   text-align: center;"><%=nvl(serEnvList.get(0).getScore7()) %></div>
            </div> 
        </div> 
        <div style="display: table-cell; border:1px solid black; width:152px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:152x; height: 30px;line-height:30px; text-align: center; background-color: #ccc !important;"> 숲(야외)</div>
            <div style="display: table-cell">   
                <div style="width: 50px; height: 30px;line-height:30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">편리성</div>
                <div style="width: 50px; height: 30px;line-height:30px; border-right: 1px solid black; text-align: center;"><%=nvl(serEnvList.get(0).getScore8()) %></div>
            </div> 
            <div style="display: table-cell; vertical-align: middle;">   
                <div style="width: 51px; height: 30px;line-height:30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">청결도</div>
                <div style="width: 51px; height: 30px;line-height:30px; border-right: 1px solid black;  text-align: center;"><%=nvl(serEnvList.get(0).getScore9()) %></div>
            </div> 
            <div style="display: table-cell; vertical-align: middle;">   
                <div style="width: 51px; height: 30px;line-height:30px; border-bottom: 1px solid black;  text-align: center; background-color: #ccc !important;">적절성</div>
                <div style="width: 51px; height: 30px;line-height:30px;  text-align: center;"><%=nvl(serEnvList.get(0).getScore10()) %></div>
            </div> 
        </div> 
        <div style="display: table-cell; border:1px solid black; width:152px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:152px; height: 30px;line-height:30px; text-align: center; background-color: #ccc !important;"> 운영</div>
            <div style="display: table-cell">   
                <div style="width: 50px; height: 30px;line-height:30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">운영방식</div>
                <div style="width: 50px; height: 30px;line-height:30px; border-right: 1px solid black; text-align: center;"><%=nvl(serEnvList.get(0).getScore11()) %></div>
            </div> 
            <div style="display: table-cell; vertical-align: middle;">   
                <div style="width: 51px; height: 30px;line-height:30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">시간편성</div>
                <div style="width: 51px; height: 30px;line-height:30px; border-right: 1px solid black; text-align: center;"><%=nvl(serEnvList.get(0).getScore12()) %></div>
            </div> 
            <div style="display: table-cell; vertical-align: middle;">   
                <div style="width: 51px; height: 30px;line-height:30px; border-bottom: 1px solid black;  text-align: center; background-color: #ccc !important;">직원친절</div>
                <div style="width: 51px; height: 30px;line-height:30px;  text-align: center;"><%=nvl(serEnvList.get(0).getScore13()) %></div>
            </div> 
        </div> 
        <div style="display: table-cell; border:1px solid black; width:152px; height: 90px; text-align: center;">
            <div style=" border-bottom:1px solid black; width:152px; height: 30px;line-height:30px; text-align: center; background-color: #ccc !important;"> 식사</div>
            <div style="display: table-cell">   
                <div style="width: 50px; height: 30px;line-height:30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">신선도</div>
                <div style="width: 50px; height: 30px;line-height:30px; border-right: 1px solid black; text-align: center;"><%=nvl(serEnvList.get(0).getScore14()) %></div>
            </div> 
            <div style="display: table-cell; vertical-align: middle;">   
                <div style="width: 51px; height: 30px;line-height:30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; background-color: #ccc !important;">다양성</div>
                <div style="width: 51px; height: 30px;line-height:30px; border-right: 1px solid black; text-align: center;"><%=nvl(serEnvList.get(0).getScore15()) %></div>
            </div> 
            <div style="display: table-cell; vertical-align: middle;">   
                <div style="width: 51px; height: 30px;line-height:30px; border-bottom: 1px solid black;  text-align: center; background-color: #ccc !important;">영양</div>
                <div style="width: 51px; height: 30px;line-height:30px;  text-align: center;"><%=nvl(serEnvList.get(0).getScore16()) %></div>
            </div> 
        </div> 
        <div style="display: table-cell; border:1px solid black; width:101px; height: 90px; text-align: center;">
            <div style=" display: table-cell; border-bottom:1px solid black; width:100px; height: 60px; line-height:30.5px; text-align: center; background-color: #ccc !important; "> 평균</div>
            <div style="width: 100px; height: 30px; line-height:30px; text-align: center;"><%=nvl(serEnvList.get(0).getAvg1()) %></div> 
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
                    <div style=" border-bottom:1px solid black; width:102px; height: 30px;line-height:30px;  border-right: 1px solid black;text-align: center; background-color: #ccc !important;"> 예방효과</div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;"><%=effectMap.get("예방 사전 합") %></div>
                         <div style="border-right: 1px solid black;width: 51px; height: 30px;line-height:30px;   text-align: center;"><%=effectMap.get("예방 사후 합") %></div>
                    </div> 
                    <div style="display: table-cell; vertical-align: middle;">   
                        <div style="width: 51px; height: 30px; line-height:30px; border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; "><%=effectMap.get("예방 사전 평균") %></div>
                        <div style="border-right: 1px solid black;width: 51px; height: 30px;line-height:30px;  text-align: center;"><%=effectMap.get("예방 사후 평균") %></div>
                    </div> 
                </div>
                <div style="display: table-cell; width :102px; height: 90px;">
                    <div style=" border-bottom:1px solid black; width:102px; height: 30px;line-height:30px;  border-right: 1px solid black;text-align: center; background-color: #ccc !important;">상담치유효과</div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;"><%=effectMap.get("설문 사전 합") %></div>
                         <div style="border-right: 1px solid black;width: 51px; height: 30px;line-height:30px;   text-align: center;"><%=effectMap.get("설문 사후 합") %></div>
                    </div> 
                    <div style="display: table-cell; vertical-align: middle;">   
                        <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; "><%=effectMap.get("설문 사전 평균") %></div>
                        <div style="border-right: 1px solid black;width: 51px; height: 30px;line-height:30px;  text-align: center;"><%=effectMap.get("설문 사전 평균") %></div>
                    </div> 
                </div>
                <div style="display: table-cell; width :102px; height: 90px;">
                    <div style=" border-bottom:1px solid black; width:102px; height: 30px;line-height:30px; text-align: center; background-color: #ccc !important;"> 힐링효과</div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;"><%=effectMap.get("힐링 사전 합") %></div>
                         <div style="border-right: 1px solid black;width: 51px; height: 30px;line-height:30px;   text-align: center;"><%=effectMap.get("힐링 사후 합") %></div>
                    </div> 
                    <div style="display: table-cell; vertical-align: middle;">   
                        <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; text-align: center; "><%=effectMap.get("힐링 사전 평균") %></div>
                        <div style="width: 51px; height: 30px; line-height:30px; text-align: center;"><%=effectMap.get("힐링 사후 평균") %></div>
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
                         <div style="border-right: 1px solid black;width: 51px; height: 30px;line-height:30px;   text-align: center;"><%=HrvList.get(0).getScore1() %></div>
                    </div> 
                    <div style="display: table-cell; vertical-align: middle;">   
                        <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; ">사후</div>
                        <div style="border-right: 1px solid black;width: 51px; height: 30px;line-height:30px;  text-align: center;"><%=HrvList.get(0).getScore6() %></div>
                    </div> 
                </div>
                <div style="display: table-cell; width :102px; height: 90px;">
                    <div style=" border-bottom:1px solid black; width:102px; height: 30px;line-height:30px;  border-right: 1px solid black;text-align: center; background-color: #ccc!important;">자율신경 균형도</div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;">사전</div>
                         <div style="border-right: 1px solid black;width: 51px; height: 30px; line-height:30px;  text-align: center;"><%=HrvList.get(0).getScore2() %></div>
                    </div> 
                    <div style="display: table-cell; vertical-align: middle;">   
                        <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; ">사후</div>
                        <div style="border-right: 1px solid black;width: 51px; height: 30px; line-height:30px; text-align: center;"><%=HrvList.get(0).getScore7() %></div>
                    </div> 
                </div>
                <div style="display: table-cell; width :102px; height: 90px;">
                    <div style=" border-bottom:1px solid black; border-right: 1px solid black;width:102px; height: 30px;line-height:30px ;text-align: center; background-color: #ccc!important;"> 스트레스 저항도</div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;">사전</div>
                         <div style="border-right: 1px solid black;width: 51px; height: 30px;line-height:30px;   text-align: center;"><%=HrvList.get(0).getScore3() %></div>
                    </div> 
                    <div style="display: table-cell; vertical-align: middle;">   
                        <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-right: 1px solid black; text-align: center; ">사후</div>
                        <div style="width: 51px; height: 30px;line-height:30px;  text-align: center; border-right: 1px solid black;"><%=HrvList.get(0).getScore8() %></div>
                    </div> 
                </div>
                <div style="display: table-cell; width :102px; height: 90px;">
                    <div style=" border-bottom:1px solid black; border-right: 1px solid black; width:102px; height: 30px;line-height:30px; text-align: center; background-color: #ccc!important;"> 스트레스 지수</div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;">사전</div>
                         <div style="border-right: 1px solid black;width: 51px; height: 30px;line-height:30px;   text-align: center;"><%=HrvList.get(0).getScore4() %></div>
                    </div> 
                    <div style="display: table-cell; vertical-align: middle;">   
                        <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black;border-right: 1px solid black; text-align: center; ">사후</div>
                        <div style="width: 51px; height: 30px;line-height:30px;  text-align: center; border-right: 1px solid black;"><%=HrvList.get(0).getScore9() %></div>
                    </div> 
                </div>
                <div style="display: table-cell; width :102px; height: 90px;">
                    <div style=" border-bottom:1px solid black; width:102px; height: 30px;line-height:30px; text-align: center; background-color: #ccc!important;"> 피로도</div>
                    <div style="display: table-cell">   
                         <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; border-left: 1px solid blac; border-right: 1px solid black; text-align: center;">사전</div>
                         <div style="border-right: 1px solid black;width: 51px; height: 30px;line-height:30px;   text-align: center;"><%=HrvList.get(0).getScore5() %></div>
                    </div> 
                    <div style="display: table-cell; vertical-align: middle;">   
                        <div style="width: 51px; height: 30px;line-height:30px;  border-bottom: 1px solid black; text-align: center; ">사후</div>
                        <div style="width: 51px; height: 30px;line-height:30px;  text-align: center;"><%=HrvList.get(0).getScore10() %></div>
                    </div> 
                </div>
                
            </div>
            
        </div>
        <div style="display: table-cell; border:1px solid black; width: 100px; height: 120px; vertical-align: middle;background-color: #ccc!important; "></div>
    </div> 
    
    
</div>
</body>
</html>