-- table : EMPLOYEES 
-- 1. ������(SALARY) 12000 �̻�Ǵ� �������� LAST_NAME, 
-- ������ ��ȸ�Ѵ�
select 	LAST_NAME , SALARY 
FROM 	EMPLOYEES e
WHERE 	SALARY  >= 12000
ORDER  BY SALARY DESC 
;

-- 2. �����ȣ(EMPLOYEE_ID)�� 176�� �����
-- LAST_NAME�� �μ� ��ȣ�� ��ȸ�Ѵ�.
SELECT  LAST_NAME , DEPARTMENT_ID 
FROM 	EMPLOYEES e 
WHERE 	EMPLOYEE_ID  = 176
;


-- 3. ������(SALARY) 5000���� 12000�� ���� �̿��� �������
-- LAST_NAME �� ������ ��ȸ�Ѵ�.
SELECT  SALARY , LAST_NAME 
FROM 	EMPLOYEES e 
WHERE 	NOT (SALARY BETWEEN 5000 AND 12000)
ORDER BY SALARY DESC 
;


-- 4. 20�� �� 50�� �μ�(DEPARTMENT_ID)���� �ٹ��ϴ�
-- ��� ������� LAST_NAME �� �μ� ��ȣ�� LAST_NAME�� 
-- �˹ٺ� ������ ��ȸ�Ѵ�.
SELECT 	LAST_NAME , DEPARTMENT_ID 
FROM 	EMPLOYEES e 
WHERE  	DEPARTMENT_ID  = 20
OR 		DEPARTMENT_ID  = 50
ORDER BY LAST_NAME  ASC
;


-- 5. 20�� �� 50�� �μ�(DEPARTMENT_ID)�� �ٹ��ϸ�,
-- ������ 5000 ~ 12000 ������ ������� 
-- LAST_NAME �� ������ ��ȸ�Ѵ�.
SELECT  LAST_NAME , SALARY , DEPARTMENT_ID 
FROM 	EMPLOYEES e 
WHERE   SALARY BETWEEN 5000 AND 12000
AND 	(DEPARTMENT_ID  = 20 OR DEPARTMENT_ID = 50)
ORDER BY SALARY DESC 
;

SELECT LAST_NAME , SALARY 
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID in(20,50) 
AND SALARY BETWEEN 5000 AND 12000
;


-- 6.�Ŵ����� ���� ������� LAST_NAME �� JOB_ID�� ��ȸ�Ѵ�.
SELECT 	LAST_NAME , JOB_ID 
FROM 	EMPLOYEES e 
WHERE 	MANAGER_ID IS NULL 
;


-- 7. Ŀ�̼�(COMMISSION_PCT)�� ���� ��� �������
-- LAST_NAME, ���� �� Ŀ�̼��� ���� �������� ��ȸ�Ѵ�.
SELECT  LAST_NAME , SALARY 
FROM 	EMPLOYEES e 
WHERE 	COMMISSION_PCT  IS NOT NULL 
ORDER BY SALARY desc
;


-- 8. LAST_NAME�� ù ���ڰ� A�� �������
-- LAST_NAME�� ��ȸ�Ѵ�.
SELECT  LAST_NAME 
FROM 	EMPLOYEES e
WHERE 	LAST_NAME LIKE 'A%'
;

-----------------------------------------------------------------------------
-- concat(char1, char2) : ���ڿ� ����
SELECT CONCAT('Hello', 'bye'), CONCAT('good', 'bad')
FROM DUAL
;

SELECT 	CONCAT('good', 'bad') 	concats,
		'good' || 'bad' 		operators
FROM	DUAL 
;

-- initcap(char) : char�� ù ���ڸ� �빮�ڷ� ��ȯ
SELECT 	INITCAP('good morning')
FROM	DUAL ;

-- lower(char) : �ҹ���, upper(char) : �빮��
SELECT  lower('GOOD'), upper('good')
FROM DUAL ;

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

-- substr("���ڿ�", "������ġ", "����")
SELECT 	SUBSTR('good morning',1, 4)
FROM	DUAL 
;

SELECT 	SUBSTR('good morning',8, 4)
FROM	DUAL 
;


-- replace(char, str1, str2 ) : ���ڿ� �Ϻθ� ��ü�ؼ� ��ȯ
SELECT 	REPLACE ('good morning tom', 'morning', 'evening')
FROM 	DUAL 
;

-- translate('���ڿ�', '�����', '��ȯ����') - 1��1 ����
SELECT 	REPLACE ('You are not alone', 'You', 'We'),
		TRANSLATE ('You are not alone uuu', 'You', 'Wei')
FROM	DUAL 
;

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


















