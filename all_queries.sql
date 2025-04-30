CREATE TABLE Patient_Details (
AadharID VARCHAR(12) PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
Age int NOT NULL,
Street VARCHAR(200),
House VARCHAR(100),
City VARCHAR(100),
Primary_Physician VARCHAR(12)
);
CREATE TABLE Doctor_Details (
AadharID VARCHAR(12) PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
Specialization VARCHAR(100),
Experience int NOT NULL
);
CREATE TABLE pharmaceutical_company (
company_name VARCHAR(100) PRIMARY KEY,
Phone_Number VARCHAR(15)
);
CREATE TABLE Drug (
Trade_Name VARCHAR(100) PRIMARY KEY ,
Formula VARCHAR(200),
Manufacturer VARCHAR(100)
);
CREATE TABLE Pharmacy (
Pharmacy_Name VARCHAR(100) PRIMARY KEY,
Phone VARCHAR(15),
Street VARCHAR(200),
City VARCHAR(100)
);
CREATE TABLE Pharmacy_DrugList (
Pharmacy_Name VARCHAR(100) ,
Drug_Name VARCHAR(100),
Price decimal(10, 2),Drug_Quantity int,
PRIMARY KEY (Pharmacy_Name, Drug_Name)
);
CREATE TABLE Prescription (
PrescriptionID int PRIMARY KEY,
Patient_Aadhar VARCHAR(12),
Doctor_Aadhar VARCHAR(12),
PrescriptionDate DATE NOT NULL -- Renamed from "Date" to "PrescriptionDate"
);
CREATE TABLE Prescription_Details (
PrescriptionID int,
Drug_Name VARCHAR(100),
Quantity int,
PRIMARY KEY (PrescriptionID, Drug_Name)
);
-- Table: Contracts
CREATE TABLE Contracts (
Pharmacy_Name VARCHAR(100),
Pharma_Pharmaceutical VARCHAR(100),
StartDate DATE,
EndDate DATE,
Supervisor VARCHAR(100),
PRIMARY KEY (Pharmacy_Name, Pharma_Pharmaceutical)
);
CREATE OR REPLACE PROCEDURE Add_Patient(p_patient_id in VARCHAR,p_patientname
in VARCHAR,
p_age in int, p_street in VARCHAR,p_house in VARCHAR, p_city in VARCHAR,p_primaryphy in
VARCHAR) AS
BEGIN
INSERT INTO Patient_Details
VALUES(p_patient_id,p_patientname,p_age,p_street,p_house,p_city,p_primaryphy);
END;
/
CREATE OR REPLACE PROCEDURE Add_Doctor(d_doc_id in VARCHAR,d_name in
VARCHAR,d_special in VARCHAR,d_yoe in int) AS
BEGIN
INSERT INTO Doctor_Details VALUES(d_doc_id,d_name,d_special,d_yoe);
END;
/
CREATE OR REPLACE PROCEDURE Add_Pharmaceutical(pharl_name in
VARCHAR,pharl_phone in VARCHAR) AS
BEGIN
INSERT INTO pharmaceutical_company VALUES(pharl_name,pharl_phone);
END;
/
CREATE OR REPLACE PROCEDURE Add_Pharmacy(phar_name in VARCHAR,phar_phone
in VARCHAR,phar_street in VARCHAR,phar_city in VARCHAR) AS
BEGIN
INSERT INTO Pharmacy VALUES(phar_name,phar_phone,phar_street,phar_city);
END;
/
CREATE OR REPLACE PROCEDURE Add_Drug (drug_name in VARCHAR,drug_formula in
VARCHAR,drug_manu in VARCHAR) AS
BEGIN
INSERT INTO Drug VALUES(drug_name,drug_formula,drug_manu);
END;
/
CREATE or REPLACE PROCEDURE Add_Druglist(list_pharname in VARCHAR,list_drugname
in VARCHAR,list_price in decimal,list_qt in int) AS
BEGIN
insert into Pharmacy_DrugList VALUES(list_pharname,list_drugname,list_price,list_qt);
END;
/
CREATE or REPLACE PROCEDURE Add_Prescription(pres_id in int,pres_pid in
VARCHAR,pres_did in VARCHAR,pres_date in DATE) AS
BEGIN
INSERT INTO Prescription VALUES(pres_id,pres_pid,pres_did,pres_date);
END;
/
CREATE or REPLACE PROCEDURE Add_PrescriptionDetails(pres_id in int,pres_drug in
VARCHAR,pres_qt in int) AS
BEGIN
INSERT INTO Prescription_Details VALUES(pres_id,pres_drug,pres_qt);
END;
/
CREATE or REPLACE PROCEDURE Add_Contract(p_pcy in VARCHAR,p_pcl in
VARCHAR,p_st in DATE,p_end in DATE,p_sup in VARCHAR) AS
BEGIN
INSERT INTO Contracts VALUES(p_pcy,p_pcl,p_st,p_end,p_sup);
END;
/
CREATE OR REPLACE PROCEDURE Update_Patient(
p_aadhar IN VARCHAR,
p_name IN VARCHAR,
p_age IN INT,
p_street IN VARCHAR,
p_house IN VARCHAR,
p_city IN VARCHAR,
p_primaryphy IN VARCHAR
) AS
BEGIN
UPDATE Patient_Details
SET Name = p_name,
Age = p_age,
Street = p_street,
House = p_house,
City = p_city,
Primary_Physician = p_primaryphy
WHERE AadharID = p_aadhar;
END;
/
CREATE OR REPLACE PROCEDURE Update_Doctor(
d_aadhar IN VARCHAR,
d_name IN VARCHAR,
d_special IN VARCHAR,
d_exp IN INT
) AS
BEGIN
UPDATE Doctor_Details
SET Name = d_name,
Specialization = d_special,
Experience = d_exp
WHERE AadharID = d_aadhar;
END;
/
CREATE OR REPLACE PROCEDURE Update_Pharmaceutical(
pharl_name IN VARCHAR,
pharl_phone IN VARCHAR
) AS
BEGIN
UPDATE pharmaceutical_company
SET Phone_Number = pharl_phone
WHERE company_name = pharl_name;
END;
/
CREATE OR REPLACE PROCEDURE Update_Drug(
drug_name IN VARCHAR,
drug_formula IN VARCHAR,
drug_manu IN VARCHAR
) AS
BEGIN
UPDATE Drug
SET Formula = drug_formula,
Manufacturer = drug_manu
WHERE Trade_Name = drug_name;
END;
/
CREATE OR REPLACE PROCEDURE Update_Pharmacy(
phar_name IN VARCHAR,
phar_phone IN VARCHAR,
phar_street IN VARCHAR,
phar_city IN VARCHAR
) AS
BEGIN
UPDATE Pharmacy
SET Phone = phar_phone,
Street = phar_street,
City = phar_city
WHERE Pharmacy_Name = phar_name;
END;
/
CREATE OR REPLACE PROCEDURE Update_Druglist(
list_pharname IN VARCHAR,
list_drugname IN VARCHAR,
list_price IN DECIMAL,
list_qt IN INT
) AS
BEGIN
UPDATE Pharmacy_DrugList
SET Price = list_price,
Drug_Quantity = list_qt
WHERE Pharmacy_Name = list_pharname AND Drug_Name = list_drugname;
END;
/
CREATE OR REPLACE PROCEDURE Update_Prescription(
pres_id IN INT,
pres_pid IN VARCHAR,
pres_did IN VARCHAR,
pres_date IN DATE
) AS
BEGIN
UPDATE Prescription
SET Patient_Aadhar = pres_pid,
Doctor_Aadhar = pres_did,
PrescriptionDate = pres_date
WHERE PrescriptionID = pres_id;
END;
/
CREATE OR REPLACE PROCEDURE Update_PrescriptionDetails(
pres_id IN INT,
pres_drug IN VARCHAR,
pres_qt IN INT
) AS
BEGIN
UPDATE Prescription_Details
SET Quantity = pres_qt
WHERE PrescriptionID = pres_id AND Drug_Name = pres_drug;
END;
/
CREATE OR REPLACE PROCEDURE Update_Contract(
p_pcy IN VARCHAR,
p_pcl IN VARCHAR,
p_st IN DATE,
p_end IN DATE,
p_sup IN VARCHAR
) AS
BEGIN
UPDATE Contracts
SET StartDate = p_st,
EndDate = p_end,
Supervisor = p_sup
WHERE Pharmacy_Name = p_pcy AND Pharma_Pharmaceutical = p_pcl;
END;
/
CREATE OR REPLACE PROCEDURE Delete_Patient(del_p in VARCHAR) AS
BEGIN
DELETE FROM Patient_Details where AadharID=del_p;
END;
/
CREATE OR REPLACE PROCEDURE Delete_Doctor(del_c in VARCHAR) AS
BEGIN
DELETE FROM Doctor_Details where AadharID=del_c;
END;
/
CREATE OR REPLACE PROCEDURE Delete_Pharmaceutical(del_pl in VARCHAR) AS
BEGIN
DELETE FROM pharmaceutical_company where company_name=del_pl;
END;
/
CREATE OR REPLACE PROCEDURE Delete_Pharmacy(del_py in VARCHAR) AS
BEGIN
DELETE FROM Pharmacy where Pharmacy_Name=del_py;
END;
/
CREATE OR REPLACE PROCEDURE Delete_Drug(del_drug in VARCHAR) AS
BEGIN
DELETE FROM Drug where Trade_Name=del_drug;
END;
/
CREATE OR REPLACE PROCEDURE Delete_PharmacyDrug(del_py in VARCHAR,del_drug in
VARCHAR) AS
BEGIN
DELETE FROM Pharmacy_DrugList where Pharmacy_Name=del_py and
drug_name=del_drug;
END;
/
CREATE OR REPLACE PROCEDURE Delete_Prescription(del_pres in int) AS
BEGIN
DELETE FROM Prescription where PrescriptionID=del_pres;
END;
/
CREATE OR REPLACE PROCEDURE Delete_Contract(del_pharmacy in
VARCHAR,del_pharmaceutical in VARCHAR) AS
BEGIN
DELETE FROM Contracts where Pharmacy_Name=del_pharmacy AND
Pharma_Pharmaceutical=del_pharmaceutical;
END;
/
BEGIN
Add_Doctor('D00123456789', 'Dr. Sameer Reddy', 'Cardiology', 15);
Add_Doctor('D00234567890', 'Dr. Neha Verma', 'Pediatrics', 10);
Add_Doctor('D00345678901', 'Dr. Arjun Mehta', 'General Medicine', 8);
Add_Doctor('D00456789012', 'Dr. Kavya Sinha', 'Dermatology', 6);
END;
/
BEGIN
Add_Patient('P00123456789', 'Rohit Sharma', 30, 'Banjara Hills', 'H-12', 'Hyderabad',
'D00123456789');
Add_Patient('P00234567890', 'Anita Desai', 45, 'Connaught Place', 'F-45', 'Delhi',
'D00234567890');
Add_Patient('P00345678901', 'Vikram Patel', 55, 'Santacruz West', 'G-21', 'Mumbai',
'D00345678901');
Add_Patient('P00456789012', 'Meera Iyer', 27, 'T Nagar', 'A-10', 'Chennai', 'D00123456789');
Add_Patient('P00567890123', 'Aman Kapoor', 33, 'FC Road', 'L-3', 'Pune', 'D00345678901');
Add_Patient('P00678901234', 'Priya Reddy', 40, 'Jubilee Hills', 'M-8', 'Hyderabad',
'D00123456789');
Add_Patient('P00789012345', 'Karan Joshi', 50, 'Sector 21', 'C-6', 'Noida', 'D00345678901');
END;
/
BEGIN
Add_Pharmaceutical('Pfizer', '1800-111-111');
Add_Pharmaceutical('Sun Pharma', '1800-222-222');
Add_Pharmaceutical('Cipla', '1800-333-333');
END;
/
BEGIN
Add_Drug('Panadol', 'Paracetamol 500mg', 'Pfizer');
Add_Drug('Zithromax', 'Azithromycin 250mg', 'Pfizer');
Add_Drug('Lipitor', 'Atorvastatin 20mg', 'Pfizer');
Add_Drug('Revital', 'Multivitamin + Ginseng', 'Sun Pharma');
Add_Drug('Allegra', 'Fexofenadine 180mg', 'Sun Pharma');
Add_Drug('Disprin', 'Aspirin 350mg', 'Sun Pharma');
Add_Drug('Ciplox', 'Ciprofloxacin 500mg', 'Cipla');
Add_Drug('Asthalin', 'Salbutamol 100mcg', 'Cipla');
Add_Drug('Levolin', 'Levosalbutamol 50mcg', 'Cipla');
Add_Drug('Montair', 'Montelukast 10mg', 'Cipla');
END;
/
BEGIN
Add_Pharmacy('Apollo', '040-2223344', 'Plot 12, Banjara Hills', 'Hyderabad');
Add_Pharmacy('MedPlus', '011-2345678', '123, Connaught Place', 'Delhi');
Add_Pharmacy('HealStations', '022-9988776', '7th Road, Santacruz', 'Mumbai');
Add_Pharmacy('PharmEasy', '020-5544332', 'FC Road', 'Pune');
END;
/
BEGIN
Add_Contract('Apollo', 'Pfizer', DATE '2024-01-01', DATE '2025-01-01', 'Dr. Sameer Reddy');
Add_Contract('Apollo', 'Cipla', DATE '2024-03-01', DATE '2025-03-01', 'Ms. Ananya Rao');
END;
/
BEGIN
Add_Prescription(101, 'P00123456789', 'D00123456789', TO_DATE('2025-03-10',
'YYYY-MM-DD'));
Add_Prescription(102, 'P00234567890', 'D00234567890', TO_DATE('2025-03-12',
'YYYY-MM-DD'));
Add_Prescription(103, 'P00345678901', 'D00345678901', TO_DATE('2025-03-14',
'YYYY-MM-DD'));
Add_Prescription(104, 'P00456789012', 'D00456789012', TO_DATE('2025-03-18',
'YYYY-MM-DD'));
Add_Prescription(105, 'P00567890123', 'D00345678901', TO_DATE('2025-03-20',
'YYYY-MM-DD'));
Add_Prescription(106, 'P00678901234', 'D00123456789', TO_DATE('2025-03-21',
'YYYY-MM-DD'));
Add_Prescription(107, 'P00789012345', 'D00234567890', TO_DATE('2025-03-25',
'YYYY-MM-DD'));
END;
/
BEGIN
Add_PrescriptionDetails(101, 'Panadol', 10);
Add_PrescriptionDetails(101, 'Lipitor', 15);
Add_PrescriptionDetails(102, 'Zithromax', 6);
Add_PrescriptionDetails(102, 'Revital', 20);
Add_PrescriptionDetails(103, 'Allegra', 12);
Add_PrescriptionDetails(103, 'Disprin', 8);
Add_PrescriptionDetails(104, 'Ciplox', 10);
Add_PrescriptionDetails(104, 'Asthalin', 5);
Add_PrescriptionDetails(105, 'Levolin', 14);
Add_PrescriptionDetails(106, 'Montair', 10);
Add_PrescriptionDetails(106, 'Panadol', 5);
Add_PrescriptionDetails(107, 'Zithromax', 7);
Add_PrescriptionDetails(107, 'Allegra', 10);
END;
/
BEGIN
Add_Druglist('Apollo', 'Panadol', 18.50, 200);
Add_Druglist('Apollo', 'Zithromax', 45.00, 120);
Add_Druglist('Apollo', 'Lipitor', 85.00, 75);
Add_Druglist('Apollo', 'Ciplox', 29.00, 160);
Add_Druglist('Apollo', 'Asthalin', 22.00, 90);
Add_Druglist('Apollo', 'Montair', 38.00, 140);
Add_Druglist('Apollo', 'Allegra', 55.00, 110);
Add_Druglist('Apollo', 'Revital', 95.00, 60);
Add_Druglist('Apollo', 'Disprin', 10.00, 250);
Add_Druglist('Apollo', 'Levolin', 26.50, 130);
END;
/
BEGIN
Add_Druglist('MedPlus', 'Panadol', 20.00, 180);
Add_Druglist('MedPlus', 'Disprin', 12.00, 200);
Add_Druglist('MedPlus', 'Montair', 35.00, 150);
Add_Druglist('MedPlus', 'Asthalin', 25.00, 100);
Add_Druglist('MedPlus', 'Lipitor', 88.00, 85);
Add_Druglist('MedPlus', 'Zithromax', 48.00, 130);
Add_Druglist('MedPlus', 'Ciplox', 32.00, 110);
Add_Druglist('MedPlus', 'Allegra', 59.00, 75);
Add_Druglist('MedPlus', 'Levolin', 28.00, 120);
Add_Druglist('MedPlus', 'Revital', 90.00, 55);
END;
/
ALTER TABLE Drug
ADD CONSTRAINT FK_Manufacturer FOREIGN KEY (Manufacturer) REFERENCES
Pharmaceutical_Company(Company_Name) ON DELETE CASCADE;
ALTER TABLE Pharmacy_DrugList
ADD CONSTRAINT FK_Pharmacy FOREIGN KEY (Pharmacy_Name) REFERENCES
Pharmacy(Pharmacy_Name);
ALTER TABLE Pharmacy_DrugList
ADD CONSTRAINT FK_Drug FOREIGN KEY (Drug_Name) REFERENCES
Drug(Trade_Name);
ALTER TABLE Contracts
ADD CONSTRAINT FK_Contract_Pharmacy FOREIGN KEY (Pharmacy_Name)
REFERENCES Pharmacy(Pharmacy_Name);
ALTER TABLE Contracts
ADD CONSTRAINT FK_Contract_Company FOREIGN KEY (Pharma_Pharmaceutical)
REFERENCES Pharmaceutical_Company(Company_Name);
ALTER TABLE Patient_Details
ADD CONSTRAINT FK_Primary_Physician FOREIGN KEY (Primary_Physician)
REFERENCES Doctor_Details(AadharID) ;
ALTER TABLE Prescription
ADD CONSTRAINT fk_prescription_patient
FOREIGN KEY (Patient_Aadhar)
REFERENCES Patient_Details(AadharID)
ON DELETE CASCADE;
ALTER TABLE Prescription
ADD CONSTRAINT FK_Doctor_Aadhar FOREIGN KEY (Doctor_Aadhar) REFERENCES
Doctor_Details(AadharID) on DELETE CASCADE;
ALTER TABLE Prescription_Details
ADD CONSTRAINT FK_PrescriptionID FOREIGN KEY (PrescriptionID) REFERENCES
Prescription(PrescriptionID) on DELETE CASCADE;
CREATE OR REPLACE TRIGGER Min_Patient
FOR DELETE ON Patient_Details
COMPOUND TRIGGER
-- Declare a collection to track doctor IDs affected by the delete
TYPE DocIDList IS TABLE OF VARCHAR2(20) INDEX BY PLS_INTEGER;
doc_ids DocIDList;
counter INTEGER := 0;
BEFORE EACH ROW IS
BEGIN
-- Collect doctor IDs of patients being deleted
counter := counter + 1;
doc_ids(counter) := :OLD.Primary_Physician;
END BEFORE EACH ROW;
AFTER STATEMENT IS
doc_patient_count NUMBER;
BEGIN
-- After all rows are processed, check each doctor's patient count
FOR i IN 1 .. counter LOOP
SELECT COUNT(*) INTO doc_patient_count
FROM Patient_Details
WHERE Primary_Physician = doc_ids(i);
-- If any doctor has zero patients left, block the delete
IF doc_patient_count = 0 THEN
RAISE_APPLICATION_ERROR(
-20001,
'Cannot delete the only patient linked to doctor ID: ' || doc_ids(i)
);
END IF;
END LOOP;
dbms_output.put_line('Min patient trigger executed.');
END AFTER STATEMENT;
END Min_Patient;
/
CREATE OR REPLACE TRIGGER Min_Doctor
FOR DELETE ON Doctor_Details
COMPOUND TRIGGER
TYPE DocIDList IS TABLE OF VARCHAR2(20) INDEX BY PLS_INTEGER;
doctor_ids DocIDList;
counter INTEGER := 0;
BEFORE EACH ROW IS
BEGIN
-- Track doctor IDs being deleted
counter := counter + 1;
doctor_ids(counter) := :OLD.AadharID;
END BEFORE EACH ROW;
AFTER STATEMENT IS
linked_patient_count NUMBER;
BEGIN
-- After statement-level, check each doctor
FOR i IN 1 .. counter LOOP
SELECT COUNT(*) INTO linked_patient_count
FROM Patient_Details
WHERE Primary_Physician = doctor_ids(i);
IF linked_patient_count > 0 THEN
RAISE_APPLICATION_ERROR(
-20003,
'Cannot delete doctor ID ' || doctor_ids(i) ||
' — they are still assigned to ' || linked_patient_count || ' patient(s).'
);
END IF;
END LOOP;
dbms_output.put_line('Min_Doctor trigger executed.');
END AFTER STATEMENT;
END Min_Doctor;
/
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE Get_Prescription_Report (
p_patient_id IN VARCHAR2,
p_start_date IN DATE,
p_end_date IN DATE
)
IS
v_patient_name Patient_Details.Name%TYPE;
BEGIN
-- Fetch patient name
SELECT Name INTO v_patient_name
FROM Patient_Details
WHERE AadharID = p_patient_id;
-- Print report header
DBMS_OUTPUT.PUT_LINE('Printing Prescription Report for ' || v_patient_name ||
' (' || p_patient_id || ') between ' ||
TO_CHAR(p_start_date, 'DD-MON-YYYY') || ' and ' ||
TO_CHAR(p_end_date, 'DD-MON-YYYY'));
DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------');
DBMS_OUTPUT.PUT_LINE('PrescriptionID | Doctor Name | Drug Name |
Quantity');
DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------');
-- Fetch and display prescription records
FOR rec IN (
SELECT
pr.PrescriptionID,
TO_CHAR(pr.PrescriptionDate, 'DD-MON-YYYY') AS PrescDate,
d.Name AS Doctor_Name,
pd.Drug_Name,
pd.Quantity
FROM Prescription pr
JOIN Doctor_Details d ON pr.Doctor_Aadhar = d.AadharID
JOIN Prescription_Details pd ON pr.PrescriptionID = pd.PrescriptionID
WHERE pr.Patient_Aadhar = p_patient_id
AND pr.PrescriptionDate BETWEEN p_start_date AND p_end_date
ORDER BY pr.PrescriptionDate, pr.PrescriptionID
) LOOP
DBMS_OUTPUT.PUT_LINE(rec.PrescriptionID || ' | ' ||
RPAD(rec.Doctor_Name, 17) || ' | ' ||
RPAD(rec.Drug_Name, 13) || ' | ' ||
rec.Quantity);
END LOOP;
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('No patient found with Aadhar ID: ' || p_patient_id);
END;
/
CREATE OR REPLACE PROCEDURE Get_Prescription_By_Date (
p_patient_id IN VARCHAR2,
p_date IN DATE
)
IS
BEGIN
DBMS_OUTPUT.PUT_LINE('Prescription Details for Patient: ' || p_patient_id);
DBMS_OUTPUT.PUT_LINE('On Date: ' || TO_CHAR(p_date, 'DD-MON-YYYY'));
DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------');
DBMS_OUTPUT.PUT_LINE('PrescriptionID | Doctor Name | Drug Name |
Quantity');
DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------');
FOR rec IN (
SELECT
p.PrescriptionID,
d.Name AS DoctorName,
pd.Drug_Name,
pd.Quantity
FROM Prescription p
JOIN Doctor_Details d ON p.Doctor_Aadhar = d.AadharID
JOIN Prescription_Details pd ON p.PrescriptionID = pd.PrescriptionID
WHERE p.Patient_Aadhar = p_patient_id
AND p.PrescriptionDate = p_date
ORDER BY p.PrescriptionID
) LOOP
DBMS_OUTPUT.PUT_LINE(
RPAD(rec.PrescriptionID, 15) || ' | ' ||
RPAD(rec.DoctorName, 18) || ' | ' ||
RPAD(rec.Drug_Name, 14) || ' | ' ||
rec.Quantity
);
END LOOP;
END;
/
BEGIN
Get_Prescription_By_Date(
'P00123456789',
DATE '2025-03-10'
);
END;
/
BEGIN
Get_Prescription_Report('P00234567890', DATE'2025-03-01' , DATE'2025-03-20');
END;
/
CREATE OR REPLACE PROCEDURE Get_Contract_Details (
p_pharmacy_name IN VARCHAR2,
p_pharma_company IN VARCHAR2
)
IS
v_pharmacy_phone Pharmacy.Phone%TYPE;
v_pharmacy_street Pharmacy.Street%TYPE;
v_pharmacy_city Pharmacy.City%TYPE;
v_company_phone Pharmaceutical_Company.Phone_Number%TYPE;
v_start_date DATE;
v_end_date DATE;
v_supervisor VARCHAR2(100);
BEGIN
-- Fetch Pharmacy Details
SELECT Phone, Street, City INTO v_pharmacy_phone, v_pharmacy_street,
v_pharmacy_city
FROM Pharmacy
WHERE Pharmacy_Name = p_pharmacy_name;
-- Fetch Pharmaceutical Company Phone Number
SELECT Phone_Number INTO v_company_phone
FROM Pharmaceutical_Company
WHERE Company_Name = p_pharma_company;
-- Fetch Contract Details
SELECT StartDate, EndDate, Supervisor INTO v_start_date, v_end_date, v_supervisor
FROM Contracts
WHERE Pharmacy_Name = p_pharmacy_name
AND Pharma_Pharmaceutical = p_pharma_company;
-- Print Details
DBMS_OUTPUT.PUT_LINE('Contract Details for:');
DBMS_OUTPUT.PUT_LINE('Pharmacy: ' || p_pharmacy_name);
DBMS_OUTPUT.PUT_LINE(' Phone: ' || v_pharmacy_phone);
DBMS_OUTPUT.PUT_LINE(' Address: ' || v_pharmacy_street || ', ' || v_pharmacy_city);
DBMS_OUTPUT.PUT_LINE('Pharmaceutical Company: ' || p_pharma_company);
DBMS_OUTPUT.PUT_LINE(' Phone: ' || v_company_phone);
DBMS_OUTPUT.PUT_LINE('Contract Period: ' || TO_CHAR(v_start_date,
'DD-MON-YYYY') ||
' to ' || TO_CHAR(v_end_date, 'DD-MON-YYYY'));
DBMS_OUTPUT.PUT_LINE('Supervisor: ' || v_supervisor);
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('No contract found between ' || p_pharmacy_name || ' and '
|| p_pharma_company);
END;
/
BEGIN
Get_Contract_Details('Apollo','Pfizer');
END;
/
CREATE OR REPLACE PROCEDURE Stock_Pharmacy(p_phar_name in VARCHAR2) AS
BEGIN
DBMS_OUTPUT.PUT_LINE('Stock Position of ' || p_phar_name);
DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------');
DBMS_OUTPUT.PUT_LINE('Drug Name | Quantity');
DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------');
FOR drugone IN( SELECT Drug_Name,Drug_Quantity FROM Pharmacy_DrugList where
Pharmacy_Name=p_phar_name)
LOOP
DBMS_OUTPUT.PUT_LINE(drugone.Drug_Name || ' | ' || drugone.Drug_Quantity);
END LOOP;
END;
/
BEGIN
Stock_Pharmacy('Apollo');
END;
/
CREATE OR REPLACE PROCEDURE Get_Druglist (p_pharmacy_name IN VARCHAR2)
AS
BEGIN
-- Display header
DBMS_OUTPUT.PUT_LINE('Drugs available at ' || p_pharmacy_name || ' pharmacy:');
-- Fetch and display the drug list
FOR rec IN (
SELECT Drug_Name
FROM Pharmacy_DrugList
WHERE Pharmacy_Name = p_pharmacy_name
)
LOOP
DBMS_OUTPUT.PUT_LINE('- ' || rec.Drug_Name);
END LOOP;
END;
/
BEGIN
Get_Druglist('Apollo');
END;
/
CREATE OR REPLACE PROCEDURE Get_Patients(doc_id IN VARCHAR) AS
BEGIN
-- Display header
DBMS_OUTPUT.PUT_LINE('Patients under Doctor Aadhar ID: ' || doc_id);
-- Fetch and display patient list
FOR rec IN (
SELECT AadharID, Name
FROM Patient_Details
WHERE Primary_Physician = doc_id
)
LOOP
DBMS_OUTPUT.PUT_LINE('- ' || rec.AadharID || ' : ' || rec.Name);
END LOOP;
END;
/
BEGIN
Get_Patients('D00123456789');
END;
/
SHOW ERRORS;
CREATE OR REPLACE TRIGGER min_drugcount
FOR DELETE ON Pharmacy_DrugList
COMPOUND TRIGGER
-- Declare a collection to track the pharmacies affected by the delete
TYPE PharmacyList IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
pharmacy_names PharmacyList;
counter INTEGER := 0;
-- BEFORE DELETE: Collect the pharmacy names where drugs are being deleted
BEFORE EACH ROW IS
BEGIN
counter := counter + 1;
pharmacy_names(counter) := :OLD.Pharmacy_Name;
END BEFORE EACH ROW;
-- AFTER DELETE: Check if the deletion results in fewer than 10 drugs for any pharmacy
AFTER STATEMENT IS
pharmacy_drug_count NUMBER;
BEGIN
-- Loop through the collected pharmacy names and check drug count
FOR i IN 1 .. counter LOOP
-- Fetch the count of remaining drugs for the specific pharmacy
SELECT COUNT(*) INTO pharmacy_drug_count
FROM Pharmacy_DrugList
WHERE Pharmacy_Name = pharmacy_names(i);
-- If any pharmacy has fewer than 10 drugs, raise an error
IF pharmacy_drug_count < 10 THEN
-- Ensure the pharmacy name is printed correctly in the error message
RAISE_APPLICATION_ERROR(
-20003,
'Cannot delete drug. Pharmacy ' || pharmacy_names(i) || ' must have at least 10
drugs.'
);
END IF;
END LOOP;
END AFTER STATEMENT;
END min_drugcount;
/
BEGIN
Delete_PharmacyDrug('Apollo','Disprin');
END;
/