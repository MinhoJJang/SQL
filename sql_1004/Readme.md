# join 

- 테이블 등을 연결하고 붙이는 키워드이다. 
- 중간고사 테이블과 기말고사 테이블을 하나의 테이블로 연결할 수 있다.

## 테이블 2개 연결
```sql
SELECT
    *
FROM employees A, departments B
WHERE A.department_id = B.department_id;
```
**FROM에서 employees 테이블을 A라고 칭하고, departments 테이블을 B라고 칭한다. 그리고 WHERE을 통해 A에서 가져온 department_id와 B에서 가져온 department_id 테이블을 서로 연결한다. 이때 SELECT * 를 하였기 때문에 employees와 departments의 테이블을 전부 다 보여준다.** 

## 테이블 3개 연결
```sql
SELECT A.employee_id, A.department_id,
       B.department_name, C.location_id, C.city 
FROM employees A, departments B, locations C
WHERE A.department_id = B.department_id
AND B.location_id = C.location_id;
```


// 아직 이해안간부분...
# Self Join

```sql
SELECT A.employee_id, A.first_name, A.last_name, A.manager_id,
        B.first_name || ' ' || B.last_name manager_name
FROM employees A, employees B
WHERE A.manager_id = B.manager_id;
```
**동일한 employees 테이블을 사용하여 A 테이블은 manager_id, B테이블은 employee_id 로 조인하여 매니저가 누구인지 이름을 출력한다. 같은 테이블을 사용하지만, 각기 다른 별명을 사용하기 때문에 마치 다른 두개의 테이블을 조인하는 것처럼 보인다. self Join을 할 는 반드시 '별명.열이름' 형태로 명확하게 조인한다.**

# COUNT
연결한 테이블의 데이터 개수를 가져오는 키워드
```sql
SELECT COUNT(*)
FROM employees A, departments B
WHERE a.department_id = b.department_id; 
-- 106개 
--> 전체 employees 수가 107명인데, 가져온 department_id가 106개로 1개가 적다. 즉 department_id 중에서 null값이 하나 있음을 알 수 있다.

SELECT COUNT(*) 
FROM employees;
-- 107개 
```
