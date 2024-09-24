# cf) ddl: create alter drop truncate

/*
### DML (data manipulation language)
	: 데이터 관리 언어
    >> 데이터를 삽입, 조회, 수정, 삭제 가능 (CRUD)
*/

create database `company`;
use `company`;

create table `example` (
	name varchar(100),
    age int,
    major varchar(100)
);

/*
	1. 데이터 삽입 (insert)
    : 테이블에 행 데이터(레코드)를 입력하는 키워드
    
	# 기본 형식
    insert into 테이블명 (열1, 열2, ...)
    values (값1, 값2, ...)
    
    --  열 이름을 생략할 경우 values 키워드 뒤 값들의 순서는
		, 테이블 정의 시 지정한 열의 순서 & 개수와 동일
*/

# 1) 컬럼명 지정 X
insert into `example01`
values ('서호영', 23, '전공A');

# 2) 컬럼명 지정 O
insert into `example01`
values ('최윤성', '전공A', 30);

# cf) 데이터 삽입 시 데이터 값 입력을 하지 X 경우
# 1. Null 허용 - 자동 null 값 지정
# 2. NOT NULL 지정 - 오류!

# cf) auto_increment
# : 열을 정의할 대 1부터 1씩 증가하는 값을 입력
# >> insert 에서는 해당 열이 없다고 가정하고 입력
# >> 해당 컬럼은 반드시 PK 키로 지정되어야 함. - 하나의 테이블에 한 번만 지정 가능!

create table `example02` (
	-- 컬럼명 데이터 타입 Primary key auto_increment
    id int auto_increment primary key,
    name varchar(100)
);

insert into `example02`
values
	(null, '이승아'),
	(null, '최윤성'),
	(null, '권세혁'),
	(null, '황현지');
    
select * from `example02`;

# cf) auto_increment 최대값 확인
select max(id) from `example02`;

# cf) 시작 값 변경
alter table `example02` auto_increment=100;
insert into `example02`
values (null, '지수민');

select * from `example02`;

# cf) 다른 테이블의 데이터를 한 번에 입력하는 구문
# insert into 테이블명
# select ~~

create table `example03` (
	id int,
    name varchar(100)
);

insert into `example03`
select * from `example02`;

select * from `example03`;

/*
	2. 데이터 수정 (update)
    : 테이블의 내용을 수정하기 위한 키워드
    
    # 기본 형태
    update 테이블명
    set 열1=값1, 열2=값2, ...
	(where 조건);
    
    cf) where 조건이 없는 경우 해당 열(컬럼)의 데이터는 해당 값으로 모두 변경!
*/

select * from `example02`;
update `example02`
set name='선하영';

-- safe update mode를 해제하는 코드
set sql_safe_updates=0;

-- safe update mode를 설정하는 코드
set sql_safe_updates=1;

update`example03`
set name='장지민'
where mod(id, 3)=1;
-- mod(a, b 함수): 나눗셈에 대한 함수
-- 위 코드에서는 id 값을 2로 나눈 값이 1인지 여부를 확인

select * from `example03`;

# cf) 여러 제이터 컬럼 값을 한 번에 설정하는 경우 콤마(,)로 분리하여 나열 

/*
	3. 데이터 삭제: delete
    : 테이블의 데이터를 삭제하기 위한 키워드
    
    # 기본형태
    delete from 테이블명
    where 조건;
*/

delete from example03;
select * from example03;

insert into example02
values (null, '정수은');

select * from example02;

delete from example02
where name='선하영';
