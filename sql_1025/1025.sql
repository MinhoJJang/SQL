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
SELECT NVL(employee_id,NULL), 	       
	   NVL(first_name,NULL), 
	   job_id, hire_date, department_id
FROM   EMPLOYEES 
WHERE  job_id = 'ST_CLERK'
;

SELECT * FROM V_EMP2;

UPDATE V_EMP SET FIRST_NAME = 'KIM'
WHERE FIRST_NAME = 'James'
;

UPDATE V_EMP2 SET FIRST_NAME = 'KIM'
WHERE FIRST_NAME = 'James'
;
-- 불가능
-- NVL로 감싸준 컬럼은 수정이 불가능하다. 

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
