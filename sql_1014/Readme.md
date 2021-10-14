# SQL 함수 정리 

# CONCAT
```sql
--concat(char1, char2) : 문자열 연결
SELECT CONCAT('Hello', 'bye'), CONCAT('good', 'bad')
FROM DUAL
;

SELECT 	CONCAT('good', 'bad') 	concats,
		'good' || 'bad' 		operators
FROM	DUAL 
;
```

# INITCAP
```sql
-- initcap(char) : char의 첫 문자를 대문자로 변환
SELECT 	INITCAP('good morning')
FROM	DUAL ;
```

# LOWER, UPPER
```sql
-- lower(char) : 소문자, upper(char) : 대문자
SELECT  lower('GOOD'), upper('good')
FROM DUAL ;
```

# LPAD, RPAD
```sql
-- lpad("값", 총 문자길이, "채움문자")
SELECT 	'good'
		,lpad('good', 6) "LPAD1"
		,LPAD('good', 7, '#') "LPAD2"
		,LPAD('good', 8, 'L') "LPAD3" 
FROM 	DUAL 
;

-- rpad("값", 총 문자길이, "채움문자")
SELECT 	'good'
		,rpad('good', 6) "RPAD1"
		,RPAD('good', 7, '#') "RPAD2"
		,RPAD('good', 8, 'L') "RPAD3" 
FROM 	DUAL 
;
```

# LTRIM, RTRIM
```SQL
-- LTRIM("문자열", "옵션") - 문자열을 옵션으로 지정된 문자를 왼쪽에서 제거
SELECT 	LTRIM('goodbye', 'g'),
		LTRIM('goodbye', 'o'),
		LTRIM('gogogggdbye', 'go')
FROM	DUAL
;

-- RTRIM("문자열", "옵션") - 문자열을 옵션으로 지정된 문자를 오른쪽에서 제거
SELECT 	RTRIM('goodbye', 'e') 
	,	RTRIM('goodbye', 'i')
FROM	DUAL 
;
```

# SUBSTR
```SQL
-- substr("문자열", "시작위치", "길이")
SELECT 	SUBSTR('good morning',1, 4)
FROM	DUAL 
;

SELECT 	SUBSTR('good morning',8, 4)
FROM	DUAL 
;
```

# REPLACE
```SQL
-- replace(char, str1, str2 ) : 문자열 일부를 대체해서 반환
SELECT 	REPLACE ('good morning tom', 'morning', 'evening')
FROM 	DUAL 
;
```

# TRANSLATE
```SQL
-- translate('문자열', '대상문자', '변환문자') - 1대1 대응
SELECT 	REPLACE ('You are not alone', 'You', 'We'),
		TRANSLATE ('You are not alone uuu', 'You', 'Wei')
FROM	DUAL 
;
```

# TIME & DAY
```SQL
-- sysdate
SELECT 	SYSDATE 
FROM 	dual
;

-- add_months
SELECT 	ADD_MONTHS(SYSDATE, 2) 
FROM 	DUAL 
;

-- last_day()
SELECT 	LAST_DAY(SYSDATE)
FROM	DUAL 
;

SELECT 	SYSDATE + 1 
FROM	DUAL 
;
	
SELECT 	SYSDATE + (INTERVAL '1' YEAR)
	,	SYSDATE + (INTERVAL '1' MONTH)
	,	SYSDATE + (INTERVAL '1' DAY)
	,	SYSDATE + (INTERVAL '1' HOUR)
	,	SYSDATE + (INTERVAL '1' MINUTE)
	,	SYSDATE + (INTERVAL '1' SECOND)
FROM	DUAL 
;

-- to_char() : 문자열 변환
SELECT 	TO_CHAR(SYSDATE, 'yyyy-mm-dd') 
	,	TO_CHAR(SYSDATE, 'yyyy/mm/dd')
	,	TO_CHAR(SYSDATE, 'yyyymmdd')
	,	TO_CHAR(SYSDATE, 'yyyy-mm-dd HH24:MI:SS') 
FROM	DUAL 
;

-- to_date() : 날짜형으로 변환
SELECT 	TO_DATE('2015-03-04', 'yyyy/mm/dd')
FROM	DUAL 
;
```