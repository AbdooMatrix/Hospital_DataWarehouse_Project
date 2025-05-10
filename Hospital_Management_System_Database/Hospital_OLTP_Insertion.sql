-- Disable foreign key constraints to allow deletion
EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL';

-- Delete data from child tables first
DELETE FROM Medical_Records_Medicine;
DELETE FROM Pharmacy;
DELETE FROM Room_Assignments;
DELETE FROM Cleaning_Service;
DELETE FROM Ambulance_Log;
DELETE FROM Nurses;
DELETE FROM Workers;
DELETE FROM Prescription;
DELETE FROM Billing;
DELETE FROM Doctor_Department;

-- Delete data from tables with foreign key dependencies
DELETE FROM Medical_Records;
DELETE FROM Appointments;
DELETE FROM Ambulance;
DELETE FROM Rooms;

-- Delete data from parent tables
DELETE FROM Medicine;
DELETE FROM Blood_Bank;
DELETE FROM Staff;
DELETE FROM Room_Types;
DELETE FROM Patients;
DELETE FROM Doctors;
DELETE FROM Departments;

-- Re-enable foreign key constraints
EXEC sp_MSforeachtable 'ALTER TABLE ? CHECK CONSTRAINT ALL';

-- Optional: Reset identity columns (if any)
DBCC CHECKIDENT ('Patients', RESEED, 0);
DBCC CHECKIDENT ('Doctors', RESEED, 0);
DBCC CHECKIDENT ('Departments', RESEED, 0);
DBCC CHECKIDENT ('Appointments', RESEED, 0);
DBCC CHECKIDENT ('Medicine', RESEED, 0);
DBCC CHECKIDENT ('Medical_Records', RESEED, 0);
DBCC CHECKIDENT ('Staff', RESEED, 0);
DBCC CHECKIDENT ('Ambulance', RESEED, 0);
DBCC CHECKIDENT ('Rooms', RESEED, 0);
DBCC CHECKIDENT ('Room_Types', RESEED, 0);
DBCC CHECKIDENT ('Pharmacy', RESEED, 0);
GO

INSERT INTO Patients (first_name, last_name, date_of_birth, gender, contact_number, address, email, medical_history)
VALUES
	('John', 'Doe', '1985-05-15', 'M', '555-1234', '123 Elm St, Springfield, IL', 'john.doe@email.com', 'Hypertension'),
	('Jane', 'Smith', '1992-08-22', 'F', '555-5678', '456 Oak St, Springfield, IL', 'jane.smith@email.com', 'Asthma'),
	('Michael', 'Johnson', '1975-02-10', 'M', '555-8765', '789 Pine St, Springfield, IL', 'michael.johnson@email.com', 'Diabetes'),
	('Emily', 'Davis', '2000-11-30', 'F', '555-4321', '321 Birch St, Springfield, IL', 'emily.davis@email.com', 'None'),
	('Daniel', 'Brown', '1990-03-25', 'M', '555-6543', '654 Maple St, Springfield, IL', 'daniel.brown@email.com', 'Migraine'),
	('Olivia', 'Martinez', '1980-07-10', 'F', '555-9876', '987 Cedar St, Springfield, IL', 'olivia.martinez@email.com', 'Arthritis'),
	('James', 'Wilson', '1965-01-14', 'M', '555-1357', '159 Elm St, Springfield, IL', 'james.wilson@email.com', 'Heart disease'),
	('Sophia', 'Moore', '1995-04-05', 'F', '555-2468', '753 Oak St, Springfield, IL', 'sophia.moore@email.com', 'None'),
	('David', 'Taylor', '1983-09-20', 'M', '555-3579', '369 Pine St, Springfield, IL', 'david.taylor@email.com', 'High cholesterol'),
	('Isabella', 'Anderson', '2005-12-01', 'F', '555-4680', '741 Birch St, Springfield, IL', 'isabella.anderson@email.com', 'None'),
	('Fatima', 'Hussein', '1990-04-12', 'F', '555-2145', '112 Cedar St, Chicago, IL', 'fatima.hussein@email.com', 'Thyroid disorder'),
    ('Juan', 'Rodriguez', '1982-07-19', 'M', '555-3256', '223 Maple St, Chicago, IL', 'juan.rodriguez@email.com', 'Chronic back pain'),
    ('Ananya', 'Verma', '1995-09-03', 'F', '555-4367', '334 Oak St, Chicago, IL', 'ananya.verma@email.com', 'None'),
    ('Tomas', 'Santos', '1978-12-25', 'M', '555-5478', '445 Pine St, Chicago, IL', 'tomas.santos@email.com', 'Gastritis'),
    ('Li', 'Wang', '1987-03-15', 'F', '555-6589', '556 Elm St, Chicago, IL', 'li.wang@email.com', 'Allergies'),
    ('Omar', 'Abdullah', '1993-06-08', 'M', '555-7690', '667 Birch St, Chicago, IL', 'omar.abdullah@email.com', 'Asthma'),
    ('Sofia', 'Mendez', '2000-01-22', 'F', '555-8701', '778 Willow St, Chicago, IL', 'sofia.mendez@email.com', 'None'),
    ('Elijah', 'Okonkwo', '1985-11-30', 'M', '555-9812', '889 Spruce St, Chicago, IL', 'elijah.okonkwo@email.com', 'Hypertension'),
    ('Amina', 'Diallo', '1997-02-14', 'F', '555-0923', '990 Cedar St, Chicago, IL', 'amina.diallo@email.com', 'Migraine'),
    ('Hassan', 'Malik', '1975-08-09', 'M', '555-1034', '101 Aspen St, Chicago, IL', 'hassan.malik@email.com', 'Diabetes'),
    ('Priya', 'Nair', '1992-05-27', 'F', '555-2145', '212 Hazel St, Chicago, IL', 'priya.nair@email.com', 'None'),
    ('Lucas', 'Fernandes', '1980-10-16', 'M', '555-3256', '323 Laurel St, Chicago, IL', 'lucas.fernandes@email.com', 'Arthritis'),
    ('Yuki', 'Sato', '1998-07-04', 'F', '555-4367', '434 Magnolia St, Chicago, IL', 'yuki.sato@email.com', 'None'),
    ('Amir', 'Rahim', '1983-04-19', 'M', '555-5478', '545 Poplar St, Chicago, IL', 'amir.rahim@email.com', 'High cholesterol'),
    ('Clara', 'Oliveira', '2001-12-01', 'F', '555-6589', '656 Sycamore St, Chicago, IL', 'clara.oliveira@email.com', 'None'),
    ('Ibrahim', 'Suleiman', '1979-09-13', 'M', '555-7690', '767 Walnut St, Chicago, IL', 'ibrahim.suleiman@email.com', 'Heart disease'),
    ('Elena', 'Popov', '1994-06-25', 'F', '555-8701', '878 Birch St, Chicago, IL', 'elena.popov@email.com', 'Asthma'),
    ('Noah', 'Adeyemi', '1988-03-10', 'M', '555-9812', '989 Cedar St, Chicago, IL', 'noah.adeyemi@email.com', 'None'),
    ('Zara', 'Khan', '1996-11-05', 'F', '555-0923', '100 Elm St, Chicago, IL', 'zara.khan@email.com', 'Allergies'),
    ('Diego', 'Lopez', '1981-02-28', 'M', '555-1034', '211 Maple St, Chicago, IL', 'diego.lopez@email.com', 'Hypertension'),
    ('Nia', 'Mensah', '1999-08-17', 'F', '555-2145', '322 Oak St, Chicago, IL', 'nia.mensah@email.com', 'None'),
    ('Ravi', 'Kumar', '1977-05-12', 'M', '555-3256', '433 Pine St, Chicago, IL', 'ravi.kumar@email.com', 'Diabetes'),
    ('Maya', 'Torres', '1993-01-09', 'F', '555-4367', '544 Birch St, Chicago, IL', 'maya.torres@email.com', 'Migraine'),
    ('Ahmed', 'Farooq', '1986-10-22', 'M', '555-5478', '655 Willow St, Chicago, IL', 'ahmed.farooq@email.com', 'None'),
    ('Lila', 'Patel', '2000-04-03', 'F', '555-6589', '766 Spruce St, Chicago, IL', 'lila.patel@email.com', 'Arthritis'),
    ('Mateo', 'Cruz', '1984-07-15', 'M', '555-7690', '877 Cedar St, Chicago, IL', 'mateo.cruz@email.com', 'High cholesterol'),
    ('Ava', 'Nguyen', '1997-12-28', 'F', '555-8701', '988 Elm St, Chicago, IL', 'ava.nguyen@email.com', 'None'),
    ('Jamal', 'Wilson', '1979-06-11', 'M', '555-9812', '109 Maple St, Chicago, IL', 'jamal.wilson@email.com', 'Asthma'),
    ('Sana', 'Ahmed', '1995-03-04', 'F', '555-0923', '210 Oak St, Chicago, IL', 'sana.ahmed@email.com', 'None'),
    ('Gabriel', 'Silva', '1982-09-19', 'M', '555-1034', '321 Pine St, Chicago, IL', 'gabriel.silva@email.com', 'Hypertension'),
    ('Esme', 'Garcia', '2001-02-14', 'F', '555-2145', '432 Birch St, Chicago, IL', 'esme.garcia@email.com', 'None'),
    ('Khalid', 'Yusuf', '1987-11-07', 'M', '555-3256', '543 Willow St, Chicago, IL', 'khalid.yusuf@email.com', 'Diabetes'),
    ('Leah', 'Cohen', '1994-08-22', 'F', '555-4367', '654 Spruce St, Chicago, IL', 'leah.cohen@email.com', 'Migraine'),
    ('Arjun', 'Mehta', '1980-05-16', 'M', '555-5478', '765 Cedar St, Chicago, IL', 'arjun.mehta@email.com', 'None'),
    ('Zoe', 'Hernandez', '1998-10-31', 'F', '555-6589', '876 Elm St, Chicago, IL', 'zoe.hernandez@email.com', 'Allergies'),
    ('Malik', 'Davis', '1983-04-05', 'M', '555-7690', '987 Maple St, Chicago, IL', 'malik.davis@email.com', 'Heart disease'),
    ('Amara', 'Osei', '1996-01-18', 'F', '555-8701', '108 Oak St, Chicago, IL', 'amara.osei@email.com', 'None'),
    ('Hiro', 'Yamamoto', '1978-12-03', 'M', '555-9812', '219 Pine St, Chicago, IL', 'hiro.yamamoto@email.com', 'High cholesterol'),
    ('Lina', 'Kim', '1992-07-26', 'F', '555-0923', '320 Birch St, Chicago, IL', 'lina.kim@email.com', 'Asthma'),
    ('Tariq', 'Hassan', '1985-02-11', 'M', '555-1034', '431 Willow St, Chicago, IL', 'tariq.hassan@email.com', 'None'),
    ('Isla', 'Ramos', '2000-09-14', 'F', '555-2145', '542 Spruce St, Chicago, IL', 'isla.ramos@email.com', 'Migraine'),
    ('Caleb', 'Owens', '1981-06-29', 'M', '555-3256', '653 Cedar St, Chicago, IL', 'caleb.owens@email.com', 'Hypertension'),
    ('Mira', 'Sharma', '1997-03-02', 'F', '555-4367', '764 Elm St, Chicago, IL', 'mira.sharma@email.com', 'None'),
    ('Omar', 'Iqbal', '1989-10-17', 'M', '555-5478', '875 Maple St, Chicago, IL', 'omar.iqbal@email.com', 'Diabetes'),
    ('Ella', 'Moreno', '1994-05-01', 'F', '555-6589', '986 Oak St, Chicago, IL', 'ella.moreno@email.com', 'Allergies'),
    ('Jaden', 'Park', '1986-12-14', 'M', '555-7690', '107 Pine St, Chicago, IL', 'jaden.park@email.com', 'None'),
    ('Aisha', 'Siddiqui', '2001-07-09', 'F', '555-8701', '218 Birch St, Chicago, IL', 'aisha.siddiqui@email.com', 'Asthma'),
    ('Liam', 'Gonzalez', '1983-04-22', 'M', '555-9812', '329 Willow St, Chicago, IL', 'liam.gonzalez@email.com', 'High cholesterol'),
    ('Sofia', 'Vega', '1998-11-05', 'F', '555-0923', '430 Spruce St, Chicago, IL', 'sofia.vega@email.com', 'None'),
    ('Elias', 'Mahmoud', '1979-08-20', 'M', '555-1034', '541 Cedar St, Chicago, IL', 'elias.mahmoud@email.com', 'Heart disease');

