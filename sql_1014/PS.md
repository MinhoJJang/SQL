# Problem Solving

``` sql
-- table : EMPLOYEES 
-- 1. ������(SALARY) 12000 �̻�Ǵ� �������� LAST_NAME, 
-- table : EMPLOYEES 
-- 1. ������(SALARY) 12000 �̻�Ǵ� �������� LAST_NAME, 
-- ������ ��ȸ�Ѵ�
SELECT LAST_NAME, SALARY 
FROM EMPLOYEES e 
WHERE SALARY >= 12000;

-- 2. �����ȣ(EMPLOYEE_ID)�� 176�� �����
-- LAST_NAME�� �μ� ��ȣ�� ��ȸ�Ѵ�.
SELECT LAST_NAME, DEPARTMENT_ID 
FROM EMPLOYEES e 
WHERE EMPLOYEE_ID = 176;

-- 3. ������(SALARY) 5000���� 12000�� ���� �̿��� �������
-- LAST_NAME �� ������ ��ȸ�Ѵ�.
SELECT LAST_NAME , SALARY 
FROM EMPLOYEES e 
WHERE NOT (SALARY BETWEEN 5000 AND 12000);

-- 4. 20�� �� 50�� �μ�(DEPARTMENT_ID)���� �ٹ��ϴ�
-- ��� ������� LAST_NAME �� �μ� ��ȣ�� LAST_NAME�� 
-- �˹ٺ� ������ ��ȸ�Ѵ�.
SELECT LAST_NAME , DEPARTMENT_ID 
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID IN (20,50)
ORDER BY LAST_NAME ASC;

-- 5. 20�� �� 50�� �μ�(DEPARTMENT_ID)�� �ٹ��ϸ�,
-- ������ 5000 ~ 12000 ������ ������� 
-- LAST_NAME �� ������ ��ȸ�Ѵ�.
SELECT LAST_NAME , SALARY 
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID IN (20, 50)
AND SALARY BETWEEN 5000 AND 12000;

-- 6.�Ŵ����� ���� ������� LAST_NAME �� JOB_ID�� ��ȸ�Ѵ�.
SELECT LAST_NAME , JOB_ID 
FROM EMPLOYEES e 
WHERE MANAGER_ID IS NULL;

-- 7. Ŀ�̼�(COMMISSION_PCT)�� ���� ��� �������
-- LAST_NAME, ���� �� Ŀ�̼��� ���� �������� ��ȸ�Ѵ�.
SELECT LAST_NAME , SALARY , COMMISSION_PCT 
FROM EMPLOYEES e 
WHERE COMMISSION_PCT IS NOT NULL 
ORDER BY SALARY DESC; 

-- 8. LAST_NAME�� ù ���ڰ� A�� �������
-- LAST_NAME�� ��ȸ�Ѵ�.
SELECT LAST_NAME 
FROM EMPLOYEES e 
WHERE LAST_NAME LIKE 'A%'
ORDER BY LAST_NAME;
```











