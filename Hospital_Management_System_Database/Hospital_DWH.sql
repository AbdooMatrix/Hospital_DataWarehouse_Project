-- Create the Hospital_DWH database
CREATE DATABASE Hospital_DWH;
GO

-- Use the Hospital_DWH database
USE Hospital_DWH;
GO

-- Create Staging Schema
CREATE SCHEMA Staging;
GO

-- Create Staging Tables (aligned with Hospital_OLTP schema)

CREATE TABLE Staging.Patients (
    patient_id INT,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    date_of_birth DATE,
    gender CHAR(1),
    contact_number NVARCHAR(15),
    address NVARCHAR(255),
    email NVARCHAR(100),
    medical_history NVARCHAR(MAX),
    created_at DATETIME
);
GO

CREATE TABLE Staging.Appointments (
    appointment_id INT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    purpose NVARCHAR(255),
    status NVARCHAR(20),
    created_at DATETIME
);
GO

CREATE TABLE Staging.Room_Assignments (
    assignment_id INT,
    room_id INT,
    staff_id INT,
    patient_id INT,
    assignment_date DATETIME,
    end_date DATETIME
);
GO

CREATE TABLE Staging.Rooms (
    room_id INT,
    room_number VARCHAR(10),
    room_type_id INT,
    capacity INT,
    status NVARCHAR(20),
    last_serviced DATE
);
GO

CREATE TABLE Staging.Departments (
    department_id INT,
    department_name VARCHAR(50),
    location VARCHAR(100)
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
    brand NVARCHAR(50),
    type NVARCHAR(20),
    dosage NVARCHAR(50),
    stock_quantity INT,
    expiry_date DATE,
    created_at DATETIME
);
GO

CREATE TABLE Staging.Ambulance_Log (
    log_id INT,
    ambulance_id INT,
    patient_id INT,
    pickup_location NVARCHAR(100),
    dropoff_location NVARCHAR(100),
    pickup_time DATETIME,
    dropoff_time DATETIME,
    status NVARCHAR(15)
);
GO

CREATE TABLE Staging.Ambulance (
    ambulance_id INT,
    ambulance_number VARCHAR(10),
    availability NVARCHAR(15),
    driver_id INT,
    last_service_date DATE
);
GO

CREATE TABLE Staging.Billing (
    bill_id INT,
    patient_id INT,
    appointment_id INT,
    total_amount DECIMAL(10, 2),
    payment_status NVARCHAR(20),
    payment_date DATE,
    insurance_provider NVARCHAR(100),
    created_at DATETIME
);
GO

-- Create Error Log Table
CREATE TABLE ETL_Error_Log (
    Error_Id INT IDENTITY(1,1) PRIMARY KEY,
    Table_Name VARCHAR(50),
    Error_Message VARCHAR(500),
    Error_Date DATETIME DEFAULT GETDATE()
);
GO

-- Create Main Schema Dimension Tables

CREATE TABLE Dim_Patient (
    Patient_Id INT PRIMARY KEY,
    First_Name NVARCHAR(50),
    Last_Name NVARCHAR(50),
    Date_of_Birth DATE,
    Gender CHAR(1),
    Address NVARCHAR(255),
    Email NVARCHAR(100)
);
GO

CREATE TABLE Dim_Time (
    Date_Id INT PRIMARY KEY,
    Full_Date DATE,
    Month INT,
    Year INT,
	Day INT
);
GO

CREATE TABLE Dim_Room (
    Room_Id INT PRIMARY KEY,
    Room_Type_Id INT,
    Room_Number VARCHAR(10),
    Capacity INT,
    Status NVARCHAR(20)
);
GO

CREATE TABLE Dim_Department (
    Department_Id INT PRIMARY KEY,
    Department_Name VARCHAR(50),
    Location VARCHAR(100)
);
GO

CREATE TABLE Dim_Medicine (
    Medicine_Id INT PRIMARY KEY,
    Brand NVARCHAR(50),
    Name NVARCHAR(100),
    Dosage NVARCHAR(50),
    Stock_Quantity INT
);
GO

CREATE TABLE Dim_Pharmacy (
    Pharmacy_Id INT PRIMARY KEY,
    Location NVARCHAR(100),
    Contact_Details NVARCHAR(100)
);
GO

CREATE TABLE Dim_Ambulance (
    Ambulance_Id INT PRIMARY KEY,
    Ambulance_Number VARCHAR(10),
    Driver_Id INT,
    Availability NVARCHAR(15),
    Last_Service_Date DATE
);
GO

