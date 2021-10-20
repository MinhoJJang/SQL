SELECT * FROM EMPLOYEES e ;


SELECT e.FIRST_NAME ,e.LAST_NAME ,e.DEPARTMENT_ID ,
	   d.DEPARTMENT_NAME , d.LOCATION_ID, l.CITY,
	   j.JOB_ID ,j.JOB_TITLE 
FROM EMPLOYEES e 
	INNER JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
	INNER JOIN LOCATIONS l 
	ON d.LOCATION_ID = l.LOCATION_ID 
--	                   l.city를 하면 왜 오류가 나나요
	INNER JOIN JOBS j 
	ON e.JOB_ID = j.JOB_ID 
--						
	WHERE l.CITY = 'Seattle'
;

SELECT * FROM DEPARTMENTS d ;
SELECT * FROM LOCATIONS l ;

SELECT * FROM JOBS j ;
-- inner join
-----------------------------------------

-- 문1. 30번 부서의 사원들의 이름, 직업(job_id), 부서명을 출력 
-- (employees , departments, jobs )
SELECT 	e.FIRST_NAME , e.JOB_ID , 
		d.DEPARTMENT_NAME , d.DEPARTMENT_ID,
		j.JOB_TITLE 		
FROM 	EMPLOYEES e 
	INNER JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID  = d.DEPARTMENT_ID
	INNER JOIN JOBS j 
	ON j.JOB_ID  = e.JOB_ID 
WHERE d.DEPARTMENT_ID  = 30
;


-- 문2. 커미션을 받는 사원의 이름, 직업, 부서번호, 부서명을 
-- 출력하라(employees , departments )
SELECT 	e.FIRST_NAME , e.JOB_ID , 
		e.DEPARTMENT_ID , d.DEPARTMENT_NAME 
FROM 	EMPLOYEES e
	INNER JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID  = d.DEPARTMENT_ID
WHERE e.COMMISSION_PCT IS NOT null	
;




-- 문3. 지역번호 2500에서 근무하는 사원의 이름, 직업, 부서번호, 부서명을 출력하라
-- (employees , departments )
SELECT 	e.FIRST_NAME , e.JOB_ID , 
		e.DEPARTMENT_ID , d.DEPARTMENT_NAME 
FROM 	EMPLOYEES e
	INNER JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID  = d.DEPARTMENT_ID
WHERE d.LOCATION_ID = 2500	
;



-- 문4. 이름에 A가 들어가는 사원들의 이름과 부서이름을 출력하라
-- %A%
-- (employees , departments )
SELECT 	e.FIRST_NAME , e.JOB_ID , 
		e.DEPARTMENT_ID , d.DEPARTMENT_NAME 
FROM 	EMPLOYEES e
	INNER JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID  = d.DEPARTMENT_ID
WHERE e.FIRST_NAME LIKE '%A%'	
;


-- 문5. 사원이름과 그 사원의 관리자 이름을 출력하라
-- (employees )
SELECT 	e.FIRST_NAME AS manager , e.EMPLOYEE_ID  AS manager_id, 
		e2.FIRST_NAME AS emp ,
		e2.EMPLOYEE_ID AS emp_id , e2.MANAGER_ID 
FROM 	EMPLOYEES e 
	INNER JOIN EMPLOYEES e2 
	ON e.EMPLOYEE_ID = e2.MANAGER_ID 
;


-- 문6. 급여가 3000에서 5000사이인 사원의 이름과 소속부서명 출력하라
-- (employees , departments )
SELECT 	e.FIRST_NAME , e.JOB_ID , 
		e.DEPARTMENT_ID , d.DEPARTMENT_NAME 
FROM 	EMPLOYEES e
	INNER JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID  = d.DEPARTMENT_ID
WHERE e.SALARY BETWEEN 3000 AND 5000
;


-- 문7. 급여가 3000 이하인 사원의 이름과 급여, 근무지를 출력하라
-- (employees , departments, locations )
SELECT 	e.FIRST_NAME , e.SALARY , l.CITY 
FROM 	EMPLOYEES e
	INNER JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
	INNER JOIN LOCATIONS l 
	ON d.LOCATION_ID = l.LOCATION_ID 
WHERE e.SALARY <= 3000
;

-----------------------------------------------------------
------------ 서브쿼리

SELECT 	ROUND(AVG(SALARY))  
FROM 	EMPLOYEES e 
;

SELECT 	EMPLOYEE_ID , FIRST_NAME ,LAST_NAME 
FROM 	EMPLOYEES e
WHERE 	SALARY < 6462
;

-- where절 에서는 집계함수 사용 불가
SELECT 	EMPLOYEE_ID , FIRST_NAME ,LAST_NAME 
FROM 	EMPLOYEES e
WHERE 	SALARY < ROUND(AVG(SALARY))  
;

SELECT 	EMPLOYEE_ID , FIRST_NAME ,LAST_NAME 
FROM 	EMPLOYEES e
WHERE 	SALARY < (SELECT ROUND(AVG(SALARY))	FROM EMPLOYEES e2)
;

SELECT * FROM EMPLOYEES;


SELECT 	LOCATION_ID 
FROM 	LOCATIONS l
WHERE 	COUNTRY_ID = 'US'
;

SELECT * FROM LOCATIONS;

SELECT 	*
FROM 	DEPARTMENTS d
WHERE 	LOCATION_ID IN (1400, 1500, 1600, 1700)
;

SELECT 	*
FROM 	DEPARTMENTS d
WHERE 	LOCATION_ID IN (SELECT 	LOCATION_ID 
						FROM 	LOCATIONS l
						WHERE 	COUNTRY_ID = 'US')
;

-- EMPLOYEES 테이블에서 Kochhar의 (last_name)의 
-- 급여보다 많은 사원의 정보를 사원번호, 이름, 담당업무, 급여를 출력하라.

SELECT 	EMPLOYEE_ID , FIRST_NAME , JOB_ID , SALARY 
FROM 	EMPLOYEES e 
WHERE 	SALARY > (	SELECT	e2.SALARY 
					FROM 	EMPLOYEES e2
					WHERE 	LAST_NAME = 'Kochhar')
;

-- EMPLOYEES테이블에서 월급이 가장 작은 사원의 first_name, last_name
SELECT  e.FIRST_NAME , e.LAST_NAME 
FROM 	EMPLOYEES e 
WHERE 	e.SALARY = ( SELECT min(SALARY) FROM EMPLOYEES e2 )
;

-- EMPLOYEES테이블에서 월급이 가장 많은 사원의 
-- first_name, last_name, job_title(jobs table)
SELECT  e.FIRST_NAME , e.LAST_NAME, j.JOB_TITLE 
FROM 	EMPLOYEES e 
	INNER JOIN JOBS j 
	ON e.JOB_ID  = j.JOB_ID 
WHERE 	e.SALARY = ( SELECT max(SALARY) FROM EMPLOYEES e2 )
;

-- 평균 급여보다 많이 받는 사원들의 first_name, last_name, job_title(jobs table)
SELECT  e.FIRST_NAME , e.LAST_NAME, j.JOB_TITLE 
FROM 	EMPLOYEES e 
	INNER JOIN JOBS j 
	ON e.JOB_ID  = j.JOB_ID 
WHERE 	e.SALARY > ( SELECT AVG(SALARY) FROM EMPLOYEES e2 )
;










