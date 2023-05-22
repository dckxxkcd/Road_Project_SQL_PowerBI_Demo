
--employees data
-- I was uncomfortable with sequential Employee_ID numbers because PK for a person’s identity is very sensitive data. I tried to add some randomness to Employee_ID
INSERT INTO Employee (Employee_ID, First_Name, Last_Name, Emp_Start_Date, Emp_End_Date, Emp_DOB, EMP_Gender, Postal_Address, EMP_Phone_No, EMP_Email, Reports_to)
VALUES ('EMP_00167t', 'David', 'Bosman', '2013-02-23', NULL, '1958-07-12', 'M', '136 Laingholm Drive, Laingholm, Auckland', '0213478824', 'd.bosman@arc.org.nz', NULL);

INSERT INTO Employee (Employee_ID, First_Name, Last_Name, Emp_Start_Date, Emp_End_Date, Emp_DOB, EMP_Gender, Postal_Address, EMP_Phone_No, EMP_Email, Reports_to)
VALUES ('EMP_00387x', 'Joanna', 'Plumber', '2017-01-07', NULL, '1967-02-28', 'F', '24 Close Crescent, St Heliers', '021876762', 'j.plumber@arc.org.nz', 'EMP_00167t');

INSERT INTO Employee (Employee_ID, First_Name, Last_Name, Emp_Start_Date, Emp_End_Date, Emp_DOB, EMP_Gender, Postal_Address, EMP_Phone_No, EMP_Email, Reports_to)
VALUES ('EMP_00429c', 'Carlos', 'Carpenter', '2019-07-01', NULL, '1976-04-23', 'M', '1 The Strand Takapuna', '02204823562', 'c.carpenter@arc.org.nz', 'EMP_00167t');

INSERT INTO Employee (Employee_ID, First_Name, Last_Name, Emp_Start_Date, Emp_End_Date, Emp_DOB, EMP_Gender, Postal_Address, EMP_Phone_No, EMP_Email, Reports_to)
VALUES ('EMP_00138a', 'John', 'Smith', '2018-01-02', NULL, '1988-05-15', 'M', '121 Woontons Lane, Titirangi, Auckland', '0273456823', 'j.smith@arc.org.nz', 'EMP_00387x');

INSERT INTO Employee (Employee_ID, First_Name, Last_Name, Emp_Start_Date, Emp_End_Date, Emp_DOB, EMP_Gender, Postal_Address, EMP_Phone_No, EMP_Email, Reports_to)
VALUES ('EMP_00264b', 'Beatrice', 'Baker', '2017-02-17', NULL, '1990-05-26', 'F', '18 Smith Street, Avondale, Auckland', '0223458762', 'b.baker@arc.org.nz', 'EMP_00387x');

INSERT INTO Employee (Employee_ID, First_Name, Last_Name, Emp_Start_Date, Emp_End_Date, Emp_DOB, EMP_Gender, Postal_Address, EMP_Phone_No, EMP_Email, Reports_to)
VALUES ('EMP_00586c', 'Sylvester', 'Chandler',	'2016-10-25', NULL, '1958-12-26', 'M', 'Apartment 12, 141 Vincent St, Auckland CBD', '0216547892', 's.chandler@arc.org.nz', 'EMP_00387x');

INSERT INTO Employee (Employee_ID, First_Name, Last_Name, Emp_Start_Date, Emp_End_Date, Emp_DOB, EMP_Gender, Postal_Address, EMP_Phone_No, EMP_Email, Reports_to)
VALUES ('EMP_00326s', 'Sandra', 'Ananda', '2021-06-26', NULL, '1987-04-13', 'F', '264 New North Rd, Eden Terrace', '02034920054', 's.ananda@arc.org.nz', 'EMP_00429c');

INSERT INTO Employee (Employee_ID, First_Name, Last_Name, Emp_Start_Date, Emp_End_Date, Emp_DOB, EMP_Gender, Postal_Address, EMP_Phone_No, EMP_Email, Reports_to)
VALUES ('EMP_00434p', 'Elise', 'Davis', '2022-01-26', NULL, '1988-04-13', 'F', '27 Richmond Ave, Northcote', '02177384576', 's.davis@arc.org.nz', 'EMP_00429c');

