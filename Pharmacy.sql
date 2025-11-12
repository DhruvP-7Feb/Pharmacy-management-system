-- Pharmacy Management System - Full MySQL script
-- Run in MySQL Workbench or mysql CLI
-- Creates database, tables, and inserts 20 rows per table (realistic Indian-style data)

CREATE DATABASE IF NOT EXISTS pharmacy_db;
USE pharmacy_db;

-- Disable FK checks during bulk insert to avoid ordering issues
SET FOREIGN_KEY_CHECKS = 0;

-- ================
-- 1) Category (20 entries)
-- ================
DROP TABLE IF EXISTS Category;
CREATE TABLE Category (
    category_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (category_id)
);

INSERT INTO Category (name) VALUES
('Pain Relief'),
('Antibiotics'),
('Vitamins & Supplements'),
('Antiseptics'),
('Cough & Cold'),
('Allergy & Antihistamines'),
('Cardiovascular'),
('Diabetes'),
('Gastrointestinal'),
('Respiratory'),
('Dermatology'),
('Neurology'),
('Psychiatry'),
('Urology'),
('Gynecology'),
('Pediatrics'),
('Oncology'),
('Ophthalmology'),
('Orthopedics'),
('Miscellaneous');

-- ================
-- 2) Supplier (20 entries)
-- ================
DROP TABLE IF EXISTS Supplier;
CREATE TABLE Supplier (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    contact_person VARCHAR(100),
    contact_number VARCHAR(15) UNIQUE NOT NULL
);

INSERT INTO Supplier (name, contact_person, contact_number) VALUES
('Apex Pharma Distributors', 'Arun Mehta', '9134567000'),
('BioGenix India', 'Sita Reddy', '9134567001'),
('CureWell Distributors', 'Vijay Joshi', '9134567002'),
('Dharma Health Supplies', 'Priyanka Singh', '9134567003'),
('Elixir Medics Pvt Ltd', 'Kunal Sharma', '9134567004'),
('Futura Pharma Co', 'Neha Patel', '9134567005'),
('Global Health Traders', 'Rohit Nair', '9134567006'),
('Harmony Med Supplies', 'Anita Gupta', '9134567007'),
('Innovate Pharma Ltd', 'Suresh Kumar', '9134567008'),
('Jivan Lifecare', 'Meera Iyer', '9134567009'),
('Kshema Wellness', 'Ajay Rao', '9134567010'),
('Lotus Health Providers', 'Divya Menon', '9134567011'),
('MediCare Innovations', 'Rahul Sharma', '9134567012'),
('Nova Pharma Ventures', 'Sneha Desai', '9134567013'),
('Omega Health Solutions', 'Vikram Singh', '9134567014'),
('Prakriti Med Distributors', 'Pooja Thakur', '9134567015'),
('Quantum Pharma Services', 'Kavita Pillai', '9134567016'),
('Radiance Health Co', 'Arjun Dubey', '9134567017'),
('Sankalp Med Supplies', 'Tanvi Kapoor', '9134567018'),
('Tranquil Pharma Ltd', 'Manish Shetty', '9134567019');

-- ================
-- 3) Staff (20 entries)
-- ================
DROP TABLE IF EXISTS Staff;
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15) UNIQUE NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    shift_timing VARCHAR(50) NOT NULL
);

