# CREATE ACCOUNT 

1. sqlplus â���� system �������� �α���
Ȥ�� cmd���� �Ʒ� ��ɾ� �Է�
```
sqlplus system
```
2. ���� ���� 
```
create user testuser identified by 0000; -- ��й�ȣ
grant connect, resource to testuser;
```

# VIEW

### WHAT IS VIEW?
- view�� table�� �����ϸ�, ���̺� ó�� ����Ѵ�.
- ���̺���� �޸� �����͸� �����ϱ� ���� �������� ������ �ʿ����� ���� **�������̺�**�̴�.
- �����͸� ���������� ���� ������ ������ ������ ���´�.
- ���̺�� ���������� select, insert, update, delete����� �����ϴ�.

### VIEW ��� ���� 
```sql
CREATE VIEW v_emp(
	emp_id, first_name, job_id, hiredate, dept_id
) AS 
SELECT employee_id, first_name, job_id, hire_date, department_id
FROM EMPLOYEES 
WHERE job_id = 'ST_CLERK'
;

SELECT * FROM V_EMP ve ;

DROP VIEW V_EMP ; -- VIEW ���� 

CREATE OR REPLACE VIEW v_emp2(
	emp_id, first_name, job_id, hiredate, dept_id
) AS 
SELECT NVL(employee_id, NULL), 
	   NVL(first_name, NULL), 
	   job_id, hire_date, department_id
FROM   EMPLOYEES 
WHERE  job_id = 'ST_CLERK'
;
-- NVL�� NULL�� �κ��� ������ ������ ����ϴ� �Լ��� 

SELECT * FROM V_EMP2;

UPDATE V_EMP SET FIRST_NAME = 'KIM'
WHERE FIRST_NAME = 'James' 
;

UPDATE V_EMP2 SET FIRST_NAME = 'KIM'
WHERE FIRST_NAME = 'James'
;
-- V_EMP2������ �� ��� �Ұ���
-- NVL�� ������ �÷��� ������ �Ұ����ϴ�. 

```
# SEQUENCE

### WHAT IS SEQUENCE?
- **�ڵ����� ���������� �����ϴ� ������ ��ȯ�ϴ� �����ͺ��̽� ��ü**�̴�.
- ���� PK���� **�ߺ����� ����**�ϱ����� ����Ѵ�.
- ���������� ��ȣ�� ������ִ� ���
- EX) �Խ��ǿ� ���� �ϳ� �߰��� ������ �۹�ȣ(PK)�� ���ܾ� �ϴ� ��쿡, ���� 100������ �� ��ȣ�� �����Ǿ��ִٸ� �� ���� ���� �߰��� �Ƿ��� �� ��ȣ�� 101��, �ϳ��� row�� �������־�� �Ѵ�. �̶�, 101�̶�� ���ڸ� �������� ���� �� ��ȣ�� ���� ū ���� + 1�� �ϴ� ������ ��򰡿� �־���Ѵ�. �������� ����ϸ� �̷��� ������ �ʿ���� �����ͺ��̽��� row�� �߰��ɶ����� �ڵ����� +1�� �����ش�.

### ��������
```SQL
create sequence �������̸�
increment by n		
    -- n: �������� ���� 
    -- 2: 2�� ����
    -- �⺻�� : 1
start with n   -- ���۰� ����, �⺻�� 1
maxvalue n | nomaxvalue	������ �ִ밪 ����
             -- nomaxvalue : ���Ѵ� ��
minvalue n | nominvalue ������ �ּҰ��� ����
             -- nominvalue : ���Ѵ� ��
cycle | nocycle		�������� ��ȭ ��������� ����
             -- cycle�� ������ maxvalue�� �������� ��� �ٽ� minvalue���� ����
cache n | nocache	�������� �ӵ��� ���������� ĳ�̿��� ����
```

### SEQUENCE ��� ���� 

```SQL

CREATE SEQUENCE SEQ_SERIAL_NO
INCREMENT BY 1
START WITH 100
MAXVALUE 110
MINVALUE 90
CYCLE 
CACHE 2
;

CREATE TABLE GOOD(
	GOOD_NO 	NUMBER(3),
	GOOD_NAME 	VARCHAR(10)
)
;

INSERT INTO GOOD VALUES (SEQ_SERIAL_NO.NEXTVAL, '��ǰ1');
-- CYCLE�� �����ϱ� �� ������ �ε���, MAXVALUE ���ĺ��ʹ� MINVALUE���� ������. 

SELECT * FROM GOOD;

SELECT SEQ_SERIAL_NO.CURRVAL FROM DUAL;
INSERT INTO GOOD VALUES (SEQ_SERIAL_NO.CURRVAL, '��ǰ12');
```

