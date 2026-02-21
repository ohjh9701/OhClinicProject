<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OH-Clinic - 예약 현황 관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
    body { background-color: #f8f9fa; }
    .content-wrapper { padding: 30px; }
    .reserv-card { border: none; border-radius: 15px; box-shadow: 0 5px 15px rgba(0,0,0,0.08); }
    .status-upcoming { border-left: 5px solid #0d6efd; } /* 다가오는 예약 강조 */
    .date-badge { font-size: 0.9rem; background-color: #e9ecef; color: #495057; }
</style>
</head>
<body>

<div class="content-wrapper">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="fw-bold"><i class="bi bi-calendar-check me-2 text-primary"></i>예약 접수 및 현황</h3>
        <div>
            <button class="btn btn-outline-secondary me-2" onclick="location.href='/ohclinic/adminMain'">
                <i class="bi bi-house"></i>
            </button>
            <button class="btn btn-primary" onclick="location.href='/ohclinic/reserv/registerForm'">
                <i class="bi bi-plus-circle me-1"></i> 신규 예약 접수
            </button>
        </div>
    </div>

    <div class="card reserv-card">
        <div class="card-body p-0">
            <table class="table table-hover align-middle mb-0">
                <thead class="table-light">
                    <tr>
                        <th class="ps-4">예약번호</th>
                        <th>예약일시</th>
                        <th>환자명</th>
                        <th>성별/나이</th>
                        <th>연락처</th>
                        <th>담당의</th>
                        <th class="text-center">관리</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="r" items="${reservList}">
                        <tr class="status-upcoming">
                            <td class="ps-4 text-muted">#${r.no}</td>
                            <td>
                                <span class="badge date-badge px-3 py-2">
                                    <i class="bi bi-clock me-1"></i>
                                    <fmt:formatDate value="${r.nextReserv}" pattern="yyyy-MM-dd (E)"/>
                                </span>
                            </td>
                            <td><span class="fw-bold">${r.patientName}</span></td>
                            <td>${r.patientGender} / ${r.patientAge}세</td>
                            <td>${r.patientPhone}</td>
                            <td>
                                <span class="text-primary fw-bold"><i class="bi bi-person-badge me-1"></i>${r.doctorName} 원장</span>
                            </td>
                            <td class="text-center">
                                <button class="btn btn-sm btn-outline-warning me-1" onclick="updateReserv(${r.no})">변경</button>
                                <button class="btn btn-sm btn-outline-danger" onclick="cancelReserv(${r.no})">취소</button>
                            </td>
                        </tr>
                    </c:forEach>
                    
                    <c:if test="${empty reservList}">
                        <tr>
                            <td colspan="7" class="text-center py-5 text-muted">
                                <i class="bi bi-calendar-x fs-1 d-block mb-3"></i>
                                예정된 예약 내역이 없습니다.
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    function updateReserv(no) {
        if(confirm("예약 일정을 변경하시겠습니까?")) {
            location.href = "/ohclinic/reserv/update?no=" + no;
        }
    }

    function cancelReserv(no) {
        if(confirm("정말로 예약을 취소하시겠습니까?")) {
            location.href = "/ohclinic/reserv/delete?no=" + no;
        }
    }
</script>
</body>
</html>