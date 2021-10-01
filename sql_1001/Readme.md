# ��ȯ�Լ�

SQL�� ������ Ÿ���� �����ϰ� �ִ�. ���� ������ ���� ��ȯ�� �ʿ䰡 �����, �ڵ����� (������)��ȯ�ǰų� ����ڰ� �������� (�����)��ȯ�ϴ� �� ���� ��찡 �ִ�. 

'1234' -> 1234

```SQL
SELECT 1 + '2'
FROM dual;

-- 3
```
�ڵ����� ���ڿ� ���ڸ� ���ؼ� 3�� ����Ѵ�. �̰��� ������ ����ȯ�̴�. �׷���, �ڵ����� �����͸� Ÿ�Ժ�ȯ �� �� �ִٰ� �ϴ��� �������� ������Ÿ�� ��ȯ�� �����ϴ� ���� �����ϴ�.

# ��¥�� �ð� ���� ��ȯ

TO_~~ : ��¥ ���� ���ڰ��� ���ڿ��� ��ȯ�ϴ� �Լ� 
```SQL
1) ���ڷ� 
SELECT TO_CHAR(SYSDATE, 'YYYY'),
       TO_CHAR(SYSDATE, 'MM')
FROM dual;

-- 2021 | 10

2) ���ڷ� 
SELECT TO_NUMBER('123')
FROM dual;

-- 123 

3) ��¥�� 
SELECT TO_DATE('20211001','YYMMDD')
FROM dual;

-- 21/10/01
```

# NOT NULL ó��

Ư�� ���� �࿡ ������ ���� ������ NULL�� �ȴ�. NULL�� 0�� �ƴ϶�, ���� **�ƹ��͵� ���� ����**�� �̸��� Ű�����̴�. �� �����͸� �ٷ� �� NULL�� ������ ������ ó���� ��������Ƿ� ���̺��� ���� �Ҷ� NULL���� ������ ���ϰ� ������ �� �ִ�. 

NULL�� ��� ����̵� ������ �Ұ����� �� 
0�̳� ������ �ƴϱ� ������, NULL���� �����ϴ� ������ ����� NULL�̴�. 

```SQL
SELECT *
FROM employees
ORDER BY commission_pct;

SELECT salary * commission_pct
FROM employees
ORDER BY commission_pct;

-- COMMISSION_PCT�� NULL �ƴ� ��� ����� ����� ������, NULL�϶� NULL�� ���ȴ�. ���� ��쿡 ���� NULL�� �ٸ� ������ ��ü�ؾ� �� ��찡 �ִ�. �׷��� ��쿡 �������� ����� ����� �� �ִ�.

1) NVL(a,b)�� a�� null�� ��� b�� ���� ��ü�ϴ� �Լ��̴�. 

SELECT salary * NVL(commission_pct, 1)
FROM employees
ORDER BY commission_pct;

2) DECODE : ���ǳ�ó��. IF ELSE �� �����ϰ� ����ϸ�, SQL�� �ۼ��� ���� ���ȴ�. 

DECODE(A,B,C,D)����

SELECT first_name,
       salary,
       department_id,
       DECODE(department_id, 60, salary*1.1, salary),
       DECODE(department_id, 60,'10& UP', 'None')
FROM employees;
``` 

CASE -> ������ �� ó�� 