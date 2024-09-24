### DDL 문법 정리 ###

# --- 데이터 베이스 ---
# 1. 데이터베이스 생성(CREATE)
CREATE DATABASE IF NOT EXISTS DATABASE_NAME;

# CF) 데이터베이스의 유무를 확인하고 오류를 방지하는 SQL문
#     , 존재하지 않을 경우에만 새로 생성
# -- IF NOT EXISTS 사용
CREATE DATABASE IF NOT EXISTS DATABASE_NAME;

# 2. 데이터베이스 선택(USE)
# USE 키워드를 사용하여 DB 선택 시 모든 SQL 명령어가 선택된 DB 내에서 실행
# , 스키마명을 더블클릭한 것과 동일함
USE SYS;
USE DATABASE_NAME;

# 3. 데이터베이스 삭제
# 데이터베이스 삭제 기능, 해당 작업은 실행 후 되돌릴 수 X
DROP DATABASE DATABASE_NAME;

# 4. 데이터베이스 목록 조회
# : 서버에 존재하는 모든 데이터베이스 목록을 확인
# SHOW DATABASES;
SHOW DATABASES;

# --- 테이블 ---
# 1. 테이블 생성 (CREATE TABLE)
CREATE DATABASE IF NOT EXISTS EXAMPLE;
USE EXAMPLE;
CREATE TABLE STUDENTS ( # 테이블 생성 시 데이터베이스명이 필수는 X (오류 방지를 위해 권장)
	STUDENT_ID INT PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    AGE INT NOT NULL,
    MAJOR VARCHAR(100)
);

# 2. 테이블의 구조 조회 (DESCRIBE, DECS)
# 테이블 구조: 정의된 컬럼, 데이터 타입, 키 정보(제약조건) 등을 조회 가능
# DESCRIBE 테이블명;
# DESCRIBE STUDENTS;
DESC STUDENTS;

# FIELD: 각 컬럼의 이름, TYPE: 각 컬럼의 데이터 타입, NULL: NULL 허용 여부
# KEY: 각 컬럼의 제약사항(키), DEFAULT: 기본값 지정, EXTRA: 제약사항-추가옵션

# --- 테이블 수정 ---
# ALTER TABLE
# : 이미 존재하는 테이블의 구조를 변경하는 데 사용
# > 컬럼 또는 제약 조건을 추가, 수정, 삭제

# - 컬럼 -
# A) 컬럼 추가 ADD (COLUMN)
# ALTER TABLE 테이블명 ADD COLUMN 컬럼명 데이터타입 기타사항;
ALTER TABLE `STUDENTS`
ADD EMAIL VARCHAR(255);

DESC STUDENTS;

# B) 컬럼 수정 MODIFY (COLUMN)
# ALTER TABLE 테이블명 MODIFY COLUMN 컬럼명 새로운컬럼_데이터타입;
ALTER TABLE STUDENTS
MODIFY EMAIL VARCHAR(100);

DESC STUDENTS;

# C) 컬럼 삭제 DROP (COLUMN)
# ALTER TABLE 테이블명 DROP 컬럼명;
ALTER TABLE STUDENTS
DROP EMAIL;

DESC STUDENTS;

# CF. IF EXISTS
# : 선택적 키워드, 테이블이 존재하는 경우에만 삭제를 수행
# > 존재할 때만 삭제하기 때문에 오류 X
DROP TABLE IF EXISTS `LECTURES`;
DROP TABLE `STUDENTS`;

# CF. 데이터베이스와 테이블을 동시 지정
# : 테이블의 위치를 명확하게 전달하기 위해 .기호를 사용하여 경로 지정을 권장
# > 데이터베이스.테이블명

# CF. TURNCATE
# : 테이블의 모든 데이터를 삭제하고 초기 상태로 되돌림

# VS DROP
# DROP: 전체 구조물을 삭제

