### DDL & 데이터 타입 복습###

/*
	1. DDL
    CREATE(생성), DROP, ALTER, TRUNCATE
    >> 데이터 베이스, 테이블에 적용
    
    +) USE: 데이터베이스를 지정 키워드
    +) DESC(DESCRIBE): TABLE 구조를 조회
    +) SHOW 데이터베이스명: 데이터 베이스 목록 조회
	+) IF EXISTS / IF NOT EXISTS: 존재할 경우 실행 / 존재하지 않을 경우 실행
    
    2) 데이터 타입
    : 정수형, 문자형, 실수형, 논리형, 날짜형, 열거형
*/

/*예제 실습*/

CREATE DATABASE IF NOT EXISTS BASEBALL_LEAGUE;
USE BASEBALL_LEAGUE;

CREATE TABLE TEAMS(
	TEAM_ID INT,
    NAME VARCHAR(100),
    CITY VARCHAR(100),
    FOUNUDED_YEAR YEAR -- 날짜 중 연도 데이터만 저장 하는 타입 'YYYY'
);

CREATE TABLE PLAYERS(
	PLAYER_ID INT,
    NAME VARCHAR(100),
    POSITION ENUM('타자', '투수', '내야수', '외야수')
);

DESCRIBE TERAMS;
ALTER TABLE PLAYERS
ADD BIRTH_DATE DATE;

DROP TABLE IF EXISTS `TEAMS`, `PLAYERS`;
DROP DATABASE IF EXISTS `BASEBALL_LEAGUE`;


