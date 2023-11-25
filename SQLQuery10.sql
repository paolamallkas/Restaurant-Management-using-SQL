-- All reservations on 2023 group by month

SELECT COUNT(Reservation.reservation_ID) AS Num_of_reservations, MONTH(Reservation.reservation_date) AS Month_num
FROM Reservation
WHERE Year(Reservation.reservation_date) = 2023
GROUP BY Month(Reservation.reservation_date)




