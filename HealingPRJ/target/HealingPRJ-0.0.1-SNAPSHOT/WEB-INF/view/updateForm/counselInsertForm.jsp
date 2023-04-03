<%@page import="poly.dto.CounselInsertDTO"%>
<%@page import="java.util.List"%>
<%@page import="static poly.util.CmmUtil.convertXSS"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int[] groupMargin = { 5, 15, 5, 5, 15, 5, 15, 5, 5, 15, 
						5, 5, 15, 5, 5, 5, 15, 5, 5, 5,
						5, 5, 15, 5, 5, 15, 5, 5, 15, 5,
						5, 5, 5, 5, 15, 5, 5, 15, 5, 5,
						5, 15, 5, 15, 5, 5, 15, 5, 5, 15,
						5, 5, 5, 15, 5, 5, 15, 5, 5, 15,
						5, 15 };
	int[] groupWidth = { 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 
						65, 65, 65, 65, 65, 65, 65, 65, 65, 65,
						65, 65, 65, 65, 65, 65, 65, 65, 65, 65,
						65, 65, 65, 65, 65, 65, 65, 65, 65, 65,
						65, 65, 70, 70, 65, 65, 65, 65, 65, 65,
						65, 65, 65, 65, 65, 65, 65, 65, 65, 65,
						70, 70 };
	List<CounselInsertDTO> cList = (List<CounselInsertDTO>)request.getAttribute("counselList");
	String [] sessionSave = cList.get(0).getSession().split("/");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>하이힐링원 통계프로그램</title>
	<link href="/lumino/css/bootstrap.min.css" rel="stylesheet">
	<link href="/lumino/css/font-awesome.min.css" rel="stylesheet">
	<link href="/lumino/css/datepicker3.css" rel="stylesheet">
	<link href="/lumino/css/styles.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	
	<!-- 홍두표 - 나눔스퀘어 폰트 불러오기 및 css 클래스 분리 -->
	<style>
		@import url(https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css);
		body {
			text-decoration: none;
			text-decoration-line: none;
			text-decoration-thickness: initial;
			text-decoration-style: initial;
			text-decoration-color: initial;
			font-family: "NanumSquare";
			font-size: 20px;
			font-weight: 500;
		}
		.item-title {
			width: 110px;
			text-align: center;
		}
		.healing-btn {
			width: 145px; 
			height: 35px; 
			font-size: large;
		}
		
		.balloon {  
			position: absolute;
			margin: 3px;
			width: 85%;
			height: 35px;
			background: white;
			border-radius: 5px;
			border: 1px solid #c5c5c5;
			left: 670px;
			z-index: 1;
		}
		.balloon:after { 
		}
		
		.form-control {
			display: block;
			width: 100%;
			height: 35px;
			padding: 3px 10px;
			font-size: 14px;
			border: 1px solid #ccc;
			border-radius: 4px;
		}
		
		input.form-control {
			display: block;
			width: 100%;
			height: 35px;
			padding: 3px 10px;
			font-size: 14px;
			border: 1px solid #ccc;
			border-radius: 4px;
		}
		
		.sub-head {
			font-weight: 600;
			display: inline-block;
			width: 65px; 
			margin-right: 5px; 
			float:left;
			text-align: center;
		}
		
		.main-head {
			font-weight: 600; 
			margin-bottom: 0px;
			text-align: center;
		}
	</style>
	<!-- 홍두표 - 나눔스퀘어 폰트 불러오기 및 css 클래스 분리 -->
	
	<!-- start---/. 페이지 로딩 후 바로 자바스크립트 함수를 실행하는 부분 -->
	<script>
	</script>
	<!-- 페이지 로딩 후 바로 자바스크립트 함수를 실행하는 부분 ./---end -->
