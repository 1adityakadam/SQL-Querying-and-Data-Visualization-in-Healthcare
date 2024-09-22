-- Part 1
-- table is only to be created if it does not already exist
CREATE TABLE IF NOT EXISTS hospitals (
    -- hospital name, city and doctor name considered maximum length
    -- hospital id added 
    hospital_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    hospital_name VARCHAR(50) NOT NULL,
    -- state must have only 2 letters
    state CHAR(2) NOT NULL, 
    city VARCHAR(30) NOT NULL,
    doctor VARCHAR(50) NOT NULL
);

-- table is only to be created if it does not already exist
CREATE TABLE IF NOT EXISTS doctors (
-- Add primary keys to doctors automatically incremented
    doctor_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    -- gender considered 15 characters here
    gender CHAR(15) NOT NULL,
    -- insurance considered 15 characters here
    insurance VARCHAR(15) NOT NULL,
    -- new patients considered 10 characters here
    new_patients VARCHAR(10) NOT NULL,
    -- name and specialtys are 30 characters long
    specialty_one VARCHAR(30),
    specialty_two VARCHAR(30),
    specialty_three VARCHAR(30),
    -- license is considered 3 characters here
    license VARCHAR(3) NOT NULL,
    -- phone should be 10 characters long
    phone CHAR(10) NOT NULL,
    -- insurance, new_patients, license - must have a check constraint
    CONSTRAINT chk_insurance CHECK (insurance IN ('Yes', 'No')),
    CONSTRAINT chk_new_patients CHECK (new_patients IN ('Yes', 'No')),
    CONSTRAINT chk_license CHECK (license IN ('MFT', 'PhD', 'MD'))
);

-- Part 2

INSERT INTO 
	doctors(name, gender, insurance, new_patients, specialty_one,
						specialty_two, specialty_three, license, phone)
VALUES 
	('Flora Martinez', 'Female', 'Yes', 'Yes', 'Diabetes', 'Cholesterol', 'immunology', 'MD', '8495776489'),
	('Andy James', 'Male', 'Yes', 'No', 'Hypertension', 'Diabetes', 'PTSD', 'PhD', '2340894766'),
	('Hannah Myers', 'Female', 'No', 'Yes', 'Diabetes', 'Hypertension', 'immunology', 'MD', '9907846574'),
	('Jane Huang', 'Female', 'Yes', 'Yes', 'Dermatology', 'Hypertension', 'immunology', 'MD', '4507856797'),
	('April Adams', 'Female', 'No', 'Yes', 'OCD', 'Hypertension', 'PTSD', 'MFT', '4507856797'),
	('Jon Schaffer', 'Male', 'Yes', 'No', 'BPD', 'immunology', 'Dermatology', 'PhD', '9907846574'),
	('Shauna West','Female', 'Yes', 'Yes', 'ADHD', 'immunology', 'OCD', 'MD', '8495776480'),
	('Juan Angelo', 'Male', 'No', 'Yes', 'Diabetes', 'immunology', 'Dermatology', 'MD', '4507856797'),
	('Christie Yang', 'Female', 'Yes', 'Yes', 'Autism', 'ADHD', 'OCD', 'PhD', '4507856796'),
	('Annika Neusler', 'Female', 'Yes', 'No', 'Addiction', 'Dermatology', 'PTSD', 'MFT', '9907846575'),
	('Simone Anderson', 'Female', 'No', 'No', 'Hypertension', 'Dermatology', 'PTSD', 'MD', '8304498765'),
	('Ted Nyguen', 'Male', 'Yes', 'Yes', 'ADHD', 'Hypertension', 'Allergy', 'PhD', '4301239990'),
	('Valentino Rossi', 'Male', 'Yes', 'Yes', 'Autism', 'Hypertension', 'Dermatology', 'MD', '8304498765'),
	('Jessica Armer', 'Female', 'No', 'Yes', 'PTSD', 'immunology', 'Dermatology', 'MD', '3330456612'),
	('Sid Michaels', 'Female', 'Yes', 'Yes', 'OCD', 'Allergy', 'Hypertension', 'MFT', '4301239997'),
	('Yen Waters', 'Male', 'Yes', 'Yes', 'Hypertension', 'Dermatology', 'ADHD', 'PhD', '4507856796'),
	('Ru Izaelia', 'Female', 'No', 'Yes', 'immunology', 'BPD', 'Allergy', 'MD', '4301239990'), 
	('Vishal Rao', 'Male', 'Yes', 'Yes', 'Dermatology', 'Diabetes', 'Hypertension', 'MD', '7305557894'),
	('Lana John', 'Female', 'Yes', 'Yes', 'Hypertension', 'Allergy', 'OCD', 'MFT', '7305557894'),
	('Izzie Geralt', 'Female', 'Yes', 'Yes', 'Dermatology', 'Addiction', 'Hypertension', 'MD', '4301239990'); 


