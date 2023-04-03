<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="poly.util.CmmUtil" %>
<%@ page import ="poly.dto.BasicInfoPageDTO" %>
<%
BasicInfoPageDTO bDTO = (BasicInfoPageDTO) request.getAttribute("bDTO");
String [] support = bDTO.getSupport().split(",");
String [] income_type = bDTO.getIncome_type().split(",");
String [] part_type = bDTO.getPart_type().split(",");
String [] biz_purpose = bDTO.getBiz_purpose().split(",");
String [] program_in_out = bDTO.getProgram_in_out().split(",");
String [] service_type = bDTO.getService_type().split(",");
String [] age_type = bDTO.getAge_type().split(",");
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
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->



	<!-- 홍두표 - 나눔스퀘어 폰트 불러오기 및 css 클래스 분리 -->
	<style>
		@import
			url(https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css);
		
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
		input {
			text-align: -webkit-center;
		}

		.item-title {
			width: 110px;
			text-align: center;
		}
		.healing-btn {
			width: 145px; 
			height: 40px; 
			font-size: large;
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
				<li class="active">관리자 모드</li>
				<li class="active">운영결과 입력 항목 수정</li>
			</ol>
		</div>
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">운영결과 입력 항목 수정</h1>
			</div>
		</div>
		<!--/.row-->
		<!--홍석민이 만들고 있음  -->
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading" style="display: inline-block; height: auto; width: 100%;">
						<div style="display: flex;">
							<div class="clearfix" style="display: flex; margin-right: auto;"><h4>운영결과 입력 항목 수정</h4></div>
							<input type="button" class="btn btn-default btn-sm healing-btn" style="margin-right: 5px;" value="전송" onclick="action()">
						</div>
					</div>
					<div class="panel-body">
						<div class="form-group justify-content-center">
							<label class="col-md-2 control-label">지원사항 
								<button onclick="support_add_div()" style="font-size:70%; display:block;   margin-right:5px; float: left;" class="delButton">+</button>
								<button onclick="support_delete_info()" style="font-size:70%; display:block;   margin-right:5px; float: left;" class="delButton">-</button>
							</label>
							<div class="col-md-10 support">
								<%
									for (int i = 0; i < support.length; i++) {
								%>
								<label class="checkbox-wrap checkbox-success"> <input 
									name="support" id="support<%=i%>"
									value="<%=support[i]%>"><span
									class="checkmark"></span>
								</label>
								<%
									}
								%>
							</div>
						</div>

						<hr style="border-right: groove;">
						<div class="form-group justify-content-center">
							<label class="col-md-2 control-label">사업목적
								<button onclick="biz_purpose_add_div()" style="font-size:70%; display:block; margin-right:5px; float: left;" class="delButton">+</button>
								<button onclick="biz_delete_info()" style="font-size:70%; display:block; margin-right:5px; float: left;" class="delButton">-</button>
							</label>
							<div class="col-md-10 biz_purpose">
								<%
									for (int i = 0; i < biz_purpose.length; i++) {
								%>
								<label class="checkbox-wrap checkbox-success"> <input
									name="biz_purpose" id="biz<%=i%>"
									value="<%=biz_purpose[i]%>"><span
									class="checkmark"></span>
								</label>
								<%
									}
								%>
							</div>
						</div>

						<hr style="border-right: groove;">
						<div class="form-group justify-content-center">
							<label class="col-md-2 control-label">참가자유형
								<button onclick="part_type_add_div()" style="font-size:70%; display:block;   margin-right:5px; float: left;" class="delButton">+</button>
								<button onclick="part_delete_info()" style="font-size:70%; display:block;   margin-right:5px; float: left;" class="delButton">-</button>
							</label>
							<div class="col-md-10 part_type">
								<%
									for (int i = 0; i < part_type.length; i++) {
								%>
								<label class="checkbox-wrap checkbox-success"> <input
								 name="part_type" id="part<%=i%>" value="<%=part_type[i]%>"><span
									class="checkmark"></span>
								</label>
								<%
									}
								%>
							</div>
						</div>

						<hr style="border-right: groove;">
						<div class="form-group justify-content-center">
							<label class="col-md-2 control-label">연령대
								<button onclick="age_type_add_div()" style="font-size:70%; display:block;   margin-right:5px; float: left;" class="delButton">+</button>
								<button onclick="age_delete_info()" style="font-size:70%; display:block;   margin-right:5px; float: left;" class="delButton">-</button>
							</label>
							<div class="col-md-10 age_type">
								<%
									for (int i = 0; i < age_type.length; i++) {
								%>
								<label class="checkbox-wrap checkbox-success"> <input 
								name="age_type" id="age<%=i%>" value=<%=age_type[i]%>><span class="checkmark"></span>
								</label>
								<%
									}
								%>
							</div>
						</div>

						<hr style="border-right: groove;">
						<div class="form-group justify-content-center">
							<label class="col-md-2 control-label">수입구분
								<button onclick="income_type_add_div()" style="font-size:70%; display:block;   margin-right:5px; float: left;" class="delButton">+</button>
								<button onclick="income_delete_info()" style="font-size:70%; display:block;   margin-right:5px; float: left;" class="delButton">-</button>
							</label>
							<div class="col-md-10 income_type">
								<%
									for (int i = 0; i < income_type.length; i++) {
								%>
								<label class="checkbox-wrap checkbox-success"> <input 
								name="income_type" id="income<%=i%>" value="<%=income_type[i]%>"><span class="checkmark"></span>
								</label>
								<%
									}
								%>
							</div>
						</div>

						<hr style="border-right: groove;">
						<div class="form-group justify-content-center">
							<label class="col-md-2 control-label">서비스유형
								<button onclick="service_type_add_div()" style="font-size:70%; display:block;   margin-right:5px; float: left;" class="delButton">+</button>
								<button onclick="service_delete_info()" style="font-size:70%; display:block;   margin-right:5px; float: left;" class="delButton">-</button>
							</label>
							<div class="col-md-10 service_type">
								<%
									for (int i = 0; i < service_type.length; i++) {
								%>
								<label class="checkbox-wrap checkbox-success"> <input
									 name="service_type" id="service<%=i%>" value="<%=service_type[i]%>"><span class="checkmark"></span>
								</label>
								<%
									}
								%>
							</div>
						</div>
						<hr style="border-right: groove;">
						<div class="form-group justify-content-center">
							<label class="col-md-2 control-label">프로그램
								<button onclick="program_in_out_add_div()" style="font-size:70%; display:block;   margin-right:5px; float: left;" class="delButton">+</button>
								<button onclick="program_delete_info()" style="font-size:70%; display:block;   margin-right:5px; float: left;" class="delButton">-</button>
							</label>
							<div class="col-md-10 program_in_out" >
								<%
									for (int i = 0; i < program_in_out.length; i++) {
								%>
								<label class="checkbox-wrap checkbox-success"> <input
									 name="program_in_out" id="program<%=i%>" value="<%=program_in_out[i]%>"><span class="checkmark"></span>
								</label>
								<%
									}
								%>
							</div>
						</div>
						<hr style="border-right: groove;">
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
	<script>
	function service_type_add_div() {
		let index = document.getElementsByName('service_type').length;
		let a = `<label class="checkbox-wrap checkbox-success"> <input name="service_type" value="새 항목" id="service`+index+`"><span class="checkmark"></span></label>`;
		$('.service_type').append(a);
	}
	function support_add_div() {
		let index = document.getElementsByName('support').length;
		let a = `<label class="checkbox-wrap checkbox-success"> <input name="support" value="새 항목" id="support`+index+`"><span class="checkmark"></span></label>`;
		$('.support').append(a);
	}
	function income_type_add_div() {
		let index = document.getElementsByName('income_type').length;
		let a = `<label class="checkbox-wrap checkbox-success"> <input name="income_type" value="새 항목" id="income`+index+`"><span class="checkmark"></span></label>`;
		$('.income_type').append(a);
	}
	function part_type_add_div() {
		let index = document.getElementsByName('part_type').length;
		let a = `<label class="checkbox-wrap checkbox-success"> <input name="part_type" value="새 항목" id="part`+index+`"><span class="checkmark"></span></label>`;
		$('.part_type').append(a);
	}
	function biz_purpose_add_div() {
		let index = document.getElementsByName('biz_purpose').length;
		let a = `<label class="checkbox-wrap checkbox-success"> <input name="biz_purpose" value="새 항목" id="biz`+index+`"><span class="checkmark"></span></label>`;
		$('.biz_purpose').append(a);
	}
	function program_in_out_add_div() {
		let index = document.getElementsByName('program_in_out').length;
		console.log("add index : " + index);
		let a = `<label class="checkbox-wrap checkbox-success"> <input name="program_in_out" value="새 항목" id="program`+index+`"><span class="checkmark"></span></label>`;
		$('.program_in_out').append(a);
	}
	function age_type_add_div() {
		let index = document.getElementsByName('age_type').length;
		console.log("add index : " + index);
		let a = `<label class="checkbox-wrap checkbox-success"> <input name="age_type" value="새 항목" id="age`+index+`"><span class="checkmark"></span></label>`;
		$('.age_type').append(a);
	}
	function support_delete_info() {
		let index = document.getElementsByName('service_type').length;
		let length = document.getElementsByName('support').length-1;
		document.querySelector('#support'+length).remove();
	}
	function service_delete_info() {
		let length = document.getElementsByName('service_type').length-1;
		document.querySelector('#service'+length).remove();
	}
	function income_delete_info() {
		let length = document.getElementsByName('income_type').length-1;
		document.querySelector('#income'+length).remove();
	}
	function part_delete_info() {
		let length = document.getElementsByName('part_type').length-1;
		document.querySelector('#part'+length).remove();
	}
	function biz_delete_info() {
		let length = document.getElementsByName('biz_purpose').length-1;
		document.querySelector('#biz'+length).remove();
	}
	function program_delete_info() {
		let length = document.getElementsByName('program_in_out').length-1;
		console.log("delete index : " + length);
		document.querySelector('#program'+length).remove();
	}
	function age_delete_info() {
		let length = document.getElementsByName('age_type').length-1;
		console.log("delete index : " + length);
		document.querySelector('#age'+length).remove();
	}
	
	function action() {
		let param = {};
		
	    let service_type='';
	    let support='';
	    let income_type='';
	    let part_type='';
	    let biz_purpose='';
	    let program_in_out='';
	    let age_type='';
	    
	    for(let i=0; i<document.getElementsByName('service_type').length; i++) {
	   	  if(document.getElementsByName('service_type')[i].value!=''){
		  	  service_type+=document.getElementsByName('service_type')[i].value;
		  	  if(i+1==document.getElementsByName('service_type').length) {
		  		  break;
		  	  }
		  	  service_type+=",";
	   	  }
	    }
	    for(let i=0; i<document.getElementsByName('support').length; i++) {
	   	  if(document.getElementsByName('support')[i].value!=''){
		  	  support+=document.getElementsByName('support')[i].value;
		  	  if(i+1==document.getElementsByName('support').length) {
		  		  break;
		  	  }
		  	  support+=",";
	   	  }
	    }
	    for(let i=0; i<document.getElementsByName('income_type').length; i++) {
	   	  if(document.getElementsByName('income_type')[i].value!=''){
		  	  income_type+=document.getElementsByName('income_type')[i].value;
		  	  if(i+1==document.getElementsByName('income_type').length) {
		  		  break;
		  	  }
		  	  income_type+=",";
	   	  }
	    }
	    for(let i=0; i<document.getElementsByName('part_type').length; i++) {
	   	  if(document.getElementsByName('part_type')[i].value!=''){
	   		  part_type+=document.getElementsByName('part_type')[i].value;
		  	  if(i+1==document.getElementsByName('part_type').length) {
		  		  break;
		  	  }
		  	  part_type+=",";
	   	  }
	    }
	    for(let i=0; i<document.getElementsByName('biz_purpose').length; i++) {
	   	  if(document.getElementsByName('biz_purpose')[i].value!=''){
		  	  biz_purpose+=document.getElementsByName('biz_purpose')[i].value;
		  	  if(i+1==document.getElementsByName('biz_purpose').length) {
		  		  break;
		  	  }
		  	  biz_purpose+=",";
	   	  }
	    }
	    for(let i=0; i<document.getElementsByName('program_in_out').length; i++) {
	   	  if(document.getElementsByName('program_in_out')[i].value!=''){
		  	  program_in_out+=document.getElementsByName('program_in_out')[i].value;
		  	  if(i+1==document.getElementsByName('program_in_out').length) {
		  		  break;
		  	  }
		  	  program_in_out+=",";
	   	  }
	    }
	    for(let i=0; i<document.getElementsByName('age_type').length; i++) {
	   	  if(document.getElementsByName('age_type')[i].value!=''){
		  	  age_type+=document.getElementsByName('age_type')[i].value;
		  	  if(i+1==document.getElementsByName('age_type').length) {
		  		  break;
		  	  }
		  	  age_type+=",";
	   	  }
	    }
	    console.log(service_type);
	    console.log(support);
	    console.log(income_type);
	    console.log(part_type);
	    console.log(biz_purpose);
	    console.log(program_in_out);
	    console.log(age_type);
	    $.ajax({
	         url: "/mng/updatePage.do",
	         type: "POST",
	         data: {"support":support,"income_type":income_type,"part_type":part_type,"biz_purpose":biz_purpose,"program_in_out":program_in_out,"service_type":service_type,"age_type":age_type}, 
	         success:function(result) {
	        	 console.log('hello');
	        	 swal({
						title : "전송 성공 ",
						text : "확인 버튼을 눌러주세요.",
						icon : "success"
					}).then(function() {
						location.href='/insertOperateResult.do';
					}); 
			},
	         error:function(e) {
	            console.log(e);
	         }
	      });
	 }
	</script>
</body>
</html>