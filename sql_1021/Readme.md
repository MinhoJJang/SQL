# DML 

DML이란, __Data Manipulation Language__ 의 줄임말으로, 데이터 조작어를 뜻한다. 

## 데이터 조회 및 변형을 위한 명령어

+ Select : 데이터 조회
+ Insert : 데이터 입력
+ Update : 데이터 수정
+ Delete : 데이터 삭제 

### SELECT

```sql
SELECT COLUMN1, COLUMN2
FROM   TABLE_NAME
WHERE  CONDITIONS;
```

### INSERT

```SQL
INSERT INTO TABLE_NAME (COLUMN1, COLUMN2)
VALUES (VALUE1, VALUE2);
```

### UPDATE

UPDATE명령은 사용에 주의해야 한다. 특히, 주로 SET이나 WHERE부분을 잘못 작성하여 데이터가 오염될 가능성이 있다. 
```SQL
UPDATE TABLE_NAME
SET COLUMN1 = VALUE1,
    COLUMN2 = VALUE2
WHERE CONDITIONS;
```

### DELETE

DELETE와 같은 명령은 사용에 주의하여야 한다. 특히 WHERE절의 CONDITION을 제대로 설정했는지 확인해야 한다. 
```SQL
DELETE FROM TABLE_NAME
WHERE CONDITIONS;
```

# COMMIT & ROLLBACK
// 아직 잘 이해되지 않은 부분 

### COMMIT

- 모든 작업을 정상적으로 처리하겠다고 확정하는 명령어.
- 트랜잭션의 처리 과정을 데이터베이스에 반영하기 위해서, 변경된 내용을 모두 영구 저장한다. 
- commit 수행하면, 하나의 트랜젝션 과정을 종료하게 된다.
- transaction작업 내용을 실제 DB에 저장한다.
- 이전 데이터가 완전히 update된다.
- 모든 사용자가 변경한 데이터의 결과를 볼 수 있다.

### ROLLBACK

- 작업 중 문제가 발생했을 때, 트랜젝션의 처리 과정에서 발생한 변경 사항을 취소하고, 트랜젝션 과정을 종료시킨다.
- 트랜젝션으로 인한 하나의 묶음 처리가 시작되기 이전의 상태로 되돌린다. 
- 트랜젝션 작업 내용을 취소한다.
- 이전 commit한 곳까지만 복구한다.
- 트랜젝션 작업 중 하나라도 문제가 발생하면, 모든 작업을 취소해야 하기 때문에 하나의 논리적인 작업 단위로 구성해 놓아야 한다.
- 문제가 발생하면, 논리적인 작업의 단위를 모두 취소해 버리면 되기 때문이다.

# COLUMN PROPERTIES (Integrity constraint)

### INTEGRITY

_무결성_ 이란, __데이터의 정확성, 일관성__ 을 의미한다. 즉, 데이터에 결함이 없는 상태로 유지하는 것을 의미한다. 

### INTEGRITY CONSTRAINT

_무결성 제약조건_ 이란, __데이터베이스의 정확성, 일관성을 보장하기 위해 저장, 삭제, 수정 등을 제약하기 위한 조건__ 이다. 이러한 조건의 목적은, __데이터베이스에 저장된 데이터의 무결성을 보장하고 데이터베이스의 상태를 일관되게 유지하는 것__ 이다. 

- not null 	: 널값이 입력되지 못하게 하는 조건
- unique 	: 중복된 값이 입력되지 못하게 하는 조건
- check	: 주어진 값만 허용하는 조건
- primary key	: not null + unique (+ index)의 의미
- foreign key(외래키) : 다른 테이블의 필드(컬럼)를 참조해서 무결성을 검사하는 조건