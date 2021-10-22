# �⺻Ű(primary key)

### WHAT IS PRIMARY KEY?
-  �⺻Ű ���� �⺻���� ���� ���ǵ��� ���̺��� �����Ҷ� ����
�����Ѵ�.
- ���̺�� �ϳ��� ���� �����ϴ�.(�ΰ� �̻��� PK�� ����Ű/����Ű
��� �Ҹ��ϴ�. ��� �ϳ��� ���ϴ�.)
- PK�� NOT NULL + Unique (+ index)�� ����� ������ �ִ�.
- ��Ű/�⺻Ű/pk/�ĺ��� �� ���� �Ҹ��� �ִ�.
- �ڵ� INDEX�� �����̵Ǵµ� �̴� �˻� Ű�μ� �˻� �ӵ��� ����Ų��.

### �⺻Ű ������
```SQL
create table consTest{
    pkCol1	char(8) PRIMARY KEY,
    pkCol2	char(8),
    pkCol3  NUMBER CONSTRAINT constText_pk3 PRIMARY KEY,
        
    CONSTRAINT pk_code PRIMARY KEY(pkCol2)
}
```
```SQL
-> 1) �÷��� ���� �ٷ� ��Ű�� �����Ѵ�.
-> 2) CONSTRAINT [�������Ǹ�] PRIMARY KEY(�÷���)
-> 3) [�ش��÷�][Ÿ��] CONSTRAINT [�������Ǹ�] PRIMARY KEY
-> 4) ALTER TABLE [���̺��] ADD CONSTRAINT [�������Ǹ�]PRIMARY KEY (�÷���)
```

�⺻Ű ����
```SQL
CREATE TABLE primary_test(
	studentid 	number(10) PRIMARY KEY,
	name		varchar2(20)
);

CREATE TABLE primary_test2(
	studentid 	number(10) ,
	name		varchar2(20),
	CONSTRAINTS student_pk PRIMARY KEY (studentid)
);

CREATE TABLE primary_test3(
	studentid 	number(10) ,
	name		varchar2(20)
);

-- ���̺��� �����ϰ� ���� ���Ŀ� �⺻Ű�� �����ϴ� ���
ALTER TABLE PRIMARY_TEST3 ADD CONSTRAINTS 
	studnetn_pk3 PRIMARY KEY (studentid); 
```

# FOREIGN KEY(�ܷ�Ű)

## FOREIGN KEY ��
- �ܺ�Ű, �ܷ�Ű, ����Ű, �ܺ� �ĺ��� ������ �Ҹ���. ���� FK��� �Ѵ�.
- FK�� ���ǵ� ���̺��� �ڽ� ���̺��̶�� Ī�Ѵ�.
- �����Ǵ� ���̺� �� PK�� �ִ� ���̺��� �θ� ���̺� �̶� �Ѵ�.
- �θ����̺��� PK�÷��� �����ϴ� �����͸� �ڽ����̺� �Է��� �� �ִ�.
- �θ����̺��� �ڽ��� �����ͳ� ���̺��� �����ȴٰ� ������ ���� �ʴ´�.
- �����ϴ� ������ �÷��� ������ Ÿ���� �ݵ�� ��ġ�ؾ� �Ѵ�.
- ������ �� �ִ� �÷��� �⺻Ű(PK) �̰ų� UNIQUE �� �����ϴ�.
    (���� PK�� ���´�)

## �ܷ�Ű ���� ���
```SQL
create table parentTable(
    parentPK 	NUMBER 	PRIMARY KEY
);

create table constTest(
    parentPK	NUMBER,
    
    CONSTRAINTS fk_code FOREIGN KEY(parentPK)
    REFERENCES parentTable(parentPK) ON DELETE CASCADE
);
```
```SQL
-> CONSTRAINTS [FK�̸�] FOREIGN KEY(�ڽ� �÷�)
    REFERENCES [�θ����̺�](�θ� �÷�) ON DELETE CASCADE
```
- ������ �÷��� ���� �÷��� �ڽ� ���̺� �����ؾ� �Ѵ�. (���� �̸��� ���ʿ�� ������, ���踦 �˾ƺ��� ���� ���� �÷����� ����Ѵ�.)
- �ڽ����̺� ���� ���� ������ ����.
- �����Ǵ� �÷��� �����Ͱ� �־�� ���� ���� �� �ִ�.

