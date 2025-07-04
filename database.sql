DROP DATABASE IF EXISTS Hospital_Management_System;

CREATE DATABASE Hospital_Management_System;

USE Hospital_Management_System;

DROP TABLE IF EXISTS Accountant;

CREATE TABLE Accountant (
  Accountant_id int NOT NULL AUTO_INCREMENT,
  FirstName varchar(255) NOT NULL,
  LastName varchar(255) NOT NULL,
  Sex char(1) NOT NULL,
  Date_of_Birth date NOT NULL,
  Paycheck int NOT NULL,
  PRIMARY KEY (Accountant_id),
  CONSTRAINT Accountant_chk_1 CHECK ((Sex in (_utf8mb4'M',_utf8mb4'F')))
);

INSERT INTO Accountant VALUES 
(1,'Alex','Kumar','M','1990-05-15',60000),
(2,'Neha','Pathak','F','1985-08-22',75000),
(3,'Brijesh','Singh','M','1992-11-08',55000),
(4,'Neera','Gupta','F','1988-02-18',70000),
(5,'Arjun','Patel','M','1995-04-25',80000);

DROP TABLE IF EXISTS Doctor;

CREATE TABLE Doctor (
  Doctor_Id int NOT NULL AUTO_INCREMENT,
  Name varchar(255) NOT NULL,
  Date_of_Birth date NOT NULL,
  Paycheck int NOT NULL,
  Date_of_Joining varchar(255) NOT NULL,
  Age int NOT NULL,
  Sex char(1) NOT NULL,
  Department_Id int DEFAULT NULL,
  Supervisor_Id int DEFAULT NULL,
  Address varchar(255) NOT NULL,
  Phone_no bigint NOT NULL CHECK (LENGTH(Phone_no) = 10),
  PRIMARY KEY (Doctor_Id)
  -- KEY FK_Doctor_Department (Department_Id),
  -- CONSTRAINT FK_Doctor_Department FOREIGN KEY (Department_Id) REFERENCES Department (Department_Id) ON DELETE RESTRICT ON UPDATE CASCADE
);


INSERT INTO Doctor 
(Doctor_Id, Name, Date_of_Birth, Paycheck, Date_of_Joining, Age, Sex, Department_Id, Supervisor_Id, Address, Phone_no) 
VALUES 
(1, 'Dr. John Smith', '1980-01-15', 120000, '2020-05-01', 43, 'M', 1, NULL, '123 Main St, City A', 9876543210),
(2, 'Dr. Ananya Sharma', '1980-05-15', 1200000, '2021-01-15', 42, 'F', 1, 1, '456 Elm St, City B', 9876543211),
(3, 'Dr. Rajesh Patel', '1975-08-22', 999999, '2022-03-10', 47, 'M', 2, 1, '789 Pine St, City C', 9876543212),
(4, 'Dr. Priya Kapoor', '1982-11-08', 1000000, '2020-07-05', 39, 'F', 3, 2, '101 Maple St, City D', 9876543213),
(5, 'Dr. Arjun Menon', '1978-02-18', 1300000, '2023-02-01', 44, 'M', 4, 1, '202 Birch St, City E', 9876543214),
(6, 'Dr. Sneha Joshi', '1985-04-25', 1100000, '2021-09-20', 37, 'F', 5, 4, '303 Cedar St, City F', 9876543215),
(7, 'Dr. Rahul Singh', '1987-06-30', 1600000, '2022-05-12', 35, 'M', 1, 3, '404 Oak St, City G', 9876543216),
(8, 'Dr. Nisha Reddy', '1983-09-17', 1100000, '2020-11-08', 38, 'F', 2, 3, '505 Spruce St, City H', 9876543217),
(9, 'Dr. Aryan Kapoor', '1989-12-03', 1400000, '2023-04-15', 32, 'M', 3, 4, '606 Walnut St, City I', 9876543218),
(10, 'Dr. Neha Verma', '1984-03-20', 1200000, '2021-07-01', 38, 'F', 4, 5, '707 Chestnut St, City J', 9876543219),
(11, 'Dr. Karthik Rajan', '1986-07-12', 1700000, '2022-08-25', 36, 'M', 5, 6, '808 Cypress St, City K', 9876543220),
(12, 'Dr. Dev', '2004-12-01', 60000, '2021-12-04', 30, 'M', 2, 7, '909 Beech St, City L', 9876543221);


