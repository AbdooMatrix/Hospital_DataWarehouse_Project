-- Create the Hospital_DWH database
CREATE DATABASE Hospital_DWH;
GO

-- Use the Hospital_DWH database
USE Hospital_DWH;
GO

-- Create Staging Schema
CREATE SCHEMA Staging;
GO

-- Create Staging Tables (aligned with the updated schema)

CREATE TABLE Staging.Patients (
    patient_id INT,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    created_at DATETIME
);
GO

CREATE TABLE Staging.Appointments (
    appointment_id INT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    created_at DATETIME
);
GO

CREATE TABLE Staging.Pharmacy (
    pharmacy_id INT,
    medicine_id INT,
    patient_id INT,
    quantity INT,
    prescription_date DATE
);
GO

CREATE TABLE Staging.Medicine (
    medicine_id INT,
    name NVARCHAR(100),
    type NVARCHAR(20),
    created_at DATETIME
);
GO

CREATE TABLE Staging.Billing (
    bill_id INT,
    patient_id INT,
    appointment_id INT,
    total_amount DECIMAL(10, 2),
    payment_status NVARCHAR(20),
    created_at DATETIME
);
GO

CREATE TABLE Staging.Doctors (
    doctor_id INT,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    created_at DATETIME
);
GO

-- Create Main Schema Dimension Tables

CREATE TABLE Dim_Patient (
    Patient_Id INT PRIMARY KEY,
    First_Name NVARCHAR(50),
    Last_Name NVARCHAR(50)
);
GO

CREATE TABLE Dim_Date (
    Date_Id INT PRIMARY KEY,
    Full_Date DATE,
    Month INT,
    Year INT,
    Day INT
);
GO

CREATE TABLE Dim_Medicine (
    Medicine_Id INT PRIMARY KEY,
    Medicine_Name NVARCHAR(100),
    Medicine_Type NVARCHAR(20)
);
GO

CREATE TABLE Dim_Pharmacy (
    Pharmacy_Id INT PRIMARY KEY,
    Medicine_Id INT,
    Patient_Id INT,
    Quantity INT
);
GO

CREATE TABLE Dim_Doctor (
    Doctor_Id INT PRIMARY KEY,
    First_Name NVARCHAR(50),
    Last_Name NVARCHAR(50)
);
GO

CREATE TABLE Dim_Bill (
    Bill_Id INT PRIMARY KEY,
    Patient_Id INT,
    Appointment_Id INT,
    Total_Amount DECIMAL(10, 2),
    Payment_Status NVARCHAR(20),
    Created_At DATETIME
);
GO

-- Create Main Schema Fact Tables

CREATE TABLE Fact_Medicine_Type (
    Fact_Appointments_Id INT PRIMARY KEY,
    Medicine_Id INT,
    Pharmacy_Id INT,
    Quantity_Dispensed INT,
    FOREIGN KEY (Medicine_Id) REFERENCES Dim_Medicine(Medicine_Id),
    FOREIGN KEY (Pharmacy_Id) REFERENCES Dim_Pharmacy(Pharmacy_Id)
);
GO

CREATE TABLE Fact_Appointments_Frequency (
    Fact_Appointments_Id INT PRIMARY KEY,
    Appointment_Id INT,
    Doctor_Id INT,
    Patient_Id INT,
    Date_Id INT,
    FOREIGN KEY (Doctor_Id) REFERENCES Dim_Doctor(Doctor_Id),
    FOREIGN KEY (Patient_Id) REFERENCES Dim_Patient(Patient_Id),
    FOREIGN KEY (Date_Id) REFERENCES Dim_Date(Date_Id)
);
GO

CREATE TABLE Fact_Billing (
    Fact_Billings_Id INT PRIMARY KEY,
    Patient_Id INT,
    Bill_Id INT,
    Date_Id INT,
    Total_Amount DECIMAL(10, 2),
    Payment_Status NVARCHAR(20),
    FOREIGN KEY (Patient_Id) REFERENCES Dim_Patient(Patient_Id),
    FOREIGN KEY (Bill_Id) REFERENCES Dim_Bill(Bill_Id),
    FOREIGN KEY (Date_Id) REFERENCES Dim_Date(Date_Id)
);
GO


