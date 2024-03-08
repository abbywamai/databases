CREATE TABLE Doctors(
    doctor_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    doc_name VARCHAR(50),
    specialty VARCHAR(50),
);

CREATE TABLE Patients(
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50) NOT NULL,
    dob DATE,
    gender ENUM('Male','Female')
    doctor_id INT,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) 
);

CREATE TABLE Tests (
    test_id INT AUTO_INCREMENT PRIMARY KEY, 
    lab_name VARCHAR(100) NOT NULL, 
    lab_type VARCHAR(20) NOT NULL,
    patient_id INT,
    doctor_id INT,
    date TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Receipts(
    receipt_id  INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    test_id INT,
    total_amount DECIMAL(10, 2),
    receipt_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (test_id) REFERENCES Tests(test_id)
)

CREATE TABLE Results(
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    result DECIMAL(8,4),
    result_detail TEXT,
    doctor_id INT,
    test_id INT,
    patient_id INT,
    FOREIGN KEY (test_id) REFERENCES Tests(test_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN  KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