DROP TABLE IF EXISTS Department;


CREATE TABLE Department (
  Department_Id int NOT NULL AUTO_INCREMENT,
  Department_Name varchar(255) NOT NULL,
  Department_Head_Id int DEFAULT NULL,
  Floor_No int NOT NULL,
  Block_Name varchar(255) NOT NULL,
  PRIMARY KEY (Department_Id),
  KEY FK_Department_Head (Department_Head_Id),
  CONSTRAINT FK_Department_Head FOREIGN KEY (Department_Head_Id) REFERENCES Doctor (Doctor_ID) ON DELETE SET NULL ON UPDATE CASCADE
);


INSERT INTO Department (Department_Id, Department_Name, Department_Head_Id, Floor_No, Block_Name) VALUES
    (1, 'Cardiology', 7, 1, 'T-HUB'),
    (2, 'Neurology', 3, 2, 'KCIS'),
    (3, 'Dermatology', 9, 3, 'VINDHYA-A6'),
    (4, 'Pathology', 10, 4, 'VINDHYA-A4'),
    (5, 'Ophthalmology', 11, 5, 'VINDHYA-A3');


ALTER TABLE Doctor ADD CONSTRAINT FK_Doctor_Department FOREIGN KEY (Department_Id) REFERENCES Department (Department_Id) ON DELETE RESTRICT ON UPDATE CASCADE;



DROP TABLE IF EXISTS Previous_Degrees_Doctor;