INSERT INTO Staff (name, contact_number, salary, shift_timing) VALUES
('Amit Sharma', '9145678000', 35000.00, 'Morning (08:00-16:00)'),
('Neha Patel', '9145678001', 32000.00, 'Evening (16:00-00:00)'),
('Rohan Gupta', '9145678002', 30000.00, 'Night (00:00-08:00)'),
('Priya Singh', '9145678003', 36000.00, 'Morning (08:00-16:00)'),
('Vikram Desai', '9145678004', 34000.00, 'Evening (16:00-00:00)'),
('Sneha Nair', '9145678005', 31000.00, 'Night (00:00-08:00)'),
('Karan Iyer', '9145678006', 33000.00, 'Morning (08:00-16:00)'),
('Anita Rao', '9145678007', 32500.00, 'Evening (16:00-00:00)'),
('Arjun Menon', '9145678008', 30500.00, 'Night (00:00-08:00)'),
('Pooja Kapoor', '9145678009', 37000.00, 'Morning (08:00-16:00)'),
('Siddharth Thakur', '9145678010', 34500.00, 'Evening (16:00-00:00)'),
('Riya Pillai', '9145678011', 31500.00, 'Night (00:00-08:00)'),
('Aditya Dubey', '9145678012', 30000.00, 'Morning (08:00-16:00)'),
('Shreya Shetty', '9145678013', 37500.00, 'Evening (16:00-00:00)'),
('Nikhil Verma', '9145678014', 33500.00, 'Night (00:00-08:00)'),
('Aishwarya Malhotra', '9145678015', 32000.00, 'Morning (08:00-16:00)'),
('Rahul Bose', '9145678016', 34500.00, 'Evening (16:00-00:00)'),
('Kavya Nair', '9145678017', 31000.00, 'Night (00:00-08:00)'),
('Yash Arora', '9145678018', 30000.00, 'Morning (08:00-16:00)'),
('Tanvi Sen', '9145678019', 38000.00, 'Evening (16:00-00:00)');

-- ================
-- 4) Medicine (20 entries)
-- ================
DROP TABLE IF EXISTS Medicine;
CREATE TABLE Medicine (
    medicine_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    batch_number VARCHAR(50) UNIQUE NOT NULL,
    manufacturer VARCHAR(255) NOT NULL,
    expiry_date DATE NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id) ON DELETE SET NULL
);

INSERT INTO Medicine (name, batch_number, manufacturer, expiry_date, price, category_id) VALUES
('Paracetamol 500mg', 'PARA00123', 'Pfizer', '2026-03-15', 5.99, 1),
('Ibuprofen 400mg', 'IBU45678', 'GSK', '2025-12-31', 7.49, 1),
('Amoxicillin 500mg', 'AMOX78901', 'Novartis', '2026-06-30', 12.99, 2),
('Vitamin C 500mg', 'VITC23456', 'Bayer', '2027-01-20', 9.99, 3),
('Aspirin 75mg', 'ASP98765', 'Johnson & Johnson', '2025-11-10', 4.50, 1),
('Ciprofloxacin 500mg', 'CIPRO54321', 'Merck', '2026-08-15', 15.75, 2),
('Metformin 500mg', 'METF11223', 'Sanofi', '2026-04-25', 8.25, 8),
('Omeprazole 20mg', 'OME45678', 'AstraZeneca', '2025-09-30', 10.50, 9),
('Loratadine 10mg', 'LORA78901', 'Teva', '2026-12-15', 6.99, 6),
('Cetirizine 10mg', 'CETI23456', 'Mylan', '2027-02-28', 7.25, 6),
('Levothyroxine 50mcg', 'LEVO98765', 'Abbott', '2026-05-10', 11.00, 7),
('Atorvastatin 10mg', 'ATOR54321', 'Pfizer', '2025-10-20', 14.99, 7),
('Lisinopril 10mg', 'LISI11223', 'GSK', '2026-07-31', 9.75, 7),
('Salbutamol Inhaler', 'SALB45678', 'Novartis', '2025-08-15', 13.50, 10),
('Doxycycline 100mg', 'DOXY78901', 'Bayer', '2026-09-30', 16.25, 2),
('Prednisolone 5mg', 'PRED23456', 'Merck', '2027-03-15', 12.00, 11),
('Hydrochlorothiazide 25mg', 'HYDR98765', 'Sanofi', '2026-01-31', 8.99, 7),
('Furosemide 40mg', 'FURO54321', 'AstraZeneca', '2025-12-10', 10.25, 9),
('Clopidogrel 75mg', 'CLOP11223', 'Teva', '2026-11-20', 13.75, 7),
('Azithromycin 500mg', 'AZIT78901', 'Pfizer', '2026-02-28', 17.99, 2);

