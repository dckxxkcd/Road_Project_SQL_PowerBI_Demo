-- QUERY 1: Non-financial Summary of each project - key people,  dates,  descriptions
-- Kept the descriptions in separate tables because in other projects, I found lengthy text strings could be resource-intensive: here, I only want to call up the table with the big strings when needed.

SELECT p.Project_ID AS "Project Number",
	   p.Proj_Name AS "Project Name",
	   p.Proj_Start AS "Start Date",
	   p.Proj_Complete AS "Completion Date",
	   e.First_Name + ' ' + e.Last_Name AS "Current Project Manager",
	   pd.Proj_Desc AS "Project Description"
  FROM Project p
  JOIN Employee e
    ON p.Current_Proj_Manager = e.Employee_ID
  JOIN Project_Description pd
    ON p.Project_ID = pd.Project_ID;

-- Query 2: Summary of projects for each road, and dates
-- JOIN for Many-to-Many
SELECT r.road_ID AS "Road ID",
	   p.Project_ID AS "Project Number",
	   p.Proj_Name AS "Project Name",
	   p.Proj_Start AS "Start Date",
	   p.Proj_Complete AS "End Date"
  From Road r
  JOIN Link_Proj_to_Road lp
    ON r.Road_ID = lp.Road_ID
  JOIN Project p
    ON lp.Project_ID = p.Project_ID
 ORDER BY r.Road_ID, p.Project_ID;


-- QUERY 3: Non-financial Summary of each contract - key people, contractor, descriptions
SELECT c.Contract_No AS "Contract Number",
	   c.Contract_Name AS "Contract Name",
	   e.First_Name + ' ' + e.Last_Name AS "Council Contract Manager",
	   c.Contr_Start_Date AS "Start Date",
	   c.Contr_End_Date AS "End Date",
	   cr.Contractor_Name AS "Name of Contractor",
	   cr.Preferred_Contact_Name as "Contractor's contact person",
	   cd.Contr_Desc AS "Contract Description"
  FROM Contract c
  JOIN Employee e
    ON c.Current_Contr_Manager = e.Employee_ID
  JOIN Contractor cr
    ON c.Contractor_ID = cr.Contractor_ID
  JOIN Contract_Description cd
    ON c.Contract_No = cd.Contract_No;

	
-- Query 4: Financial summary for each contract
-- Sub-Query
-- Aggregate
-- FORMAT and CAST
SELECT c.Contract_No AS "Contract Number",
	   c.Contract_Name AS "Contract Name",
	   FORMAT(c.Estimated_Cost, 'C0', 'en-us') AS "Contract Budget",
       FORMAT(p.Actual_Cost, 'C0', 'en-us') AS "Actual Cost",
	   FORMAT(p.Actual_Cost - c.Estimated_Cost, 'C0', 'en-us') AS "Amount Over/(Under) Budget",
	   CAST(ROUND(((p.Actual_Cost / c.Estimated_Cost) * 100) - 100, 2) AS varchar) + '%' AS "Percent Over/Under(-) Budget"
  FROM Contract c
  JOIN (SELECT	 Contract_No,
				 SUM(Payment_Amount) AS "Actual_Cost"
		  FROM	 Payment 
		 GROUP BY Contract_No) AS p
    ON c.Contract_No = p.Contract_No	
 ORDER BY c.Contract_No;


-- QUERY 5: Financials for each Project
-- CTE 
-- SUM
-- FORMAT and CAST
WITH 
Project_Actuals AS(
		SELECT c.Project_ID,
			   SUM(p.Actual_Cost) AS "Proj_Actual_Cost"
		  FROM Contract c
		  JOIN (SELECT Contract_No,
					   SUM(Payment_Amount) AS "Actual_Cost"
				  FROM Payment 
				 GROUP BY Contract_No) AS p
			ON c.Contract_No = p.Contract_No	
		 GROUP BY c.Project_ID
),
Project_Budget AS(
		SELECT Project_ID,
			   SUM(Estimated_Cost) AS "Project_Budget"
		  FROM Contract
		 GROUP BY Project_ID
)
SELECT p.Project_ID AS "Project Number",
	   p.Proj_Name AS "Project Name",
	   FORMAT(pb.Project_Budget, 'C0', 'en-us') AS "Project Budget",
	   FORMAT(pa.Proj_Actual_Cost, 'C0', 'en-us') AS "Actual Cost",
	   FORMAT(pa.Proj_Actual_Cost - pb.Project_Budget, 'C0', 'en-us') AS "Amount Over/(Under) Budget",
	   CAST(ROUND(((pa.Proj_Actual_Cost / pb.Project_Budget) * 100) - 100, 2) AS varchar) + '%' AS "Percent Over/Under(-) Budget"
  FROM Project p
  JOIN Project_Budget pb
    ON p.Project_ID = pb.Project_ID
  JOIN Project_Actuals pa 
    ON p.Project_ID = pa.Project_ID;



