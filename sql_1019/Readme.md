# SebQuery

### WHAT IS SUBQUERY? 
- Main Query에 반대되는 개념으로 이름을 붙인 것
- Select, insert, delete, update절에서 모두 사용 가능
- 서브쿼리의 결과 집합을 메인 쿼리가 중간 결과값으로 사용.
- 서브쿼리 자체는 일반 쿼리와 다를 바가 없다.

- 사용예시
```SQL
SELECT DEPARTMENT_ID 
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID 
HAVING MIN(SALARY) > (SELECT MIN(SALARY)
					 FROM EMPLOYEES e2 
					 WHERE DEPARTMENT_ID = 100) 
                     -> 이것이 서브쿼리
```

