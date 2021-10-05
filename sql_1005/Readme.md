# DDL 

DDL�� Data Definition Language �̴�.
DDL��ɾ�� �����ͺ��̽��� �ﰢ �ݿ��ȴ�.

## ���̺� �����ϱ�
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

1. ������ �̸��� ���̺��� �ߺ��ؼ� ������ �� ����. �� �̸��� ���������� �����ϰ� ����� �� ����.
2. SELECT, FROM, INSERT ������ ����� �� ����. 
3. ���ڷ� �����Ѵ�. �ѱ۰� Ư�����ڵ� ���̺������ �� �� ������ �������� �ʴ´�. 

## ���̺� �����ϱ�

�̹� ������ ���̺� ���� �߰�/����/�����Ͽ� ���̺��� ������ ������ �� �ִ�. 
```sql
ALTER TABLE sample_product 
ADD(factory varchar(10));
```
�ٸ� ���� �����Ǵ� ���� ��ġ�� ������ �� ����. (�������� ������)

## �� �����ϱ� 
```sql
ALTER TABLE sample_product 
MODIFY(factory varchar(10));
``` 

## �� �̸� ����
```sql
ALTER TABLE sample_product 
RENAME COLUMN factory
to factory_name;
```

## �� ����
```sql
ALTER TABLE sample_product 
DROP COLUMN factory_name;
```

## ���̺� ������ ��ü ����
```sql
TRUNCATE TABLE sample_product;
```
�����͸� �����ϰ�, ���̺��� ���� �ִ� �����̴�.

## ���̺� �����Ϳ� �������� ������ ����
```sql
DROP TABLE sample_product;
```
���̺���� ������Ų��. 