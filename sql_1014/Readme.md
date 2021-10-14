# SQL �Լ� ���� 

# CONCAT
```sql
--concat(char1, char2) : ���ڿ� ����
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
-- initcap(char) : char�� ù ���ڸ� �빮�ڷ� ��ȯ
SELECT 	INITCAP('good morning')
FROM	DUAL ;
```

# LOWER, UPPER
```sql
-- lower(char) : �ҹ���, upper(char) : �빮��
SELECT  lower('GOOD'), upper('good')
FROM DUAL ;
```

# LPAD, RPAD
```sql
-- lpad("��", �� ���ڱ���, "ä����")
SELECT 	'good'
		,lpad('good', 6) "LPAD1"
		,LPAD('good', 7, '#') "LPAD2"
		,LPAD('good', 8, 'L') "LPAD3" 
FROM 	DUAL 
;

-- rpad("��", �� ���ڱ���, "ä����")
SELECT 	'good'
		,rpad('good', 6) "RPAD1"
		,RPAD('good', 7, '#') "RPAD2"
		,RPAD('good', 8, 'L') "RPAD3" 
FROM 	DUAL 
;
```

# LTRIM, RTRIM
```SQL
-- LTRIM("���ڿ�", "�ɼ�") - ���ڿ��� �ɼ����� ������ ���ڸ� ���ʿ��� ����
SELECT 	LTRIM('goodbye', 'g'),
		LTRIM('goodbye', 'o'),
		LTRIM('gogogggdbye', 'go')
FROM	DUAL
;

-- RTRIM("���ڿ�", "�ɼ�") - ���ڿ��� �ɼ����� ������ ���ڸ� �����ʿ��� ����
SELECT 	RTRIM('goodbye', 'e') 
	,	RTRIM('goodbye', 'i')
FROM	DUAL 
;
```

# SUBSTR
```SQL
-- substr("���ڿ�", "������ġ", "����")
SELECT 	SUBSTR('good morning',1, 4)
FROM	DUAL 
;

SELECT 	SUBSTR('good morning',8, 4)
FROM	DUAL 
;
```

# REPLACE
```SQL
-- replace(char, str1, str2 ) : ���ڿ� �Ϻθ� ��ü�ؼ� ��ȯ
SELECT 	REPLACE ('good morning tom', 'morning', 'evening')
FROM 	DUAL 
;
```

# TRANSLATE
```SQL
-- translate('���ڿ�', '�����', '��ȯ����') - 1��1 ����
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

-- to_char() : ���ڿ� ��ȯ
SELECT 	TO_CHAR(SYSDATE, 'yyyy-mm-dd') 
	,	TO_CHAR(SYSDATE, 'yyyy/mm/dd')
	,	TO_CHAR(SYSDATE, 'yyyymmdd')
	,	TO_CHAR(SYSDATE, 'yyyy-mm-dd HH24:MI:SS') 
FROM	DUAL 
;

-- to_date() : ��¥������ ��ȯ
SELECT 	TO_DATE('2015-03-04', 'yyyy/mm/dd')
FROM	DUAL 
;
```