-- Display a report of the restaurant for the current date using subquery


SELECT Customer.customer_ID, Customer.customer_fname, Customer.customer_lname, 
		Reservation.reservation_ID, Reservation.reservation_date 
FROM Customer, Reservation
WHERE Customer.customer_ID = (SELECT Reservation.reservation_customer_ID
						FROM Reservation
						WHERE Reservation.reservation_date = '2023-02-02' 
						AND Customer.customer_ID = Reservation.reservation_customer_ID
						)
