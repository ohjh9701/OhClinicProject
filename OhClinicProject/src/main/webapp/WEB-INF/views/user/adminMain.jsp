<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OH-CLINIC - 관리자 대시보드</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
    body { background-color: #f8f9fa; }
    /* 사이드바 스타일 */
    .sidebar { width: 250px; height: 100vh; position: fixed; background: #2c3e50; color: white; padding-top: 20px; }
    .sidebar .nav-link { color: #adb5bd; padding: 15px 25px; font-weight: 500; }
    .sidebar .nav-link:hover, .sidebar .nav-link.active { color: white; background: #34495e; }
    .sidebar .nav-link i { margin-right: 10px; }
    
    /* 메인 컨텐츠 영역 */
    .main-content { margin-left: 250px; padding: 30px; }
    .card-stat { border: none; border-radius: 10px; box-shadow: 0 4px 12px rgba(0,0,0,0.05); transition: 0.3s; }
    .card-stat:hover { transform: translateY(-5px); }
</style>
</head>
<body>

<nav class="sidebar">
    <div class="text-center mb-4">
        <h4 class="fw-bold text-primary">OH-CLINIC <span class="fs-6 text-white text-opacity-50">Admin</span></h4>
    </div>
    <ul class="nav flex-column">
        <li class="nav-item">
            <a class="nav-link active" href="#"><i class="bi bi-speedometer2"></i> 대시보드 홈</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/ohclinic/patient/list"><i class="bi bi-people"></i> 환자 관리</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/ohclinic/doctor/manage"><i class="bi bi-person-vcard"></i> 의사 관리</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/ohclinic/reservation/list"><i class="bi bi-calendar-check"></i> 예약 관리</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/ohclinic/sales/report"><i class="bi bi-graph-up-arrow"></i> 매출 관리</a>
        </li>
        <li class="nav-item mt-5">
            <a class="nav-link text-danger" href="/ohclinic/logout"><i class="bi bi-box-arrow-right"></i> 로그아웃</a>
        </li>
    </ul>
</nav>

<main class="main-content">
    <header class="d-flex justify-content-between align-items-center mb-5">
        <h3 class="fw-bold">관리자 시스템 현황</h3>
    </header>

    <div class="row g-4">
        <div class="col-md-3">
            <div class="card card-stat p-3 bg-white" onclick="location.href='/ohclinic/patient/list'" style="cursor: pointer">
                <div class="d-flex justify-content-between">
                    <div>
                        <h6 class="text-muted">환자 관리</h6>
                        <p class="mb-0 small text-primary">환자 정보를 등록하고 관리합니다.</p>
                    </div>
                    <i class="bi bi-heart-pulse fs-1 text-danger"></i>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card card-stat p-3 bg-white">
                <div class="d-flex justify-content-between">
                    <div>
                        <h6 class="text-muted">의사 관리</h6>
                        <p class="mb-0 small text-success">의사 정보 업데이트</p>
                    </div>
                    <i class="bi bi-person-badge fs-1 text-success"></i>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card card-stat p-3 bg-white">
                <div class="d-flex justify-content-between">
                    <div>
                        <h6 class="text-muted">예약 관리</h6>
                        <p class="mb-0 small text-warning">접수/취소 현황</p>
                    </div>
                    <i class="bi bi-clipboard-data fs-1 text-warning"></i>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card card-stat p-3 bg-white">
                <div class="d-flex justify-content-between">
                    <div>
                        <h6 class="text-muted">매출 관리</h6>
                        <p class="mb-0 small text-info">지역별/의사별 통계</p>
                    </div>
                    <i class="bi bi-currency-dollar fs-1 text-info"></i>
                </div>
            </div>
        </div>
    </div>

    </main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>