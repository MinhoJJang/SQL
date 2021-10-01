# 변환함수

SQL은 데이터 타입을 규정하고 있다. 따라서 데이터 형을 변환할 필요가 생기며, 자동으로 (묵시적)변환되거나 사용자가 수동으로 (명시적)변환하는 두 가지 경우가 있다. 

'1234' -> 1234

```SQL
SELECT 1 + '2'
FROM dual;

-- 3
```
자동으로 문자와 숫자를 더해서 3을 출력한다. 이것이 묵시적 형변환이다. 그러나, 자동으로 데이터를 타입변환 할 수 있다고 하더라도 수동으로 데이터타입 변환을 수행하는 것이 안전하다.

# 날짜와 시간 형식 변환

TO_~~ : 날짜 숫자 문자값을 문자열로 변환하는 함수 
```SQL
1) 문자로 
SELECT TO_CHAR(SYSDATE, 'YYYY'),
       TO_CHAR(SYSDATE, 'MM')
FROM dual;

-- 2021 | 10

2) 숫자로 
SELECT TO_NUMBER('123')
FROM dual;

-- 123 

3) 날짜로 
SELECT TO_DATE('20211001','YYMMDD')
FROM dual;

-- 21/10/01
```

# NOT NULL 처리

특정 열의 행에 데이터 값이 없으면 NULL이 된다. NULL은 0이 아니라, 정말 **아무것도 없는 상태**를 이르는 키워드이다. 즉 데이터를 다룰 때 NULL이 있으면 데이터 처리가 힘들어지므로 테이블을 정의 할때 NULL값을 가지지 못하게 지정할 수 있다. 

NULL은 어떠한 계산이든 적용이 불가능한 값 
0이나 공백이 아니기 때문에, NULL값을 포함하는 연산의 결과는 NULL이다. 

```SQL
SELECT *
FROM employees
ORDER BY commission_pct;

SELECT salary * commission_pct
FROM employees
ORDER BY commission_pct;

-- COMMISSION_PCT가 NULL 아닐 경우 제대로 계산이 되지만, NULL일때 NULL로 계산된다. 따라서 경우에 따라 NULL을 다른 값으로 대체해야 할 경우가 있다. 그러한 경우에 여러가지 방법을 사용할 수 있다.

1) NVL(a,b)는 a가 null일 경우 b로 값을 대체하는 함수이다. 

SELECT salary * NVL(commission_pct, 1)
FROM employees
ORDER BY commission_pct;

2) DECODE : 조건논리처리. IF ELSE 와 유사하게 사용하며, SQL문 작성시 자주 사용된다. 

DECODE(A,B,C,D)형태

SELECT first_name,
       salary,
       department_id,
       DECODE(department_id, 60, salary*1.1, salary),
       DECODE(department_id, 60,'10& UP', 'None')
FROM employees;
``` 

CASE -> 복잡한 논리 처리 