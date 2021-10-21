-- DDL

-- ���̺� ����
CREATE TABLE EMPLOYEES2(
	employee_id		number(10),
	name			varchar2(20),
	salary			number(7,2)
);

CREATE TABLE EMPLOYEES3(
	employee_id		number(10),
	name			varchar2(20),
	salary			number(7,2),
	create_date		DATE	DEFAULT sysdate 
);

-- ���� ���̺�� �����ϰ� �ۼ� 
CREATE TABLE employees3 
AS 
SELECT * FROM EMPLOYEES2 e ;

-- �÷��߰�
ALTER TABLE EMPLOYEES2 ADD(
	manager_id 	varchar2(10)
);

ALTER TABLE EMPLOYEES2 modify(
	manager_id 	varchar2(20)
);

-- �÷� ����
ALTER TABLE EMPLOYEES2 DROP COLUMN manager_id;

SELECT * FROM EMPLOYEES2;

INSERT INTO EMPLOYEES2 
VALUES (4, '�׽�Ʈ', 30000);

INSERT INTO EMPLOYEES3 (employee_id, name)
VALUES (4, '�׽�Ʈ');

-- DELETE FROM EMPLOYEES2 e WHERE EMPLOYEE_ID  = 1;

-- ������ ����
-- TRUNCATE TABLE EMPLOYEES2 ;

-- ���̺� ����
-- DROP TABLE EMPLOYEES3 ;