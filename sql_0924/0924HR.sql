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

SELECT employee_id-99 AS �����ȣ, 
    salary AS �޿�, 
    salary+5000 AS �߰��λ�, 
    salary*1.1 AS �����޿�
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