-- ================
-- 5) Medicine_Quantity (20 entries for existing medicines)
-- ================
DROP TABLE IF EXISTS Medicine_Quantity;
CREATE TABLE Medicine_Quantity (
    medicine_id INT PRIMARY KEY,
    quantity INT NOT NULL,
    FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id) ON DELETE CASCADE
);

INSERT INTO Medicine_Quantity (medicine_id, quantity) VALUES
(1, 150),
(2, 120),
(3, 80),
(4, 200),
(5, 180),
(6, 60),
(7, 90),
(8, 110),
(9, 130),
(10, 140),
(11, 70),
(12, 85),
(13, 95),
(14, 100),
(15, 55),
(16, 75),
(17, 105),
(18, 115),
(19, 65),
(20, 50);

-- ================
-- 6) Patient (20 entries)
-- ================
DROP TABLE IF EXISTS Patient;
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    gender ENUM('Male','Female','Other') NOT NULL,
    contact_number VARCHAR(15) UNIQUE NOT NULL
);

INSERT INTO Patient (name, age, gender, contact_number) VALUES
('Aarav Sharma', 28, 'Male', '9123456780'),
('Priya Patel', 34, 'Female', '9123456781'),
('Rohan Gupta', 45, 'Male', '9123456782'),
('Sneha Reddy', 19, 'Female', '9123456783'),
('Vikram Singh', 52, 'Male', '9123456784'),
('Ananya Desai', 31, 'Female', '9123456785'),
('Karan Malhotra', 39, 'Male', '9123456786'),
('Neha Kapoor', 27, 'Female', '9123456787'),
('Arjun Rao', 60, 'Male', '9123456788'),
('Pooja Nair', 23, 'Female', '9123456789'),
('Siddharth Iyer', 41, 'Male', '9123456790'),
('Riya Menon', 36, 'Female', '9123456791'),
('Aditya Joshi', 29, 'Male', '9123456792'),
('Shreya Kulkarni', 48, 'Female', '9123456793'),
('Nikhil Thakur', 33, 'Male', '9123456794'),
('Aishwarya Pillai', 25, 'Female', '9123456795'),
('Rahul Dubey', 55, 'Male', '9123456796'),
('Kavya Shetty', 30, 'Female', '9123456797'),
('Yash Verma', 42, 'Male', '9123456798'),
('Tanvi Shah', 21, 'Female', '9123456799');

-- ================
-- 7) Doctor (20 entries)
-- ================
DROP TABLE IF EXISTS Doctor;
CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    specialization VARCHAR(255) NOT NULL,
    contact_number VARCHAR(15) UNIQUE NOT NULL
);

INSERT INTO Doctor (name, specialization, contact_number) VALUES
('Dr. Anil Sharma', 'Cardiologist', '9123457000'),
('Dr. Priya Kapoor', 'Pediatrician', '9123457001'),
('Dr. Rohan Mehta', 'Neurologist', '9123457002'),
('Dr. Sneha Reddy', 'Dermatologist', '9123457003'),
('Dr. Vikram Singh', 'Orthopedic Surgeon', '9123457004'),
('Dr. Ananya Desai', 'Gynecologist', '9123457005'),
('Dr. Karan Iyer', 'General Physician', '9123457006'),
('Dr. Neha Kapoor', 'Endocrinologist', '9123457007'),
('Dr. Arjun Rao', 'Oncologist', '9123457008'),
('Dr. Pooja Nair', 'Ophthalmologist', '9123457009'),
('Dr. Siddharth Iyer', 'Urologist', '9123457010'),
('Dr. Riya Menon', 'Psychiatrist', '9123457011'),
('Dr. Aditya Joshi', 'Gastroenterologist', '9123457012'),
('Dr. Shreya Kulkarni', 'ENT Specialist', '9123457013'),
('Dr. Nikhil Thakur', 'Nephrologist', '9123457014'),
('Dr. Aishwarya Pillai', 'Rheumatologist', '9123457015'),
('Dr. Rahul Dubey', 'Pulmonologist', '9123457016'),
('Dr. Kavya Shetty', 'Anesthesiologist', '9123457017'),
('Dr. Yash Verma', 'Cardiothoracic Surgeon', '9123457018'),
('Dr. Tanvi Shah', 'Pediatric Surgeon', '9123457019');

