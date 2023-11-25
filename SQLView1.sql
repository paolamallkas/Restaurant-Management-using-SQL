-- create view named restaurant_customers to get details of the customers

CREATE VIEW restaurant_customers AS
SELECT Customer.customer_fname AS 'First Name', Customer.customer_lname AS 'Last Name', 
Customer.customer_email AS 'Email Address', Customer.customer_phone AS 'Contact Number'
FROM Customer
JOIN City ON City.city_ID = Customer.customer_city_ID
WHERE Customer.customer_ID IN
		(SELECT DISTINCT customer_ID		
		FROM Reservation )
					
