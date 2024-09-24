# d_삭제명령어

# delete VS drop VS truncate#

/*
	공통점
	: 삭제를 담당하는 키워드
    
    차이점
    1) delete DML
    : 테이블의 틀은 남기면서 데이터를 삭제 - 적은 용량의 데이터 | 조건이 필요한 데이터
    
    2) drop DDL
    :테이블 자체를 삭제
    
    3) truncate DDL
    : 데이블의 틀은 남기면서 데이터를 삭제 - 대용량 데이터
*/

-- 대용량 테이블의 생성
create table `big1` (select * from `world`.`country`, `world`.`countrylanguage`);
create table `big2` (select * from `world`.`country`, `world`.`countrylanguage`);
create table `big3` (select * from `world`.`country`, `world`.`countrylanguage`);

delete from big1; -- 2.266초
select * from big1;

select * from big2;
drop table `company`,`big2`;

truncate table `big3`;
select * from big3;

