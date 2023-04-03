<%@page import="poly.dto.HealingInsertDTO"%>
<%@page import="java.util.List"%>
<%@page import="static poly.util.CmmUtil.convertXSS"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int[] groupMargin = { 5, 10, 5, 5, 10, 5, 5, 5, 10, 5, 5, 10, 5, 5, 5, 10, 5, 5, 10, 5, 5, 10 };
	List<HealingInsertDTO> hList = (List<HealingInsertDTO>)request.getAttribute("healingList");
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
	
	<!--Custom Font-->
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
				<h1 class="page-header">힐링서비스 효과평가 수정</h1>
			</div>
		</div><!--/.row-->
		
		
		
		
		<!--홍석민이 만들고 있음	-->
		<div class="row">
			<div class="col-md-12">
				
				<div class="panel panel-default chat">
				
					<div class="panel-heading" style="display: inline-block; height: auto; width: 100%;">
						
						<div style="height: auto; width: auto;">
							<div style="display: inline-block;">
								<h4 class="item-title" style="float: left; margin: 8px 5px 8px 0px;">기관명</h4> 
								<div style="width: 120px; float: left; margin-right: 10px; white-space: nowrap; max-width: 300px;">
									<input class="form-control form-agency" name="form-agency" placeholder="기관명" value="<%=convertXSS(hList.get(0).getAgency())%>">
								</div>
								
								<h4 class="item-title" style="float: left; margin: 8px 5px 8px 0px;">시작일자</h4> 
								<div style="float: left; margin-right: 10px;">
									<input class="form-control form-openday" style="width: 190px;" type="date" name="form-openday" value="<%=convertXSS(hList.get(0).getOpenday())%>">
								</div>
							</div>
							
							<div style="display: block;">
							
								<div style="margin-right:10px">
									<h4 class="item-title" style="float: left; margin-right : 5px;">참여프로그램</h4> 
									<div style="float: left; margin-right: 10px;">
										<select class="form-control" name="form-ptcProgram" style="width: 120px; height: 35px;">
											<option><%=convertXSS(hList.get(0).getPtcProgram())%></option>
											<option>당일형</option>
											<option>1박2일형</option>
											<option>2박3일형</option>
										</select>
									</div>
								</div>
								<div style="margin-right:10px">
									<h4 class="item-title" style="float: left; margin: 8px 5px 8px 0px;">실시일자</h4> 
									<div style="float: left; margin-right: 10px;">
										<input class="form-control form-eval_date" style="width: 190px;" type="date" name="form-eval_date" value="<%=convertXSS(hList.get(0).getEval_date())%>">
									</div>
								</div>
								<div style="margin-right:10px">
									<h4 class="item-title" style="float: left; margin: 8px 5px 8px 0px; width:55px">시점</h4> 
									<div style="width: 90px; float: left; margin-right: 10px;">
										<input class="form-control" name="form-pv" value="<%=convertXSS(hList.get(0).getPv())%>" readonly>
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
						
						<div style="width: 2250px;height: 70px">
							<div style="width: 120px; float: left; margin-right: 10px; margin-left:30px; text-align: center; -webkit-text-emphasis-style: open;"><h4 style="font-weight: 600">이름</h4></div>
							<!--입력양식의 공통부분 -->
							<div style="width: 85px; float: left; margin-right: 10px; text-align: center; -webkit-text-emphasis-style: open;"><h4 class="main-head">성별</h4></div>
							<div style="width: 60px; float: left; margin-right: 10px; text-align: center; -webkit-text-emphasis-style: open;"><h4 class="main-head">연령</h4></div>
							<div style="width: 90px; float: left; margin-right: 10px; text-align: center; -webkit-text-emphasis-style: open;"><h4 class="main-head">거주지</h4></div>
							<div style="width: 120px; float: left; margin-right: 10px; text-align: center; -webkit-text-emphasis-style: open;"><h4 class="main-head">직업</h4></div>
							<!--입력양식의 공통부분 -->
							<div style="width: 160px; float: left; margin-right: 5px; text-align: center;"><h4 class="main-head">과거스트레스 해소 및 힐링 서비스 경험</h4></div>
							
							<div style="width: 130px; float: left; margin-right: 5px;text-align: center;"><h4 class="main-head">욕구충족</h4>
								<h5 class="sub-head">문항1 </h5>
								<h5 class="sub-head">문항2 </h5>
							</div>
							<div style="width: 195px; float: left; margin-right: 5px;text-align: center; "><h4 class="main-head">긍정정서</h4>
								<h5 class="sub-head">문항3</h5>
								<h5 class="sub-head">문항4</h5>
								<h5 class="sub-head">문항5</h5>
							</div>
							<div style="width: 260px; float: left; margin-right: 5px;text-align: center;"><h4 class="main-head">자기이해</h4>
								<h5 class="sub-head">문항6</h5>
								<h5 class="sub-head">문항7</h5>
								<h5 class="sub-head">문항8</h5>
								<h5 class="sub-head">문항9</h5>
							</div>
							<div style="width: 195px; float: left; margin-right: 5px;text-align: center; "><h4 class="main-head">마음관리기술</h4>
								<h5 class="sub-head">문항10</h5>
								<h5 class="sub-head">문항11</h5>
								<h5 class="sub-head">문항12</h5>
							</div>
							<div style="width: 260px; float: left; margin-right: 5px;text-align: center;"><h4 class="main-head">정서능력측면</h4>
								<h5 class="sub-head">문항1</h5>
								<h5 class="sub-head">문항2</h5>
								<h5 class="sub-head">문항3</h5>
								<h5 class="sub-head">문항4</h5>
							</div>
							<div style="width: 195px; float: left; margin-right: 5px;text-align: center; "><h4 class="main-head">영성측면</h4>
								<h5 class="sub-head">문항5</h5>
								<h5 class="sub-head">문항6</h5>
								<h5 class="sub-head">문항7</h5>
							</div>
							<div style="width: 195px; float: left; margin-right: 5px;text-align: center; "><h4 class="main-head">삶의 조망측면</h4>
								<h5 class="sub-head">문항8</h5>
								<h5 class="sub-head">문항9</h5>
								<h5 class="sub-head">문항10</h5>
							</div>
						</div>
						<div id="parent">
							<%for(int i = 0; i < hList.size(); i++) { %>
							<div class="insertForm" style="width: 2250px; height: 40px;" name="form-main" id="child<%=i%>">
								<button onclick="delete_info(<%=i%>)" style="font-size:70%; display:block; margin: 5px 5px 0px 0px; float: left;">X</button>
								<div style="width: 120px; float: left; margin-right: 10px;">
									<input class="form-control" name="form-name" placeholder="이름" value="<%=convertXSS(hList.get(i).getName())%>">
								</div>
								<div style="width: 85px; float: left; margin-right: 10px;">
									<select class="form-control" name="form-sex" style="height: 35px;">
										<option><%=convertXSS(hList.get(i).getSex())%></option>
										<%@ include file="/WEB-INF/view/insertForm/sex.jsp"%>
									</select>
								</div>
								<div style="width: 60px; float: left; margin-right: 10px;">
									<input class="form-control" type="number" name="form-age" placeholder="연령" value="<%=convertXSS(hList.get(i).getAge())%>">
								</div>
								<div style="width: 90px; float: left; margin-right: 10px;">
									<select class="form-control" name="form-residence" style="height: 35px;">
										<option><%=convertXSS(hList.get(i).getResidence())%></option>
										<%@ include file="/WEB-INF/view/insertForm/residences.jsp"%>
									</select>
								</div>
								<div style="width: 120px; float: left; margin-right: 10px;">
									<select class="form-control" name="form-job" style="height: 35px;">
										<option><%=convertXSS(hList.get(i).getJob())%></option>
										<%@ include file="/WEB-INF/view/insertForm/jobs.jsp"%>
									</select>
								</div>
								<div style="width: 160px; float: left; margin-right: 5px;">
									<input class="form-control" name="form-pastStress" placeholder="0=미기재/1=무/2=유" value="<%=convertXSS(hList.get(i).getPast_stress_experience())%>">
								</div>
								<%
								// 반복문을 돌려서 문항 개수만큼 문항 만들기
								for(int j = 0; j < groupMargin.length; j++) { %>
								<div style="width: 60px; float: left; margin-right: <%=groupMargin[j]%>px;">
									<input class="form-control" name="form-score<%=j+1 %>" placeholder="점수" value="<%=hList.get(i).getScoreString2List().get(j)%>">
								</div>
								<% } %>
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
	
	<!--홍석민 버튼 활성화 비활성화 -->
	<script type="text/javascript">
		var insertBtn = document.getElementById("insertInfo");
		var loadBtn = document.getElementById("loadExcel");
		
		function btn_insertInfo() {
			if(insertBtn.disabled==false) {
				loadBtn.disabled = false;
				insertBtn.disabled = "disabled";		
			}
		}
		function btn_loadExcel() {
			if(loadBtn.disabled==false) {
				insertBtn.disabled = false;
				loadBtn.disabled = "disabled";	
			}
		}
	</script>
	
	
	<!-- start---/. 페이지 내에서 이벤트가 발생하면 자바스크립트 함수를 실행하는 부분 -->
	<script type="text/javascript">
		function add_div() {
			let index = document.getElementsByName("form-main").length;
			let val = document.getElementsByName("form-main")[index-1].id;
			let num = val.substring(5,val.length);
			index = parseInt(num) + 1;
			console.log(num);
			let idName = "child"+ index +"";
			let new_div = '<div class="insertForm" style="width: 2250px; height: 40px;" name="form-main" id="child'
			    + index + '"><button onclick="delete_info('
			    + index + ')" style="font-size:70%; display:block; margin: 5px 5px 0px 0px; float: left;">X</button>'
			    + '<div style="width: 120px; float: left; margin-right: 10px;"><input class="form-control" name="form-name" placeholder="이름"></div>'
			    + `<div style="width: 85px; float: left; margin-right: 10px;"><select class="form-control" name="form-sex" style="height: 35px;"><%@ include file="/WEB-INF/view/insertForm/sex.jsp"%></select></div>`
			    + '<div style="width: 60px; float: left; margin-right: 10px;"><input class="form-control" type="number" name="form-age" placeholder="연령"></div>'
			    + `<div style="width: 90px; float: left; margin-right: 10px;"><select class="form-control" name="form-residence" style="height: 35px;"><%@ include file="/WEB-INF/view/insertForm/residences.jsp"%></select></div>`
			    + `<div style="width: 120px; float: left; margin-right: 10px;"><select class="form-control" name="form-job" style="height: 35px;"><%@ include file="/WEB-INF/view/insertForm/jobs.jsp"%></select></div>`
			    + '<div style="width: 160px; float: left; margin-right: 5px;"><input class="form-control" name="form-pastStress" placeholder="0=미기재/1=무/2=유"></div>'
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
				url: "/insertForm/healingInsertForm/getPreviousHealingList.do",
				type: "POST",
				data: obj,
				success: function(result) {
					if(result.length > 0) {
						doSwal("사전 기록이 존재합니다.", "이전에 작성했던 데이터를 불러옵니다.", "success");
						document.getElementById("parent").innerHTML = result;
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
			var param = {};
			let agency = document.getElementsByName("form-agency")[0].value;
			let openday = document.getElementsByName("form-openday")[0].value;
			let ptcProgram = document.getElementsByName("form-ptcProgram")[0].value;
			let pv = document.getElementsByName("form-pv")[0].value;
			let formArr = document.getElementsByName("form-main");
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
				let pastStress = document.getElementsByName("form-pastStress")[i].value;
				
				/*  */
				let totalLength = name.length + age.length + pastStress.length;
				for(let j = 0; j < 22; j++) {
					totalLength += document.getElementsByName("form-score" + (j + 1))[i].value.length;
				}
				
				if(totalLength==0) {
					if(i==0){
						return first_row_check();
					}
				}else {
					if(name.trim() == "") {
						alert("이름을 입력해주세요.");
						return document.getElementsByName("form-name")[i].focus();
					} else if(age.trim() == "") {
						alert("연령을 입력해주세요.");
						return document.getElementsByName("form-age")[i].focus();
					} else if(pastStress.trim() == "") {
						alert("과거 상담 서비스 경험을 입력해주세요.");
						return document.getElementsByName("form-pastStress")[i].focus();
					}
					for(let j = 0; j < 22; j++) {
						if(document.getElementsByName("form-score"+(j+1))[i].value.trim() == "") {
							alert("점수를 입력해주세요.");
							return document.getElementsByName("form-score"+(j+1))[i].focus();
						}
					}
				}
				/*  */
				if(name=="") {
					break;
				} else { 
					param["healingDtoList["+i+"].agency"]=agency;
				    param["healingDtoList["+i+"].openday"]=openday; 
				    param["healingDtoList["+i+"].ptcProgram"]=ptcProgram; 
				    param["healingDtoList["+i+"].name"]=name; 
				    param["healingDtoList["+i+"].sex"]=sex;
				    param["healingDtoList["+i+"].age"]=age;
				    param["healingDtoList["+i+"].residence"]=residence;
				    param["healingDtoList["+i+"].job"]=job;
				    param["healingDtoList["+i+"].past_stress_experience"]=pastStress;
				    param["healingDtoList["+i+"].pv"]=pv;
				    param["healingDtoList["+i+"].eval_date"]=eval_date;
				    for(let j = 0; j < 22; j++) {
						param["healingDtoList["+i+"].scoreList["+j+"]"] = document.getElementsByName("form-score"+(j+1))[i].value;
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
						url: "/insertForm/healingInsertForm/insertData.do",
						type: "POST",
						data: param, 
						success:function(result) {
								swal({
					 				title : "수정 성공",
					 				text : "확인 버튼을 눌러주세요.",
					 				icon : "success"
					 			}).then(function() {
					 				window.location.reload();
					 			});
						},
						error:function(e) {
							console.log(e);
						}
					});
				}
			})
		}
	</script>
	<script type="text/javascript" src="/resources/js/common.js"></script>
	<!-- 페이지 내에서 이벤트가 발생하면 자바스크립트 함수를 실행하는 부분 ./---end -->
</body>
</html>