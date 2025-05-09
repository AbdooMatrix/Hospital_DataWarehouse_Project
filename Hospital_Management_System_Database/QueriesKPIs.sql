-- Quantity Dispensed by Medicine Type in Descending Order
SELECT 
    dm.Medicine_Type,
    SUM(fp.Quantity) AS Total_Quantity_Dispensed
FROM 
    Fact_Pharmacy fp
    INNER JOIN Dim_Medicine dm ON fp.Medicine_Id = dm.Medicine_Id
    INNER JOIN Dim_Patient dp ON fp.Patient_Id = dp.Patient_Id
GROUP BY 
    dm.Medicine_Type
ORDER BY 
    Total_Quantity_Dispensed DESC;

DELETE FROM Dim_Date;
DELETE FROM Dim_Doctor;
DELETE FROM Dim_Medicine;
DELETE FROM Dim_Patient;
DELETE FROM Dim_Room;
DELETE FROM Dim_Staff;
DELETE FROM Fact_Appointments;
DELETE FROM Fact_Appointments;
DELETE FROM Fact_Cleaning_Service;
DELETE FROM Fact_Pharmacy;

SELECT * FROM Fact_Appointments