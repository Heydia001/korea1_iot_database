### datatype02 ###
# 날짜형, 열거형 데이터 타입

/*
	5. 날짜형
    : 날짜 및 시간을 저장할 때 사용
    
    a) date (3byte)
    : 날짜만 저장 / YYYY-MM-DD 형식
    EX) 기념일, 생일 등
    
    b) time (3byte)
    : 시간만 저장 / HH:MM:SS
    
    c) datetime (8byte)
	: 날짜와 시간을 저장 / YYYY-MM-DD HH:MM:SS 형식
    EX) 구매 일자, 가입 일자 등
*/

create table events(
	event_name varchar(100),
    event_date DATE
);

insert into events
values ('Birhtday', '2024-03-14');

select * from events;


/*
	6. 타입형 타입 (enum)
    : 사전에 정의된 값의 집합 중 나의 값을 저장
    >> 제한 된 값 목록 중에서 선택
*/

create table rainbow(
	color enum('red', 'orange', 'yellow', 'purple'),
    description varchar(100)
);

insert into rainbow
values ('red', '빨강'),
		('orange', '오렌지'),
		('yellow', '노랑'),
		('purple', '보라');

