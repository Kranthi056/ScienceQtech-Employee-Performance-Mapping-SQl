-- 3.Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT from 
-- the employee record table, and make a list of employees and details of their department

select EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT from emp_record_table;
select FIRST_NAME,LAST_NAME,DEPT from emp_record_table;

-- 4. Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, 
-- DEPARTMENT, and EMP_RATING if the EMP_RATING is:
-- less than two
-- greater than four
-- between two and four

select EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING from emp_record_table
where EMP_RATING<2 or EMP_RATING<4 or EMP_RATING<=4;

-- 5 Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees in the \
-- Finance department from the employee table and then give the resultant column alias as NAME.

select FIRST_NAME,LAST_NAME,concat(FIRST_NAME,LAST_NAME)  as alias from emp_record_table where DEPT="Finance";

-- 6.Write a query to list only those employees who have someone reporting to them. 
-- Also, show the number of reporters (including the President)
select e.EMP_ID,e.FIRST_NAME,m.EMP_ID as ManagersID, m.FIRST_NAME as ManagerName
from emp_record_table e JOIN emp_record_table m ON e.MANAGER_ID = m.EMP_ID;

-- 7.Write a query to list down all the employees from the healthcare and finance 
-- departments using union. Take data from the employee record table

select EMP_ID,DEPT
from emp_record_table
where DEPT="Healthcare"
union
select EMP_ID,DEPT
from emp_record_table
where DEPT="Finance";

-- 8 Write a query to list down employee details such as EMP_ID, FIRST_NAME, LAST_NAME, ROLE,
-- DEPARTMENT, and EMP_RATING grouped by dept. Also include the respective employee 
-- rating along with the max emp rating for the department.
SELECT 
    EMP_ID, 
    FIRST_NAME, 
    LAST_NAME, 
    ROLE, 
    DEPT, 
    EMP_RATING,
    MAX(EMP_RATING) OVER(PARTITION BY DEPT) AS MAX_EMP_RATING_DEPT
FROM 
    emp_record_table;

--- 9 Write a query to calculate the minimum and the maximum salary of the employees 
-- in each role. Take data from the employee record table.


SELECT ROLE,MIN(salary) AS min_salary,MAX(salary) AS max_salary
FROM emp_record_table
GROUP BY ROLE;

-- 10. Write a query to assign ranks to each employee based on their experience. 
-- Take data from the employee record table

select emp_id,rank() over(order by EXP) EXP from emp_record_table;

-- 11 Write a query to create a view that displays employees in various 
-- countries whose salary is more than six thousand. Take data from the employee record table

select EMP_ID,COUNTRY,SALARY from emp_record_table where SALARY>6000;

-- 12 Write a nested query to find employees with experience of more than 
-- ten years. Take data from the employee record table

select EmP_ID,EXP from emp_record_table where EXP>10;

-- 13 Write a query to create a stored procedure to retrieve the details of the employees 
-- whose experience is more than three years. Take data from the employee record table

 call emp_record_table();

-- 14 Write a query using stored functions in the project table to check whether the 
-- job profile assigned to each employee in the data science team matches the 
-- organization’s set standard. 

SELECT *,Task14(Emp_ID) FROM data_science_team;

-- 15 Create an index to improve the cost and performance of the query to find the 
-- employee whose FIRST_NAME is ‘Eric’ in the employee table after checking the execution plan.

select* from emp_record_table
where FIRST_NAME='Eric';

-- 16. Write a query to calculate the bonus for all the employees, based on their 
-- ratings and salaries (Use the formula: 5% of salary * employee rating).

select emp_id, first_name, last_name, role, exp, salary, emp_rating, 0.05* salary* emp_rating
as bonus from emp_record_table order by bonus;

-- 17 Write a query to calculate the average salary distribution based on the continent 
-- and country. Take data from the employee record table

select round(avg(salary)) as avg_sal, country, continent from emp_record_table group by country, CONTINENT;
