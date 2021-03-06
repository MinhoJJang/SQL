## 1) REPLACE - 특정 문자를 찾아서 바꾸자.
REPLACE('열이름', '찾을 문자', '바꿀 문자')

```sql
SELECT job_id,
REPLACE(job_id, 'ACCOUNT', 'ACCNT')
FROM employees;
```

## 2) LPAD, RPAD : 특정 문자로 자릿수 채우기...

* LPAD 는 왼쪽부터 특정 문자로 자리를 채우고 
* RPAD 는 오른쪽부터 특정 문자로 자리를 채운다. 

**12자리의 문자열 자리를 만들고 값이 12개보다 작으면 나머지는 왼쪽에서 '*' 을 채운다**

```sql
SELECT first_name,
LPAD(first_name, 12, '*')
FROM employees;
```

## 3) LTRIM, RTRIM  

- LTRIM => 왼쪽부터 지정한 문자를 지운다 
- RTRIM => 오른쪽부터 지정한 문자를 지운다

**LTRIM 함수를 사용하면서 F을 삭제 문자로 지정하면 왼쪽에서부터 F를 찾아서 삭제한다. RTRIM도 마찬가지로 오른쪽부터 T를 찾아서 삭제한다.**

```sql
SELECT job_id,
    LTRIM(job_id, 'F'),
    RTRIM(job_id, 'T')
FROM EMPLOYEES
```

## 4) TRIM

__TRIM은 공백을 제거하는 데 사용된다. 단, 중간의 공백은 제거할 수 없다.__

```sql
SELECT TRIM('   -space   ')
FROM dual;
```
    
- dual 테이블은 oracle 자체에서 제공되는 테이블이다.
- 간단하게 함수를 이용해서 결과를 확인할 때 사용되는 테이블


## 5) 숫자 관련 함수들...

- ROUND 반올림
- TRUNC 숫자 절삭, 잘라버린다. 
- MOD 나머지를 구함. 짝수, 홀수, 배수 찾는데 자주 사용됨
- CEIL 올림
- FLOOR 내림
- SIGN 양수, 음수, 0 판별
- POWER 거듭제곱
- SQRT 제곱근 => SQUARE ROOT

ROUND => 반올림: 지정한 자리에서 반올림. 반올림하는 자리는 생략가능, 기본값은 0

숫자 -->  **1  2  3  .  4  5  6  7**              
자리 --> **-3 -2 -1  0  1  2  3  4**

```sql
SELECT salary,
    salary/30 DAILY
FROM employees;

-- 이렇게 만들면 소수점 아래 자리수가 너무 많이 나와버리니까, ROUND로 적절한 위치에서 반올림 해준다. 

SELECT salary,
    ROUND(salary/30, 2) DAILY
FROM employees;

-- 이런 식으로 반올림 위치를 바꿔버려도 된다. 

SELECT salary,
    ROUND(salary/30, 1) DAILY1,
    ROUND(salary/30, 0) DAILY0,
    ROUND(salary/30, -1) DAILYm1
FROM employees;
``` 
