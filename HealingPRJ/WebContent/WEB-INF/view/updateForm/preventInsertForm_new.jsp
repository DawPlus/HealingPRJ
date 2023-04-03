<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int[] groupMargin = { 5, 5, 10, 5, 5, 10, 5, 5, 5, 10, 5, 10, 5, 5, 5, 5, 10, 5, 5, 10 };
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
	</style>
	<!-- 홍두표 - 나눔스퀘어 폰트 불러오기 및 css 클래스 분리 -->
	
	<!-- start---/. 페이지 로딩 후 바로 자바스크립트 함수를 실행하는 부분 -->
	<script>
		// 사전 데이터를 불러오기 전에는 사전/사후 차이를 비교할 수 없다.
		let compareEnable = false;
		let compareActive = true;
		compare = function() {
			// 1. '비교 활성화' 버튼 + 알림을 출력하는 p태그 추가
			// 2. '[사전 데이터] -> [사후 데이터]' 형식으로  점수 칸에 보여준다. -> 버튼이 '비교 비활성화'로 바뀐다.
			// 3. 다시 한번 누르면 '[사후 데이터]' 형식으로 바꿔준다. -> 버튼이 '비교 활성화'로 바뀐다.
			// 4. ...Row.jsp에서 점수 input태그에 'score'라는 클래스 추가
			// 5. ...Row.jsp에서 사전 점수를 담은 input(hidden)태그 추가
			// 6. 사전 데이터 조회 후 compareEnable = true 로 변경
			// 7. '비교 활성화' 상태에서 전송할 수 없도록 전송 버튼에서 예외 처리
			// 8. 행의 개수가 안맞을 경우 예외 처리
			let differ = document.getElementsByClassName("differ")[0];
			if (compareEnable) { // 사전 데이터를 불러온 상태일 경우
				let rowdata = document.getElementsByClassName("rowdata");
				let scores = document.getElementsByClassName("score");
				if (compareActive) { // '비교 활성화' 버튼을 눌렀을 경우
					for (let i = 0; i < rowdata.length; i++) {
						for (let j = 0; j < scores.length / rowdata.length; j++) {
							let score = document.getElementsByName("form-score" + (j + 1))[i];
							score.value = document.getElementsByName("compare" + (j + 1))[i].value
							+ " → " + score.value;
						}
					}
					document.getElementsByClassName("compare")[0].innerText = "점수 칸 : '[사전] → [사후]'";
					differ.value = "비교 비활성화";
					differ.classList.remove("btn-info");
					differ.classList.add("btn-default");
				} else { // '비교 비활성화' 버튼을 눌렀을 경우
					for (let i = 0; i < rowdata.length; i++) {
						for (let j = 0; j < scores.length / rowdata.length; j++) {
							let score = document.getElementsByName("form-score" + (j + 1))[i];
							score.value = score.value.substring(score.value.indexOf("→") + 2);
						}
					}
					document.getElementsByClassName("compare")[0].innerText = "";
					differ.value = "비교 활성화";
					differ.classList.remove("btn-default");
					differ.classList.add("btn-info");
				}
				compareActive = !compareActive;
				return false;
			}
			document.getElementsByClassName("compare")[0].innerText = "사전 데이터를 불러와야 비교할 수 있습니다.";
			setTimeout(() => {
				document.getElementsByClassName("compare")[0].innerText = "";
			}, 5000);
		}
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
				<li class="active">만족도 및 효과평가 입력</li>
				<li class="active">예방서비스 효과평가</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">예방서비스 효과평가</h1>
			</div>
		</div><!--/.row-->
		
		
		
		
		<!--홍석민이 만들고 있음  -->
		<div class="row">
			<!--고르기버튼 include -->
			<%@ include file="/WEB-INF/view/select.jsp"%>
			<div class="col-md-12">
				
				<div class="panel panel-default chat">
				
					<div class="panel-heading" style="display: inline-block; height: auto; width: 100%;">
						
						<div style="height: auto; width: auto;">
							<div style="display: inline-block;">
								<h4 class="item-title" style="float: left; margin: 8px 5px 8px 0px;">기관명</h4> 
								<div style="width: 120px; float: left; margin-right: 10px; white-space: nowrap; max-width: 300px;">
									<input class="form-control form-agency" name="form-agency" placeholder="기관명" value="<%=agency%>">
								</div>
								
								<h4 class="item-title" style="float: left; margin: 8px 5px 8px 0px;">시작일자</h4> 
								<div style="float: left; margin-right: 10px;">
									<input class="form-control form-openday" style="width: 190px;" type="date" name="form-openday" value="<%=openday%>">
								</div>
								<div style="float: left; margin: 0px 10px 0px 0px;">
									<input type="button" class="btn btn-default btn-sm has-history healing-btn" value="조회">
								</div>
								<!-- 사전/사후 차이 비교 버튼 -->
								<div style="float: left; margin: 0px 10px 0px 0px;">
									<input style="" type="button" class="differ btn btn-info healing-btn" onclick="compare();" value="비교 활성화">
								</div>
								<div style="float: left; margin: 0px 0px; font-size: small; display: initial;">
									<p class="compare" style="color: #ff9e36; margin: 0px;"></p>
								</div>
							</div>
							
							<div style="display: block;">
							
								<div style="margin-right:10px">
									<h4 class="item-title" style="float: left; margin-right : 5px;">참여프로그램</h4> 
									<div style="float: left; margin-right: 10px;">
										<select class="form-control" name="form-ptcProgram" style="width: 120px; height: 35px;">
											<option>당일형</option>
											<option>1박2일형</option>
											<option>2박3일형</option>
										</select>
									</div>
								</div>
								<div style="margin-right:10px">
									<h4 class="item-title" style="float: left; margin: 8px 5px 8px 0px;">실시일자</h4> 
									<div style="float: left; margin-right: 10px;">
										<input class="form-control form-eval_date" style="width: 190px;" type="date" name="form-eval_date">
									</div>
								</div>
								<div style="margin-right:10px">
									<h4 class="item-title" style="width: 55px; float: left; margin: 8px 5px 8px 0px;">시점</h4> 
									<div style="width: 90px; float: left; margin-right: 10px;">
										<select class="form-control" name="form-pv"style="height: 35px;">
											<option>사전</option>
											<option>중간</option>
											<option>종결</option>
										</select>
									</div>
								</div>
								
							</div>
							
						</div>
						<div style="display: flex; justify-content: flex-end;">
							<input type="button" class="btn btn-success btn-sm healing-btn" style="margin-right: 5px;" value="추가" onclick="add_div()"> 
							<input type="button" class="btn btn-default btn-sm healing-btn" style="margin-right: 5px;" value="전송" onclick="action()">
						</div>
						
					</div>
				
				
				
				
					<div class="panel-body" style="overflow-x: scroll; height: auto; overflow-y: hidden;">
						<div style="width: 2150px;height: 70px">
							<div style="width: 120px; float: left; margin-right: 10px; margin-left:30px; text-align: center; -webkit-text-emphasis-style: open;"><h4 style="font-weight: 600">이름</h4></div>
							<!--입력양식의 공통부분 -->
							<div style="width: 65px; float: left; margin-right: 10px; text-align: center; -webkit-text-emphasis-style: open;"><h4 style="font-weight: 600">성별</h4></div>
							<div style="width: 65px; float: left; margin-right: 10px; text-align: center; -webkit-text-emphasis-style: open;"><h4 style="font-weight: 600">연령</h4></div>
							<div style="width: 90px; float: left; margin-right: 10px; text-align: center; -webkit-text-emphasis-style: open;"><h4 style="font-weight: 600">거주지</h4></div>
							<div style="width: 140px; float: left; margin-right: 10px; text-align: center; -webkit-text-emphasis-style: open;"><h4 style="font-weight: 600">직업</h4></div>
							<!--입력양식의 공통부분 -->
							<div style="width: 160px; float: left; margin-right: 5px; text-align: center;"><h4 style="font-weight: 600">과거스트레스 해소 및 힐링 서비스 경험</h4></div>
							<div style="width: 195px; float: left; margin-right: 5px;text-align: center; "><h4 style="font-weight: 600; margin-bottom: 0px">중독특징이해</h4>
								<h5 class="sub-head">문항1</h5>
								<h5 class="sub-head">문항2</h5>
								<h5 class="sub-head">문항3</h5>
							</div>
							<div style="width: 195px; float: left; margin-right: 5px;text-align: center; "><h4 style="font-weight: 600; margin-bottom: 0px">핵심증상이해</h4>
								<h5 class="sub-head">문항4</h5>
								<h5 class="sub-head">문항5</h5>
								<h5 class="sub-head">문항6</h5>
							</div>
							<div style="width: 260px; float: left; margin-right: 5px;text-align: center;"><h4 style="font-weight: 600; margin-bottom: 0px">문제대응방법이해</h4>
								<h5 class="sub-head">문항7</h5>
								<h5 class="sub-head">문항8</h5>
								<h5 class="sub-head">문항9</h5>
								<h5 class="sub-head">문항10</h5>
							</div>
							<div style="width: 130px; float: left; margin-right: 5px;text-align: center;"><h4 style="font-weight: 600; margin-bottom: 0px">활용역량</h4>
								<h5 class="sub-head">문항11</h5>
								<h5 class="sub-head">문항12</h5>
							</div>
							<div style="width: 325px; float: left; margin-right: 5px;text-align: center; "><h4 style="font-weight: 600; margin-bottom: 0px">심리적면역력강화법</h4>
								<h5 class="sub-head">문항13</h5>
								<h5 class="sub-head">문항14</h5>
								<h5 class="sub-head">문항15</h5>
								<h5 class="sub-head">문항16</h5>
								<h5 class="sub-head">문항17</h5>
							</div>
							<div style="width: 195px; float: left; margin-right: 5px;text-align: center; "><h4 style="font-weight: 600; margin-bottom: 0px">삶의 질</h4>
								<h5 class="sub-head">문항18</h5>
								<h5 class="sub-head">문항19</h5>
								<h5 class="sub-head">문항20</h5>
							</div>
						</div>

						<div id="parent">
							<%for (int i = 0; i < 10; i++) { %>
							<div class="insertForm" style="width: 2150px; height: 40px;" name="form-main" id="child<%=i%>">
								<button onclick="delete_info(<%=i%>)" style="font-size:70%; display:block; margin: 5px 5px 0px 0px; float: left;">X</button>
								<div style="width: 120px; float: left; margin-right: 10px;">
									<input class="form-control" name="form-name" placeholder="이름">
								</div>
								<div style="width: 65px; float: left; margin-right: 10px;">
									<select class="form-control" name="form-sex" style="height: 35px;">
										<%@ include file="/WEB-INF/view/insertForm/sex.jsp"%>
									</select>
								</div>
								<div style="width: 65px; float: left; margin-right: 10px;">
									<input class="form-control" type="number" name="form-age" placeholder="연령">
								</div>
								<div style="width: 90px; float: left; margin-right: 10px;">
									<select class="form-control" name="form-residence" style="height: 35px;">
										<%@ include file="/WEB-INF/view/insertForm/residences.jsp"%>
									</select>
								</div>
								<div style="width: 140px; float: left; margin-right: 10px;">
									<select class="form-control" name="form-job" style="height: 35px;">
										<%@ include file="/WEB-INF/view/insertForm/jobs.jsp"%>
									</select>
								</div>
								<div style="width: 160px; float: left; margin-right: 5px;">
									<input class="form-control" type="number" name="form-pastStress" placeholder="0=미기재/1=무/2=유">
								</div>
								<%
								// 반복문을 돌려서 문항 개수만큼 문항 만들기
								for(int j = 0; j < groupMargin.length; j++) { %>
								<div style="width: 60px; float: left; margin-right: <%=groupMargin[j]%>px;">
									<input class="form-control" name="form-score<%=j+1 %>" placeholder="점수">
								</div>
								<% } %>
							</div>
							<% }  %>
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
			let idName = "child"+ index +"";
			let new_div = '<div class="insertForm" style="width: 2150px; height: 40px;" name="form-main" id="child'
				    + index + '"><button onclick="delete_info('
				    + index + ')" style="font-size:70%; display:block; margin: 5px 5px 0px 0px; float: left;">X</button>'
				    + '<div style="width: 120px; float: left; margin-right: 10px;"><input class="form-control" name="form-name" placeholder="이름"></div>'
				    + `<div style="width: 65px; float: left; margin-right: 10px;"><select class="form-control" name="form-sex" style="height: 35px;"><%@ include file="/WEB-INF/view/insertForm/sex.jsp"%></select></div>`
				    + '<div style="width: 65px; float: left; margin-right: 10px;"><input class="form-control" type="number" name="form-age" placeholder="연령"></div>'
				    + `<div style="width: 90px; float: left; margin-right: 10px;"><select class="form-control" name="form-residence" style="height: 35px;"><%@ include file="/WEB-INF/view/insertForm/residences.jsp"%></select></div>`
				    + `<div style="width: 140px; float: left; margin-right: 10px;"><select class="form-control" name="form-job" style="height: 35px;"><%@ include file="/WEB-INF/view/insertForm/jobs.jsp"%></select></div>`
				    + '<div style="width: 160px; float: left; margin-right: 5px;"><input class="form-control" type="number" name="form-pastStress" placeholder="0=미기재/1=무/2=유"></div>'
			    	+ `<%for(int j = 0; j < groupMargin.length; j++) { %><div style="width: 60px; float: left; margin-right: <%=groupMargin[j]%>px;"><input class="form-control" name="form-score<%=j+1 %>" placeholder="점수"></div><% } %></div>`;
			    	
			$(".new-field").append(new_div);
			console.log(idName);
			index++;
			
		}
		
		/*/.start--- 홍두표 - 기관명 및 시작일자로 DB조회 */
		const selectElement = document.querySelector(".has-history");
		
		selectElement.addEventListener("click", function() {
			let form_agency = document.querySelector(".form-agency").value;
			let form_openday = document.querySelector(".form-openday").value;
			if(form_agency.length == 0 || form_openday.length == 0) {
				doSwal("기관명과 시작일자가 올바르지 않습니다.", "기관명과 시작일자를 확인해주십시오.", "warning");
				return false;
			}
			obj = {};
			obj["agency"] = form_agency;
			obj["openday"] = form_openday;
			console.table(obj);
			/* JQuery는 협의 후 axios로 변환 */
			$.ajax({
				url: "/insertForm/preventInsertForm/getPreviousPreventList.do",
				type: "POST",
				data: obj,
				success: function(result) {
					if(result.length > 0) {
						doSwal("사전 기록이 존재합니다.", "이전에 작성했던 데이터를 불러옵니다.", "success");
						document.getElementById("parent").innerHTML = result;
						// 사전 데이터를 불러왔기 때문에 사전/사후 차이값을 비교할 수 있다.
						compareEnable = true;
						compareActive = true;
						let differ = document.getElementsByClassName("differ")[0];
						document.getElementsByClassName("compare")[0].innerText = "";
						differ.value = "비교 활성화";
						differ.classList.remove("btn-default");
						differ.classList.add("btn-info");
						return false;
					}
					doSwal("이전에 작성했던 기록이 없습니다.", "");
				},
				error: function(e) {
					/* 협의 후 로그 말고 다른 이벤트 실행 */
					console.log(e);
					doSwal("정보를 조회할 수 없습니다.", "올바른 정보인지 확인 후 재요청 해주십시오.", "error");
				}
			});
			return false;
		});
		/* 홍두표 - 기관명 및 시작일자로 DB조회 ./---end */
	
		function action() {
			if (!compareActive) {
				doSwal("비활성화 버튼을 눌러주시기 바랍니다.", "", "warning");
				return false;
			}
			var param = {};
			
			let agency = document.getElementsByName("form-agency")[0].value;
			let openday = document.getElementsByName("form-openday")[0].value;
			let ptcProgram = document.getElementsByName("form-ptcProgram")[0].value;
			let pv = document.getElementsByName("form-pv")[0].value;
			let eval_date = document.getElementsByName("form-eval_date")[0].value;
			
			//유효성 검사
		    if(agency.trim() == "") {
		   	  alert("기관을 입력해주세요.");
		   	  return false;
		    } else if(openday.trim() == "") { 
		   	  alert("시작일자를 입력해주세요.");
		   	  return false;
		    } else if(ptcProgram.trim() == "") { 
			  alert("참여프로그램을 입력해주세요.");
			  return false;
		    } else if(pv.trim() == "") { 
			  alert("시점 입력해주세요.");
			  return false;
		    } else if(eval_date.trim() == "") { 
			  alert("실시일자 입력해주세요.");
			  return false;
			} 
			
			
			let formArr = document.getElementsByName("form-main");
			
			for(let i = 0; i < formArr.length; i++) {
				let name = document.getElementsByName("form-name")[i].value;
				let sex = document.getElementsByName("form-sex")[i].value;
				let age = document.getElementsByName("form-age")[i].value;
				let residence = document.getElementsByName("form-residence")[i].value;
				let job = document.getElementsByName("form-job")[i].value;
				let pastStress = document.getElementsByName("form-pastStress")[i].value;
				 
				
				if(name.trim() == "") {
				} else {
					if(name.trim() == "") {
						alert("이름을 입력해주세요.");
						return document.getElementsByName("form-name")[i].focus();
					} else if(sex.trim() == "") {
						alert("성별을 입력해주세요.");
						return document.getElementsByName("form-sex")[i].focus();
					} else if(age.trim() == "") {
						alert("연령을 입력해주세요.");
						return document.getElementsByName("form-age")[i].focus();
					} else if(residence.trim() == "") {
						alert("거주지를 입력해주세요.");
						return document.getElementsByName("form-residence")[i].focus();
					} else if(job.trim() == "") {
						alert("직업을 입력해주세요.");
						return document.getElementsByName("form-job")[i].focus();
					} else if(pastStress.trim() == "") {
						alert("과거 상담 서비스 경험을 입력해주세요.");
						return document.getElementsByName("form-pastStress")[i].focus();
					}
				}
				if(name=="") { 
					break;
				} else { 
					 param["preventDtoList["+i+"].agency"]=agency;
			         param["preventDtoList["+i+"].openday"]=openday; 
			         param["preventDtoList["+i+"].ptcProgram"]=ptcProgram; 
			         param["preventDtoList["+i+"].name"]=name; 
			         param["preventDtoList["+i+"].sex"]=sex;
			         param["preventDtoList["+i+"].age"]=age;
			         param["preventDtoList["+i+"].residence"]=residence;
			         param["preventDtoList["+i+"].job"]=job;
			         param["preventDtoList["+i+"].past_stress_experience"]=pastStress;
			         param["preventDtoList["+i+"].pv"]=pv;
			         param["preventDtoList["+i+"].eval_date"]=eval_date;
	
			         
				     for(let j = 0; j < 20; j++) {
				    	 if(document.getElementsByName("form-score"+(j+1))[i].value.trim() == "") {
								alert("점수를 입력해주세요.");
								return document.getElementsByName("form-score"+(j+1))[i].focus();
							}
						param["preventDtoList["+i+"].scoreList["+j+"]"] = document.getElementsByName("form-score"+(j+1))[i].value;
					}
				}
			}
			 console.log(param);
		      $.ajax({
		         url: "/insertForm/preventInsertForm/insertData.do",
		         type: "POST",
		         data: param, 
		         success:function(result) {
		        	 swal({
							title : "전송 성공",
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
			
	</script>
	<script type="text/javascript" src="/resources/js/common.js"></script>
	<!-- 페이지 내에서 이벤트가 발생하면 자바스크립트 함수를 실행하는 부분 ./---end -->
</body>
</html>