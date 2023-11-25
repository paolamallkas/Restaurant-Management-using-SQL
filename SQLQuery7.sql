--Information for employees with wages greater than 500

SELECT Employee.employee_ID, Employee.employee_fname, Employee.employee_lname, Job.job_name, Job.job_wage
FROM Employee,Area,Job
WHERE Employee.employee_ID = Area.area_employee_id
AND Area.area_ID= Job.job_area_id
AND Job.job_wage > 500;
