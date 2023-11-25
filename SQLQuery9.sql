--All customers with a reservation on January 2023 ordered by customer’s full name


SELECT Customer.customer_ID, Customer.customer_fname, Customer.customer_lname, Reservation.reservation_date
FROM Customer, Reservation
WHERE Customer.customer_ID = Reservation.reservation_customer_ID
AND Month(Reservation.reservation_date) = 1
ORDER BY Customer.customer_fname, Customer.customer_lname;
