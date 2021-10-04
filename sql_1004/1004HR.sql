SELECT
    *
FROM employees;

SELECT
    *
FROM employees A, departments B
WHERE A.department_id = B.department_id;

-- SELECT�� �������� ������ ��������
SELECT a.department_id, b.department_id
FROM employees A, departments B
WHERE a.department_id = b.department_id;

SELECT A.employee_id, A.department_id,
       B.department_name, C.location_id, C.city 
FROM employees A, departments B, locations C
WHERE A.department_id = B.department_id
AND B.location_id = C.location_id;

SELECT COUNT(*)
FROM employees A, departments B
WHERE a.department_id = b.department_id; 
-- 106�� 
--> �� department_id �߿��� null���� �ϳ� ������ �� �� �ִ�.

SELECT COUNT(*) 
FROM employees;
-- 107��

--Self Join

SELECT A.employee_id, A.first_name, A.last_name, A.manager_id,
        B.manager_id, B.first_name || ' ' || B.last_name manager_name
FROM employees A, employees B
WHERE A.manager_id = B.manager_id;

-- ������ employees ���̺��� ����Ͽ� A ���̺��� manager_id,
-- B���̺��� employee_id �� �����Ͽ� �Ŵ����� �������� �̸��� ���
