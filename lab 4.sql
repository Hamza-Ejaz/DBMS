/*  HAMZA EJAZ B19102041  */

/* 1. Determine the structure of all database's tables. */
select * from INFORMATION_SCHEMA.COLUMNS 

/* 2. Display names and salaries of employees. */
SELECT first_name,last_name,salary FROM HR..employees;

/* 3. Display the last name and salary of employees earning more than $12,000 */
SELECT last_name, salary FROM HR..employees WHERE salary > 12000;

/* 4. Display the last name and department number for employee number 176 */
SELECT last_name, department_id FROM HR..employees WHERE employee_id = 176;

/*5. Display the last name and salary for all employees whose salary is not in the range of $5,000 to
$12,000 */
SELECT last_name, salary FROM HR..employees  WHERE salary NOT BETWEEN 5000 AND 12000;

/* 6. Display the last name, job ID, and start date (hire date) for the employees with the last names of
Matos and Taylor. Order the query in ascending order by start date. */
SELECT last_name, job_id, hire_date FROM HR..employees WHERE last_name='Matos' or last_name= 'Taylor' 
ORDER BY hire_date;

/* 7. Display the last name and department number of all employees in departments 20 or 50 in ascending
alphabetical order by name. */
SELECT last_name, department_id FROM HR..employees  WHERE department_id IN (20, 50) ORDER BY last_name;

/* 8. Display the last name and job title of all employees who do not have a manager. */
SELECT last_name, job_id FROM HR..employees WHERE manager_id IS NULL;

/* 9. Display the last name, salary, and commission for all employees who earn commissions. Sort data in
descending order of salary and commissions. */
SELECT last_name, salary, commission_pct FROM HR..employees WHERE commission_pct IS NOT NULL 
ORDER BY salary DESC, commission_pct DESC;

/* 10. Find the highest, lowest, sum, and average salary of all employees. Label the columns Maximum,
Minimum, Sum, and Average, respectively. */
SELECT MAX(salary) as "Maximum",MIN(salary) as "Minimum",SUM(salary) as "Sum",
AVG(salary) as "Average" FROM HR..employees;

/* 11. Modify the previous query to display the minimum, maximum, sum, and average salary for each job
type (job_id). */
SELECT MAX(salary) as "Maximum",MIN(salary) as "Minimum",SUM(salary) as "Sum",
AVG(salary) as "Average" FROM HR..employees group by job_id;

/* 12. Display the number of people with the same job */
SELECT job_id, COUNT(*) as "as no. of employees" FROM HR..employees GROUP BY job_id;

/* 13. Determine the number of managers without listing them. Label the column Number of Managers.
Hint: Use the MANAGER_ID column to determine the number of managers. */
SELECT manager_id, COUNT(*) as "as no. of managers" FROM HR..employees GROUP BY manager_id;

/* 14. Find the difference between the highest and lowest salaries. Label the column DIFFERENCE. */
SELECT MAX(salary) - MIN(salary) as "Difference" FROM employees;

/* 15. Find the addresses of all the departments. Use the LOCATIONS and COUNTRIES tables. */
SELECT country_name,location_id, street_address, city, state_province
FROM HR..countries,HR..locations;

/* 16. Show the location ID, street address, city, state or province, and country in the output. */
SELECT location_id, street_address, city, state_province, country_name
FROM HR..locations, HR..countries;

/* 17. Display the last name and department name for all employees. */
SELECT last_name,(SELECT department_name FROM HR..departments d 
where e.department_id= d.department_id) department FROM HR..employees e order by department;

/* 18. Display the last name, job, department number, and department name for all employees who work
in Toronto */
select last_name, job_id,department_id,(SELECT department_name FROM HR..departments d 
WHERE e.department_id=d.department_id) department from HR..employees e
where department_id=(select department_id from HR..departments where location_id = (select location_id 
from HR..locations where city='Toronto '));