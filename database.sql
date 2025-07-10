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
  Phone_no bigint NOT NULL,
  PRIMARY KEY (Doctor_Id),
  CONSTRAINT Doctor_chk_1 CHECK (LENGTH(Phone_no) = 10),
  CONSTRAINT Doctor_chk_2 CHECK (Sex IN ('M', 'F'))
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
  Phone_no bigint NOT NULL,
  Insurance_Id varchar(255) NOT NULL,
  Age int NOT NULL,
  Diabetic boolean NOT NULL,
  Blood_pressure boolean NOT NULL,
  PRIMARY KEY (Patient_Id),
  CONSTRAINT Patient_chk_1 CHECK (LENGTH(Phone_no) = 10),
  CONSTRAINT Patient_chk_2 CHECK (Sex IN ('M', 'F'))
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

INSERT INTO Patient 
(Patient_Id, Name, Sex, Blood_group, Phone_no, Insurance_Id, Age, Diabetic, Blood_pressure) 
VALUES 
('33', 'Ariana Sharma', 'F', 'A+', 9876543220, 'INS144', 28, FALSE, FALSE),
('34', 'Rohan Gupta', 'M', 'B+', 8765432110, 'INS145', 32, TRUE, FALSE),
('35', 'Ishita Singh', 'F', 'O-', 7654321099, 'INS146', 26, FALSE, TRUE),
('36', 'Ayush Patel', 'M', 'AB+', 6543210988, 'INS147', 35, TRUE, TRUE),
('37', 'Kavya Mehta', 'F', 'A-', 5432109877, 'INS148', 30, FALSE, FALSE),
('38', 'Arjun Malhotra', 'M', 'B-', 9876543221, 'INS149', 29, TRUE, FALSE),
('39', 'Priya Verma', 'F', 'O+', 8765432111, 'INS150', 33, FALSE, TRUE),
('40', 'Karan Joshi', 'M', 'A+', 7654321100, 'INS151', 27, TRUE, FALSE),
('41', 'Sneha Kapoor', 'F', 'AB-', 6543210989, 'INS152', 31, FALSE, TRUE),
('42', 'Vikram Singh', 'M', 'B+', 5432109878, 'INS153', 34, TRUE, TRUE),
('43', 'Ananya Sharma', 'F', 'O-', 9876543222, 'INS154', 25, FALSE, FALSE),
('44', 'Rahul Patel', 'M', 'A+', 8765432112, 'INS155', 36, TRUE, FALSE),
('45', 'Pooja Gupta', 'F', 'B-', 7654321101, 'INS156', 28, FALSE, TRUE),
('46', 'Amit Kumar', 'M', 'AB+', 6543210990, 'INS157', 32, TRUE, TRUE),
('47', 'Riya Singh', 'F', 'O+', 5432109879, 'INS158', 29, FALSE, FALSE),
('48', 'Siddharth Mehta', 'M', 'A-', 9876543223, 'INS159', 35, TRUE, FALSE),
('49', 'Neha Verma', 'F', 'B+', 8765432113, 'INS160', 26, FALSE, TRUE),
('50', 'Aaditya Kapoor', 'M', 'O-', 7654321102, 'INS161', 30, TRUE, TRUE),
('51', 'Sakshi Joshi', 'F', 'AB-', 6543210991, 'INS162', 33, FALSE, FALSE),
('52', 'Varun Malhotra', 'M', 'A+', 5432109880, 'INS163', 27, TRUE, FALSE),
('53', 'Kritika Singh', 'F', 'B-', 9876543224, 'INS164', 31, FALSE, TRUE),
('54', 'Nikhil Patel', 'M', 'O+', 8765432114, 'INS165', 34, TRUE, TRUE),
('55', 'Aditi Sharma', 'F', 'A-', 7654321103, 'INS166', 28, FALSE, FALSE),
('56', 'Rohit Gupta', 'M', 'AB+', 6543210992, 'INS167', 32, TRUE, FALSE),
('57', 'Tanvi Mehta', 'F', 'B+', 5432109881, 'INS168', 29, FALSE, TRUE),
('58', 'Harsh Verma', 'M', 'O-', 9876543225, 'INS169', 35, TRUE, TRUE),
('59', 'Nisha Kapoor', 'F', 'A+', 8765432115, 'INS170', 26, FALSE, FALSE),
('60', 'Akash Joshi', 'M', 'B-', 7654321104, 'INS171', 30, TRUE, FALSE),
('61', 'Simran Singh', 'F', 'AB-', 6543210993, 'INS172', 33, FALSE, TRUE),
('62', 'Dev Malhotra', 'M', 'O+', 5432109882, 'INS173', 27, TRUE, TRUE),
('63', 'Anjali Patel', 'F', 'A-', 9876543226, 'INS174', 31, FALSE, FALSE),
('64', 'Yash Sharma', 'M', 'B+', 8765432116, 'INS175', 34, TRUE, FALSE),
('65', 'Prachi Gupta', 'F', 'O-', 7654321105, 'INS176', 28, FALSE, TRUE),
('66', 'Aryan Mehta', 'M', 'AB+', 6543210994, 'INS177', 32, TRUE, TRUE),
('67', 'Shreya Verma', 'F', 'A+', 5432109883, 'INS178', 29, FALSE, FALSE),
('68', 'Karthik Kapoor', 'M', 'B-', 9876543227, 'INS179', 35, TRUE, FALSE),
('69', 'Meera Joshi', 'F', 'O+', 8765432117, 'INS180', 26, FALSE, TRUE),
('70', 'Shubham Singh', 'M', 'A-', 7654321106, 'INS181', 30, TRUE, TRUE),
('71', 'Divya Malhotra', 'F', 'AB-', 6543210995, 'INS182', 33, FALSE, FALSE),
('72', 'Rajat Patel', 'M', 'B+', 5432109884, 'INS183', 27, TRUE, FALSE),
('73', 'Komal Sharma', 'F', 'O-', 9876543228, 'INS184', 31, FALSE, TRUE),
('74', 'Tushar Gupta', 'M', 'A+', 8765432118, 'INS185', 34, TRUE, TRUE),
('75', 'Ritu Mehta', 'F', 'B-', 7654321107, 'INS186', 28, FALSE, FALSE),
('76', 'Gaurav Verma', 'M', 'AB+', 6543210996, 'INS187', 32, TRUE, FALSE),
('77', 'Swati Kapoor', 'F', 'O+', 5432109885, 'INS188', 29, FALSE, TRUE),
('78', 'Manish Joshi', 'M', 'A-', 9876543229, 'INS189', 35, TRUE, TRUE),
('79', 'Deepika Singh', 'F', 'B+', 8765432119, 'INS190', 26, FALSE, FALSE),
('80', 'Sumit Malhotra', 'M', 'O-', 7654321108, 'INS191', 30, TRUE, FALSE),
('81', 'Richa Patel', 'F', 'AB-', 6543210997, 'INS192', 33, FALSE, TRUE),
('82', 'Vishal Sharma', 'M', 'A+', 5432109886, 'INS193', 27, TRUE, TRUE),
('83', 'Pallavi Gupta', 'F', 'B-', 9876543230, 'INS194', 31, FALSE, FALSE),
('84', 'Naman Mehta', 'M', 'O+', 8765432120, 'INS195', 34, TRUE, FALSE),
('85', 'Shruti Verma', 'F', 'A-', 7654321109, 'INS196', 28, FALSE, TRUE),
('86', 'Abhishek Kapoor', 'M', 'AB+', 6543210998, 'INS197', 32, TRUE, TRUE),
('87', 'Kavitha Joshi', 'F', 'B+', 5432109887, 'INS198', 29, FALSE, FALSE),
('88', 'Rohan Singh', 'M', 'O-', 9876543231, 'INS199', 35, TRUE, FALSE),
('89', 'Shikha Malhotra', 'F', 'A+', 8765432121, 'INS200', 26, FALSE, TRUE),
('90', 'Arun Patel', 'M', 'B-', 7654321110, 'INS201', 30, TRUE, TRUE),
('91', 'Geeta Sharma', 'F', 'AB-', 6543210999, 'INS202', 33, FALSE, FALSE),
('92', 'Sunil Gupta', 'M', 'O+', 5432109888, 'INS203', 27, TRUE, FALSE),
('93', 'Madhuri Mehta', 'F', 'A-', 9876543232, 'INS204', 31, FALSE, TRUE),
('94', 'Rakesh Verma', 'M', 'B+', 8765432122, 'INS205', 34, TRUE, TRUE),
('95', 'Sunita Kapoor', 'F', 'O-', 7654321111, 'INS206', 28, FALSE, FALSE),
('96', 'Manoj Joshi', 'M', 'AB+', 6543211000, 'INS207', 32, TRUE, FALSE),
('97', 'Nandini Singh', 'F', 'A+', 5432109889, 'INS208', 29, FALSE, TRUE),
('98', 'Sanjay Malhotra', 'M', 'B-', 9876543233, 'INS209', 35, TRUE, TRUE),
('99', 'Rekha Patel', 'F', 'O+', 8765432123, 'INS210', 26, FALSE, FALSE),
('100', 'Vinod Sharma', 'M', 'A-', 7654321112, 'INS211', 30, TRUE, FALSE),
('101', 'Test Patient A', 'M', 'A+', 1111111111, 'INS212', 25, FALSE, FALSE),
('102', 'Test Patient B', 'F', 'B+', 2222222222, 'INS213', 30, TRUE, FALSE),
('103', 'Test Patient C', 'M', 'O+', 3333333333, 'INS214', 35, FALSE, TRUE),
('104', 'Test Patient D', 'F', 'AB+', 4444444444, 'INS215', 28, TRUE, TRUE),
('105', 'Test Patient E', 'M', 'A-', 5555555555, 'INS216', 32, FALSE, FALSE),
('106', 'Test Patient F', 'F', 'B-', 6666666666, 'INS217', 27, TRUE, FALSE),
('107', 'Test Patient G', 'M', 'O-', 7777777777, 'INS218', 33, FALSE, TRUE),
('108', 'Test Patient H', 'F', 'AB-', 8888888888, 'INS219', 29, TRUE, TRUE),
('109', 'Test Patient I', 'M', 'A+', 9999999999, 'INS220', 31, FALSE, FALSE),
('110', 'Test Patient J', 'F', 'B+', 1010101010, 'INS221', 26, TRUE, FALSE),
('111', 'Test Patient K', 'M', 'O+', 1111222222, 'INS222', 34, FALSE, TRUE),
('112', 'Test Patient L', 'F', 'AB+', 2222333333, 'INS223', 30, TRUE, TRUE),
('113', 'Test Patient M', 'M', 'A-', 3333444444, 'INS224', 28, FALSE, FALSE),
('114', 'Test Patient N', 'F', 'B-', 4444555555, 'INS225', 32, TRUE, FALSE),
('115', 'Test Patient O', 'M', 'O-', 5555666666, 'INS226', 29, FALSE, TRUE),
('116', 'Test Patient P', 'F', 'AB-', 6666777777, 'INS227', 35, TRUE, True),
('117', 'Test Patient Q', 'M', 'A+', 7777888888, 'INS228', 27, FALSE, FALSE),
('118', 'Test Patient R', 'F', 'B+', 8888999999, 'INS229', 31, TRUE, FALSE),
('119', 'Test Patient S', 'M', 'O+', 9999000000, 'INS230', 33, FALSE, TRUE),
('120', 'Test Patient T', 'F', 'AB+', 1212121212, 'INS231', 26, TRUE, TRUE),
('121', 'Test Patient U', 'M', 'A-', 1313131313, 'INS232', 30, FALSE, FALSE),
('122', 'Test Patient V', 'F', 'B-', 1414141414, 'INS233', 28, TRUE, FALSE),
('123', 'Test Patient W', 'M', 'O-', 1515151515, 'INS234', 34, FALSE, TRUE),
('124', 'Test Patient X', 'F', 'AB-', 1616161616, 'INS235', 32, TRUE, TRUE),
('125', 'Test Patient Y', 'M', 'A+', 1717171717, 'INS236', 29, FALSE, FALSE),
('126', 'Test Patient Z', 'F', 'B+', 1818181818, 'INS237', 31, TRUE, FALSE),
('127', 'Sample Patient AA', 'M', 'O+', 1919191919, 'INS238', 25, FALSE, TRUE),
('128', 'Sample Patient BB', 'F', 'AB+', 2020202020, 'INS239', 33, TRUE, TRUE),
('129', 'Sample Patient CC', 'M', 'A-', 2121212121, 'INS240', 27, FALSE, FALSE),
('130', 'Sample Patient DD', 'F', 'B-', 2222232323, 'INS241', 35, TRUE, FALSE),
('131', 'Sample Patient EE', 'M', 'O-', 2323242424, 'INS242', 30, FALSE, TRUE),
('132', 'Sample Patient FF', 'F', 'AB-', 2424252525, 'INS243', 28, TRUE, TRUE),
('133', 'Sample Patient GG', 'M', 'A+', 2525262626, 'INS244', 32, FALSE, FALSE),
('134', 'Sample Patient HH', 'F', 'B+', 2626272727, 'INS245', 26, TRUE, FALSE),
('135', 'Sample Patient II', 'M', 'O+', 2727282828, 'INS246', 34, FALSE, TRUE),
('136', 'Sample Patient JJ', 'F', 'AB+', 2828292929, 'INS247', 29, TRUE, TRUE),
('137', 'Sample Patient KK', 'M', 'A-', 2929303030, 'INS248', 31, FALSE, FALSE),
('138', 'Sample Patient LL', 'F', 'B-', 3030313131, 'INS249', 33, TRUE, FALSE),
('139', 'Sample Patient MM', 'M', 'O-', 3131323232, 'INS250', 27, FALSE, TRUE),
('140', 'Sample Patient NN', 'F', 'AB-', 3232333333, 'INS251', 35, TRUE, TRUE),
('141', 'Dummy Patient A1', 'M', 'A+', 3333343434, 'INS252', 25, FALSE, FALSE),
('142', 'Dummy Patient B1', 'F', 'B+', 3434353535, 'INS253', 30, TRUE, FALSE),
('143', 'Dummy Patient C1', 'M', 'O+', 3535363636, 'INS254', 28, FALSE, TRUE),
('144', 'Dummy Patient D1', 'F', 'AB+', 3636373737, 'INS255', 32, TRUE, TRUE),
('145', 'Dummy Patient E1', 'M', 'A-', 3737383838, 'INS256', 29, FALSE, FALSE),
('146', 'Dummy Patient F1', 'F', 'B-', 3838393939, 'INS257', 31, TRUE, FALSE),
('147', 'Dummy Patient G1', 'M', 'O-', 3939404040, 'INS258', 26, FALSE, TRUE),
('148', 'Dummy Patient H1', 'F', 'AB-', 4040414141, 'INS259', 34, TRUE, TRUE),
('149', 'Dummy Patient I1', 'M', 'A+', 4141424242, 'INS260', 33, FALSE, FALSE),
('150', 'Dummy Patient J1', 'F', 'B+', 4242434343, 'INS261', 27, TRUE, FALSE),
('151', 'Dummy Patient K1', 'M', 'O+', 4343444444, 'INS262', 35, FALSE, TRUE),
('152', 'Dummy Patient L1', 'F', 'AB+', 4444454545, 'INS263', 30, TRUE, TRUE),
('153', 'Dummy Patient M1', 'M', 'A-', 4545464646, 'INS264', 28, FALSE, FALSE),
('154', 'Dummy Patient N1', 'F', 'B-', 4646474747, 'INS265', 32, TRUE, FALSE),
('155', 'Dummy Patient O1', 'M', 'O-', 4747484848, 'INS266', 29, FALSE, TRUE),
('156', 'Dummy Patient P1', 'F', 'AB-', 4848494949, 'INS267', 31, TRUE, TRUE),
('157', 'Dummy Patient Q1', 'M', 'A+', 4949505050, 'INS268', 26, FALSE, FALSE),
('158', 'Dummy Patient R1', 'F', 'B+', 5050515151, 'INS269', 34, TRUE, FALSE),
('159', 'Dummy Patient S1', 'M', 'O+', 5151525252, 'INS270', 33, FALSE, TRUE),
('160', 'Dummy Patient T1', 'F', 'AB+', 5252535353, 'INS271', 27, TRUE, TRUE),
('161', 'Mock Patient X1', 'M', 'A-', 5353545454, 'INS272', 25, FALSE, FALSE),
('162', 'Mock Patient Y1', 'F', 'B-', 5454555555, 'INS273', 30, TRUE, FALSE),
('163', 'Mock Patient Z1', 'M', 'O-', 5555565656, 'INS274', 28, FALSE, TRUE),
('164', 'Mock Patient A2', 'F', 'AB-', 5656575757, 'INS275', 32, TRUE, TRUE),
('165', 'Mock Patient B2', 'M', 'A+', 5757585858, 'INS276', 29, FALSE, FALSE),
('166', 'Mock Patient C2', 'F', 'B+', 5858595959, 'INS277', 31, TRUE, FALSE),
('167', 'Mock Patient D2', 'M', 'O+', 5959606060, 'INS278', 26, FALSE, TRUE),
('168', 'Mock Patient E2', 'F', 'AB+', 6060616161, 'INS279', 34, TRUE, TRUE),
('169', 'Mock Patient F2', 'M', 'A-', 6161626262, 'INS280', 33, FALSE, FALSE),
('170', 'Mock Patient G2', 'F', 'B-', 6262636363, 'INS281', 27, TRUE, FALSE),
('171', 'Mock Patient H2', 'M', 'O-', 6363646464, 'INS282', 35, FALSE, TRUE),
('172', 'Mock Patient I2', 'F', 'AB-', 6464656565, 'INS283', 30, TRUE, TRUE),
('173', 'Mock Patient J2', 'M', 'A+', 6565666666, 'INS284', 28, FALSE, FALSE),
('174', 'Mock Patient K2', 'F', 'B+', 6666676767, 'INS285', 32, TRUE, FALSE),
('175', 'Mock Patient L2', 'M', 'O+', 6767686868, 'INS286', 29, FALSE, TRUE),
('176', 'Mock Patient M2', 'F', 'AB+', 6868696969, 'INS287', 31, TRUE, TRUE),
('177', 'Mock Patient N2', 'M', 'A-', 6969707070, 'INS288', 26, FALSE, FALSE),
('178', 'Mock Patient O2', 'F', 'B-', 7070717171, 'INS289', 34, TRUE, FALSE),
('179', 'Mock Patient P2', 'M', 'O-', 7171727272, 'INS290', 33, FALSE, TRUE),
('180', 'Mock Patient Q2', 'F', 'AB-', 7272737373, 'INS291', 27, TRUE, TRUE),
('181', 'Demo Patient A3', 'M', 'A+', 7373747474, 'INS292', 25, FALSE, FALSE),
('182', 'Demo Patient B3', 'F', 'B+', 7474757575, 'INS293', 30, TRUE, FALSE),
('183', 'Demo Patient C3', 'M', 'O+', 7575767676, 'INS294', 28, FALSE, TRUE),
('184', 'Demo Patient D3', 'F', 'AB+', 7676777777, 'INS295', 32, TRUE, TRUE),
('185', 'Demo Patient E3', 'M', 'A-', 7777787878, 'INS296', 29, FALSE, FALSE),
('186', 'Demo Patient F3', 'F', 'B-', 7878797979, 'INS297', 31, TRUE, FALSE),
('187', 'Demo Patient G3', 'M', 'O-', 7979808080, 'INS298', 26, FALSE, TRUE),
('188', 'Demo Patient H3', 'F', 'AB-', 8080818181, 'INS299', 34, TRUE, TRUE),
('189', 'Demo Patient I3', 'M', 'A+', 8181828282, 'INS300', 33, FALSE, FALSE),
('190', 'Demo Patient J3', 'F', 'B+', 8282838383, 'INS301', 27, TRUE, FALSE),
('191', 'Demo Patient K3', 'M', 'O+', 8383848484, 'INS302', 35, FALSE, TRUE),
('192', 'Demo Patient L3', 'F', 'AB+', 8484858585, 'INS303', 30, TRUE, TRUE),
('193', 'Demo Patient M3', 'M', 'A-', 8585868686, 'INS304', 28, FALSE, FALSE),
('194', 'Demo Patient N3', 'F', 'B-', 8686878787, 'INS305', 32, TRUE, FALSE),
('195', 'Demo Patient O3', 'M', 'O-', 8787888888, 'INS306', 29, FALSE, TRUE),
('196', 'Demo Patient P3', 'F', 'AB-', 8888898989, 'INS307', 31, TRUE, TRUE),
('197', 'Demo Patient Q3', 'M', 'A+', 8989909090, 'INS308', 26, FALSE, FALSE),
('198', 'Demo Patient R3', 'F', 'B+', 9090919191, 'INS309', 34, TRUE, FALSE),
('199', 'Demo Patient S3', 'M', 'O+', 9191929292, 'INS310', 33, FALSE, TRUE),
('200', 'Demo Patient T3', 'F', 'AB+', 9292939393, 'INS311', 27, TRUE, TRUE),
('201', 'Extra Patient A', 'M', 'A+', 1111111100, 'INS312', 25, FALSE, FALSE),
('202', 'Extra Patient B', 'F', 'B+', 2222222200, 'INS313', 30, TRUE, FALSE),
('203', 'Extra Patient C', 'M', 'O+', 3333333300, 'INS314', 35, FALSE, TRUE),
('204', 'Extra Patient D', 'F', 'AB+', 4444444400, 'INS315', 28, TRUE, TRUE),
('205', 'Extra Patient E', 'M', 'A-', 5555555500, 'INS316', 32, FALSE, FALSE),
('206', 'Extra Patient F', 'F', 'B-', 6666666600, 'INS317', 29, TRUE, FALSE),
('207', 'Extra Patient G', 'M', 'O-', 7777777700, 'INS318', 31, FALSE, TRUE),
('208', 'Extra Patient H', 'F', 'AB-', 8888888800, 'INS319', 27, TRUE, TRUE),
('209', 'Extra Patient I', 'M', 'A+', 9999999900, 'INS320', 33, FALSE, FALSE),
('210', 'Extra Patient J', 'F', 'B+', 1000000000, 'INS321', 26, TRUE, FALSE),
('211', 'Additional A', 'M', 'O+', 1100000000, 'INS322', 34, FALSE, TRUE),
('212', 'Additional B', 'F', 'AB+', 1200000000, 'INS323', 30, TRUE, TRUE),
('213', 'Additional C', 'M', 'A-', 1300000000, 'INS324', 28, FALSE, FALSE),
('214', 'Additional D', 'F', 'B-', 1400000000, 'INS325', 32, TRUE, FALSE),
('215', 'Additional E', 'M', 'O-', 1500000000, 'INS326', 29, FALSE, TRUE),
('216', 'Additional F', 'F', 'AB-', 1600000000, 'INS327', 35, TRUE, TRUE),
('217', 'Additional G', 'M', 'A+', 1700000000, 'INS328', 27, FALSE, FALSE),
('218', 'Additional H', 'F', 'B+', 1800000000, 'INS329', 31, TRUE, FALSE),
('219', 'Additional I', 'M', 'O+', 1900000000, 'INS330', 33, FALSE, TRUE),
('220', 'Additional J', 'F', 'AB+', 2000000000, 'INS331', 26, TRUE, TRUE),
('221', 'Final Patient A', 'M', 'A-', 1010000000, 'INS332', 30, FALSE, FALSE),
('222', 'Final Patient B', 'F', 'B-', 2020000000, 'INS333', 28, TRUE, FALSE),
('223', 'Final Patient C', 'M', 'O-', 3030000000, 'INS334', 32, FALSE, TRUE),
('224', 'Final Patient D', 'F', 'AB-', 4040000000, 'INS335', 29, TRUE, TRUE),
('225', 'Final Patient E', 'M', 'A+', 5050000000, 'INS336', 31, FALSE, FALSE),
('226', 'Final Patient F', 'F', 'B+', 6060000000, 'INS337', 27, TRUE, FALSE),
('227', 'Bulk Patient 001', 'M', 'A+', 1111111001, 'INS338', 25, FALSE, FALSE),
('228', 'Bulk Patient 002', 'F', 'B+', 1111111002, 'INS339', 30, TRUE, FALSE),
('229', 'Bulk Patient 003', 'M', 'O+', 1111111003, 'INS340', 35, FALSE, TRUE),
('230', 'Bulk Patient 004', 'F', 'AB+', 1111111004, 'INS341', 28, TRUE, TRUE),
('231', 'Bulk Patient 005', 'M', 'A-', 1111111005, 'INS342', 32, FALSE, FALSE),
('232', 'Bulk Patient 006', 'F', 'B-', 1111111006, 'INS343', 29, TRUE, FALSE),
('233', 'Bulk Patient 007', 'M', 'O-', 1111111007, 'INS344', 31, FALSE, TRUE),
('234', 'Bulk Patient 008', 'F', 'AB-', 1111111008, 'INS345', 27, TRUE, TRUE),
('235', 'Bulk Patient 009', 'M', 'A+', 1111111009, 'INS346', 33, FALSE, FALSE),
('236', 'Bulk Patient 010', 'F', 'B+', 1111111010, 'INS347', 26, TRUE, FALSE),
('237', 'Bulk Patient 011', 'M', 'O+', 1111111011, 'INS348', 34, FALSE, TRUE),
('238', 'Bulk Patient 012', 'F', 'AB+', 1111111012, 'INS349', 30, TRUE, TRUE),
('239', 'Bulk Patient 013', 'M', 'A-', 1111111013, 'INS350', 28, FALSE, FALSE),
('240', 'Bulk Patient 014', 'F', 'B-', 1111111014, 'INS351', 32, TRUE, FALSE),
('241', 'Bulk Patient 015', 'M', 'O-', 1111111015, 'INS352', 29, FALSE, TRUE),
('242', 'Bulk Patient 016', 'F', 'AB-', 1111111016, 'INS353', 35, TRUE, TRUE),
('243', 'Bulk Patient 017', 'M', 'A+', 1111111017, 'INS354', 27, FALSE, FALSE),
('244', 'Bulk Patient 018', 'F', 'B+', 1111111018, 'INS355', 31, TRUE, FALSE),
('245', 'Bulk Patient 019', 'M', 'O+', 1111111019, 'INS356', 33, FALSE, TRUE),
('246', 'Bulk Patient 020', 'F', 'AB+', 1111111020, 'INS357', 26, TRUE, TRUE),
('247', 'Bulk Patient 021', 'M', 'A-', 1111111021, 'INS358', 30, FALSE, FALSE),
('248', 'Bulk Patient 022', 'F', 'B-', 1111111022, 'INS359', 28, TRUE, FALSE),
('249', 'Bulk Patient 023', 'M', 'O-', 1111111023, 'INS360', 32, FALSE, TRUE),
('250', 'Bulk Patient 024', 'F', 'AB-', 1111111024, 'INS361', 29, TRUE, TRUE),
('251', 'Mass Patient A01', 'M', 'A+', 2222222001, 'INS362', 31, FALSE, FALSE),
('252', 'Mass Patient A02', 'F', 'B+', 2222222002, 'INS363', 27, TRUE, FALSE),
('253', 'Mass Patient A03', 'M', 'O+', 2222222003, 'INS364', 35, FALSE, TRUE),
('254', 'Mass Patient A04', 'F', 'AB+', 2222222004, 'INS365', 33, TRUE, TRUE),
('255', 'Mass Patient A05', 'M', 'A-', 2222222005, 'INS366', 26, FALSE, FALSE),
('256', 'Mass Patient A06', 'F', 'B-', 2222222006, 'INS367', 34, TRUE, FALSE),
('257', 'Mass Patient A07', 'M', 'O-', 2222222007, 'INS368', 30, FALSE, TRUE),
('258', 'Mass Patient A08', 'F', 'AB-', 2222222008, 'INS369', 28, TRUE, TRUE),
('259', 'Mass Patient A09', 'M', 'A+', 2222222009, 'INS370', 32, FALSE, FALSE),
('260', 'Mass Patient A10', 'F', 'B+', 2222222010, 'INS371', 29, TRUE, FALSE),
('261', 'Mass Patient A11', 'M', 'O+', 2222222011, 'INS372', 35, FALSE, TRUE),
('262', 'Mass Patient A12', 'F', 'AB+', 2222222012, 'INS373', 31, TRUE, TRUE),
('263', 'Mass Patient A13', 'M', 'A-', 2222222013, 'INS374', 27, FALSE, FALSE),
('264', 'Mass Patient A14', 'F', 'B-', 2222222014, 'INS375', 33, True, FALSE),
('265', 'Mass Patient A15', 'M', 'O-', 2222222015, 'INS376', 26, FALSE, TRUE),
('266', 'Mass Patient A16', 'F', 'AB-', 2222222016, 'INS377', 34, TRUE, TRUE),
('267', 'Mass Patient A17', 'M', 'A+', 2222222017, 'INS378', 30, FALSE, FALSE),
('268', 'Mass Patient A18', 'F', 'B+', 2222222018, 'INS379', 28, TRUE, FALSE),
('269', 'Mass Patient A19', 'M', 'O+', 2222222019, 'INS380', 32, FALSE, TRUE),
('270', 'Mass Patient A20', 'F', 'AB+', 2222222020, 'INS381', 29, TRUE, TRUE),
('271', 'Large Patient 01', 'M', 'A-', 3333333001, 'INS382', 35, FALSE, FALSE),
('272', 'Large Patient 02', 'F', 'B-', 3333333002, 'INS383', 31, TRUE, FALSE),
('273', 'Large Patient 03', 'M', 'O-', 3333333003, 'INS384', 27, FALSE, TRUE),
('274', 'Large Patient 04', 'F', 'AB-', 3333333004, 'INS385', 33, TRUE, TRUE),
('275', 'Large Patient 05', 'M', 'A+', 3333333005, 'INS386', 26, FALSE, FALSE),
('276', 'Large Patient 06', 'F', 'B+', 3333333006, 'INS387', 34, TRUE, FALSE),
('277', 'Large Patient 07', 'M', 'O+', 3333333007, 'INS388', 30, FALSE, TRUE),
('278', 'Large Patient 08', 'F', 'AB+', 3333333008, 'INS389', 28, TRUE, TRUE),
('279', 'Large Patient 09', 'M', 'A-', 3333333009, 'INS390', 32, FALSE, FALSE),
('280', 'Large Patient 10', 'F', 'B-', 3333333010, 'INS391', 29, TRUE, FALSE),
('281', 'Large Patient 11', 'M', 'O-', 3333333011, 'INS392', 35, FALSE, TRUE),
('282', 'Large Patient 12', 'F', 'AB-', 3333333012, 'INS393', 31, TRUE, TRUE),
('283', 'Large Patient 13', 'M', 'A+', 3333333013, 'INS394', 27, FALSE, FALSE),
('284', 'Large Patient 14', 'F', 'B+', 3333333014, 'INS395', 33, TRUE, FALSE),
('285', 'Large Patient 15', 'M', 'O+', 3333333015, 'INS396', 26, FALSE, TRUE),
('286', 'Large Patient 16', 'F', 'AB+', 3333333016, 'INS397', 34, TRUE, TRUE),
('287', 'Large Patient 17', 'M', 'A-', 3333333017, 'INS398', 30, FALSE, FALSE),
('288', 'Large Patient 18', 'F', 'B-', 3333333018, 'INS399', 28, TRUE, FALSE),
('289', 'Large Patient 19', 'M', 'O-', 3333333019, 'INS400', 32, FALSE, TRUE),
('290', 'Large Patient 20', 'F', 'AB-', 3333333020, 'INS401', 29, TRUE, TRUE),
('291', 'Volume Patient X1', 'M', 'A+', 4444444001, 'INS402', 35, FALSE, FALSE),
('292', 'Volume Patient X2', 'F', 'B+', 4444444002, 'INS403', 31, TRUE, FALSE),
('293', 'Volume Patient X3', 'M', 'O+', 4444444003, 'INS404', 27, FALSE, TRUE),
('294', 'Volume Patient X4', 'F', 'AB+', 4444444004, 'INS405', 33, TRUE, TRUE),
('295', 'Volume Patient X5', 'M', 'A-', 4444444005, 'INS406', 26, FALSE, FALSE),
('296', 'Volume Patient X6', 'F', 'B-', 4444444006, 'INS407', 34, TRUE, FALSE),
('297', 'Volume Patient X7', 'M', 'O-', 4444444007, 'INS408', 30, FALSE, TRUE),
('298', 'Volume Patient X8', 'F', 'AB-', 4444444008, 'INS409', 28, TRUE, TRUE),
('299', 'Volume Patient X9', 'M', 'A+', 4444444009, 'INS410', 32, FALSE, FALSE),
('300', 'Volume Patient Y1', 'F', 'B+', 4444444010, 'INS411', 29, TRUE, FALSE),
('301', 'Volume Patient Y2', 'M', 'O+', 4444444011, 'INS412', 35, FALSE, TRUE),
('302', 'Volume Patient Y3', 'F', 'AB+', 4444444012, 'INS413', 31, TRUE, TRUE),
('303', 'Volume Patient Y4', 'M', 'A-', 4444444013, 'INS414', 27, FALSE, FALSE),
('304', 'Volume Patient Y5', 'F', 'B-', 4444444014, 'INS415', 33, TRUE, FALSE),
('305', 'Volume Patient Y6', 'M', 'O-', 4444444015, 'INS416', 26, FALSE, TRUE),
('306', 'Volume Patient Y7', 'F', 'AB-', 4444444016, 'INS417', 34, TRUE, TRUE),
('307', 'Volume Patient Y8', 'M', 'A+', 4444444017, 'INS418', 30, FALSE, FALSE),
('308', 'Volume Patient Y9', 'F', 'B+', 4444444018, 'INS419', 28, TRUE, FALSE),
('309', 'Volume Patient Z1', 'M', 'O+', 4444444019, 'INS420', 32, FALSE, TRUE),
('310', 'Volume Patient Z2', 'F', 'AB+', 4444444020, 'INS421', 29, TRUE, TRUE),
('311', 'Scale Patient 1A', 'M', 'A-', 5555555001, 'INS422', 35, FALSE, FALSE),
('312', 'Scale Patient 1B', 'F', 'B-', 5555555002, 'INS423', 31, TRUE, FALSE),
('313', 'Scale Patient 1C', 'M', 'O-', 5555555003, 'INS424', 27, FALSE, TRUE),
('314', 'Scale Patient 1D', 'F', 'AB-', 5555555004, 'INS425', 33, TRUE, TRUE),
('315', 'Scale Patient 1E', 'M', 'A+', 5555555005, 'INS426', 26, FALSE, FALSE),
('316', 'Scale Patient 1F', 'F', 'B+', 5555555006, 'INS427', 34, TRUE, FALSE),
('317', 'Scale Patient 1G', 'M', 'O+', 5555555007, 'INS428', 30, FALSE, TRUE),
('318', 'Scale Patient 1H', 'F', 'AB+', 5555555008, 'INS429', 28, TRUE, TRUE),
('319', 'Scale Patient 1I', 'M', 'A-', 5555555009, 'INS430', 32, FALSE, FALSE),
('320', 'Scale Patient 1J', 'F', 'B-', 5555555010, 'INS431', 29, TRUE, FALSE),
('321', 'Scale Patient 2A', 'M', 'O-', 5555555011, 'INS432', 35, FALSE, TRUE),
('322', 'Scale Patient 2B', 'F', 'AB-', 5555555012, 'INS433', 31, TRUE, TRUE),
('323', 'Scale Patient 2C', 'M', 'A+', 5555555013, 'INS434', 27, FALSE, FALSE),
('324', 'Scale Patient 2D', 'F', 'B+', 5555555014, 'INS435', 33, TRUE, FALSE),
('325', 'Scale Patient 2E', 'M', 'O+', 5555555015, 'INS436', 26, FALSE, TRUE),
('326', 'Scale Patient 2F', 'F', 'AB+', 5555555016, 'INS437', 34, TRUE, TRUE),
('327', 'Scale Patient 2G', 'M', 'A-', 5555555017, 'INS438', 30, FALSE, FALSE),
('328', 'Scale Patient 2H', 'F', 'B-', 5555555018, 'INS439', 28, TRUE, FALSE),
('329', 'Scale Patient 2I', 'M', 'O-', 5555555019, 'INS440', 32, FALSE, TRUE),
('330', 'Scale Patient 2J', 'F', 'AB-', 5555555020, 'INS441', 29, TRUE, TRUE),
('331', 'Batch Patient AA1', 'M', 'A+', 6666666001, 'INS442', 35, FALSE, FALSE),
('332', 'Batch Patient AA2', 'F', 'B+', 6666666002, 'INS443', 31, TRUE, FALSE),
('333', 'Batch Patient AA3', 'M', 'O+', 6666666003, 'INS444', 27, FALSE, TRUE),
('334', 'Batch Patient AA4', 'F', 'AB+', 6666666004, 'INS445', 33, TRUE, TRUE),
('335', 'Batch Patient AA5', 'M', 'A-', 6666666005, 'INS446', 26, FALSE, FALSE),
('336', 'Batch Patient BB1', 'F', 'B-', 6666666006, 'INS447', 34, TRUE, FALSE),
('337', 'Batch Patient BB2', 'M', 'O-', 6666666007, 'INS448', 30, FALSE, TRUE),
('338', 'Batch Patient BB3', 'F', 'AB-', 6666666008, 'INS449', 28, TRUE, TRUE),
('339', 'Batch Patient BB4', 'M', 'A+', 6666666009, 'INS450', 32, FALSE, FALSE),
('340', 'Batch Patient BB5', 'F', 'B+', 6666666010, 'INS451', 29, TRUE, FALSE),
('341', 'Batch Patient CC1', 'M', 'O+', 6666666011, 'INS452', 35, FALSE, TRUE),
('342', 'Batch Patient CC2', 'F', 'AB+', 6666666012, 'INS453', 31, TRUE, TRUE),
('343', 'Batch Patient CC3', 'M', 'A-', 6666666013, 'INS454', 27, FALSE, FALSE),
('344', 'Batch Patient CC4', 'F', 'B-', 6666666014, 'INS455', 33, TRUE, FALSE),
('345', 'Batch Patient CC5', 'M', 'O-', 6666666015, 'INS456', 26, FALSE, TRUE),
('346', 'Batch Patient DD1', 'F', 'AB-', 6666666016, 'INS457', 34, TRUE, TRUE),
('347', 'Batch Patient DD2', 'M', 'A+', 6666666017, 'INS458', 30, FALSE, FALSE),
('348', 'Batch Patient DD3', 'F', 'B+', 6666666018, 'INS459', 28, TRUE, FALSE),
('349', 'Batch Patient DD4', 'M', 'O+', 6666666019, 'INS460', 32, FALSE, TRUE),
('350', 'Batch Patient DD5', 'F', 'AB+', 6666666020, 'INS461', 29, TRUE, TRUE),
('351', 'System Patient 001', 'M', 'A-', 7777777001, 'INS462', 35, FALSE, FALSE),
('352', 'System Patient 002', 'F', 'B-', 7777777002, 'INS463', 31, TRUE, FALSE),
('353', 'System Patient 003', 'M', 'O-', 7777777003, 'INS464', 27, FALSE, TRUE),
('354', 'System Patient 004', 'F', 'AB-', 7777777004, 'INS465', 33, TRUE, TRUE),
('355', 'System Patient 005', 'M', 'A+', 7777777005, 'INS466', 26, FALSE, FALSE),
('356', 'System Patient 006', 'F', 'B+', 7777777006, 'INS467', 34, TRUE, FALSE),
('357', 'System Patient 007', 'M', 'O+', 7777777007, 'INS468', 30, FALSE, TRUE),
('358', 'System Patient 008', 'F', 'AB+', 7777777008, 'INS469', 28, TRUE, TRUE),
('359', 'System Patient 009', 'M', 'A-', 7777777009, 'INS470', 32, FALSE, FALSE),
('360', 'System Patient 010', 'F', 'B-', 7777777010, 'INS471', 29, TRUE, FALSE),
('361', 'System Patient 011', 'M', 'O-', 7777777011, 'INS472', 35, FALSE, TRUE),
('362', 'System Patient 012', 'F', 'AB-', 7777777012, 'INS473', 31, TRUE, TRUE),
('363', 'System Patient 013', 'M', 'A+', 7777777013, 'INS474', 27, FALSE, FALSE),
('364', 'System Patient 014', 'F', 'B+', 7777777014, 'INS475', 33, TRUE, FALSE),
('365', 'System Patient 015', 'M', 'O+', 7777777015, 'INS476', 26, FALSE, TRUE),
('366', 'System Patient 016', 'F', 'AB+', 7777777016, 'INS477', 34, TRUE, TRUE),
('367', 'System Patient 017', 'M', 'A-', 7777777017, 'INS478', 30, FALSE, FALSE),
('368', 'System Patient 018', 'F', 'B-', 7777777018, 'INS479', 28, TRUE, FALSE),
('369', 'System Patient 019', 'M', 'O-', 7777777019, 'INS480', 32, FALSE, TRUE),
('370', 'System Patient 020', 'F', 'AB-', 7777777020, 'INS481', 29, TRUE, TRUE),
('371', 'Database User 01', 'M', 'A+', 8888888001, 'INS482', 35, FALSE, FALSE),
('372', 'Database User 02', 'F', 'B+', 8888888002, 'INS483', 31, TRUE, FALSE),
('373', 'Database User 03', 'M', 'O+', 8888888003, 'INS484', 27, FALSE, TRUE),
('374', 'Database User 04', 'F', 'AB+', 8888888004, 'INS485', 33, TRUE, TRUE),
('375', 'Database User 05', 'M', 'A-', 8888888005, 'INS486', 26, FALSE, FALSE),
('376', 'Database User 06', 'F', 'B-', 8888888006, 'INS487', 34, TRUE, FALSE),
('377', 'Database User 07', 'M', 'O-', 8888888007, 'INS488', 30, FALSE, TRUE),
('378', 'Database User 08', 'F', 'AB-', 8888888008, 'INS489', 28, TRUE, TRUE),
('379', 'Database User 09', 'M', 'A+', 8888888009, 'INS490', 32, FALSE, FALSE),
('380', 'Database User 10', 'F', 'B+', 8888888010, 'INS491', 29, TRUE, FALSE),
('381', 'Database User 11', 'M', 'O+', 8888888011, 'INS492', 35, FALSE, TRUE),
('382', 'Database User 12', 'F', 'AB+', 8888888012, 'INS493', 31, TRUE, TRUE),
('383', 'Database User 13', 'M', 'A-', 8888888013, 'INS494', 27, FALSE, FALSE),
('384', 'Database User 14', 'F', 'B-', 8888888014, 'INS495', 33, TRUE, FALSE),
('385', 'Database User 15', 'M', 'O-', 8888888015, 'INS496', 26, FALSE, TRUE),
('386', 'Database User 16', 'F', 'AB-', 8888888016, 'INS497', 34, TRUE, TRUE),
('387', 'Database User 17', 'M', 'A+', 8888888017, 'INS498', 30, FALSE, FALSE),
('388', 'Database User 18', 'F', 'B+', 8888888018, 'INS499', 28, TRUE, FALSE),
('389', 'Database User 19', 'M', 'O+', 8888888019, 'INS500', 32, FALSE, TRUE),
('390', 'Database User 20', 'F', 'AB+', 8888888020, 'INS501', 29, TRUE, TRUE),
('391', 'Record Entry 01', 'M', 'A-', 9999999001, 'INS502', 35, FALSE, FALSE),
('392', 'Record Entry 02', 'F', 'B-', 9999999002, 'INS503', 31, TRUE, FALSE),
('393', 'Record Entry 03', 'M', 'O-', 9999999003, 'INS504', 27, FALSE, TRUE),
('394', 'Record Entry 04', 'F', 'AB-', 9999999004, 'INS505', 33, TRUE, TRUE),
('395', 'Record Entry 05', 'M', 'A+', 9999999005, 'INS506', 26, FALSE, FALSE),
('396', 'Record Entry 06', 'F', 'B+', 9999999006, 'INS507', 34, TRUE, FALSE),
('397', 'Record Entry 07', 'M', 'O+', 9999999007, 'INS508', 30, FALSE, TRUE),
('398', 'Record Entry 08', 'F', 'AB+', 9999999008, 'INS509', 28, TRUE, TRUE),
('399', 'Record Entry 09', 'M', 'A-', 9999999009, 'INS510', 32, FALSE, FALSE),
('400', 'Record Entry 10', 'F', 'B-', 9999999010, 'INS511', 29, TRUE, FALSE),
('401', 'Record Entry 11', 'M', 'O-', 9999999011, 'INS512', 35, FALSE, TRUE),
('402', 'Record Entry 12', 'F', 'AB-', 9999999012, 'INS513', 31, TRUE, TRUE),
('403', 'Record Entry 13', 'M', 'A+', 9999999013, 'INS514', 27, FALSE, FALSE),
('404', 'Record Entry 14', 'F', 'B+', 9999999014, 'INS515', 33, TRUE, FALSE),
('405', 'Record Entry 15', 'M', 'O+', 9999999015, 'INS516', 26, FALSE, TRUE),
('406', 'Record Entry 16', 'F', 'AB+', 9999999016, 'INS517', 34, TRUE, TRUE),
('407', 'Record Entry 17', 'M', 'A-', 9999999017, 'INS518', 30, FALSE, FALSE),
('408', 'Record Entry 18', 'F', 'B-', 9999999018, 'INS519', 28, TRUE, FALSE),
('409', 'Record Entry 19', 'M', 'O-', 9999999019, 'INS520', 32, FALSE, TRUE),
('410', 'Record Entry 20', 'F', 'AB-', 9999999020, 'INS521', 29, TRUE, TRUE),
('411', 'Final Batch A01', 'M', 'A+', 1000000001, 'INS522', 35, FALSE, FALSE),
('412', 'Final Batch A02', 'F', 'B+', 1000000002, 'INS523', 31, TRUE, FALSE),
('413', 'Final Batch A03', 'M', 'O+', 1000000003, 'INS524', 27, FALSE, TRUE),
('414', 'Final Batch A04', 'F', 'AB+', 1000000004, 'INS525', 33, TRUE, TRUE),
('415', 'Final Batch A05', 'M', 'A-', 1000000005, 'INS526', 26, FALSE, FALSE),
('416', 'Final Batch A06', 'F', 'B-', 1000000006, 'INS527', 34, TRUE, FALSE),
('417', 'Final Batch A07', 'M', 'O-', 1000000007, 'INS528', 30, FALSE, TRUE),
('418', 'Final Batch A08', 'F', 'AB-', 1000000008, 'INS529', 28, TRUE, TRUE),
('419', 'Final Batch A09', 'M', 'A+', 1000000009, 'INS530', 32, FALSE, FALSE),
('420', 'Final Batch A10', 'F', 'B+', 1000000010, 'INS531', 29, TRUE, FALSE),
('421', 'Final Batch B01', 'M', 'O+', 1000000011, 'INS532', 35, FALSE, TRUE),
('422', 'Final Batch B02', 'F', 'AB+', 1000000012, 'INS533', 31, TRUE, TRUE),
('423', 'Final Batch B03', 'M', 'A-', 1000000013, 'INS534', 27, FALSE, FALSE),
('424', 'Final Batch B04', 'F', 'B-', 1000000014, 'INS535', 33, TRUE, FALSE),
('425', 'Final Batch B05', 'M', 'O-', 1000000015, 'INS536', 26, FALSE, TRUE),
('426', 'Final Batch B06', 'F', 'AB-', 1000000016, 'INS537', 34, TRUE, TRUE),
('427', 'Final Batch B07', 'M', 'A+', 1000000017, 'INS538', 30, FALSE, FALSE),
('428', 'Final Batch B08', 'F', 'B+', 1000000018, 'INS539', 28, TRUE, FALSE),
('429', 'Final Batch B09', 'M', 'O+', 1000000019, 'INS540', 32, FALSE, TRUE),
('430', 'Final Batch B10', 'F', 'AB+', 1000000020, 'INS541', 29, TRUE, TRUE),
('431', 'Final Batch C01', 'M', 'A-', 1000000021, 'INS542', 35, FALSE, FALSE),
('432', 'Final Batch C02', 'F', 'B-', 1000000022, 'INS543', 31, TRUE, FALSE),
('433', 'Final Batch C03', 'M', 'O-', 1000000023, 'INS544', 27, FALSE, TRUE),
('434', 'Final Batch C04', 'F', 'AB-', 1000000024, 'INS545', 33, TRUE, TRUE),
('435', 'Final Batch C05', 'M', 'A+', 1000000025, 'INS546', 26, FALSE, FALSE),
('436', 'Final Batch C06', 'F', 'B+', 1000000026, 'INS547', 34, TRUE, FALSE),
('437', 'Final Batch C07', 'M', 'O+', 1000000027, 'INS548', 30, FALSE, TRUE),
('438', 'Final Batch C08', 'F', 'AB+', 1000000028, 'INS549', 28, TRUE, TRUE),
('439', 'Final Batch C09', 'M', 'A-', 1000000029, 'INS550', 32, FALSE, FALSE),
('440', 'Final Batch C10', 'F', 'B-', 1000000030, 'INS551', 29, TRUE, FALSE),
('441', 'End User 001', 'M', 'O-', 1000000031, 'INS552', 35, FALSE, TRUE),
('442', 'End User 002', 'F', 'AB-', 1000000032, 'INS553', 31, TRUE, TRUE),
('443', 'End User 003', 'M', 'A+', 1000000033, 'INS554', 27, FALSE, FALSE),
('444', 'End User 004', 'F', 'B+', 1000000034, 'INS555', 33, TRUE, FALSE),
('445', 'End User 005', 'M', 'O+', 1000000035, 'INS556', 26, FALSE, TRUE),
('446', 'End User 006', 'F', 'AB+', 1000000036, 'INS557', 34, TRUE, TRUE),
('447', 'End User 007', 'M', 'A-', 1000000037, 'INS558', 30, FALSE, FALSE),
('448', 'End User 008', 'F', 'B-', 1000000038, 'INS559', 28, TRUE, FALSE),
('449', 'End User 009', 'M', 'O-', 1000000039, 'INS560', 32, FALSE, TRUE),
('450', 'End User 010', 'F', 'AB-', 1000000040, 'INS561', 29, TRUE, TRUE),
('451', 'End User 011', 'M', 'A+', 1000000041, 'INS562', 35, FALSE, FALSE),
('452', 'End User 012', 'F', 'B+', 1000000042, 'INS563', 31, TRUE, FALSE),
('453', 'End User 013', 'M', 'O+', 1000000043, 'INS564', 27, FALSE, TRUE),
('454', 'End User 014', 'F', 'AB+', 1000000044, 'INS565', 33, TRUE, TRUE),
('455', 'End User 015', 'M', 'A-', 1000000045, 'INS566', 26, FALSE, FALSE),
('456', 'End User 016', 'F', 'B-', 1000000046, 'INS567', 34, TRUE, FALSE),
('457', 'End User 017', 'M', 'O-', 1000000047, 'INS568', 30, FALSE, TRUE),
('458', 'End User 018', 'F', 'AB-', 1000000048, 'INS569', 28, TRUE, TRUE),
('459', 'End User 019', 'M', 'A+', 1000000049, 'INS570', 32, FALSE, FALSE),
('460', 'End User 020', 'F', 'B+', 1000000050, 'INS571', 29, TRUE, FALSE),
('461', 'Last Set 01', 'M', 'O+', 1000000051, 'INS572', 35, FALSE, TRUE),
('462', 'Last Set 02', 'F', 'AB+', 1000000052, 'INS573', 31, TRUE, TRUE),
('463', 'Last Set 03', 'M', 'A-', 1000000053, 'INS574', 27, FALSE, FALSE),
('464', 'Last Set 04', 'F', 'B-', 1000000054, 'INS575', 33, TRUE, FALSE),
('465', 'Last Set 05', 'M', 'O-', 1000000055, 'INS576', 26, FALSE, TRUE),
('466', 'Last Set 06', 'F', 'AB-', 1000000056, 'INS577', 34, TRUE, TRUE),
('467', 'Last Set 07', 'M', 'A+', 1000000057, 'INS578', 30, FALSE, FALSE),
('468', 'Last Set 08', 'F', 'B+', 1000000058, 'INS579', 28, TRUE, FALSE),
('469', 'Last Set 09', 'M', 'O+', 1000000059, 'INS580', 32, FALSE, TRUE),
('470', 'Last Set 10', 'F', 'AB+', 1000000060, 'INS581', 29, TRUE, TRUE),
('471', 'Last Set 11', 'M', 'A-', 1000000061, 'INS582', 35, FALSE, FALSE),
('472', 'Last Set 12', 'F', 'B-', 1000000062, 'INS583', 31, TRUE, FALSE),
('473', 'Last Set 13', 'M', 'O-', 1000000063, 'INS584', 27, FALSE, TRUE),
('474', 'Last Set 14', 'F', 'AB-', 1000000064, 'INS585', 33, TRUE, TRUE),
('475', 'Last Set 15', 'M', 'A+', 1000000065, 'INS586', 26, FALSE, FALSE),
('476', 'Last Set 16', 'F', 'B+', 1000000066, 'INS587', 34, TRUE, FALSE),
('477', 'Ultimate User 01', 'M', 'O+', 1000000067, 'INS588', 35, FALSE, TRUE),
('478', 'Ultimate User 02', 'F', 'AB+', 1000000068, 'INS589', 31, TRUE, TRUE),
('479', 'Ultimate User 03', 'M', 'A-', 1000000069, 'INS590', 27, FALSE, FALSE),
('480', 'Ultimate User 04', 'F', 'B-', 1000000070, 'INS591', 33, TRUE, FALSE),
('481', 'Ultimate User 05', 'M', 'O-', 1000000071, 'INS592', 26, FALSE, TRUE),
('482', 'Ultimate User 06', 'F', 'AB-', 1000000072, 'INS593', 34, TRUE, TRUE),
('483', 'Ultimate User 07', 'M', 'A+', 1000000073, 'INS594', 30, FALSE, FALSE),
('484', 'Ultimate User 08', 'F', 'B+', 1000000074, 'INS595', 28, TRUE, FALSE),
('485', 'Ultimate User 09', 'M', 'O+', 1000000075, 'INS596', 32, FALSE, TRUE),
('486', 'Ultimate User 10', 'F', 'AB+', 1000000076, 'INS597', 29, TRUE, TRUE),
('487', 'Final Entry 01', 'M', 'A-', 1000000077, 'INS598', 35, FALSE, FALSE),
('488', 'Final Entry 02', 'F', 'B-', 1000000078, 'INS599', 31, TRUE, FALSE),
('489', 'Final Entry 03', 'M', 'O-', 1000000079, 'INS600', 27, FALSE, TRUE),
('490', 'Final Entry 04', 'F', 'AB-', 1000000080, 'INS601', 33, TRUE, TRUE),
('491', 'Final Entry 05', 'M', 'A+', 1000000081, 'INS602', 26, FALSE, FALSE),
('492', 'Final Entry 06', 'F', 'B+', 1000000082, 'INS603', 34, TRUE, FALSE),
('493', 'Final Entry 07', 'M', 'O+', 1000000083, 'INS604', 30, FALSE, TRUE),
('494', 'Final Entry 08', 'F', 'AB+', 1000000084, 'INS605', 28, TRUE, TRUE),
('495', 'Final Entry 09', 'M', 'A-', 1000000085, 'INS606', 32, FALSE, FALSE),
('496', 'Final Entry 10', 'F', 'B-', 1000000086, 'INS607', 29, TRUE, FALSE),
('497', 'Conclusion 1', 'M', 'O-', 1000000087, 'INS608', 35, FALSE, TRUE),
('498', 'Conclusion 2', 'F', 'AB-', 1000000088, 'INS609', 31, TRUE, TRUE),
('499', 'Conclusion 3', 'M', 'A+', 1000000089, 'INS610', 27, FALSE, FALSE),
('500', 'Conclusion 4', 'F', 'B+', 1000000090, 'INS611', 33, TRUE, FALSE),
('501', 'Conclusion 5', 'M', 'O+', 1000000091, 'INS612', 26, FALSE, TRUE),
('502', 'Conclusion 6', 'F', 'AB+', 1000000092, 'INS613', 34, TRUE, TRUE),
('503', 'Conclusion 7', 'M', 'A-', 1000000093, 'INS614', 30, FALSE, FALSE),
('504', 'Conclusion 8', 'F', 'B-', 1000000094, 'INS615', 28, TRUE, FALSE),
('505', 'Conclusion 9', 'M', 'O-', 1000000095, 'INS616', 32, FALSE, TRUE),
('506', 'Conclusion 10', 'F', 'AB-', 1000000096, 'INS617', 29, TRUE, TRUE),
('507', 'Extended 01', 'M', 'A+', 1000000097, 'INS618', 35, FALSE, FALSE),
('508', 'Extended 02', 'F', 'B+', 1000000098, 'INS619', 31, TRUE, FALSE),
('509', 'Extended 03', 'M', 'O+', 1000000099, 'INS620', 27, FALSE, TRUE),
('510', 'Extended 04', 'F', 'AB+', 1000000100, 'INS621', 33, TRUE, TRUE),
('511', 'Extended 05', 'M', 'A-', 1000000101, 'INS622', 26, FALSE, FALSE),
('512', 'Extended 06', 'F', 'B-', 1000000102, 'INS623', 34, TRUE, FALSE),
('513', 'Extended 07', 'M', 'O-', 1000000103, 'INS624', 30, FALSE, TRUE),
('514', 'Extended 08', 'F', 'AB-', 1000000104, 'INS625', 28, TRUE, TRUE),
('515', 'Extended 09', 'M', 'A+', 1000000105, 'INS626', 32, FALSE, FALSE),
('516', 'Extended 10', 'F', 'B+', 1000000106, 'INS627', 29, TRUE, FALSE);


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
  Supplier_Phone_No bigint NOT NULL,
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