INSERT INTO Doctors (first_name, last_name, specialty, contact_number, email, available_schedule)
VALUES
	('Dr. Alice', 'Miller', 'Cardiology', '555-1122', 'alice.miller@email.com', 'Mon-Wed 9AM-5PM'),
	('Dr. Bob', 'Williams', 'Neurology', '555-2233', 'bob.williams@email.com', 'Tue-Thu 10AM-6PM'),
	('Dr. Charlie', 'Brown', 'Orthopedics', '555-3344', 'charlie.brown@email.com', 'Mon-Fri 8AM-4PM'),
	('Dr. Diana', 'Jones', 'Dermatology', '555-4455', 'diana.jones@email.com', 'Mon-Fri 9AM-5PM'),
	('Dr. Eva', 'Garcia', 'Pediatrics', '555-5566', 'eva.garcia@email.com', 'Wed-Fri 10AM-6PM'),
	('Dr. Frank', 'Martinez', 'General Surgery', '555-6677', 'frank.martinez@email.com', 'Mon-Tue 8AM-3PM'),
	('Dr. Grace', 'Rodriguez', 'Gynecology', '555-7788', 'grace.rodriguez@email.com', 'Tue-Thu 9AM-5PM'),
	('Dr. Henry', 'Lee', 'Psychiatry', '555-8899', 'henry.lee@email.com', 'Mon-Fri 9AM-4PM'),
	('Dr. Ivy', 'Lopez', 'Ophthalmology', '555-9900', 'ivy.lopez@email.com', 'Mon-Wed 8AM-5PM'),
	('Dr. Jack', 'White', 'ENT', '555-1010', 'jack.white@email.com', 'Tue-Fri 10AM-6PM'),
	('Dr. Amina', 'Siddiqui', 'Endocrinology', '555-9012', 'amina.siddiqui@email.com', 'Mon-Fri 8AM-4PM'),
    ('Dr. Javier', 'Morales', 'Gastroenterology', '555-9123', 'javier.morales@email.com', 'Tue-Thu 9AM-5PM'),
    ('Dr. Priya', 'Chopra', 'Oncology', '555-9234', 'priya.chopra@email.com', 'Mon-Wed 10AM-6PM'),
    ('Dr. Hiroshi', 'Tanaka', 'Rheumatology', '555-9345', 'hiroshi.tanaka@email.com', 'Wed-Fri 8AM-4PM'),
    ('Dr. Sofia', 'Reyes', 'Urology', '555-9456', 'sofia.reyes@email.com', 'Mon-Tue 9AM-5PM'),
    ('Dr. Omar', 'Hassan', 'Nephrology', '555-9567', 'omar.hassan@email.com', 'Tue-Fri 10AM-6PM'),
    ('Dr. Elena', 'Popova', 'Pulmonology', '555-9678', 'elena.popova@email.com', 'Mon-Thu 8AM-4PM'),
    ('Dr. Sanjay', 'Verma', 'Hematology', '555-9789', 'sanjay.verma@email.com', 'Wed-Fri 9AM-5PM'),
    ('Dr. Mei', 'Lin', 'Allergy', '555-9890', 'mei.lin@email.com', 'Mon-Wed 8AM-3PM'),
    ('Dr. Diego', 'Cruz', 'Cardiothoracic Surgery', '555-9901', 'diego.cruz@email.com', 'Tue-Thu 10AM-6PM'),
    ('Dr. Zara', 'Khan', 'Infectious Diseases', '555-0012', 'zara.khan@email.com', 'Mon-Fri 9AM-5PM'),
    ('Dr. Ravi', 'Patel', 'Neurosurgery', '555-0123', 'ravi.patel@email.com', 'Tue-Thu 8AM-4PM'),
    ('Dr. Amara', 'Okeke', 'Pediatric Surgery', '555-0234', 'amara.okeke@email.com', 'Mon-Wed 10AM-6PM'),
    ('Dr. Yusuf', 'Ali', 'Plastic Surgery', '555-0345', 'yusuf.ali@email.com', 'Wed-Fri 9AM-5PM'),
    ('Dr. Lila', 'Nguyen', 'Geriatrics', '555-0456', 'lila.nguyen@email.com', 'Mon-Tue 8AM-4PM'),
    ('Dr. Tariq', 'Malik', 'Radiology', '555-0567', 'tariq.malik@email.com', 'Tue-Fri 10AM-6PM'),
    ('Dr. Anika', 'Reddy', 'Cardiology', '555-0678', 'anika.reddy@email.com', 'Mon-Thu 9AM-5PM'),
    ('Dr. Wei', 'Chen', 'Neurology', '555-0789', 'wei.chen@email.com', 'Wed-Fri 8AM-4PM'),
    ('Dr. Clara', 'Oliveira', 'Orthopedics', '555-0890', 'clara.oliveira@email.com', 'Mon-Wed 9AM-5PM'),
    ('Dr. Ibrahim', 'Suleiman', 'Dermatology', '555-0901', 'ibrahim.suleiman@email.com', 'Tue-Thu 10AM-6PM'),
    ('Dr. Nia', 'Mensah', 'Pediatrics', '555-1012', 'nia.mensah@email.com', 'Mon-Fri 8AM-4PM'),
    ('Dr. Lucas', 'Fernandes', 'General Surgery', '555-1123', 'lucas.fernandes@email.com', 'Tue-Thu 9AM-5PM'),
    ('Dr. Aisha', 'Diallo', 'Gynecology', '555-1234', 'aisha.diallo@email.com', 'Mon-Wed 10AM-6PM'),
    ('Dr. Hassan', 'Malik', 'Psychiatry', '555-1345', 'hassan.malik@email.com', 'Wed-Fri 8AM-4PM'),
    ('Dr. Yuki', 'Sato', 'Ophthalmology', '555-1456', 'yuki.sato@email.com', 'Mon-Tue 9AM-5PM'),
    ('Dr. Amir', 'Rahim', 'ENT', '555-1567', 'amir.rahim@email.com', 'Tue-Fri 10AM-6PM'),
    ('Dr. Maya', 'Torres', 'Endocrinology', '555-1678', 'maya.torres@email.com', 'Mon-Thu 8AM-4PM'),
    ('Dr. Ahmed', 'Farooq', 'Gastroenterology', '555-1789', 'ahmed.farooq@email.com', 'Wed-Fri 9AM-5PM'),
    ('Dr. Lila', 'Patel', 'Oncology', '555-1890', 'lila.patel@email.com', 'Mon-Wed 8AM-3PM'),
    ('Dr. Mateo', 'Cruz', 'Rheumatology', '555-1901', 'mateo.cruz@email.com', 'Tue-Thu 10AM-6PM'),
    ('Dr. Ava', 'Nguyen', 'Urology', '555-2012', 'ava.nguyen@email.com', 'Mon-Fri 9AM-5PM'),
    ('Dr. Jamal', 'Wilson', 'Nephrology', '555-2123', 'jamal.wilson@email.com', 'Tue-Thu 8AM-4PM'),
    ('Dr. Sana', 'Ahmed', 'Pulmonology', '555-2234', 'sana.ahmed@email.com', 'Mon-Wed 10AM-6PM'),
    ('Dr. Gabriel', 'Silva', 'Hematology', '555-2345', 'gabriel.silva@email.com', 'Wed-Fri 9AM-5PM'),
    ('Dr. Esme', 'Garcia', 'Allergy', '555-2456', 'esme.garcia@email.com', 'Mon-Tue 8AM-4PM'),
    ('Dr. Khalid', 'Yusuf', 'Cardiothoracic Surgery', '555-2567', 'khalid.yusuf@email.com', 'Tue-Fri 10AM-6PM'),
    ('Dr. Leah', 'Cohen', 'Infectious Diseases', '555-2678', 'leah.cohen@email.com', 'Mon-Thu 9AM-5PM'),
    ('Dr. Arjun', 'Mehta', 'Neurosurgery', '555-2789', 'arjun.mehta@email.com', 'Wed-Fri 8AM-4PM'),
    ('Dr. Zoe', 'Hernandez', 'Pediatric Surgery', '555-2890', 'zoe.hernandez@email.com', 'Mon-Wed 9AM-5PM'),
    ('Dr. Malik', 'Davis', 'Plastic Surgery', '555-2901', 'malik.davis@email.com', 'Tue-Thu 10AM-6PM'),
    ('Dr. Amara', 'Osei', 'Geriatrics', '555-3012', 'amara.osei@email.com', 'Mon-Fri 8AM-4PM'),
    ('Dr. Hiro', 'Yamamoto', 'Radiology', '555-3123', 'hiro.yamamoto@email.com', 'Tue-Thu 9AM-5PM'),
    ('Dr. Lina', 'Kim', 'Cardiology', '555-3234', 'lina.kim@email.com', 'Mon-Wed 10AM-6PM'),
    ('Dr. Tariq', 'Hassan', 'Neurology', '555-3345', 'tariq.hassan@email.com', 'Wed-Fri 8AM-4PM'),
    ('Dr. Isla', 'Ramos', 'Orthopedics', '555-3456', 'isla.ramos@email.com', 'Mon-Tue 9AM-5PM'),
    ('Dr. Caleb', 'Owens', 'Dermatology', '555-3567', 'caleb.owens@email.com', 'Tue-Fri 10AM-6PM'),
    ('Dr. Mira', 'Sharma', 'Pediatrics', '555-3678', 'mira.sharma@email.com', 'Mon-Thu 8AM-4PM'),
    ('Dr. Omar', 'Iqbal', 'General Surgery', '555-3789', 'omar.iqbal@email.com', 'Wed-Fri 9AM-5PM'),
    ('Dr. Ella', 'Moreno', 'Gynecology', '555-3890', 'ella.moreno@email.com', 'Mon-Wed 8AM-3PM'),
    ('Dr. Jaden', 'Park', 'Psychiatry', '555-3901', 'jaden.park@email.com', 'Tue-Thu 10AM-6PM');

INSERT INTO Departments (department_name, location)
VALUES
	('Cardiology', '2nd Floor'),
	('Neurology', '3rd Floor'),
	('Orthopedics', '4th Floor'),
	('Dermatology', '1st Floor'),
	('Pediatrics', '2nd Floor'),
	('General Surgery', '5th Floor'),
	('Gynecology', '3rd Floor'),
	('Psychiatry', '6th Floor'),
	('Ophthalmology', '4th Floor'),
	('ENT', '1st Floor'),
	('Endocrinology', 'Building A, 7th Floor'),
    ('Gastroenterology', 'Building B, 5th Floor'),
    ('Oncology', 'Building A, 8th Floor'),
    ('Rheumatology', 'Building C, 3rd Floor'),
    ('Nephrology', 'Building B, 6th Floor'),
    ('Pulmonology', 'Building A, 9th Floor'),
    ('Infectious Diseases', 'Building C, 4th Floor'),
    ('Neurosurgery', 'Building B, 7th Floor'),
    ('Pediatric Surgery', 'Building A, 10th Floor'),
    ('Geriatrics', 'Building C, 5th Floor');