-- ================
-- 8) Prescription (20 entries)
-- ================
DROP TABLE IF EXISTS Prescription;
CREATE TABLE Prescription (
    prescription_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    issue_date DATE NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id) ON DELETE CASCADE
);

INSERT INTO Prescription (patient_id, doctor_id, issue_date) VALUES
(1, 1, '2025-01-15'),
(2, 2, '2025-02-20'),
(3, 3, '2025-03-10'),
(4, 4, '2025-04-05'),
(5, 5, '2025-05-12'),
(6, 6, '2025-06-18'),
(7, 7, '2025-07-22'),
(8, 8, '2025-08-30'),
(9, 9, '2025-09-15'),
(10, 10, '2025-10-01'),
(11, 11, '2025-11-05'),
(12, 12, '2025-12-10'),
(13, 13, '2026-01-15'),
(14, 14, '2026-02-20'),
(15, 15, '2026-03-25'),
(16, 16, '2025-01-20'),
(17, 17, '2025-02-25'),
(18, 18, '2025-03-30'),
(19, 19, '2025-04-10'),
(20, 20, '2025-05-15');

-- ================
-- 9) Prescription_Details (20 entries)
-- added quantity_prescribed column for clarity
-- ================
DROP TABLE IF EXISTS Prescription_Details;
CREATE TABLE Prescription_Details (
    prescription_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    prescription_id INT NOT NULL,
    medicine_id INT NOT NULL,
    dosage VARCHAR(50) NOT NULL,
    duration VARCHAR(50) NOT NULL,
    quantity_prescribed INT NOT NULL,
    FOREIGN KEY (prescription_id) REFERENCES Prescription(prescription_id) ON DELETE CASCADE,
    FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id) ON DELETE CASCADE
);

INSERT INTO Prescription_Details (prescription_id, medicine_id, dosage, duration, quantity_prescribed) VALUES
(1, 1, '500 mg', '5 days', 10),
(1, 2, '400 mg', '3 days', 9),
(2, 3, '500 mg', '7 days', 14),
(2, 4, '500 mg', '10 days', 20),
(3, 5, '75 mg', '30 days', 30),
(3, 6, '500 mg', '7 days', 14),
(4, 7, '500 mg', '30 days', 60),
(4, 8, '20 mg', '14 days', 14),
(5, 9, '10 mg', '10 days', 10),
(5, 10, '10 mg', '10 days', 10),
(6, 11, '50 mcg', '90 days', 90),
(6, 12, '10 mg', '30 days', 30),
(7, 13, '10 mg', '60 days', 60),
(7, 14, 'Inhaler 2 puffs', 'as needed', 1),
(8, 15, '100 mg', '7 days', 14),
(8, 16, '5 mg', '10 days', 20),
(9, 17, '25 mg', '30 days', 30),
(9, 18, '40 mg', '15 days', 15),
(10, 19, '75 mg', '30 days', 30),
(10, 20, '500 mg', '3 days', 6);

-- ================
-- 10) Inventory (20 entries)
-- ================
DROP TABLE IF EXISTS Inventory;
CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    medicine_id INT NOT NULL,
    supplier_id INT NOT NULL,
    last_stocked DATE NOT NULL,
    FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id) ON DELETE CASCADE,
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id) ON DELETE CASCADE
);

INSERT INTO Inventory (medicine_id, supplier_id, last_stocked) VALUES
(1, 1, '2025-01-10'),
(2, 2, '2025-02-15'),
(3, 3, '2025-03-20'),
(4, 4, '2025-04-25'),
(5, 5, '2025-05-30'),
(6, 6, '2025-06-05'),
(7, 7, '2025-07-10'),
(8, 8, '2025-08-15'),
(9, 9, '2025-09-20'),
(10, 10, '2025-10-25'),
(11, 11, '2025-11-30'),
(12, 12, '2025-12-05'),
(13, 13, '2026-01-10'),
(14, 14, '2026-02-15'),
(15, 15, '2026-03-20'),
(16, 16, '2026-04-15'),
(17, 17, '2026-05-20'),
(18, 18, '2026-06-25'),
(19, 19, '2026-07-30'),
(20, 20, '2026-08-05');

