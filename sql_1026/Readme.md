# INDEX
 ### index��
  - ��ȸ�ӵ��� ����Ű�� ���� �����ͺ��̽� �˻� ���
  - �����̶�� ������ �ش� ���̺��� ��ȸ����� ������ �ϱ� ���� ����Ѵ�.
  - �ε����� ������ �����ν� ��ȸ �ӵ��� ������ �� �� �ִ�.
  - index�� ���̺��� Ư�� �÷��� �Ѱ��̻� �ְ� �Ǹ� index table�� ���� ����� ����, �ε��� �÷��� �ο찪�� rowid ���� ����Ǹ� �ο찪�� ���ĵ� Ʈ�� ������ ������� �ξ��ٰ� �˻��� �� �� ������ �ش� �����͸� ã�µ� ������ �ش�.
  - ������ DML����� ��� �Ҷ��� ���� Table�� ���� Index Table���� ����Ÿ�� ���Ž��� �־�� �ϱ� ������ update, insert, delete(DML) ����� ���� �ӵ��� �������ٴ� ������ �ִ�.

 ### index������ ���ʿ��� ���
  - �����Ͱ� ����(��õ�� �̸�) ��쿡�� �ε����� �������� �ʴ°� ������ ������ ����.
  - ��ȸ ���� ����, ����, ���� ó���� ���� ���̺�

  - delete : �ε��������� �����͸� ������� �������� ǥ���ϰ� �������� �ʴ´�.
  - insert : split�������� ���ϰ� �ɸ���. 
  - update : �ε��������� delete�� �� ��, ���ο� �����͸� insert�۾��� ��

  ### index ����

   - Unique �ε����� �ε����� ����� �÷��� �ߺ������� �������� �ʰ� ����� �� �ִ� ������ �ִ�.
```SQL
	create unique index �ε����� on ���̺��(�÷�);
```

   - Non-unique �ε����� �ε����� ����� �÷��� �ߺ� ������ ���� ���� �� �ִ�.
```SQL
	create index �ε����� on ���̺��(�÷�);
```

 ## INDEX ��뿹��
 ```SQL
 -- index
 1. ���̺� ����
CREATE TABLE EMPLOYEES4 AS SELECT * FROM EMPLOYEES e ;

2. ��� ���̺��� ROWID�� �ִ�. �ٸ� ������ ���� ��
SELECT 	rowid, EMPLOYEE_ID 
FROM 	EMPLOYEES4 e
--WHERE 	EMPLOYEE_ID = 200
;

3. �����͸� �־��ش�. �̶�, EMPLOYEE_ID���� �ߺ����� �������. 
INSERT INTO EMPLOYEES4 (employee_id, FIRST_NAME, LAST_NAME)
VALUES (100, 'Steven', 'King')
;

4. UNIQUE INDEX �� ����� �ش�. ��, �ߺ����� �� �� ���� �ε����̴�. �̶� ��� ���� �ߺ� EMPLOYEE_ID���� �־���� ������ ������ �����. ������ ������ 'DUPLICATE KEYS FOUND'.
CREATE UNIQUE INDEX idx_employee3_id 
ON EMPLOYEES4(employee_id); -> �ٷ� ���⼭ EMPLOYEE_ID�� �ε��������� �ϱ� �����̴�. 

5. ����, UNIQUE INDEX ������ �ȵ� �� �츮�� 3������ ������� ������ ���� ������Ŵ���ν� �ߺ����� ������ �� �ִ�. �ߺ����� ���ְ� �ٽ� 4���� �����ϸ� �� �ȴ�.  
DELETE FROM EMPLOYEES4 e 
WHERE 	FIRST_NAME = 'Steven'
AND 	EMAIL IS NULL 
;

SELECT * FROM EMPLOYEES4 ORDER BY EMPLOYEE_ID ;

SELECT * FROM EMPLOYEES4 WHERE EMPLOYEE_ID = 100;

CREATE INDEX idx_employee4_name 
ON EMPLOYEES4(first_name);
```