--Projects Data
INSERT INTO Project(Project_ID, Proj_Name, Proj_Start, Proj_Complete, Current_Proj_Manager)
VALUES ('Proj_001', 'Titirangi Major Safety Upgrade', '2021-04-01', '2023-03-31', 'EMP_00264b');

INSERT INTO Project(Project_ID, Proj_Name, Proj_Start, Proj_Complete, Current_Proj_Manager)
VALUES ('Proj_002', 'Titirangi safety upgrade remediation', '2022-10-20', '2023-03-31', 'EMP_00138a');

INSERT INTO Project(Project_ID, Proj_Name, Proj_Start, Proj_Complete, Current_Proj_Manager)
VALUES ('Proj_003', 'Residential Resealing', '2021-07-15', '2022-12-31', 'EMP_00387x');

INSERT INTO Project(Project_ID, Proj_Name, Proj_Start, Proj_Complete, Current_Proj_Manager)
VALUES ('Proj_004', 'Planned sinkhole Remediation', '2022-06-01', '2022-10-15', 'EMP_00387x');

INSERT INTO Project(Project_ID, Proj_Name, Proj_Start, Proj_Complete, Current_Proj_Manager)
VALUES ('Proj_005', 'Audit and Forensics', '2022-06-18', '2023-03-31', 'EMP_00167t');

INSERT INTO Project(Project_ID, Proj_Name, Proj_Start, Proj_Complete, Current_Proj_Manager)
VALUES ('Proj_006', 'Storm Response Urgent', '2022-09-21', '2023-02-11', 'EMP_00138a');

INSERT INTO Project(Project_ID, Proj_Name, Proj_Start, Proj_Complete, Current_Proj_Manager)
VALUES ('Proj_007', 'Cyclone Response Urgent', '2023-02-16', '2023-03-31', 'EMP_00326s');

--Project Descriptions
INSERT INTO Project_Description(PD_No, Proj_Desc, Project_ID)
VALUES ('PD_001', 'Scoping reports, major roading upgrades, construction and management of heritage assets on main road - Memorial drive which includes two sub-roads.', 'Proj_001'); 

INSERT INTO Project_Description(PD_No, Proj_Desc, Project_ID)
VALUES ('PD_002', 'Scoping and remedy of issues with proj_001 for areas not covered by contract make-good terms', 'Proj_002'); 

INSERT INTO Project_Description(PD_No, Proj_Desc, Project_ID)
VALUES ('PD_003', 'Planned residential resealing in sleepy Street', 'Proj_003');

INSERT INTO Project_Description(PD_No, Proj_Desc, Project_ID)
VALUES ('PD_004', 'Sinkhole remediation following inspection on Bustling Road', 'Proj_003');

INSERT INTO Project_Description(PD_No, Proj_Desc, Project_ID)
VALUES ('PD_005', 'Budget Placeholder: Ongoing audit and forensic costs related to irregularities with projects managed by EMP_00586c during 2021/22, Proj_003 and Proj_004 and contracts investigation.', 'Proj_005');

INSERT INTO Project_Description(PD_No, Proj_Desc, Project_ID)
VALUES ('PD_006', 'Urgent response to major storm in September 2021 -- earthworks, road rebuild and resealing, all physical roads in area', 'Proj_006');

INSERT INTO Project_Description(PD_No, Proj_Desc, Project_ID)
VALUES ('PD_007','Urgent response to cyclone in February 2023 -- earthworks, road rebuild and resealing, all physical roads in area', 'Proj_007');

-- Past_Project_Role Data
-- This was a specific requirement for the initial uni project. 
-- When I added dated payments to this project redo, it became unwieldy, so I have only added data for the forensic issue - to try and report before and after payments.

INSERT INTO Past_Project_Role (PR_Role_No, Employee_ID, Project_ID, Proj_Role_Start, Proj_Role_End, Proj_Role_Desc)
VALUES ('PR_004', 'EMP_00586c', 'Proj_003', '2021-07-15', '2022-07-03', 'Project Manager');

