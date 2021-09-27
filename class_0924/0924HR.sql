SELECT
    *
FROM employees;

SELECT employee_id, 
    first_name || ' ' || last_name,
    email || '@' || 'naver.com'
FROM employees;

SELECT employee_id, 
    salary, salary+5000, salary*1.1
FROM employees;

SELECT employee_id-99 AS 사원번호, 
    salary AS 급여, 
    salary+5000 AS 추가인상, 
    salary*1.1 AS 조정급여
FROM employees;


SELECT employee_id,
    first_name,
    salary   
FROM employees
WHERE employee_id > 100 AND salary > 5000;

SELECT employee_id,
    first_name,
    salary   
FROM employees
WHERE salary IN(10000, 17000, 24000);

SELECT *

FROM employees
WHERE job_id LIKE 'AD%';