-- ================
-- 11) Orders (20 entries)
-- ================
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_id INT NOT NULL,
    order_date DATE NOT NULL,
    status ENUM('Pending','Completed','Cancelled') NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id) ON DELETE CASCADE
);

INSERT INTO Orders (supplier_id, order_date, status) VALUES
(1, '2025-01-15', 'Completed'),
(2, '2025-02-20', 'Pending'),
(3, '2025-03-10', 'Completed'),
(4, '2025-04-05', 'Cancelled'),
(5, '2025-05-12', 'Completed'),
(6, '2025-06-18', 'Pending'),
(7, '2025-07-22', 'Completed'),
(8, '2025-08-30', 'Completed'),
(9, '2025-09-15', 'Pending'),
(10, '2025-10-01', 'Completed'),
(11, '2025-11-05', 'Completed'),
(12, '2025-12-10', 'Pending'),
(13, '2026-01-15', 'Completed'),
(14, '2026-02-20', 'Pending'),
(15, '2026-03-25', 'Completed'),
(16, '2026-04-20', 'Cancelled'),
(17, '2026-05-25', 'Completed'),
(18, '2026-06-30', 'Pending'),
(19, '2026-07-15', 'Completed'),
(20, '2026-08-01', 'Pending');

-- ================
-- 12) Order_Details (20 entries)
-- ================
DROP TABLE IF EXISTS Order_Details;
CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    medicine_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id) ON DELETE CASCADE
);

INSERT INTO Order_Details (order_id, medicine_id, quantity) VALUES
(1, 1, 50),
(2, 2, 75),
(3, 3, 100),
(4, 4, 25),
(5, 5, 150),
(6, 6, 200),
(7, 7, 80),
(8, 8, 30),
(9, 9, 120),
(10, 10, 90),
(11, 11, 60),
(12, 12, 110),
(13, 13, 140),
(14, 14, 45),
(15, 15, 180),
(16, 16, 70),
(17, 17, 130),
(18, 18, 95),
(19, 19, 55),
(20, 20, 160);

-- ================
-- 13) Sales (20 entries)
-- ================
DROP TABLE IF EXISTS Sales;
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    sale_date DATE NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id) ON DELETE CASCADE
);

INSERT INTO Sales (patient_id, sale_date) VALUES
(1, '2025-01-15'),
(2, '2025-02-20'),
(3, '2025-03-10'),
(4, '2025-04-05'),
(5, '2025-05-12'),
(6, '2025-06-18'),
(7, '2025-07-22'),
(8, '2025-08-30'),
(9, '2025-09-15'),
(10, '2025-10-01'),
(11, '2025-11-05'),
(12, '2025-12-10'),
(13, '2026-01-15'),
(14, '2026-02-20'),
(15, '2026-03-25'),
(16, '2026-04-20'),
(17, '2026-05-25'),
(18, '2026-06-30'),
(19, '2026-07-15'),
(20, '2026-08-01');

-- ================
-- 14) Sales_Details (20 entries)
-- ================
DROP TABLE IF EXISTS Sales_Details;
CREATE TABLE Sales_Details (
    sale_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    sale_id INT NOT NULL,
    medicine_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (sale_id) REFERENCES Sales(sale_id) ON DELETE CASCADE,
    FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id) ON DELETE CASCADE
);

INSERT INTO Sales_Details (sale_id, medicine_id, quantity) VALUES
(1, 1, 20),
(2, 3, 10),
(3, 5, 15),
(4, 7, 30),
(5, 9, 25),
(6, 11, 30),
(7, 13, 20),
(8, 15, 10),
(9, 17, 30),
(10, 19, 30),
(11, 2, 12),
(12, 4, 20),
(13, 6, 14),
(14, 8, 10),
(15, 10, 8),
(16, 12, 5),
(17, 14, 6),
(18, 16, 3),
(19, 18, 4),
(20, 20, 2);

