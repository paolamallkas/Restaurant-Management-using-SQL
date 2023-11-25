-- create view named restaurant_employees to get details of all the employees

CREATE VIEW restaurant_employees AS
	SELECT employee_fname AS 'First Name', employee_lname AS 'Last Name', employee_phone AS 'Contact Number'
	FROM Employee
	JOIN Area
	ON Area.area_employee_id = Employee.employee_ID;