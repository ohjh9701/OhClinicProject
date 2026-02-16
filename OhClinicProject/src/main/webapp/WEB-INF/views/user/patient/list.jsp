<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OH-Clinic - 환자 관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
    body { background-color: #f8f9fa; }
    .content-wrapper { padding: 30px; }
    .table-card { border: none; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.05); background: white; }
    .search-bar { background: #fff; padding: 20px; border-radius: 10px; margin-bottom: 25px; border: 1px solid #e9ecef; }
    .gender-m { color: #0d6efd; font-weight: bold; }
    .gender-f { color: #dc3545; font-weight: bold; }
    .btn-action { padding: 2px 8px; font-size: 0.85rem; }
</style>
</head>
<body>

<div class="content-wrapper">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="fw-bold"><i class="bi bi-people-fill me-2"></i>환자 리스트 관리</h3>
        <button class="btn btn-primary" onclick="location.href='/ohclinic/patient/createForm'">
            <i class="bi bi-person-plus-fill"></i> 신규 환자 등록
        </button>
    </div>

    <div class="search-bar">
        <form action="/ohclinic/patient/list" method="get" class="row g-3">
            <div class="col-md-3">
                <input type="text" name="searchName" class="form-control" placeholder="환자 이름 검색">
            </div>
            <div class="col-md-3">
                <select name="searchLocation" class="form-select">
                    <option value="">지역 선택 (전체)</option>
                    <option value="서울">서울</option>
                    <option value="경기">경기</option>
                    <option value="인천">인천</option>
                </select>
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-secondary w-100">검색</button>
            </div>
        </form>
    </div>

    <div class="card table-card">
        <div class="card-body p-0">
            <table class="table table-hover align-middle mb-0">
                <thead class="table-light">
                    <tr>
                        <th class="ps-4">No.</th>
                        <th>이름</th>
                        <th>성별/나이</th>
                        <th>연락처</th>
                        <th>거주지</th>
                        <th>최근 내원일</th>
                        <th>차기 예약일</th>
                        <th>담당의</th>
                        <th class="text-center">관리</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="p" items="${patientList}">
                        <tr>
                            <td class="ps-4 text-muted">${p.no}</td>
                            <td><span class="fw-bold text-dark">${p.name}</span></td>
                            <td>
                                <span class="${p.gender.toString() == 'M' ? 'gender-m' : 'gender-f'}">${p.gender}</span>
                                <span class="text-muted">(${p.age}세)</span>
                            </td>
                            <td>${p.phone}</td>
                            <td><small>${p.location}</small></td>
                            <td><fmt:formatDate value="${p.lastReserv}" pattern="yyyy-MM-dd"/></td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty p.nextReserv}">
                                        <span class="badge bg-success"><fmt:formatDate value="${p.nextReserv}" pattern="yyyy-MM-dd"/></span>
                                    </c:when>
                                    <c:otherwise><span class="text-muted small">-</span></c:otherwise>
                                </c:choose>
                            </td>
                            <td><span class="badge bg-light text-dark border">ID: ${p.doctor.name}</span></td>
                            <td class="text-center">
                                <button class="btn btn-outline-warning btn-action me-1" onclick="confirmUpdate(${p.no})" >수정</button>
                                <button class="btn btn-outline-danger btn-action" onclick="confirmDelete(${p.no})">삭제</button>
                            </td>
                        </tr>
                    </c:forEach>
                    
                    <c:if test="${empty patientList}">
                        <tr>
                            <td colspan="9" class="text-center py-5 text-muted">등록된 환자 데이터가 없습니다.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    function confirmDelete(no) {
        if(confirm(no + "번 환자 정보를 삭제하시겠습니까?")) {
            location.href = "/ohclinic/patient/delete?no=" + no;
        }
    }
    function confirmUpdate(no) {
        if(confirm(no + "번 환자 정보를 수정하시겠습니까?")) {
            location.href = "/ohclinic/patient/updateForm?no=" + no;
        }
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>