CREATE TABLE Dim_Location (
    Location_Id INT PRIMARY KEY,
    Pickup_Location NVARCHAR(100),
    Drop_Off_Location NVARCHAR(100),
    City NVARCHAR(50),
    Region NVARCHAR(50)
);
GO

-- Create Main Schema Fact Tables

CREATE TABLE Fact_Patient_Admissions (
    Fact_PatAdm_Id INT PRIMARY KEY IDENTITY(1,1),
    Patient_Id INT,
    Date_Id INT,
    Room_Id INT,
    Department_Id INT,
    Number_of_Admissions INT,
    Length_of_Stay INT,
    Admission_Cost DECIMAL(10, 2),
    FOREIGN KEY (Patient_Id) REFERENCES Dim_Patient(Patient_Id),
    FOREIGN KEY (Date_Id) REFERENCES Dim_Time(Date_Id),
    FOREIGN KEY (Room_Id) REFERENCES Dim_Room(Room_Id),
    FOREIGN KEY (Department_Id) REFERENCES Dim_Department(Department_Id)
);
GO

CREATE TABLE Fact_Prescription_Fulfillment (
    Fact_PrescFul_Id INT PRIMARY KEY IDENTITY(1,1),
    Patient_Id INT,
    Date_Id INT,
    Medicine_Id INT,
    Pharmacy_Id INT,
    Quantity_Dispensed INT,
    Cost_of_Medication DECIMAL(10, 2),
    Number_of_Refills INT,
    FOREIGN KEY (Patient_Id) REFERENCES Dim_Patient(Patient_Id),
    FOREIGN KEY (Date_Id) REFERENCES Dim_Time(Date_Id),
    FOREIGN KEY (Medicine_Id) REFERENCES Dim_Medicine(Medicine_Id),
    FOREIGN KEY (Pharmacy_Id) REFERENCES Dim_Pharmacy(Pharmacy_Id)
);
GO

CREATE TABLE Fact_Ambulance_Services (
    Fact_AmbServ_Id INT PRIMARY KEY IDENTITY(1,1),
    Patient_Id INT,
    Date_Id INT,
    Ambulance_Id INT,
    Location_Id INT,
    Distance_Traveled DECIMAL(10, 2),
    Service_Duration INT,
    Service_Cost DECIMAL(10, 2),
    FOREIGN KEY (Patient_Id) REFERENCES Dim_Patient(Patient_Id),
    FOREIGN KEY (Date_Id) REFERENCES Dim_Time(Date_Id),
    FOREIGN KEY (Ambulance_Id) REFERENCES Dim_Ambulance(Ambulance_Id),
    FOREIGN KEY (Location_Id) REFERENCES Dim_Location(Location_Id)
);
GO

-- Add Indexes for Performance
CREATE INDEX IX_Fact_Patient_Admissions_Patient_Id ON Fact_Patient_Admissions(Patient_Id);
CREATE INDEX IX_Fact_Patient_Admissions_Date_Id ON Fact_Patient_Admissions(Date_Id);
CREATE INDEX IX_Fact_Patient_Admissions_Room_Id ON Fact_Patient_Admissions(Room_Id);
CREATE INDEX IX_Fact_Patient_Admissions_Department_Id ON Fact_Patient_Admissions(Department_Id);

CREATE INDEX IX_Fact_Prescription_Fulfillment_Patient_Id ON Fact_Prescription_Fulfillment(Patient_Id);
CREATE INDEX IX_Fact_Prescription_Fulfillment_Date_Id ON Fact_Prescription_Fulfillment(Date_Id);
CREATE INDEX IX_Fact_Prescription_Fulfillment_Medicine_Id ON Fact_Prescription_Fulfillment(Medicine_Id);
CREATE INDEX IX_Fact_Prescription_Fulfillment_Pharmacy_Id ON Fact_Prescription_Fulfillment(Pharmacy_Id);

CREATE INDEX IX_Fact_Ambulance_Services_Patient_Id ON Fact_Ambulance_Services(Patient_Id);
CREATE INDEX IX_Fact_Ambulance_Services_Date_Id ON Fact_Ambulance_Services(Date_Id);
CREATE INDEX IX_Fact_Ambulance_Services_Ambulance_Id ON Fact_Ambulance_Services(Ambulance_Id);
CREATE INDEX IX_Fact_Ambulance_Services_Location_Id ON Fact_Ambulance_Services(Location_Id);
GO