-- Query 6: Overview of payments by month for whole spend
-- DATEPART
-- Aggregate
SELECT DATEPART(MONTH, Payment_Date) AS "Month",
	   DATEPART(YEAR, Payment_Date) AS "Year",
	   COUNT(Payment_Amount) AS "Number of Payments",
	   FORMAT(SUM(Payment_Amount), 'C0', 'en-us') AS "Total Monthly Payments"
  FROM Payment
 GROUP BY 
	   DATEPART(MONTH, Payment_Date),
	   DATEPART(YEAR, Payment_Date);


-- Average Monthly Payments 
-- AVERAGE
-- There is 1 source of error - no invoices paid in June 2021, Averages don't include whole financial years. 
WITH
Monthly_Totals AS (
		SELECT SUM(Payment_Amount) AS "Total_Monthly_Payments"
		  FROM Payment
		 GROUP BY 
			   DATEPART(MONTH, Payment_Date),
			   DATEPART(YEAR, Payment_Date)
)
SELECT AVG(mt.Total_Monthly_Payments)
  From Monthly_Totals mt;




-- Query 7: Total payments made on those contracts that had a count of more than 10 payments
-- HAVING
-- Before I did dataquest, I got caught out with HAVING in a job interview - so I wanted to have an example with having here, to show I know the order of execution concept.
SELECT Contract_No AS "Contracts with more than 10 payments",
	   COUNT(Payment_Amount) AS "Number of Payments",
	   FORMAT(SUM(Payment_Amount),'C0','en-us') AS "Total Payments",
	   FORMAT(AVG(Payment_Amount),'C0','en-us') AS "Average Payment"
  FROM Payment
 GROUP BY Contract_No
HAVING COUNT(Payment_Amount) > 10;


-- Query 8: Finding the largest/ smallest ten payments
-- ORDER BY, TOP
-- DATENAME
--First the largest 10 payments
SELECT TOP 5
	   Payment_No,
	   FORMAT(Payment_Amount, 'C0', 'en-us') AS "Payment Amount",
	   Contract_No,
	   Payment_Date
  FROM Payment
 ORDER BY Payment_Amount DESC;

 --And the smallest ten payments
 SELECT TOP 5
	   Payment_No,
	   FORMAT(Payment_Amount, 'C0', 'en-us') AS "Payment Amount",
	   Contract_No,
	   Payment_Date
  FROM Payment
 ORDER BY Payment_Amount ASC;

 --the largest 10 payments NOT from Con_002
 SELECT TOP 5
	   Payment_No,
	   FORMAT(Payment_Amount, 'C0', 'en-us') AS "Payment Amount",
	   Contract_No,
	   Payment_Date
  FROM Payment
 WHERE Contract_No != 'Con_002'
 ORDER BY Payment_Amount DESC;


-- Query 9: Find all payments related to the employee who is under suspicion
-- The original project at Uni asked for past contract roles. The requirements seemed clunky. 
-- For this project I chose to leave in just 1 - an employee who had allegedly made naughty payments.
-- This query finds all the payments authorised by the employee as project manager or contract manager, during the relevant period. 

WITH
-- list all the payments for the employee's contracts during relevant period.
Contract_Mgr_Payments AS(
		SELECT p.Payment_No AS "Contract_Payments"
		  FROM Payment p
		  JOIN Contract c 
		    ON c.Contract_No = p.Contract_No
		  JOIN Past_Contract_Role pr
		    ON pr.Contract_No = c.Contract_No
		 WHERE pr.Employee_ID = 'EMP_00586c'
		   AND p.Payment_Date > pr.Contr_Role_Start
           AND p.Payment_Date < pr.Contr_Role_End
),
-- list all the payments for the employee's projects during relevant period.
Project_Mgr_Payments AS(
		SELECT p.Payment_No AS "Project_Payments"
		  FROM Payment p
		  JOIN Contract c 
		    ON c.Contract_No = p.Contract_No
		  JOIN Project proj
		    ON proj.Project_ID = c.Project_ID
		  JOIN Past_Project_Role pr 
		    ON pr.Project_ID = proj.Project_ID
		 WHERE pr.Employee_ID = 'EMP_00586c'
		   AND p.Payment_Date > pr.Proj_Role_Start
		   AND p.Payment_Date < pr.Proj_Role_End
)
-- Return results -note Pay_0035 is the only project payment that is no also a contract payment.
SELECT p.Payment_No,
	   p.Contract_No,
	   c.Contract_Name,
	   cr.Contractor_Name,
	   p.Payment_Date,
	   FORMAT(p.Payment_Amount, 'C0', 'en-us') AS "Payment Amount"
  FROM Payment p
  JOIN Contract c
    ON c.Contract_No = p.Contract_No
  JOIN Contractor cr
    ON cr.Contractor_ID = c.Contractor_ID
  LEFT JOIN Contract_Mgr_Payments cp
    ON cp.Contract_Payments = p.Payment_No
  LEFT JOIN Project_Mgr_Payments pp
    ON pp.Project_Payments = p.Payment_No
 WHERE p.Payment_No = cp.Contract_Payments
    OR p.Payment_No = pp.Project_Payments
 ORDER BY p.Payment_Date;


