# NVL
```SQL
-- nvl(): NULL���� �ٸ� �����ͷ� �����ϴ� �Լ� 
SELECT FIRST_NAME, LAST_NAME, NVL(COMMISSION_PCT, 0)
FROM EMPLOYEES e ;
```

# DECODE
```SQL
-- decode(): switch ���� ������ �ϴ� �Լ� 
SELECT DEPARTMENT_ID, 
	DECODE(DEPARTMENT_ID, 20, 'MA', 60, 'IT', 90, 'EX', 'ETC')
FROM DEPARTMENTS d 
ORDER BY ASC;
```

# CASE
```SQL
-- case()
SELECT FIRST_NAME, DEPARTMENT_ID, 
	   CASE WHEN DEPARTMENT_ID = 20 THEN 'MA'
	 	    WHEN DEPARTMENT_ID = 60 THEN 'IT'
	   		WHEN DEPARTMENT_ID = 90 THEN 'EX'
	   		ELSE ''
	   		END "department"
FROM EMPLOYEES e 
;
```

# DISTINCT, GROUP BY

```SQL
-- distinct, group by
-- distinct: ����ũ(�ߺ��� ����)�� ������(�÷��̳� ���ڵ�)�� ��ȸ�ϴ� ��쿡 ����

SELECT DISTINCT DEPARTMENT_ID 
FROM EMPLOYEES e ;

SELECT DEPARTMENT_ID 
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID ;
```

# APPLY...
```SQL
-- �μ��� �޿� �հ� 
-- SUM�� ���� ����Լ��� � ���� ���� �� ���� �ݵ�� GROUP BY�� �������� 
SELECT SUM(SALARY), DEPARTMENT_ID 
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID; 

SELECT DISTINCT DEPARTMENT_ID, SUM(SALARY)
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID ;

-- �μ��� ������� ��� �޿�, �޿��� ���� ���غ��� 
SELECT DEPARTMENT_ID 
	,  SUM(SALARY)
	,  AVG(SALARY)
	,  COUNT(SALARY) 
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID ;

-- �μ���(DEPARTMENT_ID), ���޺�(JOB_ID)
-- �����, ��ձ޿�, �޿���
SELECT DEPARTMENT_ID, JOB_ID 
	,  TO_CHAR(SUM(SALARY), '999,999') totalSalary -- TO_CHAR() �� ���ؼ� �������� ���������� ��ȯ
	,  AVG(SALARY)
	,  COUNT(SALARY)
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID , JOB_ID  
ORDER BY DEPARTMENT_ID DESC, JOB_ID 
;

SELECT DEPARTMENT_ID, JOB_ID 
	,  TO_CHAR(SUM(SALARY), '999,999') totalSalary -- TO_CHAR() �� ���ؼ� �������� ���������� ��ȯ
	,  SUM(SALARY)
	,  AVG(SALARY)
	,  COUNT(SALARY)
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID = 80
GROUP BY DEPARTMENT_ID , JOB_ID  
ORDER BY DEPARTMENT_ID DESC, JOB_ID 
;
``` 

# HAVING
```SQL
-- having ��
-- ���� �μ��� ����� 
/*
 * WHERE �������� �����Լ��� ����� �� ����. 
 * �����Լ��� ����� ���� HAVING���� ����� ������ ���Ѵ�. 
 */
SELECT DEPARTMENT_ID 
	,  COUNT(*) 
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID IS NOT NULL 
	-- AND COUNT(*) >= 10
GROUP BY DEPARTMENT_ID 
HAVING COUNT(*) >= 10 
;
``` 

# JOIN

### WHAT IS JOIN? 
�ΰ� �̻��� ���̺��� ���� �����Ͽ� �����͸� �˻��� �� ����ϴ� �������, �� ���� ���̺��� ��ġ �ϳ��� ���̺��� ��ó�� �����ִ� ���̴�. 

### JOIN�� �⺻ ��� ���
�� ���� ���̺� �ϳ��� ���� �÷��� �־�� �Ѵ�.
�� �÷��� ���� ���� �Ǿ�� �Ѵ�. 
���� ������ ���� �⺻Ű(PRIMARY KEY)�� �ܷ�Ű(FOREIGN KEY)�� Ȱ���Ѵ�. 

### INNER JOIN 
�� ���̺��� ���� ���ǿ� ��ġ�Ǵ� �����͸� �����´�
�������� �����ϸ� ���ϴ�. 

### OUTER JOIN
���� ���ǿ� ��ġ�ϴ� �����Ϳ� ��ġ���� ���� �����͸� ��� SELECT�Ѵ�.
�׷��� ������, OUTER JOIN�� INNER JOIN���� �ٸ��� ��(MAIN) ���̺��� � ���̺������� �߿��ϴ�. �׷��� � ���̺��� �߽��̳Ŀ� ���� LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN���� ����ȭ �� �� �ִ�. LEFT OUTER JOIN�� ���ʿ� �ִ� ���̺���, RIGHT OUTER JOIN�� �����ʿ� �ִ� ���̺���, FULL OUTER JOIN�� ���� ��ΰ� ���� ���̺��� �ȴ�. 



