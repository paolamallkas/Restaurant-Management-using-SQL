-- Remove Table Reservation 

CREATE PROCEDURE RemoveReservation (@reservation_id AS INT)
AS
BEGIN
	SELECT table_ID FROM TableofRestaurant
	WHERE table_ID = (SELECT reservation_table_ID 
	FROM Reservation 
	WHERE reservation_ID = @reservation_id) 
	AND table_status = (SELECT table_status_ID 
	FROM Table_status WHERE table_status_name = 'Reserved');

IF @@ROWCOUNT = 1 
	BEGIN

	UPDATE TableofRestaurant
	SET table_status = (SELECT table_status_ID FROM Table_status WHERE table_status_name = 'Reserved');

	END

	DELETE FROM [dbo].[Reservation] WHERE reservation_ID = @reservation_id ;

END
GO
