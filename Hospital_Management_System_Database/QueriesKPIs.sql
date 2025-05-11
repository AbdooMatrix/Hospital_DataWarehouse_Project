-- Fact_Pharmacy
-- 1. Quantity Dispensed by Medicine Type
SELECT 
    dm.Medicine_Type,
    SUM(fp.Quantity) AS Total_Quantity_Dispensed
FROM 
    Fact_Pharmacy fp
    INNER JOIN Dim_Medicine dm ON fp.Medicine_Surrogate_Id = dm.Medicine_Surrogate_Id
GROUP BY 
    dm.Medicine_Type
ORDER BY 
    Total_Quantity_Dispensed DESC;

-- 2. Top Prescribed Medicines per Year
SELECT 
    dd.Year,
    dm.Medicine_Name,
    SUM(fp.Quantity) AS Total_Quantity
FROM 
    Fact_Pharmacy fp
    INNER JOIN Dim_Medicine dm ON fp.Medicine_Surrogate_Id = dm.Medicine_Surrogate_Id
    INNER JOIN Dim_Date dd ON fp.Prescription_Date_Key = dd.Date_Key
GROUP BY 
    dd.Year, 
	dm.Medicine_Name
ORDER BY 
    dd.Year ASC, 
	Total_Quantity DESC;

-- 3. Number of Patients per Medicine
SELECT 
    dm.Medicine_Name,
    COUNT(DISTINCT fp.Patient_Surrogate_Id) AS Patient_Count
FROM 
    Fact_Pharmacy fp
    INNER JOIN Dim_Medicine dm ON fp.Medicine_Surrogate_Id = dm.Medicine_Surrogate_Id
GROUP BY 
    dm.Medicine_Name
ORDER BY 
    Patient_Count DESC;

--===========================================================================================--

-- Fact_Appointments
-- 1. Top Number of Appointments per each Patient in each year
SELECT 
    dd.Year,
	dp.Patient_Surrogate_Id,
    CONCAT(dp.first_name, ' ', dp.last_name) AS Patient_Full_Name,
    COUNT(*) AS Appointments_Count
FROM 
    Fact_Appointments fa
    INNER JOIN Dim_Patient dp ON fa.Patient_Surrogate_Id = dp.Patient_Surrogate_Id
	INNER JOIN Dim_Date dd ON fa.Appointment_Date_Key = dd.Date_Key
GROUP BY
	dd.Year,
    dp.Patient_Surrogate_Id,
    CONCAT(dp.first_name, ' ', dp.last_name)
ORDER BY 
	Appointments_Count DESC;

-- 2. Top Number of Appointments per Doctor in each year
SELECT 
	ddate.Year,
    fa.Doctor_Surrogate_Id,
    CONCAT(dd.first_name, ' ', dd.last_name) AS Doctor_Full_Name,
    COUNT(*) AS Appointments_Count
FROM 
    Fact_Appointments fa
    INNER JOIN Dim_Doctor dd ON fa.Doctor_Surrogate_Id = dd.Doctor_Surrogate_Id
	INNER JOIN Dim_Date ddate ON fa.Appointment_Date_Key = ddate.Date_Key
GROUP BY 
	ddate.Year,
    fa.Doctor_Surrogate_Id,
    CONCAT(dd.first_name, ' ', dd.last_name)
ORDER BY 
	Appointments_Count DESC;

-- 3. Top Doctors by Appointment Volume
SELECT
    CONCAT(d.First_Name, ' ', d.Last_Name) AS Doctor_Name,
    COUNT(fa.Appointment_Id) AS Total_Appointments
FROM 
    Fact_Appointments fa
    INNER JOIN Dim_Doctor d ON fa.Doctor_Surrogate_Id = d.Doctor_Surrogate_Id
	INNER JOIN Dim_Date dd ON fa.Appointment_Date_Key = dd.Date_Key
GROUP BY 
    d.Doctor_Surrogate_Id,
    d.First_Name,
    d.Last_Name
ORDER BY 
    Total_Appointments DESC;

--===========================================================================================--

