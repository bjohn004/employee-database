-- Query for question #1  (List the following details of each employee: employee number, 
-- last name, first name, sex, and salary.)

select employee.emp_no, employee.last_name, employee.first_name, employee.sex, salaries.salary
from employee
join salaries on employee.emp_no=salaries.emp_no;

-- Query for question #2 (List first name, last name, and hire date for employees who were hired in 1986.)

select first_name, last_name, hire_date
from employee
where hire_date between '1986-01-01' and '1986-12-31';

-- Query for question #3 (List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name.)

select departments.dept_no,  departments.dept_name, employee.emp_no, employee.last_name, employee.first_name
from employee
join dept_manager on employee.emp_no=dept_manager.emp_no
join departments on dept_manager.dept_no=departments.dept_no;

-- Query for question #4 (List the department of each employee with the following information: employee number, 
-- last name, first name, and department name.)

select  departments.dept_name, employee.emp_no, employee.last_name, employee.first_name
from departments
join dept_emp on departments.dept_no=dept_emp.dept_no
join employee on dept_emp.emp_no=employee.emp_no
order by dept_emp.emp_no;

-- Query for question #5 (List first name, last name, and sex for employees whose first name is "Hercules" and 
-- last names begin with "B.")

select first_name, last_name, sex
from employee
where first_name = 'Hercules' and last_name like 'B%';

-- Query for question #6 (List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.)

select dept_emp.emp_no, employee.last_name, employee.first_name, departments.dept_name
from employee
join dept_emp on employee.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales';
	
-- Query for question #7 (List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.)

select dept_emp.emp_no, employee.last_name, employee.first_name, departments.dept_name
from employee
join dept_emp on employee.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales' or dept_name = 'Development';

-- Query for question #8 (List the frequency count of employee last names (i.e., how many 
-- employees share each last name) in descending order.)

select last_name, Count(last_name) As "Frequency"
from employee
group by last_name
order by count(last_name) desc;


