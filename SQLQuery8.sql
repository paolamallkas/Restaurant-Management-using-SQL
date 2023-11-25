-- All CUSTOMERS from TIRANA ordered by full name

SELECT Customer.customer_ID, Customer.customer_fname, Customer.customer_lname, City.city_name
FROM Customer
JOIN City
ON Customer.customer_city_ID = City.city_ID
WHERE City.city_name = 'Tirana'
ORDER BY Customer.customer_fname, Customer.customer_lname;
