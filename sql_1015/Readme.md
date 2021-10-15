# NVL
```SQL
-- nvl(): NULL값을 다른 데이터로 변경하는 함수 
SELECT FIRST_NAME, LAST_NAME, NVL(COMMISSION_PCT, 0)
FROM EMPLOYEES e ;
```

# DECODE
```SQL
-- decode(): switch 문의 역할을 하는 함수 
SELECT DEPARTMENT_ID, 
	DECODE(DEPARTMENT_ID, 20, 'MA', 60, 'IT', 90, 'EX', 'ETC')
FROM DEPARTMENTS d 
ORDER BY ASC;
```

# CASE
```SQL
-- case()
SELECT FIRST_NAME, DEPARTMENT_ID, 
	   CASE WHEN DEPARTMENT_ID = 20 THEN 'MA'
	 	    WHEN DEPARTMENT_ID = 60 THEN 'IT'
	   		WHEN DEPARTMENT_ID = 90 THEN 'EX'
	   		ELSE ''
	   		END "department"
FROM EMPLOYEES e 
;
```

# DISTINCT, GROUP BY

```SQL
-- distinct, group by
-- distinct: 유니크(중복을 제거)한 데이터(컬럼이나 레코드)를 조회하는 경우에 사용됨

SELECT DISTINCT DEPARTMENT_ID 
FROM EMPLOYEES e ;

SELECT DEPARTMENT_ID 
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID ;
```

# APPLY...
```SQL
-- 부서별 급여 합계 
-- SUM과 같은 통계함수와 어떤 값을 같이 쓸 때는 반드시 GROUP BY로 묶어주자 
SELECT SUM(SALARY), DEPARTMENT_ID 
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID; 

SELECT DISTINCT DEPARTMENT_ID, SUM(SALARY)
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID ;

-- 부서별 사원수와 평균 급여, 급여의 합을 구해보자 
SELECT DEPARTMENT_ID 
	,  SUM(SALARY)
	,  AVG(SALARY)
	,  COUNT(SALARY) 
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID ;

-- 부서별(DEPARTMENT_ID), 직급별(JOB_ID)
-- 사원수, 평균급여, 급여합
SELECT DEPARTMENT_ID, JOB_ID 
	,  TO_CHAR(SUM(SALARY), '999,999') totalSalary -- TO_CHAR() 을 통해서 숫자형을 문자형으로 전환
	,  AVG(SALARY)
	,  COUNT(SALARY)
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID , JOB_ID  
ORDER BY DEPARTMENT_ID DESC, JOB_ID 
;

SELECT DEPARTMENT_ID, JOB_ID 
	,  TO_CHAR(SUM(SALARY), '999,999') totalSalary -- TO_CHAR() 을 통해서 숫자형을 문자형으로 전환
	,  SUM(SALARY)
	,  AVG(SALARY)
	,  COUNT(SALARY)
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID = 80
GROUP BY DEPARTMENT_ID , JOB_ID  
ORDER BY DEPARTMENT_ID DESC, JOB_ID 
;
``` 

# HAVING
```SQL
-- having 절
-- 현재 부서별 사원수 
/*
 * WHERE 절에서는 집계함수를 사용할 수 없다. 
 * 집계함수를 사용할 때는 HAVING절을 사용해 조건을 비교한다. 
 */
SELECT DEPARTMENT_ID 
	,  COUNT(*) 
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID IS NOT NULL 
	-- AND COUNT(*) >= 10
GROUP BY DEPARTMENT_ID 
HAVING COUNT(*) >= 10 
;
``` 

# JOIN

### WHAT IS JOIN? 
두개 이상의 테이블을 서로 연결하여 데이터를 검색할 때 사용하는 방법으로, 두 개의 테이블을 마치 하나의 테이블인 것처럼 보여주는 것이다. 

### JOIN의 기본 사용 방법
두 개의 테이블에 하나라도 같은 컬럼이 있어야 한다.
두 컬럼의 값은 공유 되어야 한다. 
보통 조인을 위해 기본키(PRIMARY KEY)와 외래키(FOREIGN KEY)를 활용한다. 

### INNER JOIN 
각 테이블에서 조인 조건에 일치되는 데이터만 가져온다
교집합을 생각하면 편하다. 

### OUTER JOIN
조인 조건에 일치하는 데이터와 일치하지 않은 데이터를 모두 SELECT한다.
그렇기 때문에, OUTER JOIN은 INNER JOIN과는 다르게 주(MAIN) 테이블이 어떤 테이블인지가 중요하다. 그래서 어떤 테이블이 중심이냐에 따라 LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN으로 세분화 할 수 있다. LEFT OUTER JOIN은 왼쪽에 있는 테이블이, RIGHT OUTER JOIN은 오른쪽에 있는 테이블이, FULL OUTER JOIN은 양쪽 모두가 기준 테이블이 된다. 



