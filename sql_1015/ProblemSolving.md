# SOLVE PROBLEM
```SQL
-- 문제 --
-- 1. EMPLOYEE 테이블에서 JOB_ID가 'SA'로 시작하는 사람에 대하여
-- 급여의 평균, 최고액, 최저액, 합계를 구하여 출력하라 
SELECT JOB_ID 
	, AVG(SALARY)
	, MAX(SALARY)
	, MIN(SALARY)
	, SUM(SALARY)
FROM EMPLOYEES e 
WHERE JOB_ID LIKE 'SA%'
GROUP BY JOB_ID ;

-- 문제4. employees 테이블에서 각 부서별로 인원수,
-- 급여의 평균, 최저급여, 최고급여, 급여의 합을 구하여 급여의 합이 많은 
-- 순으로 출력하라.
SELECT DEPARTMENT_ID 
	, COUNT(*)
	, AVG(SALARY)
	, MIN(SALARY)
	, MAX(SALARY)
	, SUM(SALARY) AS "TOTALS"
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
ORDER BY TOTALS DESC;

-- 문제6. employees 테이블에서 부서별, 업무별 그룹하여 결과를 부서번호,
-- 업무, 인원수, 급여의 평균, 급여의 합을 구하여 출력하라.
SELECT DEPARTMENT_ID, JOB_ID
	,  COUNT(*)
	,  AVG(SALARY)
	,  SUM(SALARY)
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID, JOB_ID ;

-- 문제7. employees 테이블에서 부서 인원이 4보다 많은 부서의 부서번호,
-- 인원수, 급여의 합을 구하여 출력하라.
SELECT DEPARTMENT_ID
	, COUNT(*)
	, SUM(SALARY)
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
HAVING COUNT(*) > 4 
ORDER BY COUNT(*) ASC
;

-- 문제8. employees테이블에서 급여가 최대 10000이상인 부서에 대해서
-- 부서번호, 평균 급여, 급여의 합계 구하여 출력하라.
SELECT DEPARTMENT_ID 
	,  AVG(SALARY)
	,  SUM(SALARY)
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
HAVING MAX(SALARY) > 10000;
```