CREATE TABLE Previous_Degrees_Doctor (
    Doctor_Id int NOT NULL,
    College varchar(255) NOT NULL,
    Year int NOT NULL,
    Degree varchar(255) NOT NULL,
    Field varchar(255) NOT NULL,
    KEY FK_Previous_Degrees_Doctor_Doctor (Doctor_Id),
    CONSTRAINT FK_Previous_Degrees_Doctor_Doctor FOREIGN KEY (Doctor_Id)
        REFERENCES Doctor (Doctor_Id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


INSERT INTO Previous_Degrees_Doctor VALUES
    (2, 'College A', 2010, 'MBBS', 'Medicine'),
    (2, 'College B', 2015, 'MD', 'Internal Medicine'),
    (3, 'College C', 2012, 'MBBS', 'Medicine'),
    (4, 'College D', 2013, 'MBBS', 'Medicine'),
    (5, 'College E', 2011, 'DO', 'Osteopathic Medicine'),
    (6, 'College F', 2009, 'MBBS', 'Medicine'),
    (6, 'College G', 2014, 'DNB', 'Internal Medicine'),
    (7, 'College H', 2008, 'MBBS', 'Medicine'),
    (7, 'College I', 2018, 'PhD', 'Biomedical Sciences'),
    (8, 'College J', 2007, 'MBBS', 'Medicine'),
    (8, 'College K', 2016, 'MS', 'Surgery'),
    (9, 'College L', 2020, 'MCh', 'Neurosurgery'),
    (10, 'College M', 2014, 'MBBS', 'Medicine'),
    (12, 'College N', 2015, 'MBBS', 'Medicine');


DROP TABLE IF EXISTS Patient;
CREATE TABLE Patient (
  Patient_Id int NOT NULL AUTO_INCREMENT,
  Name varchar(255) NOT NULL,
  Sex char(1) NOT NULL,
  Blood_group varchar(255) NOT NULL,
  Phone_no bigint NOT NULL CHECK (LENGTH(Phone_no) = 10),
  Insurance_Id varchar(255) NOT NULL,
  Age int NOT NULL,
  Diabetic boolean NOT NULL,
  Blood_pressure boolean NOT NULL,
  PRIMARY KEY (Patient_Id),
  CONSTRAINT Patient_chk_1 CHECK (Sex IN ('M', 'F'))
);

INSERT INTO Patient 
(Patient_Id, Name, Sex, Blood_group, Phone_no, Insurance_Id, Age, Diabetic, Blood_pressure) 
VALUES 
('12', 'Aarav Kapoor', 'M', 'B+', 9876543210,  'INS123', 30, FALSE, TRUE),
('13', 'Diya Shah', 'F', 'O-', 8765432109,  'INS124', 25, FALSE, FALSE),
('14', 'Kabir Sharma', 'M', 'A+', 7654321098,  'INS125', 40, TRUE, FALSE),
('15', 'Aanya Singh', 'F', 'AB-', 6543210987,  'INS126', 35, TRUE, TRUE),
('16', 'Vihaan Patel', 'M', 'O+', 5432109876,  'INS127', 28, FALSE, FALSE),
('17', 'Anika Joshi', 'F', 'B-', 9876543211,  'INS128', 42, TRUE, TRUE),
('18', 'Advait Verma', 'M', 'A+', 8765432101,  'INS129', 33, TRUE, FALSE),
('19', 'Zara Khan', 'F', 'O-', 7654321092,  'INS130', 22, FALSE, FALSE),
('20', 'Arjun Khanna', 'M', 'AB+', 6543210983,  'INS131', 31, TRUE, TRUE),
('21', 'Ria Sharma', 'F', 'A+', 5432109874,  'INS132', 29, FALSE, TRUE),
('22', 'Vivaan Kapoor', 'M', 'A-', 9876543212, 'INS133', 34, TRUE, TRUE),
('23', 'Kiara Patel', 'F', 'B+', 8765432103,  'INS134', 27, FALSE, FALSE),
('24', 'Reyansh Singh', 'M', 'AB-', 7654321094,  'INS135', 36, TRUE, TRUE),
('25', 'Aaradhya Gupta', 'F', 'O+', 6543210985,  'INS136', 26, FALSE, FALSE),
('26', 'Aarav Malhotra', 'M', 'B-', 5432109876,  'INS137', 39, TRUE, FALSE),
('27', 'Diya Verma', 'F', 'A+', 9876543213,  'INS138', 41, TRUE, TRUE),
('28', 'Kabir Mehta', 'M', 'O-', 8765432104,  'INS139', 32, FALSE, FALSE),
('29', 'Aanya Kapoor', 'F', 'AB+', 7654321095,  'INS140', 38, TRUE, TRUE),
('30', 'Vihaan Sharma', 'M', 'O+', 6543210986,  'INS141', 24, FALSE, FALSE),
('31', 'Anaya Patel', 'F', 'B-', 5432109877,  'INS142', 37, TRUE, TRUE),
('32', 'Divyaraj', 'M', 'A+', 9898778866,  'INS143', 29, FALSE, TRUE);


DROP TABLE IF EXISTS Nurse;

CREATE TABLE Nurse (
  Nurse_Id int NOT NULL AUTO_INCREMENT,
  Name varchar(255) NOT NULL,
  Sex char(1) NOT NULL,
  Date_of_Birth date NOT NULL,
  Paycheck int NOT NULL,
  Department_Id int DEFAULT NULL,
  PRIMARY KEY (Nurse_Id),
  CONSTRAINT Nurse_chk_1 CHECK (Sex IN ('M', 'F')),
  KEY FK_Nurse_Department (Department_Id),
  CONSTRAINT FK_Nurse_Department FOREIGN KEY (Department_Id) REFERENCES Department (Department_Id) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO Nurse 
(Nurse_Id, Name, Sex, Date_of_Birth, Paycheck, Department_Id)
VALUES
(1, 'Sakshi Sharma', 'F', '1990-05-15', 55000, 1),
(2, 'Rahul Kumar', 'M', '1985-08-20', 60000, 2),
(3, 'Neha Singh', 'F', '1992-11-10', 50000, 3),
(4, 'Amit Patel', 'M', '1988-04-25', 65000, 4),
(5, 'Priya Gupta', 'F', '1993-03-18', 60000, 5),
(6, 'Archit', 'M', '1995-07-07', 12000, 1);


DROP TABLE IF EXISTS Previous_Degrees_Nurse;

CREATE TABLE Previous_Degrees_Nurse (
    Nurse_Id int NOT NULL,
    College varchar(255) NOT NULL,
    Year int NOT NULL,
    Degree varchar(255) NOT NULL,
    Field varchar(255) NOT NULL,
    KEY FK_Previous_Degrees_Nurse_Nurse (Nurse_Id),
    CONSTRAINT FK_Previous_Degrees_Nurse_Nurse FOREIGN KEY (Nurse_Id)
        REFERENCES Nurse (Nurse_Id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


INSERT INTO Previous_Degrees_Nurse VALUES
    (1, 'College A', 2015, 'BSc Nursing', 'Nursing'),
    (1, 'College B', 2018, 'MSc Nursing', 'Nursing'),
    (2, 'College C', 2012, 'General Nursing Diploma', 'Nursing'),
    (3, 'College D', 2016, 'BSc Nursing', 'Nursing'),
    (4, 'College E', 2010, 'ANM', 'Nursing'),
    (4, 'College F', 2013, 'GNM', 'Nursing'),
    (5, 'College G', 2019, 'Post Basic BSc Nursing', 'Nursing'),
    (6, 'College H', 2014, 'Diploma in Critical Care Nursing', 'Nursing'),
    (6, 'College I', 2017, 'BSc Nursing', 'Nursing');


DROP TABLE IF EXISTS Medical_Record;

CREATE TABLE Medical_Record (
  Case_Id int NOT NULL AUTO_INCREMENT,
  Case_start_date DATE NOT NULL,
  Department_Id varchar(255) NOT NULL,
  Doctor_Id int NOT NULL,
  Recent_visit DATE NOT NULL,
  Next_Appointment DATE NOT NULL,
  Total_visits int NOT NULL,
  Patient_Id int NOT NULL,
  Status varchar(255) NOT NULL,
  PRIMARY KEY (Case_id),
  KEY FK_patient_in_case (Patient_id),
  KEY FK_patient_in_case_2 (Doctor_id),
  KEY FK_patient_in_case_3 (Department_id)
  -- CONSTRAINT FK_patient_in_case FOREIGN KEY (Patient_Id) REFERENCES Patient (Patient_Id) ON DELETE CASCADE ON UPDATE CASCADE,
  -- CONSTRAINT FK_patient_in_case_2 FOREIGN KEY (Doctor_Id) REFERENCES Doctor (Doctor_ID) ON DELETE SET NULL ON UPDATE CASCADE,
  -- CONSTRAINT FK_patient_in_case_3 FOREIGN KEY (Department_Id) REFERENCES Department (Department_Id) ON DELETE SET NULL ON UPDATE CASCADE
);

ALTER TABLE Medical_Record MODIFY COLUMN Doctor_Id int NULL;
ALTER TABLE Medical_Record MODIFY COLUMN Department_Id int NULL;

ALTER TABLE Medical_Record ADD CONSTRAINT FK_patient_in_case FOREIGN KEY (Patient_Id) REFERENCES Patient (Patient_Id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Medical_Record ADD CONSTRAINT FK_patient_in_case_2 FOREIGN KEY (Doctor_Id) REFERENCES Doctor (Doctor_Id) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE Medical_Record ADD CONSTRAINT FK_patient_in_case_3 FOREIGN KEY (Department_Id) REFERENCES Department (Department_Id) ON DELETE SET NULL ON UPDATE CASCADE;

INSERT INTO Medical_Record (Case_Id, Case_start_date, Department_Id, Doctor_Id, Recent_visit, Next_Appointment, Total_visits, Patient_Id, Status) VALUES
    (1, '2023-01-10', '2', 2, '2024-12-10', '2023-04-10', 3, 13, 'In Progress'),  -- updated to December 2024
    (3, '2023-02-28', '4', 3, '2023-03-01', '2023-04-01', 1, 13, 'SUCCESS'),      -- left unchanged
    (4, '2022-09-20', '5', 4, '2023-12-15', '2023-12-13', 4, 14, 'In Progress'),    -- left unchanged
    (5, '2023-03-01', '1', 5, '2024-12-20', '2024-04-01', 2, 12, 'In Progress'),    -- updated to December 2024
    (11, '2023-04-15', '1', 1, '2024-12-05', '2024-05-10', 3, 23, 'Scheduled'),     -- updated to December 2024
    (12, '2023-03-05', '3', 2, '2023-03-10', '2024-12-13', 1, 31, 'SUCCESS'),      -- left unchanged
    (13, '2023-05-20', '4', 3, '2023-12-25', '2023-06-10', 2, 32, 'Scheduled'),    -- updated to December 2024
    (14, '2023-02-15', '1', 4, '2023-02-20', '2023-03-05', 4, 24, 'Closed'),       -- left unchanged
    (15, '2023-04-10', '1', 5, '2023-04-15', '2023-05-01', 2, 26, 'SUCCESS'),      -- left unchanged
    (16, '2023-06-15', '1', 1, '2024-12-20', '2024-12-13', 3, 30, 'Scheduled'),    -- updated to December 2024
    (17, '2023-07-05', '3', 2, '2023-12-10', '2023-07-20', 1, 19, 'In Progress'),  -- updated to December 2024
    (18, '2023-08-20', '4', 3, '2023-08-25', '2023-09-10', 2, 20, 'SUCCESS'),     -- left unchanged
    (19, '2023-05-15', '5', 4, '2023-05-20', '2023-06-05', 4, 18, 'Closed'),       -- left unchanged
    (20, '2023-07-10', '1', 5, '2024-12-01', '2023-12-13', 2, 25, 'In Progress'),  -- updated to December 2024
    (21, '2023-12-03', '2', 12, '2024-12-10', '2023-12-10', 1, 16, 'Active');      -- updated to December 2024


DROP TABLE IF EXISTS Invoice;

CREATE TABLE Invoice (
  Case_id int NOT NULL,
  Consultating_charges int NOT NULL,
  Operational_charges int DEFAULT NULL,
  Medicinal_charges int DEFAULT NULL,
  Transaction_id int NOT NULL,
  KEY FK_Invoice_Invoice (Case_id),
  CONSTRAINT FK_Invoice_Invoice FOREIGN KEY (Case_id) REFERENCES Medical_Record (Case_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Invoice VALUES 
(1, 600, 800, 150, 106),
(1, 750, NULL, 200, 107),
(3, 850, 1100, 250, 108),
(4, 900, 1200, 300, 109),
(12, 450, 800, 100, 112),
(14, 700, 1500, 400, 113),
(14, 800, NULL, NULL, 114),
(15, 950, 2000, 500, 115),
(16, 600, 1100, 300, 116),
(17, 550, 900, NULL, 117),
(18, 750, 1400, 200, 118),
(19, 850, NULL, NULL, 119),
(20, 700, 1000, 150, 120),
(1, 500, 1000, NULL, 101),      -- Matching an existing Medical_Record
(3, 700, 0, NULL, 103),        -- Case with no Medicinal_charges
(4, 800, 1200, 300, 104),      -- Fully detailed Invoice
(5, 900, 1500, 400, 105),      -- Another detailed Invoice
(21, 1234, 123, 90, 11),     -- Random Invoice for a valid Case_id
(3, 600, NULL, 200, 110),      -- Case with only Medicinal_charges
(4, 750, 900, 300, 111),      -- Updated charges for existing Case
(21, 500, NULL, NULL, 112),   -- Minimal Invoice
(5, 1000, 2000, 500, 113),    -- High-value Invoice for Case 5
(1, 450, NULL, 250, 114);


DROP TABLE IF EXISTS Monitors;

CREATE TABLE Monitors (
  Patient_Id INT NOT NULL,
  Nurse_Id INT NOT NULL,
  PRIMARY KEY (Patient_Id, Nurse_Id),
  FOREIGN KEY (Patient_Id) REFERENCES Patient (Patient_Id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Nurse_Id) REFERENCES Nurse (Nurse_Id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Monitors (Patient_Id, Nurse_Id) VALUES
(12, 1), -- Aarav Kapoor with Sakshi Sharma
(13, 2), -- Diya Shah with Rahul Kumar
(14, 3), -- Kabir Sharma with Neha Singh
(15, 4), -- Aanya Singh with Amit Patel
(16, 5), -- Vihaan Patel with Priya Gupta
(17, 1), -- Anika Joshi with Sakshi Sharma
(18, 6), -- Advait Verma with Rahul Kumar
(19, 3), -- Zara Khan with Neha Singh
(20, 4), -- Arjun Khanna with Amit Patel
(21, 5), -- Ria Sharma with Priya Gupta
(22, 1), -- Vivaan Kapoor with Sakshi Sharma
(23, 2), -- Kiara Patel with Rahul Kumar
(24, 3), -- Reyansh Singh with Neha Singh
(25, 6), -- Aaradhya Gupta with Amit Patel
(26, 5), -- Aarav Malhotra with Priya Gupta
(27, 1), -- Diya Verma with Sakshi Sharma
(28, 2), -- Kabir Mehta with Rahul Kumar
(29, 3), -- Aanya Kapoor with Neha Singh
(30, 4), -- Vihaan Sharma with Amit Patel
(31, 5), -- Anaya Patel with Priya Gupta
(32, 1); -- Divyaraj with Sakshi Sharma


DROP TABLE IF EXISTS Patient_Billing;
CREATE TABLE Patient_Billing (
  Case_Id INT NOT NULL,
  Accountant_Id INT,
  Patient_Id INT NOT NULL,
  PRIMARY KEY (Case_Id),
  FOREIGN KEY (Case_Id) REFERENCES Medical_Record (Case_Id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Accountant_Id) REFERENCES Accountant (Accountant_Id) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (Patient_Id) REFERENCES Patient (Patient_Id) ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO Patient_Billing 
(Case_Id, Accountant_Id, Patient_Id)
VALUES
(1, 1, 13),  -- Synchronized with Medical_Record Case_Id 1
(3, 2, 21),  -- Synchronized with Medical_Record Case_Id 3
(4, 3, 14),  -- Synchronized with Medical_Record Case_Id 4
(5, 4, 12),  -- Synchronized with Medical_Record Case_Id 5
(11, 5, 13), -- Synchronized with Medical_Record Case_Id 11
(12, 1, 21), -- Synchronized with Medical_Record Case_Id 12
(13, 2, 12), -- Synchronized with Medical_Record Case_Id 13
(14, 3, 14), -- Synchronized with Medical_Record Case_Id 14
(15, 4, 12), -- Synchronized with Medical_Record Case_Id 15
(16, 5, 13), -- Synchronized with Medical_Record Case_Id 16
(17, 1, 21), -- Synchronized with Medical_Record Case_Id 17
(18, 2, 12), -- Synchronized with Medical_Record Case_Id 18
(19, 3, 14), -- Synchronized with Medical_Record Case_Id 19
(20, 4, 12), -- Synchronized with Medical_Record Case_Id 20
(21, 5, 21); -- Synchronized with Medical_Record Case_Id 21


DROP TABLE IF EXISTS Prescription;

CREATE TABLE Prescription (
  Case_id int NOT NULL,
  Prescription_no int NOT NULL PRIMARY KEY,
  Medicines varchar(255) NOT NULL,
  KEY FK_Prescription_Prescription (Case_id),
  CONSTRAINT FK_Prescription_Prescription FOREIGN KEY (Case_id) REFERENCES Medical_Record (Case_id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO Prescription VALUES (3,103,'Acetaminophen, Amoxicillin'),(1,101,'Aspirin, Metoprolol'),(4,104,'Atorvastatin, Lisinopril'),(5,105,'Eye Drops, Prednisolone'),(21,123,'DOLO65');


DROP TABLE IF EXISTS Medical_History;
CREATE TABLE Medical_History (
  Case_id int NULL UNIQUE,
  Patient_ID int NULL,
  KEY FK_Medical_History_Medical_History (Case_id) ,
  KEY FK_Medical_History_Medical_History_1 (Patient_ID),
  CONSTRAINT FK_Medical_History_Medical_History FOREIGN KEY (Case_id) REFERENCES Medical_Record (Case_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_Medical_History_Medical_History_1 FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Medical_History 
(Case_Id, Patient_Id) 
VALUES
(1, 13), -- Ria Sharma
(3, 21), -- Diya Shah
(4, 30), -- Aanya Singh
(5, 22), -- Kabir Sharma
(11, 23), -- Ria Sharma
(12, 18), -- Diya Shah
(13, 12), -- Kabir Sharma
(14, 24), -- Aanya Singh
(15, 28), -- Kabir Sharma
(16, 30), -- Ria Sharma
(17, 15), -- Diya Shah
(18, 26), -- Kabir Sharma
(19, 24), -- Aanya Singh
(20, 24), -- Kabir Sharma
(21, 16); -- Diya Shah


DROP TABLE IF EXISTS Receptionist;

CREATE TABLE Receptionist (
  Receptionist_id int NOT NULL AUTO_INCREMENT,
  Name varchar(255) NOT NULL,
  Sex char(1) NOT NULL,
  Date_of_Birth date NOT NULL,
  Paycheck int NOT NULL,
  PRIMARY KEY (Receptionist_id),
  CONSTRAINT Receptionist_chk_1 CHECK ((Sex in (_utf8mb4'M',_utf8mb4'F')))
);

INSERT INTO Receptionist VALUES (1,'Renu Sharma','F','1992-03-15',60000),(2,'Vikram Singh','M','1988-07-22',65000),(3,'Anjali Kapoor','F','1990-11-08',55000),(4,'Rajesh Patel','M','1985-05-18',70000),(5,'Neha Gupta','F','1987-09-25',75000);



DROP TABLE IF EXISTS General_Staff;

CREATE TABLE General_Staff (
  Staff_Id int NOT NULL AUTO_INCREMENT,
  Name varchar(255) NOT NULL,
  Sex char(1) NOT NULL,
  Date_of_Birth date NOT NULL,
  Hourly_wage int NOT NULL,
  Shift int NOT NULL,
  Weekly_Hours int NOT NULL,
  Weekly_wage int AS (Hourly_wage * Weekly_Hours) STORED,
  PRIMARY KEY (Staff_Id),
  CONSTRAINT Workers_chk_1 CHECK (Sex IN ('M', 'F'))
);

INSERT INTO General_Staff (Staff_Id, Name, Sex, Date_of_Birth, Hourly_wage, Shift, Weekly_Hours) VALUES
(1, 'Amit Kumar', 'M', '1993-05-15', 200, 1, 40),
(2, 'Sneha Sharma', 'F', '1988-08-22', 250, 2, 35),
(3, 'Rajesh Singh', 'M', '1995-11-08', 180, 1, 38),
(4, 'Pooja Gupta', 'F', '1990-02-18', 220, 2, 30),
(5, 'Arjun Patel', 'M', '1997-04-25', 240, 1, 42);


DROP TABLE IF EXISTS Inventory;

CREATE TABLE Inventory (
  Item_Name varchar(255) NOT NULL,
  Supplier_Phone_No bigint NOT NULL CHECK (LENGTH(Supplier_Phone_No) = 10),
  Available_Stock int NOT NULL,
  Min_Stock_Level int NOT NULL,
  Purchase_Date date NOT NULL,
  Expiry_Date date NOT NULL,
  Cost_Per_Unit int NOT NULL,
  PRIMARY KEY (Item_Name),
  CONSTRAINT Inventory_chk_1 CHECK (LENGTH(Supplier_Phone_No) = 10),
  CONSTRAINT Inventory_chk_2 CHECK (Available_Stock >= 0 AND Min_Stock_Level >= 0),
  CONSTRAINT Inventory_chk_3 CHECK (Expiry_Date > Purchase_Date)
);

INSERT INTO Inventory (
  Item_Name, Supplier_Phone_No, Available_Stock, 
  Min_Stock_Level, Purchase_Date, Expiry_Date, Cost_Per_Unit
)
VALUES
  ('Paracetamol Tablets', 9876543210, 500, 100, '2024-11-01', '2026-11-01', 2),
  ('Bandages', 9123456780, 300, 50, '2024-10-20', '2025-10-20', 10),
  ('Surgical Gloves', 8987654321, 1000, 200, '2024-11-05', '2025-05-05', 5),
  ('Antiseptic Solution', 8765432190, 150, 20, '2024-10-15', '2025-01-15', 20),
  ('IV Fluid', 9123487654, 200, 50, '2024-11-10', '2025-04-10', 100),
  ('Syringes', 8654321098, 1200, 300, '2024-11-12', '2025-11-12', 2),
  ('Cotton Rolls', 9876123450, 250, 50, '2024-11-15', '2025-11-15', 15),
  ('Antibiotic Capsules', 8945673210, 400, 100, '2024-11-10', '2026-11-10', 25),
  ('Thermometers', 8734567890, 80, 10, '2024-10-25', '2026-10-25', 200),
  ('Face Masks', 9012345678, 5000, 1000, '2024-11-01', '2025-11-01', 1);


DROP TABLE IF EXISTS Medication_Issuance;

CREATE TABLE Medication_Issuance (
  Doctor_Id INT NOT NULL,
  Prescription_number INT NOT NULL,
  Patient_Id INT NOT NULL,
  PRIMARY KEY (Prescription_number),
  FOREIGN KEY (Doctor_Id) REFERENCES Doctor(Doctor_Id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Prescription_number) REFERENCES Prescription(Prescription_no) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Patient_Id) REFERENCES Patient(Patient_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Medication_Issuance (Doctor_Id, Prescription_number, Patient_Id) VALUES
(1, 101, 12),  -- Dr. John Smith issues Prescription 101 to Patient 12 (Aarav Kapoor)
(3, 103, 14),  -- Dr. Rajesh Patel issues Prescription 103 to Patient 14 (Kabir Sharma)
(4, 104, 15),  -- Dr. Priya Kapoor issues Prescription 104 to Patient 15 (Aanya Singh)
(5, 105, 16),  -- Dr. Arjun Menon issues Prescription 105 to Patient 16 (Vihaan Patel)
(7, 123, 21);  -- Dr. Rahul Singh issues Prescription 123 to Patient 21 (Ria Sharma)


DROP TABLE IF EXISTS Surgery_Assignment;

CREATE TABLE Surgery_Assignment (
    Doctor_Id INT NOT NULL,
    Case_Id INT NOT NULL,
    Patient_Id INT NOT NULL,
    Nurse_Id INT NOT NULL,
    FOREIGN KEY (Doctor_Id) REFERENCES Doctor(Doctor_Id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Patient_Id) REFERENCES Patient(Patient_Id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Nurse_Id) REFERENCES Nurse(Nurse_Id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Case_Id) REFERENCES Medical_Record(Case_Id) ON DELETE CASCADE ON UPDATE CASCADE
);



INSERT INTO Surgery_Assignment (Doctor_Id, Case_Id, Patient_Id, Nurse_Id) VALUES
(1, 1, 12, 1),   -- Dr. John Smith performing surgery for Patient Aarav Kapoor with Nurse Sakshi Sharma
(2, 3, 13, 2),   -- Dr. Ananya Sharma handling surgery for Patient Diya Shah with Nurse Rahul Kumar
(3, 4, 14, 3),   -- Dr. Rajesh Patel performing for Patient Kabir Sharma with Nurse Neha Singh
(4, 5, 15, 4),   -- Dr. Priya Kapoor handling surgery for Patient Aanya Singh with Nurse Amit Patel
(5, 11, 16, 5),  -- Dr. Arjun Menon performing for Patient Vihaan Patel with Nurse Priya Gupta
(6, 12, 17, 6),  -- Dr. Sneha Joshi handling surgery for Patient Anika Joshi with Nurse Archit
(7, 13, 18, 1),  -- Dr. Rahul Singh handling Patient Advait Verma with Nurse Sakshi Sharma
(8, 14, 19, 2),  -- Dr. Nisha Reddy assisting Patient Zara Khan with Nurse Rahul Kumar
(9, 15, 20, 3),  -- Dr. Aryan Kapoor performing for Patient Arjun Khanna with Nurse Neha Singh
(10, 16, 21, 4), -- Dr. Neha Verma assisting Patient Ria Sharma with Nurse Amit Patel
(11, 17, 22, 5), -- Dr. Karthik Rajan operating on Patient Vivaan Kapoor with Nurse Priya Gupta
(12, 21, 23, 6); -- Dr. Dev handling Patient Kiara Patel with Nurse Archit



DROP TABLE IF EXISTS Specialist;

CREATE TABLE Specialist (
  Doctor_Id int NOT NULL,
  Specialization_Area varchar(255) NOT NULL,
  Is_Surgeon boolean NOT NULL,
  PRIMARY KEY (Doctor_Id),
  FOREIGN KEY (Doctor_Id) REFERENCES Doctor(Doctor_Id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Specialist (Doctor_Id, Specialization_Area, Is_Surgeon) VALUES
(1, 'Cardiology', TRUE),
(2, 'Neurology', FALSE),
(3, 'Orthopedics', TRUE),
(4, 'Pediatrics', FALSE),
(5, 'Dermatology', FALSE),
(6, 'Gastroenterology', FALSE),
(7, 'Pulmonology', TRUE),
(8, 'Oncology', TRUE),
(9, 'Nephrology', FALSE),
(10, 'Endocrinology', FALSE),
(11, 'Hematology', TRUE),
(12, 'Pathology', FALSE);