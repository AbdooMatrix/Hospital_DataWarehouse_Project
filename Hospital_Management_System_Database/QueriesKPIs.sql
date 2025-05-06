WITH AppointmentCounts AS (
    SELECT 
        p.Patient_Id,
        p.First_Name + ' ' + p.Last_Name AS Patient_Name,
        COUNT(a.Appointment_Id) AS Appointment_Count
    FROM Fact_Appointments a
    JOIN Dim_Patient p ON a.Patient_Id = p.Patient_Id
    JOIN Dim_Date d ON a.Appointment_Date_Key = d.Date_Key
    WHERE d.Full_Date >= '2024-11-01' AND d.Full_Date <= '2024-11-30'
    GROUP BY p.Patient_Id, p.First_Name, p.Last_Name
)
SELECT 
    Patient_Name,
    Appointment_Count,
    AVG(CAST(Appointment_Count AS FLOAT)) OVER () AS Avg_Appointments_Per_Patient
FROM AppointmentCounts
ORDER BY Appointment_Count DESC;

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