### ���̺� ���� �� ����
```SQL
CONSTRAINTS �ܷ�Ű �̸� FOREIGN KEY(�÷���) 
REFERENCES ���� ���̺��(�����÷�)
```

### ���̺� ���� �� ����
```SQL
ALTER TABLE ���̺�� 
ADD CONSTRAINTS �ܷ�Ű �̸� FOREIGN KEY (�����÷�) 
REFERENCES ���� ���̺��(�����÷�)
```

## ON DELETE CASCADE
�����Ǵ� �θ� ���̺��� �࿡ ���� DELETE�� ����Ѵ�. ��, �����Ǵ� �θ����̺� ���� �����Ǹ� ���������� �ڽ����̺� �� ���� �����ȴ�.

```SQL
CREATE TABLE DADDY(
	IDX 	NUMBER(10),
	mID		NUMBER(10) PRIMARY key
);

CREATE TABLE daughter(
	IDX		NUMBER(10) PRIMARY KEY,
	mID		NUMBER(10),
	CONSTRAINTS FK_DA FOREIGN KEY(mID) 
	REFERENCES DADDY(mID) ON DELETE CASCADE 
);

INSERT INTO DADDY VALUES (1, 10);
INSERT INTO DADDY VALUES (2, 20);

INSERT INTO DAUGHTER VALUES (100, 10);
INSERT INTO DAUGHTER VALUES (101, 10);
INSERT INTO DAUGHTER VALUES (102, 10);
INSERT INTO DAUGHTER VALUES (200, 20);
INSERT INTO DAUGHTER VALUES (300, 30); -- �ԷºҰ� 

SELECT * FROM DAUGHTER d ;

DELETE FROM DAUGHTER d WHERE IDX = 100;
DELETE FROM DADDY d2 WHERE IDX = 1; -- daughter�� mID�� 10�� ��� �����Ͱ� ��������. 
```

## ON DELETE SET NULL
�����Ǵ� �θ� ���̺��� �࿡ ���� DELETE�� ����Ѵ�. �̰� CASCADE�� �ٸ��� �θ����̺��� ���� �����Ǹ� �ش� �����ϴ� �ڽ����̺��� ���� NULL������ �����ȴ�.

```sql
CREATE TABLE DADDY2(
	IDX 	NUMBER(10),
	mID		NUMBER(10) PRIMARY key
);

CREATE TABLE daughter2(
	IDX		NUMBER(10) PRIMARY KEY,
	mID		NUMBER(10),
	CONSTRAINTS FK_DA2 FOREIGN KEY(mID) 
	REFERENCES DADDY2(mID) ON DELETE SET NULL
);

INSERT INTO DADDY2 VALUES (1, 10);
INSERT INTO DADDY2 VALUES (2, 20);
INSERT INTO DAUGHTER2 VALUES (100, 10);
INSERT INTO DAUGHTER2 VALUES (101, 10);
INSERT INTO DAUGHTER2 VALUES (102, 10);
INSERT INTO DAUGHTER2 VALUES (200, 20);
INSERT INTO DAUGHTER2 VALUES (300, 30); -- ���� �Է� �ȵ�.

DELETE FROM DAUGHTER2 d WHERE IDX = 100;
DELETE FROM DADDY2 d2 WHERE IDX = 1;

SELECT * FROM DAUGHTER2 d ;
```

# VIEW

### View�� Ȱ��
- ���Ȱ����� ���� ��
-> ���� ��޿� ���߾� �÷� �� ������ ���Ͽ� ��ȸ �ϵ��� ��
-> �������� �����ϰ� �˰����� ����� ���� ���
-> select list�� �Լ��� �����Ͽ� update, insert�� ���ϵ��� ��
-> ���̺� ���̳� �÷� ���� ���⵵�� ��

- ������Ǽ��� ���� ��
-> �˻� ������ �ܼ�ȭ�Ͽ� ����� �� �ֵ��� ��
-> ������ �ܼ�ȭ
-> ����ڸ� ���� �÷����̳� ���̺�� ����




























