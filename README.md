# Hospital Database Management System

A comprehensive Python-based Hospital Management System that provides a complete solution for managing hospital operations including patient records, staff management, medical records, billing, and inventory tracking.

## 📋 Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Usage](#usage)
- [Database Schema](#database-schema)
- [Available Operations](#available-operations)
- [System Requirements](#system-requirements)
- [Installation](#installation)
- [Database Setup](#database-setup)
- [Configuration](#configuration)

## 🏥 Overview

This Hospital Management System is designed to streamline hospital operations by providing a centralized database system for managing:
- Patient information and medical records
- Doctor and nursing staff management
- Department organization and hierarchy
- Medical appointments and case tracking
- Billing and invoice management
- Inventory and supply management
- Prescription and medication tracking

The system features a command-line interface with colored output for better user experience and comprehensive error handling with transaction rollback capabilities.

## ✨ Features

### Core Functionality
- **Patient Management**: Complete patient registration, medical history tracking, and case management
- **Staff Management**: Doctor, nurse, receptionist, and general staff administration
- **Medical Records**: Comprehensive case tracking with appointment scheduling
- **Billing System**: Invoice generation and patient billing management
- **Inventory Control**: Medical supplies and equipment tracking
- **Prescription Management**: Medication tracking and prescription handling

### Advanced Features
- **Reporting & Analytics**: 
  - Doctor efficiency reports by department
  - Patient appointment scheduling (next 30 days)
  - Financial reporting and billing analytics
  - Staff performance metrics
- **Search Capabilities**: Advanced search across all entities
- **Data Integrity**: Foreign key constraints and transaction management
- **User-Friendly Interface**: Colored terminal output with clear navigation

## 🎯 Usage

### Running the Application
```bash
# Navigate to project directory
cd Hospital-Database

# Activate virtual environment (if using)
source hospital_env/bin/activate

# Run the application
python3 script.py
```

### Main Menu Options
Upon running, you'll see a menu with the following options:

1. **Insert Operations** - Add new records (patients, doctors, etc.)
2. **Delete Operations** - Remove existing records
3. **Search Operations** - Find specific records
4. **Case Details** - View complete case information
5. **Doctor Efficiency Reports** - Performance analytics
6. **Average Statistics** - Salary, age, and other metrics
7. **Department Details** - View doctors by department
8. **Success Cases** - View successful treatments
9. **Update Operations** - Modify existing records
10. **Staff Management** - Worker shift management
11. **Appointments** - View upcoming appointments
12. **Salary Reports** - Maximum salary by department
13. **Billing Reports** - Total hospital charges
14. **Print Tables** - View complete table contents
15. **Search Functions** - Advanced search capabilities

## 🗂️ Database Schema

### Core Tables
- **Patient**: Patient information and medical conditions
- **Doctor**: Doctor details, specializations, and hierarchy
- **Nurse**: Nursing staff information and qualifications
- **Department**: Hospital departments and management structure
- **Medical_Record**: Central case tracking and appointments

### Supporting Tables
- **Invoice**: Financial transactions and billing
- **Prescription**: Medication and treatment prescriptions
- **Inventory**: Medical supplies and equipment
- **Previous_Degrees_Doctor/Nurse**: Educational qualifications
- **Monitors**: Patient-nurse assignments
- **Surgery_Assignment**: Surgical team coordination
- **Specialist**: Doctor specialization details

### Relationship Highlights
- Doctors can supervise other doctors (hierarchical relationship)
- Departments have doctor heads with foreign key references
- Medical records link patients, doctors, and departments
- Billing system connects cases with accountants
- Surgery assignments coordinate multiple staff types

## 📊 Available Operations

### Data Management
- **Create**: Add new patients, staff, departments, cases
- **Read**: Search and view records with various filters
- **Update**: Modify existing information (contact details, appointments, etc.)
- **Delete**: Remove records with proper constraint handling

### Reporting Features
- Patient appointment schedules (next 30 days)
- Doctor efficiency by department
- Financial reports and billing summaries
- Staff performance and salary analytics
- Inventory status and stock levels

### Search Capabilities
- Search by name patterns (partial matching)
- Search by ID numbers
- Department-wise filtering
- Case status filtering
- Date range queries

## 🔧 System Requirements

### Software Requirements
- **Operating System**: macOS, Linux, or Windows
- **Python**: Version 3.7 or higher
- **MySQL**: Version 8.0 or higher
- **Terminal**: Command-line interface support

### Python Dependencies
- `pymysql`: MySQL database connector
- `colorama`: Terminal color output
- `subprocess`: System command execution

## �️ Database Setup

### Step 1: Create MySQL User and Database
```bash
# Login to MySQL as root
mysql -u root -p

# Create database and user (in MySQL prompt)
CREATE DATABASE Hospital_Management_System;
CREATE USER 'hospital_user'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON Hospital_Management_System.* TO 'hospital_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

### Step 2: Import Database Schema
```bash
# Import the database structure and sample data
mysql -u hospital_user -p Hospital_Management_System < database.sql
```

### Step 3: Verify Database Setup
```bash
# Login to verify
mysql -u hospital_user -p Hospital_Management_System

# Check tables (in MySQL prompt)
SHOW TABLES;
SELECT COUNT(*) FROM Patient;
EXIT;
```

## ⚙️ Configuration

### Update Database Connection
Edit the database connection parameters in `script.py` (around line 2500):

```python
con = pymysql.connect(
    host="localhost",           # Your MySQL host
    port=3306,                 # Your MySQL port
    user="hospital_user",      # Your MySQL username
    password='your_password',  # Your MySQL password
    db="Hospital_Management_System",
    cursorclass=pymysql.cursors.DictCursor,
)
```
