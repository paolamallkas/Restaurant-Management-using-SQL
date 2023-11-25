--All employees from Tirana ordered by full name

SELECT Employee.employee_ID, Employee.employee_fname, Employee.employee_lname, Employee.employee_phone, City.city_name
FROM Employee
JOIN City
ON Employee.employee_city_ID = City.city_ID
WHERE City.city_name = 'Tirane'
ORDER BY Employee.employee_fname, Employee.employee_lname
