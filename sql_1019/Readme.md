# SebQuery

### WHAT IS SUBQUERY? 
- Main Query�� �ݴ�Ǵ� �������� �̸��� ���� ��
- Select, insert, delete, update������ ��� ��� ����
- ���������� ��� ������ ���� ������ �߰� ��������� ���.
- �������� ��ü�� �Ϲ� ������ �ٸ� �ٰ� ����.

- ��뿹��
```SQL
SELECT DEPARTMENT_ID 
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID 
HAVING MIN(SALARY) > (SELECT MIN(SALARY)
					 FROM EMPLOYEES e2 
					 WHERE DEPARTMENT_ID = 100) 
                     -> �̰��� ��������
```

