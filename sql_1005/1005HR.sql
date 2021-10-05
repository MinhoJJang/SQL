-- 테이블 만들기
CREATE TABLE sample_product(
    product_id number,
    product_name varchar2(30),
    make_date date);
    
INSERT INTO sample_product VALUES(
1, 'television', to_date('211005', 'YYMMDD'));
    
INSERT INTO sample_product VALUES(
2, 'washer', to_date('201221', 'YYMMDD'));
    
INSERT INTO sample_product VALUES(
3, 'cleaner', to_date('180203', 'YYMMDD'));

-- 테이블 수정하기  
ALTER TABLE sample_product 
ADD(factory varchar(10));

-- 열 수정하기 
ALTER TABLE sample_product 
MODIFY(factory varchar(10));

-- 열 이름 변경
ALTER TABLE sample_product RENAME COLUMN factory
to factory_name;

-- 열 삭제
ALTER TABLE sample_product 
DROP COLUMN factory_name;

-- 테이블 데이터 전체 삭제
TRUNCATE TABLE sample_product;

-- 테이블 데이터와 구조까지 완전히 삭제
DROP TABLE sample_product;

