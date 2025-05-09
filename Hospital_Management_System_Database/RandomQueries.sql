DELETE FROM Staging.Patients;
DELETE FROM Staging.Doctors;
DELETE FROM Staging.Appointments;
DELETE FROM Staging.Medicine;
DELETE FROM Staging.Pharmacy;
DELETE FROM Staging.Billing;
DELETE FROM Staging.Rooms;
DELETE FROM Staging.Rooms_Types;
DELETE FROM Staging.Staff;
DELETE FROM Staging.Cleaning_Service;
DELETE FROM dbo.Dim_Date;

select payment_date from Staging.Billing;

SELECT date_of_birth from Staging.Patients;

SELECT * from Fact_Pharmacy;