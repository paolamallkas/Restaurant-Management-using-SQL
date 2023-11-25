-- All orders that have more than one service requested 

SELECT Order1.order_ID, COUNT(Service.service_ID) AS Total_Number_of_Services
FROM Order1, Service
WHERE Order1.service_ID = Service.service_ID
GROUP BY Order1.order_ID
HAVING COUNT(Service.service_ID) > 1

