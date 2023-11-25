--All customers that have reserved a classic booth table*/


SELECT Customer.customer_ID, Customer.customer_fname, Customer.customer_lname, Table_type.table_type_name
FROM Customer, Reservation, TableofRestaurant, Table_type
WHERE Customer.customer_ID = Reservation.reservation_customer_ID
AND Reservation.reservation_table_ID = TableofRestaurant.table_ID
AND TableofRestaurant.table_type = Table_type.table_type_ID
AND Table_type.table_type_name like '%classic booth%'


/* METHOD 2

SELECT Customer.customer_ID, Customer.customer_fname, Customer.customer_lname, Table_type.table_type_name
FROM Customer
INNER JOIN Reservation ON Customer.customer_ID = Reservation.reservation_customer_ID
INNER JOIN TableofRestaurant ON Reservation.reservation_table_ID = TableofRestaurant.table_ID
INNER JOIN Table_type ON TableofRestaurant.table_type = Table_type.table_type_ID
WHERE Table_type.table_type_name LIKE ' %Classic Booth% ';

*/


