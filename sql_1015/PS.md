# SOLVE PROBLEM
```SQL
-- ���� --
-- 1. EMPLOYEE ���̺��� JOB_ID�� 'SA'�� �����ϴ� ����� ���Ͽ�
-- �޿��� ���, �ְ��, ������, �հ踦 ���Ͽ� ����϶� 
SELECT JOB_ID 
	, AVG(SALARY)
	, MAX(SALARY)
	, MIN(SALARY)
	, SUM(SALARY)
FROM EMPLOYEES e 
WHERE JOB_ID LIKE 'SA%'
GROUP BY JOB_ID ;

-- ����4. employees ���̺��� �� �μ����� �ο���,
-- �޿��� ���, �����޿�, �ְ�޿�, �޿��� ���� ���Ͽ� �޿��� ���� ���� 
-- ������ ����϶�.
SELECT DEPARTMENT_ID 
	, COUNT(*)
	, AVG(SALARY)
	, MIN(SALARY)
	, MAX(SALARY)
	, SUM(SALARY) AS "TOTALS"
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
ORDER BY TOTALS DESC;

-- ����6. employees ���̺��� �μ���, ������ �׷��Ͽ� ����� �μ���ȣ,
-- ����, �ο���, �޿��� ���, �޿��� ���� ���Ͽ� ����϶�.
SELECT DEPARTMENT_ID, JOB_ID
	,  COUNT(*)
	,  AVG(SALARY)
	,  SUM(SALARY)
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID, JOB_ID ;

-- ����7. employees ���̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ,
-- �ο���, �޿��� ���� ���Ͽ� ����϶�.
SELECT DEPARTMENT_ID
	, COUNT(*)
	, SUM(SALARY)
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
HAVING COUNT(*) > 4 
ORDER BY COUNT(*) ASC
;

-- ����8. employees���̺��� �޿��� �ִ� 10000�̻��� �μ��� ���ؼ�
-- �μ���ȣ, ��� �޿�, �޿��� �հ� ���Ͽ� ����϶�.
SELECT DEPARTMENT_ID 
	,  AVG(SALARY)
	,  SUM(SALARY)
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
HAVING MAX(SALARY) > 10000;
```