INSERT INTO hospitals (hospital_name, state, city, doctor)

VALUES
    ('Van Holsen Community Hospital', 'CA', 'San Francisco', 'Flora Martinez'),
    ('Clear Water Services', 'CA', 'San Diego', 'Andy James'),
    ('Imagery Health', 'CA', 'Sacramento', 'Hannah Myers'),
    ('Blue Cross Clinic', 'CA', 'Los Angeles', 'Jane Huang'),
    ('Blue Cross Clinic', 'CA', 'Los Angeles', 'April Adams'),
    ('Imagery Health', 'CA', 'Sacramento', 'Jon Schaffer'),
    ('Van Holsen Community Hospital', 'CA', 'Long Beach', 'Shauna West'),
    ('Blue Cross Clinic', 'CA', 'Santa Barbara', 'Juan Angelo'),
    ('Blue Cross Clinic', 'CA', 'San Francisco', 'Christie Yang'),
    ('Imagery Health', 'CA', 'Auburn', 'Annika Neusler'),
    ('Holistic Health Services', 'CA', 'Santa Barbara', 'Simone Anderson'),
    ('Open Clinic', 'CA', 'San Jose', 'Ted Nyguen'),
    ('Holistic Health Services', 'CA', 'Santa Barbara', 'Valentino Rossi'),
    ('Clark Jamison Hospitals', 'CA', 'Fresno', 'Jessica Armer'),
    ('Open Clinic', 'CA', 'Oakland', 'Sid Michaels'),
    ('Blue Cross Clinic', 'CA', 'San Francisco', 'Yen Waters'),
    ('Open Clinic', 'CA', 'San Jose', 'Ru Izaelia'),
    ('Clear Minds Community', 'CA', 'Sacramento', 'Vishal Rao'),
    ('Clear Minds Community', 'CA', 'Sacramento', 'Lana John'),
    ('Open Clinic', 'CA', 'San Jose', 'Izzie Geralt');




-- row count of doctors table
SELECT COUNT(*) AS doctors_row_count
FROM doctors;

-- row counts of hospital table
SELECT COUNT(*) AS hospital_row_count
FROM hospitals;

-- add not null column in hospitals
ALTER TABLE hospitals
ADD COLUMN doctor_id INT NOT NULL;

UPDATE hospitals 
INNER JOIN doctors
ON hospitals.doctor = doctors.name 
SET hospitals.doctor_id = doctors.doctor_id;

-- Add foreignkey
ALTER TABLE hospitals
ADD CONSTRAINT foreignkey_doctor
FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id);

-- creating table specialties
CREATE TABLE IF NOT EXISTS specialties( 
    specialties_key serial PRIMARY KEY, 
    specialty_one VARCHAR(100),  
    specialty_two VARCHAR(100),  
    specialty_three VARCHAR(100), 
    doctor_id INTEGER, 
    CONSTRAINT fk_doctor      
	FOREIGN KEY(doctor_id) REFERENCES doctors(doctor_id));

INSERT INTO specialties(doctor_id, specialty_one, specialty_two, specialty_three)
SELECT doctor_id, specialty_one, specialty_two, specialty_three
FROM doctors;

-- drop columns from doctor table
ALTER TABLE doctors
DROP COLUMN specialty_one,
DROP COLUMN specialty_two,
DROP COLUMN specialty_three;

