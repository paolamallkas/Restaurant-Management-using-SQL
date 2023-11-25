-- How many reservations has a customer made in one year?

	SELECT COUNT(*) AS 'Total Number of Reservations' 		-- count of total reservations 		
	FROM Reservation
	WHERE YEAR(reservation_date) = 2023 AND reservation_customer_ID = 1;		-- reservations in Year 2023 by customer with id 1