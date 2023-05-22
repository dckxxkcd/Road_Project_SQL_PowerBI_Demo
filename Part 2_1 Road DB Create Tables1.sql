Use [Road_Project_New]

CREATE TABLE Employee(
    -- basic personal data types not null to enable identification
    Employee_ID      VARCHAR(10) PRIMARY KEY,
    First_Name       VARCHAR(40) NOT NULL,
    Last_Name        VARCHAR(40) NOT NULL,
    Emp_Start_Date   Date NOT NULL,
    Emp_End_Date	 Date,
	EMP_DOB          Date NOT NULL,
    EMP_Gender       VARCHAR(2),
    Postal_Address   VARCHAR(100),
    EMP_Phone_No     VARCHAR(15),
    EMP_email        VARCHAR(30),
	Reports_To		 VARCHAR(10),
	CONSTRAINT Reports_To_fk FOREIGN KEY (Reports_To) REFERENCES Employee(Employee_ID)
    );

CREATE TABLE Project (
   -- Primary Key codes are normally set to 9-character length in all tables except Employee (which is a random 10 digit), so that database can handle bigger numbers as volume grows.
    Project_ID           VARCHAR(9) PRIMARY KEY,
    Proj_Name            VARCHAR(50),
    Proj_Start           Date,
    Proj_Complete        Date,
    Current_Proj_Manager VARCHAR(10) NOT NULL,
    CONSTRAINT Projects_empID_fk FOREIGN KEY (Current_Proj_Manager) REFERENCES Employee (Employee_ID)
    );

CREATE TABLE Project_Description(
	-- project descriptions in separate table because they are large text fields that will only be used for limited reporting. Separated to make the project table leaner.
	PD_No		VARCHAR(9) PRIMARY KEY,
	Proj_Desc	VARCHAR(300),
	Project_ID  VARCHAR(9),
	CONSTRAINT Proj_Desc_projID_fk FOREIGN KEY (Project_ID) REFERENCES Project(Project_ID)
	);

CREATE TABLE Past_Project_Role(
    -- Please note: primary key added for uniqueness' sake -- e.g. so that a staff memeber can be reassigned to same project.
    Pr_Role_No          VARCHAR(9) PRIMARY KEY,
    Employee_ID         VARCHAR(10) NOT NULL,
    Project_ID          VARCHAR(9) NOT NULL,
    Proj_Role_Start     Date NOT NULL,
    Proj_Role_End       Date NOT NULL,
    Proj_Role_Desc      VARCHAR(60),
    CONSTRAINT Past_Proj_role_empID_fk FOREIGN KEY (Employee_ID) REFERENCES Employee (Employee_ID),
    CONSTRAINT Past_Proj_role_projID_fk FOREIGN KEY (Project_ID) REFERENCES Project (Project_ID)
    );

CREATE TABLE Contractor (
    Contractor_ID          VARCHAR(9) PRIMARY KEY,
    Contractor_Name        VARCHAR(50) NOT NULL,
    Contractor_Address     VARCHAR(100),
    Preferred_Contact_Name VARCHAR(50),
    Preferred_Contact_Desc VARCHAR(100)
    );

CREATE TABLE Contract (
     Contract_No			VARCHAR(9) PRIMARY KEY,
     Contract_Name			VARCHAR(50),
     Estimated_Cost			float,
     Contr_Start_Date		date,
     Contr_End_Date			date,
     Project_ID				VARCHAR(9) NOT NULL,
     Current_Contr_Manager  VARCHAR(10) NOT NULL,
     Contractor_ID			VARCHAR(9) NOT NULL,
     CONSTRAINT Contract_contr_mgr_fk FOREIGN KEY (Current_Contr_Manager) REFERENCES Employee (Employee_ID),
     CONSTRAINT Contract_contractorID_fk FOREIGN KEY (Contractor_ID) REFERENCES Contractor (Contractor_ID)
    );

CREATE TABLE Contract_Description(
	-- big text fields, not used often. Separated to make the Contract table leaner.
	CD_No		VARCHAR(9) PRIMARY KEY,
	Contr_Desc	VARCHAR(300),
	Contract_No VARCHAR(9),
	CONSTRAINT Contr_Desc_Contr_No_fk FOREIGN KEY (Contract_No) REFERENCES Contract(Contract_No) 
	);

CREATE TABLE Past_Contract_Role (
     -- Please note: primary key added for uniqueness' sake -- e.g. so that a staff member can be reassigned to same contract.
    Cr_Role_No          VARCHAR(9) PRIMARY KEY,
    Employee_ID         VARCHAR(10) NOT NULL,
    Contract_No         VARCHAR(9) NOT NULL,
    Contr_Role_Start    Date NOT NULL,
    Contr_Role_End      Date NOT NULL,
    Contr_Role_Desc     VARCHAR(50),
    CONSTRAINT Past_Contr_Role_empID_fk FOREIGN KEY (Employee_ID) REFERENCES Employee (Employee_ID),
    CONSTRAINT Past_Contr_Role_contrNo_fk FOREIGN KEY (Contract_No) REFERENCES Contract (Contract_No)
    );

CREATE TABLE Location(
    Location_ID     VARCHAR(9) PRIMARY KEY,
    Location_Name   VARCHAR(50)NOT NULL,
    Latitude        VARCHAR(15)NOT NULL,
    Longitude       VARCHAR(15)NOT NULL,
    Loc_desc        VARCHAR(100)NOT NULL
    );

CREATE TABLE Road_Category (
    Category_Type   VARCHAR(20) PRIMARY KEY,
    Category_Desc   VARCHAR(100)
    );

CREATE TABLE Road(
    Road_ID         VARCHAR(9) Primary Key,
    Road_Name       VARCHAR(40) NOT NULL,
    Road_Desc       VARCHAR(100),
    Road_Length     float,
    Road_inside_Road VARCHAR(9),
    Category_Type    VARCHAR(20)NOT NULL,
    Start_Location   VARCHAR(9)NOT NULL,
    End_Location     VARCHAR(9)NOT NULL,
    CONSTRAINT Road_insideRD_fk FOREIGN KEY (Road_Inside_Road) REFERENCES Road (Road_ID),
    CONSTRAINT Road_Cat_Type_fk FOREIGN KEY (Category_Type) REFERENCES Road_Category(Category_Type),
    CONSTRAINT Road_StartLoc_fk FOREIGN KEY (Start_Location) REFERENCES Location (Location_ID),
    CONSTRAINT Road___EndLoc_fk FOREIGN KEY (End_Location) REFERENCES Location (Location_ID)
    );

CREATE TABLE Link_Proj_to_Road (
    Project_ID      VARCHAR(9) NOT NULL,
    Road_ID         VARCHAR(9) NOT NULL,
    CONSTRAINT Link_PtoR_Proj_fk FOREIGN KEY (Project_ID) REFERENCES Project(Project_ID),
    CONSTRAINT Link_PtoR_Road_fk FOREIGN KEY (Road_ID) REFERENCES Road(Road_ID),
    CONSTRAINT Link_PtoR_CompositeKey PRIMARY KEY (Project_ID, Road_ID)
    );

CREATE TABLE Payment (
	Payment_No		VARCHAR(10) Primary Key,
	Payment_Date	Date NOT NULL,
	Payment_Amount	float,
	Contract_No		VARCHAR(9),
	CONSTRAINT Contract_No_fk FOREIGN KEY (Contract_No) REFERENCES Contract(Contract_No)
	);


