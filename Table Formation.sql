			### Creating Database ###
CREATE DATABASE TFQ;
USE TFQ;			-- To use into created database

	/* 
	To delete the dabase use following query
	DROP DATABASE TFQ;
	*/
			
            ### Creating Table ###
CREATE TABLE ADDRESS
(ADDRESS_ID VARCHAR(20) PRIMARY KEY
, CITY VARCHAR (50)
, STATE VARCHAR (50)
);
DESCRIBE ADDRESS;	-- Describes names, data types, constraint of column

	/* 
	To delete the table use following query
	DROP TABLE ADDRESS;
	*/


CREATE TABLE SCHOOL
(SCHOOL_ID VARCHAR(20) PRIMARY KEY
, SCHOOL_NAME VARCHAR (50)
, ADDRESS_ID VARCHAR(20)
, CONSTRAINT FK_SCHOOL_ADDR FOREIGN KEY (ADDRESS_ID) REFERENCES ADDRESS(ADDRESS_ID)
);

			## Creating Table With Existing Table Name ##
CREATE TABLE IF NOT EXISTS SCHOOL
(SCHOOL_ID VARCHAR(20) PRIMARY KEY
, SCHOOL_NAME VARCHAR (50)
);									-- It will show that table already exist

CREATE TABLE STAFF
(STAFF_ID VARCHAR(20) PRIMARY KEY
, FIRST_NAME VARCHAR(50) NOT NULL
, LAST_NAME VARCHAR(50) NOT NULL
, SCHOOL_ID VARCHAR(20)
, ADDRESS_ID VARCHAR(20)
, GENDER VARCHAR (10) CHECK (GENDER IN ('M', 'F', 'MALE', 'FEMALE'))
, AGE INT
, DOB date
, CONSTRAINT FK_STAFF_SCHL FOREIGN KEY (SCHOOL_ID) REFERENCES SCHOOL (SCHOOL_ID)
);

/*Constraints can be added while defining column name and data type or after defining all the columns*/
			
			## Alter Constraint ##
ALTER TABLE STAFF ADD CONSTRAINT FK_STAFF_ADDR FOREIGN KEY(ADDRESS_ID) REFERENCES ADDRESS(ADDRESS_ID);

CREATE TABLE IF NOT EXISTS STAFF_SALARY
( STAFF_ID VARCHAR(20) PRIMARY KEY
, SALARY FLOAT
, CURRENCY VARCHAR(5)
);

		## DROP COLUMN ##
ALTER TABLE STAFF_SALARY DROP COLUMN CURRENCY;

CREATE TABLE STUDENT
( ID VARCHAR(20) PRIMARY KEY
, FIRST_NAME VARCHAR(50) NOT NULL
, LAST_NAME VARCHAR(50) NOT NULL
, GENDER VARCHAR (10) CHECK (GENDER IN ('M', 'F', 'MALE', 'FEMALE'))
, AGE INT
, DOB date
, GRADE FLOAT
);

			## Alter Commands ##
ALTER TABLE STUDENT MODIFY COLUMN GRADE INT(5);
ALTER TABLE STUDENT DROP COLUMN GRADE;			-- Deleting Entire Column
ALTER TABLE STUDENT RENAME TO STUDENTS;

			### Inserting Values In Table ###
            # Method 1 #
INSERT INTO ADDRESS VALUES
    ('ADR1001','Baton Rouge','Louisiana'),
    ('ADR1002','Richmond','Virginia'),
    ('ADR1003','Dallas','Texas'),
    ('ADR1004','Roanoke','Virginia'),
    ('ADR1005','Atlanta','Georgia'),
    ('ADR1006','Seattle','Washington'),
    ('ADR1007','San Diego','California'),
    ('ADR1008','Rochester','New York'),
    ('ADR1009','Naples','Florida'),
    ('ADR1010','Houston','Texas')
;

			# Method 2 #
INSERT INTO SCHOOL (SCHOOL_ID, SCHOOL_NAME, ADDRESS_ID)
VALUES ('SCHL1001', 'NOBLE SCHOOL', 'ADR1001')
;

INSERT INTO STAFF VALUES 
('STF2004', 'Shamala', 'Devi', 'SCHL1001', 'ADR1002', 'F','56', '1964-03-16')
,('STF1001', 'Violet', 'Mascarenhas', 'SCHL1001', 'ADR1003', 'F', '33', '1987-07-02')
,('STF1002', 'Shaheen', 'Maryam', 'SCHL1001', 'ADR1004', 'F', '55', '1965-02-02')
,('STF1003', 'Thelma', 'Silva', 'SCHL1001', 'ADR1005', 'F', '56', '1964-03-03')
,('STF1011', 'Eugine', 'Rebello', 'SCHL1001', 'ADR1006', 'F', '45', '1975-04-24')
,('STF1012', 'Cynthia', 'Sequeira', 'SCHL1001', 'ADR1007', 'F', '48', '1972-10-26')
,('STF1013', 'Veena', 'Bhat', 'SCHL1001', 'ADR1008', 'F', '37', '1983-04-20')
,('STF1021', 'Nelson', 'Dsouza', 'SCHL1001', 'ADR1009', 'M', '35', '1985-05-25')
,('STF1022', 'Mariat', 'Rodrigues', 'SCHL1001', 'ADR1010', 'F', '40', '1980-06-18')
;

INSERT INTO STAFF_SALARY (STAFF_ID, SALARY) VALUES
('STF2004','15000')
,('STF1001','8000')
,('STF1002','7000')
,('STF1003','6000')
,('STF1011','11000')
,('STF1012','9000')
,('STF1013','5000')
,('STF1021','7000')
,('STF1022','8000')
;

 INSERT INTO STUDENTS VALUES
        ('STD10001','Lindy','O''Connell','Male',6,'2014-01-13'),
        ('STD10002','Madison','Walder','Male',6,'2014-01-19'),
        ('STD10003','Marve','Sheaber','Male',6,'2014-03-11'),
        ('STD10004','Jesselyn','Greaterex','Female',6,'2014-03-31'),
        ('STD10005',' Ariel','Kipling','Male',6,'2014-02-02'),
        ('STD10006','Hilary','Mordey','Female',7,'2013-04-20'),
        ('STD10007','Tull','Meeus','Male',7,'2013-04-10'),
        ('STD10008','Ank','Doppler','Male',7,'2013-03-16'),
        ('STD10009','Swa', 'Mannering','Female',8,'2012-03-15'),
        ('STD10010','Leigh','Pendre','Female',8,'2012-04-06')
;

			## Update ##
UPDATE STUDENTS
SET FIRST_NAME='ROBERT' WHERE ID='STD10001';

/* 
As safe mode is on, one can change the content in row using primary key only
     To turn OFF safe mode use followimg command
     SET  SQL_SAFE_UPDATES=0;
     To turn it back ON
     SET  SQL_SAFE_UPDATES=1;
*/

		## Deleting Entire Row ##
DELETE FROM STUDENTS 
WHERE  ID='STD10001';