-- Query 10: Formatted contractor list - emergency contacts in last 2 months
-- recent_contract uses the last 2 months as a proxy for contractors who might be on-site on a road - and therefore needing an emergency contact close-to-hand
-- Assumes that this was run on the date of the last payment, rather than at "GETDATE" because all records in the database are in the past.

-- Note: this would give 'recent contracts' in realtime instead of from 2023-04-24:
		--SELECT Contract_No
		--  FROM Payment
		-- WHERE Payment_Date < DATEADD(Month, -2, GETDATE())
WITH
recent_contracts AS(
			SELECT Contract_No
			  FROM Payment
			 WHERE Payment_Date > DATEADD(Month, -2, '2023-04-24')
),
current_contracts AS(
			SELECT Contract_No
			  FROM Contract
		     WHERE'2023-04-24' < Contr_End_Date
			   AND '2023-04-24' > Contr_Start_Date
)
SELECT DISTINCT
	   r.Road_Name AS "Road Name",
	   cr.Contractor_Name AS "Contractor",
	   cr.Preferred_Contact_Name AS "Contact Name",
	   cr.Preferred_Contact_Desc AS "Contact Details"
  FROM Road r
  JOIN Link_Proj_to_Road li
    ON r.Road_ID = li.Road_ID
  JOIN Project p
    ON li.Project_ID = p.Project_ID
  JOIN Contract c
    ON p.Project_ID = c.Project_ID
  JOIN Contractor cr
    ON c.Contractor_ID = cr.Contractor_ID
  LEFT JOIN recent_contracts resc
    ON resc.Contract_No = c.Contract_No
  LEFT JOIN current_contracts cur
    ON cur.Contract_No = c.Contract_No
 WHERE c.Contract_No = resc.Contract_No
    OR cur.Contract_No = c.Contract_No
 ORDER BY r.Road_Name;
 

-- Query 11: Roads inside roads
-- The road structure for this database allows one road to be nested inside another road: e.g. if a main road has a small section which is a special war memorial in the centre of town.
-- This query sets out the nested structure - it returns the short list of roads that are physically part of another road.
SELECT r.Road_ID AS "ID inside road",
	   r.Road_Name AS "Name of inside road",
	   rc1.Category_Desc AS "Inside Road Category",
       ir.Road_ID AS "ID outside road",
	   ir.Road_Name AS "Name of outside road",
	   rc2.Category_Desc AS "Outside Road Category"
  FROM Road r
  JOIN Road ir
    ON r.Road_inside_Road = ir.Road_ID
  JOIN Road_Category rc1
    ON r.Category_Type = rc1.Category_Type
  JOIN Road_Category rc2
    On ir.Category_Type = rc2.Category_Type
 ORDER BY r.Road_ID;


-- Query 12: formatted text string for road start and end coordinates
-- This is from my experience working with contractors using GIS data - being able to send out coordinates quickly that will plug straight into Google maps is a common need... believe me!!
-- Concatenation

SELECT r.Road_ID AS "Road ID",
	   r.Road_Name AS "Road Name",
	   ls.Latitude + ', ' + ls.Longitude AS "Road Start coordinates",
	   le.Latitude + ', ' + le.Longitude AS "Road End coordinates"
  FROM Road r
  JOIN Location ls
    ON r.Start_Location = ls.Location_ID
  JOIN Location le
    ON r.End_Location = le.Location_ID
 ORDER BY r.Road_ID;

  -- Query 13: search for employee by name
 -- LIKE
 SELECT e.Employee_ID,
		e.First_Name + ' ' + e.Last_Name AS "Full Name",
	     rt.First_Name + ' ' + rt.Last_Name AS "Reports To"
   FROM Employee e
   LEFT JOIN Employee rt
    ON e.Reports_To = rt.Employee_ID
 WHERE e.Last_Name LIKE 'ana%';

-- Query 14: Formatted employee list including reports to
-- recursive join
-- LEFT JOIN
SELECT e.Employee_ID,
	   e.First_Name + ' ' + e.Last_Name AS "Full Name",
	   e.Postal_Address AS "Address",
	   e.EMP_Phone_No AS "Mobile Phone",
	   e.EMP_email AS "Work Email",
	   rt.First_Name + ' ' + rt.Last_Name AS "Reports To",
	   e.Emp_Start_Date AS "Start Date",
	   e.Emp_End_Date AS "End Date"
  FROM Employee e
  LEFT JOIN Employee rt
    ON e.Reports_To = rt.Employee_ID
 ORDER BY e.Reports_To, e.Last_Name;

