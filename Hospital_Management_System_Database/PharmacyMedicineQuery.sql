SELECT 
    p.Pharmacy_Id,
    m.Medicine_Id,
    m.type AS Medicine_Type,
    m.Name AS Medicine_Name,
    p.Quantity
FROM Pharmacy p
JOIN Medicine m ON p.Medicine_Id = m.Medicine_Id;


SELECT * FROM Pharmacy;

Select * from Billing

select * from Rooms