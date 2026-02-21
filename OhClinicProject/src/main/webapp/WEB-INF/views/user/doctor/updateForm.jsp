<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OH-Clinic - 의사 정보 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
    body { background-color: #f8f9fa; }
    .update-container { max-width: 700px; margin: 50px auto; }
    .card { border: none; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.05); }
    .readonly-id { background-color: #e9ecef; cursor: not-allowed; }
</style>
</head>
<body>

<div class="update-container">
    <div class="mb-4 d-flex align-items-center justify-content-between">
        <h3 class="fw-bold mb-0"><i class="bi bi-pencil-square me-2 text-primary"></i>의사 정보 수정</h3>
        <button class="btn btn-outline-secondary btn-sm" onclick="location.href='/ohclinic/doctor/manage'">
            <i class="bi bi-arrow-left"></i> 목록으로
        </button>
    </div>

    <div class="card p-5">
        <form action="/ohclinic/doctor/update" method="post">
            <input type="hidden" name="no" value="${doctor.no}">
            
            <div class="row g-4">
                <div class="col-md-6">
                    <label class="form-label fw-bold">원장님 ID</label>
                    <input type="text" class="form-control readonly-id" value="${doctor.id}" readonly>
                    <small class="text-muted">※ ID는 변경할 수 없습니다.</small>
                </div>
                
                <div class="col-md-6">
                    <label class="form-label fw-bold">비밀번호 변경</label>
                    <input type="password" name="password" class="form-control" value="${doctor.password}" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label fw-bold">성함</label>
                    <input type="text" name="name" class="form-control" value="${doctor.name}" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label fw-bold">전문과</label>
                    <select name="specialty" class="form-select" required>
                        <option value="망막전문의" ${doctor.specialty == '망막전문의' ? 'selected' : ''}>망막전문의</option>
                        <option value="백내장전문의" ${doctor.specialty == '백내장전문의' ? 'selected' : ''}>백내장전문의</option>
                        <option value="녹내장전문의" ${doctor.specialty == '녹내장전문의' ? 'selected' : ''}>녹내장전문의</option>
                        <option value="각막전문의" ${doctor.specialty == '각막전문의' ? 'selected' : ''}>각막전문의</option>
                        <option value="시력교정전문의" ${doctor.specialty == '시력교정전문의' ? 'selected' : ''}>시력교정전문의</option>
                    </select>
                </div>

                <div class="col-md-6">
                    <label class="form-label fw-bold">진료실 위치</label>
                    <input type="text" name="location" class="form-control" value="${doctor.location}" required>
                </div>

                <div class="col-12">
                    <label class="form-label fw-bold">진료 시간 설정</label>
                    <input type="text" name="workTime" class="form-control" value="${doctor.workTime}" placeholder="예: 월~토 09:00~18:00">
                </div>

                <div class="col-12 mt-5">
                    <button type="submit" class="btn btn-primary w-100 py-3 fw-bold shadow">
                        정보 수정 완료
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>