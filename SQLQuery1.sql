-- How many city customers have made reservation for a particular month?

	SELECT customer_fname, customer_lname,customer_phone
	FROM Customer
	WHERE customer_ID IN 
		( SELECT distinct customer_city_ID		-- get city customers
		  FROM Reservation
		  WHERE MONTH(reservation_date) = 8);		-- reservation for the month of August