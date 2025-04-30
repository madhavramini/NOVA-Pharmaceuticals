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