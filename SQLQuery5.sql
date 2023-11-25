-- All employees from Albania, whose name starts with A 

SELECT Employee.employee_ID, Employee.employee_fname, Employee.employee_lname, Employee.employee_phone, Country.country_name
FROM Employee
INNER JOIN City ON Employee.employee_city_ID = City.city_ID
INNER JOIN Country ON City.city_country_ID = Country.country_ID
WHERE Country.country_name = 'Albania'
AND (Employee.employee_fname like 'A%'
OR Employee.employee_fname like 'a%');

