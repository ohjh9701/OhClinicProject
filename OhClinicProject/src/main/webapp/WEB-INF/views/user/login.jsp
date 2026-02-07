<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OH-CLINIC - 로그인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<style>
    body { font-family: 'Noto Sans KR', sans-serif; background-color: #f4f7f9; }
    .login-container { max-width: 450px; margin: 100px auto; }
    .card { border: none; border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.1); }
    .nav-tabs .nav-link { color: #6c757d; font-weight: 500; border: none; padding: 12px; }
    .nav-tabs .nav-link.active { color: #0d6efd; border-bottom: 3px solid #0d6efd; background: none; }
    .btn-login { padding: 12px; font-weight: 700; border-radius: 8px; }
</style>
</head>
<body>

<div class="login-container">
    <div class="text-center mb-4">
        <h2 class="text-primary fw-bold">OH-CLINIC</h2>
        <p class="text-muted">OH병원 고객 관리 프로그램</p>
    </div>

    <div class="card p-4">
        <ul class="nav nav-tabs nav-fill mb-4" id="loginTab" role="tablist">
            <li class="nav-item">
                <button class="nav-link active" id="admin-tab" data-bs-toggle="tab" data-bs-target="#admin" type="button">관리자</button>
            </li>
            <li class="nav-item">
                <button class="nav-link" id="doctor-tab" data-bs-toggle="tab" data-bs-target="#doctor" type="button">의사</button>
            </li>
        </ul>

        <div class="tab-content">
            <div class="tab-pane fade show active" id="admin">
                <form action="/ohclinic/adminLogin" method="post">
                    <div class="mb-3">
                        <label class="form-label">관리자 아이디</label>
                        <input type="text" name="id" class="form-control" placeholder="Admin ID" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">비밀번호</label>
                        <input type="password" name="password" class="form-control" placeholder="Password" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100 btn-login">관리자 로그인</button>
                </form>
            </div>

            <div class="tab-pane fade" id="doctor">
                <form action="/ohclinic/doctorLogin" method="post">
                    <div class="mb-3">
                        <label class="form-label">의사 아이디</label>
                        <input type="text" name="id" class="form-control" placeholder="Doctor ID" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">비밀번호</label>
                        <input type="password" name="password" class="form-control" placeholder="Password" required>
                    </div>
                    <button type="submit" class="btn btn-success w-100 btn-login">의사 로그인</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>