INSERT INTO Past_Project_Role (PR_Role_No, Employee_ID, Project_ID, Proj_Role_Start, Proj_Role_End, Proj_Role_Desc)
VALUES ('PR_005', 'EMP_00586c', 'Proj_004', '2022-06-01', '2022-07-03', 'Setup Administrator');


-- Contractor Data
INSERT INTO Contractor (Contractor_ID, Contractor_Name, Contractor_Address, Preferred_Contact_Name, Preferred_Contact_Desc)
VALUES ('Ctr_001', 'Asparagus Analysis Ltd', '64b Grey St, Onehunga, Auckland', 'Gus LeChat', '02748654059, gus@asparagus.co.nz');

INSERT INTO Contractor (Contractor_ID, Contractor_Name, Contractor_Address, Preferred_Contact_Name, Preferred_Contact_Desc)
VALUES ('Ctr_002', 'McCavity Excavations Ltd', '72-74 Orson Way, Mangere Industrial Park, Auckland', 'Gato McCavity', '0224928543, McCavity@alweber.com');

INSERT INTO Contractor (Contractor_ID, Contractor_Name, Contractor_Address, Preferred_Contact_Name, Preferred_Contact_Desc)
VALUES ('Ctr_003', 'Mungo Jerry Roading Ltd', 'Unit 36, 84 Constellation Drive, Albany, Auckland', 'John Smith Senior', '02047569284, JohnSmith@mjr.co.nz');

INSERT INTO Contractor (Contractor_ID, Contractor_Name, Contractor_Address, Preferred_Contact_Name, Preferred_Contact_Desc)
VALUES ('Ctr_004', 'Deutoronomy Heritage Ltd', '27 Wilson St, New Lynn, Auckland', 'Rumpole TZaar', '02258720502, Fax: 09 5673928');

INSERT INTO Contractor (Contractor_ID, Contractor_Name, Contractor_Address, Preferred_Contact_Name, Preferred_Contact_Desc)
VALUES ('Ctr_005', 'Jellicle Roads Inc', '44 Jellicoe Rd, Onehunga, Auckland', 'Jellicle Katz', '02139284924, JCKatz@jellicleball.com');

INSERT INTO Contractor (Contractor_ID, Contractor_Name, Contractor_Address, Preferred_Contact_Name, Preferred_Contact_Desc)
VALUES ('Ctr_006', 'Felid Forensic Accountants Inc', '424 Chatz Lane, Chatswood', 'Johan Hunter', '02846778, johanhunter@FFAI.co.nz');

INSERT INTO Contractor (Contractor_ID, Contractor_Name, Contractor_Address, Preferred_Contact_Name, Preferred_Contact_Desc)
VALUES ('Ctr_007', 'New Diggers Inc', '248 Swanson Rd, Swanson, Auckland', 'Bill Williamson', '027786544, Billtheboss@newdiggers.co.bnz');

INSERT INTO Contractor (Contractor_ID, Contractor_Name, Contractor_Address, Preferred_Contact_Name, Preferred_Contact_Desc)
VALUES ('Ctr_008', 'Modern Roading Specialists Ltd', '14a Neilson Street, Onehunga', 'Jean Moderne', '023498821, Jean.Mod@modern.co.nz');



--  Contract Data
INSERT INTO Contract(Contract_No, Contract_Name, Estimated_Cost, Contr_Start_Date, Contr_End_Date, Project_ID, Current_Contr_Manager, Contractor_ID)
VALUES ('Con_001', 'Titirangi Safe scoping Report', 35000, '2021-04-05', '2021-11-30', 'Proj_001', 'EMP_00429c', 'Ctr_001');

INSERT INTO Contract(Contract_No, Contract_Name, Estimated_Cost,Contr_Start_Date, Contr_End_Date, Project_ID, Current_Contr_Manager, Contractor_ID)
VALUES ('Con_002', 'Titirangi Major safety upgrade',  5000000, '2021-12-01', '2022-10-28', 'Proj_001', 'EMP_00429c',	'Ctr_003');

