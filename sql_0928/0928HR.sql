SELECT job_id, 
SUBSTR(job_id,1,2)
FROM employees;


SELECT job_id,
REPLACE(job_id, 'ACCOUNT', 'ACCNT')
FROM employees;


SELECT first_name,
LPAD(first_name, 9, ' ')
FROM employees;


SELECT first_name,
LPAD(first_name, 12, '*')
FROM employees;


SELECT job_id,
    LTRIM(job_id, 'F'),
    RTRIM(job_id, 'T')
FROM EMPLOYEES;


SELECT TRIM('   -space   ')
FROM dual;

SELECT *
FROM employees;


SELECT salary,
    salary/30 DAILY
FROM employees;


SELECT salary,
    ROUND(salary/30, 2) DAILY
FROM employees;


SELECT salary,
    ROUND(salary/30, 1) DAILY1,
    ROUND(salary/30, 0) DAILY0,
    ROUND(salary/30, -1) DAILYm1
FROM employees;

