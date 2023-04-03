<%@page import="com.sun.corba.se.spi.legacy.connection.GetEndPointInfoAgainException"%>
<%@page import="poly.dto.VibraInsertDTO"%>
<%@page import="java.util.List"%>
<%@page import="static poly.util.CmmUtil.convertXSS"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<VibraInsertDTO> vList = (List<VibraInsertDTO>)request.getAttribute("vibraList");
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
			width: 85.2%;
			height: 35px;
			background: white;
			border-radius: 5px;
			border: 1px solid #c5c5c5;
			left: 660px;
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
			width: 60px; 
			margin-right: 5px; 
			float:left;
			text-align: center;
		}
		
		.main-head {
			font-weight: 600; 
			margin-bottom: 0px;
			text-align: center;
		}
		
		.state {
			font-size: small;
			margin: 6px 5px 6px 0px;
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
				<li>
					<a href="#">
						<em class="fa fa-home"></em>
					</a>
				</li>
				<li class="active">수정 및 삭제</li>
			</ol>
		</div>
		<!--/.row-->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">바이브라 측정 검사 수정</h1>
			</div>
		</div>
		<!--/.row-->
		<!--홍석민이 만들고 있음 -->
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default chat">
				
				
					
					
					<div class="panel-heading" style="display: inline-block; height: auto; width: 100%;">
						
						<div style="height: auto; width: auto;">
							<div style="display: block; height: auto; width: auto;">
								<h4 class="item-title" style="float: left; margin: 8px 5px 8px 0px;">기관명</h4> 
								<div style="width: 120px; float: left; margin-right: 10px; white-space: nowrap; max-width: 300px;">
									<input class="form-control form-agency" name="form-agency" placeholder="기관명" value="<%=convertXSS(vList.get(0).getAgency())%>">
								</div>
							
								<div style="margin-right:10px; height: auto; width: auto;">
									<h4 class="item-title" style="float: left; margin: 8px 5px 8px 0px; text-align: center;">시점</h4> 
									<div style="width: 120px; float: left; margin-right: 20px;">
										<select class="form-control form-pv" name="form-pv"style="height: 35px;">
											<option><%=convertXSS(vList.get(0).getPv())%></option>
											<option>사전</option>
											<option>사후</option>
										</select>
									</div>
								</div>
							</div>
							<div style="display: block; height: auto; width: auto;">
								<h4 class="item-title" style="float: left; margin: 8px 5px 8px 0px;">측정기구</h4>
								<div style="width: 120px; float: left;">
									<input class="form-control" style="margin-right: 30px;" name="form-equipment" placeholder="측정기구" value="<%=convertXSS(vList.get(0).getEquipment())%>">
								</div>
							</div>
						</div>
						<div style="display: flex; justify-content: flex-end;">
							<input type="button" class="btn btn-success btn-sm healing-btn" style="margin-right: 5px;" value="추가" onclick="add_div()"> 
							<input type="button" class="btn btn-default btn-sm healing-btn" style="margin-right: 5px;" value="수정" onclick="action()">
						</div>
					</div>
					<div class="panel-body" style="overflow-x: scroll; height: auto; overflow-y: hidden;">
						<div style="width: 2400px; height: 70px">
							<div style="width: 120px; float: left; margin-right: 10px; margin-left:30px; text-align: center; -webkit-text-emphasis-style: open;">
								<h4 style="font-weight: 600">ID</h4>
							</div>
							<div style="width: 120px; float: left; margin-right: 10px; text-align: center; -webkit-text-emphasis-style: open;">
								<h4 style="font-weight: 600">이름</h4>
							</div>
							<div style="width: 190px; float: left; margin-right: 10px; text-align: center; -webkit-text-emphasis-style: open;">
								<h4 style="font-weight: 600">주민등록번호</h4>
							</div>
							<!--입력양식의 공통부분 -->
							<div style="width: 85px; float: left; margin-right: 10px; text-align: center; -webkit-text-emphasis-style: open;">
								<h4 style="font-weight: 600">성별</h4>
							</div>
							<div style="width: 65px; float: left; margin-right: 10px; text-align: center; -webkit-text-emphasis-style: open;">
								<h4 style="font-weight: 600">연령</h4>
							</div>
							<div style="width: 160px; float: left; margin-right: 10px; text-align: center; -webkit-text-emphasis-style: open;">
								<h4 style="font-weight: 600">실시일자</h4>
							</div>
							<div style="width: 150px; float: left; -webkit-text-emphasis-style: open;">
								<h4 style="font-weight: 600">적극·공격성 | 상태</h4>
							</div>
							<div style="width: 150px; float: left; -webkit-text-emphasis-style: open;">
								<h4 style="font-weight: 600">스트레스 | 상태</h4>
							</div>
							<div style="width: 150px; float: left; -webkit-text-emphasis-style: open;">
								<h4 style="font-weight: 600">불안 | 상태</h4>
							</div>
							<div style="width: 150px; float: left; -webkit-text-emphasis-style: open;">
								<h4 style="font-weight: 600">의심 | 상태</h4>
							</div>
							<div style="width: 150px; float: left; -webkit-text-emphasis-style: open;">
								<h4 style="font-weight: 600">밸런스 | 상태</h4>
							</div>
							<div style="width: 150px; float: left; -webkit-text-emphasis-style: open;">
								<h4 style="font-weight: 600">카리스마 | 상태</h4>
							</div>
							<div style="width: 150px; float: left; -webkit-text-emphasis-style: open;">
								<h4 style="font-weight: 600">에너지 | 상태</h4>
							</div>
							<div style="width: 150px; float: left; -webkit-text-emphasis-style: open;">
								<h4 style="font-weight: 600">자기조절 | 상태</h4>
							</div>
							<div style="width: 150px; float: left; -webkit-text-emphasis-style: open;">
								<h4 style="font-weight: 600">억제 | 상태</h4>
							</div>
							<div style="width: 150px; float: left; -webkit-text-emphasis-style: open;">
								<h4 style="font-weight: 600">신경증 | 상태</h4>
							</div>
							<!--입력양식의 공통부분 -->
						</div>
						<div id="parent">
							<%for (int i = 0; i < vList.size(); i++) { %>
							
							<div class="insertForm" style="width: 2400px; height: 45px;" name="form-main" id="child<%=i%>">
								<button onclick="delete_info(<%=i%>)" style="font-size:70%; display:block; margin: 5px 5px 0px 0px; float: left;">X</button>
								<div style="width: 120px; float: left; margin-right: 10px;">
									<input class="form-control" name="form-id" placeholder="ID" value="<%=convertXSS(vList.get(i).getId())%>">
								</div>
								<div style="width: 120px; float: left; margin-right: 10px;">
									<input class="form-control" name="form-name" placeholder="이름" value="<%=convertXSS(vList.get(i).getName())%>">
								</div>
								<div style="width: 190px; float: left; margin-right: 10px;">
									<input class="form-control" name="form-jumin1" placeholder="앞자리" style="width: 90px; float: left;" maxlength="6" value="<%=vList.get(i).getJumin().substring(0,6)%>">-
									<input class="form-control" name="form-jumin2" placeholder="뒷자리" style="width: 90px; float: right;" maxlength="1" value="<%=vList.get(i).getJumin().substring(6,7)%>">
								</div>
								<!-- -->
								<div style="width: 85px; float: left; margin-right: 10px;">
										<select class="form-control" name="form-sex" style="height: 35px;">
											<option><%=convertXSS(vList.get(i).getSex())%></option>
											<%@ include file="/WEB-INF/view/insertForm/sex.jsp"%>
										</select>
									</div>
								<!-- -->
								<div style="width: 65px; float: left; margin-right: 10px;">
									<input class="form-control" type="number" name="form-age" placeholder="연령" value="<%=convertXSS(vList.get(i).getAge())%>">
								</div>
								<div style="width: 160px; float: left; margin-right: 10px;">
									<input class="form-control" type="date" name="form-date" value="<%=convertXSS(vList.get(i).getDate())%>">
								</div>
								
								<!-- 수치 입력칸 -->
								<div style="width: 95px; float: left; margin-right: 5px;">
									<input class="form-control form-num1" data-id="<%=i%>" data-type="listA" name="form-num1" placeholder="수치" value="<%=vList.get(i).getScoreString2List().get(0).split(",")[0].split("/")[0]%>">
								</div>
								<div class="listA state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>
								
								<div style="width: 95px; float: left; margin-right: 5px;">
									<input class="form-control form-num2" data-id="<%=i%>" data-type="listB" name="form-num2" placeholder="수치" value="<%=vList.get(i).getScoreString2List().get(1).split(",")[0].split("/")[0]%>">
								</div>
								<div class="listB state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>
								
								<div style="width: 95px; float: left; margin-right: 5px;">
									<input class="form-control form-num3" data-id="<%=i%>" data-type="listC" name="form-num3" placeholder="수치" value="<%=vList.get(i).getScoreString2List().get(2).split(",")[0].split("/")[0]%>">
								</div>
								<div class="listC state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>
								
								<div style="width: 95px; float: left; margin-right: 5px;">
									<input class="form-control form-num4" data-id="<%=i%>" data-type="listD" name="form-num4" placeholder="수치" value="<%=vList.get(i).getScoreString2List().get(3).split(",")[0].split("/")[0]%>">
								</div>
								<div class="listD state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>
								
								<div style="width: 95px; float: left; margin-right: 5px;">
									<input class="form-control form-num5" data-id="<%=i%>" data-type="listE" name="form-num5" placeholder="수치" value="<%=vList.get(i).getScoreString2List().get(4).split(",")[0].split("/")[0]%>">
								</div>
								<div class="listE state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>
								
								<div style="width: 95px; float: left; margin-right: 5px;">
									<input class="form-control form-num6" data-id="<%=i%>" data-type="listF" name="form-num6" placeholder="수치" value="<%=vList.get(i).getScoreString2List().get(5).split(",")[0].split("/")[0]%>">
								</div>
								<div class="listF state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>
								
								<div style="width: 95px; float: left; margin-right: 5px;">
									<input class="form-control form-num7" data-id="<%=i%>" data-type="listG" name="form-num7" placeholder="수치" value="<%=vList.get(i).getScoreString2List().get(6).split(",")[0].split("/")[0]%>">
								</div>
								<div class="listG state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>
								
								<div style="width: 95px; float: left; margin-right: 5px;">
									<input class="form-control form-num8" data-id="<%=i%>" data-type="listH" name="form-num8" placeholder="수치" value="<%=vList.get(i).getScoreString2List().get(7).split(",")[0].split("/")[0]%>">
								</div>
								<div class="listH state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>
								
								<div style="width: 95px; float: left; margin-right: 5px;">
									<input class="form-control form-num9" data-id="<%=i%>" data-type="listI" name="form-num9" placeholder="수치" value="<%=vList.get(i).getScoreString2List().get(8).split(",")[0].split("/")[0]%>">
								</div>
								<div class="listI state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>
								
								<div style="width: 95px; float: left; margin-right: 5px;">
									<input class="form-control form-num10" data-id="<%=i%>" data-type="listJ" name="form-num10" placeholder="수치" value="<%=vList.get(i).getScoreString2List().get(9).split(",")[0].split("/")[0]%>">
								</div>
								<div class="listJ state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>
							</div>
							
							
							<%} %>
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
	<script type="text/javascript">
		let state = [];
		function returnState() {
			document.querySelectorAll(".insertForm .form-num1").forEach(item => item.addEventListener("keyup",(e) => testA(e.target.dataset.type,e.target.value, e.target.dataset.id) ));
			document.querySelectorAll(".insertForm .form-num2").forEach(item => item.addEventListener("keyup",(e) => testB(e.target.dataset.type, e.target.value, e.target.dataset.id) ));
			document.querySelectorAll(".insertForm .form-num3").forEach(item => item.addEventListener("keyup",(e) => testC(e.target.dataset.type, e.target.value, e.target.dataset.id) ));
			document.querySelectorAll(".insertForm .form-num4").forEach(item => item.addEventListener("keyup",(e) => testD(e.target.dataset.type, e.target.value, e.target.dataset.id) ));
			document.querySelectorAll(".insertForm .form-num5").forEach(item => item.addEventListener("keyup",(e) => testE(e.target.dataset.type, e.target.value, e.target.dataset.id) ));
			document.querySelectorAll(".insertForm .form-num6").forEach(item => item.addEventListener("keyup",(e) => testF(e.target.dataset.type, e.target.value, e.target.dataset.id) ));
			document.querySelectorAll(".insertForm .form-num7").forEach(item => item.addEventListener("keyup",(e) => testG(e.target.dataset.type, e.target.value, e.target.dataset.id) ));
			document.querySelectorAll(".insertForm .form-num8").forEach(item => item.addEventListener("keyup",(e) => testH(e.target.dataset.type, e.target.value, e.target.dataset.id) ));
			document.querySelectorAll(".insertForm .form-num9").forEach(item => item.addEventListener("keyup",(e) => testI(e.target.dataset.type, e.target.value, e.target.dataset.id) ));
			document.querySelectorAll(".insertForm .form-num10").forEach(item => item.addEventListener("keyup",(e) => testJ(e.target.dataset.type, e.target.value, e.target.dataset.id) ));
		}
		returnState();
		function testA(type, value,inx) {
			let val = Number(value);
			let valText = document.querySelectorAll("."+type);
			switch (true) {
				case (val>0 && val<=19):
					valText[inx].textContent = "낮음";
					break;
				case (val>19 && val<=50):
					valText[inx].textContent = "중간";
					break;
				case (val>50):
					valText[inx].textContent = "높음";
					break;
				default:
					break;
			}
		}
		function testB(type, value,inx) {
			let val = Number(value);
			let valText = document.querySelectorAll("."+type);
			switch (true) {
			case (val>0 && val<=19):
				valText[inx].textContent = "낮음";
				break;
			case (val>19 && val<=40):
				valText[inx].textContent = "중간";
				break;
			case (val>40):
				valText[inx].textContent = "높음";
				break;
			default:
				break;
			}
		}
		function testC(type, value,inx) {
			let val = Number(value);
			let valText = document.querySelectorAll("."+type);
			switch (true) {
			case (val>0 && val<=14):
				valText[inx].textContent = "낮음";
				break;
			case (val>14 && val<=40):
				valText[inx].textContent = "중간";
				break;
			case (val>40):
				valText[inx].textContent = "높음";
				break;
			default:
				break;
			}
		}
		function testD(type, value,inx) {
			let val = Number(value);
			let valText = document.querySelectorAll("."+type);
			switch (true) {
			case (val>0 && val<=19):
				valText[inx].textContent = "낮음";
				break;
			case (val>19 && val<=50):
				valText[inx].textContent = "중간";
				break;
			case (val>50):
				valText[inx].textContent = "높음";
				break;
			default:
				break;
			}
		}
		function testE(type, value,inx) {
			let val = Number(value);
			let valText = document.querySelectorAll("."+type);
			switch (true) {
			case (val>0 && val<=39):
				valText[inx].textContent = "낮음";
				break;
			case (val>39 && val<=80):
				valText[inx].textContent = "중간";
				break;
			case (val>80):
				valText[inx].textContent = "높음";
				break;
			default:
				break;
			}
		}
		function testF(type, value,inx) {
			let val = Number(value);
			let valText = document.querySelectorAll("."+type);
			switch (true) {
			case (val>0 && val<=49):
				valText[inx].textContent = "낮음";
				break;
			case (val>49 && val<=80):
				valText[inx].textContent = "중간";
				break;
			case (val>80):
				valText[inx].textContent = "높음";
				break;
			default:
				break;
			}
		}
		function testG(type, value,inx) {
			let val = Number(value);
			let valText = document.querySelectorAll("."+type);
			switch (true) {
			case (val>0 && val<=19):
				valText[inx].textContent = "낮음";
				break;
			case (val>19 && val<=40):
				valText[inx].textContent = "중간";
				break;
			case (val>40):
				valText[inx].textContent = "높음";
				break;
			default:
				break;
			}
		}
		function testH(type, value,inx) {
			let val = Number(value);
			let valText = document.querySelectorAll("."+type);
			switch (true) {
			case (val>0 && val<=49):
				valText[inx].textContent = "낮음";
				break;
			case (val>49 && val<=80):
				valText[inx].textContent = "중간";
				break;
			case (val>80):
				valText[inx].textContent = "높음";
				break;
			default:
				break;
			}
		}
		function testI(type, value,inx) {
			let val = Number(value);
			let valText = document.querySelectorAll("."+type);
			switch (true) {
			case (val>0 && val<=14):
				valText[inx].textContent = "낮음";
				break;
			case (val>14 && val<=25):
				valText[inx].textContent = "중간";
				break;
			case (val>25):
				valText[inx].textContent = "높음";
				break;
			default:
				break;
			}
		}
		function testJ(type, value,inx) {
			let val = Number(value);
			let valText = document.querySelectorAll("."+type);
			switch (true) {
			case (val>0 && val<=9):
				valText[inx].textContent = "낮음";
				break;
			case (val>9 && val<=50):
				valText[inx].textContent = "중간";
				break;
			case (val>50):
				valText[inx].textContent = "높음";
				break;
			default:
				break;
			}
		}
	
		function add_div() {
			let index = document.getElementsByName("form-main").length;
			let val = document.getElementsByName("form-main")[index-1].id;
			let num = val.substring(5,val.length);
			index = parseInt(num) + 1;
			console.log(num);
			let idName = "child"+ index + "";
			let new_div = '<div class="insertForm" style="width: 2400px; height: 45px;" name="form-main" id="child'
				+ index + '"><button onclick="delete_info('
				+ index + ')" style="font-size:70%; display:block; margin: 5px 5px 0px 0px; float: left;">X</button>'
				+ '<div style="width: 120px; float: left; margin-right: 10px;"><input class="form-control" name="form-id" placeholder="ID"></div>'
				+ '<div style="width: 120px; float: left; margin-right: 10px;"><input class="form-control" name="form-name" placeholder="이름"></div>'
				+ '<div style="width: 190px; float: left; margin-right: 10px;"><input class="form-control" name="form-jumin1" placeholder="앞자리" style="width: 90px; float: left;" maxlength="6">-'
				+ '<input class="form-control" name="form-jumin2" placeholder="뒷자리" style="width: 90px; float: right;" maxlength="1"></div>'
				+ '<div style="width: 85px; float: left; margin-right: 10px;"><select class="form-control" name="form-sex" style="height: 35px;">'
				+ `<%@ include file="/WEB-INF/view/insertForm/sex.jsp"%></select></div>`
				+ '<div style="width: 65px; float: left; margin-right: 10px;"><input class="form-control" type="number" name="form-age" placeholder="연령"></div>'
				+ '<div style="width: 160px; float: left; margin-right: 10px;"><input class="form-control" type="date" name="form-date"></div>'
				+ '<div style="width: 95px; float: left; margin-right: 5px;"><input class="form-control form-num1" data-id="'
				+ index + '" data-type="listA" name="form-num1" placeholder="수치"></div><div class="listA state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>'
				+ '<div style="width: 95px; float: left; margin-right: 5px;"><input class="form-control form-num2" data-id="'
				+ index + '" data-type="listB" name="form-num2" placeholder="수치"></div>'
				+ '<div class="listB state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>'
				+ '<div style="width: 95px; float: left; margin-right: 5px;"><input class="form-control form-num3" data-id="'
				+ index + '" data-type="listC" name="form-num3" placeholder="수치"></div>'
				+ '<div class="listC state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>'
				+ '<div style="width: 95px; float: left; margin-right: 5px;"><input class="form-control form-num4" data-id="'
				+ index + '" data-type="listD" name="form-num4" placeholder="수치"></div>'
				+ '<div class="listD state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>'
				+ '<div style="width: 95px; float: left; margin-right: 5px;"><input class="form-control form-num5" data-id="'
				+ index + '" data-type="listE" name="form-num5" placeholder="수치"></div>'
				+ '<div class="listE state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>'
				+ '<div style="width: 95px; float: left; margin-right: 5px;"><input class="form-control form-num6" data-id="'
				+ index + '" data-type="listF" name="form-num6" placeholder="수치"></div>'
				+ '<div class="listF state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>'
				+ '<div style="width: 95px; float: left; margin-right: 5px;"><input class="form-control form-num7" data-id="'
				+ index + '" data-type="listG" name="form-num7" placeholder="수치"></div>'
				+ '<div class="listG state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>'
				+ '<div style="width: 95px; float: left; margin-right: 5px;"><input class="form-control form-num8" data-id="'
				+ index + '" data-type="listH" name="form-num8" placeholder="수치"></div>'
				+ '<div class="listH state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>'
				+ '<div style="width: 95px; float: left; margin-right: 5px;"><input class="form-control form-num9" data-id="'
				+ index + '" data-type="listI" name="form-num9" placeholder="수치"></div>'
				+ '<div class="listI state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div>'
				+ '<div style="width: 95px; float: left; margin-right: 5px;"><input class="form-control form-num10" data-id="'
				+ index + '" data-type="listJ" name="form-num10" placeholder="수치"></div>'
				+ '<div class="listJ state" style="width: 45px; float: left; margin-right: 5px;">&nbsp;</div></div>';
			$(".new-field").append(new_div);
			console.log(idName);
			index++;
			returnState();

		}
		// [name]값을 받아 입력창이 비어 있는지 확인하는 함수 정의
		isEmpty = function (name, index) {
			return document.getElementsByName(name)[index].value.trim() == "";
		}
		// [name]값을 받아 입력창으로 커서를 이동시키는 함수 정의
		focusByName = function (name, index) {
			return document.getElementsByName(name)[index].focus();
		}
		function action() {
			var param = {};
			
			let agency = document.getElementsByName("form-agency")[0].value;
			let equipment = document.getElementsByName("form-equipment")[0].value;
			let formArr = document.getElementsByName("form-main");
			let pv = document.getElementsByName("form-pv")[0].value;
			
			// 유효성 검사
			if(agency.trim() == "") {
				doSwal("기관을 입력해주세요.", "");
				return focusByName("form-agency", 0);
			} else if(pv.trim() == "") { 
				doSwal("시점을 입력해주세요.", "");
				return focusByName("form-pv", 0);
			} else if(equipment.trim() == "") { 
				doSwal("측정기구를 입력해주세요.", "");
				return focusByName("form-equipment", 0);
			}
			let rowCnt = 0;
			for(let i = 0; i < formArr.length; i++) {
				let id = document.getElementsByName("form-id")[i].value;
				let name = document.getElementsByName("form-name")[i].value;
				let sex = document.getElementsByName("form-sex")[i].value;
				let age = document.getElementsByName("form-age")[i].value;
				let date = document.getElementsByName("form-date")[i].value;
				let jumin = document.getElementsByName("form-jumin1")[i].value + document.getElementsByName("form-jumin2")[i].value;
				
				/*  */
				let totalLength = id.length + name.length + jumin.length + age.length + date.length;
				for(let x = 1; x < 11; x++) {
					totalLength += document.getElementsByName("form-num"+x)[i].value.length;
				}
				if(totalLength==0) {
					if(i==0){
						return first_row_check();
					}
				}else {
					if(id.trim() == "") { 
						doSwal("아이디를 입력해주세요.", "");
						return focusByName("form-id", i);
					} else if(name.trim() == "") { 
						doSwal("이름을 입력해주세요.", "", "warning");
						return focusByName("form-name", i);
					} else if(jumin.trim().length < 7) { 
						doSwal("주민등록번호를 입력해주세요.", "앞자리와 뒷자리 모두 입력해주세요.", "info");
						return focusByName("form-jumin1", i);
					} else if(age.trim() == "") { 
						doSwal("나이를 입력해주세요.", "", "info");
						return focusByName("form-age", i);
					} else if(date.trim() == "") {
						doSwal("실시일자를 입력해주세요.", "", "info");
						return focusByName("form-date", i);
					}
					for(let x = 1; x < 11; x++) {
						if(isEmpty("form-num" + x, i)) { 
							doSwal("수치를 입력해주세요.", "", "info");
							return focusByName("form-num" + x, i);
						}
					}
				}
				if(id.trim() == "") {
					break;
				} else { 
					param["vibraDtoList["+i+"].agency"]=agency;
					param["vibraDtoList["+i+"].equipment"]=equipment; 
					param["vibraDtoList["+i+"].pv"]=pv; 
					param["vibraDtoList["+i+"].id"]=id; 
					param["vibraDtoList["+i+"].name"]=name; 
					param["vibraDtoList["+i+"].jumin"]=jumin; 
					param["vibraDtoList["+i+"].sex"]=sex;
					param["vibraDtoList["+i+"].age"]=age;
					param["vibraDtoList["+i+"].date"]=date; 
					for(let x = 1; x < 11; x++) {
						param["vibraDtoList[" + i + "].scoreList[" + (x - 1) + "]"] = document.getElementsByName("form-num" + x)[i].value;
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
					// 프로그램 결과 데이터가 담긴 object객체를 컨트롤러로 전달 
					$.ajax({
						url: "/insertForm/vibraInsertForm/insertData.do",
						type: "POST",
						data: param, 
						success:function(result) {
							let title = "";
							let content = "";
							let type = "";
							if (result.trim().length >= 0) {
								title = "수정 성공";
								content = "확인 버튼을 눌러주세요.";
								type = "success";
							} else {
								title = "수정 실패";
								content = "수정을 실패했습니다.";
								type = "error";
							}
							swal({
								title : title,
								text : content,
								icon : type
							}).then(function() {
								if (type == "success") {
									window.location.reload();
								}
							});
						},
						error:function(e) {
							doSwal("수정을 처리할 수 없습니다.", "올바른 정보인지 확인 후 재요청 해주십시오.", "error");
							console.log(e);
						}
					});
				}
			});
		}
	</script>
	<script type="text/javascript" src="/resources/js/common.js"></script>
	<!-- 페이지 내에서 이벤트가 발생하면 자바스크립트 함수를 실행하는 부분 ./---end -->
</body>
</html>