<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
    
    int aa = 150;
    
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



<!-- 홍두표 - 나눔스퀘어 폰트 불러오기 -->
<script src="/js/core.js"></script>
<script src="/js/charts.js"></script>
<script src="/js/animated.js"></script>
<style>


#chartdiv {
  width: 100%;
  height: 500px;
}
</style>


<style>
@import
	url(https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css)
	;

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
	
	<%@ include file="/WEB-INF/view/top.jsp" %>
	<%@ include file="/WEB-INF/view/sidebar.jsp" %>


	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"> <em class="fa fa-home"></em>
				</a></li>
				<li class="active">프로그램 결과 입력</li>
			</ol>
		</div>
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">프로그램 결과 입력</h1>
			</div>
		</div>
		<!--/.row-->


		<!--홍석민이 만들고 있음  -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default chat" style="word-break: break-all;">
						
	
	<h1>index</h1>
	<br>
	<form>
		<div style="display: inline-flex;">
		 &nbsp;&nbsp;
			<span class="input-group input-group-lg" style="width: 300px;">
				<select name="effect" class="form-control" style="border-radius: 5px; ">
					<option value="program">프로그램 만족도</option>
					<option value="facility">시설서비스 환경 만족도</option>
					<option value="counseling">상담&치유 서비스</option>
					<option value="prevention">예방 서비스</option>
					<option value="healing">힐링 서비스</option>
					<option value="health">건강</option>
				</select> 
			</span>
		</div>
		<hr style="margin-top: 10px; margin-bottom: 10px;">
		&nbsp;&nbsp;검색어를 선택하세요 <br>
		<div style="display:inline-flex">
			
	
			<%for(int i=1; i<=3; i++) {%>
			&nbsp;&nbsp;
			<span class="input-group input-group-lg" style="width: 50%;">
				<select name="property0<%=i %>" class="form-control" style="border-radius: 5px;">
					<option value="Id">ID</option>
					<option value="AgencyName">기관명</option>
					<option value="Programs">참여프로그램</option>
					<option value="Gender">성별</option>
					<option value="Age">연령(만)</option>
					<option value="Redsidence">거주지</option>
					<option value="Job">직업</option>
					<option value="ProgramName">프로그램명</option>
					<option value="InstructorName">강사명</option>
					<option value="Place">장소</option>
				</select> 
			</span>
			
			
			<span class="input-group input-group-lg" style="width: 50%;">
				<input type="text" name="search0<%=i %>" placeholder="Search" class="form-control" style="border-radius: 5px;">
					
			</span>
			
			<%}%>
			
			<span class="input-group input-group-lg" style="width: 30%;">
					<span class="input-group-btn">
						<button type="button" class="btn btn-default" tabindex="-1">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</span>
			
			
		</div>
	</form>

	<div id="chartdiv"></div>
	&nbsp;&nbsp;
	      <div class="row" style="display: inline-flex; margin-top:2%">
         <div class="col-lg-12">
            <div id="wrapper">
               <h1>&nbsp;&nbsp;&nbsp;프로그램 만족도</h1>
               <div style="width: 100%; height: 100%; overflow: auto">
               <table id="keywords" cellspacing="0" cellpadding="0">
                 <tbody style="font-size: 0.8em;">
                  <tr style="background-color: rgb(208, 219, 233);">
                    <td rowspan="2">주제어 1<br>참여프로그램</td>
                    <td rowspan="2">주제어 2<br>참여프로그램</td>
                    <td rowspan="2">주제어 3<br>참여프로그램</td>
                    <td colspan="4">강사</td>
                    <td colspan="4">내용구성</td>
                    <td colspan="4">효과성</td>
                    <td rowspan="2">전체평균</td>
                  </tr>
                  
                  <tr style="background-color: rgb(208, 219, 233);"> 
                     <td rowspan="1">전문성</td>
                     <td rowspan="1">성실성</td>
                     <td rowspan="1">반응성</td>
                     <td rowspan="1">평균</td>
                     
                     <td rowspan="1">체계성</td>
                     <td rowspan="1">적합성</td>
                     <td rowspan="1">흥미성</td>
                     <td rowspan="1">평균</td>
                     
                     <td rowspan="1">학습성</td>
                     <td rowspan="1">재참여</td>
                     <td rowspan="1">추천</td>
                     <td rowspan="1">평균</td>
                  </tr>
                  
                  <%for(int i=0; i<50; i++) {%>
                  <tr class="ProgramSatisfaction">
                     <td>1</td>
                     <td>2</td>
                     <td>3</td>
                     <td>4</td>
                     <td>5</td>
                     <td>6</td>
                     <td>7</td>
                     <td>8</td>
                     <td>9</td>
                     <td>10</td>
                     <td>11</td>
                     <td>12</td>
                     <td>13</td>
                     <td>14</td>
                     <td>15</td>
                     <td>16</td>
                  </tr>
				<%} %>
                 </tbody>
               </table>
               </div>
              <!--/.table-->
                <br><br><br><br><br><br><br><br>
               </div> 
         </div>
      </div><!--/.row-->

					

				</div>
			</div>
		</div>

		<!--  -->


	</div>
	<!--/.main-->
	
	
	
	
	<script src="/lumino/js/jquery-1.11.1.min.js"></script>
	<script src="/lumino/js/bootstrap.min.js"></script>
	<script src="/lumino/js/chart.min.js"></script>
	<script src="/lumino/js/chart-data.js"></script>
	<script src="/lumino/js/easypiechart.js"></script>
	<script src="/lumino/js/easypiechart-data.js"></script>
	<script src="/lumino/js/bootstrap-datepicker.js"></script>
	<script src="/lumino/js/custom.js"></script>
	<script>
	
	$(".nav a").on("click", function() {
		  $(".nav").find(".active").removeClass("active");
		  $(this).parent().addClass("active");
		});
	
	





	</script>
	
	
	
	
	
	
