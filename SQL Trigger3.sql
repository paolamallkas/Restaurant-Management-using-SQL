-- The following code shows how LOGON Trigger rejects attempts to logon for "user1",
--if they are initiated outside business hours 9AM-9PM

-- 1. Create a SQL user called "user1" on the server. 

USE RMS
GO

--Create the login on the servel called "user1"

CREATE LOGIN [user1] WITH PASSWORD= N'Aa123456&'
    ,DEFAULT_DATABASE=[RMS]
    ,DEFAULT_LANGUAGE=[us_english]
    ,CHECK_EXPIRATION=OFF
    ,CHECK_POLICY=OFF
GO

--Create logon trigger called “limit_hours_of_use_triggerr”, 
--which only permits login attempts for “user1″ during business hours i.e. between 9:00 and 21:00 hours.

CREATE TRIGGER [limit_hours_of_use_trigger]
ON ALL SERVER
FOR LOGON 
AS
BEGIN
DECLARE @ErrorText [varchar](128)

SET @ErrorText = 'Cannot allow login to "user1" outside of normal business hours. '
SET @ErrorText = @ErrorText + 'Please try again between business hours 9:00 and 21:00.'

IF ORIGINAL_LOGIN() = 'user1' AND
    (DATEPART(HOUR, GETDATE()) < 9 OR DATEPART (HOUR, GETDATE()) > 21)
    BEGIN
        PRINT @ErrorText
        ROLLBACK;
    END
END;
GO

ENABLE TRIGGER [limit_hours_of_use_trigger] ON ALL SERVER  
GO

