SELECT 	e.DEPARTMENT_ID , d.DEPARTMENT_NAME, 
		COUNT(*) , sum(SALARY) ,
		l.CITY 
FROM	EMPLOYEES e 
	INNER JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
	INNER JOIN LOCATIONS l 
	ON d.LOCATION_ID = l.LOCATION_ID 
WHERE d.DEPARTMENT_ID IN (10, 30, 100, 110)	
GROUP BY e.DEPARTMENT_ID, d.DEPARTMENT_NAME, l.CITY 
HAVING d.DEPARTMENT_NAME IN ('Administration', 'Accounting')
;

-- table명 	: sample
-- deptNo 	: number(20)
-- deptName : varchar2(15)
-- deploc	: varchar2(15)
-- deptManger	: varchar2(10)

CREATE TABLE sample(
	deptNo		number(20),
	deptName	varchar2(15),
	deploc		varchar2(15),
	depManger	varchar2(10)
);

-- deptNo : 10, deptName : 기획실,  deploc : 부산 , deptManger : 홍길동
-- deptNo : 20, deptName : 전산실,  deploc : 서울 , deptManger : 김말똥
-- deptNo : 30, deptName : 영업부실,  deploc : 광주 , deptManger : null
INSERT INTO SAMPLE (deptNo, deptName, deploc, depManger)
VALUES (10, '기획실', '서울', '홍길동');
INSERT INTO SAMPLE 
VALUES (20, '전산실', '부산', '김말똥');
INSERT INTO SAMPLE 
VALUES (30, '영업부실', '광주', null);

-- TRUNCATE TABLE SAMPLE ;
SELECT * FROM SAMPLE s ;

-- sample 테이블에서 deptNo가 30인 부서번호를 50으로 수정
UPDATE 	SAMPLE SET DEPTNO = 50
WHERE 	DEPTNO = 30;

-- sample 테이블에서 deptName 영업부인 deploc를 인천으로 수정
UPDATE 	SAMPLE SET DEPLOC = '인천'
WHERE DEPTNAME = '영업부실'
;

-- DELETE 
DELETE sample WHERE deptname = '전산실';
DELETE sample WHERE deptname = '기획실';
DELETE sample WHERE deptname = '영업부실';

SELECT * FROM SAMPLE s ;

ROLLBACK;
COMMIT;

-- not null

CREATE TABLE null_test(
	col1	varchar2(20) NOT NULL,
	col2 	varchar2(20)
);

CREATE TABLE null_test2(
	col1	varchar2(20) NOT NULL,
	col2 	varchar2(20) NULL,
	col3 	varchar2(20)
);

INSERT INTO NULL_TEST (col1, COL2)
VALUES ('aa', 'bb');

SELECT * FROM NULL_TEST;


INSERT INTO NULL_TEST (col1, COL2)
VALUES (null, 'bb');

INSERT INTO NULL_TEST (col1, COL2)
VALUES ('aa', null);


-- unique
CREATE TABLE unique_test(
	col1 	varchar2(20) UNIQUE NOT NULL,
	col2	varchar2(20) UNIQUE,
	col3	varchar2(20)
);

INSERT INTO UNIQUE_TEST (col1, col2, COL3)
VALUES ('aa', 'bb', 'cc');
INSERT INTO UNIQUE_TEST (col1, col2, COL3)
VALUES ('aa2', 'bb2', 'cc2');
SELECT * FROM UNIQUE_TEST ut ;

UPDATE 	UNIQUE_TEST 
SET 	COL1 = 'aa'
WHERE 	COL2 = 'bb2'
;

INSERT INTO UNIQUE_TEST (col1, col2, COL3)
VALUES ('aa3', null, 'cc2');
INSERT INTO UNIQUE_TEST (col1, col2, COL3)
VALUES ('aa4', null, 'cc2');
SELECT * FROM UNIQUE_TEST ut ;


-- check
CREATE TABLE check_test2(
	gender 	varchar2(10) NOT NULL
		CONSTRAINTS CHECK_gender2 check(gender IN('M','F','남자','여자'))
);

INSERT INTO check_test2 VALUES ('M');
SELECT * FROM check_test2 ;












