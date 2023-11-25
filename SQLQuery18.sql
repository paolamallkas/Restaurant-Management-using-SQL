/*Show all employee information for employees, whose name starts with J using subquery*/

SELECT *
FROM Employee
WHERE employee_ID in (SELECT employee_ID
							  FROM Employee
							  WHERE employee_fname like 'J%'
							  );
