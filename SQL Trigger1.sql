-- A trigger that notifies the system administrator when someone tries to insert or update the job table

USE RMS
GO
CREATE TRIGGER Notify_me
ON Job
AFTER INSERT, UPDATE
AS RAISERROR ('Notify system administrator', 16, 10)
GO
