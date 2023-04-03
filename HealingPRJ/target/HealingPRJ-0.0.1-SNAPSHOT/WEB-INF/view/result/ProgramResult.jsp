<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


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
	<!-- 차트 ajax -->
	<script>
	 function search(){
		var openday = $("#openday").val();
		var agency = $("#agency").val().trim();
		console.log(openday)
		console.log(agency);
		var search = {"openday":openday,"agency":agency};
		  $.ajax({
			url : 'ProgramResult_chart.do',
			type : 'post',
			data : search,
			success : function(data) {
				console.log("성공");
				console.log(data);
				$("#ProgramResult_chart").html(data);
			},
			error:function (e){
				alert("조회를 할 수 없습니다.");
			}
		})
	} 
	 function info_print() {
			var initBody = document.body.innerHTML;
			window.onbeforeprint = function () {
				document.body.innerHTML = document.getElementById("ProgramResult_chart").innerHTML;
			}
			window.onafterprint = function () {
				document.body.innerHTML = initBody;
			}

			window.print();

		}
	
	/* function search(url, parms) {
		const myHeaders = new Headers();
		myHeaders.append("Content-Type", "application/x-www-form-urlencoded");
		
		const urlencoded = new URLSearchParams();
		const openday = document.querySelector('#openday').value;
		const biz_reg_num = document.querySelector('#biz_reg_num').value;
		
		urlencoded.append("openday", openday);
		urlencoded.append("biz_reg_num", biz_reg_num);
	
		const requestOptions = {
		  method: 'POST',
		  headers: myHeaders,
		  body: urlencoded,
		  redirect: 'follow'
		};
	
		fetch("ProgramResult_chart.do", requestOptions)
		  .then(response => response.text())
		  .then(result => {
			  console.log("성공");
			  console.log(result);
		  })
		  .catch(error => console.log('error', error));
	} */
</script>
<script src="/lumino/js/jquery-1.11.1.min.js"></script>
	<script src="/lumino/js/bootstrap.min.js"></script>
	<script src="/lumino/js/chart.min.js"></script>
	<script src="/lumino/js/chart-data.js"></script>
	<script src="/lumino/js/easypiechart.js"></script>
	<script src="/lumino/js/easypiechart-data.js"></script>
	<script src="/lumino/js/bootstrap-datepicker.js"></script>
	<script src="/lumino/js/custom.js"></script>
</head>
<body>
 <!--top jsp  -->
	<div>
	 <%@ include file="/WEB-INF/view/top.jsp" %>
	 <%@ include file="/WEB-INF/view/sidebar.jsp" %>
	</div>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">운영 통계 검색</li>
				<li class="active">프로그램 운영결과</li>
			</ol>
		</div>
		
		<div class="row">
				<div class="col-md-9">
					<label class="col-md-10 control-label">참여단체</label>
				</div>
				<div class="col-md-9">
					<input type="text" id="agency" name="agency" placeholder="기업명" class="form-control" style="width: 300px;">
				</div>
				<div class="col-md-9">
					<label class="col-md-10 control-label">참여일자</label>
				</div>
				<div class="col-md-9">
					<input type='date' name="openday" id="openday"style="font-size: 16pt" /> 
				</div>
				<div class="col-md-9">
					<button type="button" onClick="JavaScript:search();"class="btn-success" tabindex="-1" value="검색"> <i class="fa fa-search"></i>
					</button>
					<input type="button" value="인쇄" onClick="info_print()" />
				</div>
		</div>
		
		<div id="ProgramResult_chart"></div>
	</div>

</body>
</html>