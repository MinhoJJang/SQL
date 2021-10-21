-- DDL

-- 테이블 생성
CREATE TABLE EMPLOYEES2(
	employee_id		number(10),
	name			varchar2(20),
	salary			number(7,2)
);

CREATE TABLE EMPLOYEES3(
	employee_id		number(10),
	name			varchar2(20),
	salary			number(7,2),
	create_date		DATE	DEFAULT sysdate 
);

-- 기존 테이블과 동일하게 작성 
CREATE TABLE employees3 
AS 
SELECT * FROM EMPLOYEES2 e ;

-- 컬럼추가
ALTER TABLE EMPLOYEES2 ADD(
	manager_id 	varchar2(10)
);

ALTER TABLE EMPLOYEES2 modify(
	manager_id 	varchar2(20)
);

-- 컬럼 삭제
ALTER TABLE EMPLOYEES2 DROP COLUMN manager_id;

SELECT * FROM EMPLOYEES2;

INSERT INTO EMPLOYEES2 
VALUES (4, '테스트', 30000);

INSERT INTO EMPLOYEES3 (employee_id, name)
VALUES (4, '테스트');

-- DELETE FROM EMPLOYEES2 e WHERE EMPLOYEE_ID  = 1;

-- 데이터 비우기
-- TRUNCATE TABLE EMPLOYEES2 ;

-- 테이블 삭제
-- DROP TABLE EMPLOYEES3 ;