alter table drug drop constraint fk_manufacturer;
alter table pharmacy_druglist drop constraint fk_pharmacy;
alter table pharmacy_druglist drop constraint fk_drug;
alter table contracts drop constraint fk_contract_pharmacy;
alter table contracts drop constraint fk_contract_company
--alter table patient_details drop constraint FK_Primary_Physician;
alter table prescription drop constraint fk_prescription_patient;
ALTER TABLE prescription drop constraint fk_doctor_aadhar;
ALTER TABLE Prescription_Details drop constraint FK_PrescriptionID;


drop table drug;
drop table pharmacy;
drop table pharmacy_druglist;
drop table prescription;
drop table prescription_details;
drop table contracts;
drop table pharmaceutical_company;
drop table patient_details;
drop table doctor_details;