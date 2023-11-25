--Display a raport of the restaurant on 2023-02-19

SELECT Customer.customer_ID, Customer.customer_fname, Customer.customer_lname, 
		Reservation.reservation_ID, Reservation.reservation_date, 
		TableofRestaurant.table_ID,TableofRestaurant.table_status
FROM Customer, Reservation, TableofRestaurant
WHERE Customer.customer_ID = Reservation.reservation_customer_ID
AND Reservation.reservation_table_ID = TableofRestaurant.table_ID
AND Reservation.reservation_date = '2023-02-19' 

