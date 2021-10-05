# DDL 

DDL은 Data Definition Language 이다.
DDL명령어는 데이터베이스에 즉각 반영된다.

## 테이블 생성하기
```sql
CREATE TABLE sample_product(
    product_id number,
    product_name varchar2(30),
    make_date date
    );
   
INSERT INTO sample_product 
VALUES(1, 'television', to_date('211005', 'YYMMDD'));
    
INSERT INTO sample_product 
VALUES(2, 'washer', to_date('201221', 'YYMMDD'));
    
INSERT INTO sample_product 
VALUES(3, 'cleaner', to_date('180203', 'YYMMDD'));
``` 

1. 동일한 이름의 테이블을 중복해서 생성할 수 없다. 열 이름도 마찬가지로 동일하게 사용할 수 없다.
2. SELECT, FROM, INSERT 예약어는 사용할 수 없다. 
3. 문자로 시작한다. 한글과 특수문자도 테이블명으로 쓸 수 있지만 권장하지 않는다. 

## 테이블 수정하기

이미 생성된 테이블에 열을 추가/변경/삭제하여 테이블의 구조를 변경할 수 있다. 
```sql
ALTER TABLE sample_product 
ADD(factory varchar(10));
```
다만 새로 생성되는 열은 위치를 지정할 수 없다. (마지막에 생성됨)

## 열 수정하기 
```sql
ALTER TABLE sample_product 
MODIFY(factory varchar(10));
``` 

## 열 이름 변경
```sql
ALTER TABLE sample_product 
RENAME COLUMN factory
to factory_name;
```

## 열 삭제
```sql
ALTER TABLE sample_product 
DROP COLUMN factory_name;
```

## 테이블 데이터 전체 삭제
```sql
TRUNCATE TABLE sample_product;
```
데이터만 삭제하고, 테이블은 남아 있는 상태이다.

## 테이블 데이터와 구조까지 완전히 삭제
```sql
DROP TABLE sample_product;
```
테이블까지 삭제시킨다. 