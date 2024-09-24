### c_ddl 폴더 > ddl01 파일 생성 ###

### DDL 문법 정리 ###
# create, alter, drop, truncate

-- 데이터베이스 생성--
### create: 데이터베이스 생성, 데이터를 저장하고 관리하는 첫 단계
# 기본 형태
# create database 데이터베이스명;
create database example;

-- 테이블 생성 --
### create: 테이블 생성, 테이블에 저장될 데이터의 형태와 특성을 정의
# 데이터 타입, 제약조건, 기본값 등을 설정 가능
# 기본 형태
# create table `데이터베이스`.`테이블명` (
	# 컬럼1 데이터타입 [선택적옵션],
	# 컬럼2 데이터타입 [선택적옵션],
	# 컬럼3 데이터타입 [선택적옵션],
	# ...
# ); 
create table `example`.`students` (
	student_id int,
    student_name char(8),
    student_gender char(8)
);

create table `example`.`students2` (
	student_id int,
    student_name char(8),
    student_gender char(8)
)
default character set = utf8;

-- 테이블 삭제 --
# drop 키워드 사용
# 기본 형태
# drop table `데이터베이스명`.`테이블명`;
drop table `example`.`students2`; 

-- 데이터 베이스 삭제 --
# drop 키워드 사용
# 기본형태
# drop database `데이터베이스명`;
drop database example2;