<!-- amcharts -->
	<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end



var chart = am4core.create('chartdiv', am4charts.XYChart)
chart.colors.step = 2;

chart.legend = new am4charts.Legend()
chart.legend.position = 'top'
chart.legend.paddingBottom = 10
chart.legend.labels.template.maxWidth = 50

var xAxis = chart.xAxes.push(new am4charts.CategoryAxis())
xAxis.dataFields.category = 'category'
xAxis.renderer.cellStartLocation = 0.1
xAxis.renderer.cellEndLocation = 0.9
xAxis.renderer.grid.template.location = 0;

var yAxis = chart.yAxes.push(new am4charts.ValueAxis());
yAxis.min = 0;

function createSeries(value, name) {
    var series = chart.series.push(new am4charts.ColumnSeries())
    series.dataFields.valueY = value
    series.dataFields.categoryX = 'category'
    series.name = name

    series.events.on("hidden", arrangeColumns);
    series.events.on("shown", arrangeColumns);

    var bullet = series.bullets.push(new am4charts.LabelBullet())
    bullet.interactionsEnabled = false
    bullet.dy = 30;
    bullet.label.text = '{valueY}'
    bullet.label.fill = am4core.color('#ffffff')

    return series;
}

chart.data = [
    {
        category: '시설만족도',
        first: 40,
        second: 55,
    },
    {
        category: '예방효과',
        first: 30,
        second: 78,
    
    },
    {
        category: '프로그램만족도',
        first: 27,
        second: <%=aa %>,
      
    },
    {
        category: '상처치유',
        first: 50,
        second: 33,
      
    },
    {
        category: '숙소',
        first: 50,
        second: 33,
      
    },{
        category: 'Place #4',
        first: 50,
        second: 33,
        third: 21
      
    }
]


createSeries('first', 'The First');
createSeries('second', 'The Second');



function arrangeColumns() {

    var series = chart.series.getIndex(0);

    var w = 1 - xAxis.renderer.cellStartLocation - (1 - xAxis.renderer.cellEndLocation);
    if (series.dataItems.length > 1) {
        var x0 = xAxis.getX(series.dataItems.getIndex(0), "categoryX");
        var x1 = xAxis.getX(series.dataItems.getIndex(1), "categoryX");
        var delta = ((x1 - x0) / chart.series.length) * w;
        if (am4core.isNumber(delta)) {
            var middle = chart.series.length / 2;

            var newIndex = 0;
            chart.series.each(function(series) {
                if (!series.isHidden && !series.isHiding) {
                    series.dummyData = newIndex;
                    newIndex++;
                }
                else {
                    series.dummyData = chart.series.indexOf(series);
                }
            })
            var visibleCount = newIndex;
            var newMiddle = visibleCount / 2;

            chart.series.each(function(series) {
                var trueIndex = chart.series.indexOf(series);
                var newIndex = series.dummyData;

                var dx = (newIndex - trueIndex + middle - newMiddle) * delta

                series.animate({ property: "dx", to: dx }, series.interpolationDuration, series.interpolationEasing);
                series.bulletsContainer.animate({ property: "dx", to: dx }, series.interpolationDuration, series.interpolationEasing);
            })
        }
    }
}

}); // end am4core.ready()
</script>

</body>
</html>