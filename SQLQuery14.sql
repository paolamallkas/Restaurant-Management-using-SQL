/*For each city that has at least one customer that has a reservation in our restaurant, 
display the total number of customers that fulfill these criteria.*/

SELECT City.city_name, COUNT (Customer.customer_ID) AS Total_Number
FROM City
JOIN Customer ON City.city_ID = Customer.customer_city_ID
JOIN Reservation ON Customer.customer_ID = Reservation.reservation_customer_ID
GROUP BY City.city_name
HAVING COUNT(Reservation.reservation_customer_ID) > 1
