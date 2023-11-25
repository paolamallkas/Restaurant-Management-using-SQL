-- How many tables are reserved on a given date?

SELECT SUM(total_tables_reserved) AS 'Total Tables Reserved' 		-- sum of total tables
	FROM Reservation
	WHERE reservation_date LIKE '2023-16-02%';	-- for date 16th February,2023;  