INSERT INTO Contract(Contract_No, Contract_Name, Estimated_Cost, Contr_Start_Date, Contr_End_Date, Project_ID, Current_Contr_Manager, Contractor_ID)
VALUES ('Con_003', 'Titirangi Memorial Management during upgrade',  35000, '2021-06-11', '2023-02-28', 'Proj_001', 'EMP_00326s', 'Ctr_004');

INSERT INTO Contract(Contract_No, Contract_Name, Estimated_Cost, Contr_Start_Date, Contr_End_Date, Project_ID, Current_Contr_Manager, Contractor_ID)
VALUES ('Con_004', 'Titirangi Upgrade remediation',  150000, '2022-11-01',	'2023-03-25', 'Proj_002', 'EMP_00434p', 'Ctr_005');

INSERT INTO Contract(Contract_No, Contract_Name, Estimated_Cost, Contr_Start_Date, Contr_End_Date, Project_ID, Current_Contr_Manager, Contractor_ID)
VALUES ('Con_005', 'Planned Residential Resealing', 600000, '2021-07-15', '2022-11-09', 'Proj_003', 'EMP_00429c', 'Ctr_008');

INSERT INTO Contract(Contract_No, Contract_Name, Estimated_Cost, Contr_Start_Date, Contr_End_Date, Project_ID, Current_Contr_Manager, Contractor_ID)
VALUES ('Con_006', 'Rimutaka Sinkhole Remediation',  72000, '2022-06-02', '2022-10-31', 'Proj_004', 'EMP_00429c', 'Ctr_005');

INSERT INTO Contract(Contract_No, Contract_Name, Estimated_Cost, Contr_Start_Date, Contr_End_Date, Project_ID, Current_Contr_Manager, Contractor_ID)
VALUES ('Con_007', 'Forensic analysis of spend ', 10000, '2022-06-18', '2023-03-31', 'Proj_005' , 'EMP_00167t', 'Ctr_006');

INSERT INTO Contract(Contract_No, Contract_Name, Estimated_Cost, Contr_Start_Date, Contr_End_Date, Project_ID, Current_Contr_Manager, Contractor_ID)
VALUES ('Con_008', 'Storm Response urgent earthworks and road repairs', 60000, '2022-09-22', '2022-10-11', 'Proj_006', 'EMP_00326s', 'Ctr_002');

INSERT INTO Contract(Contract_No, Contract_Name, Estimated_Cost, Contr_Start_Date, Contr_End_Date, Project_ID, Current_Contr_Manager, Contractor_ID)
VALUES ('Con_009', 'Storm Response urgent earthworks and road repairs', 400000, '2022-09-23', '2023-02-09', 'Proj_006', 'EMP_00429c', 'Ctr_008');

INSERT INTO Contract(Contract_No, Contract_Name, Estimated_Cost, Contr_Start_Date, Contr_End_Date, Project_ID, Current_Contr_Manager, Contractor_ID)
VALUES ('Con_010','Cyclone Response urgent works', 200000, '2023-02-16', '2023-03-31', 'Proj_007', 'EMP_00434p', 'Ctr_007');

INSERT INTO Contract(Contract_No, Contract_Name, Estimated_Cost, Contr_Start_Date, Contr_End_Date, Project_ID, Current_Contr_Manager, Contractor_ID)
VALUES ('Con_011', 'Cyclone Response urgent works', 50000, '2023-02-17', '2023-03-07', 'Proj_007', 'EMP_00326s', 'Ctr_008');

--Contract Descriptions
INSERT INTO Contract_Description(CD_No, Contr_Desc, Contract_No)
VALUES ('CD_001', 'Report to Council: Identify major safety works required in Titirangi Area', 'Con_001');

INSERT INTO Contract_Description(CD_No, Contr_Desc, Contract_No)
VALUES ('CD_002', 'Construction: Complete major safety works based on recommendations from Con_001 report', 'Con_002');

