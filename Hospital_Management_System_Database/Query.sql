select * from Pharmacy;

SELECT * FROM Dim_Date;

select * from Medicine;

SELECT *
FROM Appointments 
JOIN Medicine
ON Medicine.Medicine_Id = Pharmacy.Medicine_Id;