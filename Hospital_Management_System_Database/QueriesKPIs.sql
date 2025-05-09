-- Quantity Dispensed by Medicine Type with Percentage
SELECT 
    dm.Medicine_Type,
    SUM(fp.Quantity) AS Total_Quantity_Dispensed,
    CAST(
        100.0 * SUM(fp.Quantity) / total.Total_Quantity 
        AS DECIMAL(5,2)
    ) AS Percentage_Of_Total
FROM 
    Fact_Pharmacy fp
    INNER JOIN Dim_Medicine dm ON fp.Medicine_Surrogate_Id = dm.Medicine_Surrogate_Id
    INNER JOIN Dim_Patient dp ON fp.Patient_Surrogate_Id = dp.Patient_Surrogate_Id,
    (SELECT SUM(Quantity) AS Total_Quantity FROM Fact_Pharmacy) total
GROUP BY 
    dm.Medicine_Type, total.Total_Quantity
ORDER BY 
    Total_Quantity_Dispensed DESC;



