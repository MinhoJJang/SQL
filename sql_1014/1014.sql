-- table : EMPLOYEES 
-- 1. 연봉이(SALARY) 12000 이상되는 직원들의 LAST_NAME, 
-- 연봉을 조회한다
select 	LAST_NAME , SALARY 
FROM 	EMPLOYEES e
WHERE 	SALARY  >= 12000
ORDER  BY SALARY DESC 
;

-- 2. 사원번호(EMPLOYEE_ID)가 176인 사람의
-- LAST_NAME과 부서 번호를 조회한다.
SELECT  LAST_NAME , DEPARTMENT_ID 
FROM 	EMPLOYEES e 
WHERE 	EMPLOYEE_ID  = 176
;


-- 3. 연봉이(SALARY) 5000에서 12000의 범위 이외인 사람들의
-- LAST_NAME 및 연봉을 조회한다.
SELECT  SALARY , LAST_NAME 
FROM 	EMPLOYEES e 
WHERE 	NOT (SALARY BETWEEN 5000 AND 12000)
ORDER BY SALARY DESC 
;


-- 4. 20번 및 50번 부서(DEPARTMENT_ID)에서 근무하는
-- 모든 사원들의 LAST_NAME 및 부서 번호를 LAST_NAME의 
-- 알바벳 순으로 조회한다.
SELECT 	LAST_NAME , DEPARTMENT_ID 
FROM 	EMPLOYEES e 
WHERE  	DEPARTMENT_ID  = 20
OR 		DEPARTMENT_ID  = 50
ORDER BY LAST_NAME  ASC
;


-- 5. 20번 및 50번 부서(DEPARTMENT_ID)에 근무하며,
-- 연봉이 5000 ~ 12000 사이인 사원들의 
-- LAST_NAME 및 연봉을 조회한다.
SELECT  LAST_NAME , SALARY , DEPARTMENT_ID 
FROM 	EMPLOYEES e 
WHERE   SALARY BETWEEN 5000 AND 12000
AND 	(DEPARTMENT_ID  = 20 OR DEPARTMENT_ID = 50)
ORDER BY SALARY DESC 
;

SELECT LAST_NAME , SALARY 
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID in(20,50) 
AND SALARY BETWEEN 5000 AND 12000
;


-- 6.매니저가 없는 사람들의 LAST_NAME 및 JOB_ID를 조회한다.
SELECT 	LAST_NAME , JOB_ID 
FROM 	EMPLOYEES e 
WHERE 	MANAGER_ID IS NULL 
;


-- 7. 커미션(COMMISSION_PCT)을 버는 모든 사원들의
-- LAST_NAME, 연봉 및 커미션을 연봉 역순으로 조회한다.
SELECT  LAST_NAME , SALARY 
FROM 	EMPLOYEES e 
WHERE 	COMMISSION_PCT  IS NOT NULL 
ORDER BY SALARY desc
;


-- 8. LAST_NAME의 첫 글자가 A인 사원들의
-- LAST_NAME을 조회한다.
SELECT  LAST_NAME 
FROM 	EMPLOYEES e
WHERE 	LAST_NAME LIKE 'A%'
;

-----------------------------------------------------------------------------
-- concat(char1, char2) : 문자열 연결
SELECT CONCAT('Hello', 'bye'), CONCAT('good', 'bad')
FROM DUAL
;

SELECT 	CONCAT('good', 'bad') 	concats,
		'good' || 'bad' 		operators
FROM	DUAL 
;

-- initcap(char) : char의 첫 문자를 대문자로 변환
SELECT 	INITCAP('good morning')
FROM	DUAL ;

-- lower(char) : 소문자, upper(char) : 대문자
SELECT  lower('GOOD'), upper('good')
FROM DUAL ;

-- lpad("값", 총 문자길이, "채움문자")
SELECT 	'good'
		,lpad('good', 6) "LPAD1"
		,LPAD('good', 7, '#') "LPAD2"
		,LPAD('good', 8, 'L') "LPAD3" 
FROM 	DUAL 
;

-- rpad("값", 총 문자길이, "채움문자")
SELECT 	'good'
		,rpad('good', 6) "RPAD1"
		,RPAD('good', 7, '#') "RPAD2"
		,RPAD('good', 8, 'L') "RPAD3" 
FROM 	DUAL 
;

-- LTRIM("문자열", "옵션") - 문자열을 옵션으로 지정된 문자를 왼쪽에서 제거
SELECT 	LTRIM('goodbye', 'g'),
		LTRIM('goodbye', 'o'),
		LTRIM('gogogggdbye', 'go')
FROM	DUAL
;

-- RTRIM("문자열", "옵션") - 문자열을 옵션으로 지정된 문자를 오른쪽에서 제거
SELECT 	RTRIM('goodbye', 'e') 
	,	RTRIM('goodbye', 'i')
FROM	DUAL 
;

-- substr("문자열", "시작위치", "길이")
SELECT 	SUBSTR('good morning',1, 4)
FROM	DUAL 
;

SELECT 	SUBSTR('good morning',8, 4)
FROM	DUAL 
;


-- replace(char, str1, str2 ) : 문자열 일부를 대체해서 반환
SELECT 	REPLACE ('good morning tom', 'morning', 'evening')
FROM 	DUAL 
;

-- translate('문자열', '대상문자', '변환문자') - 1대1 대응
SELECT 	REPLACE ('You are not alone', 'You', 'We'),
		TRANSLATE ('You are not alone uuu', 'You', 'Wei')
FROM	DUAL 
;

-- sysdate
SELECT 	SYSDATE 
FROM 	dual
;

-- add_months
SELECT 	ADD_MONTHS(SYSDATE, 2) 
FROM 	DUAL 
;

-- last_day()
SELECT 	LAST_DAY(SYSDATE)
FROM	DUAL 
;

SELECT 	SYSDATE + 1 
FROM	DUAL 
;
	
SELECT 	SYSDATE + (INTERVAL '1' YEAR)
	,	SYSDATE + (INTERVAL '1' MONTH)
	,	SYSDATE + (INTERVAL '1' DAY)
	,	SYSDATE + (INTERVAL '1' HOUR)
	,	SYSDATE + (INTERVAL '1' MINUTE)
	,	SYSDATE + (INTERVAL '1' SECOND)
FROM	DUAL 
;

-- to_char() : 문자열 변환
SELECT 	TO_CHAR(SYSDATE, 'yyyy-mm-dd') 
	,	TO_CHAR(SYSDATE, 'yyyy/mm/dd')
	,	TO_CHAR(SYSDATE, 'yyyymmdd')
	,	TO_CHAR(SYSDATE, 'yyyy-mm-dd HH24:MI:SS') 
FROM	DUAL 
;

-- to_date() : 날짜형으로 변환
SELECT 	TO_DATE('2015-03-04', 'yyyy/mm/dd')
FROM	DUAL 
;


















