SELECT E.NAME AS 'Имя работника', E.SALARY AS 'Зарплата работника', C.SALARY AS 'Зарплата начальника'
FROM EMPLOYEE E
         LEFT JOIN EMPLOYEE C ON E.CHIEF_ID = C.ID
WHERE E.SALARY > C.SALARY;
