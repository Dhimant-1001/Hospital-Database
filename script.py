import subprocess as sp
from unittest import result
import pymysql
import pymysql.cursors
from colorama import Fore, Style


def printdict(dict):
    # print in a nice format
    max_key_length = max(len(key) for key in dict.keys())
    for key, value in dict.items():
        print(f"{key.ljust(max_key_length)}: {value}")


def printdictlist(dictlist):
    print("-------------------------------------------")
    for dict in dictlist:
        printdict(dict)
        print("-------------------------------------------")
    print()
    # print()


def delete_dept():
    """
    Function to implement option 1
    """
    try:
        dept_id = input("Enter Department ID: ")
        check_query = "SELECT * FROM Department WHERE Department_Id = {}".format(dept_id)
        cur.execute(check_query)
        result = cur.fetchone()

        if not result:
            print(Fore.RED + "Error: Department ID does not exist" + Style.RESET_ALL)
            return

        query = "DELETE FROM Department WHERE Department_Id = {}".format(dept_id)
        cur.execute(query)
        con.commit()
        print("Deleted from database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to delete from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def delete_nurse():
    """
    Function to implement option 1
    """
    try:
        Nurse_id = input("Enter Nurse_id: ")
        check_query = "SELECT * FROM Nurse WHERE Nurse_Id = {}".format(Nurse_id)
        cur.execute(check_query)
        result = cur.fetchone()

        if not result:
            print(Fore.RED + "Error: Nurse ID does not exist" + Style.RESET_ALL)
            return

        query = "DELETE FROM Nurse WHERE Nurse_Id = {}".format(Nurse_id)
        cur.execute(query)
        con.commit()
        print("Deleted from database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to delete from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def delete_patient():
    """
    Function to implement option 1
    """
    try:
        Patient_ID = input("Enter Patient_ID: ")
        check_query = "SELECT * FROM Patient WHERE Patient_Id = {}".format(Patient_ID)
        cur.execute(check_query)
        result = cur.fetchone()

        if not result:
            print(Fore.RED + "Error: Patient ID does not exist" + Style.RESET_ALL)
            return

        query = "DELETE FROM Patient WHERE Patient_Id = {}".format(Patient_ID)
        cur.execute(query)
        con.commit()
        print("Deleted from database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to delete from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def delete_Previous_Degrees_Nurse():
    """
    Function to implement option 1
    """
    try:
        Nurse_id = input("Enter Nurse_id: ")
        check_query = "SELECT * FROM Previous_Degrees_Nurse WHERE Nurse_Id = {}".format(Nurse_id)
        cur.execute(check_query)
        result = cur.fetchone()

        if not result:
            print(Fore.RED + "Error: Nurse ID does not exist" + Style.RESET_ALL)
            return

        query = "DELETE FROM Previous_Degrees_Nurse WHERE Nurse_Id = {}".format(Nurse_id)
        cur.execute(query)
        con.commit()
        print("Deleted from database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to delete from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def delete_Previous_Degrees_Doctor():
    """
    Function to implement option 1
    """
    try:
        Doctor_ID = input("Enter Doctor_ID: ")
        check_query = "SELECT * FROM Previous_Degrees_Doctor WHERE Doctor_Id = {}".format(Doctor_ID)
        cur.execute(check_query)
        result = cur.fetchone()

        if not result:
            print(Fore.RED + "Error: Doctor ID does not exist" + Style.RESET_ALL)
            return

        query = "DELETE FROM Previous_Degrees_Doctor WHERE Doctor_Id = {}".format(Doctor_ID)
        cur.execute(query)
        con.commit()
        print("Deleted from database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to delete from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def delete_invoice():
    """
    Function to implement option 1
    """
    try:
        Case_id = input("Enter Case_id: ")
        check_query = "SELECT * FROM Invoice WHERE Case_id = {}".format(Case_id)
        cur.execute(check_query)
        result = cur.fetchone()

        if not result:
            print(Fore.RED + "Error: Case ID does not exist" + Style.RESET_ALL)
            return

        query = "DELETE FROM Invoice WHERE Case_id = {}".format(Case_id)
        cur.execute(query)
        con.commit()
        print("Deleted from database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to delete from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def delete_medical_record():
    """
    Function to implement option 1
    """
    try:
        Case_id = input("Enter Case_id: ")
        check_query = "SELECT * FROM Medical_Record WHERE Case_Id = {}".format(Case_id)
        cur.execute(check_query)
        result = cur.fetchone()

        if not result:
            print(Fore.RED + "Error: Case ID does not exist" + Style.RESET_ALL)
            return

        query = "DELETE FROM Medical_Record WHERE Case_Id = {}".format(Case_id)
        cur.execute(query)
        con.commit()
        print("Deleted from database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to delete from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def delete_Medical_History():
    """
    Function to implement option 1
    """
    try:
        Patient_ID = input("Enter Patient_ID: ")
        check_query = "SELECT * FROM Medical_History WHERE Patient_ID = {}".format(Patient_ID)
        cur.execute(check_query)
        result = cur.fetchone()

        if not result:
            print(Fore.RED + "Error: Patient ID does not exist" + Style.RESET_ALL)
            return

        query = "DELETE FROM Medical_History WHERE Patient_ID = {}".format(Patient_ID)
        cur.execute(query)
        con.commit()
        print("Deleted from database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to delete from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def delete_Prescription():
    """
    Function to implement option 1
    """
    try:
        Case_id = input("Enter Case_id: ")
        check_query = "SELECT * FROM Prescription WHERE Case_id = {}".format(Case_id)
        cur.execute(check_query)
        result = cur.fetchone()

        if not result:
            print(Fore.RED + "Error: Case ID does not exist" + Style.RESET_ALL)
            return

        query = "DELETE FROM Prescription WHERE Case_id = {}".format(Case_id)
        cur.execute(query)
        con.commit()
        print("Deleted from database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to delete from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def delete_Receptionist():
    """
    Function to implement option 1
    """
    try:
        Receptionist_id = input("Enter Receptionist_id: ")
        check_query = "SELECT * FROM Receptionist WHERE Receptionist_id = {}".format(Receptionist_id)
        cur.execute(check_query)
        result = cur.fetchone()

        if not result:
            print(Fore.RED + "Error: Receptionist ID does not exist" + Style.RESET_ALL)
            return

        query = "DELETE FROM Receptionist WHERE Receptionist_id = {}".format(Receptionist_id)
        cur.execute(query)
        con.commit()
        print("Deleted from database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to delete from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def delete_General_Staff():
    """
    Function to implement option 1
    """
    try:
        Worker_id = input("Enter Staff_Id: ")
        check_query = "SELECT * FROM General_Staff WHERE Staff_Id = {}".format(Worker_id)
        cur.execute(check_query)
        result = cur.fetchone()

        if not result:
            print(Fore.RED + "Error: Staff ID does not exist" + Style.RESET_ALL)
            return

        query = "DELETE FROM General_Staff WHERE Staff_Id = {}".format(Worker_id)
        cur.execute(query)
        con.commit()
        print("Deleted from database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to delete from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def delete_Doctor():
    """
    Function to implement option 1
    """
    try:
        Doctor_ID = input("Enter Doctor_ID: ")
        check_query = "SELECT * FROM Doctor WHERE Doctor_Id = {}".format(Doctor_ID)
        cur.execute(check_query)
        result = cur.fetchone()

        if not result:
            print(Fore.RED + "Error: Doctor ID does not exist" + Style.RESET_ALL)
            return

        query = "DELETE FROM Doctor WHERE Doctor_Id = {}".format(Doctor_ID)
        cur.execute(query)
        con.commit()
        print("Deleted from database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to delete from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)




def delete_Accountant():
    """
    Function to implement option 1
    """
    try:
        Accountant_id = input("Enter Accountant_id: ")
        check_query = "SELECT * FROM Accountant WHERE Accountant_id = {}".format(Accountant_id)
        cur.execute(check_query)
        result = cur.fetchone()

        if not result:
            print(Fore.RED + "Error: Accountant ID does not exist" + Style.RESET_ALL)
            return

        query = "DELETE FROM Accountant WHERE Accountant_id = {}".format(Accountant_id)
        cur.execute(query)
        con.commit()
        print("Deleted from database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to delete from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def delete_Monitors():
    """
    Function to implement option 1
    """
    try:
        Patient_Id = input("Enter Patient_Id: ")
        check_query = "SELECT * FROM Monitors WHERE Patient_Id = {}".format(Patient_Id)
        cur.execute(check_query)
        result = cur.fetchone()

        if not result:
            print(Fore.RED + "Error: Patient ID does not exist" + Style.RESET_ALL)
            return

        query = "DELETE FROM Monitors WHERE Patient_Id = {}".format(Patient_Id)
        cur.execute(query)
        con.commit()
        print("Deleted from database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to delete from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def delete_Patient_Billing():
    """
    Function to implement option 1
    """
    try:
        Case_Id = input("Enter Case_Id: ")
        check_query = "SELECT * FROM Patient_Billing WHERE Case_Id = {}".format(Case_Id)
        cur.execute(check_query)
        result = cur.fetchone()

        if not result:
            print(Fore.RED + "Error: Case ID does not exist" + Style.RESET_ALL)
            return

        query = "DELETE FROM Patient_Billing WHERE Case_Id = {}".format(Case_Id)
        cur.execute(query)
        con.commit()
        print("Deleted from database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to delete from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def delete_Inventory():
    """
    Function to implement option 1
    """
    try:
        Item_Name = input("Enter Item_Name: ")
        check_query = "SELECT * FROM Inventory WHERE Item_Name = '{}'".format(Item_Name)
        cur.execute(check_query)
        result = cur.fetchone()

        if not result:
            print(Fore.RED + "Error: Item Name does not exist" + Style.RESET_ALL)
            return

        query = "DELETE FROM Inventory WHERE Item_Name = '{}'".format(Item_Name)
        cur.execute(query)
        con.commit()
        print("Deleted from database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to delete from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def new_dept():
    """
    Function to implement option 1
    """
    try:
        # dept_id = input("Enter Department ID: ")
        dept_name = input("Enter Department Name: ")
        hod_id = input("Enter HOD ID: ")
        floor_no = input("Enter floor no: ")
        block_name = input("Enter block no: ")
        query = "INSERT INTO Department(Department_Name,Department_Head_Id,Floor_No,Block_Name) VALUES('{}',{},{},'{}')".format(
            dept_name, hod_id, floor_no, block_name
        )

        cur.execute(query)
        con.commit()
        print(Fore.GREEN + "Inserted Into Database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


# def new_nurse():
#     """
#     Function to implement option 1
#     """
#     try:
#         # Nurse_id = input("Enter Nurse_id: ")
#         Nurse_name = input("Enter Nurse_name: ")
#         Gender = input("Enter Gender: ")
#         Paycheck = input("Enter Paycheck: ")
#         print("Enter number of alma mater")
#         num = int(input())
#         alma = []
#         for i in range(num):
#             alma.append(input("Enter Alma_Mater: "))

#         query = (
#             "INSERT INTO Nurse(Nurse_name,Gender,Paycheck) VALUES('{}','{}',{})".format(
#                 Nurse_name,
#                 Gender,
#                 Paycheck,
#             )
#         )

#         cur.execute(query)
#         con.commit()

#         query = "SELECT Nurse_id FROM Nurse WHERE Nurse_name = '{}'".format(Nurse_name)

#         cur.execute(query)
#         con.commit()
#         Nurse_id = cur.fetchone()["Nurse_id"]

#         for al in alma:
#             query = "INSERT INTO Alma_Mater_Nurse VALUES({},'{}')".format(
#                 Nurse_id,
#                 al,
#             )

#             cur.execute(query)
#             con.commit()

#         print(Fore.GREEN + "Inserted Into Database" + Style.RESET_ALL)

#     except Exception as e:
#         con.rollback()
#         print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
#         print(">>>>>>>>>>>>>", e)

def new_nurse():
    """
    Function to implement option 1: Add a new nurse to the database.
    """
    try:
        Nurse_name = input("Enter Nurse Name: ")
        Gender = input("Enter Gender (M/F): ").upper()
        if Gender not in ['M', 'F']:
            raise ValueError("Gender must be 'M' or 'F'")
        Date_of_Birth = input("Enter Date of Birth (YYYY-MM-DD): ")
        Paycheck = int(input("Enter Paycheck: "))
        Department_Id = input("Enter Department ID (or leave blank for NULL): ")
        Department_Id = int(Department_Id) if Department_Id else "NULL"

        # Collect previous degrees
        print("Enter the number of previous degrees:")
        num_degrees = int(input())
        previous_degrees = []
        for i in range(num_degrees):
            College = input(f"Enter College for degree {i + 1}: ")
            Year = int(input(f"Enter Year of degree {i + 1}: "))
            Degree = input(f"Enter Degree for degree {i + 1}: ")
            Field = input(f"Enter Field of study for degree {i + 1}: ")
            previous_degrees.append((College, Year, Degree, Field))

        # Insert into Nurse table
        query = f"""
        INSERT INTO Nurse (Name, Sex, Date_of_Birth, Paycheck, Department_Id)
        VALUES ('{Nurse_name}', '{Gender}', '{Date_of_Birth}', {Paycheck}, {Department_Id})
        """
        cur.execute(query)
        con.commit()

        # Get the auto-generated Nurse_Id
        cur.execute(f"SELECT Nurse_Id FROM Nurse WHERE Name = '{Nurse_name}'")
        Nurse_id = cur.fetchone()["Nurse_Id"]

        # Insert into Previous_Degrees_Nurse table
        for degree in previous_degrees:
            College, Year, Degree, Field = degree
            query = f"""
            INSERT INTO Previous_Degrees_Nurse (Nurse_Id, College, Year, Degree, Field)
            VALUES ({Nurse_id}, '{College}', {Year}, '{Degree}', '{Field}')
            """
            cur.execute(query)
            con.commit()

        print(Fore.GREEN + "Inserted Into Database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)

def new_patient():
    """
    Function to add a new patient to the database.
    """
    try:
        # Collect mandatory patient details
        Name = input("Enter Patient Name: ")
        Gender = input("Enter Gender (M/F): ").upper()
        if Gender not in ['M', 'F']:
            raise ValueError("Gender must be 'M' or 'F'")
        Blood_group = input("Enter Blood Group (e.g., O+, A-): ")
        Phone_no = int(input("Enter Phone Number: "))
        Insurance_Id = input("Enter Insurance ID: ")
        Age = int(input("Enter Age: "))
        
        # Collect boolean health data
        Diabetic = input("Is the patient diabetic? (yes/no): ").strip().lower()
        if Diabetic not in ['yes', 'no']:
            raise ValueError("Diabetic must be 'yes' or 'no'")
        Diabetic = 1 if Diabetic == 'yes' else 0

        Blood_pressure = input("Does the patient have blood pressure issues? (yes/no): ").strip().lower()
        if Blood_pressure not in ['yes', 'no']:
            raise ValueError("Blood pressure must be 'yes' or 'no'")
        Blood_pressure = 1 if Blood_pressure == 'yes' else 0

        # SQL query to insert patient data
        query = f"""
        INSERT INTO Patient (Name, Sex, Blood_group, Phone_no, Insurance_Id, Age, Diabetic, Blood_pressure)
        VALUES ('{Name}', '{Gender}', '{Blood_group}', {Phone_no}, '{Insurance_Id}', {Age}, {Diabetic}, {Blood_pressure})
        """
        
        # Execute query
        cur.execute(query)
        con.commit()
        print(Fore.GREEN + "Inserted into database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def new_previous_degree_nurse():
    """
    Function to add a previous degree for a nurse.
    """
    try:
        Nurse_id = int(input("Enter Nurse ID: "))
        College = input("Enter College Name: ")
        Year = int(input("Enter Year of Graduation: "))
        Degree = input("Enter Degree Name: ")
        Field = input("Enter Field of Study: ")

        # SQL query to insert data into Previous_Degrees_Nurse table
        query = f"""
        INSERT INTO Previous_Degrees_Nurse (Nurse_Id, College, Year, Degree, Field)
        VALUES ({Nurse_id}, '{College}', {Year}, '{Degree}', '{Field}')
        """
        
        # Execute the query
        cur.execute(query)
        con.commit()
        print(Fore.GREEN + "Inserted into database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def new_previous_degree_doctor():
    """
    Function to add a previous degree for a doctor.
    """
    try:
        # Collect doctor details and previous degree information
        Doctor_Id = int(input("Enter Doctor ID: "))
        College = input("Enter College Name: ")
        Year = int(input("Enter Year of Graduation: "))
        Degree = input("Enter Degree Name: ")
        Field = input("Enter Field of Study: ")

        # SQL query to insert data into Previous_Degrees_Doctor table
        query = f"""
        INSERT INTO Previous_Degrees_Doctor (Doctor_Id, College, Year, Degree, Field)
        VALUES ({Doctor_Id}, '{College}', {Year}, '{Degree}', '{Field}')
        """

        # Execute the query
        cur.execute(query)
        con.commit()
        print(Fore.GREEN + "Inserted into database" + Style.RESET_ALL)

    except Exception as e:
        # Rollback on failure and show the error
        con.rollback()
        print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def new_invoice():
    """
    Function to implement option 1
    """
    try:
        Case_id = input("Enter Case_id: ")
        Consultation_charges = input("Enter Consultation_charges: ")
        Operation_charges = input("Enter Operation_charges: ")
        other_charges = input("Enter other_charges: ")
        Transaction_id = input("Enter Transaction id: ")
        query = "INSERT INTO Invoice VALUES({},{},{},{},{})".format(
            Case_id,
            Consultation_charges,
            Operation_charges,
            other_charges,
            Transaction_id,
        )

        cur.execute(query)
        con.commit()
        print(Fore.GREEN + "Inserted Into Database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


# def new_medical_record():
#     """
#     Function to implement option 1
#     """
#     try:
#         # Case_id = input("Enter Case_id: ")
#         Name = input("Enter Name: ")
#         query = "SELECT Patient_ID FROM Patient WHERE Name = '{}'".format(
#             Name
#         )

#         cur.execute(query)
#         con.commit()

#         result = cur.fetchall()
#         # Patient_ID = result[0]['Patient_ID']
#         if result == ():
#             new_patient()
#             query = "SELECT Patient_ID FROM Patient WHERE Name = '{}'".format(
#                 Name
#             )

#             cur.execute(query)
#             con.commit()
#             result = cur.fetchone()
#             Patient_ID = result["Patient_ID"]

#             # Doctor_name = input("Enter Doctor name: ")
#             doc_name = input("Enter Doctor name: ")
#             query = "SELECT Doctor_ID FROM Doctor WHERE Name = '{}'".format(
#                 doc_name
#             )

#             cur.execute(query)
#             con.commit()
#             result = cur.fetchone()
#             Doctor_ID = result["Doctor_ID"]
#             Case_Since = "2023-12-03"
#             Number_of_visits = 1
#             Recent_visit = "2023-12-03"
#             Next_Appointment = "2023-12-10"
#             Status = "Active"
#             query = "INSERT INTO Medical_Record(Patient_ID,Doctor_ID,Case_Since,Number_of_visits,Recent_visit,Next_Appointment,Status) VALUES({},{},'{}',{},'{}','{}','{}')".format(
#                 # Case_id,
#                 Patient_ID,
#                 Doctor_ID,
#                 Case_Since,
#                 Number_of_visits,
#                 Recent_visit,
#                 Next_Appointment,
#                 Status,
#             )

#             cur.execute(query)
#             con.commit()

#             query = "SELECT MAX(Case_id) FROM Medical_Record"

#             cur.execute(query)
#             con.commit()
#             result = cur.fetchone()
#             Case_id = result["MAX(Case_id)"]
#             print("------------------------------------------")
#             print("New Case with ID: ", Case_id)
#             print("------------------------------------------")
#             print()
#             # print(Fore.GREEN + "Inserted Into Database" + Style.RESET_ALL)
#         else:
#             # result= cur.fetchone()
#             Patient_ID = result["Patient_ID"]

#             # Doctor_name = input("Enter Doctor name: ")
#             doc_name = input("Enter Doctor name: ")
#             query = "SELECT Doctor_ID FROM Doctor WHERE Name = '{}'".format(
#                 doc_name
#             )

#             cur.execute(query)
#             con.commit()
#             result = cur.fetchone()
#             Doctor_ID = result["Doctor_ID"]
#             Case_Since = "2023-12-03"
#             Number_of_visits = 1
#             Recent_visit = "2023-12-03"
#             Next_Appointment = "2023-12-10"
#             Status = "Active"
#             query = "INSERT INTO Medical_Record(Patient_ID,Doctor_ID,Case_Since,Number_of_visits,Recent_visit,Next_Appointment,Status) VALUES({},{},'{}',{},'{}','{}','{}')".format(
#                 # Case_id,
#                 Patient_ID,
#                 Doctor_ID,
#                 Case_Since,
#                 Number_of_visits,
#                 Recent_visit,
#                 Next_Appointment,
#                 Status,
#             )

#             cur.execute(query)
#             con.commit()

#             query = "SELECT MAX(Case_id) FROM Medical_Record"

#             cur.execute(query)
#             con.commit()
#             result = cur.fetchone()
#             Case_id = result["MAX(Case_id)"]
#             print("------------------------------------------")
#             print("New Case with ID: ", Case_id)
#             print("------------------------------------------")

#             # print("Inserted Into Database New Case with ID: ",Case_id)

#     except Exception as e:
#         con.rollback()
#         print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
#         print(">>>>>>>>>>>>>", e)


def new_medical_record():
    """
    Function to add a new medical record for a patient.
    """
    try:
        # Fetch patient details
        Name = input("Enter Patient Name: ")
        query = f"SELECT Patient_ID FROM Patient WHERE Name = '{Name}'"
        cur.execute(query)
        con.commit()
        result = cur.fetchall()

        # If patient doesn't exist, create a new one
        if not result:
            print("Patient not found. Adding a new patient.")
            new_patient()
            query = f"SELECT Patient_ID FROM Patient WHERE Name = '{Name}'"
            cur.execute(query)
            con.commit()
            result = cur.fetchone()
            Patient_ID = result["Patient_ID"]
        else:
            Patient_ID = result[0]["Patient_ID"]

        # Fetch doctor details
        doc_name = input("Enter Doctor Name: ")
        query = f"SELECT Doctor_ID, Department_Id FROM Doctor WHERE Name = '{doc_name}'"
        cur.execute(query)
        con.commit()
        result = cur.fetchone()

        if not result:
            raise ValueError("Doctor not found. Please ensure the doctor exists in the database.")
        Doctor_ID = result["Doctor_ID"]
        Department_Id = result["Department_Id"]

        # Collect other case details
        Case_start_date = input("Enter Case Start Date (YYYY-MM-DD): ") or "2023-12-03"
        Recent_visit = input("Enter Recent Visit Date (YYYY-MM-DD): ") or "2023-12-03"
        Next_Appointment = input("Enter Next Appointment Date (YYYY-MM-DD): ") or "2023-12-10"
        Total_visits = int(input("Enter Total Visits (default is 1): ") or 1)
        Status = input("Enter Case Status (e.g., Active, Closed): ") or "Active"

        # Insert into Medical_Record
        query = f"""
        INSERT INTO Medical_Record (
            Case_start_date, Department_Id, Doctor_Id, Recent_visit, Next_Appointment, Total_visits, Patient_Id, Status
        ) VALUES (
            '{Case_start_date}', '{Department_Id}', {Doctor_ID}, '{Recent_visit}', '{Next_Appointment}', {Total_visits}, {Patient_ID}, '{Status}'
        )
        """
        cur.execute(query)
        con.commit()

        # Retrieve and display the new Case ID
        query = "SELECT MAX(Case_Id) AS Case_Id FROM Medical_Record"
        cur.execute(query)
        con.commit()
        result = cur.fetchone()
        Case_Id = result["Case_Id"]

        print("------------------------------------------")
        print(f"New Medical Record created with Case ID: {Case_Id}")
        print("------------------------------------------")

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def new_Medical_History():
    """
    Function to add a new entry to the Medical_History table.
    """
    try:
        # Collect Patient ID
        Patient_ID = input("Enter Patient_ID: ")
        query = f"SELECT Patient_ID FROM Patient WHERE Patient_ID = {Patient_ID}"
        cur.execute(query)
        con.commit()
        result = cur.fetchone()
        
        if not result:
            raise ValueError("Patient ID not found in the database.")

        # Collect Case ID
        Case_id = input("Enter Case_id: ")
        query = f"SELECT Case_id FROM Medical_Record WHERE Case_Id = {Case_id}"
        cur.execute(query)
        con.commit()
        result = cur.fetchone()

        if not result:
            raise ValueError("Case ID not found in the database.")

        # Insert into Medical_History table
        query = f"INSERT INTO Medical_History (Case_id, Patient_ID) VALUES ({Case_id}, {Patient_ID})"
        cur.execute(query)
        con.commit()

        print(Fore.GREEN + "Inserted into Medical_History table successfully." + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)




def new_Prescription():
    """
    Function to implement option 1
    """
    try:
        Case_id = input("Enter Case_id: ")
        Prescription_no = input("Enter Prescription_no: ")
        Medicines = input("Enter Medicines: ")
        query = "INSERT INTO Prescription VALUES({},{},'{}')".format(
            Case_id,
            Prescription_no,
            Medicines,
        )

        cur.execute(query)
        con.commit()
        print(Fore.GREEN + "Inserted Into Database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


# def new_Medical_History():
#     """
#     Function to implement option 1
#     """
#     try:
#         Case_id = input("Enter Case_id: ")
#         Patient_ID = input("Enter Patient_ID: ")
#         query = "INSERT INTO Previous_Cases VALUES({},{})".format(
#             Case_id,
#             Patient_ID,
#         )

#         cur.execute(query)
#         con.commit()
#         print(Fore.GREEN + "Inserted Into Database" + Style.RESET_ALL)

#     except Exception as e:
#         con.rollback()
#         print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
#         print(">>>>>>>>>>>>>", e)


def new_Inventory():
    """
    Function to insert a new record into the Inventory table.
    """
    try:
        # Collecting user inputs for the new record
        Item_Name = input("Enter Item Name: ")
        Supplier_Phone_No = input("Enter Supplier Phone Number (10 digits): ")
        Available_Stock = input("Enter Available Stock: ")
        Min_Stock_Level = input("Enter Minimum Stock Level: ")
        Purchase_Date = input("Enter Purchase Date (YYYY-MM-DD): ")
        Expiry_Date = input("Enter Expiry Date (YYYY-MM-DD): ")
        Cost_Per_Unit = input("Enter Cost Per Unit: ")

        # Constructing the query
        query = """INSERT INTO Inventory (
                       Item_Name, Supplier_Phone_No, Available_Stock, 
                       Min_Stock_Level, Purchase_Date, Expiry_Date, Cost_Per_Unit
                   ) VALUES ('{}', {}, {}, {}, '{}', '{}', {})""".format(
            Item_Name, Supplier_Phone_No, Available_Stock, Min_Stock_Level, 
            Purchase_Date, Expiry_Date, Cost_Per_Unit)

        # Executing the query
        cur.execute(query)
        con.commit()
        print(Fore.GREEN + "Inserted Into Database Successfully" + Style.RESET_ALL)

    except Exception as e:
        # Rolling back the transaction in case of an error
        con.rollback()
        print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)

def new_Monitor():
    """
    Function to insert a new record into the Monitors table.
    """
    try:
        # Collecting user inputs for the new record
        Patient_Id = input("Enter Patient ID: ")
        Nurse_Id = input("Enter Nurse ID: ")

        # Constructing the query
        query = """INSERT INTO Monitors (Patient_Id, Nurse_Id) 
                   VALUES ({}, {})""".format(Patient_Id, Nurse_Id)

        # Executing the query
        cur.execute(query)
        con.commit()
        print(Fore.GREEN + "Inserted Into Database Successfully" + Style.RESET_ALL)

    except Exception as e:
        # Rolling back the transaction in case of an error
        con.rollback()
        print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)

def new_Accountant():
    """
    Function to insert a new record into the Accountant table.
    """
    try:
        # Collecting user inputs for the new record
        FirstName = input("Enter First Name: ")
        LastName = input("Enter Last Name: ")
        Sex = input("Enter Sex (M/F): ")
        Date_of_Birth = input("Enter Date of Birth (YYYY-MM-DD): ")
        Paycheck = input("Enter Paycheck Amount: ")

        # Constructing the query
        query = """INSERT INTO Accountant (FirstName, LastName, Sex, Date_of_Birth, Paycheck) 
                   VALUES ('{}', '{}', '{}', '{}', {})""".format(FirstName, LastName, Sex, Date_of_Birth, Paycheck)

        # Executing the query
        cur.execute(query)
        con.commit()
        print(Fore.GREEN + "Inserted Into Database Successfully" + Style.RESET_ALL)

    except Exception as e:
        # Rolling back the transaction in case of an error
        con.rollback()
        print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def new_General_Staff():
    """
    Function to insert a new record into the General_Staff table.
    """
    try:
        # Collecting user inputs for the new record
        Name = input("Enter Name: ")
        Sex = input("Enter Sex (M/F): ")
        Date_of_Birth = input("Enter Date of Birth (YYYY-MM-DD): ")
        Hourly_wage = input("Enter Hourly Wage: ")
        Shift = input("Enter Shift (1 or 2): ")
        Weekly_Hours = input("Enter Weekly Hours: ")

        # Constructing the query
        query = """INSERT INTO General_Staff (Name, Sex, Date_of_Birth, Hourly_wage, Shift, Weekly_Hours) 
                   VALUES ('{}', '{}', '{}', {}, {}, {})""".format(Name, Sex, Date_of_Birth, Hourly_wage, Shift, Weekly_Hours)

        # Executing the query
        cur.execute(query)
        con.commit()
        print(Fore.GREEN + "Inserted Into Database Successfully" + Style.RESET_ALL)

    except Exception as e:
        # Rolling back the transaction in case of an error
        con.rollback()
        print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)

def new_Doctor():
    """
    Function to insert a new record into the Doctor table.
    """
    try:
        # Collecting user inputs for the new record
        Name = input("Enter Name: ")
        Date_of_Birth = input("Enter Date of Birth (YYYY-MM-DD): ")
        Paycheck = input("Enter Paycheck: ")
        Date_of_Joining = input("Enter Date of Joining (YYYY-MM-DD): ")
        Age = int(input("Enter Age: "))
        Sex = input("Enter Sex (M/F): ")
        Department_Id = input("Enter Department Id: ")
        Supervisor_Id = input("Enter Supervisor Id (or NULL if none): ")
        Address = input("Enter Address: ")
        Phone_no = input("Enter Phone No: ")

        # If Supervisor_Id is NULL, handle it accordingly
        if Supervisor_Id.lower() == "null":
            Supervisor_Id = "NULL"
        else:
            Supervisor_Id = int(Supervisor_Id)

        # Constructing the query
        query = """INSERT INTO Doctor (Name, Date_of_Birth, Paycheck, Date_of_Joining, Age, Sex, 
                                      Department_Id, Supervisor_Id, Address, Phone_no) 
                   VALUES ('{}', '{}', {}, '{}', {}, '{}', {}, {}, '{}', {})""".format(
                       Name, Date_of_Birth, Paycheck, Date_of_Joining, Age, Sex, Department_Id, 
                       Supervisor_Id, Address, Phone_no)
                   
        print(query)

        # Executing the query
        cur.execute(query)
        con.commit()
        print(Fore.GREEN + "Inserted Into Database Successfully" + Style.RESET_ALL)

    except Exception as e:
        # Rolling back the transaction in case of an error
        con.rollback()
        print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)

def new_Patient_Billing():
    """
    Function to insert a new record into the Patient_Billing table.
    """
    try:
        # Collecting user inputs for the new record
        Case_Id = input("Enter Case ID: ")
        Accountant_Id = input("Enter Accountant ID: ")
        Patient_Id = input("Enter Patient ID: ")

        # Constructing the query
        query = """INSERT INTO Patient_Billing (Case_Id, Accountant_Id, Patient_Id) 
                   VALUES ({}, {}, {})""".format(Case_Id, Accountant_Id, Patient_Id)

        # Executing the query
        cur.execute(query)
        con.commit()
        print(Fore.GREEN + "Inserted Into Database Successfully" + Style.RESET_ALL)

    except Exception as e:
        # Rolling back the transaction in case of an error
        con.rollback()
        print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)

def new_Receptionist():
    """
    Function to implement option 1
    """
    try:
        # Receptionist_id = input("Enter Receptionist_id: ")
        Receptionist_name = input("Enter Receptionist_name: ")
        Gender = input("Enter Gender(M/F): ")
        DOB = input("Enter DOB(YYYY-MM-DD): ")
        Paycheck = int(input("Enter Paycheck: "))
        query = "INSERT INTO Receptionist(Name,Sex,Date_of_Birth,Paycheck) VALUES('{}','{}','{}',{})".format(
            Receptionist_name,
            Gender,
            DOB,
            Paycheck
        )

        cur.execute(query)
        con.commit()
        print(Fore.GREEN + "Inserted Into Database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def new_Tests():
    """
    Function to implement option 1
    """
    try:
        Case_id = input("Enter Case_id: ")
        Test_type = input("Enter Test_type: ")
        Test_result = input("Enter Tesst_result: ")
        query = "INSERT INTO Tests VALUES({},'{}','{}')".format(
            Case_id,
            Test_type,
            Test_result,
        )

        cur.execute(query)
        con.commit()
        print(Fore.GREEN + "Inserted Into Database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to     insert into database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def new_Workers():
    """
    Function to implement option 1
    """
    try:
        # Worker_id = input("Enter Worker_id: ")
        Name = input("Enter Name: ")
        Gender = input("Enter Gender: ")
        DOB = input("Enter DOB: ")
        salary_per_hour = input("Enter salary_per_hour: ")
        Shift = input("Enter Shift: ")
        Number_of_hours_worked_in_current_week = input(
            "Enter Number_of_hours_worked_in_current_week: "
        )
        query = "INSERT INTO General_Staff(Name,Gender,DOB,Salary_per_hour,Shift,Number_of_hours_worked_in_current_week) VALUES('{}','{}','{}',{},{},{})".format(
            Name,
            Gender,
            DOB,
            salary_per_hour,
            Shift,
            Number_of_hours_worked_in_current_week,
        )

        cur.execute(query)
        con.commit()
        print(Fore.GREEN + "Inserted Into Database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def search():
    """
    Function to implement updation
    """
    try:
        print("1. Search for a doctor")
        print("2. Search for a nurse")
        print("3. Search for a receptionist")
        print("4. Search for a general staff")
        print("5. Search for a patient")
        print("6. Search for a department")
        print("7. Search for a medical record")
        print("8. Search for an invoice")
        print("9. Search for a prescription")
        print("10. Search for a medical history")
        print("11. Search for a previous degree doctor")
        print("12. Search for a previous degree nurse")

        ch = int(input("Enter choice> "))
        sp.call("clear", shell=True)
        to_search = ""
        query = ""
        if ch == 1:
            print("Enter Name of Doctor to search")
            to_search = input()
            query = f"SELECT * FROM Doctor WHERE Name LIKE '{to_search}%'"
        elif ch == 2:
            print("Enter Name of Nurse to search")
            to_search = input()
            query = f"SELECT * FROM Nurse WHERE Name LIKE '{to_search}%'"
        elif ch == 3:
            print("Enter Name of Receptionist to search")
            to_search = input()
            query = f"SELECT * FROM Receptionist WHERE Name LIKE '{to_search}%'"
        elif ch == 4:
            print("Enter Name of General Staff to search")
            to_search = input()
            query = f"SELECT * FROM General_Staff WHERE Name LIKE '{to_search}%'"
        elif ch == 5:
            print("Enter Name of Patient to search")
            to_search = input()
            query = f"SELECT * FROM Patient WHERE Name LIKE '{to_search}%'"
        elif ch == 6:
            print("Enter Name of Department to search")
            to_search = input()
            query = f"SELECT * FROM Department WHERE Department_Name LIKE '{to_search}%'"
        elif ch == 7:
            print("Enter Case ID to search")
            to_search = input()
            query = f"SELECT * FROM Medical_Record WHERE Case_Id = {to_search}"
        elif ch == 8:
            print("Enter Case ID to search")
            to_search = input()
            query = f"SELECT * FROM Invoice WHERE Case_id = {to_search}"
        elif ch == 9:
            print("Enter Case ID to search")
            to_search = input()
            query = f"SELECT * FROM Prescription WHERE Case_id = {to_search}"
        elif ch == 10:
            print("Enter Case ID to search")
            to_search = input()
            print("Enter Patient ID to search")
            to_search2 = input()
            query = f"SELECT * FROM Medical_History WHERE Case_id = {to_search} AND Patient_ID = {to_search2}"
        elif ch == 11:
            print("Enter Doctor ID to search")
            to_search = input()
            query = f"SELECT * FROM Previous_Degrees_Doctor WHERE Doctor_Id = {to_search}"
        elif ch == 12:
            print("Enter Nurse ID to search")
            to_search = input()
            query = f"SELECT * FROM Previous_Degrees_Nurse WHERE Nurse_Id = {to_search}"
        else:
            print("Error: Invalid Option")
            return

        cur.execute(query)
        con.commit()
        result = cur.fetchall()
        if not result:
            print(Fore.RED + "Error: No matching records found" + Style.RESET_ALL)
        else:
            printdictlist(result)
            print(Fore.GREEN + "Search Successful" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to Search from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def option4():
    """
    Function to implement option 3
    """
    print("Not implemented")


def hireAnEmployee():
    """
    This is a sample function implemented for the refrence.
    This example is related to the Employee Database.
    In addition to taking input, you are required to handle domain errors as well
    For example: the SSN should be only 9 characters long
    Sex should be only M or F
    If you choose to take Super_SSN, you need to make sure the foreign key constraint is satisfied
    HINT: Instead of handling all these errors yourself, you can make use of except clause to print the error returned to you by MySQL
    """

    alma_list = []
    try:
        # Doctor_ID = input("Enter Doctor ID: ")
        Name = input("Enter Name of Doctor: ")
        num_alma = int(input("Enter number of educational institutions: "))
        while num_alma > 0:
            alma = input("Enter alma mater: ")
            alma_list.append(alma)
            num_alma = num_alma - 1
        Speciality = input("Enter Speciality: ")
        DOB = input("Enter DOB: ")
        DOJ = input("Enter DOJ: ")
        Age = input("Enter Age: ")
        Designation = input("Enter Designation: ")
        Paycheck = input("Enter Paycheck: ")
        print("Enter 1 for Cardiology")
        print("Enter 2 for Neurology")
        print("Enter 3 for Dermatology")
        print("Enter 4 for Pathology")
        print("Enter 5 for Ophtalmology")
        dept_name = int(input())
        query = ""
        if dept_name == 1:
            query = "SELECT Department_ID FROM Department WHERE Department_Name = 'Cardiology'"
        elif dept_name == 2:
            query = "SELECT Department_ID FROM Department WHERE Department_Name = 'Neurology'"
        elif dept_name == 3:
            query = "SELECT Department_ID FROM Department WHERE Department_Name = 'Dermatology'"
        elif dept_name == 4:
            query = "SELECT Department_ID FROM Department WHERE Department_Name = 'Pathology'"
        elif dept_name == 5:
            query = "SELECT Department_ID FROM Department WHERE Department_Name = 'Ophtalmology'"
        print(query)
        cur.execute(query)
        con.commit()
        result = cur.fetchall()
        Department_ID = result[0]["Department_ID"]
        # Department_ID = input("Enter Department ID: ")

        query = "INSERT INTO Doctor(Name,Speciality,DOB,Date_of_Joining,Age,Designation,Paycheck,Department_ID) VALUES('{}','{}','{}','{}',{},'{}',{},{})".format(
            Name,
            Speciality,
            DOB,
            DOJ,
            Age,
            Designation,
            Paycheck,
            Department_ID,
        )

        # Name     | varchar(255) | NO   |     | NULL    |       |
        # | Speciality      | varchar(255) | NO   |     | NULL    |       |
        # | DOB             | date         | NO   |     | NULL    |       |
        # | Date_of_Joining | varchar(255) | NO   |     | NULL    |       |
        # | Age             | varchar(255) | NO   |     | NULL    |       |
        # | Designation     | varchar(255) | NO   |     | NULL    |       |
        # | Paycheck          | int          | NO   |     | NULL    |       |
        # | Department_ID

        cur.execute(query)
        con.commit()

        query = "SELECT Doctor_ID FROM Doctor WHERE Name = '{}'".format(Name)
        cur.execute(query)
        con.commit()
        result = cur.fetchall()
        doctorid = result[0]["Doctor_ID"]

        while alma_list:
            query = "INSERT INTO Alma_Mater_Doctor(Doctor_ID,Alma_Mater) VALUES({},'{}')".format(
                doctorid,
                alma_list.pop(),
            )

        cur.execute(query)
        con.commit()

        print(Fore.GREEN + "Inserted Into Database" + Style.RESET_ALL)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)

    return


def insert_into_table():
    """
    Function to implement updation
    """
    try:
        print("1. Insert for a doctor")
        print("2. Insert for a nurse")
        print("3. Insert for a receptionist")
        print("4. Insert for a general staff")
        print("5. Insert for a patient")
        print("6. Insert for a department")
        print("7. Insert for a medical record")
        print("8. Insert for a invoice")
        print("9. Insert for a prescription")
        print("10. Insert for a medical history")
        print("11. Insert for a previous degree doctor")
        print("12. Insert for a previous degree nurse")
        print("13. Insert for a accountant")
        print("14. Insert for a monitors")
        print("15. Insert for a inventory")
        print("16. Insert for a patient billings")

        ch = int(input("Enter choice> "))
        tmp = sp.call("clear", shell=True)

        if ch == 1:
            new_Doctor()
        elif ch == 2:
            new_nurse()
        elif ch == 3:
            new_Receptionist()
        elif ch == 4:
            new_General_Staff()
        elif ch == 5:
            new_patient()
        elif ch == 6:
            new_dept()
        elif ch == 7:
            new_medical_record()
        elif ch == 8:
            new_invoice()
        elif ch == 9:
            new_Prescription()
        elif ch == 10:
            new_Medical_History()
        elif ch == 11:
            new_previous_degree_doctor()
        elif ch == 12:
            new_previous_degree_nurse()
        elif ch == 13:
            new_Accountant()
        elif ch == 14:
            new_Monitor()
        elif ch == 15:
            new_Inventory()
        elif ch == 16:
            new_Patient_Billing()
        else:
            print("Error: Invalid Option")

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)

def search_case(id):
    """
    Function to implement updation
    """
    try:
        query = f"SELECT Patient.Patient_Id, Patient.Name, Doctor.Doctor_Id, Doctor.Name, Invoice.Consultating_charges, Invoice.Operational_charges, Invoice.Medicinal_charges, Invoice.Transaction_id FROM (Medical_Record JOIN Patient ON Patient.Patient_Id=Medical_Record.Patient_Id) JOIN Doctor ON Doctor.Doctor_Id=Medical_Record.Doctor_Id JOIN Invoice ON Medical_Record.Case_Id=Invoice.Case_id WHERE Medical_Record.Case_Id={id}"

        cur.execute(query)
        con.commit()
        result = cur.fetchall()
        
        if not result:
            print(Fore.RED + "Error: Case ID does not exist or Result is empty" + Style.RESET_ALL)
            return
        
        printdictlist(result)
        print(Fore.GREEN + "Query Executed Successfully" + Style.RESET_ALL)
        
    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to execute query" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def all_details_of_case():
    """
    Function to implement updation
    """
    try:
        ch = int(input("enter Case ID:> "))
        tmp = sp.call("clear", shell=True)
        search_case(ch)
        # report_doctor_efficiency()
        
    except:
        con.rollback()
        print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def all_details_of_patient():
    """
    Function to implement updation
    """
    try:
        ch = int(input("Enter patient id:> "))
        query = f"SELECT Case_Id FROM Medical_Record WHERE Patient_Id={ch}"

        cur.execute(query)
        con.commit()
        result = cur.fetchall()

        if not result:
            print(Fore.RED + "Error: Patient ID does not exist" + Style.RESET_ALL)
            return

        # print(Fore.GREEN + "Query Executed Successfully" + Style.RESET_ALL)
        for i in result:
            search_case(i["Case_Id"])
        # printdictlist(result)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to execute query" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def find_avg(param):
    try:
        query = ""
        if param == 1:
            query = f"SELECT AVG(Paycheck) FROM Doctor"
        elif param == 2:
            query = f"SELECT AVG(Paycheck) FROM Nurse"
        elif param == 3:
            query = f"SELECT AVG(Paycheck) FROM Receptionist"
        elif param == 4:
            query = f"SELECT AVG(Weekly_wage) FROM General_Staff"
        elif param == 5:
            query = f"SELECT AVG(Consultating_charges + Operational_charges + Medicinal_charges) FROM Invoice"
        elif param == 6:
            query = f"SELECT AVG(Age) FROM Doctor"
        elif param == 7:
            query = f"SELECT Doctor_id,COUNT(*) AS Number_of_Cases FROM Medical_Record GROUP BY Doctor_id"

        cur.execute(query)
        con.commit()
        print(Fore.GREEN + "Executed Successfully" + Style.RESET_ALL)
        ans = cur.fetchall()
        printdictlist(ans)

    except:
        con.rollback()
        print(Fore.RED + "Failed to insert into database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def delete_handle():
    """
    Function to implement updation
    """
    try:
        print("1. Delete for a doctor")
        print("2. Delete for a nurse")
        print("3. Delete for a receptionist")
        print("4. Delete for a genral staff")
        print("5. Delete for a patient")
        print("6. Delete for a department")
        print("7. Delete for a medical record")
        print("8. Delete for a invoice")
        print("9. Delete for a prescription")
        print("10. Delete for a medical history")
        print("11. Delete for a previous degree doctor")
        print("12. Delete for a previous degree nurse")
        print("13. Delete for a accountant")
        print("14. Delete for a monitors")
        print("15. Delete for a inventory")
        print("16. Delete for a patient billings")  




        ch = int(input("Enter choice> "))
        tmp = sp.call("clear", shell=True)

        if ch == 1:
            delete_Doctor()
        elif ch == 2:
            delete_nurse()
        elif ch == 3:
            delete_Receptionist()
        elif ch == 4:
            delete_General_Staff()
        elif ch == 5:
            delete_patient()
        elif ch == 6:
            delete_dept()
        elif ch == 7:
            delete_medical_record()
        elif ch == 8:
            delete_invoice()
        elif ch == 9:
            delete_Prescription()
        elif ch == 10:
            delete_Medical_History()
        elif ch == 11:
            delete_Previous_Degrees_Doctor()
        elif ch == 12:
            delete_Previous_Degrees_Nurse()
        elif ch == 13:
            delete_Accountant()
        elif ch == 14:
            delete_Monitors()
        elif ch == 15:
            delete_Inventory()
        elif ch == 16:
            delete_Patient_Billing()
        else:
            print("Error: Invalid Option")

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to Delete from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def details_of_all_avg():
    print("1. option 1 for avg salary of doctor:")
    print("2. option 2 for avg salary of nurse:")
    print("3. option 3 for avg salary of receptionist:")
    print("4. option 4 for avg salary(weekly) of general_staff:")
    print("5. option 5 for avg bill:")
    print("6. option 6 for avg age of doctor:")
    print("7. option 7 for no_of_cases of doctors:")

    ch = int(input("enter choice:> "))
    tmp = sp.call("clear", shell=True)
    find_avg(ch)

def details_of_doctor_in_dept(dept_id):
    try:
        query = f"SELECT * FROM Doctor WHERE Department_Id={dept_id}"

        cur.execute(query)
        con.commit()
        print(Fore.GREEN + "Query Executed Successfully" + Style.RESET_ALL)
        ans = cur.fetchall()
        printdictlist(ans)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to Delete from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def details_doct_department():
    ch = int(input("enter department id:> "))
    tmp = sp.call("clear", shell=True)
    details_of_doctor_in_dept(ch)


def details_of_suc_case_of_doctor(doctor_id):
    try:
        query = f"SELECT Medical_Record.Case_id,Medical_Record.Patient_id FROM Doctor join Medical_Record on Medical_Record.Doctor_id=Doctor.Doctor_id WHERE Medical_Record.Doctor_id={doctor_id} AND Medical_Record.Status='SUCCESS'"
        cur.execute(query)
        con.commit()
        print(Fore.GREEN + "Query Executed Successfully" + Style.RESET_ALL)
        ans = cur.fetchall()
        printdictlist(ans)

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to Delete from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def details_success_case():
    ch = int(input("enter doctor id:> "))
    tmp = sp.call("clear", shell=True)
    details_of_suc_case_of_doctor(ch)


def report_doctor_efficiency():
    """
    Function to generate a report on doctor efficiency in each department,
    including doctors with zero patients.
    """
    try:
        query = """
        SELECT 
            Doctor.Name AS Doctor_Name, 
            Department.Department_Name, 
            COUNT(DISTINCT Patient.Patient_ID) AS Total_Patients, 
            COALESCE(AVG(Medical_Record.Total_visits), 0) AS Avg_Visits
        FROM 
            Doctor
        LEFT JOIN 
            Medical_Record ON Doctor.Doctor_ID = Medical_Record.Doctor_ID
        LEFT JOIN 
            Patient ON Medical_Record.Patient_ID = Patient.Patient_ID
        JOIN 
            Department ON Doctor.Department_ID = Department.Department_Id
        GROUP BY 
            Doctor.Name, Department.Department_Name;
        """
        
        cur.execute(query)
        con.commit()
        result = cur.fetchall()
        
        if not result:
            print(Fore.RED + "No data found for the report." + Style.RESET_ALL)
            return
        
        for row in result:
            if row['Total_Patients'] == 0:
                print(f"Doctor {row['Doctor_Name']} from {row['Department_Name']} has not treated any patients.")
        
        printdictlist(result)
        print(Fore.GREEN + "Report Generated Successfully" + Style.RESET_ALL)
        
    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to generate the report" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def report_total_hospital_charges():
    """
    Function to generate a report on total hospital charges incurred by each patient,
    including consultation, operational, and medicinal charges.
    """
    try:
        query = """
        SELECT 
            Patient.Name AS Patient_Name, 
            SUM(Invoice.Consultating_charges + 
                Invoice.Operational_charges + 
                Invoice.Medicinal_charges) AS Total_Charges
        FROM 
            Patient
        JOIN 
            Medical_Record ON Patient.Patient_ID = Medical_Record.Patient_ID
        JOIN 
            Invoice ON Medical_Record.Case_Id = Invoice.Case_Id
        GROUP BY 
            Patient.Name;
        """
        
        cur.execute(query)
        con.commit()
        result = cur.fetchall()
        
        if not result:
            print(Fore.RED + "No data found for the report." + Style.RESET_ALL)
            return
        
        printdictlist(result)
        print(Fore.GREEN + "Report Generated Successfully" + Style.RESET_ALL)
        
    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to generate the report" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)



def update_Doctor():
    """
    Function to implement updation
    """
    try:
        print("Enter the Field to Update: ")
        print("1. Paycheck")
        print("2. Address")
        print("3. Phone No")

        ch = int(input("Enter choice> "))
        tmp = sp.call("clear", shell=True)
        Doctor_ID = int(input("Enter Doctor_ID: "))
        
        # Check if Doctor_ID exists
        query = f"SELECT Doctor_Id FROM Doctor WHERE Doctor_Id = {Doctor_ID}"
        cur.execute(query)
        con.commit()
        result = cur.fetchone()
        if not result:
            raise ValueError("Doctor ID not found in the database.")
        
        if ch == 1:
            Paycheck = input("Enter Paycheck: ")
            query = "UPDATE Doctor SET Paycheck = {} WHERE Doctor_Id = {}".format(
                Paycheck,
                Doctor_ID,
            )

            cur.execute(query)
            con.commit()
            print(Fore.GREEN + "Updated Sucessfully" + Style.RESET_ALL)
        elif ch == 2:
            Address = input("Enter Address: ")
            query = "UPDATE Doctor SET Address = '{}' WHERE Doctor_Id = {}".format(
                Address,
                Doctor_ID,
            )

            cur.execute(query)
            con.commit()
            print(Fore.GREEN + "Updated Sucessfully" + Style.RESET_ALL)
        elif ch == 3:
            Phone_no = input("Enter Phone_no: ")
            query = "UPDATE Doctor SET Phone_no = {} WHERE Doctor_Id = {}".format(
                Phone_no,
                Doctor_ID,
            )

            cur.execute(query)
            con.commit()
            print(Fore.GREEN + "Updated Sucessfully" + Style.RESET_ALL)
        else:
            print("Error: Invalid Option")

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to update from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def update_nurse():
    """
    Function to implement updation
    """
    try:
        print("Enter the Field to Update: ")
        print("1. Paycheck")
        print("2. Department Id")

        ch = int(input("Enter choice> "))
        tmp = sp.call("clear", shell=True)
        Nurse_id = int(input("Enter Nurse_id: "))
        
        # Check if Nurse_id exists
        query = f"SELECT Nurse_Id FROM Nurse WHERE Nurse_Id = {Nurse_id}"
        cur.execute(query)
        con.commit()
        result = cur.fetchone()
        if not result:
            raise ValueError("Nurse ID not found in the database.")
        
        if ch == 1:
            Paycheck = input("Enter Paycheck: ")
            query = "UPDATE Nurse SET Paycheck = {} WHERE Nurse_Id = {}".format(
                Paycheck,
                Nurse_id,
            )

            cur.execute(query)
            con.commit()
            print(Fore.GREEN + "Updated Sucessfully" + Style.RESET_ALL)
        elif ch == 2:
            Department_Id = input("Enter Department Id: ")
            query = "UPDATE Nurse SET Department_Id = {} WHERE Nurse_Id = {}".format(
                Department_Id,
                Nurse_id,
            )

            cur.execute(query)
            con.commit()
            print(Fore.GREEN + "Updated Sucessfully" + Style.RESET_ALL)
        else:
            print("Error: Invalid Option")

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to update from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def update_Receptionist():
    """
    Function to implement updation
    """
    try:
        print("Enter the Field to Update: ")
        print("1. Paycheck") 

        ch = int(input("Enter choice> "))
        tmp = sp.call("clear", shell=True)
        Receptionist_id = int(input("Enter Receptionist_id: "))
        
        # Check if Receptionist_id exists
        query = f"SELECT Receptionist_id FROM Receptionist WHERE Receptionist_id = {Receptionist_id}"
        cur.execute(query)
        con.commit()
        result = cur.fetchone()
        if not result:
            raise ValueError("Receptionist ID not found in the database.")
        
        if ch == 1:
            Paycheck = input("Enter Paycheck: ")
            query = (
                "UPDATE Receptionist SET Paycheck = {} WHERE Receptionist_id = {}".format(
                    Paycheck,
                    Receptionist_id,
                )
            )

            cur.execute(query)
            con.commit()
            print(Fore.GREEN + "Updated Sucessfully" + Style.RESET_ALL)

        else:
            print("Error: Invalid Option")

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to update from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)

def update_inventory():
    try:
        print("Enter the Field to Update: ")
        print("1. Avalailble Stock") 

        ch = int(input("Enter choice> "))
        tmp = sp.call("clear", shell=True)
        Item_Name = input("Enter Item_Name: ")
        
        # Check if Item_Name exists
        query = f"SELECT Item_Name FROM Inventory WHERE Item_Name = '{Item_Name}'"
        cur.execute(query)
        con.commit()
        result = cur.fetchone()
        if not result:
            raise ValueError("Item Name not found in the database.")    
        
        if ch == 1:
            Available_Stock = input("Enter Available_Stock: ")
            query = (
                "UPDATE Inventory SET Available_Stock = {} WHERE Item_Name = '{}'".format(
                    Available_Stock,
                    Item_Name,
                )
            )

            cur.execute(query)
            con.commit()
            print(Fore.GREEN + "Updated Sucessfully" + Style.RESET_ALL)

        else:
            print("Error: Invalid Option")

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to update from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)
    
    

def update_staff():
    """
    Function to implement updation
    """
    try:
        print("Enter the Field to Update: ")
        print("1. Hourly wage")
        print("2. Weekly hours")
        print("3. Shift")

        ch = int(input("Enter choice> "))
        tmp = sp.call("clear", shell=True)
        Staff_id = int(input("Enter Staff_Id: "))
        
        # Check if Staff_id exists
        query = f"SELECT Staff_Id FROM General_Staff WHERE Staff_Id = {Staff_id}"
        cur.execute(query)
        con.commit()
        result = cur.fetchone()
        if not result:
            raise ValueError("Staff ID not found in the database.")
        
        if ch == 1:
            salary_per_hour = input("Enter Hourly Wage: ")
            query = (
                "UPDATE General_Staff SET Hourly_wage = {} WHERE Staff_Id = {}".format(
                    salary_per_hour,
                    Staff_id,
                )
            )

            cur.execute(query)
            con.commit()
            print(Fore.GREEN + "Updated Sucessfully" + Style.RESET_ALL)
        elif ch == 2:
            Weekly_Hours = input(
                "Enter Weekly_Hours: "
            )
            query = "UPDATE General_Staff SET Weekly_Hours = {} WHERE Staff_Id = {}".format(
                Weekly_Hours,
                Staff_id,
            )

            cur.execute(query)
            con.commit()
            print(Fore.GREEN + "Updated Sucessfully" + Style.RESET_ALL)
        elif ch == 3:
            Shift = int(input("Enter Shift (1/2): "))
            if Shift not in [1, 2]:
                raise ValueError("Invalid Shift")
            query = "UPDATE General_Staff SET Shift = {} WHERE Staff_Id = {}".format(
                Shift,
                Staff_id,
            )

            cur.execute(query)
            con.commit()
            print(Fore.GREEN + "Updated Sucessfully" + Style.RESET_ALL)
        else:
            print("Error: Invalid Option")

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to update from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def update_patient():
    """
    Function to implement updation
    """
    try:
        print("Enter the Field to Update: ")
        print("1. Phone No")

        ch = int(input("Enter choice> "))
        tmp = sp.call("clear", shell=True)
        Patient_ID = int(input("Enter Patient_ID: "))
        
        # Check if Patient_ID exists
        query = f"SELECT Patient_Id FROM Patient WHERE Patient_Id = {Patient_ID}"
        cur.execute(query)
        con.commit()
        result = cur.fetchone()
        if not result:
            raise ValueError("Patient ID not found in the database.")    
        
        if ch == 1:
            Phone_no = input("Enter Phone_no: ")
            query = (
                "UPDATE Patient SET Phone_no = {} WHERE Patient_Id = {}".format(
                    Phone_no,
                    Patient_ID,
                )
            )

            cur.execute(query)
            con.commit()
            print(Fore.GREEN + "Updated Sucessfully" + Style.RESET_ALL)
        else:
            print("Error: Invalid Option")

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to update from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def update_cases():
    """
    Function to implement updation
    """
    try:
        print("Enter the Field to Update: ")
        print("1. Total visits")
        print("2. Recent visit")
        print("3. Next Appointment")
        print("4. Status")

        ch = int(input("Enter choice> "))
        tmp = sp.call("clear", shell=True)
        Case_id = int(input("Enter Case_id: "))
        
        # Check if Case_id exists
        query = f"SELECT Case_Id FROM Medical_Record WHERE Case_Id = {Case_id}"
        cur.execute(query)
        con.commit()
        result = cur.fetchone()
        if not result:
            raise ValueError("Case ID not found in the database.")
        
        if ch == 1:
            Number_of_visits = input("Enter Total_visits: ")
            query = "UPDATE Medical_Record SET Total_visits = {} WHERE Case_Id = {}".format(
                Number_of_visits,
                Case_id,
            )

            cur.execute(query)
            con.commit()
            print(Fore.GREEN + "Updated Sucessfully" + Style.RESET_ALL)
        elif ch == 2:
            Recent_visit = input("Enter Recent_visit: ")
            query = "UPDATE Medical_Record SET Recent_visit = '{}' WHERE Case_Id = {}".format(
                Recent_visit,
                Case_id,
            )

            cur.execute(query)
            con.commit()
            print(Fore.GREEN + "Updated Sucessfully" + Style.RESET_ALL)
        elif ch == 3:
            Next_Appointment = input("Enter Next_Appointment: ")
            query = (
                "UPDATE Medical_Record SET Next_Appointment = '{}' WHERE Case_Id = {}".format(
                    Next_Appointment,
                    Case_id,
                )
            )

            cur.execute(query)
            con.commit()
            print(Fore.GREEN + "Updated Sucessfully" + Style.RESET_ALL)
        elif ch == 4:
            Status = input("Enter Status: ")
            query = "UPDATE Medical_Record SET Status = '{}' WHERE Case_Id = {}".format(
                Status,
                Case_id,
            )

            cur.execute(query)
            con.commit()
            print(Fore.GREEN + "Updated Sucessfully" + Style.RESET_ALL)
        else:
            print("Error: Invalid Option")

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to update from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)





def update_handle():
    """
    Function to implement updation
    """
    try:
        print("1. Update for a Doctor")
        print("2. Update for a Nurse")
        print("3. Update for a Receptionist")
        print("4. Update for a General Staff")
        print("5. Update for a Patient")
        print("6. Update for a Case")
        print("7. Update for a Inventory")

        ch = int(input("Enter choice> "))
        tmp = sp.call("clear", shell=True)

        if ch == 1:
            update_Doctor()
        elif ch == 2:
            update_nurse()
        elif ch == 3:
            update_Receptionist()
        elif ch == 4:
            update_staff()
        elif ch == 5:
            update_patient()
        elif ch == 6:
            update_cases()
        elif ch == 7:
            update_inventory()

        

        else:
            print("Error: Invalid Option")

    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to update from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)



def list_of_workers():
    ch = int(input("Enter shift> "))
    tmp = sp.call("clear", shell=True)

    query = f"select Name from General_Staff where Shift={ch}"

    cur.execute(query)
    con.commit()
    # print("Query Executed Successfully")
    ans = cur.fetchall()
    printdictlist(ans)


def max_salary():
    ch = int(input("Enter department id> "))
    tmp = sp.call("clear", shell=True)

    query = f"select max(Paycheck) from Doctor where Department_Id={ch}"

    cur.execute(query)
    con.commit()
    # print("Query Executed Successfully")
    ans = cur.fetchall()
    printdictlist(ans)


def next_month():
    try:
        query = "SELECT Name,Phone_no FROM Patient JOIN Medical_Record ON Medical_Record.Patient_Id=Patient.Patient_id WHERE DATEDIFF(Medical_Record.Next_Appointment,CURDATE())<= 30 AND DATEDIFF(Medical_Record.Next_Appointment,CURDATE())>=0"

        cur.execute(query)
        con.commit()
        print(Fore.GREEN + "Query Executed Successfully" + Style.RESET_ALL)
        ans = cur.fetchall()
        printdictlist(ans)

    except:
        con.rollback()
        print(Fore.RED + "Failed to update from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)
        
def search_doctors_with_substring():
    """
    Function to search and print details of doctors whose name contains a user-provided substring.
    """
    try:
        substring = input("Enter the substring to search for in doctor names: ")
        query = f"SELECT * FROM Doctor WHERE Name LIKE '%{substring}%'"
        cur.execute(query)
        con.commit()
        result = cur.fetchall()
        if not result:
            print(Fore.RED + f"Error: No doctors found with '{substring}' in their name" + Style.RESET_ALL)
        else:
            printdictlist(result)
            print(Fore.GREEN + "Search Successful" + Style.RESET_ALL)
    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to search from database" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)

def print_the_table():
        """
        Function to print the contents of a specified table.
        """
        try:
            print("Enter the table to print: ")
            print("1. Doctor")
            print("2. Nurse")
            print("3. Receptionist")
            print("4. General Staff")
            print("5. Patient")
            print("6. Department")
            print("7. Medical Record")
            print("8. Invoice")
            print("9. Prescription")
            print("10. Medical History")
            print("11. Previous Degrees Doctor")
            print("12. Previous Degrees Nurse")
            print("13. Accountant")
            print("14. Monitors")
            print("15. Inventory")
            print("16. Patient Billing")
            print("17. Medication_Issuance")
            print("18. Surgery_Assignment")
            print("19. Specialist")

            ch = int(input("Enter choice> "))
            tmp = sp.call("clear", shell=True)

            table_name = ""
            if ch == 1:
                table_name = "Doctor"
            elif ch == 2:
                table_name = "Nurse"
            elif ch == 3:
                table_name = "Receptionist"
            elif ch == 4:
                table_name = "General_Staff"
            elif ch == 5:
                table_name = "Patient"
            elif ch == 6:
                table_name = "Department"
            elif ch == 7:
                table_name = "Medical_Record"
            elif ch == 8:
                table_name = "Invoice"
            elif ch == 9:
                table_name = "Prescription"
            elif ch == 10:
                table_name = "Medical_History"
            elif ch == 11:
                table_name = "Previous_Degrees_Doctor"
            elif ch == 12:
                table_name = "Previous_Degrees_Nurse"
            elif ch == 13:
                table_name = "Accountant"
            elif ch == 14:
                table_name = "Monitors"
            elif ch == 15:
                table_name = "Inventory"
            elif ch == 16:
                table_name = "Patient_Billing"
            elif ch ==17:
                table_name = "Medication_Issuance"
            elif ch ==18:
                table_name = "Surgery_Assignment"
            elif ch ==19:
                table_name = "Specialist"
            else:
                print("Error: Invalid Option")
                return

            query = f"SELECT * FROM {table_name}"
            cur.execute(query)
            con.commit()
            result = cur.fetchall()
            if not result:
                print(Fore.RED + f"Error: No records found in {table_name}" + Style.RESET_ALL)
            else:
                printdictlist(result)
                print(Fore.GREEN + f"Table {table_name} printed successfully" + Style.RESET_ALL)

        except Exception as e:
            con.rollback()
            print(Fore.RED + "Failed to print the table" + Style.RESET_ALL)
            print(">>>>>>>>>>>>>", e)
            
def patients_with_past_medical_cases():
    """
    Function to print all details of patients whose past medical records are greater than or equal to 5.
    """
    try:
        query = """
        SELECT Patient.*, COUNT(Medical_Record.Case_Id) AS Total_Cases
        FROM Patient
        JOIN Medical_Record ON Patient.Patient_Id = Medical_Record.Patient_Id
        GROUP BY Patient.Patient_Id
        HAVING Total_Cases >= 2
        """
        cur.execute(query)
        con.commit()
        result = cur.fetchall()
        if not result:
            print(Fore.RED + "No patients found with past medical records >= 5" + Style.RESET_ALL)
        else:
            printdictlist(result)
            print(Fore.GREEN + "Query Executed Successfully" + Style.RESET_ALL)
    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to execute query" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)
        
def avg_age_doctor():
    """
    Function to get the average age of doctors.
    """
    try:
        query = "SELECT AVG(Age) AS Avg_Age FROM Doctor"
        cur.execute(query)
        con.commit()
        result = cur.fetchone()
        if result:
            print(f"Average Age of Doctors: {result['Avg_Age']}")
        else:
            print(Fore.RED + "No data found." + Style.RESET_ALL)
    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to execute query" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)
              
def sum_hourly_wage_worker():
    """
    Function to get the sum of hourly wages of workers.
    """
    try:
        query = "SELECT SUM(Hourly_wage) AS Total_Hourly_Wage FROM General_Staff"
        cur.execute(query)
        con.commit()
        result = cur.fetchone()
        if result:
            print(f"Total Hourly Wage of Workers: {result['Total_Hourly_Wage']}")
        else:
            print(Fore.RED + "No data found." + Style.RESET_ALL)
    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to execute query" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)
              
def max_paycheck_nurse():
    """
    Function to get the maximum paycheck of nurses.
    """
    try:
        query = "SELECT MAX(Paycheck) AS Max_Paycheck FROM Nurse"
        cur.execute(query)
        con.commit()
        result = cur.fetchone()
        if result:
            print(f"Maximum Paycheck of Nurses: {result['Max_Paycheck']}")
        else:
            print(Fore.RED + "No data found." + Style.RESET_ALL)
    except Exception as e:
        con.rollback()
        print(Fore.RED + "Failed to execute query" + Style.RESET_ALL)
        print(">>>>>>>>>>>>>", e)


def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if ch == 1:
        insert_into_table()
    elif ch == 2:
        delete_handle()
    elif ch == 3:
        search()
    elif ch == 4:
        all_details_of_case()
    elif ch == 5:
        # all_details_of_patient()
        report_doctor_efficiency()
    elif ch == 6:
        details_of_all_avg()
    elif ch == 7:
        details_doct_department()
    elif ch == 8:
        details_success_case()
    elif ch == 9:
        update_handle()
    elif ch == 11:
        list_of_workers()
    elif ch == 12:
        next_month()
    elif ch == 13:
        max_salary()
    elif ch==14:    
        report_total_hospital_charges()
    elif ch==15:
        print_the_table()
    elif ch==16:
        search_doctors_with_substring()
    elif ch==17:
        patients_with_past_medical_cases()
    elif ch==18:
        avg_age_doctor()
    elif ch==19:
        sum_hourly_wage_worker()
    elif ch==20:
        max_paycheck_nurse()
    else:
        print("Error: Invalid Option")


# Global
while 1:
    tmp = sp.call("clear", shell=True)

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server
        con = pymysql.connect(
            host="localhost",
            port=3306,
            user="root",
            password='devjk',
            db="Hospital_Management_System",
            cursorclass=pymysql.cursors.DictCursor,
        )
        
        tmp = sp.call("clear", shell=True)

        if con.open:
            print(Fore.YELLOW + "Connected" + Style.RESET_ALL)
        else:
            print(Fore.RED + "Failed to connect")

        tmp = input(Fore.BLUE + "Enter any key to CONTINUE>" + Style.RESET_ALL)

        with con.cursor() as cur:
            while 1:
                tmp = sp.call("clear", shell=True)
                # Here taking example of Employee Mini-world
                print("1. Option 1 for Insert")
                print("2. Option 2 for Delete")  # Fire an Employee
                print("3. Option 3 for Search")  # Promote Employee
                print("4. Option 4 for all details of case")
                print("5. Option 5 for Doctor Efficiency in Each Department")
                print("6. Option 6 for all details of average salary")
                print("7. Option 7 for all details of doctor in Department")
                print("8. Option 8 for all details of SUCCESS case of doctor")
                print("9. Option 9 for Update")
                print("11. Option 11 for list of current working workers")
                print(
                    "12. option 12 for list of patient whose appointment within next month"
                )
                print("13. For displaying maximum salary of doctor in a department")
                print("14. For displaying total hospital charges incurred by each patient")
                print("15. Printing the Table")
                print("16. Search doctors with substring")
                print("17. Patient with past medical cases greater than or equal to 2")
                print("18. Average age of doctors")
                print("19. Sum of hourly wage of workers")
                print("20. Maximum paycheck of nurses")
                print("21. Exit")
                ch = int(input(Fore.YELLOW + "Enter choice> " + Style.RESET_ALL))
                tmp = sp.call("clear", shell=True)
                if ch == 21:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input(
                        Fore.BLUE + "Enter any key to CONTINUE>" + Style.RESET_ALL
                    )

    except Exception as e:
        tmp = sp.call("clear", shell=True)
        print(e)
        print(
            Fore.RED
            + "Connection Refused: Either username or password is incorrect or user doesn't have access to database"
            + Style.RESET_ALL
        )
        tmp = input("Enter any key to CONTINUE>")