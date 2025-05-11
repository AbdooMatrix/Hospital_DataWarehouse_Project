-- Create the Hospital_DWH database
CREATE DATABASE Hospital_DWH;
GO

-- Use the Hospital_DWH database
USE Hospital_DWH;
GO

-- Create Staging Schema
CREATE SCHEMA Staging;
GO

-- Create Staging Tables
CREATE TABLE Staging.Patients (
    patient_id INT,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    date_of_birth DATE,
    gender CHAR(1)
);
GO

CREATE TABLE Staging.Appointments (
    appointment_id INT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE
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
    type NVARCHAR(20)
);
GO

CREATE TABLE Staging.Billing (
    bill_id INT,
    patient_id INT,
    total_amount DECIMAL(10, 2),
    payment_date DATE
);
GO

CREATE TABLE Staging.Doctors (
    doctor_id INT,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
	specialty NVARCHAR(100)
);
GO

CREATE TABLE Staging.Rooms (
    room_id INT,
    room_number VARCHAR(10),
    capacity INT,
    room_type_id INT
);
GO

CREATE TABLE Staging.Rooms_Types (
    room_type_id INT,
    room_type_name NVARCHAR(50)
);
GO

CREATE TABLE Staging.Staff (
    staff_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE
);
GO

CREATE TABLE Staging.Cleaning_Service (
    service_id INT,
    room_id INT,
    staff_id INT,
    service_date DATE
);
GO

-- Create Main Schema Dimension Tables
CREATE TABLE Dim_Patient (
    Patient_Surrogate_Id INT IDENTITY(1,1) PRIMARY KEY,
    Patient_Id INT,
    First_Name NVARCHAR(50),
    Last_Name NVARCHAR(50),
    Date_Of_Birth DATE,
    Gender CHAR(1)
);
GO

CREATE TABLE Dim_Date (
    Date_Key INT PRIMARY KEY,
    Full_Date DATE,
    Month INT,
    Year INT,
    Day INT
);
GO

CREATE TABLE Dim_Medicine (
    Medicine_Surrogate_Id INT IDENTITY(1,1) PRIMARY KEY,
    Medicine_Id INT,
    Medicine_Name NVARCHAR(100),
    Medicine_Type NVARCHAR(20)
);
GO

CREATE TABLE Dim_Doctor (
    Doctor_Surrogate_Id INT IDENTITY(1,1) PRIMARY KEY,
    Doctor_Id INT,
    First_Name NVARCHAR(50),
    Last_Name NVARCHAR(50),
    Specialty NVARCHAR(100)
);
GO

CREATE TABLE Dim_Room (
    Room_Surrogate_Id INT IDENTITY(1,1) PRIMARY KEY,
    Room_Id INT,
    Room_Number VARCHAR(10),
    Capacity INT,
    Room_Type NVARCHAR(50)
);
GO

CREATE TABLE Dim_Staff (
    Staff_Surrogate_Id INT IDENTITY(1,1) PRIMARY KEY,
    Staff_Id INT,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    hire_date DATE
);
GO

-- Create Main Schema Fact Tables
CREATE TABLE Fact_Pharmacy (
	Fact_Pharmacy_Id INT IDENTITY(1,1) PRIMARY KEY,
    Pharmacy_Id INT,
    Medicine_Surrogate_Id INT,
    Patient_Surrogate_Id INT,
    Prescription_Date_Key INT,
    Quantity INT,
    FOREIGN KEY (Medicine_Surrogate_Id) REFERENCES Dim_Medicine(Medicine_Surrogate_Id),
    FOREIGN KEY (Patient_Surrogate_Id) REFERENCES Dim_Patient(Patient_Surrogate_Id),
    FOREIGN KEY (Prescription_Date_Key) REFERENCES Dim_Date(Date_Key)
);
GO

CREATE TABLE Fact_Appointments (
	Fact_Appointments_Id INT IDENTITY(1,1) PRIMARY KEY,
    Appointment_Id INT,
    Doctor_Surrogate_Id INT,
    Patient_Surrogate_Id INT,
    Appointment_Date_Key INT,
    FOREIGN KEY (Doctor_Surrogate_Id) REFERENCES Dim_Doctor(Doctor_Surrogate_Id),
    FOREIGN KEY (Patient_Surrogate_Id) REFERENCES Dim_Patient(Patient_Surrogate_Id),
    FOREIGN KEY (Appointment_Date_Key) REFERENCES Dim_Date(Date_Key)
);
GO

CREATE TABLE Fact_Billing (
    Fact_Billing_Id INT IDENTITY(1,1) PRIMARY KEY,
	Bill_Id INT,
    Patient_Surrogate_Id INT,
    Payment_Date_Key INT,
    Total_Amount DECIMAL(10, 2),
    FOREIGN KEY (Patient_Surrogate_Id) REFERENCES Dim_Patient(Patient_Surrogate_Id),
    FOREIGN KEY (Payment_Date_Key) REFERENCES Dim_Date(Date_Key)
);
GO

CREATE TABLE Fact_Cleaning_Service (
	Fact_CleaningService_Id INT IDENTITY(1,1) PRIMARY KEY,
    Service_Id INT,
    Room_Surrogate_Id INT,
    Staff_Surrogate_Id INT,
    Service_Date_Key INT,
    Service_Count INT,
    FOREIGN KEY (Room_Surrogate_Id) REFERENCES Dim_Room(Room_Surrogate_Id),
    FOREIGN KEY (Staff_Surrogate_Id) REFERENCES Dim_Staff(Staff_Surrogate_Id),
    FOREIGN KEY (Service_Date_Key) REFERENCES Dim_Date(Date_Key)
);
GO

select * from Dim_Patient;
select * from Fact_Pharmacy;
select * from Fact_Appointments;
select * from Fact_Billing;
select * from Fact_Cleaning_Service;

-- Delete from Fact Tables first
DELETE FROM Fact_Cleaning_Service;
DBCC CHECKIDENT ('Fact_Cleaning_Service', RESEED, 0);

DELETE FROM Fact_Billing;
DBCC CHECKIDENT ('Fact_Billing', RESEED, 0);

DELETE FROM Fact_Appointments;
DBCC CHECKIDENT ('Fact_Appointments', RESEED, 0);

DELETE FROM Fact_Pharmacy;
DBCC CHECKIDENT ('Fact_Pharmacy', RESEED, 0);

-- Then delete from Dimension Tables and reset identity
DELETE FROM Dim_Staff;
DBCC CHECKIDENT ('Dim_Staff', RESEED, 0);

DELETE FROM Dim_Room;
DBCC CHECKIDENT ('Dim_Room', RESEED, 0);

DELETE FROM Dim_Doctor;
DBCC CHECKIDENT ('Dim_Doctor', RESEED, 0);

DELETE FROM Dim_Medicine;
DBCC CHECKIDENT ('Dim_Medicine', RESEED, 0);

DELETE FROM Dim_Patient;
DBCC CHECKIDENT ('Dim_Patient', RESEED, 0);

DELETE FROM Dim_Date;
DBCC CHECKIDENT ('Dim_Date', RESEED, 0);
