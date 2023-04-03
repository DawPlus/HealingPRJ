<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int[] groupWidth = { 60, 60, 60, 60, 110, 110, 110, 60, 60, 65, 140, 60, 60, 60, 60, 60, 60, 140, 115, 115 };
	int[] groupMargin = { 10, 10, 10, 10, 5, 5, 5, 10, 10, 10, 5, 10, 10, 10, 10, 10, 10, 5, 10, 10 };
	String[] form_name = { "score1", "score2", "score3", "score4", "score5", "score6", "score7", "score8", "score9", "score10", 
			"opinion1", "score11", "score12", "score13", "score14", "score15", "score16","opinion2", "score17", "score18" };
	String[] form_placeholder = { "점수", "점수", "점수", "점수", "점수", "점수", "점수", "점수", "점수", "점수", 
			"기타의견", "점수", "점수", "점수", "점수", "점수", "점수","기타의견", "점수", "점수" };
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
	
	<!-- 홍두표 - 나눔스퀘어 폰트 불러오기 -->
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
				<li><a href="#"> <em class="fa fa-home"></em>
				</a></li>
				<li class="active">만족도 및 효과평가 입력</li>
				<li class="active">서비스환경 만족도</li>
			</ol>
		</div>
		<!--/.row-->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">서비스환경 만족도</h1>
			</div>
		</div>
		<!--/.row-->

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
								
							</div>
							
						</div>
						
						
						<div style="display: flex; justify-content: flex-end;">
							<input type="button" class="btn btn-success btn-sm healing-btn" style="margin-right: 5px;" value="추가" onclick="add_div()"> 
							<input type="button" class="btn btn-default btn-sm healing-btn" style="margin-right: 5px;" value="전송" onclick="action()">
						</div>
						
					</div>


					<div class="panel-body" style="overflow-x: scroll; height: auto; overflow-y: hidden;">

						<div style="width: 2400px; height: 70px">
							<div style="width: 65px; float: left; margin-right: 10px; margin-left:30px; text-align: center; -webkit-text-emphasis-style: open;">
								<h4 style="font-weight: 600">성별</h4>
							</div>
							<div style="width: 60px; float: left; margin-right: 10px; text-align: center; -webkit-text-emphasis-style: open;">
								<h4 style="font-weight: 600">연령</h4>
							</div>
							<div style="width: 90px; float: left; margin-right: 10px; text-align: center; -webkit-text-emphasis-style: open;">
								<h4 style="font-weight: 600">거주지</h4>
							</div>
							<div style="width: 140px; float: left; margin-right: 10px; text-align: center; -webkit-text-emphasis-style: open;">
								<h4 style="font-weight: 600">직업</h4>
							</div>
							<div style="width: 65px; float: left; margin-right: 5px; text-align: center;">
								<h4 class="main-head">
									숙소<br>(문항1)
								</h4>
							</div>
							<div style="width: 65px; float: left; margin-right: 5px; text-align: center;">
								<h4 class="main-head">
									숙소<br>(문항2)
								</h4>
							</div>
							<div style="width: 65px; float: left; margin-right: 5px; text-align: center">
								<h4 class="main-head">
									식당<br>(문항3)
								</h4>
							</div>
							<div style="width: 65px; float: left; margin-right: 5px; text-align: center">
								<h4 class="main-head">
									식당<br>(문항4)
								</h4>
							</div>
							<div style="width: 110px; float: left; margin-right: 5px; text-align: center">
								<h4 style="font-weight: 600">프로그램 장소(문항5)</h4>
							</div>
							<div style="width: 110px; float: left; margin-right: 5px; text-align: center">
								<h4 style="font-weight: 600">프로그램 장소(문항6)</h4>
							</div>
							<div style="width: 110px; float: left; margin-right: 5px; text-align: center">
								<h4 style="font-weight: 600">프로그램 장소(문항7)</h4>
							</div>
							<div style="width: 65px; float: left; margin-right: 5px; text-align: center">
								<h4 class="main-head">
									야외<br>(문항8)
								</h4>
							</div>
							<div style="width: 65px; float: left; margin-right: 5px; text-align: center">
								<h4 class="main-head">
									야외<br>(문항9)
								</h4>
							</div>
							<div style="width: 70px; float: left; margin-right: 5px; text-align: center">
								<h4 class="main-head">
									야외<br>(문항10)
								</h4>
							</div>
							<div style="width: 140px; float: left; margin-right: 5px; text-align: center; -webkit-text-emphasis-style: open;">
								<h4 style="font-weight: 600">기타의견</h4>
							</div>
							<div style="width: 65px; float: left; margin-right: 5px; text-align: center">
								<h4 class="main-head">
									운영<br>(문항1)
								</h4>
							</div>
							<div style="width: 65px; float: left; margin-right: 5px; text-align: center">
								<h4 class="main-head">
									운영<br>(문항2)
								</h4>
							</div>
							<div style="width: 65px; float: left; margin-right: 5px; text-align: center">
								<h4 class="main-head">
									운영<br>(문항3)
								</h4>
							</div>
							<div style="width: 65px; float: left; margin-right: 5px; text-align: center">
								<h4 class="main-head">
									식사<br>(문항4)
								</h4>
							</div>
							<div style="width: 65px; float: left; margin-right: 5px; text-align: center">
								<h4 class="main-head">
									식사<br>(문항5)
								</h4>
							</div>
							<div style="width: 65px; float: left; margin-right: 5px; text-align: center">
								<h4 class="main-head">
									식사<br>(문항6)
								</h4>
							</div>
							
							<div style="width: 140px; float: left; margin-right: 5px; text-align: center; -webkit-text-emphasis-style: open;">
								<h4 style="font-weight: 600">기타의견</h4>
							</div>
							<div style="width: 120px; float: left; margin-right: 5px; text-align: center">
								<h4 style="font-weight: 600">잠재적 관광수요<br>(문항8)</h4>
							</div>
							<div style="width: 120px; float: left; margin-right: 5px; text-align: center">
								<h4 style="font-weight: 600">잠재적 관광수요<br>(문항9)</h4>
							</div>
						</div>
						
						<div id="parent">
							<%for (int i = 0; i < 10; i++) { %>
							<div class="insertForm" style="width: 2400px; height: 40px" name="form-main" id="child<%=i%>">
								<button onclick="delete_info(<%=i%>)" style="font-size:70%; display:block; margin: 5px 5px 0px 0px; float: left;">X</button>
								<div style="width: 65px; float: left; margin-right: 10px;">
									<select class="form-control" name="form-sex" style="height: 35px;">
										<%@ include file="/WEB-INF/view/insertForm/sex.jsp"%>
									</select>
								</div>
								<div style="width: 60px; float: left; margin-right: 10px;">
									<input class="form-control" name="form-age" placeholder="연령">
								</div>
								<div style="width: 90px; float: left; margin-right: 10px;">
									<select class="form-control" name="form-residence"
										style="height: 35px;">
										<%@ include file="/WEB-INF/view/insertForm/residences.jsp"%>
									</select>
								</div>
								<div style="width: 140px; float: left; margin-right: 10px;">
									<select class="form-control" name="form-job" style="height: 35px;">
										<%@ include file="/WEB-INF/view/insertForm/jobs.jsp"%>
									</select>
								</div>
								<%
								// 반복문을 돌려서 문항 개수만큼 문항 만들기
								for(int j = 0; j < groupMargin.length; j++) { %>
								<div style="width: <%=groupWidth[j] %>px; float: left; margin-right: <%=groupMargin[j] %>px;">
									<input class="form-control" name="form-<%=form_name[j] %>" placeholder="<%=form_placeholder[j] %>">
								</div>
								<%} %>
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
	
    <!-- start---/. 페이지 내에서 이벤트가 발생하면 자바스크립트 함수를 실행하는 부분 -->
	<script type="text/javascript">
		function add_div() {
			let index = document.getElementsByName("form-main").length;
			let val = document.getElementsByName("form-main")[index-1].id;
			let num = val.substring(5,val.length);
			index = parseInt(num) + 1;
			console.log(index);
			let idName = "child"+ index +"";
			let new_div = '<div class="insertForm" style="width: 2400px; height: 40px" name="form-main" id="child'
						+ index + '"><button onclick="delete_info('
						+ index + ')" style="font-size:70%; display:block; margin: 5px 5px 0px 0px; float: left;">X</button>'
						+ `<div style="width: 65px; float: left; margin-right: 10px;"><select class="form-control" name="form-sex" style="height: 35px;"><%@ include file="/WEB-INF/view/insertForm/sex.jsp"%></select></div>`
						+ `<div style="width: 60px; float: left; margin-right: 10px;"><input class="form-control" name="form-age" placeholder="연령"></div>`
						+ `<div style="width: 90px; float: left; margin-right: 10px;"><select class="form-control" name="form-residence"style="height: 35px;"><%@ include file="/WEB-INF/view/insertForm/residences.jsp"%></select></div>`
						+ `<div style="width: 140px; float: left; margin-right: 10px;"><select class="form-control" name="form-job" style="height: 35px;"><%@ include file="/WEB-INF/view/insertForm/jobs.jsp"%></select></div>`
						+ `<%for(int j = 0; j < groupMargin.length; j++) { %><div style="width: <%=groupWidth[j] %>px; float: left; margin-right: <%=groupMargin[j] %>px;"><input class="form-control" name="form-<%=form_name[j] %>" placeholder="<%=form_placeholder[j] %>"></div><%} %></div>`;
				
			$(".new-field").append(new_div);
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
				url: "/insertForm/serviceInsertForm/getPreviousServiceList.do",
				type: "POST",
				data: obj,
				success: function(result) {
					if(result.length > 0) {
						doSwal("이전에 작성했던 기록이 존재합니다.", "이전에 작성했던 데이터를 불러옵니다.", "success");
						console.log(result);
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
	      let eval_date = document.getElementsByName("form-eval_date")[0].value;
	      
	      let formArr = document.getElementsByName("form-main");
	      
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
	    	  alert("실시일자를 입력해주세요.");
	    	  return false;
	      } 
	      for(let i = 0; i < formArr.length; i++) {
	    	  
	         let sex = document.getElementsByName("form-sex")[i].value;
	         let age = document.getElementsByName("form-age")[i].value;
	         let residence = document.getElementsByName("form-residence")[i].value;
	         let job = document.getElementsByName("form-job")[i].value;
	         let score1 = document.getElementsByName("form-score1")[i].value;
	         let score2 = document.getElementsByName("form-score2")[i].value;
	         let score3 = document.getElementsByName("form-score3")[i].value;
	         let score4 = document.getElementsByName("form-score4")[i].value;
	         let score5 = document.getElementsByName("form-score5")[i].value;
	         let score6 = document.getElementsByName("form-score6")[i].value;
	         let score7 = document.getElementsByName("form-score7")[i].value;
	         let score8 = document.getElementsByName("form-score8")[i].value;
	         let score9 = document.getElementsByName("form-score9")[i].value;
	         let score10 = document.getElementsByName("form-score10")[i].value;
	         let score11 = document.getElementsByName("form-score11")[i].value;
	         let score12 = document.getElementsByName("form-score12")[i].value;
	         let score13 = document.getElementsByName("form-score13")[i].value;
	         let score14 = document.getElementsByName("form-score14")[i].value;
	         let score15 = document.getElementsByName("form-score15")[i].value;
	         let score16 = document.getElementsByName("form-score16")[i].value;
	         let score17 = document.getElementsByName("form-score17")[i].value;
	         let score18 = document.getElementsByName("form-score18")[i].value;
	         let opinion1 = document.getElementsByName("form-opinion1")[i].value;
	         let opinion2 = document.getElementsByName("form-opinion2")[i].value;
	         
	         if(age.trim() == "") {
	         } else {
	        	 if(sex.trim() == "") { 
	 	        	alert("성별을 입력해주세요.");
	 	        	console.log(i);
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
	        	 	} else if(score1.trim() == "") {
	 	        	alert("점수를 입력해주세요.");
	 	       		return document.getElementsByName("form-score1")[i].focus();
	        	 	} else if(score2.trim() == "") {
	 	        	alert("점수를 입력해주세요.");
	 	       		return document.getElementsByName("form-score2")[i].focus();
	        	 	} else if(score3.trim() == "") {
	 	        	alert("점수를 입력해주세요.");
	 	       		return document.getElementsByName("form-score3")[i].focus();
	        	 	} else if(score4.trim() == "") {
	 	        	alert("점수를 입력해주세요.");
	 	       		return document.getElementsByName("form-score4")[i].focus();
	        	 	} else if(score5.trim() == "") {
	 	        	alert("점수를 입력해주세요.");
	 	       		return document.getElementsByName("form-score5")[i].focus();
	        	 	} else if(score6.trim() == "") {
	 	        	alert("점수를 입력해주세요.");
	 	       		return document.getElementsByName("form-score6")[i].focus();
	        	 	} else if(score7.trim() == "") {
	 	        	alert("점수를 입력해주세요.");
	 	       		return document.getElementsByName("form-score7")[i].focus();
	        	 	} else if(score8.trim() == "") {
	 	        	alert("점수를 입력해주세요.");
	 	       		return document.getElementsByName("form-score8")[i].focus();
	        	 	} else if(score9.trim() == "") {
	 	        	alert("점수를 입력해주세요.");
	 	       		return document.getElementsByName("form-score9")[i].focus();
	        	 	} else if(score10.trim() == "") {
	 	        	alert("점수를 입력해주세요.");
	 	       		return document.getElementsByName("form-score10")[i].focus();
	        	 	} else if(score11.trim() == "") {
	 	        	alert("점수를 입력해주세요.");
	 	       		return document.getElementsByName("form-score11")[i].focus();
	        	 	} else if(score12.trim() == "") {
	 	        	alert("점수를 입력해주세요.");
	 	       		return document.getElementsByName("form-score12")[i].focus();
	        	 	} else if(score13.trim() == "") {
	 	        	alert("점수를 입력해주세요.");
	 	       		return document.getElementsByName("form-score13")[i].focus();
	        	 	} else if(score14.trim() == "") {
	 	        	alert("점수를 입력해주세요.");
	 	       		return document.getElementsByName("form-score14")[i].focus();
	        	 	} else if(score15.trim() == "") {
	 	        	alert("점수를 입력해주세요.");
	 	       		return document.getElementsByName("form-score15")[i].focus();
	        	 	} else if(score16.trim() == "") {
	 	        	alert("점수를 입력해주세요.");
	 	       		return document.getElementsByName("form-score16")[i].focus();
	        	 	} else if(score17.trim() == "") {
	 	        	alert("점수를 입력해주세요.");
	 	       		return document.getElementsByName("form-score17")[i].focus();
	        	 	} else if(score18.trim() == "") {
	 	        	alert("점수를 입력해주세요.");
	 	       		return document.getElementsByName("form-score18")[i].focus();
	        	 	}
	         }
	         
	         
			 let scoreList = [score1, score2, score3, score4, score5, score6, score7, score8, score9
				 , score10, opinion1, score11, score12, score13, score14, score15, score16,opinion2, score17, score18];
	         
			 if(age=="") { 
				 break;
			 } else { 
		         param["serviceDtoList["+i+"].agency"]=agency;
		         param["serviceDtoList["+i+"].openday"]=openday; 
		         param["serviceDtoList["+i+"].ptcProgram"]=ptcProgram;
		         param["serviceDtoList["+i+"].sex"]=sex;
		         param["serviceDtoList["+i+"].age"]=age;
		         param["serviceDtoList["+i+"].residence"]=residence;
		         param["serviceDtoList["+i+"].job"]=job;
		         param["serviceDtoList["+i+"].eval_date"]=eval_date;
		         for(let j = 0; j < scoreList.length; j++) {
		        	 if(scoreList[j]=="") {
				         param["serviceDtoList["+i+"].scoreList["+j+"]"] ="0"; 
		        	 }else {
				         param["serviceDtoList["+i+"].scoreList["+j+"]"] =scoreList[j]; 
		        	 }
		         }
			 }
			 
			 
	
	      }
	      console.table(param);
	      $.ajax({
	         url: "/insertForm/serviceInsertForm/insertData.do",
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
	      });
	   }
	         
	</script>
	<script type="text/javascript" src="/resources/js/common.js"></script>
	<!-- 페이지 내에서 이벤트가 발생하면 자바스크립트 함수를 실행하는 부분 ./---end -->
	
</body>
</html>