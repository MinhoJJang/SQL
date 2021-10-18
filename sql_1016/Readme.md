# OUTER JOIN
**OUTER JOIN�� ���, �Ϲ������� LEFT OUTER JOIN�� �˰� �־ ��κ��� �������� ���� �����ϴ�. ��ǻ� LEFT�� RIGHT�� ������ �ٸ� ���̱� ������ ū �ǹ̰� ����, FULL OUTER JOIN�� ���� �� ���� ���ٽ����ϹǷ� LEFT�� ����� ������. (leftjoin.jpg����)**

### 1.1 LEFT OUTER JOIN
```SQL
SELECT *
FROM TABLE_A t1
     LEFT OUTER JOIN TABLE_B t2
     ON t1.AColumn = t2.BColumn
```
������ ���̺��� ������ �ȴ�. 
���� ���ǿ� �����ϴ� �����Ͱ� ���� ���ϴ� ���̺� (������ ���̺�)�� ������ �ش� �����͸� SELECT�ϰ�, �����Ͱ� ���ٸ� NULL�� SELECT�ȴ�.

### 1.2 RIGHT OUTER JOIN
```SQL
SELECT *
FROM TABLE_A t1
     RIGHT OUTER JOIN TABLE_B t2
     ON t1.AColumn = t2.BColumn
```
������ ���̺��� ������ �ȴ�. 
���� ���ǿ� �����ϴ� �����Ͱ� ���� ���ϴ� ���̺� (���� ���̺�)�� ������ �ش� �����͸� SELECT�ϰ�, �����Ͱ� ���ٸ� NULL�� SELECT�ȴ�. 

### 1.3 FULL OUTER JOIN
```SQL
SELECT *
FROM TABLE_A t1
     FULL OUTER JOIN TABLE_B t2
     ON t1.AColumn = t2.BColumn
```
���� ���̺� ��ΰ� ������ �ȴ�. 
���� ���ǿ� �����ϴ� �����Ͱ� ���� ���ϴ� ���̺�(����, ������)�� ������ �ش� �����͸� SELECT�ϰ�, �����Ͱ� ���ٸ� NULL�� SELECT�ȴ�. 
-> �׷��ϱ� FULL OUTER JOIN�� �׳� ���̺� �ִ� ��� ���� ��ġ�� ���̴�. (������)

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
�� ������ INNER JOIN, �� �� ������ �������� �������� �������̴�. 

# Problem Solving
-- ���� 1: ������� �̸�(EMPLOYEES), �μ���ȣ(EMPLOYEES, DEPARTMENTS), �μ���(DEPARTEMENTS)�� ���
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