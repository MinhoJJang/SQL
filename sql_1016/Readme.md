# OUTER JOIN
**OUTER JOIN의 경우, 일반적으로 LEFT OUTER JOIN만 알고 있어도 대부분의 쿼리문을 수행 가능하다. 사실상 LEFT나 RIGHT나 순서만 다른 것이기 때문에 큰 의미가 없고, FULL OUTER JOIN은 거의 할 일이 없다시피하므로 LEFT만 제대로 익히자. (leftjoin.jpg참고)**

### 1.1 LEFT OUTER JOIN
```SQL
SELECT *
FROM TABLE_A t1
     LEFT OUTER JOIN TABLE_B t2
     ON t1.AColumn = t2.BColumn
```
오른쪽 테이블이 기준이 된다. 
조인 조건에 부합하는 데이터가 조인 당하는 테이블 (오른쪽 테이블)에 있으면 해당 데이터를 SELECT하고, 데이터가 없다면 NULL로 SELECT된다.

### 1.2 RIGHT OUTER JOIN
```SQL
SELECT *
FROM TABLE_A t1
     RIGHT OUTER JOIN TABLE_B t2
     ON t1.AColumn = t2.BColumn
```
오른쪽 테이블이 기준이 된다. 
조인 조건에 부합하는 데이터가 조인 당하는 테이블 (왼쪽 테이블)에 있으면 해당 데이터를 SELECT하고, 데이터가 없다면 NULL로 SELECT된다. 

### 1.3 FULL OUTER JOIN
```SQL
SELECT *
FROM TABLE_A t1
     FULL OUTER JOIN TABLE_B t2
     ON t1.AColumn = t2.BColumn
```
양쪽 테이블 모두가 기준이 된다. 
조인 조건에 부합하는 데이터가 조인 당하는 테이블(왼쪽, 오른쪽)에 있으면 해당 데이터를 SELECT하고, 데이터가 없다면 NULL로 SELECT된다. 
-> 그러니까 FULL OUTER JOIN은 그냥 테이블에 있는 모든 것을 합치는 것이다. (합집합)

# INNER JOIN

```SQL
SELECT e.FIRST_NAME , e.LAST_NAME , e.DEPARTMENT_ID ,
	   d.DEPARTMENT_NAME, d.LOCATION_ID, 
	   l.CITY,
	   j.JOB_ID, j.JOB_TITLE 
FROM EMPLOYEES e 
	INNER JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
	INNER JOIN LOCATIONS l 
	ON d.LOCATION_ID = l.LOCATION_ID 
	INNER JOIN JOBS j 
	ON j.JOB_ID = e.JOB_ID 
WHERE l.CITY = 'Seattle'
ORDER BY DEPARTMENT_ID ASC
;
```
위 쿼리는 INNER JOIN, 즉 두 집합의 교집합을 가져오는 쿼리문이다. 

# Problem Solving
-- 문제 1: 사원들의 이름(EMPLOYEES), 부서번호(EMPLOYEES, DEPARTMENTS), 부서명(DEPARTEMENTS)를 출력
```sql
-- SOLVE 1
SELECT e.FIRST_NAME || ' ' || e.LAST_NAME NAME, 
	   d.DEPARTMENT_ID , d.DEPARTMENT_NAME 
FROM EMPLOYEES e 
	LEFT OUTER JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
	WHERE d.DEPARTMENT_ID IS NOT NULL
;

-- SOLVE 2
SELECT e.FIRST_NAME || ' ' || e.LAST_NAME NAME, 
	   d.DEPARTMENT_ID , d.DEPARTMENT_NAME 
FROM EMPLOYEES e 
	INNER JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
;
```