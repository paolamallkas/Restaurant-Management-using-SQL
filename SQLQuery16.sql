--For each city display the max and min wage

SELECT City.city_name, 
		MAX(Job.job_wage) AS max_wage, MIN(Job.job_wage) AS min_wage
FROM City

JOIN Employee ON City.city_ID = Employee.employee_city_ID
JOIN Area ON Employee.employee_ID = Area.area_employee_id
JOIN Job ON Area.area_ID = Job.job_area_id

GROUP BY City.city_name;
