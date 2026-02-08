<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OH-Clinic - 처리 실패</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
    body { background-color: #f8f9fa; display: flex; align-items: center; justify-content: center; height: 100vh; }
    .error-card { max-width: 500px; width: 100%; border: none; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.1); }
    .error-icon { font-size: 5rem; color: #dc3545; animation: shake 0.5s ease-in-out; }
    @keyframes shake {
        0%, 100% { transform: translateX(0); }
        25% { transform: translateX(-10px); }
        75% { transform: translateX(10px); }
    }
</style>
</head>
<body>

<div class="card error-card p-5 text-center">
    <div class="mb-4">
        <i class="bi bi-exclamation-triangle-fill error-icon"></i>
    </div>
    <h3 class="fw-bold text-dark mb-3">요청 처리에 실패했습니다.</h3>
    <p class="text-muted mb-4">
        ${msg}<br>
        입력하신 내용을 다시 한번 확인해 주세요.
    </p>
    
    <div class="d-grid gap-2">
        <button type="button" class="btn btn-primary btn-lg fw-bold" onclick="history.back()">
            이전 화면으로 돌아가기
        </button>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>