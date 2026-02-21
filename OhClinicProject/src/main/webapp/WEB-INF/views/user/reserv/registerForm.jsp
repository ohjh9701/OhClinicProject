<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OH-Clinic - 신규 예약 접수</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body class="bg-light">

	<div class="container py-5">
		<div class="card shadow-sm border-0 rounded-4 p-4 mx-auto"
			style="max-width: 600px;">
			<h4 class="fw-bold mb-4">
				<i class="bi bi-calendar-plus me-2 text-primary"></i>신규 예약 접수
			</h4>

			<form action="/ohclinic/reserv/register" method="post">
				<div class="mb-3">
					<label class="form-label fw-bold">환자 선택</label> <select name="pNo"
						id="patientSelect" class="form-select" required
						onchange="autoSelectDoctor()">
						<option value="" selected disabled>예약하실 환자를 선택하세요</option>
						<c:forEach var="p" items="${patientList}">
							<option value="${p.no}" data-dno="${p.doctor.no}"
								data-dname="${p.doctor.name}">${p.name} (${p.phone})</option>
						</c:forEach>
					</select>

					<div class="mb-3">
						<label class="form-label fw-bold">담당 의사</label> <select name="dNo"
							id="doctorSelect" class="form-select" required>
							<option value="" selected disabled>환자를 먼저 선택하세요</option>
							<c:forEach var="d" items="${doctorList}">
								<option value="${d.no}">${d.name}원장 [${d.specialty}]</option>
							</c:forEach>
						</select>
					</div>

					<div class="mb-4">
						<label class="form-label fw-bold">예약 희망일</label> <input
							type="date" name="nextReserv" class="form-control" required>
					</div>

					<div class="d-grid gap-2">
						<button type="submit" class="btn btn-primary py-3 fw-bold">예약
							완료</button>
						<button type="button" class="btn btn-link text-muted"
							onclick="history.back()">취소</button>
					</div>
			</form>
		</div>
	</div>
<script>
function autoSelectDoctor() {
    const pSelect = document.getElementById('patientSelect');
    const dSelect = document.getElementById('doctorSelect');
    
    // 선택된 환자의 option 가져오기
    const selectedOption = pSelect.options[pSelect.selectedIndex];
    
    // data-dno 속성 읽기
    const doctorNo = selectedOption.getAttribute('data-dno');
    
    console.log("선택된 환자의 담당의 번호:", doctorNo); // 확인용

    if (doctorNo) {
        // 의사 select 박스의 value를 doctorNo로 강제 세팅
        dSelect.value = doctorNo;
        
        // 만약 세팅이 안 됐다면 목록에 해당 의사가 없는 것임
        if (dSelect.value !== doctorNo) {
            console.error("의사 목록에 번호 " + doctorNo + "인 의사가 없습니다!");
        }
    }
}
</script>
</body>
</html>