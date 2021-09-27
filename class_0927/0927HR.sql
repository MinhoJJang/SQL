SELECT *
FROM employees;

SELECT *
FROM employees
WHERE manager_id IS NULL;


SELECT *
FROM employees
WHERE salary > 4000 
AND job_id = 'IT_PROG';

SELECT *
FROM employees
WHERE salary > 3000
AND job_id = 'IT_PROG' OR job_id = 'FI_ACCOUNT';

SELECT *
FROM employees
WHERE job_id != 'IT_PROG' AND job_id <> 'FI_ACCOUNT';

SELECT last_name,
     LOWER(last_name),
     UPPER(last_name),
     email,
     LOWER(email)
FROM employees;

 SELECT job_id,
        SUBSTR(job_id, 1, 2)
    FROM employees; 