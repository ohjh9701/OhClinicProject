<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OH-Clinic - 의사 인력 관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
body {
	background-color: #f4f7f9;
}

.content-wrapper {
	padding: 40px;
}

.doctor-card {
	border: none;
	border-radius: 20px;
	transition: transform 0.2s, box-shadow 0.2s;
	cursor: pointer;
}

.doctor-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}

.specialty-badge {
	background-color: #e3f2fd;
	color: #0d6efd;
	font-weight: 600;
	padding: 5px 12px;
	border-radius: 50px;
}

.doctor-avatar {
	width: 80px;
	height: 80px;
	background: #eee;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 2rem;
	color: #adb5bd;
}
</style>
</head>
<body>

	<div class="content-wrapper">
		<div class="d-flex justify-content-between align-items-center mb-5">
			<div>
				<h2 class="fw-bold text-dark">
					<i class="bi bi-person-badge me-2 text-primary"></i>OH-Clinic 의사 인력
					관리
				</h2>
				<p class="text-muted mb-0">현재 OH-Clinic에 등록된 전문의 명단입니다.</p>
			</div>
			<div>
				<button class="btn btn-outline-secondary me-2"
					onclick="location.href='/ohclinic/adminMain'">
					<i class="bi bi-house-door"></i> 메인화면
				</button>
				<button class="btn btn-primary px-4 shadow-sm"
					onclick="location.href='/ohclinic/doctor/registerForm'">
					<i class="bi bi-plus-lg"></i> 신규 의사 등록
				</button>
			</div>
		</div>

		<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
			<c:forEach var="doc" items="${doctorList}">
				<div class="col">
					<div class="card h-100 doctor-card shadow-sm p-3">
						<div class="card-body">
							<div class="d-flex align-items-center mb-4">
								<div class="doctor-avatar me-3">
									<i class="bi bi-person-fill"></i>
								</div>
								<div>
									<h5 class="card-title fw-bold mb-1">${doc.name}원장님</h5>
									<span class="specialty-badge">${doc.specialty}</span>
								</div>
							</div>

							<div class="mb-3">
								<p class="small text-muted mb-1">
									<i class="bi bi-geo-alt me-2"></i>진료실: ${doc.location}
								</p>
								<p class="small text-muted mb-1">
									<i class="bi bi-person-vcard me-2"></i>원장님 ID: ${doc.id}
								</p>
							</div>

							<hr class="text-secondary opacity-25">

							<div
								class="d-flex justify-content-between align-items-center mt-3">
								<div class="d-flex flex-column">
									<span class="text-muted small fw-bold mb-1"> <i
										class="bi bi-clock-history me-1"></i> 진료 시간
									</span> <span
										class="badge bg-primary-subtle text-primary border border-primary-subtle px-2 py-1"
										style="font-size: 0.75rem;"> <c:choose>
											<c:when test="${not empty doc.workTime}">
                    ${doc.workTime}
                </c:when>
											<c:otherwise>
                    월~금 09:00 ~ 17:00/ 토 07:00 ~ 15:00 </c:otherwise>
										</c:choose>
									</span>
								</div>

								<div>
									<button class="btn btn-sm btn-light border text-primary"
										onclick="updateDoctor(${doc.no}, event)">정보 수정</button>
									<button class="btn btn-sm btn-light border text-danger"
										onclick="deleteDoctor(${doc.no}, event)">삭제</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<c:if test="${empty doctorList}">
			<div class="text-center py-5">
				<i class="bi bi-person-x fs-1 text-muted"></i>
				<p class="mt-3 text-muted">등록된 의사 정보가 없습니다.</p>
			</div>
		</c:if>
	</div>

	<script>
    function updateDoctor(no) {
        location.href = "/ohclinic/doctor/update?no=" + no;
    }

    function deleteDoctor(no) {
        if(confirm("해당 의사 정보를 삭제하시겠습니까? 관련 환자 데이터가 있을 수 있습니다.")) {
            location.href = "/ohclinic/doctor/delete?no=" + no;
        }
    }
</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>