--Number of CUSTOMERS that have reserved a Classic Booth Table or High Top Tables. 
--Group by table type


SELECT COUNT(Customer.customer_ID) AS Number_of_customers, Table_type.table_type_name
FROM Customer, Reservation, TableofRestaurant, Table_type
WHERE Customer.customer_ID = Reservation.reservation_customer_ID
AND Reservation.reservation_table_ID = TableofRestaurant.table_ID
AND TableofRestaurant.table_type = Table_type.table_type_ID
AND (Table_type.table_type_name like '%Classic Booth%'
	OR Table_type.table_type_name like '%High top table%')
GROUP BY Table_type.table_type_name
