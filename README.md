💊 Pharmacy Management System (MySQL Database Project)
📘 Overview

The Pharmacy Management System is a comprehensive relational database designed to manage the operations of a pharmacy.
It handles medicines, prescriptions, doctors, patients, suppliers, sales, staff, inventory, and payments efficiently using SQL.

This project provides a robust backend database that ensures data consistency, integrity, and easy scalability for real-world pharmacy use.

⚙️ Features

🧾 Medicine Management – Track medicines, batches, expiry, and categories.

🧍‍♂️ Patient & Doctor Records – Maintain complete profiles and prescriptions.

💰 Sales & Payment Tracking – Handle sales transactions and multiple payment methods.

🏭 Supplier & Order Management – Manage supplier information, orders, and stock replenishment.

👨‍⚕️ Prescription Module – Record detailed prescription information issued by doctors.

👷 Staff Management – Manage pharmacy employees and their roles/shifts.

📦 Inventory Control – Keep real-time stock records of all medicines.

🏗️ Database Design
📄 Total Tables — 16
No.	Table Name	Description
1	Category	Stores medicine categories (e.g., Antibiotic, Painkiller)
2	Medicine	Contains medicine details and manufacturer info
3	Medicine_Quantity	Tracks available stock quantity per medicine
4	Patient	Stores patient details
5	Doctor	Stores doctor details and specialization
6	Prescription	Prescription header table linking patient and doctor
7	Prescription_Details	Contains medicines and dosage under each prescription
8	Sales	Tracks pharmacy sales transactions
9	Sales_Details	Records medicines sold in each sale
10	Supplier	Supplier information with contact details
11	Inventory	Records stock supplied and last stocked date
12	Staff	Pharmacy staff details with contact and salary info
13	Staff_Roles	Defines roles for each staff member
14	Orders	Tracks purchase orders to suppliers
15	Order_Details	Medicines ordered with quantity info
16	Payment	Stores sales payment details and status
🧩 Database Schema Overview

One-to-Many → Category → Medicine

One-to-One → Medicine ↔ Medicine_Quantity

One-to-Many → Patient → Prescription

One-to-Many → Prescription → Prescription_Details

One-to-Many → Sales → Sales_Details

One-to-Many → Supplier → Orders

Many-to-Many (via bridge tables)

Orders ↔ Medicine (through Order_Details)

Sales ↔ Medicine (through Sales_Details)

💾 How to Run the Project
Step 1: Create Database
CREATE DATABASE pharmacy_db;
USE pharmacy_db;

Step 2: Import Tables and Data

Copy the provided .sql file into MySQL Workbench or phpMyAdmin and execute it.
This will:

Create all 16 tables

Insert 20 realistic sample records per table

Step 3: Verify Tables
SHOW TABLES;
SELECT * FROM Medicine LIMIT 10;

📊 Example Queries
1️⃣ View all expired medicines
SELECT name, expiry_date 
FROM Medicine
WHERE expiry_date < CURDATE();

2️⃣ List total sales per patient
SELECT p.name AS Patient, SUM(sd.quantity * m.price) AS Total_Amount
FROM Sales_Details sd
JOIN Sales s ON sd.sale_id = s.sale_id
JOIN Patient p ON s.patient_id = p.patient_id
JOIN Medicine m ON sd.medicine_id = m.medicine_id
GROUP BY p.name;

3️⃣ Find low-stock medicines
SELECT m.name, q.quantity
FROM Medicine m
JOIN Medicine_Quantity q ON m.medicine_id = q.medicine_id
WHERE q.quantity < 50;

🧠 Technologies Used

Database: MySQL 8.0+

Language: SQL (DDL & DML)

Tools: MySQL Workbench / phpMyAdmin

Platform: Windows / Linux

🧑‍💻 Author

Dhruv Parsana
🎓 B.Tech – Computer Engineering, PDEU
