-- Trigger that inserts information into employee table

CREATE TRIGGER employee_information
   ON Employee
 	  AFTER INSERT
AS 
BEGIN
		DECLARE
			@EMP_id  int ,
			@EMP_first_name varchar(150),
			@EMP_last_name varchar(150),
			@EMP_address varchar(150),
			@EMP_phone_number varchar(150)

		SELECT

			@EMP_id = inserted.employee_ID,
			@EMP_first_name = inserted.employee_fname,
			@EMP_last_name = inserted.employee_lname,
			@EMP_address = inserted.employee_add,
			@EMP_phone_number = inserted.employee_phone

		FROM
			inserted
			--Check if these is the employee_ID. If there is the employee_ID, do not insert. 
			IF EXISTS (SELECT * 
			FROM Employee
				 	 WHERE [employee_ID]= @EMP_id)
				PRINT('This ID is already in the table')
			ELSE
			-- If there is not the employee_ID, do an INSERT 
				INSERT INTO Employee (
employee_ID, employee_fname, employee_lname,employee_add, employee_phone)
				
				VALUES(@EMP_id, @EMP_first_name, @EMP_last_name,@EMP_address,@EMP_phone_number)

END
GO
