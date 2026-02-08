<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OH-Clinic - 신규 환자 등록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
body {
	background-color: #f8f9fa;
}

.form-container {
	max-width: 800px;
	margin: 50px auto;
}

.card {
	border: none;
	border-radius: 15px;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

.form-label {
	font-weight: 600;
	color: #495057;
}
</style>
</head>
<body>

	<div class="form-container">
		<div class="mb-4 d-flex align-items-center">
			<button class="btn btn-outline-secondary me-3"
				onclick="history.back()">
				<i class="bi bi-arrow-left"></i>
			</button>
			<h3 class="fw-bold mb-0">신규 환자 등록</h3>
		</div>

		<div class="card p-5">
			<form action="/ohclinic/patient/create" method="post">
				<div class="row g-3">
					<div class="col-md-6">
						<label class="form-label">환자 성명</label> <input type="text"
							name="name" class="form-control" placeholder="홍길동" required>
					</div>
					<div class="col-md-6">
						<label class="form-label">생년월일</label> <input type="text"
							name="birthYear" class="form-control" placeholder="199901011"
							required maxlength="9"> <small class="text-info">※
							생년월일 8자리 + 성별구분 1자리 (총 9자리)를 입력하세요.</small>
					</div>

					<div class="col-md-12">
						<label class="form-label">휴대폰 번호</label> <input type="text"
							name="phone" class="form-control" placeholder="01012345678"
							required>
					</div>

					<div class="col-12">
						<label class="form-label">거주지 주소</label> <input type="text"
							id="address" name="location" class="form-control"
							placeholder="서울시 서초구" required>
					</div>

					<div class="col-md-6">
						<label class="form-label">담당 의사 지정</label> <select name="doctor.no"
							class="form-select" required>
							<option value="" selected disabled>의사를 선택하세요</option>
							<c:forEach var="doctor" items="${doctorList}">
								<option value="${doctor.no}">${doctor.name}원장님
									[${doctor.specialty}] - ${doctor.location}</option>
							</c:forEach>
						</select> <small class="text-muted">※ 현재 근무 중인 원장님만 표시됩니다.</small>
					</div>

					<hr class="my-4">

					<div class="col-12 text-end">
						<button type="reset" class="btn btn-light me-2">초기화</button>
						<button type="submit" class="btn btn-primary px-4">환자 등록
							완료</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function searchAddr() {
			new daum.Postcode({
				oncomplete : function(data) {
					document.getElementById('postcode').value = data.zonecode;
					document.getElementById('address').value = data.address;
				}
			}).open();
		}
	</script>
</body>
</html>