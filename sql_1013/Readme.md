1. 데이터 조작어 - 검색
   select 문의 구성 요소
- select 	속성이름
- from 	테이블이름
- where	검색조건
- and		검색조건
- order by 	속성이름 -- asc : 오름차순 , desc : 내림차순;
```sql
  	select 	* 
	from 	Student 
	where	stu_no = 20001001
	and	stu_name = '김유신';
```
 2. 주석
 ```sql
  -- 한줄주석
  /*
	여러줄 주석
  */
```

 3. dual
  - oracle에서 기본으로 제공하는 dummy table
  - 오라클 자체에서 제공되는 테이블
  - 간단하게 함수를 이용해서 계산 결과값을 확인 할 때 사용하는 테이블
  - dual 테이블은 사용자가 함수(계산)를 실행할 때 임시로 사용하는데
  적합하다.
  - 함수에 대한 쓰임을 알고 싶을 때 특정 테이블을 생성할 필요 없이
  dual테이블을 이용하여 함수의 값을 리턴(return) 받을 수 있다.