</head>
<body>
	<!--/.sidebar Sart-->
	<%@ include file="/WEB-INF/view/top.jsp"%>
	<%@ include file="/WEB-INF/view/sidebar.jsp"%>
	<!--/.sidebar End-->
	
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">수정 및 삭제</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">상담&치유서비스 효과평가 수정</h1>
			</div>
		</div><!--/.row-->
		
		
		
		
		<!-- 홍석민이 만들고 있음 -->
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default chat">
				
					<div class="panel-heading" style="display: inline-block; height: auto; width: 100%;">
						
						<div style="height: auto; width: auto;">
							<div style="display: inline-block;">
								<h4 class="item-title" style="float: left; margin: 8px 5px 8px 0px;">기관명</h4> 
								<div style="width: 120px; float: left; margin-right: 10px; white-space: nowrap; max-width: 300px;">
									<input class="form-control form-agency" name="form-agency" placeholder="기관명" value="<%=convertXSS(cList.get(0).getAgency())%>">
								</div>
								
								<h4 class="item-title" style="float: left; margin: 8px 5px 8px 0px;">시작일자</h4> 
								<div style="float: left; margin-right: 10px;">
									<input class="form-control form-openday" style="width: 190px;" type="date" name="form-openday" value="<%=convertXSS(cList.get(0).getOpenday())%>">
								</div>
							</div>
							
							<div style="display: block;">
							
								<div style="margin-right:10px">
									<h4 class="item-title" style="float: left; margin: 8px 5px 8px 0px;">콘텐츠 종류</h4> 
									<div style="width: 120px; float: left; margin-right: 10px;">
										<select class="form-control" name="form-contents"style="height: 35px; width: 120px;">
											<option><%=convertXSS(cList.get(0).getCounsel_contents())%></option>
											<option>게임</option>
											<option>도박</option>
											<option>SNS</option>
											<option>성인물</option>
											<option>웹툰/웹소설</option>
											<option>기타동영상</option>
											<option>기타</option>
										</select>
									</div>
								</div>
								<div style="margin-right:10px">
									<h4 class="item-title" style="float: left; margin: 8px 5px 8px 0px;">실시일자</h4> 
									<div style="float: left; margin-right: 10px;">
										<input class="form-control form-eval_date" style="width: 190px;" type="date" name="form-eval_date" value="<%=convertXSS(cList.get(0).getEval_date())%>">
									</div>
								</div>
								<div style="margin-right:10px">
									<h4 class="item-title" style="float: left; margin: 8px 5px 8px 0px; width:55px;">회기</h4> 
									<div style="width: 90px; float: left; margin-right: 10px;">
										<input class="form-control" name="form-time" placeholder="회당시간" value="<%=sessionSave[1]%>">
									</div>
									<div style="width: 90px; float: left; margin-right: 10px;">
										<input class="form-control" name="form-bill" placeholder="월사용료" value="<%=sessionSave[2]%>">
									</div>
								</div>
								<div style="margin-right:10px">
									<h4 style="float: left; margin: 8px 5px 8px 0px; width: 50px; text-align: center;">시점</h4> 
									<div style="width: 90px; float: left; margin-right: 10px;">
										<%
											if(convertXSS(cList.get(0).getSession()).substring(0,2).equals("시작")) {
										%>
											<input class="form-control" name="form-pv" value="사전" readonly>
										<%
											} else {
										%>
											<input class="form-control" name="form-pv" value="<%=convertXSS(cList.get(0).getSession()).substring(0,2)%>" readonly>
										<%		
											}
										%>
									</div>
								</div>
								
							</div>
							
						</div>
						<div style="display: flex; justify-content: flex-end;">
							<input type="button" class="btn btn-success btn-sm healing-btn" style="margin-right: 5px;" value="추가" onclick="add_div()">
							<input type="button" class="btn btn-default btn-sm healing-btn" style="margin-right: 5px;" value="수정" onclick="action()">
						</div>
						
					</div>
				
				
				
				
					<div class="panel-body" style="overflow-x: scroll; height: auto; overflow-y: hidden;">
						<div style="width:5350px;height: 70px">
							<div style="width: 120px; float: left; margin-right: 10px; margin-left:30px; text-align: center; -webkit-text-emphasis-style: open;"><h4 style="font-weight: 600">이름</h4></div>
							<!--입력양식의 공통부분 -->
							<div style="width: 85px; float: left; margin-right: 10px; text-align: center; -webkit-text-emphasis-style: open;"><h4 style="font-weight: 600">성별</h4></div>
							<div style="width: 65px; float: left; margin-right: 10px; text-align: center; -webkit-text-emphasis-style: open;"><h4 style="font-weight: 600">연령</h4></div>
							<div style="width: 90px; float: left; margin-right: 10px; text-align: center; -webkit-text-emphasis-style: open;"><h4 style="font-weight: 600">거주지</h4></div>
							<div style="width: 140px; float: left; margin-right: 10px; text-align: center; -webkit-text-emphasis-style: open;"><h4 style="font-weight: 600">직업</h4></div>
							<!--입력양식의 공통부분 -->
							<div style="width: 160px; float: left; margin-right: 10px; text-align: center;"><h4 style="font-weight: 600">과거 상담·치유 <br/>서비스 경험</h4></div>
							
							<div style="width: 140px; float: left; margin-right: 10px; text-align: center;"><h4 class="main-head">변화동기</h4>
								<h5 class="sub-head">문항1 </h5>
								<h5 class="sub-head">문항2 </h5>
							</div>
							<div style="width: 210px; float: left; margin-right: 10px; text-align: center; "><h4 class="main-head">신뢰(라포)</h4>
								<h5 class="sub-head">문항3</h5>
								<h5 class="sub-head">문항4</h5>
								<h5 class="sub-head">문항5</h5>
							</div>
							<div style="width: 140px; float: left; margin-right: 10px; text-align: center; "><h4 class="main-head">서비스이해</h4>
								<h5 class="sub-head">문항6 </h5>
								<h5 class="sub-head">문항7 </h5>
							</div>
							<div style="width: 210px; float: left; margin-right: 10px; text-align: center; "><h4 class="main-head">조절실패</h4>
								<h5 class="sub-head">문항8</h5>
								<h5 class="sub-head">문항9</h5>
								<h5 class="sub-head">문항10</h5>
							</div>
							<div style="width: 210px; float: left; margin-right: 10px; text-align: center; "><h4 class="main-head">현저성</h4>
								<h5 class="sub-head">문항11</h5>
								<h5 class="sub-head">문항12</h5>
								<h5 class="sub-head">문항13</h5>
							</div>
							<div style="width: 280px; float: left; margin-right: 10px; text-align: center;"><h4 class="main-head">문제적 결과</h4>
								<h5 class="sub-head">문항14</h5>
								<h5 class="sub-head">문항15</h5>
								<h5 class="sub-head">문항16</h5>
								<h5 class="sub-head">문항17</h5>
							</div>
							<div style="width: 420px; float: left; margin-right: 10px; text-align: center;"><h4 class="main-head">낮은자기조절력</h4>
								<h5 class="sub-head">문항18</h5>
								<h5 class="sub-head">문항19</h5>
								<h5 class="sub-head">문항20</h5>
								<h5 class="sub-head">문항21</h5>
								<h5 class="sub-head">문항22</h5>
								<h5 class="sub-head">문항23</h5>
							</div>
							<div style="width: 210px; float: left; margin-right: 10px; text-align: center; "><h4 class="main-head">부정정서</h4>
								<h5 class="sub-head">문항24</h5>
								<h5 class="sub-head">문항25</h5>
								<h5 class="sub-head">문항26</h5>
							</div>
							<div style="width: 210px; float: left; margin-right: 10px; text-align: center; "><h4 class="main-head">편향된 신념</h4>
								<h5 class="sub-head">문항27</h5>
								<h5 class="sub-head">문항28</h5>
								<h5 class="sub-head">문항29</h5>
							</div>
							<div style="width: 420px; float: left; margin-right: 10px; text-align: center; "><h4 class="main-head">역기능적 자기도식</h4>
								<h5 class="sub-head">문항30</h5>
								<h5 class="sub-head">문항31</h5>
								<h5 class="sub-head">문항32</h5>
								<h5 class="sub-head">문항33</h5>
								<h5 class="sub-head">문항34</h5>
								<h5 class="sub-head">문항35</h5>
							</div>
							<div style="width: 210px; float: left; margin-right: 10px; text-align: center; "><h4 class="main-head">대인관계 기술부적</h4>
								<h5 class="sub-head">문항36</h5>
								<h5 class="sub-head">문항37</h5>
								<h5 class="sub-head">문항38</h5>
							</div>
							<div style="width: 280px; float: left; margin-right: 10px; text-align: center; "><h4 class="main-head">대인 민감성</h4>
								<h5 class="sub-head">문항39</h5>
								<h5 class="sub-head">문항40</h5>
								<h5 class="sub-head">문항41</h5>
								<h5 class="sub-head">문항42</h5>
							</div>
							<div style="width: 150px; float: left; margin-right: 10px; text-align: center; "><h4 class="main-head">관계/유능 욕구충족</h4>
								<h5 class="sub-head" style="width:70px; margin-right: 5px;">문항43</h5>
								<h5 class="sub-head" style="width:70px; margin-right: 5px;">문항44</h5>
							</div>
							<div style="width: 210px; float: left; margin-right: 10px; text-align: center; "><h4 class="main-head">긍정정서</h4>
								<h5 class="sub-head">문항45</h5>
								<h5 class="sub-head">문항46</h5>
								<h5 class="sub-head">문항47</h5>
							</div>
							<div style="width: 210px; float: left; margin-right: 10px; text-align: center; "><h4 class="main-head">삶의만족</h4>
								<h5 class="sub-head">문항48</h5>
								<h5 class="sub-head">문항49</h5>
								<h5 class="sub-head">문항50</h5>
							</div>
							<div style="width: 280px; float: left; margin-right: 10px; text-align: center; "><h4 class="main-head">자기이해</h4>
								<h5 class="sub-head">문항51</h5>
								<h5 class="sub-head">문항52</h5>
								<h5 class="sub-head">문항53</h5>
								<h5 class="sub-head">문항54</h5>
							</div>
							<div style="width: 210px; float: left; margin-right: 10px; text-align: center; "><h4 class="main-head">자기수용</h4>
								<h5 class="sub-head">문항55</h5>
								<h5 class="sub-head">문항56</h5>
								<h5 class="sub-head">문항57</h5>
							</div>
							<div style="width: 210px; float: left; margin-right: 10px; text-align: center; "><h4 class="main-head">마음관리 기술/기회</h4>
								<h5 class="sub-head">문항58</h5>
								<h5 class="sub-head">문항59</h5>
								<h5 class="sub-head">문항60</h5>
							</div>
							<div style="width: 150px; float: left; margin-right: 10px; text-align: center; "><h4 class="main-head">스마트폰 활용역량</h4>
								<h5 class="sub-head" style="width:70px; margin-right: 5px;">문항61</h5>
								<h5 class="sub-head" style="width:70px; margin-right: 5px;">문항62</h5>
							</div>
						</div>
						
						<!-- 데이터 입력 부분 -->
						<div id="parent">
							<%for (int i = 0; i < cList.size(); i++) { %>
							<div class="insertForm" style="width: 5350px; height: 40px;" name="form-main" id="child<%=i%>">
								<button class="delete-row"onclick="delete_info(<%=i%>)" style="font-size:70%; display:block; margin: 5px 5px 0px 0px; float: left;">X</button>
								<div style="width: 120px; float: left; margin-right: 10px;">
									<input class="form-control" name="form-name" placeholder="이름" value="<%=convertXSS(cList.get(i).getName())%>">
								</div>
								<div style="width: 85px; float: left; margin-right: 10px;">
									<select class="form-control" name="form-sex" style="height: 35px;">
										<option><%=convertXSS(cList.get(i).getSex())%></option>
										<%@ include file="/WEB-INF/view/insertForm/sex.jsp"%>
									</select>
								</div>
								<div style="width: 65px; float: left; margin-right: 10px;">
									<input class="form-control" type="number" name="form-age" placeholder="연령" value="<%=convertXSS(cList.get(i).getAge())%>">
								</div>
								<div style="width: 90px; float: left; margin-right: 10px;">
									<select class="form-control" name="form-residence" style="height: 35px;">
										<option><%=convertXSS(cList.get(i).getResidence())%></option>
										<%@ include file="/WEB-INF/view/insertForm/residences.jsp"%>
									</select>
								</div>
								<div style="width: 140px; float: left; margin-right: 10px;">
									<select class="form-control" name="form-job" style="height: 35px;">
										<option><%=convertXSS(cList.get(i).getJob())%></option>
										<%@ include file="/WEB-INF/view/insertForm/jobs.jsp"%>
									</select>
								</div>
								<div style="width: 160px; float: left; margin-right: 10px;">
									<input class="form-control" type="number" name="form-pastExp" placeholder="0=미기재/1=무/2=유" value="<%=convertXSS(cList.get(i).getPast_stress_experience())%>">
								</div>
								<div class="scorelist" style="position: relative;">
									<div class="balloon" style="display: none;">&nbsp;&nbsp;&nbsp;</div>
									<%
									// 반복문을 돌려서 문항 개수만큼 문항 만들기
									for(int j = 0; j < groupMargin.length; j++) { %>
									<div style="width: <%=groupWidth[j]%>px; float: left; margin-right: <%=groupMargin[j]%>px;">
										<input class="form-control" type="number" name="form-score<%=j+1 %>" placeholder="점수" value="<%=cList.get(i).getScoreString2List().get(j)%>">
									</div>
									<% } %>
								</div>
								
							</div>
							<% } %>
							<div class="new-field"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/lumino/js/jquery-1.11.1.min.js"></script>
	<script src="/lumino/js/bootstrap.min.js"></script>
	<script src="/lumino/js/chart.min.js"></script>
	<script src="/lumino/js/chart-data.js"></script>
	<script src="/lumino/js/easypiechart.js"></script>
	<script src="/lumino/js/easypiechart-data.js"></script>
	<script src="/lumino/js/bootstrap-datepicker.js"></script>
	<script src="/lumino/js/custom.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<!-- start---/. 페이지 내에서 이벤트가 발생하면 자바스크립트 함수를 실행하는 부분 -->
	<script type="text/javascript">
		function add_div() {
			let index = document.getElementsByName("form-main").length;
			let val = document.getElementsByName("form-main")[index-1].id;
			let num = val.substring(5,val.length);
			index = parseInt(num) + 1;
			console.log(num);
			let idName = "child"+ index + "";
			let new_div = '<div class="insertForm" style="width: 5350px; height: 40px;" name="form-main" id="child'
                		+ index + '"><button class="delete-row"onclick="delete_info('
                        + index + ')" style="font-size:70%; display:block; margin: 5px 5px 0px 0px; float: left;">X</button>'
                        + '<div style="width: 120px; float: left; margin-right: 10px;"><input class="form-control" name="form-name" placeholder="이름"></div>'
                        + `<div style="width: 85px; float: left; margin-right: 10px;"><select class="form-control" name="form-sex" style="height: 35px;"><%@ include file="/WEB-INF/view/insertForm/sex.jsp"%></select></div>`
                        + '<div style="width: 65px; float: left; margin-right: 10px;"><input class="form-control" type="number" name="form-age" placeholder="연령"></div>'
                        + `<div style="width: 90px; float: left; margin-right: 10px;"><select class="form-control" name="form-residence" style="height: 35px;"><%@ include file="/WEB-INF/view/insertForm/residences.jsp"%></select></div>`
                        + `<div style="width: 140px; float: left; margin-right: 10px;"><select class="form-control" name="form-job" style="height: 35px;"><%@ include file="/WEB-INF/view/insertForm/jobs.jsp"%></select></div>`
                        + '<div style="width: 160px; float: left; margin-right: 10px;"><input class="form-control" name="form-pastExp" placeholder="0=미기재/1=무/2=유"></div>'
                        + `<div class="scorelist" style="position: relative;"><div class="balloon" style="display: none;">&nbsp;&nbsp;&nbsp;` + index + `</div><% for(int j = 0; j < groupMargin.length; j++) { %>`
                        + `<div style="width: <%=groupWidth[j]%>px; float: left; margin-right: <%=groupMargin[j]%>px;"><input class="form-control" name="form-score<%=j+1 %>" placeholder="점수"></div><% } %></div></div>`;
					
					
			$(".new-field").append(new_div);
			console.log(idName);
		}
	</script>
	<script type="text/javascript">
		
		
		/* 인덱스 값을 찾는 메소드 */
		function getElementIndex(element, range) {
			  if (!!range) return [].indexOf.call(element, range);
			  return [].indexOf.call(element.parentNode.children, element);
		}
		
		
		
		
		/* 데이터 입력 후 최종 전송 */
		function action() {
			var param = {};
			
			let agency = document.getElementsByName("form-agency")[0].value;
			let openday = document.getElementsByName("form-openday")[0].value;
			let contents = document.getElementsByName("form-contents")[0].value;
			let session = "None";
			let eval_date = document.getElementsByName("form-eval_date")[0].value;
			if(document.getElementsByName("form-pv")[0].value == "사전") {
				session = "시작회기/" + document.getElementsByName("form-time")[0].value + "/" + document.getElementsByName("form-bill")[0].value;
				console.log(session);
			} else if(document.getElementsByName("form-pv")[0].value == "중간") {
				session = "중간회기/" + document.getElementsByName("form-time")[0].value + "/" + document.getElementsByName("form-bill")[0].value;
				console.log(session);
			} else {
				session = "종결회기/" + document.getElementsByName("form-time")[0].value + "/" + document.getElementsByName("form-bill")[0].value;
				console.log(session);
			}
			
			let pv = document.getElementsByName("form-pv")[0].value;
			let formArr = document.getElementsByName("form-main");
			
			//유효성 검사
			if(agency.trim() == "") {
				alert("기관을 입력해주세요.");
				return false;
			} else if(openday.trim() == "") { 
				alert("시작일자를 입력해주세요.");
				return false;
			} else if(contents.trim() == "") { 
				alert("참여프로그램을 입력해주세요.");
				return false;
			} else if(session.trim() == "") { 
				alert("회기를 입력해주세요.");
				return false;
			} else if(pv.trim() == "") {
				alert("시점을 입력해주세요.");
				return false;
			} else if(eval_date.trim() == "") {
				alert("실시일자을 입력해주세요.");
				return false;
			}
			
			let rowCnt = 0;
			for(let i = 0; i < formArr.length; i++) {
				let name = document.getElementsByName("form-name")[i].value;
				let sex = document.getElementsByName("form-sex")[i].value;
				let age = document.getElementsByName("form-age")[i].value;
				let residence = document.getElementsByName("form-residence")[i].value;
				let job = document.getElementsByName("form-job")[i].value;
				let past_stress_experience = document.getElementsByName("form-pastExp")[i].value;
				
				
				let totalLength = name.length + age.length + past_stress_experience.length;
				for(let j = 0; j < 62; j++) {
					totalLength += document.getElementsByName("form-score" + (j + 1))[i].value.length;
				}
				
				if(totalLength==0) {
					if(i==0){
						return first_row_check();
					}
				}else {
					if(name.trim() == '') {
						alert("이름을 입력해주세요.");
						return document.getElementsByName("form-name")[i].focus();
					}else if(age.trim() == "") { 
						alert("나이를 입력해주세요.");
						console.log(i);
						return document.getElementsByName("form-age")[i].focus();
					} else if(past_stress_experience.trim() == "") { 
						alert("과거 상담 서비스 경험을 입력해주세요.");
						console.log(i);
						return document.getElementsByName("form-pastExp")[i].focus();
					}
					for(let j = 0; j < 62; j++) {
						if(document.getElementsByName("form-score" + (j + 1))[i].value.trim() == "") { 
							alert("점수를 입력해주세요.");
							return document.getElementsByName("form-score" + (j + 1))[i].focus();
						}
					}
				}
				/*  */
				if(name=="") {
					break;
				} else { 
					param["counselDtoList["+i+"].agency"]=agency;
					param["counselDtoList["+i+"].openday"]=openday; 
					param["counselDtoList["+i+"].counsel_contents"]=contents; 
					param["counselDtoList["+i+"].session"]=session; 
					param["counselDtoList["+i+"].name"]=name; 
					param["counselDtoList["+i+"].sex"]=sex;
					param["counselDtoList["+i+"].age"]=age;
					param["counselDtoList["+i+"].residence"]=residence;
					param["counselDtoList["+i+"].job"]=job;
					param["counselDtoList["+i+"].past_stress_experience"]=past_stress_experience;
					param["counselDtoList["+i+"].pv"]=pv;
					param["counselDtoList["+i+"].eval_date"]=eval_date;
					for(let j = 0; j < 62; j++) {
						param["counselDtoList[" + i + "].scoreList[" + j + "]"] = document.getElementsByName("form-score" + (j + 1))[i].value.trim();
					}
					rowCnt++;
				}
			}
			console.log(param);
			
			
			
			swal("수정하시겠습니까? 행 개수: " + rowCnt, "", "info", {
				buttons : ["취소", "확인"]
			}).then(function(confirm) {
				console.log(confirm);
				if (confirm) {
					$.ajax({
						url: "/insertForm/counselInsertForm/insertData.do",
						type: "POST",
						data: param, 
						success:function(result) {
							console.log(result);
							swal({
								title : "수정 성공 ",
								text : "확인 버튼을 눌러주세요.",
								icon : "success"
							}).then(function() {
								window.location.reload();
							});
						},
						error:function(e) {
							console.log(e);
						}
					})
				}
			});	
		}
	</script>
	<script type="text/javascript" src="/resources/js/common.js"></script>
	<!-- 페이지 내에서 이벤트가 발생하면 자바스크립트 함수를 실행하는 부분 ./---end -->
</body>
</html>