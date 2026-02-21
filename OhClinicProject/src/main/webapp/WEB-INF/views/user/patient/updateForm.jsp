<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ohclinic - 환자 정보 수정</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
body {
	background-color: #f4f7f6;
}

.update-container {
	max-width: 800px;
	margin: 50px auto;
}

.card {
	border: none;
	border-radius: 15px;
	box-shadow: 0 5px 25px rgba(0, 0, 0, 0.08);
}

.form-label {
	font-weight: 600;
	color: #34495e;
}

.readonly-field {
	background-color: #e9ecef !important;
	cursor: not-allowed;
}
</style>
</head>
<body>

	<div class="update-container">
		<div class="mb-4 d-flex align-items-center justify-content-between">
			<div>
				<button class="btn btn-outline-secondary btn-sm me-2"
					onclick="location.href='/ohclinic/patient/list'">
					<i class="bi bi-arrow-left"></i> 목록으로
				</button>
				<h3 class="fw-bold d-inline-block mb-0">환자 정보 수정</h3>
			</div>
			<span class="text-muted">환자 번호: <strong>${patient.no}</strong></span>
		</div>

		<div class="card p-5">
			<form action="/ohclinic/patient/update" method="post">
				<input type="hidden" name="no" value="${patient.no}">

				<div class="row g-4">
					<div class="col-md-6">
						<label class="form-label">환자 성명</label> <input type="text"
							name="name" class="form-control" value="${patient.name}" required>
					</div>
					<div class="col-md-6">
						<label class="form-label">생년월일 및 식별번호</label> <input type="text"
							name="birthYear" class="form-control bg-light"
							value="${patient.birthYear}" readonly> <small
							class="text-muted">※ 생년월일은 고유 식별 정보로 수정이 불가능합니다.</small>
					</div>
					<div class="col-md-3">
						<label class="form-label">현재 나이</label> <input type="text"
							class="form-control readonly-field" value="${patient.age}세"
							readonly>
					</div>
					<div class="col-md-3">
						<label class="form-label">성별</label> <input type="text"
							class="form-control readonly-field" value="${patient.gender}"
							readonly>
					</div>
					<div class="col-md-6">
						<label class="form-label">휴대폰 번호</label> <input type="text"
							name="phone" class="form-control" value="${patient.phone}"
							required>
					</div>

					<div class="col-12">
						<label class="form-label">거주지 주소</label>
						<div class="input-group mb-2">
							<input type="text" id="address" name="location"
								class="form-control" value="${patient.location}" required>
						</div>
					</div>

					<div class="col-md-12">
						<label class="form-label">담당 의사 변경</label> <select
							name="doctor.no" class="form-select" required>
							<c:forEach var="doc" items="${doctorList}">
								<option value="${doc.no}"
									${patient.doctor.no == doc.no ? 'selected' : ''}>
									${doc.name} 원장 [${doc.specialty}]</option>
							</c:forEach>
						</select>
					</div>

					<hr class="my-4">

					<div class="col-12 d-flex justify-content-between">
						<button type="button" class="btn btn-danger text-white"
							onclick="confirmDelete()">환자 삭제</button>
						<div>
							<button type="button" class="btn btn-light me-2"
								onclick="history.back()">취소</button>
							<button type="submit" class="btn btn-success px-4 fw-bold">수정
								내용 저장</button>
						</div>
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
					document.getElementById('address').value = data.address;
				}
			}).open();
		}

		function confirmDelete() {
			if (confirm("정말로 이 환자 정보를 삭제하시겠습니까?")) {
				location.href = "/ohclinic/patient/delete?no=${patient.no}";
			}
		}
	</script>
</body>
</html>