-- ================
-- 15) Payment (20 entries)
-- ================
DROP TABLE IF EXISTS Payment;
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    sale_id INT NOT NULL,
    payment_method ENUM('Cash','Credit Card','Debit Card','UPI','Net Banking') NOT NULL,
    payment_status ENUM('Pending','Completed','Failed') NOT NULL,
    FOREIGN KEY (sale_id) REFERENCES Sales(sale_id) ON DELETE CASCADE
);

INSERT INTO Payment (sale_id, payment_method, payment_status) VALUES
(1, 'Cash', 'Completed'),
(2, 'Credit Card', 'Completed'),
(3, 'Debit Card', 'Completed'),
(4, 'UPI', 'Pending'),
(5, 'Net Banking', 'Completed'),
(6, 'Cash', 'Completed'),
(7, 'Credit Card', 'Pending'),
(8, 'Debit Card', 'Completed'),
(9, 'UPI', 'Completed'),
(10, 'Net Banking', 'Completed'),
(11, 'Cash', 'Completed'),
(12, 'Credit Card', 'Completed'),
(13, 'Debit Card', 'Pending'),
(14, 'UPI', 'Completed'),
(15, 'Net Banking', 'Failed'),
(16, 'Cash', 'Completed'),
(17, 'Credit Card', 'Completed'),
(18, 'Debit Card', 'Completed'),
(19, 'UPI', 'Pending'),
(20, 'Net Banking', 'Completed');

-- ================
-- 16) Staff_Roles (20 entries)
-- ================
DROP TABLE IF EXISTS Staff_Roles;
CREATE TABLE Staff_Roles (
    staff_id INT NOT NULL,
    role VARCHAR(50) NOT NULL,
    PRIMARY KEY (staff_id, role),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id) ON DELETE CASCADE
);

INSERT INTO Staff_Roles (staff_id, role) VALUES
(1, 'Pharmacist'),
(2, 'Cashier'),
(3, 'Inventory Manager'),
(4, 'Assistant'),
(5, 'Supervisor'),
(6, 'Pharmacist'),
(7, 'Cashier'),
(8, 'Inventory Manager'),
(9, 'Assistant'),
(10, 'Supervisor'),
(11, 'Pharmacist'),
(12, 'Cashier'),
(13, 'Inventory Manager'),
(14, 'Assistant'),
(15, 'Supervisor'),
(16, 'Pharmacist'),
(17, 'Cashier'),
(18, 'Inventory Manager'),
(19, 'Assistant'),
(20, 'Supervisor');

-- Re-enable foreign key checks after inserts
SET FOREIGN_KEY_CHECKS = 1;

-- Final check: display counts (optional)
-- SELECT 'Category' as table_name, COUNT(*) as cnt FROM Category
-- UNION ALL SELECT 'Supplier', COUNT(*) FROM Supplier
-- UNION ALL SELECT 'Staff', COUNT(*) FROM Staff
-- UNION ALL SELECT 'Medicine', COUNT(*) FROM Medicine
-- UNION ALL SELECT 'Medicine_Quantity', COUNT(*) FROM Medicine_Quantity
-- UNION ALL SELECT 'Patient', COUNT(*) FROM Patient
-- UNION ALL SELECT 'Doctor', COUNT(*) FROM Doctor
-- UNION ALL SELECT 'Prescription', COUNT(*) FROM Prescription
-- UNION ALL SELECT 'Prescription_Details', COUNT(*) FROM Prescription_Details
-- UNION ALL SELECT 'Inventory', COUNT(*) FROM Inventory
-- UNION ALL SELECT 'Orders', COUNT(*) FROM Orders
-- UNION ALL SELECT 'Order_Details', COUNT(*) FROM Order_Details
-- UNION ALL SELECT 'Sales', COUNT(*) FROM Sales
-- UNION ALL SELECT 'Sales_Details', COUNT(*) FROM Sales_Details
-- UNION ALL SELECT 'Payment', COUNT(*) FROM Payment
-- UNION ALL SELECT 'Staff_Roles', COUNT(*) FROM Staff_Roles;