INSERT INTO Contract_Description(CD_No, Contr_Desc, Contract_No)
VALUES ('CD_003', 'Memorials works and Report: Supporting Con_002, a specialist heritage firm will manage and secure the heritage value of assets that may be impacted by Con_002', 'Con_003');

INSERT INTO Contract_Description(CD_No, Contr_Desc, Contract_No)
VALUES ('CD_004', 'Construction: Complete remediation of flaws identified after completion of Con_002', 'Con_004');

INSERT INTO Contract_Description(CD_No, Contr_Desc, Contract_No)
VALUES ('CD_005', 'Planned resealing on Sleepy Street RD_004 and Busling Road RD_005', 'Con_005');

INSERT INTO Contract_Description(CD_No, Contr_Desc, Contract_No)
VALUES ('CD_006', 'Repair Problem Sinkhole identified by on-site inspection in response to resident phone call', 'Con_006' );

INSERT INTO Contract_Description(CD_No, Contr_Desc, Contract_No)
VALUES ('CD_007','Forensic analysis of payments made and investigate in relation to Proj_003, Proj_004' , 'Con_007');

INSERT INTO Contract_Description(CD_No, Contr_Desc, Contract_No)
VALUES ('CD_008', 'Emergency earthworks and roading rebuild following storm', 'Con_008');

INSERT INTO Contract_Description(CD_No, Contr_Desc, Contract_No)
VALUES ('CD_009', 'Emergency earthworks and roading rebuild following storm', 'Con_009');

INSERT INTO Contract_Description(CD_No, Contr_Desc, Contract_No)
VALUES ('CD_010', 'Emergency earthworks and roading rebuild following cyclone', 'Con_010');

INSERT INTO Contract_Description(CD_No, Contr_Desc, Contract_No)
VALUES ('CD_011', 'Emergency earthworks and roading rebuild following cyclone', 'Con_011');

-- Past_Contr_Role Data
-- This was a specific requirement for the initial uni project. 
-- When I added dated payments to this project redo, it became unwieldy, so I have only added data for the forensic issue - to try and report before and after payments.

INSERT INTO Past_Contract_Role (CR_Role_No, Employee_ID, Contract_No, Contr_Role_Start, Contr_Role_End, Contr_Role_Desc)
VALUES ('Cr_001', 'EMP_00586c', 'Con_005', '2021-07-15', '2022-07-03', ' Contract Manager');


Use [Road_Project_New]
--Location Data
INSERT INTO Location(Location_ID, Location_Name, Latitude, Longitude, Loc_Desc)
VALUES ('Loc_001', 'Titirangi Roundabout', '-36.93833426', '174.6540298', 'Roundabout, normal risk');

INSERT INTO Location(Location_ID, Location_Name, Latitude, Longitude, Loc_Desc)
VALUES ('Loc_002', 'Waiatarua Intersection', '-36.9339703', '174.5786296', 'Stop-sign only, high risk');

INSERT INTO Location(Location_ID, Location_Name, Latitude, Longitude, Loc_Desc)
VALUES ('Loc_003', 'Woodlands Park Intersection', '-36.93724234', '174.6448316', 'Stop-sign only, high risk');

INSERT INTO Location(Location_ID, Location_Name, Latitude, Longitude, Loc_Desc)
VALUES ('Loc_004', 'Filter Station Intersection', '-36.93731097', '174.6446012', '2 misaligned stop signs, extreme risk');

INSERT INTO Location(Location_ID, Location_Name, Latitude, Longitude, Loc_Desc)
VALUES ('Loc_005', 'Rimutaka Intersection', '-36.942021', '174.6366035', 'Stop-sign, normal risk');


-- Road_Category Data
INSERT INTO Road_Category (Category_Type, Category_Desc)
VALUES ('Cat_Hway', 'Highway - as identified in NZTA planning documents');

INSERT INTO Road_Category (Category_Type, Category_Desc)
VALUES ('Cat_Main', 'Main Road');

INSERT INTO Road_Category (Category_Type, Category_Desc)
VALUES ('Cat_res_small', 'Small Residential Street - normally half chain (10m) road width');

