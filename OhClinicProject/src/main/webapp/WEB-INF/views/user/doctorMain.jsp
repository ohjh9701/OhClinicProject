<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OH-CLINIC - 의사 대시보드</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
    body { background-color: #f0f2f5; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
    .sidebar { width: 260px; height: 100vh; position: fixed; background: #1a237e; color: white; }
    .sidebar .nav-link { color: #c5cae9; padding: 15px 25px; transition: 0.2s; }
    .sidebar .nav-link:hover { background: #283593; color: white; }
    .main-content { margin-left: 260px; padding: 40px; }
    .card { border: none; border-radius: 12px; box-shadow: 0 5px 15px rgba(0,0,0,0.05); }
    .doctor-profile { background: #e8eaf6; padding: 20px; border-radius: 10px; margin-bottom: 30px; }
    .table-hover tbody tr:hover { background-color: #f1f3f9; cursor: pointer; }
</style>
</head>
<body>

<nav class="sidebar">
    <div class="p-4">
        <h3 class="fw-bold">OH-CLINIC</h3>
        <p class="small text-white-50">의사용 진료 관리 시스템</p>
    </div>
    <ul class="nav flex-column mt-3">
        <li class="nav-item"><a class="nav-link active" href="#"><i class="bi bi-house-door"></i> 홈/현황</a></li>
        <li class="nav-item"><a class="nav-link" href="#"><i class="bi bi-file-earmark-medical"></i> 진료차트 등록</a></li>
        <li class="nav-item"><a class="nav-link" href="#"><i class="bi bi-bar-chart-line"></i> 나의 매출 통계</a></li>
        <li class="nav-item"><a class="nav-link" href="#"><i class="bi bi-calendar-event"></i> 예약 환자 명단</a></li>
        <li class="nav-item mt-5"><a class="nav-link text-warning" href="/ohclinic/logout"><i class="bi bi-door-open"></i> 로그아웃</a></li>
    </ul>
</nav>

<main class="main-content">
    <div class="doctor-profile d-flex justify-content-between align-items-center">
        <div>
            <h4 class="mb-1 text-primary fw-bold">${loginDoctor.name} 과장님, 반갑습니다.</h4>
            <span class="badge bg-secondary">${loginDoctor.specialty}</span> | <span class="text-muted small">근무지: ${loginDoctor.location}</span>
        </div>
        <button class="btn btn-primary" onclick="location.href='/ohclinic/sales/register'">
            <i class="bi bi-plus-lg"></i> 진료차트(매출) 등록
        </button>
    </div>

    <div class="row g-4">
        <div class="col-lg-8">
            <div class="card p-4">
                <h5 class="fw-bold mb-4"><i class="bi bi-clock-history me-2"></i>오늘 및 차기 예약 환자</h5>
                <table class="table table-hover align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>예약시간</th>
                            <th>환자명</th>
                            <th>구분</th>
                            <th>상태</th>
                            <th>작업</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="res" items="${reservationList}">
                            <tr>
                                <td>${res.date}</td>
                                <td class="fw-bold">${res.pName}</td>
                                <td>${res.type}</td>
                                <td><span class="badge bg-info">대기중</span></td>
                                <td><button class="btn btn-sm btn-outline-primary">차트작성</button></td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td>14:30</td>
                            <td class="fw-bold">김환자</td>
                            <td>재진</td>
                            <td><span class="badge bg-success">진료예정</span></td>
                            <td><button class="btn btn-sm btn-outline-primary">차트작성</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="card p-4 mb-4">
                <h5 class="fw-bold mb-3">나의 매출 현황</h5>
                <div class="mb-3">
                    <small class="text-muted">오늘 총 매출</small>
                    <h3 class="text-primary fw-bold">1,255,000원</h3>
                </div>
                <hr>
                <div class="d-grid gap-2">
                    <button class="btn btn-light btn-sm text-start"><i class="bi bi-geo-alt"></i> 지역별 매출 리스트</button>
                    <button class="btn btn-light btn-sm text-start"><i class="bi bi-person-heart"></i> 담당 환자별 리스트</button>
                </div>
            </div>
            
            <div class="card p-4 bg-primary text-white">
                <h6>알림</h6>
                <p class="small mb-0">검토가 필요한 미결제 차트가 2건 있습니다.</p>
            </div>
        </div>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>