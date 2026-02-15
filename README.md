# 🏥 OhClinic Project
> **환자 중심의 스마트한 병원 고객 관리 시스템 (CRM)**

**OhClinic**은 병원 운영의 효율성을 극대화하기 위해 설계된 웹 기반 관리 솔루션입니다. 
관리자에게는 병원 전반의 통계와 인적 자원을 관리하는 '컨트롤 타워'를, 의사에게는 실시간 진료 차트와 매출 관리 기능을 제공합니다.

---

## 🛠 Tech Stack

### **Back-end**
* **Framework:** Spring Boot
* **Language:** Java 17
* **Database:** Oracle DB
* **ORM:** MyBatis
* **Library:** Lombok, Logback

### **Front-end**
* **View:** JSP, JSTL

---

## 🌟 Key Features

### 1. 권한별 이원화 시스템
* **관리자(Admin) 모드**: 의사/환자 데이터의 CRUD 관리 및 예약 현황 모니터링.
* **의사(Doctor) 모드**: 담당 환자 리스트 조회 및 진료 차트 작성을 통한 매출 자동 등록.

### 2. 스마트 데이터 자동화 (DB Trigger)
* **지능형 환자 등록**: `BIRTH_YEAR` 입력 시 DB 트리거를 통해 **나이(Age)**와 **성별(Gender)**이 실시간으로 계산되어 저장됩니다.
* **데이터 무결성**: 어플리케이션 계층이 아닌 DB 계층에서 로직을 처리하여 데이터 일관성을 확보했습니다.

### 3. 직관적인 UI/UX
* **반응형 대시보드**: 부트스트랩 기반의 사이드바 메뉴 구조로 빠른 업무 전환 가능.
* **객체 바인딩**: MyBatis의 `association` 매핑을 활용하여 환자와 담당 의사 정보를 유기적으로 연결.

---

## 🏗 Database Logic
DB의 비즈니스 로직 자동화를 위해 사용된 **Oracle Trigger** 소스입니다.



```sql
-- 환자 정보 자동 연산 트리거 (성별, 나이 자동화)
CREATE OR REPLACE TRIGGER PATIENT_TR
    BEFORE INSERT ON PATIENT FOR EACH ROW
DECLARE    
    V_THISYEAR NUMBER  := TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'));
    V_BIRTHYEAR NUMBER := TO_NUMBER(SUBSTR(:NEW.BIRTH_YEAR,1,4));
BEGIN
    -- 생년월일 기반 나이 계산
    :NEW.AGE := V_THISYEAR - V_BIRTHYEAR;
    
    -- 뒷자리 식별 번호를 통한 성별 자동 구분 (1,3: 남 / 2,4: 여)
    IF SUBSTR(:NEW.BIRTH_YEAR,-1) IN('1','3') THEN
        :NEW.GENDER := '남';
    ELSE
        :NEW.GENDER := '여';
    END IF;
END;
/
