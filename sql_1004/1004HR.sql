SELECT
    *
FROM employees;

SELECT
    *
FROM employees A, departments B
WHERE A.department_id = B.department_id;

-- SELECT가 가져오는 데이터 범위설정
SELECT a.department_id, b.department_id
FROM employees A, departments B
WHERE a.department_id = b.department_id;

SELECT A.employee_id, A.department_id,
       B.department_name, C.location_id, C.city 
FROM employees A, departments B, locations C
WHERE A.department_id = B.department_id
AND B.location_id = C.location_id;

SELECT COUNT(*)
FROM employees A, departments B
WHERE a.department_id = b.department_id; 
-- 106개 
--> 즉 department_id 중에서 null값이 하나 있음을 알 수 있다.

SELECT COUNT(*) 
FROM employees;
-- 107개

--Self Join

SELECT A.employee_id, A.first_name, A.last_name, A.manager_id,
        B.manager_id, B.first_name || ' ' || B.last_name manager_name
FROM employees A, employees B
WHERE A.manager_id = B.manager_id;

-- 동일한 employees 테이블을 사용하여 A 테이블은 manager_id,
-- B테이블은 employee_id 로 조인하여 매니저가 누구인지 이름을 출력
