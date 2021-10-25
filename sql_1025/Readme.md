# CREATE ACCOUNT 

1. sqlplus 창에서 system 계정으로 로그인
혹은 cmd에서 아래 명령어 입력
```
sqlplus system
```
2. 유저 생성 
```
create user testuser identified by 0000; -- 비밀번호
grant connect, resource to testuser;
```

# VIEW

### WHAT IS VIEW?
- view는 table과 유사하며, 테이블 처럼 사용한다.
- 테이블과는 달리 데이터를 저장하기 위한 물리적인 공간이 필요하지 않은 **가상테이블**이다.
- 데이터를 물리적으로 갖지 않지만 논리적인 집합은 갖는다.
- 테이블과 마찬가지로 select, insert, update, delete명령이 가능하다.

### VIEW 사용 예시 
```sql
CREATE VIEW v_emp(
	emp_id, first_name, job_id, hiredate, dept_id
) AS 
SELECT employee_id, first_name, job_id, hire_date, department_id
FROM EMPLOYEES 
WHERE job_id = 'ST_CLERK'
;

SELECT * FROM V_EMP ve ;

DROP VIEW V_EMP ; -- VIEW 삭제 

CREATE OR REPLACE VIEW v_emp2(
	emp_id, first_name, job_id, hiredate, dept_id
) AS 
SELECT NVL(employee_id, NULL), 
	   NVL(first_name, NULL), 
	   job_id, hire_date, department_id
FROM   EMPLOYEES 
WHERE  job_id = 'ST_CLERK'
;
-- NVL은 NULL인 부분을 지정한 값으로 출력하는 함수임 

SELECT * FROM V_EMP2;

UPDATE V_EMP SET FIRST_NAME = 'KIM'
WHERE FIRST_NAME = 'James' 
;

UPDATE V_EMP2 SET FIRST_NAME = 'KIM'
WHERE FIRST_NAME = 'James'
;
-- V_EMP2에서는 위 명령 불가능
-- NVL로 감싸준 컬럼은 수정이 불가능하다. 

```
# SEQUENCE

### WHAT IS SEQUENCE?
- **자동으로 순차적으로 증가하는 순번을 반환하는 데이터베이스 객체**이다.
- 보통 PK값에 **중복값을 방지**하기위해 사용한다.
- 연속적으로 번호를 만들어주는 기능
- EX) 게시판에 글이 하나 추가될 때마다 글번호(PK)가 생겨야 하는 경우에, 만약 100번까지 글 번호가 생성되어있다면 그 다음 글이 추가가 되려면 글 번호가 101로, 하나의 row를 생성해주어야 한다. 이때, 101이라는 숫자를 얻으려면 기존 그 번호중 가장 큰 값에 + 1을 하는 로직을 어딘가에 넣어야한다. 시퀀스를 사용하면 이러한 로직이 필요없이 데이터베이스에 row가 추가될때마다 자동으로 +1를 시켜준다.

### 구문형식
```SQL
create sequence 시퀀스이름
increment by n		
    -- n: 증가값을 설정 
    -- 2: 2씩 증가
    -- 기본값 : 1
start with n   -- 시작값 설정, 기본값 1
maxvalue n | nomaxvalue	시퀀스 최대값 설정
             -- nomaxvalue : 무한대 값
minvalue n | nominvalue 시퀀스 최소값을 설정
             -- nominvalue : 무한대 값
cycle | nocycle		시퀀스를 순화 사용할지를 설정
             -- cycle로 설정시 maxvalue에 도달했을 경우 다시 minvalue부터 시작
cache n | nocache	시퀀스의 속도를 개선을위해 캐싱여부 지정
```

### SEQUENCE 사용 예시 

```SQL

CREATE SEQUENCE SEQ_SERIAL_NO
INCREMENT BY 1
START WITH 100
MAXVALUE 110
MINVALUE 90
CYCLE 
CACHE 2
;

CREATE TABLE GOOD(
	GOOD_NO 	NUMBER(3),
	GOOD_NAME 	VARCHAR(10)
)
;

INSERT INTO GOOD VALUES (SEQ_SERIAL_NO.NEXTVAL, '제품1');
-- CYCLE을 돌리니까 맨 마지막 인덱스, MAXVALUE 이후부터는 MINVALUE부터 시작함. 

SELECT * FROM GOOD;

SELECT SEQ_SERIAL_NO.CURRVAL FROM DUAL;
INSERT INTO GOOD VALUES (SEQ_SERIAL_NO.CURRVAL, '제품12');
```

