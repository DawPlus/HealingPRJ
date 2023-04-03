<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 고르기 버튼 시작-->
	<div class="col-md-12">
		<div class="col-md-3">
			<div class="form-group">
				<label>입력양식</label> 
				<select class="form-control select" id="updateForm" onchange="updateForm(this)">
					<option value="">입력 양식을 선택해주세요.</option>
					<option value="basic_info">프로그램 운영 결과</option>
					<option value="service_env_satisfaction">서비스환경 만족도</option>
					<option value="program_satisfaction">프로그램 만족도</option>
					<option value="counsel_service">상담&치유서비스 효과평가</option>
					<option value="prevent_service">예방서비스 효과평가</option>
					<option value="healing_service">힐링서비스 효과평가</option>
					<option value="hrv_service">HRV 측정 검사</option>
					<option value="vibra_service">바이브라 측정 검사</option>
				</select>
			</div>
		</div>
	</div>
	<!-- 고르기 버튼 끝 -->
</body>
<script>
	/*select handler*/
	$(function() {
		var url = window.location.pathname;
		console.log(url);
		var activePage = url.substring(url.lastIndexOf('/') + 1);

		$('.select option').each(
				function() {
					var currentPage = this.value.substring(this.value.lastIndexOf('/') + 1);

					if (activePage == currentPage) {
						$(".select").prop("selected", false);
						$(this).prop("selected", true);
						
						$(".nav").find(".active").removeClass("active");
						$(".insert").addClass('active');
					}
				});
	})
</script>
</html>