-- Fact_Billing
-- 1. Average Bill Amount per Patient in each year.
SELECT 
    dd.Year,
	dp.Patient_Surrogate_Id,
	CONCAT(dp.First_Name, ' ', dp.Last_Name) AS Patient_Full_Name,
    AVG(fb.Total_Amount) AS Avg_Revenue_Per_Patient
FROM 
    Fact_Billing fb
    INNER JOIN Dim_Patient dp ON fb.Patient_Surrogate_Id = dp.Patient_Surrogate_Id
	INNER JOIN Dim_Date dd ON fb.Payment_Date_Key = dd.Date_Key
GROUP BY 
    dd.Year,
	dp.Patient_Surrogate_Id,
    CONCAT(dp.First_Name, ' ', dp.Last_Name)
ORDER BY
	dd.Year ASC, 
	Avg_Revenue_Per_Patient DESC


-- 2. Total Revenue per Year
SELECT 
    dd.Year,
    SUM(fb.Total_Amount) AS Total_Revenue
FROM 
    Fact_Billing fb
    INNER JOIN Dim_Date dd ON fb.Payment_Date_Key = dd.Date_Key
GROUP BY 
    dd.Year
ORDER BY 
    dd.Year;

-- 3. Monthly Revenue Trend
SELECT 
    dd.Year,
    dd.Month,
    SUM(fb.Total_Amount) AS Monthly_Revenue
FROM 
    Fact_Billing fb
    INNER JOIN Dim_Date dd ON fb.Payment_Date_Key = dd.Date_Key
GROUP BY 
    dd.Year, dd.Month
ORDER BY 
    dd.Year, dd.Month;

-- 4. Top Patients by Total Billing
SELECT
	dp.Patient_Surrogate_Id,
    CONCAT(dp.First_Name, ' ', dp.Last_Name) AS Patient_Full_Name,
    SUM(fb.Total_Amount) AS Total_Spent
FROM 
    Fact_Billing fb
    INNER JOIN Dim_Patient dp ON fb.Patient_Surrogate_Id = dp.Patient_Surrogate_Id
GROUP BY 
    dp.Patient_Surrogate_Id,
    CONCAT(dp.First_Name, ' ', dp.Last_Name)
ORDER BY 
    Total_Spent DESC;

--===========================================================================================--

-- Fact Cleaning Service
-- 1. Total No. of cleaning services done by each staff member in each year
SELECT 
    dd.Year,
    fcs.Staff_Surrogate_Id,
    CONCAT(ds.First_Name, ' ', ds.Last_Name) AS Staff_Name,
    SUM(fcs.Service_Count) AS Total_Cleaning_Services
FROM 
    Fact_Cleaning_Service fcs
    INNER JOIN Dim_Date dd ON fcs.Service_Date_Key = dd.Date_Key
    INNER JOIN Dim_Staff ds ON fcs.Staff_Surrogate_Id = ds.Staff_Surrogate_Id
	INNER JOIN Dim_Room dr ON fcs.Room_Surrogate_Id = dr.Room_Surrogate_Id
GROUP BY 
    dd.Year,
    fcs.Staff_Surrogate_Id,
    CONCAT(ds.First_Name, ' ', ds.Last_Name)
ORDER BY 
    dd.Year,
    fcs.Staff_Surrogate_Id;

-- 2. Yearly Cleaning Services per Room
SELECT 
    dd.Year,
    dr.Room_Number,
    SUM(fcs.Service_Count) AS Total_Services
FROM 
    Fact_Cleaning_Service fcs
    INNER JOIN Dim_Room dr ON fcs.Room_Surrogate_Id = dr.Room_Surrogate_Id
    INNER JOIN Dim_Date dd ON fcs.Service_Date_Key = dd.Date_Key
GROUP BY 
    dd.Year,
    dr.Room_Surrogate_Id,
    dr.Room_Number
ORDER BY 
    dd.Year ASC, Total_Services DESC;

-- 3. Total Number of Cleaning Services by Room Type
SELECT 
    dr.Room_Type,
    SUM(fcs.Service_Count) AS Total_Services
FROM 
    Fact_Cleaning_Service fcs
    INNER JOIN Dim_Room dr ON fcs.Room_Surrogate_Id = dr.Room_Surrogate_Id
GROUP BY 
    dr.Room_Type
ORDER BY 
    Total_Services DESC;
