<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OH-Clinic - 신규 의사 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
    body { background-color: #f4f7f6; }
    .register-container { max-width: 700px; margin: 50px auto; }
    .card { border: none; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.08); }
    .form-label { font-weight: 600; color: #495057; }
    .input-group-text { background-color: #f8f9fa; }
</style>
</head>
<body>

<div class="register-container">
    <div class="mb-4 d-flex align-items-center justify-content-between">
        <h3 class="fw-bold mb-0"><i class="bi bi-person-plus-fill me-2 text-primary"></i>신규 의사 등록</h3>
        <button class="btn btn-outline-secondary btn-sm" onclick="location.href='/ohclinic/doctor/manage'">
            <i class="bi bi-list"></i> 목록으로
        </button>
    </div>

    <div class="card p-5">
        <form action="/ohclinic/doctor/register" method="post" onsubmit="return validateForm()">
            <div class="row g-4">
                <div class="col-md-8">
                    <label class="form-label">원장님 접속 ID</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-person-badge"></i></span>
                        <input type="text" name="id" id="docId" class="form-control" placeholder="ID 입력" required>
                        <button class="btn btn-outline-primary" type="button" onclick="checkDuplicate()">중복 확인</button>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <label class="form-label">비밀번호</label>
                    <input type="password" name="password" id="pw" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">비밀번호 확인</label>
                    <input type="password" id="pwConfirm" class="form-control" required>
                </div>

                <hr class="my-4 text-secondary opacity-25">

                <div class="col-md-6">
                    <label class="form-label">성함</label>
                    <input type="text" name="name" class="form-control" placeholder="성함 입력" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">전문과</label>
                    <select name="specialty" class="form-select" required>
                        <option value="" selected disabled>전문과목 선택</option>
                        <option value="망막전문의">망막전문의</option>
                        <option value="백내장전문의">백내장전문의</option>
                        <option value="녹내장전문의">녹내장전문의</option>
                        <option value="각막전문의">각막전문의</option>
                        <option value="시력교정전문의">시력교정전문의</option>
                    </select>
                </div>

                <div class="col-md-6">
                    <label class="form-label">진료실 위치</label>
                    <input type="text" name="location" class="form-control" placeholder="예: 1진료실" required>
                </div>

                <div class="col-12">
                    <label class="form-label">진료 시간 설정</label>
                    <input type="text" name="workTime" class="form-control" 
                           placeholder="예: 월~금 09:00 ~ 17:00 / 토 09:00 ~ 15:00 (미입력 시 기본값 적용)">
                </div>

                <div class="col-12 mt-5">
                    <button type="submit" class="btn btn-primary w-100 py-3 fw-bold shadow">
                        의사 정보 등록 완료
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>



<script>
    function checkDuplicate() {
        const id = document.getElementById('docId').value;
        if(!id) {
            alert("ID를 입력해주세요.");
            return;
        }
        // TODO: 백엔드 중복 체크 API 연결 (Ajax)
        alert("사용 가능한 ID입니다. (백엔드 연동 전)");
    }

    function validateForm() {
        const pw = document.getElementById('pw').value;
        const pwConfirm = document.getElementById('pwConfirm').value;

        if(pw !== pwConfirm) {
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }
        return true;
    }
</script>
</body>
</html>