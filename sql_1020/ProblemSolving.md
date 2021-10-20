# Problem Solving

Using Sub-Query

## ���� 1. employees ���̺��� �޿��� ��պ��� ���� ����� �����ȣ, �̸�, ������, �޿�, �μ���ȣ ���
```sql
SELECT EMPLOYEE_ID , 
	   FIRST_NAME || ' ' || LAST_NAME AS NAME , 
	   JOB_ID ,
	   SALARY ,
	   DEPARTMENT_ID 
FROM EMPLOYEES e 
WHERE SALARY < (SELECT AVG(SALARY)
				FROM EMPLOYEES e2)
ORDER BY SALARY DESC
;
```
## ��2. EMPLOYEES ���̺��� 100�� �μ��� �ּ� �޿����� �ּ� �޿��� ���� �ٸ� ��� �μ��� ����϶�
```sql
SELECT DEPARTMENT_ID 
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID 
HAVING MIN(SALARY) > (SELECT MIN(SALARY)
					 FROM EMPLOYEES e2 
					 WHERE DEPARTMENT_ID = 100)
;
```
## ��3. EMPLOYEES ���̺��� ���� ���� ����� ���� Manager�� �����ȣ�� ����϶�.
```sql
SELECT e.EMPLOYEE_ID 
FROM EMPLOYEES e 
WHERE MANAGER_ID = (SELECT MANAGER_ID
					FROM EMPLOYEES e 		
					GROUP BY MANAGER_ID 
					HAVING COUNT(MANAGER_ID) = (SELECT MAX(COUNT(MANAGER_ID))
												FROM EMPLOYEES e 
												GROUP BY MANAGER_ID));
```
## ��4. EMPLOYEES ���̺��� ���� ���� ����� �����ִ� �μ� ��ȣ�� ������� ����϶�
```sql
SELECT e.DEPARTMENT_ID , COUNT(e.DEPARTMENT_ID)
FROM EMPLOYEES e
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID 
HAVING COUNT(DEPARTMENT_ID) = (SELECT MAX(COUNT(DEPARTMENT_ID))
							   FROM EMPLOYEES e2	
							   GROUP BY DEPARTMENT_ID)
;
```
## ��5. EMPLOYEES ���̺��� �����ȣ�� 123�� ����� ������ ����, �����ȣ�� 192�� ����� �޿�(sal)���� ���� ����� �����ȣ, �̸�, ����, �޿��� ����϶�
```sql
SELECT e.EMPLOYEE_ID ,
	   e.FIRST_NAME || ' ' || e.LAST_NAME ,
	   e.JOB_ID ,
	   e.SALARY 
FROM EMPLOYEES e 
WHERE e.JOB_ID = (SELECT JOB_ID 
				  FROM EMPLOYEES e2
				  WHERE e2.EMPLOYEE_ID = 123)
AND e.SALARY > (SELECT SALARY 
				FROM EMPLOYEES e3
				WHERE e3.EMPLOYEE_ID = 192)
;
```