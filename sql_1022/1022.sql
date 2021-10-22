-- 기본키
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
-- 테이블을 생성하고 나서 이후에 기본키를 생성하는 방법
ALTER TABLE PRIMARY_TEST3 ADD CONSTRAINTS
	studnetn_pk3 PRIMARY KEY (studentid); 


-- FK
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

INSERT INTO DAUGHTER VALUES (300, 30);
-- 불가능 

SELECT * FROM DAUGHTER d ;

DELETE FROM DAUGHTER d WHERE IDX = 100;
DELETE FROM DADDY d2 WHERE IDX = 1;
-- DELETE CASCADE 를 했기 때문에, 부모 인덱스가 1인 곳의 mID가 10이고, 그 mID를 FK로 사용한 Daughter은 mID가 10인 부분이 자동으로 사라진다.  

-------------------------------

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

INSERT INTO DAUGHTER2 VALUES (300, 30);
-- 불가능

DELETE FROM DAUGHTER2 d WHERE IDX = 100;

DELETE FROM DADDY2 d2 WHERE IDX = 1;
-- 이건 삭제되는게 아니라 NULL값이 됨 

SELECT * FROM DAUGHTER2 d ;