INSERT INTO Road_Category (Category_Type, Category_Desc)
VALUES ('Cat_res_large', 'Large Residential Street - at least full-chain (20m) road width');

INSERT INTO Road_Category (Category_Type, Category_Desc)
VALUES ('Cat_ceremonial', 'Ceremonial or memorial features: e.g. a small named memorial section of a main road');


-- ROAD Data
INSERT INTO Road (Road_ID, Road_Name, Road_Desc, Road_Length, Road_Inside_Road, Category_Type, Start_Location, End_Location)
VALUES ('RD_001', 'Memorial Drive', 'Main Road from Titirangi North', 9, NULL, 'Cat_Main', 'Loc_001', 'Loc_002');

INSERT INTO Road (Road_ID, Road_Name, Road_Desc, Road_Length, Road_Inside_Road, Category_Type, Start_Location, End_Location)
VALUES  ('RD_002', 'WW1 Parade', 'Section of Memorial Drive including WW1 memorials', 3, 'RD_001',	'Cat_ceremonial', 'Loc_001', 'Loc_003');

INSERT INTO Road (Road_ID, Road_Name, Road_Desc, Road_Length, Road_Inside_Road, Category_Type, Start_Location, End_Location)
VALUES  ('RD_003', 'WW2 Promenade', 'Section of Memorial Drive including WW2 memorials', 2, 'RD_001', 'Cat_ceremonial', 'Loc_003', 'Loc_001');

INSERT INTO Road (Road_ID, Road_Name, Road_Desc, Road_Length, Road_Inside_Road, Category_Type, Start_Location, End_Location)
VALUES  ('RD_004', 'Sleepy Street', 'Smaller residential street off memorial drive', 5, Null, 'Cat_res_small', 'Loc_001', 'Loc_003');

INSERT INTO Road (Road_ID, Road_Name, Road_Desc, Road_Length, Road_Inside_Road, Category_Type, Start_Location, End_Location)
VALUES  ('RD_005', 'Bustling Road', 'Busy residential street off memorial drive', 3, Null, 'Cat_res_large', 'Loc_004', 'Loc_005');



-- Link_Proj_To_Rd Data
INSERT INTO link_proj_to_road (Project_ID, Road_ID)
VALUES ('Proj_001', 'RD_001');

INSERT INTO link_proj_to_road (Project_ID, Road_ID)
VALUES ('Proj_001', 'RD_002');

INSERT INTO link_proj_to_road (Project_ID, Road_ID)
VALUES ('Proj_001', 'RD_003');

INSERT INTO link_proj_to_road (Project_ID, Road_ID)
VALUES ('Proj_002', 'RD_001');

INSERT INTO link_proj_to_road (Project_ID, Road_ID)
VALUES ('Proj_002', 'RD_002');

INSERT INTO link_proj_to_road (Project_ID, Road_ID)
VALUES ('Proj_002', 'RD_003');

INSERT INTO link_proj_to_road (Project_ID, Road_ID)
VALUES ('Proj_003', 'RD_004');

INSERT INTO link_proj_to_road (Project_ID, Road_ID)
VALUES ('Proj_003', 'RD_005');

INSERT INTO link_proj_to_road (Project_ID, Road_ID)
VALUES ('Proj_004', 'RD_005');

INSERT INTO link_proj_to_road (Project_ID, Road_ID)
VALUES ('Proj_006', 'RD_001');

INSERT INTO link_proj_to_road (Project_ID, Road_ID)
VALUES ('Proj_006', 'RD_004');

INSERT INTO link_proj_to_road (Project_ID, Road_ID)
VALUES ('Proj_006', 'RD_005');

INSERT INTO link_proj_to_road (Project_ID, Road_ID)
VALUES ('Proj_007', 'RD_001');

INSERT INTO link_proj_to_road (Project_ID, Road_ID)
VALUES ('Proj_007', 'RD_004');

INSERT INTO link_proj_to_road (Project_ID, Road_ID)
VALUES ('Proj_007', 'RD_005');
