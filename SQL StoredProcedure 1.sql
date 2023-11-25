--A stored procedure that makes the reservation of a table

CREATE PROCEDURE ReserveTable (@customer_id AS INT,@table_id AS INT, @reservation_date as DATE )
AS
BEGIN
	SELECT table_ID FROM TableofRestaurant WHERE table_ID = @table_id 
	AND table_status = (SELECT table_status_ID FROM Table_status WHERE table_status_name = 'Avaiable');

IF @@ROWCOUNT = 1 

	INSERT INTO [dbo].[Reservation]
           ([reservation_customer_ID]
           ,[reservation_table_ID]
           ,[reservation_date]
		   )
           
     VALUES
           (@customer_id
           ,@table_id
           ,GETDATE()
          )
END
GO