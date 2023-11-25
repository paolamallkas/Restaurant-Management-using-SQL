-- Display all the employees that have completed today's tasks 

SELECT Employee.employee_fname, Employee.employee_lname, Task.task_name
FROM Employee, Employee_Task,Task,Task_status
WHERE Employee.employee_ID = Employee_Task.employee_ID
AND Employee_Task.task_ID = Task.task_ID
AND Task.task_task_status_ID = Task_status.task_status_ID
AND Task_status.task_status_name = 'Completed'
AND Task.task_begin = GETDATE();

