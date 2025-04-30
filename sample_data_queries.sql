exec Delete_Patient('P00901234567');

exec Add_Doctor('D00567890123', 'Dr. Isha Raj', 'Endocrinology', 12);


exec Add_Patient('P00890123456', 'Riya Sen', 36, 'Church Street', 'B-14', 'Bangalore', 'D00567890123');
exec Add_Patient('P00901234567', 'Aditya Khanna', 29, 'MG Road', 'D-18', 'Ahmedabad', 'D00567890123');

--exec Delete_Patient('P00890123456');
 exec Add_Drug('Neurobion', 'Vitamin B1+B6+B12', 'Sun Pharma');
exec Add_Druglist('Apollo', 'Neurobion', 52.00, 100);
 exec Add_Prescription(108, 'P00890123456', 'D00567890123', DATE '2025-04-10');
 exec  Add_PrescriptionDetails(108, 'Neurobion', 15);
 
 

exec  Add_Contract('MedPlus','Cipla', DATE '2024-02-01', DATE '2025-02-01', 'anna');

exec Stock_Pharmacy('MedPlus');
exec Get_Contract_Details('MedPlus','Cipla');

exec Add_Prescription(109, 'P00890123456', 'D00345678901', DATE '2025-04-10');
exec  Add_PrescriptionDetails(109, 'Panadol', 10);

exec Get_Prescription_By_Date('P00890123456', DATE '2025-04-10');


exec Add_Prescription(110, 'P00890123456', 'D00345678901', DATE '2025-04-20');
exec  Add_PrescriptionDetails(110, 'Montair', 11);

exec Get_Prescription_Report('P00890123456',DATE '2025-04-05',DATE '2025-04-30');