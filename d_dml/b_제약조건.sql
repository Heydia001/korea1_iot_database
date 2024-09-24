### b_제약조건 ###

/* 제약조건(Constraint / 제약)
	1.제약 조건의 개념 
	데이터의 정확성, 일관성, 신뢰성, 무결성을 유지하기 위해 DB 시스템에 의해 강제되는 규칙
 	2. 제약조건 사용 목적
	: 데이터 무결성 보장
	: 오류 방지
    : 관계 유지 - 테이블 간에 정의된 관계가 자속적으로 유지
    : 응용 프로그램 수준에서의 복잡성 감소
    
    3. 제약 조건의 종류
    1) Primary key (기본 키)
    2) Forirgn key (외래 키)
    3) UNIQUE (유니크)
    4) CHECK (체크)
    5) NOT NULL (널 아님)
    6) DEFAULT (기본 값)
*/

/*
	1. PK, Primary Key 기본 키
	: 테이블의 각 행을 고유하게 식별하는 열
    : 테이블의 레코드(행)를 고유하게 구분하는 식별자 역할
    
    - 고유성으로 중복 될 수 없음
    - Not Null: Null 값이 될 수 없음, 반드시 유효한 데이터를 포함해야한다.
    - 유일성 제약
		: 하나의 테이블 당 하나의 기본 키만 지정 가능하다.
        >> 테이블의 특성을 가장 잘 반영한 열 선택을 권장
		EX) member - member-id
			posts - post_number
            books -  isbn
*/

-- DROP DATABASE EXAMPLE;

CREATE DATABASE `EXAMPLE`;
USE `EXAMPLE`;

# 기본 키 지정 방법
# 1) 테이블 생성 시 
# : 컬럼명 데이터 타입 PRIMARY KEY(제약조건)
CREATE TABLE STUDENTS (
	STUDENTS_ID INT PRIMARY KEY,
    NAME VARCHAR(100),
    MAJOR VARCHAR(100)
);

# 2) 제일 마지막 부분에 제약 조건 작성
-- CREATE TABLE STUDENTS (
-- 	STUDENTS_ID,
--     NAME VARCHAR(100),
--     MAJOR VARCHAR(100),
--     # 제약 조건 (설정할 컬럼명)
--     PRIMARY KEY (STUDENT_ID)
-- );

DESCRIBE `STUDENTS`;

INSERT INTO `STUDENTS`
VALUES 
	(1, '이승아', 'A전공'),
	(2, '이도경', 'A전공'),
	(3, '이승아', 'B전공');
    
-- INSERT INTO `STUDENTS`
-- VALUES (1, '김다혜', 'C전공'); # ERROR 기본 키 충돌

# 제약조건에 대한 수정 (ALTER)
# 1) 제약 조건 삭제
ALTER TABLE `STUDENTS`
DROP PRIMARY KEY;

# 기본 키 제약 조건 삭제 시 NOT NULL에 대한 조건은 사라지지 않음 NOT NULL에 대한 수정은 따로 이루어져야 함.

DESC `STUDENTS`;

# 2) 제약 조건 추가
ALTER TABLE `STUDENTS`
ADD PRIMARY KEY (STUDENTS_ID);

DESC `STUDENTS`;

/*
	2. FK, FOREIGN KEY (외래 키)
    : 두 테이블 사이의 관계를 연결, 데이터의 무결성을 유지
    : 외래 키가 설정 된 열은 반드시 다른 테이블의 기본키와 연결 되어야 한다.
*/

# 기본 테이블: 기본 키가 있는 테이블 (회원 테이블)
# 참조 테이블: 외래 키가 이쓴ㄴ 테이블 (구매 테이블)

# 외래키 사용 예시
# : 회원 (MEMBERS) - 주문 (ORDERS)
# >> 고갱이 실제로 존재하는지 확인, 고객과 주문 간의 관계를 명시
CREATE TABLE `MEMBERS` (
	MEMBER_ID INT PRIMARY KEY,
    NAME VARCHAR(100)
);

CREATE TABLE `ORDERS` (
	ORDER_ID INT PRIMARY KEY,
    ORDER_DATE DATE,
    MEMBER_ID INT,
    # 외래 키 지정 방식
    # FOREGIN KEY (참조컬럼) REFERENCES 기본 테이블(기본 컬럼)
    FOREIGN KEY (MEMBER_ID) REFERENCES `MEMBERS`(MEMBER_ID)
);