-- Insert sample data for Doctor_Department (Many-to-Many relationship)
INSERT INTO Doctor_Department (doctor_id, department_id)
VALUES
	(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
	(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
	(11, 11), -- Dr. Amina Siddiqui (Endocrinology) to Endocrinology
    (12, 12), -- Dr. Javier Morales (Gastroenterology) to Gastroenterology
    (13, 13), -- Dr. Priya Chopra (Oncology) to Oncology
    (14, 14), -- Dr. Hiroshi Tanaka (Rheumatology) to Rheumatology
    (15, 15), -- Dr. Sofia Reyes (Urology) to Nephrology
    (16, 15), -- Dr. Omar Hassan (Nephrology) to Nephrology
    (17, 16), -- Dr. Elena Popova (Pulmonology) to Pulmonology
    (18, 17), -- Dr. Sanjay Verma (Hematology) to Infectious Diseases
    (19, 16), -- Dr. Mei Lin (Allergy) to Pulmonology
    (20, 11), -- Dr. Diego Cruz (Cardiothoracic Surgery) to Endocrinology
    (21, 17), -- Dr. Zara Khan (Infectious Diseases) to Infectious Diseases
    (22, 18), -- Dr. Ravi Patel (Neurosurgery) to Neurosurgery
    (23, 19), -- Dr. Amara Okeke (Pediatric Surgery) to Pediatric Surgery
    (24, 18), -- Dr. Yusuf Ali (Plastic Surgery) to Neurosurgery
    (25, 20), -- Dr. Lila Nguyen (Geriatrics) to Geriatrics
    (26, 13), -- Dr. Tariq Malik (Radiology) to Oncology
    (27, 11), -- Dr. Anika Reddy (Cardiology) to Endocrinology
    (28, 18), -- Dr. Wei Chen (Neurology) to Neurosurgery
    (29, 14), -- Dr. Clara Oliveira (Orthopedics) to Rheumatology
    (30, 15), -- Dr. Ibrahim Suleiman (Dermatology) to Nephrology
	(31, 15), -- Dr. Ava Nguyen (Urology) to Nephrology
    (32, 15), -- Dr. Jamal Wilson (Nephrology) to Nephrology
    (33, 16), -- Dr. Sana Ahmed (Pulmonology) to Pulmonology
    (34, 17), -- Dr. Gabriel Silva (Hematology) to Infectious Diseases
    (35, 16), -- Dr. Esme Garcia (Allergy) to Pulmonology
    (36, 11), -- Dr. Khalid Yusuf (Cardiothoracic Surgery) to Endocrinology
    (37, 17), -- Dr. Leah Cohen (Infectious Diseases) to Infectious Diseases
    (38, 18), -- Dr. Arjun Mehta (Neurosurgery) to Neurosurgery
    (39, 19), -- Dr. Zoe Hernandez (Pediatric Surgery) to Pediatric Surgery
    (40, 18), -- Dr. Malik Davis (Plastic Surgery) to Neurosurgery
    (41, 20), -- Dr. Amara Osei (Geriatrics) to Geriatrics
    (42, 13), -- Dr. Hiro Yamamoto (Radiology) to Oncology
    (43, 11), -- Dr. Lina Kim (Cardiology) to Endocrinology
    (44, 18), -- Dr. Tariq Hassan (Neurology) to Neurosurgery
    (45, 14), -- Dr. Isla Ramos (Orthopedics) to Rheumatology
    (46, 15), -- Dr. Caleb Owens (Dermatology) to Nephrology
    (47, 19), -- Dr. Mira Sharma (Pediatrics) to Pediatric Surgery
    (48, 18), -- Dr. Omar Iqbal (General Surgery) to Neurosurgery
    (49, 13), -- Dr. Ella Moreno (Gynecology) to Oncology
    (50, 17); -- Dr. Jaden Park (Psychiatry) to Infectious Diseases

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, purpose, status)
VALUES
	(1, 1, '2024-11-20', '09:00', 'Heart checkup', 'Scheduled'),
	(2, 2, '2024-11-21', '10:00', 'Neurology consultation', 'Scheduled'),
	(3, 3, '2024-11-22', '11:00', 'Knee pain', 'Scheduled'),
	(4, 4, '2024-11-23', '14:00', 'Skin rash', 'Scheduled'),
	(5, 5, '2024-11-24', '15:00', 'Child vaccination', 'Scheduled'),
	(6, 6, '2024-11-25', '16:00', 'Gallbladder surgery', 'Scheduled'),
	(7, 7, '2024-11-26', '09:30', 'Gynecological checkup', 'Scheduled'),
	(8, 8, '2024-11-27', '10:30', 'Mental health evaluation', 'Scheduled'),
	(9, 9, '2024-11-28', '13:00', 'Eye checkup', 'Scheduled'),
	(10, 10, '2024-11-29', '14:30', 'Ear examination', 'Scheduled'),
	(1, 31, '2022-01-20', '09:00', 'Endocrinology consultation', 'Completed'),
    (2, 32, '2022-02-25', '10:30', 'Gastroenterology follow-up', 'Completed'),
    (3, 33, '2022-03-30', '11:00', 'Oncology checkup', 'Completed'),
    (4, 34, '2022-04-15', '14:00', 'Hematology evaluation', 'Completed'),
    (5, 35, '2022-05-20', '15:30', 'Allergy testing', 'Completed'),
    (6, 36, '2022-06-25', '09:00', 'Cardiothoracic consultation', 'Completed'),
    (7, 37, '2022-07-30', '10:30', 'Infectious disease treatment', 'Completed'),
    (8, 38, '2022-08-05', '13:00', 'Neurosurgery consultation', 'Completed'),
    (9, 39, '2022-09-10', '14:30', 'Pediatric surgery follow-up', 'Completed'),
    (10, 40, '2022-10-15', '16:00', 'Plastic surgery consultation', 'Completed'),
    (11, 41, '2022-11-20', '09:00', 'Geriatric care assessment', 'Completed'),
    (12, 42, '2022-12-25', '10:30', 'Radiology review', 'Completed'),
    (13, 43, '2023-01-30', '11:00', 'Cardiology evaluation', 'Completed'),
    (14, 44, '2023-02-05', '14:00', 'Neurology follow-up', 'Completed'),
    (15, 45, '2023-03-10', '15:30', 'Orthopedic consultation', 'Completed'),
    (16, 46, '2023-04-15', '09:00', 'Dermatology checkup', 'Completed'),
    (17, 47, '2023-05-20', '10:30', 'Pediatric checkup', 'Completed'),
    (18, 48, '2023-06-25', '13:00', 'General surgery consultation', 'Completed'),
    (19, 49, '2023-07-30', '14:30', 'Gynecology exam', 'Completed'),
    (20, 50, '2023-08-05', '16:00', 'Psychiatric assessment', 'Completed'),
    (21, 51, '2024-01-15', '09:00', 'Endocrinology follow-up', 'Scheduled'),
    (22, 52, '2024-02-20', '10:30', 'Gastroenterology check', 'Scheduled'),
    (23, 53, '2024-03-25', '11:00', 'Oncology follow-up', 'Scheduled'),
    (24, 54, '2024-04-30', '14:00', 'Rheumatology evaluation', 'Scheduled'),
    (25, 55, '2024-05-05', '15:30', 'Urology follow-up', 'Scheduled'),
    (26, 56, '2024-06-10', '09:00', 'Nephrology consultation', 'Scheduled'),
    (27, 57, '2024-07-15', '10:30', 'Pulmonology checkup', 'Scheduled'),
    (28, 58, '2024-08-20', '13:00', 'Hematology follow-up', 'Scheduled'),
    (29, 59, '2025-01-25', '14:30', 'Allergy management', 'Scheduled'),
    (30, 60, '2025-02-28', '16:00', 'Cardiothoracic follow-up', 'Scheduled'),
	(31, 1, '2022-02-15', '09:00', 'Cardiology consultation', 'Completed'),
    (32, 2, '2022-03-20', '10:30', 'Neurology evaluation', 'Completed'),
    (33, 3, '2022-04-25', '11:00', 'Orthopedic checkup', 'Completed'),
    (34, 4, '2022-05-30', '14:00', 'Dermatology consultation', 'Completed'),
    (35, 5, '2022-07-05', '15:30', 'Pediatric exam', 'Completed'),
    (36, 6, '2022-08-10', '09:00', 'General surgery consultation', 'Completed'),
    (37, 7, '2022-09-15', '10:30', 'Gynecology checkup', 'Completed'),
    (38, 8, '2022-10-20', '13:00', 'Psychiatric evaluation', 'Completed'),
    (39, 9, '2022-11-25', '14:30', 'Ophthalmology consultation', 'Completed'),
    (40, 10, '2022-12-30', '16:00', 'ENT checkup', 'Completed'),
    (41, 11, '2023-02-05', '09:00', 'Endocrinology follow-up', 'Completed'),
    (42, 12, '2023-03-10', '10:30', 'Gastroenterology consultation', 'Completed'),
    (43, 13, '2023-04-15', '11:00', 'Oncology follow-up', 'Completed'),
    (44, 14, '2023-05-20', '14:00', 'Rheumatology evaluation', 'Completed'),
    (45, 15, '2023-06-25', '15:30', 'Urology checkup', 'Completed'),
    (46, 16, '2023-08-01', '09:00', 'Nephrology consultation', 'Completed'),
    (47, 17, '2023-09-05', '10:30', 'Pulmonology follow-up', 'Completed'),
    (48, 18, '2023-10-10', '13:00', 'Hematology checkup', 'Completed'),
    (49, 19, '2023-11-15', '14:30', 'Allergy consultation', 'Completed'),
    (50, 20, '2023-12-20', '16:00', 'Cardiothoracic evaluation', 'Completed'),
    (51, 21, '2024-02-10', '09:00', 'Infectious disease follow-up', 'Scheduled'),
    (52, 22, '2024-03-15', '10:30', 'Neurosurgery checkup', 'Scheduled'),
    (53, 23, '2024-04-20', '11:00', 'Pediatric surgery consultation', 'Scheduled'),
    (54, 24, '2024-05-25', '14:00', 'Plastic surgery follow-up', 'Scheduled'),
    (55, 25, '2024-06-30', '15:30', 'Geriatric assessment', 'Scheduled'),
    (56, 26, '2024-08-05', '09:00', 'Radiology consultation', 'Scheduled'),
    (57, 27, '2024-09-10', '10:30', 'Cardiology follow-up', 'Scheduled'),
    (58, 28, '2024-10-15', '13:00', 'Neurology consultation', 'Scheduled'),
    (59, 29, '2025-01-20', '14:30', 'Orthopedic follow-up', 'Scheduled'),
    (60, 30, '2025-02-25', '16:00', 'Dermatology evaluation', 'Scheduled');

INSERT INTO Billing (patient_id, appointment_id, total_amount, payment_status, payment_date, insurance_provider)
VALUES
	(1, 1, 100.00, 'Pending', NULL, 'Blue Cross'),
	(2, 2, 150.00, 'Paid', '2024-11-21', 'Aetna'),
	(3, 3, 200.00, 'Pending', NULL, 'Cigna'),
	(4, 4, 120.00, 'Paid', '2024-11-22', 'UnitedHealthcare'),
	(5, 5, 80.00, 'Pending', NULL, 'Blue Cross'),
	(6, 6, 500.00, 'Paid', '2024-11-23', 'Aetna'),
	(7, 7, 250.00, 'Pending', NULL, 'Cigna'),
	(8, 8, 100.00, 'Paid', '2024-11-24', 'UnitedHealthcare'),
	(9, 9, 150.00, 'Pending', NULL, 'Blue Cross'),
	(10, 10, 130.00, 'Paid', '2024-11-25', 'Aetna'),
	(1, 1, 150.00, 'Paid', '2022-01-16', 'Blue Cross'),
    (2, 2, 200.00, 'Pending', NULL, 'Aetna'),
    (3, 3, 300.00, 'Paid', '2022-03-26', 'Cigna'),
    (4, 4, 180.00, 'Pending', NULL, 'UnitedHealthcare'),
    (5, 5, 250.00, 'Paid', '2022-05-21', 'Blue Cross'),
    (6, 6, 220.00, 'Pending', NULL, 'Aetna'),
    (7, 7, 190.00, 'Paid', '2022-07-31', 'Cigna'),
    (8, 8, 400.00, 'Pending', NULL, 'UnitedHealthcare'),
    (9, 9, 160.00, 'Paid', '2022-09-11', 'Blue Cross'),
    (10, 10, 350.00, 'Pending', NULL, 'Aetna'),
    (11, 11, 170.00, 'Paid', '2022-11-21', 'Cigna'),
    (12, 12, 210.00, 'Pending', NULL, 'UnitedHealthcare'),
    (13, 13, 280.00, 'Paid', '2023-01-31', 'Blue Cross'),
    (14, 14, 230.00, 'Pending', NULL, 'Aetna'),
    (15, 15, 260.00, 'Paid', '2023-03-11', 'Cigna'),
    (16, 16, 190.00, 'Pending', NULL, 'UnitedHealthcare'),
    (17, 17, 320.00, 'Paid', '2023-05-21', 'Blue Cross'),
    (18, 18, 240.00, 'Pending', NULL, 'Aetna'),
    (19, 19, 200.00, 'Paid', '2023-07-31', 'Cigna'),
    (20, 20, 380.00, 'Pending', NULL, 'UnitedHealthcare'),
    (21, 21, 150.00, 'Scheduled', NULL, 'Blue Cross'),
    (22, 22, 220.00, 'Scheduled', NULL, 'Aetna'),
    (23, 23, 270.00, 'Scheduled', NULL, 'Cigna'),
    (24, 24, 190.00, 'Scheduled', NULL, 'UnitedHealthcare'),
    (25, 25, 300.00, 'Scheduled', NULL, 'Blue Cross'),
    (26, 26, 210.00, 'Scheduled', NULL, 'Aetna'),
    (27, 27, 250.00, 'Scheduled', NULL, 'Cigna'),
    (28, 28, 340.00, 'Scheduled', NULL, 'UnitedHealthcare'),
    (29, 29, 180.00, 'Scheduled', NULL, 'Blue Cross'),
    (30, 30, 290.00, 'Scheduled', NULL, 'Aetna'),
	(31, 31, 200.00, 'Paid', '2022-02-16', 'Blue Cross'),
    (32, 32, 250.00, 'Pending', NULL, 'Aetna'),
    (33, 33, 310.00, 'Paid', '2022-04-26', 'Cigna'),
    (34, 34, 190.00, 'Pending', NULL, 'UnitedHealthcare'),
    (35, 35, 270.00, 'Paid', '2022-07-06', 'Blue Cross'),
    (36, 36, 230.00, 'Pending', NULL, 'Aetna'),
    (37, 37, 200.00, 'Paid', '2022-09-16', 'Cigna'),
    (38, 38, 420.00, 'Pending', NULL, 'UnitedHealthcare'),
    (39, 39, 170.00, 'Paid', '2022-11-26', 'Blue Cross'),
    (40, 40, 360.00, 'Pending', NULL, 'Aetna'),
    (41, 41, 180.00, 'Paid', '2023-02-06', 'Cigna'),
    (42, 42, 220.00, 'Pending', NULL, 'UnitedHealthcare'),
    (43, 43, 290.00, 'Paid', '2023-04-16', 'Blue Cross'),
    (44, 44, 240.00, 'Pending', NULL, 'Aetna'),
    (45, 45, 280.00, 'Paid', '2023-06-26', 'Cigna'),
    (46, 46, 200.00, 'Pending', NULL, 'UnitedHealthcare'),
    (47, 47, 330.00, 'Paid', '2023-09-06', 'Blue Cross'),
    (48, 48, 250.00, 'Pending', NULL, 'Aetna'),
    (49, 49, 210.00, 'Paid', '2023-11-16', 'Cigna'),
    (50, 50, 390.00, 'Pending', NULL, 'UnitedHealthcare'),
    (51, 51, 160.00, 'Scheduled', NULL, 'Blue Cross'),
    (52, 52, 230.00, 'Scheduled', NULL, 'Aetna'),
    (53, 53, 280.00, 'Scheduled', NULL, 'Cigna'),
    (54, 54, 200.00, 'Scheduled', NULL, 'UnitedHealthcare'),
    (55, 55, 310.00, 'Scheduled', NULL, 'Blue Cross'),
    (56, 56, 220.00, 'Scheduled', NULL, 'Aetna'),
    (57, 57, 260.00, 'Scheduled', NULL, 'Cigna'),
    (58, 58, 350.00, 'Scheduled', NULL, 'UnitedHealthcare'),
    (59, 59, 190.00, 'Scheduled', NULL, 'Blue Cross'),
    (60, 60, 300.00, 'Scheduled', NULL, 'Aetna');

INSERT INTO Staff (first_name, last_name, role, department_id, contact_number, email, address, hire_date) 
VALUES
    ('Alice', 'Johnson', 'Nurse', 1, '555-0100', 'alice.johnson@hospital.com', '123 Elm St', '2023-08-01'),
    ('Bob', 'Smith', 'Technician', 2, '555-0101', 'bob.smith@hospital.com', '456 Oak St', '2022-07-15'),
    ('Charlie', 'Brown', 'Admin', 3, '555-0102', 'charlie.brown@hospital.com', '789 Pine St', '2021-09-10'),
    ('David', 'Lee', 'Pharmacist', 4, '555-0103', 'david.lee@hospital.com', '321 Maple St', '2020-12-05'),
    ('Eva', 'Davis', 'Worker', 5, '555-0104', 'eva.davis@hospital.com', '654 Birch St', '2024-03-20'),
    ('Frank', 'Wilson', 'Nurse', 1, '555-0105', 'frank.wilson@hospital.com', '987 Cedar St', '2022-02-25'),
    ('Grace', 'Moore', 'Technician', 2, '555-0106', 'grace.moore@hospital.com', '321 Oak St', '2021-01-15'),
    ('Helen', 'Taylor', 'Admin', 3, '555-0107', 'helen.taylor@hospital.com', '654 Pine St', '2020-08-30'),
    ('Ivy', 'Anderson', 'Pharmacist', 4, '555-0108', 'ivy.anderson@hospital.com', '123 Birch St', '2023-06-25'),
    ('James', 'Thomas', 'Worker', 5, '555-0109', 'james.thomas@hospital.com', '432 Maple St', '2024-09-10'),
	('John', 'Doe', 'Driver', 1, '555-0110', 'john.doe@hospital.com', '123 Maple St', '2024-04-01'),
    ('Sarah', 'Miller', 'Driver', 2, '555-0111', 'sarah.miller@hospital.com', '456 Oak St', '2024-05-15'),
    ('Michael', 'Taylor', 'Driver', 3, '555-0112', 'michael.taylor@hospital.com', '789 Pine St', '2024-06-10'),
    ('Olivia', 'Martinez', 'Driver', 4, '555-0113', 'olivia.martinez@hospital.com', '321 Birch St', '2024-07-22'),
    ('David', 'Jackson', 'Driver', 5, '555-0114', 'david.jackson@hospital.com', '654 Cedar St', '2024-08-01'),
	('Nia', 'Thompson', 'Nurse', 11, '555-2001', 'nia.thompson@hospital.com', '123 Maple St, Chicago, IL', '2022-01-10'),
    ('Mateo', 'Garcia', 'Technician', 12, '555-2002', 'mateo.garcia@hospital.com', '456 Oak St, Chicago, IL', '2022-02-15'),
    ('Lina', 'Park', 'Admin', 13, '555-2003', 'lina.park@hospital.com', '789 Pine St, Chicago, IL', '2022-03-20'),
    ('Arjun', 'Singh', 'Pharmacist', 14, '555-2004', 'arjun.singh@hospital.com', '321 Birch St, Chicago, IL', '2022-04-25'),
    ('Zoe', 'Martinez', 'Worker', 15, '555-2005', 'zoe.martinez@hospital.com', '654 Cedar St, Chicago, IL', '2022-05-30'),
    ('Elias', 'Cohen', 'Nurse', 16, '555-2006', 'elias.cohen@hospital.com', '987 Spruce St, Chicago, IL', '2022-06-05'),
    ('Ava', 'Nguyen', 'Technician', 17, '555-2007', 'ava.nguyen@hospital.com', '234 Willow St, Chicago, IL', '2022-07-10'),
    ('Malik', 'Brown', 'Admin', 18, '555-2008', 'malik.brown@hospital.com', '567 Elm St, Chicago, IL', '2022-08-15'),
    ('Sofia', 'Lopez', 'Pharmacist', 19, '555-2009', 'sofia.lopez@hospital.com', '890 Maple St, Chicago, IL', '2022-09-20'),
    ('Jaden', 'Kim', 'Worker', 20, '555-2010', 'jaden.kim@hospital.com', '123 Pine St, Chicago, IL', '2022-10-25'),
    ('Layla', 'Patel', 'Nurse', 1, '555-2011', 'layla.patel@hospital.com', '456 Birch St, Chicago, IL', '2022-11-30'),
    ('Omar', 'Rahman', 'Technician', 2, '555-2012', 'omar.rahman@hospital.com', '789 Cedar St, Chicago, IL', '2022-12-05'),
    ('Chloe', 'Wong', 'Admin', 3, '555-2013', 'chloe.wong@hospital.com', '321 Spruce St, Chicago, IL', '2023-01-10'),
    ('Darius', 'Jackson', 'Pharmacist', 4, '555-2014', 'darius.jackson@hospital.com', '654 Willow St, Chicago, IL', '2023-02-15'),
    ('Mila', 'Hernandez', 'Worker', 5, '555-2015', 'mila.hernandez@hospital.com', '987 Elm St, Chicago, IL', '2023-03-20'),
    ('Amir', 'Khan', 'Nurse', 6, '555-2016', 'amir.khan@hospital.com', '234 Maple St, Chicago, IL', '2023-04-25'),
    ('Emma', 'Chen', 'Technician', 7, '555-2017', 'emma.chen@hospital.com', '567 Pine St, Chicago, IL', '2023-05-30'),
    ('Caleb', 'Rodriguez', 'Admin', 8, '555-2018', 'caleb.rodriguez@hospital.com', '890 Birch St, Chicago, IL', '2023-06-05'),
    ('Isla', 'Gupta', 'Pharmacist', 9, '555-2019', 'isla.gupta@hospital.com', '123 Cedar St, Chicago, IL', '2023-07-10'),
    ('Tariq', 'Malik', 'Worker', 10, '555-2020', 'tariq.malik@hospital.com', '456 Spruce St, Chicago, IL', '2023-08-15'),
    ('Leah', 'Davis', 'Nurse', 11, '555-2021', 'leah.davis@hospital.com', '789 Maple St, Chicago, IL', '2023-09-20'),
    ('Hiro', 'Yamamoto', 'Technician', 12, '555-2022', 'hiro.yamamoto@hospital.com', '321 Oak St, Chicago, IL', '2023-10-25'),
    ('Sana', 'Ahmed', 'Admin', 13, '555-2023', 'sana.ahmed@hospital.com', '654 Pine St, Chicago, IL', '2023-11-30'),
    ('Gabriel', 'Silva', 'Pharmacist', 14, '555-2024', 'gabriel.silva@hospital.com', '987 Birch St, Chicago, IL', '2023-12-05'),
    ('Esme', 'Garcia', 'Worker', 15, '555-2025', 'esme.garcia@hospital.com', '234 Cedar St, Chicago, IL', '2024-01-10'),
    ('Khalid', 'Yusuf', 'Nurse', 16, '555-2026', 'khalid.yusuf@hospital.com', '567 Spruce St, Chicago, IL', '2024-02-15'),
    ('Mira', 'Sharma', 'Technician', 17, '555-2027', 'mira.sharma@hospital.com', '890 Willow St, Chicago, IL', '2024-03-20'),
    ('Omar', 'Iqbal', 'Admin', 18, '555-2028', 'omar.iqbal@hospital.com', '123 Elm St, Chicago, IL', '2024-04-25'),
    ('Ella', 'Moreno', 'Pharmacist', 19, '555-2029', 'ella.moreno@hospital.com', '456 Maple St, Chicago, IL', '2024-05-30'),
    ('Jaden', 'Park', 'Worker', 20, '555-2030', 'jaden.park@hospital.com', '789 Pine St, Chicago, IL', '2024-06-05'),
	('Amina', 'Siddiqui', 'Nurse', 1, '555-2031', 'amina.siddiqui@hospital.com', '123 Oak St, Chicago, IL', '2022-02-20'),
    ('Javier', 'Morales', 'Technician', 2, '555-2032', 'javier.morales@hospital.com', '456 Pine St, Chicago, IL', '2022-03-25'),
    ('Priya', 'Chopra', 'Admin', 3, '555-2033', 'priya.chopra@hospital.com', '789 Birch St, Chicago, IL', '2022-04-30'),
    ('Hiroshi', 'Tanaka', 'Pharmacist', 4, '555-2034', 'hiroshi.tanaka@hospital.com', '321 Cedar St, Chicago, IL', '2022-06-05'),
    ('Sofia', 'Reyes', 'Worker', 5, '555-2035', 'sofia.reyes@hospital.com', '654 Spruce St, Chicago, IL', '2022-07-10'),
    ('Omar', 'Hassan', 'Nurse', 6, '555-2036', 'omar.hassan@hospital.com', '987 Willow St, Chicago, IL', '2022-08-15'),
    ('Elena', 'Popova', 'Technician', 7, '555-2037', 'elena.popova@hospital.com', '234 Elm St, Chicago, IL', '2022-09-20'),
    ('Sanjay', 'Verma', 'Admin', 8, '555-2038', 'sanjay.verma@hospital.com', '567 Maple St, Chicago, IL', '2022-10-25'),
    ('Mei', 'Lin', 'Pharmacist', 9, '555-2039', 'mei.lin@hospital.com', '890 Pine St, Chicago, IL', '2022-11-30'),
    ('Diego', 'Cruz', 'Worker', 10, '555-2040', 'diego.cruz@hospital.com', '123 Birch St, Chicago, IL', '2022-12-05'),
    ('Zara', 'Khan', 'Nurse', 11, '555-2041', 'zara.khan@hospital.com', '456 Cedar St, Chicago, IL', '2023-01-15'),
    ('Ravi', 'Patel', 'Technician', 12, '555-2042', 'ravi.patel@hospital.com', '789 Spruce St, Chicago, IL', '2023-02-20'),
    ('Amara', 'Okeke', 'Admin', 13, '555-2043', 'amara.okeke@hospital.com', '321 Willow St, Chicago, IL', '2023-03-25'),
    ('Yusuf', 'Ali', 'Pharmacist', 14, '555-2044', 'yusuf.ali@hospital.com', '654 Elm St, Chicago, IL', '2023-04-30'),
    ('Lila', 'Nguyen', 'Worker', 15, '555-2045', 'lila.nguyen@hospital.com', '987 Maple St, Chicago, IL', '2023-06-05'),
    ('Tariq', 'Malik', 'Nurse', 16, '555-2046', 'tariq.malik@hospital.com', '234 Pine St, Chicago, IL', '2023-07-10'),
    ('Anika', 'Reddy', 'Technician', 17, '555-2047', 'anika.reddy@hospital.com', '567 Birch St, Chicago, IL', '2023-08-15'),
    ('Wei', 'Chen', 'Admin', 18, '555-2048', 'wei.chen@hospital.com', '890 Cedar St, Chicago, IL', '2023-09-20'),
    ('Clara', 'Oliveira', 'Pharmacist', 19, '555-2049', 'clara.oliveira@hospital.com', '123 Spruce St, Chicago, IL', '2023-10-25'),
    ('Ibrahim', 'Suleiman', 'Worker', 20, '555-2050', 'ibrahim.suleiman@hospital.com', '456 Willow St, Chicago, IL', '2023-11-30'),
    ('Nia', 'Mensah', 'Nurse', 1, '555-2051', 'nia.mensah@hospital.com', '789 Elm St, Chicago, IL', '2023-12-05'),
    ('Lucas', 'Fernandes', 'Technician', 2, '555-2052', 'lucas.fernandes@hospital.com', '321 Maple St, Chicago, IL', '2024-01-10'),
    ('Aisha', 'Diallo', 'Admin', 3, '555-2053', 'aisha.diallo@hospital.com', '654 Pine St, Chicago, IL', '2024-02-15'),
    ('Hassan', 'Malik', 'Pharmacist', 4, '555-2054', 'hassan.malik@hospital.com', '987 Birch St, Chicago, IL', '2024-03-20'),
    ('Yuki', 'Sato', 'Worker', 5, '555-2055', 'yuki.sato@hospital.com', '234 Cedar St, Chicago, IL', '2024-04-25'),
    ('Amir', 'Rahim', 'Nurse', 6, '555-2056', 'amir.rahim@hospital.com', '567 Spruce St, Chicago, IL', '2024-05-30'),
    ('Maya', 'Torres', 'Technician', 7, '555-2057', 'maya.torres@hospital.com', '890 Willow St, Chicago, IL', '2024-06-05'),
    ('Ahmed', 'Farooq', 'Admin', 8, '555-2058', 'ahmed.farooq@hospital.com', '123 Elm St, Chicago, IL', '2024-07-10'),
    ('Lila', 'Patel', 'Pharmacist', 9, '555-2059', 'lila.patel@hospital.com', '456 Maple St, Chicago, IL', '2024-08-15'),
    ('Mateo', 'Cruz', 'Worker', 10, '555-2060', 'mateo.cruz@hospital.com', '789 Pine St, Chicago, IL', '2024-09-20');

INSERT INTO Ambulance (ambulance_number, availability, driver_id, last_service_date) 
VALUES
    ('AMB001', 'Available', 15, '2022-01-15'),
    ('AMB002', 'On Duty', 20, '2022-02-20'),
    ('AMB003', 'Maintenance', 25, '2022-03-25'),
    ('AMB004', 'Available', 30, '2022-04-30'),
    ('AMB005', 'On Duty', 35, '2022-06-05'),
    ('AMB006', 'Available', 40, '2022-07-10'),
    ('AMB007', 'Maintenance', 45, '2022-08-15'),
    ('AMB008', 'Available', 50, '2022-09-20'),
    ('AMB009', 'On Duty', 55, '2022-10-25'),
    ('AMB010', 'Maintenance', 60, '2022-11-30'),
    ('AMB011', 'Available', 15, '2023-01-05'),
    ('AMB012', 'On Duty', 20, '2023-02-10'),
    ('AMB013', 'Maintenance', 25, '2023-03-15'),
    ('AMB014', 'Available', 30, '2023-04-20'),
    ('AMB015', 'On Duty', 35, '2023-05-25'),
    ('AMB016', 'Available', 40, '2023-06-30'),
    ('AMB017', 'Maintenance', 45, '2023-08-05'),
    ('AMB018', 'Available', 50, '2023-09-10'),
    ('AMB019', 'On Duty', 55, '2023-10-15'),
    ('AMB020', 'Maintenance', 60, '2023-11-20');


INSERT INTO Ambulance_Log (ambulance_id, patient_id, pickup_location, dropoff_location, pickup_time, dropoff_time, status) 
VALUES
    (1, 1, '123 Main St', 'City Hospital', '2024-10-11 08:30', '2024-10-11 09:00', 'Completed'),
    (2, 3, '456 Elm St', 'County Clinic', '2024-10-10 14:00', '2024-10-10 14:30', 'Completed'),
    (3, 4, '789 Oak St', 'General Hospital', '2024-10-09 10:00', '2024-10-09 10:30', 'In Progress'),
    (4, 2, '321 Pine St', 'Downtown Medical Center', '2024-10-08 12:00', '2024-10-08 12:30', 'Canceled'),
    (5, 5, '654 Maple St', 'State Hospital', '2024-10-07 09:00', '2024-10-07 09:30', 'Completed'),
    (6, 7, '234 Birch St', 'City Hospital', '2024-10-06 13:00', '2024-10-06 13:45', 'Completed'),
    (7, 6, '567 Cedar St', 'General Hospital', '2024-10-05 15:30', '2024-10-05 16:00', 'In Progress'),
    (8, 8, '890 Willow St', 'Downtown Medical Center', '2024-10-04 16:15', '2024-10-04 16:45', 'Completed'),
    (9, 9, '135 Ash St', 'County Clinic', '2024-10-03 11:00', '2024-10-03 11:30', 'Canceled'),
    (10, 10, '246 Oak St', 'State Hospital', '2024-10-02 17:00', '2024-10-02 17:30', 'Completed'),
	(1, 1, '123 Elm St, Chicago, IL', 'City Hospital', '2022-03-01 09:00', '2022-03-01 09:30', 'Completed'),
    (2, 2, '456 Maple St, Chicago, IL', 'General Hospital', '2022-04-05 10:00', '2022-04-05 10:30', 'In Progress'),
    (3, 3, '789 Oak St, Chicago, IL', 'Downtown Medical Center', '2022-05-10 11:00', '2022-05-10 11:30', 'Canceled'),
    (4, 4, '321 Pine St, Chicago, IL', 'County Clinic', '2022-06-15 12:00', '2022-06-15 12:30', 'Completed'),
    (5, 5, '654 Birch St, Chicago, IL', 'State Hospital', '2022-07-20 13:00', '2022-07-20 13:30', 'Completed'),
    (6, 6, '987 Cedar St, Chicago, IL', 'City Hospital', '2022-08-25 14:00', '2022-08-25 14:30', 'In Progress'),
    (7, 7, '234 Spruce St, Chicago, IL', 'General Hospital', '2022-09-30 15:00', '2022-09-30 15:30', 'Completed'),
    (8, 8, '567 Willow St, Chicago, IL', 'Downtown Medical Center', '2022-11-05 16:00', '2022-11-05 16:30', 'Canceled'),
    (9, 9, '890 Elm St, Chicago, IL', 'County Clinic', '2022-12-10 09:00', '2022-12-10 09:30', 'Completed'),
    (10, 10, '123 Maple St, Chicago, IL', 'State Hospital', '2023-01-15 10:00', '2023-01-15 10:30', 'In Progress'),
    (11, 11, '456 Oak St, Chicago, IL', 'City Hospital', '2023-02-20 11:00', '2023-02-20 11:30', 'Completed'),
    (12, 12, '789 Pine St, Chicago, IL', 'General Hospital', '2023-03-25 12:00', '2023-03-25 12:30', 'Canceled'),
    (13, 13, '321 Birch St, Chicago, IL', 'Downtown Medical Center', '2023-04-30 13:00', '2023-04-30 13:30', 'Completed'),
    (14, 14, '654 Cedar St, Chicago, IL', 'County Clinic', '2023-06-05 14:00', '2023-06-05 14:30', 'In Progress'),
    (15, 15, '987 Spruce St, Chicago, IL', 'State Hospital', '2023-07-10 15:00', '2023-07-10 15:30', 'Completed'),
    (16, 16, '234 Willow St, Chicago, IL', 'City Hospital', '2023-08-15 16:00', '2023-08-15 16:30', 'Completed'),
    (17, 17, '567 Elm St, Chicago, IL', 'General Hospital', '2023-09-20 09:00', '2023-09-20 09:30', 'In Progress'),
    (18, 18, '890 Maple St, Chicago, IL', 'Downtown Medical Center', '2023-10-25 10:00', '2023-10-25 10:30', 'Canceled'),
    (19, 19, '123 Pine St, Chicago, IL', 'County Clinic', '2023-11-30 11:00', '2023-11-30 11:30', 'Completed'),
    (20, 20, '456 Birch St, Chicago, IL', 'State Hospital', '2023-12-05 12:00', '2023-12-05 12:30', 'Completed'),
    (1, 21, '789 Cedar St, Chicago, IL', 'City Hospital', '2024-01-10 13:00', '2024-01-10 13:30', 'In Progress'),
    (2, 22, '321 Spruce St, Chicago, IL', 'General Hospital', '2024-02-15 14:00', '2024-02-15 14:30', 'Completed'),
    (3, 23, '654 Willow St, Chicago, IL', 'Downtown Medical Center', '2024-03-20 15:00', '2024-03-20 15:30', 'Canceled'),
    (4, 24, '987 Elm St, Chicago, IL', 'County Clinic', '2024-04-25 16:00', '2024-04-25 16:30', 'Completed'),
    (5, 25, '234 Maple St, Chicago, IL', 'State Hospital', '2024-05-30 09:00', '2024-05-30 09:30', 'In Progress'),
    (6, 26, '567 Oak St, Chicago, IL', 'City Hospital', '2024-07-05 10:00', '2024-07-05 10:30', 'Completed'),
    (7, 27, '890 Pine St, Chicago, IL', 'General Hospital', '2024-08-10 11:00', '2024-08-10 11:30', 'Completed'),
    (8, 28, '123 Birch St, Chicago, IL', 'Downtown Medical Center', '2024-09-15 12:00', '2024-09-15 12:30', 'In Progress'),
    (9, 29, '456 Cedar St, Chicago, IL', 'County Clinic', '2024-10-20 13:00', '2024-10-20 13:30', 'Canceled'),
    (10, 30, '789 Spruce St, Chicago, IL', 'State Hospital', '2024-11-25 14:00', '2024-11-25 14:30', 'Completed'),
	(11, 31, '123 Willow St, Chicago, IL', 'City Hospital', '2022-04-10 09:00', '2022-04-10 09:30', 'Completed'),
    (12, 32, '456 Elm St, Chicago, IL', 'General Hospital', '2022-05-15 10:00', '2022-05-15 10:30', 'In Progress'),
    (13, 33, '789 Maple St, Chicago, IL', 'Downtown Medical Center', '2022-06-20 11:00', '2022-06-20 11:30', 'Canceled'),
    (14, 34, '321 Oak St, Chicago, IL', 'County Clinic', '2022-07-25 12:00', '2022-07-25 12:30', 'Completed'),
    (15, 35, '654 Pine St, Chicago, IL', 'State Hospital', '2022-08-30 13:00', '2022-08-30 13:30', 'Completed'),
    (16, 36, '987 Birch St, Chicago, IL', 'City Hospital', '2022-10-05 14:00', '2022-10-05 14:30', 'In Progress'),
    (17, 37, '234 Cedar St, Chicago, IL', 'General Hospital', '2022-11-10 15:00', '2022-11-10 15:30', 'Completed'),
    (18, 38, '567 Spruce St, Chicago, IL', 'Downtown Medical Center', '2022-12-15 16:00', '2022-12-15 16:30', 'Canceled'),
    (19, 39, '890 Willow St, Chicago, IL', 'County Clinic', '2023-01-20 09:00', '2023-01-20 09:30', 'Completed'),
    (20, 40, '123 Elm St, Chicago, IL', 'State Hospital', '2023-02-25 10:00', '2023-02-25 10:30', 'In Progress'),
    (1, 41, '456 Maple St, Chicago, IL', 'City Hospital', '2023-03-30 11:00', '2023-03-30 11:30', 'Completed'),
    (2, 42, '789 Oak St, Chicago, IL', 'General Hospital', '2023-05-05 12:00', '2023-05-05 12:30', 'Canceled'),
    (3, 43, '321 Pine St, Chicago, IL', 'Downtown Medical Center', '2023-06-10 13:00', '2023-06-10 13:30', 'Completed'),
    (4, 44, '654 Birch St, Chicago, IL', 'County Clinic', '2023-07-15 14:00', '2023-07-15 14:30', 'In Progress'),
    (5, 45, '987 Cedar St, Chicago, IL', 'State Hospital', '2023-08-20 15:00', '2023-08-20 15:30', 'Completed'),
    (6, 46, '234 Spruce St, Chicago, IL', 'City Hospital', '2023-09-25 16:00', '2023-09-25 16:30', 'Completed'),
    (7, 47, '567 Willow St, Chicago, IL', 'General Hospital', '2023-10-30 09:00', '2023-10-30 09:30', 'In Progress'),
    (8, 48, '890 Elm St, Chicago, IL', 'Downtown Medical Center', '2023-12-05 10:00', '2023-12-05 10:30', 'Canceled'),
    (9, 49, '123 Maple St, Chicago, IL', 'County Clinic', '2024-01-10 11:00', '2024-01-10 11:30', 'Completed'),
    (10, 50, '456 Oak St, Chicago, IL', 'State Hospital', '2024-02-15 12:00', '2024-02-15 12:30', 'Completed'),
    (11, 51, '789 Pine St, Chicago, IL', 'City Hospital', '2024-03-20 13:00', '2024-03-20 13:30', 'In Progress'),
    (12, 52, '321 Birch St, Chicago, IL', 'General Hospital', '2024-04-25 14:00', '2024-04-25 14:30', 'Completed'),
    (13, 53, '654 Cedar St, Chicago, IL', 'Downtown Medical Center', '2024-05-30 15:00', '2024-05-30 15:30', 'Canceled'),
    (14, 54, '987 Spruce St, Chicago, IL', 'County Clinic', '2024-07-05 16:00', '2024-07-05 16:30', 'Completed'),
    (15, 55, '234 Elm St, Chicago, IL', 'State Hospital', '2024-08-10 09:00', '2024-08-10 09:30', 'In Progress'),
    (16, 56, '567 Maple St, Chicago, IL', 'City Hospital', '2024-09-15 10:00', '2024-09-15 10:30', 'Completed'),
    (17, 57, '890 Oak St, Chicago, IL', 'General Hospital', '2024-10-20 11:00', '2024-10-20 11:30', 'Completed'),
    (18, 58, '123 Pine St, Chicago, IL', 'Downtown Medical Center', '2024-11-25 12:00', '2024-11-25 12:30', 'In Progress'),
    (19, 59, '456 Birch St, Chicago, IL', 'County Clinic', '2024-12-30 13:00', '2024-12-30 13:30', 'Canceled'),
    (20, 60, '789 Cedar St, Chicago, IL', 'State Hospital', '2025-01-05 14:00', '2025-01-05 14:30', 'Completed');

INSERT INTO Blood_Bank (blood_type, stock_quantity, last_updated) 
VALUES
	('A+', 20, '2024-10-10'),
	('A-', 15, '2024-10-10'),
	('B+', 30, '2024-10-09'),
	('B-', 10, '2024-10-08'),
	('AB+', 25, '2024-10-07'),
	('AB-', 5, '2024-10-06'),
	('O+', 50, '2024-10-05'),
	('O-', 40, '2024-10-04'),
	('A+', 18, '2024-10-03'),
	('B-', 12, '2024-10-02');

INSERT INTO Medicine (name, brand, type, dosage, stock_quantity, expiry_date) 
VALUES
	('Paracetamol', 'BrandA', 'Tablet', '500mg', 100, '2025-12-31'),
	('Ibuprofen', 'BrandB', 'Capsule', '250mg', 150, '2025-06-30'),
	('Cough Syrup', 'BrandC', 'Liquid', '10ml', 50, '2025-03-31'),
	('Amoxicillin', 'BrandD', 'Capsule', '200mg', 200, '2026-01-31'),
	('Aspirin', 'BrandE', 'Tablet', '500mg', 80, '2025-11-30'),
	('Ciprofloxacin', 'BrandF', 'Tablet', '500mg', 60, '2025-05-31'),
	('Vitamin C', 'BrandG', 'Capsule', '20mg', 120, '2024-12-31'),
	('Doxycycline', 'BrandH', 'Capsule', '100mg', 90, '2026-07-15'),
	('Metformin', 'BrandI', 'Tablet', '500mg', 200, '2026-02-28'),
	('Prednisone', 'BrandJ', 'Tablet', '0.5mg', 50, '2024-11-30'),
	('Levothyroxine', 'Synthroid', 'Tablet', '100mcg', 200, '2025-12-31'),
    ('Omeprazole', 'Prilosec', 'Capsule', '20mg', 150, '2025-06-30'),
    ('Doxorubicin', 'Adriamycin', 'Injection', '50mg', 50, '2025-03-31'),
    ('Methotrexate', 'Rheumatrex', 'Tablet', '2.5mg', 100, '2026-01-31'),
    ('Tamsulosin', 'Flomax', 'Capsule', '0.4mg', 80, '2025-11-30'),
    ('Ferrous Sulfate', 'Feosol', 'Tablet', '325mg', 120, '2024-12-31'),
    ('Cetirizine', 'Zyrtec', 'Tablet', '10mg', 90, '2026-07-15'),
    ('Isoniazid', 'Nydrazid', 'Tablet', '300mg', 200, '2026-02-28'),
    ('Donepezil', 'Aricept', 'Tablet', '5mg', 50, '2024-11-30'),
    ('Lisinopril', 'Zestril', 'Tablet', '10mg', 180, '2025-10-15'),
    ('Metoprolol', 'Lopressor', 'Tablet', '50mg', 160, '2025-08-20'),
    ('Atorvastatin', 'Lipitor', 'Tablet', '20mg', 200, '2026-03-31'),
    ('Citalopram', 'Celexa', 'Tablet', '20mg', 100, '2025-09-30'),
    ('Insulin Glargine', 'Lantus', 'Injection', '100 units/ml', 40, '2025-02-28'),
    ('Hydrochlorothiazide', 'Microzide', 'Tablet', '25mg', 150, '2025-07-15'),
    ('Loratadine', 'Claritin', 'Tablet', '10mg', 120, '2026-05-31'),
    ('Gabapentin', 'Neurontin', 'Capsule', '300mg', 90, '2025-11-15'),
    ('Warfarin', 'Coumadin', 'Tablet', '5mg', 80, '2025-06-30'),
    ('Fluoxetine', 'Prozac', 'Capsule', '20mg', 100, '2026-01-15'),
    ('Pantoprazole', 'Protonix', 'Tablet', '40mg', 140, '2025-12-31'),
    ('Tramadol', 'Ultram', 'Tablet', '50mg', 110, '2025-10-31'),
    ('Azithromycin', 'Zithromax', 'Tablet', '250mg', 60, '2025-03-31'),
    ('Montelukast', 'Singulair', 'Tablet', '10mg', 90, '2026-04-30'),
    ('Clopidogrel', 'Plavix', 'Tablet', '75mg', 120, '2025-08-31'),
    ('Furosemide', 'Lasix', 'Tablet', '40mg', 100, '2025-05-15'),
    ('Sertraline', 'Zoloft', 'Tablet', '50mg', 130, '2026-02-28'),
    ('Levofloxacin', 'Levaquin', 'Tablet', '500mg', 50, '2025-07-31'),
    ('Ranitidine', 'Zantac', 'Tablet', '150mg', 150, '2025-09-15'),
    ('Amlodipine', 'Norvasc', 'Tablet', '5mg', 200, '2026-06-30'),
    ('Venlafaxine', 'Effexor', 'Capsule', '75mg', 100, '2025-12-15'),
    ('Methylprednisolone', 'Medrol', 'Tablet', '4mg', 80, '2025-04-30'),
    ('Cephalexin', 'Keflex', 'Capsule', '500mg', 90, '2026-03-31'),
    ('Esomeprazole', 'Nexium', 'Capsule', '40mg', 120, '2025-10-31'),
    ('Duloxetine', 'Cymbalta', 'Capsule', '60mg', 100, '2025-08-15'),
    ('Rosuvastatin', 'Crestor', 'Tablet', '10mg', 150, '2026-01-31'),
    ('Trazodone', 'Desyrel', 'Tablet', '50mg', 90, '2025-06-30'),
    ('Acetaminophen', 'Tylenol', 'Tablet', '500mg', 200, '2025-11-15'),
    ('Clarithromycin', 'Biaxin', 'Tablet', '500mg', 60, '2025-03-31'),
    ('Losartan', 'Cozaar', 'Tablet', '50mg', 140, '2026-05-15'),
    ('Escitalopram', 'Lexapro', 'Tablet', '10mg', 100, '2025-09-30'),
    ('Prednisolone', 'Omnipred', 'Liquid', '5mg/5ml', 80, '2025-12-31'),
    ('Naproxen', 'Naprosyn', 'Tablet', '500mg', 120, '2025-10-15'),
    ('Valacyclovir', 'Valtrex', 'Tablet', '500mg', 60, '2026-02-28'),
    ('Simvastatin', 'Zocor', 'Tablet', '20mg', 150, '2025-11-30'),
    ('Lamotrigine', 'Lamictal', 'Tablet', '100mg', 90, '2026-04-30'),
	('Levothyroxine', 'Synthroid', 'Tablet', '100mcg', 200, '2025-12-31'),
    ('Omeprazole', 'Prilosec', 'Capsule', '20mg', 150, '2025-06-30'),
    ('Doxorubicin', 'Adriamycin', 'Injection', '50mg', 50, '2025-03-31'),
    ('Methotrexate', 'Rheumatrex', 'Tablet', '2.5mg', 100, '2026-01-31'),
    ('Tamsulosin', 'Flomax', 'Capsule', '0.4mg', 80, '2025-11-30'),
    ('Hydrocortisone', 'Cortizone', 'Ointment', '1%', 60, '2025-05-31'),
    ('Ferrous Sulfate', 'Feosol', 'Tablet', '325mg', 120, '2024-12-31'),
    ('Cetirizine', 'Zyrtec', 'Tablet', '10mg', 90, '2026-07-15'),
    ('Isoniazid', 'Nydrazid', 'Tablet', '300mg', 200, '2026-02-28'),
    ('Promethazine', 'Phenergan', 'Liquid', '6.25mg/5ml', 50, '2024-11-30'),
    ('Lisinopril', 'Zestril', 'Tablet', '10mg', 180, '2025-10-15'),
    ('Metoprolol', 'Lopressor', 'Tablet', '50mg', 160, '2025-08-20'),
    ('Epinephrine', 'EpiPen', 'Injection', '0.3mg', 40, '2025-04-30'),
    ('Atorvastatin', 'Lipitor', 'Tablet', '20mg', 200, '2026-03-31'),
    ('Citalopram', 'Celexa', 'Tablet', '20mg', 100, '2025-09-30'),
    ('Insulin Glargine', 'Lantus', 'Injection', '100 units/ml', 45, '2025-02-28'),
    ('Hydrochlorothiazide', 'Microzide', 'Tablet', '25mg', 150, '2025-07-15'),
    ('Loratadine', 'Claritin', 'Tablet', '10mg', 120, '2026-05-31'),
    ('Gabapentin', 'Neurontin', 'Capsule', '300mg', 90, '2025-11-15'),
    ('Warfarin', 'Coumadin', 'Tablet', '5mg', 80, '2025-06-30'),
    ('Fluoxetine', 'Prozac', 'Capsule', '20mg', 100, '2026-01-15'),
    ('Pantoprazole', 'Protonix', 'Tablet', '40mg', 140, '2025-12-31'),
    ('Tramadol', 'Ultram', 'Tablet', '50mg', 110, '2025-10-31'),
    ('Azithromycin', 'Zithromax', 'Tablet', '250mg', 60, '2025-03-31'),
    ('Montelukast', 'Singulair', 'Tablet', '10mg', 90, '2026-04-30'),
    ('Clopidogrel', 'Plavix', 'Tablet', '75mg', 120, '2025-08-31'),
    ('Furosemide', 'Lasix', 'Tablet', '40mg', 100, '2025-05-15'),
    ('Sertraline', 'Zoloft', 'Tablet', '50mg', 130, '2026-02-28'),
    ('Levofloxacin', 'Levaquin', 'Tablet', '500mg', 50, '2025-07-31'),
    ('Lidocaine', 'Xylocaine', 'Ointment', '5%', 70, '2025-11-30'),
    ('Ranitidine', 'Zantac', 'Tablet', '150mg', 150, '2025-09-15'),
    ('Amlodipine', 'Norvasc', 'Tablet', '5mg', 200, '2026-06-30'),
    ('Venlafaxine', 'Effexor', 'Capsule', '75mg', 100, '2025-12-15'),
    ('Methylprednisolone', 'Medrol', 'Tablet', '4mg', 80, '2025-04-30'),
    ('Cephalexin', 'Keflex', 'Capsule', '500mg', 90, '2026-03-31'),
    ('Esomeprazole', 'Nexium', 'Capsule', '40mg', 120, '2025-10-31'),
    ('Duloxetine', 'Cymbalta', 'Capsule', '60mg', 100, '2025-08-15'),
    ('Rosuvastatin', 'Crestor', 'Tablet', '10mg', 150, '2026-01-31'),
    ('Trazodone', 'Desyrel', 'Tablet', '50mg', 90, '2025-06-30'),
    ('Acetaminophen', 'Tylenol', 'Tablet', '500mg', 200, '2025-11-15'),
    ('Clarithromycin', 'Biaxin', 'Tablet', '500mg', 60, '2025-03-31'),
    ('Dexamethasone', 'Decadron', 'Injection', '4mg/ml', 50, '2025-07-31'),
    ('Losartan', 'Cozaar', 'Tablet', '50mg', 140, '2026-05-15'),
    ('Escitalopram', 'Lexapro', 'Tablet', '10mg', 100, '2025-09-30'),
    ('Prednisolone', 'Omnipred', 'Liquid', '5mg/5ml', 80, '2025-12-31'),
    ('Naproxen', 'Naprosyn', 'Tablet', '500mg', 120, '2025-10-15'),
    ('Valacyclovir', 'Valtrex', 'Tablet', '500mg', 60, '2026-02-28'),
    ('Mupirocin', 'Bactroban', 'Ointment', '2%', 50, '2025-06-30'),
    ('Simvastatin', 'Zocor', 'Tablet', '20mg', 150, '2025-11-30'),
    ('Lamotrigine', 'Lamictal', 'Tablet', '100mg', 90, '2026-04-30');

INSERT INTO Medical_Records (patient_id, doctor_id, appointment_id, diagnosis, treatment, prescription)
VALUES
	(1, 1, 1, 'Hypertension', 'Lifestyle changes, medication', 'Lisinopril'),
	(2, 2, 2, 'Asthma', 'Inhalers, avoid triggers', 'Albuterol'),
	(3, 3, 3, 'Knee Osteoarthritis', 'Physical therapy, pain relief', 'Ibuprofen'),
	(4, 4, 4, 'Dermatitis', 'Topical corticosteroids', 'Hydrocortisone'),
	(5, 5, 5, 'Routine checkup', 'No issues found', 'None'),
	(6, 6, 6, 'Gallstones', 'Surgical removal', 'None'),
	(7, 7, 7, 'Pelvic Exam', 'Normal', 'None'),
	(8, 8, 8, 'Anxiety', 'Therapy, medication', 'Sertraline'),
	(9, 9, 9, 'Myopia', 'Eyeglasses', 'None'),
	(10, 10, 10, 'Ear Infection', 'Antibiotics', 'Amoxicillin'),
	 (1, 1, 1, 'Hypothyroidism', 'Hormone replacement therapy', 'Levothyroxine'),
    (2, 2, 2, 'Peptic Ulcer', 'Proton pump inhibitors', 'Omeprazole'),
    (3, 3, 3, 'Breast Cancer', 'Chemotherapy', 'Doxorubicin'),
    (4, 4, 4, 'Rheumatoid Arthritis', 'Anti-inflammatory drugs', 'Methotrexate'),
    (5, 5, 5, 'Benign Prostatic Hyperplasia', 'Medication', 'Tamsulosin'),
    (6, 6, 6, 'Eczema', 'Topical steroids', 'Hydrocortisone'),
    (7, 7, 7, 'Anemia', 'Iron supplements', 'Ferrous Sulfate'),
    (8, 8, 8, 'Allergic Rhinitis', 'Antihistamines', 'Cetirizine'),
    (9, 9, 9, 'Tuberculosis', 'Antibiotic therapy', 'Isoniazid'),
    (10, 10, 10, 'Dementia', 'Cognitive therapy', 'Donepezil'),
    (11, 11, 11, 'Hypertension', 'Lifestyle changes, medication', 'Lisinopril'),
    (12, 12, 12, 'Heart Failure', 'Beta blockers', 'Metoprolol'),
    (13, 13, 13, 'Asthma', 'Inhalers', 'Albuterol'),
    (14, 14, 14, 'High Cholesterol', 'Statins', 'Atorvastatin'),
    (15, 15, 15, 'Depression', 'Antidepressants', 'Citalopram'),
    (16, 16, 16, 'Type 1 Diabetes', 'Insulin therapy', 'Insulin Glargine'),
    (17, 17, 17, 'Edema', 'Diuretics', 'Hydrochlorothiazide'),
    (18, 18, 18, 'Seasonal Allergies', 'Antihistamines', 'Loratadine'),
    (19, 19, 19, 'Neuropathic Pain', 'Anticonvulsants', 'Gabapentin'),
    (20, 20, 20, 'Atrial Fibrillation', 'Anticoagulants', 'Warfarin'),
    (21, 21, 21, 'Generalized Anxiety Disorder', 'Antidepressants', 'Fluoxetine'),
    (22, 22, 22, 'Gastroesophageal Reflux', 'Proton pump inhibitors', 'Pantoprazole'),
    (23, 23, 23, 'Acute Pain', 'Analgesics', 'Tramadol'),
    (24, 24, 24, 'Bacterial Infection', 'Antibiotics', 'Azithromycin'),
    (25, 25, 25, 'Chronic Asthma', 'Leukotriene inhibitors', 'Montelukast'),
    (26, 26, 26, 'Coronary Artery Disease', 'Antiplatelets', 'Clopidogrel'),
    (27, 27, 27, 'Fluid Retention', 'Diuretics', 'Furosemide'),
    (28, 28, 28, 'Major Depressive Disorder', 'Antidepressants', 'Sertraline'),
    (29, 29, 29, 'Urinary Tract Infection', 'Antibiotics', 'Levofloxacin'),
    (30, 30, 30, 'Contact Dermatitis', 'Topical anesthetics', 'Lidocaine'),
    (31, 31, 31, 'Peptic Ulcer Disease', 'H2 receptor blockers', 'Ranitidine'),
    (32, 32, 32, 'Hypertension', 'Calcium channel blockers', 'Amlodipine'),
    (33, 33, 33, 'Depression', 'Antidepressants', 'Venlafaxine'),
    (34, 34, 34, 'Inflammation', 'Corticosteroids', 'Methylprednisolone'),
    (35, 35, 35, 'Skin Infection', 'Antibiotics', 'Cephalexin'),
    (36, 36, 36, 'Acid Reflux', 'Proton pump inhibitors', 'Esomeprazole'),
    (37, 37, 37, 'Chronic Pain', 'Antidepressants', 'Duloxetine'),
    (38, 38, 38, 'Hyperlipidemia', 'Statins', 'Rosuvastatin'),
    (39, 39, 39, 'Insomnia', 'Sedatives', 'Trazodone'),
    (40, 40, 40, 'Fever', 'Analgesics', 'Acetaminophen'),
    (41, 41, 41, 'Sinus Infection', 'Antibiotics', 'Clarithromycin'),
    (42, 42, 42, 'Allergic Asthma', 'Corticosteroids', 'Dexamethasone'),
    (43, 43, 43, 'Hypertension', 'Angiotensin receptor blockers', 'Losartan'),
    (44, 44, 44, 'Anxiety Disorder', 'Antidepressants', 'Escitalopram'),
    (45, 45, 45, 'Allergic Conjunctivitis', 'Corticosteroids', 'Prednisolone'),
    (46, 46, 46, 'Arthritis Pain', 'NSAIDs', 'Naproxen'),
    (47, 47, 47, 'Herpes Zoster', 'Antivirals', 'Valacyclovir'),
    (48, 48, 48, 'Bacterial Skin Infection', 'Topical antibiotics', 'Mupirocin'),
    (49, 49, 49, 'High Cholesterol', 'Statins', 'Simvastatin'),
    (50, 50, 50, 'Bipolar Disorder', 'Mood stabilizers', 'Lamotrigine');

INSERT INTO Medical_Records_Medicine (record_id, medicine_id, dosage) 
VALUES
	(1, 1, '100mcg daily'),         -- Levothyroxine for Hypothyroidism
    (2, 2, '20mg daily'),           -- Omeprazole for Peptic Ulcer
    (3, 3, '50mg per cycle'),       -- Doxorubicin for Breast Cancer
    (4, 4, '2.5mg weekly'),         -- Methotrexate for Rheumatoid Arthritis
    (5, 5, '0.4mg daily'),          -- Tamsulosin for Benign Prostatic Hyperplasia
    (6, 6, 'Apply twice daily'),    -- Hydrocortisone for Eczema
    (7, 7, '325mg daily'),          -- Ferrous Sulfate for Anemia
    (8, 8, '10mg daily'),           -- Cetirizine for Allergic Rhinitis
    (9, 9, '300mg daily'),          -- Isoniazid for Tuberculosis
    (10, 10, '5mg daily'),          -- Donepezil for Dementia
    (11, 11, '10mg daily'),         -- Lisinopril for Hypertension
    (12, 12, '50mg twice daily'),   -- Metoprolol for Heart Failure
    (13, 13, '90mcg as needed'),    -- Albuterol for Asthma
    (14, 14, '20mg daily'),         -- Atorvastatin for High Cholesterol
    (15, 15, '20mg daily'),         -- Citalopram for Depression
    (16, 16, '10 units daily'),     -- Insulin Glargine for Type 1 Diabetes
    (17, 17, '25mg daily'),         -- Hydrochlorothiazide for Edema
    (18, 18, '10mg daily'),         -- Loratadine for Seasonal Allergies
    (19, 19, '300mg daily'),        -- Gabapentin for Neuropathic Pain
    (20, 20, '5mg daily'),          -- Warfarin for Atrial Fibrillation
    (21, 21, '20mg daily'),         -- Fluoxetine for Generalized Anxiety Disorder
    (22, 22, '40mg daily'),         -- Pantoprazole for Gastroesophageal Reflux
    (23, 23, '50mg as needed'),     -- Tramadol for Acute Pain
    (24, 24, '250mg twice daily'),  -- Azithromycin for Bacterial Infection
    (25, 25, '10mg daily'),         -- Montelukast for Chronic Asthma
    (26, 26, '75mg daily'),         -- Clopidogrel for Coronary Artery Disease
    (27, 27, '40mg daily'),         -- Furosemide for Fluid Retention
    (28, 28, '50mg daily'),         -- Sertraline for Major Depressive Disorder
    (29, 29, '500mg twice daily'),  -- Levofloxacin for Urinary Tract Infection
    (30, 30, 'Apply twice daily'),   -- Lidocaine for Contact Dermatitis
    (31, 31, '150mg twice daily'),  -- Ranitidine for Peptic Ulcer Disease
    (32, 32, '5mg daily'),          -- Amlodipine for Hypertension
    (33, 33, '75mg daily'),         -- Venlafaxine for Depression
    (34, 34, '4mg daily'),          -- Methylprednisolone for Inflammation
    (35, 35, '500mg twice daily'),  -- Cephalexin for Skin Infection
    (36, 36, '40mg daily'),         -- Esomeprazole for Acid Reflux
    (37, 37, '60mg daily'),         -- Duloxetine for Chronic Pain
    (38, 38, '10mg daily'),         -- Rosuvastatin for Hyperlipidemia
    (39, 39, '50mg nightly'),       -- Trazodone for Insomnia
    (40, 40, '500mg every 6 hours'),-- Acetaminophen for Fever
    (41, 41, '500mg twice daily'),  -- Clarithromycin for Sinus Infection
    (42, 42, '4mg as needed'),      -- Dexamethasone for Allergic Asthma
    (43, 43, '50mg daily'),         -- Losartan for Hypertension
    (44, 44, '10mg daily'),         -- Escitalopram for Anxiety Disorder
    (45, 45, '5mg/5ml daily'),      -- Prednisolone for Allergic Conjunctivitis
    (46, 46, '500mg twice daily'),  -- Naproxen for Arthritis Pain
    (47, 47, '500mg twice daily'),  -- Valacyclovir for Herpes Zoster
    (48, 48, 'Apply twice daily'),   -- Mupirocin for Bacterial Skin Infection
    (49, 49, '20mg daily'),         -- Simvastatin for High Cholesterol
    (50, 50, '100mg daily'),       -- Lamotrigine for Bipolar Disorder
	(51, 1, '100mcg daily'),         -- Levothyroxine for Hypothyroidism (new patient context)
    (52, 2, '20mg daily'),           -- Omeprazole for Peptic Ulcer
    (53, 11, '10mg daily'),          -- Lisinopril for Hypertension
    (54, 12, '50mg twice daily'),    -- Metoprolol for Heart Failure
    (55, 13, '90mcg as needed'),     -- Albuterol for Asthma
    (56, 14, '20mg daily'),          -- Atorvastatin for High Cholesterol
    (57, 15, '20mg daily'),          -- Citalopram for Depression
    (58, 16, '10 units daily'),      -- Insulin Glargine for Type 1 Diabetes
    (59, 17, '25mg daily'),          -- Hydrochlorothiazide for Edema
    (60, 18, '10mg daily'),          -- Loratadine for Seasonal Allergies
    (1, 19, '300mg daily'),          -- Gabapentin for Neuropathic Pain
    (2, 20, '5mg daily'),            -- Warfarin for Atrial Fibrillation
    (3, 21, '20mg daily'),           -- Fluoxetine for Generalized Anxiety Disorder
    (4, 22, '40mg daily'),           -- Pantoprazole for Gastroesophageal Reflux
    (5, 23, '50mg as needed'),       -- Tramadol for Acute Pain
    (6, 24, '250mg twice daily'),    -- Azithromycin for Bacterial Infection
    (7, 25, '10mg daily'),           -- Montelukast for Chronic Asthma
    (8, 26, '75mg daily'),           -- Clopidogrel for Coronary Artery Disease
    (9, 27, '40mg daily'),           -- Furosemide for Fluid Retention
    (10, 28, '50mg daily'),          -- Sertraline for Major Depressive Disorder
    (11, 29, '500mg twice daily'),   -- Levofloxacin for Urinary Tract Infection
    (12, 30, 'Apply twice daily'),    -- Lidocaine for Contact Dermatitis
    (13, 31, '150mg twice daily'),   -- Ranitidine for Peptic Ulcer Disease
    (14, 32, '5mg daily'),           -- Amlodipine for Hypertension
    (15, 33, '75mg daily'),          -- Venlafaxine for Depression
    (16, 34, '4mg daily'),           -- Methylprednisolone for Inflammation
    (17, 35, '500mg twice daily'),   -- Cephalexin for Skin Infection
    (18, 36, '40mg daily'),          -- Esomeprazole for Acid Reflux
    (19, 37, '60mg daily'),          -- Duloxetine for Chronic Pain
    (20, 38, '10mg daily'),          -- Rosuvastatin for Hyperlipidemia
    (21, 39, '50mg nightly'),        -- Trazodone for Insomnia
    (22, 40, '500mg every 6 hours'), -- Acetaminophen for Fever
    (23, 41, '500mg twice daily'),   -- Clarithromycin for Sinus Infection
    (24, 42, '4mg as needed'),       -- Dexamethasone for Allergic Asthma
    (25, 43, '50mg daily'),          -- Losartan for Hypertension
    (26, 44, '10mg daily'),          -- Escitalopram for Anxiety Disorder
    (27, 45, '5mg/5ml daily'),       -- Prednisolone for Allergic Conjunctivitis
    (28, 46, '500mg twice daily'),   -- Naproxen for Arthritis Pain
    (29, 47, '500mg twice daily'),   -- Valacyclovir for Herpes Zoster
    (30, 48, 'Apply twice daily'),    -- Mupirocin for Bacterial Skin Infection
    (31, 49, '20mg daily'),          -- Simvastatin for High Cholesterol
    (32, 50, '100mg daily'),         -- Lamotrigine for Bipolar Disorder
    (33, 3, '50mg per cycle'),       -- Doxorubicin for Cancer (alternative treatment)
    (34, 4, '2.5mg weekly'),         -- Methotrexate for Inflammation
    (35, 5, '0.4mg daily'),          -- Tamsulosin for Prostate Issues
    (36, 6, 'Apply twice daily'),     -- Hydrocortisone for Skin Conditions
    (37, 7, '325mg daily'),          -- Ferrous Sulfate for Anemia
    (38, 8, '10mg daily'),           -- Cetirizine for Allergies
    (39, 9, '300mg daily'),          -- Isoniazid for Infection
    (40, 10, '5mg daily');           -- Donepezil for Cognitive Issues

INSERT INTO Nurses (staff_id, specialization, shift_hours) 
VALUES
	(1, 'Pediatrics', '7:00 AM - 3:00 PM'),           -- Alice Johnson
    (6, 'Emergency Care', '7:00 AM - 7:00 PM'),        -- Frank Wilson
    (16, 'Endocrinology', '9:00 AM - 5:00 PM'),        -- Nia Thompson
    (21, 'Cardiology', '8:00 AM - 4:00 PM'),           -- Elias Cohen
    (26, 'Oncology', '11:00 AM - 7:00 PM'),            -- Layla Patel
    (31, 'Neurology', '10:00 AM - 6:00 PM'),           -- Amir Khan
    (36, 'General Surgery', '8:00 AM - 4:00 PM'),      -- Leah Davis
    (41, 'Orthopedics', '9:00 AM - 5:00 PM'),          -- Khalid Yusuf
    (46, 'Neonatology', '10:00 AM - 6:00 PM'),         -- Nia Mensah
    (51, 'Internal Medicine', '7:00 AM - 3:00 PM'),    -- Amina Siddiqui
    (56, 'Dermatology', '8:00 AM - 4:00 PM'),          -- Omar Hassan
    (61, 'Gastroenterology', '11:00 AM - 7:00 PM'),    -- Zara Khan
    (66, 'Nephrology', '7:00 AM - 7:00 PM');           -- Tariq Malik

INSERT INTO Pharmacy (medicine_id, patient_id, quantity, prescription_date) 
VALUES
	(1, 1, 10, '2024-10-11'),    -- Levothyroxine for Patient 1 (Hypothyroidism)
    (2, 3, 15, '2024-10-10'),    -- Omeprazole for Patient 3 (Peptic Ulcer)
    (3, 5, 5, '2024-10-09'),     -- Doxorubicin for Patient 5 (Breast Cancer)
    (4, 2, 20, '2024-10-08'),    -- Methotrexate for Patient 2 (Rheumatoid Arthritis)
    (5, 4, 30, '2024-10-07'),    -- Tamsulosin for Patient 4 (Benign Prostatic Hyperplasia)
    (6, 6, 25, '2024-10-06'),    -- Hydrocortisone for Patient 6 (Eczema)
    (7, 7, 10, '2024-10-05'),    -- Ferrous Sulfate for Patient 7 (Anemia)
    (8, 8, 50, '2024-10-04'),    -- Cetirizine for Patient 8 (Allergic Rhinitis)
    (9, 9, 100, '2024-10-03'),   -- Isoniazid for Patient 9 (Tuberculosis)
    (10, 10, 30, '2024-10-02'),  -- Donepezil for Patient 10 (Dementia)
    (11, 11, 60, '2024-09-30'),  -- Lisinopril for Patient 11 (Hypertension)
    (12, 12, 50, '2024-09-28'),  -- Metoprolol for Patient 12 (Heart Failure)
    (13, 13, 10, '2024-09-27'),  -- Albuterol for Patient 13 (Asthma)
    (14, 14, 90, '2024-09-26'),  -- Atorvastatin for Patient 14 (High Cholesterol)
    (15, 15, 30, '2024-09-25'),  -- Citalopram for Patient 15 (Depression)
    (16, 16, 5, '2024-09-24'),   -- Insulin Glargine for Patient 16 (Type 1 Diabetes)
    (17, 17, 60, '2024-09-23'),  -- Hydrochlorothiazide for Patient 17 (Edema)
    (18, 18, 50, '2024-09-22'),  -- Loratadine for Patient 18 (Seasonal Allergies)
    (19, 19, 90, '2024-09-21'),  -- Gabapentin for Patient 19 (Neuropathic Pain)
    (20, 20, 30, '2024-09-20'),  -- Warfarin for Patient 20 (Atrial Fibrillation)
    (21, 21, 60, '2024-09-19'),  -- Fluoxetine for Patient 21 (Anxiety Disorder)
    (22, 22, 50, '2024-09-18'),  -- Pantoprazole for Patient 22 (GERD)
    (23, 23, 20, '2024-09-17'),  -- Tramadol for Patient 23 (Acute Pain)
    (24, 24, 15, '2024-09-16'),  -- Azithromycin for Patient 24 (Bacterial Infection)
    (25, 25, 30, '2024-09-15'),  -- Montelukast for Patient 25 (Chronic Asthma)
    (26, 26, 60, '2023-08-10'),  -- Clopidogrel for Patient 26 (Coronary Artery Disease)
    (27, 27, 50, '2023-07-05'),  -- Furosemide for Patient 27 (Fluid Retention)
    (28, 28, 60, '2023-06-20'),  -- Sertraline for Patient 28 (Depression)
    (29, 29, 20, '2023-05-15'),  -- Levofloxacin for Patient 29 (UTI)
    (30, 30, 15, '2023-04-10'),  -- Lidocaine for Patient 30 (Contact Dermatitis)
    (31, 31, 90, '2023-03-05'),  -- Ranitidine for Patient 31 (Peptic Ulcer Disease)
    (32, 32, 60, '2023-02-20'),  -- Amlodipine for Patient 32 (Hypertension)
    (33, 33, 30, '2023-01-15'),  -- Venlafaxine for Patient 33 (Depression)
    (34, 34, 20, '2022-12-10'),  -- Methylprednisolone for Patient 34 (Inflammation)
    (35, 35, 50, '2022-11-05'),  -- Cephalexin for Patient 35 (Skin Infection)
    (36, 36, 60, '2022-10-20'),  -- Esomeprazole for Patient 36 (Acid Reflux)
    (37, 37, 30, '2022-09-15'),  -- Duloxetine for Patient 37 (Chronic Pain)
    (38, 38, 90, '2022-08-10'),  -- Rosuvastatin for Patient 38 (Hyperlipidemia)
    (39, 39, 50, '2022-07-05'),  -- Trazodone for Patient 39 (Insomnia)
    (40, 40, 100, '2022-06-20'), -- Acetaminophen for Patient 40 (Fever)
    (41, 41, 15, '2022-05-15'),  -- Clarithromycin for Patient 41 (Sinus Infection)
    (42, 42, 5, '2022-04-10'),   -- Dexamethasone for Patient 42 (Allergic Asthma)
    (43, 43, 60, '2022-03-05'),  -- Losartan for Patient 43 (Hypertension)
    (44, 44, 30, '2022-02-20'),  -- Escitalopram for Patient 44 (Anxiety Disorder)
    (45, 45, 20, '2022-01-15'),  -- Prednisolone for Patient 45 (Allergic Conjunctivitis)
    (46, 46, 50, '2025-01-10'),  -- Naproxen for Patient 46 (Arthritis Pain)
    (47, 47, 15, '2025-02-05'),  -- Valacyclovir for Patient 47 (Herpes Zoster)
    (48, 48, 10, '2025-03-20'),  -- Mupirocin for Patient 48 (Bacterial Skin Infection)
    (49, 49, 60, '2025-04-15'),  -- Simvastatin for Patient 49 (High Cholesterol)
    (50, 50, 30, '2025-05-01'),  -- Lamotrigine for Patient 50 (Bipolar Disorder)
	(51, 51, 60, '2024-11-01'),  -- Simvastatin for Patient 51 (High Cholesterol)
    (52, 52, 30, '2024-10-30'),  -- Lamotrigine for Patient 52 (Bipolar Disorder)
    (53, 53, 50, '2024-10-29'),  -- Acetaminophen for Patient 53 (Pain Relief)
    (54, 54, 20, '2024-10-28'),  -- Naproxen for Patient 54 (Arthritis Pain)
    (55, 55, 15, '2024-10-27'),  -- Valacyclovir for Patient 55 (Herpes Zoster)
    (56, 56, 10, '2024-10-26'),  -- Mupirocin for Patient 56 (Skin Infection)
    (57, 57, 60, '2024-10-25'),  -- Losartan for Patient 57 (Hypertension)
    (58, 58, 30, '2024-10-24'),  -- Escitalopram for Patient 58 (Anxiety Disorder)
    (59, 59, 20, '2024-10-23'),  -- Prednisolone for Patient 59 (Allergic Conjunctivitis)
    (60, 60, 50, '2024-10-22'),  -- Cephalexin for Patient 60 (Skin Infection)
    (61, 1, 90, '2024-09-10'),   -- Ranitidine for Patient 1 (Peptic Ulcer Disease)
    (62, 2, 60, '2024-08-15'),   -- Amlodipine for Patient 2 (Hypertension)
    (63, 3, 30, '2024-07-20'),   -- Venlafaxine for Patient 3 (Depression)
    (64, 4, 20, '2024-06-25'),   -- Methylprednisolone for Patient 4 (Inflammation)
    (65, 5, 50, '2024-05-30'),   -- Esomeprazole for Patient 5 (Acid Reflux)
    (66, 6, 30, '2024-04-05'),   -- Duloxetine for Patient 6 (Chronic Pain)
    (67, 7, 90, '2024-03-10'),   -- Rosuvastatin for Patient 7 (Hyperlipidemia)
    (68, 8, 50, '2024-02-15'),   -- Trazodone for Patient 8 (Insomnia)
    (69, 9, 15, '2024-01-20'),   -- Clarithromycin for Patient 9 (Sinus Infection)
    (70, 10, 5, '2023-12-25'),   -- Dexamethasone for Patient 10 (Allergic Asthma)
    (71, 11, 60, '2023-11-30'),  -- Levothyroxine for Patient 11 (Hypothyroidism)
    (72, 12, 50, '2023-10-05'),  -- Omeprazole for Patient 12 (Peptic Ulcer)
    (73, 13, 10, '2023-09-10'),  -- Doxorubicin for Patient 13 (Breast Cancer)
    (74, 14, 20, '2023-08-15'),  -- Methotrexate for Patient 14 (Rheumatoid Arthritis)
    (75, 15, 30, '2023-07-20'),  -- Tamsulosin for Patient 15 (Benign Prostatic Hyperplasia)
    (76, 16, 25, '2023-06-25'),  -- Hydrocortisone for Patient 16 (Eczema)
    (77, 17, 10, '2023-05-30'),  -- Ferrous Sulfate for Patient 17 (Anemia)
    (78, 18, 50, '2023-04-05'),  -- Cetirizine for Patient 18 (Allergic Rhinitis)
    (79, 19, 100, '2023-03-10'), -- Isoniazid for Patient 19 (Tuberculosis)
    (80, 20, 30, '2023-02-15'),  -- Donepezil for Patient 20 (Dementia)
    (81, 21, 60, '2023-01-20'),  -- Lisinopril for Patient 21 (Hypertension)
    (82, 22, 50, '2022-12-25'),  -- Metoprolol for Patient 22 (Heart Failure)
    (83, 23, 10, '2022-11-30'),  -- Albuterol for Patient 23 (Asthma)
    (84, 24, 90, '2022-10-05'),  -- Atorvastatin for Patient 24 (High Cholesterol)
    (85, 25, 30, '2022-09-10'),  -- Citalopram for Patient 25 (Depression)
    (86, 26, 5, '2022-08-15'),   -- Insulin Glargine for Patient 26 (Type 1 Diabetes)
    (87, 27, 60, '2022-07-20'),  -- Hydrochlorothiazide for Patient 27 (Edema)
    (88, 28, 50, '2022-06-25'),  -- Loratadine for Patient 28 (Seasonal Allergies)
    (89, 29, 90, '2022-05-30'),  -- Gabapentin for Patient 29 (Neuropathic Pain)
    (90, 30, 30, '2022-04-05'),  -- Warfarin for Patient 30 (Atrial Fibrillation)
    (91, 31, 60, '2022-03-10'),  -- Fluoxetine for Patient 31 (Anxiety Disorder)
    (92, 32, 50, '2022-02-15'),  -- Pantoprazole for Patient 32 (GERD)
    (93, 33, 20, '2022-01-20'),  -- Tramadol for Patient 33 (Acute Pain)
    (94, 34, 15, '2025-01-15'),  -- Azithromycin for Patient 34 (Bacterial Infection)
    (95, 35, 30, '2025-02-10'),  -- Montelukast for Patient 35 (Chronic Asthma)
    (96, 36, 60, '2025-03-05'),  -- Clopidogrel for Patient 36 (Coronary Artery Disease)
    (97, 37, 50, '2025-04-20'),  -- Furosemide for Patient 37 (Fluid Retention)
    (98, 38, 60, '2025-05-15'),  -- Sertraline for Patient 38 (Depression)
    (99, 39, 20, '2025-06-10'),  -- Levofloxacin for Patient 39 (UTI)
    (100, 40, 15, '2025-07-05'); -- Lidocaine for Patient 40 (Contact Dermatitis)

INSERT INTO Workers (staff_id, job_title, work_schedule) 
VALUES
	(5, 'Housekeeping', 'Monday-Friday, 7:00 AM - 3:00 PM'),          -- Eva Davis
    (10, 'Maintenance Technician', 'Monday-Friday, 8:00 AM - 4:00 PM'), -- James Thomas
    (15, 'Dietary Aide', 'Monday-Saturday, 6:00 AM - 2:00 PM'),        -- Zoe Martinez
    (20, 'Laundry Staff', 'Sunday-Thursday, 9:00 AM - 5:00 PM'),       -- Jaden Kim
    (30, 'Environmental Services', 'Tuesday-Saturday, 3:00 PM - 11:00 PM'), -- Mila Hernandez
    (40, 'Transport Aide', 'Monday-Friday, 10:00 AM - 6:00 PM'),       -- Esme Garcia
    (50, 'Housekeeping Supervisor', 'Monday-Friday, 6:00 AM - 2:00 PM'), -- Sofia Reyes
    (60, 'Maintenance Worker', 'Sunday-Thursday, 11:00 PM - 7:00 AM'), -- Diego Cruz
    (65, 'Kitchen Staff', 'Wednesday-Sunday, 5:00 AM - 1:00 PM'),      -- Lila Nguyen
    (70, 'Sanitation Worker', 'Monday-Friday, 4:00 PM - 12:00 AM'),    -- Ibrahim Suleiman
    (75, 'Supply Clerk', 'Tuesday-Saturday, 8:00 AM - 4:00 PM');       -- Yuki Sato

INSERT INTO Room_Types (room_type_name, description)
VALUES
    ('ICU', 'ICU for critical care patients'),
    ('Laboratory', 'Laboratories for medical testing and diagnostics'),
    ('Cosmetic', 'Rooms for cosmetic surgeries and treatments'),
    ('Operating', 'Operating rooms for surgeries'),
    ('Staff', 'Staff rooms for hospital employees'),
    ('General Ward', 'Ward for general patient care and recovery'),
    ('Radiology', 'Rooms for imaging services like X-rays and MRIs'),
    ('Emergency', 'Emergency rooms for urgent care and trauma'),
    ('Pediatric Ward', 'Ward for pediatric patient care'),
    ('Rehabilitation', 'Rooms for physical therapy and rehabilitation');

INSERT INTO Rooms (room_number, room_type_id, capacity, status, last_serviced)
VALUES
    ('ICU101', 1, 2, 'Available', '2024-10-01'),          -- ICU
    ('LAB201', 2, 4, 'Occupied', '2024-10-05'),           -- Laboratory
    ('COS301', 3, 1, 'Under Maintenance', '2024-10-10'),  -- Cosmetic
    ('OPR401', 4, 2, 'Available', '2024-10-01'),          -- Operating
    ('STF501', 5, 3, 'Occupied', '2024-09-20'),           -- Staff
    ('WRD601', 6, 6, 'Occupied', '2024-11-01'),           -- General Ward
    ('RAD701', 7, 3, 'Available', '2024-10-15'),          -- Radiology
    ('EMR801', 8, 4, 'Under Maintenance', '2024-10-20'),  -- Emergency
    ('PED901', 9, 5, 'Available', '2024-10-25'),          -- Pediatric Ward
    ('REH1001', 10, 2, 'Occupied', '2024-10-30'),         -- Rehabilitation
    ('ICU102', 1, 2, 'Occupied', '2024-11-05'),           -- ICU
    ('LAB202', 2, 4, 'Available', '2024-10-10'),          -- Laboratory
    ('COS302', 3, 1, 'Available', '2024-09-25'),          -- Cosmetic
    ('OPR402', 4, 2, 'Under Maintenance', '2024-10-05'),  -- Operating
    ('STF502', 5, 3, 'Available', '2024-10-15'),          -- Staff
    ('WRD602', 6, 8, 'Available', '2024-11-10'),          -- General Ward
    ('RAD702', 7, 3, 'Occupied', '2024-10-20'),           -- Radiology
    ('EMR802', 8, 4, 'Available', '2024-10-25'),          -- Emergency
    ('PED902', 9, 5, 'Occupied', '2024-11-01'),           -- Pediatric Ward
    ('REH1002', 10, 2, 'Available', '2024-10-30'),        -- Rehabilitation
	('ICU106', 1, 2, 'Available', '2024-12-01'),          -- ICU
    ('ICU107', 1, 2, 'Occupied', '2024-12-10'),           -- ICU
    ('ICU108', 1, 2, 'Under Maintenance', '2025-01-01'),  -- ICU
    ('LAB206', 2, 4, 'Available', '2024-12-05'),          -- Laboratory
    ('LAB207', 2, 4, 'Occupied', '2024-12-15'),           -- Laboratory
    ('LAB208', 2, 4, 'Under Maintenance', '2025-01-05'),  -- Laboratory
    ('COS306', 3, 1, 'Available', '2024-12-20'),          -- Cosmetic
    ('COS307', 3, 1, 'Occupied', '2025-01-10'),           -- Cosmetic
    ('COS308', 3, 1, 'Under Maintenance', '2025-01-20'),  -- Cosmetic
    ('OPR406', 4, 2, 'Available', '2024-12-15'),          -- Operating
    ('OPR407', 4, 2, 'Occupied', '2024-12-25'),           -- Operating
    ('OPR408', 4, 2, 'Under Maintenance', '2025-01-15'),  -- Operating
    ('STF506', 5, 3, 'Available', '2024-12-10'),          -- Staff
    ('STF507', 5, 3, 'Occupied', '2025-01-01'),           -- Staff
    ('STF508', 5, 3, 'Under Maintenance', '2025-01-25'),  -- Staff
    ('WRD606', 6, 8, 'Available', '2024-12-20'),          -- General Ward
    ('WRD607', 6, 6, 'Occupied', '2025-01-05'),           -- General Ward
    ('WRD608', 6, 10, 'Under Maintenance', '2025-01-15'), -- General Ward
    ('WRD609', 6, 8, 'Available', '2025-02-01'),          -- General Ward
    ('RAD706', 7, 3, 'Available', '2024-12-25'),          -- Radiology
    ('RAD707', 7, 3, 'Occupied', '2025-01-10'),           -- Radiology
    ('RAD708', 7, 3, 'Under Maintenance', '2025-01-20'),  -- Radiology
    ('EMR806', 8, 4, 'Available', '2025-01-05'),          -- Emergency
    ('EMR807', 8, 4, 'Occupied', '2025-01-15'),           -- Emergency
    ('EMR808', 8, 4, 'Under Maintenance', '2025-02-01'),  -- Emergency
    ('PED906', 9, 5, 'Available', '2024-12-15'),          -- Pediatric Ward
    ('PED907', 9, 5, 'Occupied', '2024-12-25'),           -- Pediatric Ward
    ('PED908', 9, 5, 'Under Maintenance', '2025-01-10'),  -- Pediatric Ward
    ('PED909', 9, 5, 'Available', '2025-01-20'),          -- Pediatric Ward
    ('REH1006', 10, 2, 'Available', '2024-12-20'),        -- Rehabilitation
    ('REH1007', 10, 2, 'Occupied', '2025-01-05'),         -- Rehabilitation
    ('REH1008', 10, 2, 'Under Maintenance', '2025-01-15'),-- Rehabilitation
    ('ICU109', 1, 2, 'Available', '2025-02-01'),          -- ICU
    ('LAB209', 2, 4, 'Occupied', '2025-02-10'),           -- Laboratory
    ('COS309', 3, 1, 'Available', '2025-02-20');          -- Cosmetic

INSERT INTO Room_Assignments (room_id, staff_id, patient_id, assignment_date, end_date)
VALUES
    (1, 1, NULL, '2024-10-12', NULL),          -- ICU101: Patient 1, no staff
    (2, NULL, 1, '2024-10-11', '2024-10-15'),  -- LAB201: Staff 1 (technician), no patient
    (3, NULL, 2, '2024-10-10', '2024-10-12'),  -- COS301: Staff 2 (specialist), no patient
    (4, 3, NULL, '2024-10-10', NULL),          -- OPR401: Patient 3, no staff
    (5, NULL, NULL, '2024-10-09', NULL),       -- STF501: No patient or staff
    (6, 4, 6, '2024-10-15', '2024-10-20'),     -- ICU106: Patient 4, Staff 6 (nurse)
    (7, 5, NULL, '2024-10-16', '2024-10-18'),  -- ICU107: Patient 5, no staff
    (8, NULL, 17, '2024-10-17', NULL),         -- LAB206: Staff 17 (technician), no patient
    (9, 6, NULL, '2024-10-18', '2024-10-20'),  -- COS306: Patient 6, no staff
    (10, NULL, 4, '2024-10-19', NULL),         -- OPR406: Staff 4 (surgeon), no patient
    (11, NULL, 5, '2024-10-20', NULL),         -- STF506: Staff 5 (worker), no patient
    (12, 7, 16, '2024-10-21', '2024-10-28'),   -- WRD606: Patient 7, Staff 16 (nurse)
    (13, 8, NULL, '2024-10-22', '2024-10-25'), -- RAD706: Patient 8, no staff
    (14, 9, 1, '2024-10-23', '2024-10-27'),    -- EMR806: Patient 9, Staff 1 (nurse)
    (15, 10, 21, '2024-10-24', '2024-10-29'),  -- PED906: Patient 10, Staff 21 (nurse)
    (16, 11, NULL, '2024-10-25', '2024-10-30'),-- REH1006: Patient 11, no staff
    (17, 12, 6, '2024-11-01', '2024-11-05'),   -- ICU108: Patient 12, Staff 6 (nurse)
    (18, NULL, 22, '2024-11-02', NULL),        -- LAB207: Staff 22 (technician), no patient
    (19, 13, NULL, '2024-11-03', '2024-11-06'),-- COS307: Patient 13, no staff
    (20, NULL, 14, '2024-11-04', NULL),        -- OPR407: Staff 14 (surgeon), no patient
    (21, NULL, 15, '2024-11-05', NULL),        -- STF507: Staff 15 (worker), no patient
    (22, 14, 26, '2024-11-06', '2024-11-12'),  -- WRD607: Patient 14, Staff 26 (nurse)
    (23, 15, NULL, '2024-11-07', '2024-11-10'),-- RAD707: Patient 15, no staff
    (24, 16, 1, '2024-11-08', '2024-11-13'),   -- EMR807: Patient 16, Staff 1 (nurse)
    (25, 17, 31, '2024-11-09', '2024-11-15'),  -- PED907: Patient 17, Staff 31 (nurse)
    (26, 18, NULL, '2024-11-10', '2024-11-14'),-- REH1007: Patient 18, no staff
    (27, 19, 36, '2024-11-15', '2024-11-20'),  -- ICU109: Patient 19, Staff 36 (nurse)
    (28, NULL, 27, '2024-11-16', NULL),        -- LAB208: Staff 27 (technician), no patient
    (29, 20, NULL, '2024-11-17', '2024-11-19'),-- COS308: Patient 20, no staff
    (30, NULL, 19, '2024-11-18', NULL),        -- OPR408: Staff 19 (surgeon), no patient
    (31, NULL, 20, '2024-11-19', NULL),        -- STF508: Staff 20 (worker), no patient
    (32, 21, 41, '2024-11-20', '2024-11-27'),  -- WRD608: Patient 21, Staff 41 (nurse)
    (33, 22, NULL, '2024-11-21', '2024-11-24'),-- RAD708: Patient 22, no staff
    (34, 23, 6, '2024-11-22', '2024-11-28'),   -- EMR808: Patient 23, Staff 6 (nurse)
    (35, 24, 46, '2024-11-23', '2024-11-30'),  -- PED908: Patient 24, Staff 46 (nurse)
    (36, 25, NULL, '2024-11-24', '2024-11-29'),-- REH1008: Patient 25, no staff
    (37, 26, 51, '2024-12-01', '2024-12-07'),  -- WRD609: Patient 26, Staff 51 (nurse)
    (38, 27, NULL, '2024-12-02', '2024-12-05'),-- PED909: Patient 27, no staff
    (39, NULL, 32, '2024-12-03', NULL),        -- LAB209: Staff 32 (technician), no patient
    (40, 28, NULL, '2024-12-04', '2024-12-06'),-- COS309: Patient 28, no staff
    (41, 29, 56, '2025-01-01', '2025-01-07'),  -- ICU106: Patient 29, Staff 56 (nurse)
    (42, 30, NULL, '2025-01-02', '2025-01-05'),-- WRD606: Patient 30, no staff
    (45, 32, NULL, '2025-01-05', '2025-01-08'),-- REH1006: Patient 32, no staff
    (46, 33, 1, '2025-02-01', '2025-02-06'),   -- EMR806: Patient 33, Staff 1 (nurse)
    (47, 34, NULL, '2025-02-02', '2025-02-04'),-- RAD706: Patient 34, no staff
    (48, NULL, 42, '2025-02-03', NULL),        -- LAB206: Staff 42 (technician), no patient
    (49, 35, 16, '2025-03-01', '2025-03-07'),  -- WRD607: Patient 35, Staff 16 (nurse)
    (50, 36, NULL, '2025-03-02', '2025-03-05'); -- PED907: Patient 36, no staff

INSERT INTO Cleaning_Service (room_id, service_date, service_time, staff_id, notes)
VALUES
    (1, '2024-11-10', '08:00', 2, 'Daily cleaning for ICU'),
    (3, '2024-11-11', '09:00', 4, 'Post-surgery cleanup in Operating Room'),
    (5, '2024-11-12', '10:30', 3, 'Routine cleaning of staff rooms'),
    (4, '2024-11-13', '11:00', 5, 'Cleaning of Cosmetic Surgery room'),
    (2, '2024-11-14', '12:00', 6, 'Routine cleaning of Laboratory'),
    (6, '2024-11-15', '07:00', 5, 'Daily cleaning for ICU'),                    -- ICU106
    (7, '2024-11-16', '08:30', 30, 'Post-patient cleaning in ICU'),              -- ICU107
    (8, '2024-11-17', '10:00', 70, 'Routine cleaning of Laboratory'),            -- LAB206
    (9, '2024-11-18', '11:30', 50, 'Post-procedure cleaning in Cosmetic room'),  -- COS306
    (10, '2024-11-19', '13:00', 5, 'Post-surgery sterilization in Operating Room'), -- OPR406
    (11, '2024-11-20', '14:00', 20, 'Routine cleaning of staff rooms'),          -- STF506
    (12, '2024-11-21', '06:00', 30, 'Daily ward cleaning'),                      -- WRD606
    (13, '2024-11-22', '09:00', 70, 'Post-imaging cleaning in Radiology'),       -- RAD706
    (14, '2024-11-23', '10:00', 5, 'Post-emergency cleaning'),                   -- EMR806
    (15, '2024-11-24', '12:00', 50, 'Daily cleaning for Pediatric Ward'),        -- PED906
    (16, '2024-11-25', '13:30', 20, 'Post-therapy cleaning in Rehabilitation'),  -- REH1006
    (17, '2024-12-01', '07:30', 30, 'Daily cleaning for ICU'),                   -- ICU108
    (18, '2024-12-02', '08:00', 70, 'Routine cleaning of Laboratory'),           -- LAB207
    (19, '2024-12-03', '09:30', 5, 'Post-procedure cleaning in Cosmetic room'),  -- COS307
    (20, '2024-12-04', '11:00', 50, 'Post-surgery cleanup in Operating Room'),   -- OPR407
    (21, '2024-12-05', '12:30', 20, 'Routine cleaning of staff rooms'),          -- STF507
    (22, '2024-12-06', '14:00', 30, 'Post-discharge ward cleaning'),             -- WRD607
    (23, '2024-12-07', '06:30', 70, 'Routine cleaning in Radiology'),            -- RAD707
    (24, '2024-12-08', '08:00', 5, 'Post-emergency sterilization'),              -- EMR807
    (25, '2024-12-09', '09:00', 50, 'Child-safe cleaning in Pediatric Ward'),    -- PED907
    (26, '2024-12-10', '10:30', 20, 'Routine cleaning in Rehabilitation'),       -- REH1007
    (27, '2024-12-15', '11:00', 30, 'Daily cleaning for ICU'),                   -- ICU109
    (28, '2024-12-16', '12:00', 70, 'Post-testing cleaning in Laboratory'),      -- LAB208
    (29, '2024-12-17', '13:00', 5, 'Post-procedure cleaning in Cosmetic room'),  -- COS308
    (30, '2024-12-18', '14:30', 50, 'Post-surgery cleanup in Operating Room'),   -- OPR408
    (31, '2024-12-19', '06:00', 20, 'Routine cleaning of staff rooms'),          -- STF508
    (32, '2024-12-20', '07:00', 30, 'Daily ward cleaning'),                      -- WRD608
    (33, '2024-12-21', '08:30', 70, 'Post-imaging cleaning in Radiology'),       -- RAD708
    (34, '2024-12-22', '09:00', 5, 'Post-emergency cleaning'),                   -- EMR808
    (35, '2024-12-23', '10:00', 50, 'Daily cleaning for Pediatric Ward'),        -- PED908
    (36, '2025-01-01', '11:30', 20, 'Post-therapy cleaning in Rehabilitation'),  -- REH1008
    (37, '2025-01-02', '12:00', 30, 'Daily ward cleaning'),                      -- WRD609
    (38, '2025-01-03', '13:00', 70, 'Routine cleaning of Laboratory'),           -- LAB209
    (39, '2025-01-04', '14:00', 5, 'Post-procedure cleaning in Cosmetic room'),  -- COS309
    (40, '2025-01-05', '06:30', 50, 'Child-safe cleaning in Pediatric Ward'),    -- PED909
    (41, '2025-02-01', '07:00', 20, 'Routine cleaning of staff rooms'),          -- STF506
    (42, '2025-02-02', '08:00', 30, 'Post-discharge ward cleaning'),             -- WRD606
    (43, '2025-02-03', '09:30', 70, 'Post-imaging cleaning in Radiology'),       -- RAD706
    (44, '2025-02-04', '10:00', 5, 'Post-emergency sterilization'),              -- EMR806
    (45, '2025-03-01', '11:00', 50, 'Daily cleaning for ICU'),                   -- ICU106
    (46, '2025-03-02', '12:30', 20, 'Routine cleaning in Rehabilitation'),       -- REH1006
    (47, '2025-03-03', '13:00', 30, 'Daily ward cleaning'),                      -- WRD607
    (48, '2025-04-01', '14:00', 70, 'Post-testing cleaning in Laboratory'),      -- LAB207
    (49, '2025-04-02', '06:00', 5, 'Post-surgery cleanup in Operating Room'),    -- OPR407
    (50, '2025-05-01', '07:30', 50, 'Child-safe cleaning in Pediatric Ward'),    -- PED907
	(1, '2025-06-01', '06:00', 5, 'Daily cleaning for ICU'),                    -- ICU101
    (2, '2025-06-02', '07:30', 20, 'Routine cleaning of Laboratory'),           -- LAB201
    (3, '2025-06-03', '08:00', 30, 'Post-procedure cleaning in Cosmetic room'), -- COS301
    (4, '2025-06-04', '09:00', 50, 'Post-surgery cleanup in Operating Room'),   -- OPR401
    (5, '2025-06-05', '10:30', 70, 'Routine cleaning of staff rooms'),          -- STF501
    (6, '2025-06-06', '11:00', 5, 'Post-patient cleaning in ICU'),              -- ICU106
    (7, '2025-06-07', '12:00', 20, 'Daily cleaning for ICU'),                   -- ICU107
    (8, '2025-06-08', '13:00', 30, 'Post-testing cleaning in Laboratory'),      -- LAB206
    (9, '2025-06-09', '14:00', 50, 'Post-procedure cleaning in Cosmetic room'), -- COS306
    (10, '2025-06-10', '15:00', 70, 'Post-surgery sterilization in Operating Room'), -- OPR406
    (11, '2025-06-11', '16:00', 5, 'Routine cleaning of staff rooms'),          -- STF506
    (12, '2025-06-12', '06:30', 20, 'Daily ward cleaning'),                     -- WRD606
    (13, '2025-06-13', '07:00', 30, 'Post-imaging cleaning in Radiology'),      -- RAD706
    (14, '2025-06-14', '08:30', 50, 'Post-emergency cleaning'),                 -- EMR806
    (15, '2025-06-15', '09:00', 70, 'Child-safe cleaning in Pediatric Ward'),   -- PED906
    (16, '2025-06-16', '10:00', 5, 'Post-therapy cleaning in Rehabilitation'),  -- REH1006
    (17, '2025-07-01', '11:30', 20, 'Daily cleaning for ICU'),                  -- ICU108
    (18, '2025-07-02', '12:00', 30, 'Routine cleaning of Laboratory'),          -- LAB207
    (19, '2025-07-03', '13:00', 50, 'Post-procedure cleaning in Cosmetic room'),-- COS307
    (20, '2025-07-04', '14:30', 70, 'Post-surgery cleanup in Operating Room'),  -- OPR407
    (21, '2025-07-05', '15:00', 5, 'Routine cleaning of staff rooms'),          -- STF507
    (22, '2025-07-06', '16:00', 20, 'Post-discharge ward cleaning'),            -- WRD607
    (23, '2025-07-07', '06:00', 30, 'Routine cleaning in Radiology'),           -- RAD707
    (24, '2025-07-08', '07:30', 50, 'Post-emergency sterilization'),            -- EMR807
    (25, '2025-07-09', '08:00', 70, 'Child-safe cleaning in Pediatric Ward'),   -- PED907
    (26, '2025-07-10', '09:00', 5, 'Routine cleaning in Rehabilitation'),       -- REH1007
    (27, '2025-08-01', '10:30', 20, 'Daily cleaning for ICU'),                  -- ICU109
    (28, '2025-08-02', '11:00', 30, 'Post-testing cleaning in Laboratory'),     -- LAB208
    (29, '2025-08-03', '12:00', 50, 'Post-procedure cleaning in Cosmetic room'),-- COS308
    (30, '2025-08-04', '13:00', 70, 'Post-surgery cleanup in Operating Room'),  -- OPR408
    (31, '2025-08-05', '14:00', 5, 'Routine cleaning of staff rooms'),          -- STF508
    (32, '2025-08-06', '15:30', 20, 'Daily ward cleaning'),                     -- WRD608
    (33, '2025-08-07', '16:00', 30, 'Post-imaging cleaning in Radiology'),      -- RAD708
    (34, '2025-08-08', '06:30', 50, 'Post-emergency cleaning'),                 -- EMR808
    (35, '2025-08-09', '07:00', 70, 'Child-safe cleaning in Pediatric Ward'),   -- PED908
    (36, '2025-09-01', '08:00', 5, 'Post-therapy cleaning in Rehabilitation'),  -- REH1008
    (37, '2025-09-02', '09:30', 20, 'Daily ward cleaning'),                     -- WRD609
    (38, '2025-09-03', '10:00', 30, 'Routine cleaning of Laboratory'),          -- LAB209
    (39, '2025-09-04', '11:00', 50, 'Post-procedure cleaning in Cosmetic room'),-- COS309
    (40, '2025-10-01', '12:30', 70, 'Child-safe cleaning in Pediatric Ward'),   -- PED909
    (41, '2025-10-02', '13:00', 5, 'Routine cleaning of staff rooms'),          -- STF506
    (42, '2025-11-01', '14:00', 20, 'Post-discharge ward cleaning'),            -- WRD606
    (43, '2025-11-02', '15:00', 30, 'Post-imaging cleaning in Radiology'),      -- RAD706
    (44, '2025-12-01', '16:00', 50, 'Post-emergency sterilization'),            -- EMR806
    (45, '2026-01-01', '06:00', 70, 'Daily cleaning for ICU'),                  -- ICU106
    (46, '2026-02-01', '07:30', 5, 'Routine cleaning in Rehabilitation'),       -- REH1006
    (47, '2026-03-01', '08:00', 20, 'Daily ward cleaning'),                     -- WRD607
    (48, '2026-04-01', '09:00', 30, 'Post-testing cleaning in Laboratory'),     -- LAB207
    (49, '2026-05-01', '10:30', 50, 'Post-surgery cleanup in Operating Room'),  -- OPR407
    (50, '2026-05-02', '11:00', 70, 'Child-safe cleaning in Pediatric Ward');   -- PED907

INSERT INTO Prescription (patient_id, doctor_id, prescription_date, medication_name, dosage, frequency, duration, notes)
VALUES
    (1, 3, '2024-11-10', 'Paracetamol', '500mg', 'Every 6 hours', '5 days', 'For pain relief'),
    (2, 4, '2024-11-11', 'Amoxicillin', '250mg', 'Every 8 hours', '7 days', 'For bacterial infection'),
    (3, 2, '2024-11-12', 'Metformin', '500mg', 'Twice daily', 'Indefinite', 'For diabetes management'),
    (4, 5, '2024-11-13', 'Aspirin', '75mg', 'Once daily', '30 days', 'For blood thinning'),
    (5, 1, '2024-11-14', 'Ibuprofen', '200mg', 'Every 4 hours', '3 days', 'For fever and pain'),
    (6, 6, '2024-11-15', 'Lisinopril', '10mg', 'Once daily', 'Indefinite', 'For hypertension'),
    (7, 7, '2024-11-16', 'Atorvastatin', '20mg', 'Once daily', 'Indefinite', 'For cholesterol management'),
    (8, 8, '2024-11-17', 'Omeprazole', '20mg', 'Once daily', '14 days', 'For acid reflux'),
    (9, 9, '2024-11-18', 'Ceftriaxone', '1g', 'Every 12 hours', '5 days', 'For severe infection'),
    (10, 10, '2024-11-19', 'Insulin Glargine', '10 units', 'Once daily', 'Indefinite', 'For diabetes control'),
    (11, 1, '2024-11-20', 'Prednisone', '10mg', 'Once daily', '7 days', 'For inflammation'),
    (12, 2, '2024-11-21', 'Levothyroxine', '50mcg', 'Once daily', 'Indefinite', 'For hypothyroidism'),
    (13, 3, '2024-11-22', 'Azithromycin', '500mg', 'Once daily', '3 days', 'For respiratory infection'),
    (14, 4, '2024-11-23', 'Warfarin', '5mg', 'Once daily', '30 days', 'For anticoagulation'),
    (15, 5, '2024-11-24', 'Tramadol', '50mg', 'Every 6 hours', '5 days', 'For moderate pain'),
    (16, 6, '2024-12-01', 'Metoprolol', '25mg', 'Twice daily', 'Indefinite', 'For heart rate control'),
    (17, 7, '2024-12-02', 'Hydrochlorothiazide', '12.5mg', 'Once daily', 'Indefinite', 'For hypertension'),
    (18, 8, '2024-12-03', 'Clarithromycin', '500mg', 'Twice daily', '7 days', 'For bacterial infection'),
    (19, 9, '2024-12-04', 'Albuterol', '2 puffs', 'Every 4 hours', '14 days', 'For asthma relief'),
    (20, 10, '2024-12-05', 'Gabapentin', '300mg', 'Three times daily', '30 days', 'For neuropathic pain'),
    (21, 11, '2024-12-06', 'Fluoxetine', '20mg', 'Once daily', 'Indefinite', 'For depression'),
    (22, 12, '2024-12-07', 'Ciprofloxacin', '500mg', 'Twice daily', '7 days', 'For urinary tract infection'),
    (23, 13, '2024-12-08', 'Simvastatin', '40mg', 'Once daily', 'Indefinite', 'For cholesterol management'),
    (24, 14, '2024-12-09', 'Morphine', '5mg', 'Every 4 hours', '3 days', 'For severe pain'),
    (25, 15, '2024-12-10', 'Losartan', '50mg', 'Once daily', 'Indefinite', 'For hypertension'),
    (26, 16, '2025-01-01', 'Doxycycline', '100mg', 'Twice daily', '10 days', 'For skin infection'),
    (27, 17, '2025-01-02', 'Amlodipine', '5mg', 'Once daily', 'Indefinite', 'For blood pressure control'),
    (28, 18, '2025-01-03', 'Pantoprazole', '40mg', 'Once daily', '14 days', 'For gastric ulcer'),
    (29, 19, '2025-01-04', 'Cephalexin', '500mg', 'Every 6 hours', '7 days', 'For wound infection'),
    (30, 20, '2025-01-05', 'Insulin Aspart', '5 units', 'Before meals', 'Indefinite', 'For diabetes control'),
    (31, 21, '2025-01-06', 'Loratadine', '10mg', 'Once daily', '14 days', 'For allergies'),
    (32, 22, '2025-01-07', 'Clopidogrel', '75mg', 'Once daily', '30 days', 'For antiplatelet therapy'),
    (33, 23, '2025-01-08', 'Vancomycin', '1g', 'Every 12 hours', '5 days', 'For MRSA infection'),
    (34, 24, '2025-01-09', 'Sertraline', '50mg', 'Once daily', 'Indefinite', 'For anxiety'),
    (35, 25, '2025-01-10', 'Furosemide', '40mg', 'Once daily', 'Indefinite', 'For fluid retention'),
    (36, 1, '2025-02-01', 'Naproxen', '500mg', 'Twice daily', '7 days', 'For arthritis pain'),
    (37, 2, '2025-02-02', 'Ranitidine', '150mg', 'Twice daily', '14 days', 'For heartburn'),
    (38, 3, '2025-02-03', 'Levofloxacin', '500mg', 'Once daily', '7 days', 'For pneumonia'),
    (39, 4, '2025-02-04', 'Enalapril', '10mg', 'Once daily', 'Indefinite', 'For heart failure'),
    (40, 5, '2025-02-05', 'Codeine', '30mg', 'Every 6 hours', '5 days', 'For cough suppression'),
    (41, 6, '2025-03-01', 'Montelukast', '10mg', 'Once daily', '30 days', 'For asthma prevention'),
    (42, 7, '2025-03-02', 'Nitroglycerin', '0.4mg', 'As needed', 'Indefinite', 'For angina'),
    (43, 8, '2025-03-03', 'Acyclovir', '400mg', 'Three times daily', '7 days', 'For viral infection'),
    (44, 9, '2025-03-04', 'Rosuvastatin', '10mg', 'Once daily', 'Indefinite', 'For cholesterol management'),
    (45, 10, '2025-03-05', 'Oxycodone', '5mg', 'Every 4 hours', '3 days', 'For post-surgical pain'),
    (46, 11, '2025-04-01', 'Glipizide', '5mg', 'Once daily', 'Indefinite', 'For diabetes management'),
    (47, 12, '2025-04-02', 'Budesonide', '2 puffs', 'Twice daily', '30 days', 'For asthma control'),
    (48, 13, '2025-04-03', 'Metronidazole', '500mg', 'Three times daily', '7 days', 'For anaerobic infection'),
    (49, 14, '2025-04-04', 'Carvedilol', '6.25mg', 'Twice daily', 'Indefinite', 'For heart failure'),
    (50, 15, '2025-05-01', 'Hydrocortisone', '20mg', 'Twice daily', '14 days', 'For inflammation');



