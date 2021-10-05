-- ���̺� �����
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

-- ���̺� �����ϱ�  
ALTER TABLE sample_product 
ADD(factory varchar(10));

-- �� �����ϱ� 
ALTER TABLE sample_product 
MODIFY(factory varchar(10));

-- �� �̸� ����
ALTER TABLE sample_product RENAME COLUMN factory
to factory_name;

-- �� ����
ALTER TABLE sample_product 
DROP COLUMN factory_name;

-- ���̺� ������ ��ü ����
TRUNCATE TABLE sample_product;

-- ���̺� �����Ϳ� �������� ������ ����
DROP TABLE sample_product;