-- 유효하지 않은 고객 참조 시도 (오류)
-- INSERT INTO `ORDERS`
-- VALUES (1, 2024-09-24, 123); -- 참조 무결성 위반

-- 고객 테이터 입력
INSERT INTO `MEMBERS`
VALUE (1, '황상기');

-- 유효한 고객 참조 시도
INSERT INTO `ORDERS`
VALUE (1, '2024-09-24', 1); 

# 외래 키 제약 조건 삭제 & 추가
# : 외래 키 제약 조건 삭제 시 주의점
# >> 해당 데이터를 참조하는 데이터가 있을 경우 삭제할 수 없음

# 외래 키 제약 조건 이름 확인
SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'ORDERS' AND COLUMN_NAME = 'MEMBER_ID';

# >> ORDERS_IBFK_1

ALTER TABLE `ORDERS`
DROP FOREIGN KEY `ORDERS_IBFK_1`;

-- ALTER TABLE `ORDERS`
-- DROP FOREIGN KEY `MEMEBER_ID`;
# >> 외래 키 제약 조건 삭제 시 제약조건의 이름을 검색하여 작성

ALTER TABLE `ORDERS`
ADD CONSTRAINT
	FOREIGN KEY (MEMBER_ID)
    REFERENCES (MEMBER_ID);

# CF) TRUNCATE: 테이블의 모든 행을 삭제; (데이터 삭제)
TRUNCATE TABLE `ORDERS`;

DESC `ORDERS`;

/*
	3. UNIQUE
    : 특정 열에 대해 모든 값이 고유해야 함을 보장
    : 한 테이블 내에서 여러개에 지정이 가능 (각각 다른 컬럼에 독립적으로 적용)
    : NULL값 허용
    
    CF) PK와의 차이
    >> 여러 컬럼에 사용 가능 & NULL 값 허용
*/

CREATE TABLE USERS (
	USER_ID INT PRIMARY KEY,
    USER_NAME VARCHAR(100),
    USER_EMAIL VARCHAR(100) UNIQUE
);

INSERT INTO `USERS`
VALUES
		(1, '박영준', 'ㅂㅈㄷ@123'),
		(2, '박영준', 'ㅂㅈㄷ@124');
        
        
/*
	4. CHECK 제약 조건
    : 입력되는 데이터를 정검하는 기능
    : 테이블의 열에 대해 특정 조건을 설정
      ,조건을 만족하지 않는 경우 입력을 막음
*/

CREATE TABLE `EMPLOYEES` (
	ID INT PRIMARY KEY,
    NAME VARCHAR(100),
    AGE INT
    -- CHECK 제약 조건 사용 방법
    -- CHECK (조건)
    # 조건식의 경우 다양한 연산자 사용
    CHECK (AGE >= 20)
);
        
INSERT INTO `EMPLOYEES`
VALUES (1, '이기석', 28);

INSERT INTO `EMPLOYEES`
VALUES (2, '홍동현', 28); 

DESC `EMPLOYEES`;

/*
	5. NOT NULL 제약 조건
    : 특정 열에 NULL 값을 허용하지 않는다는 것을 의미
    > 비워져 있지 않도록 설정
*/

CREATE TABLE `CONTACTS` (
	ID INT PRIMARY KEY, -- PK값은 NOT NULL을 지정하지 않아도 자동 지정
    NAME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(100) NOT NULL
);

INSERT INTO `CONTACTS`
VALUES (1, '성찬영', 'QWE123');

-- INSERT INTO `CONTACTS`
-- VALUES (2, NULL, 'QWE123'); -ERROR NOT NULL 오류 

/*
	6. DEFAULT 제약 조건
    : 테이블의 열의 값이 명시적으로 제공되지 않는 경우 사용되는 기본 값
    : 선택적인 필드에 대해 데이터 입력을 단순화하여 데이터의 무결성을 유지
*/

CREATE TABLE `INQUIRY` (
	ORDER_ID INT PRIMARY KEY,
    PRODUCT_NAME VARCHAR(100),
    -- DEFAULT 제약조건 설정 방법
    -- 컬럼면 데이터타입 DEFAULT 기본값
    QUANTITY INT DEFAULT 1
);

INSERT INTO `INQUIRY`
VALUES (1, '노트북', 3);

INSERT INTO `INQUIRY` (ORDER_ID, PRODUCT_NAME)
VALUES (2, '스마트폰');

SELECT * FROM `INQUIRY`;
