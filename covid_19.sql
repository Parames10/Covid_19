create database covid_19; -- creating database
show databases;  -- show databases

use covid_19;  -- using the database


create table facility(
State varchar(100),
CCN varchar(100),
Facility_Name varchar(100),
 Street_Address varchar(100),
 City varchar(100),
 Zip_Code int,
 Fips_Code int,
 Provider_Subtype varchar(100),
 Reporting_Source varchar(100),
 Certified_Bed_Count int,
 Component_Hospitals int,
 Week_Ending date,
 Days int
 );
 
 create table facility_2(
 total_beds int,
 all_adult_hospital_beds int,
 total_ventilators int,
 ventilators_used int,
 overflow_covid int,
 overflow_ventilators_used_covid int,
 inpatient_beds int,
 all_adult_hospital_inpatient_beds int,
 all_pediatric_inpatient_beds int,
 inpatient_beds_used int,
 all_adult_hospital_inpatient_bed_occupied int,
 all_pediatric_inpatient_bed_occupied int,
 total_icu_beds int,
 total_staffed_adult_icu_beds int,
 total_staffed_pediatric_icu_beds int,
 icu_beds_used int,
 staffed_adult_icu_bed_occupancy int,
 staffed_pediatric_icu_bed_occupancy int
 );
  create table confirmed_cases(
 total_adult_patients_hospitalized_confirmed_covid int,
 total_pediatric_patients_hospitalized_confirmed_covid int,
 staffed_icu_adult_patients_confirmed_covid int,
 staffed_icu_pediatric_patients_confirmed_covid int,
 previous_day_admission_adult_covid_confirmed int,
 previous_day_admission_adult_covid_confirmed_all int,
 previous_day_admission_pediatric_covid_confirmed int,
 previous_day_admission_peds_covid_confirmed_all int,
 total_patients_hospitalized_confirmed_influenza int,
 previous_day_admission_influenza_confirmed int,
 icu_patients_confirmed_influenza int
 );
 
 
 create table suspected_cases(
 total_adult_patients_hospitalized_confirmed_and_suspected_covid int,
 total_pediatric_hospitalized_confirmed_and_suspected_covid int,
 staffed_icu_adult_patients_confirmed_and_suspected_covid int,
 hospital_onset_covid int,
 previous_day_admission_adult_covid_suspected int,
previous_day_admission_adult_covid_suspected_all int,
previous_day_admission_pediatric_covid_suspected int,
previous_day_admission_adult_covid_suspected_18_19 int,
previous_day_admission_adult_covid_suspected_20_29 int,
previous_day_admission_adult_covid_suspected_30_39 int,
previous_day_admission_adult_covid_suspected_40_49 int,
previous_day_admission_adult_covid_suspected_50_59 int,
previous_day_admission_adult_covid_suspected_60_69 int,
previous_day_admission_adult_covid_suspected_70_79 int,
previous_day_admission_adult_covid_suspected_80 int,
previous_day_admission_adult_covid_suspected_unknown int);

create table deaths(
deaths_covid int,
previous_day_deaths_influenza int,
previous_day_deaths_covid_and_influenza int
);

select * from facility; 
select * from facility_2;
select * from confirmed_cases;
select * from suspected_cases;
select * from deaths;

desc facility;   -- Desc will show the structure of the table
desc facility_2; 
desc confirmed_cases; 
desc suspected_cases; 
desc deaths;

ALTER TABLE facility 
ADD contact_number int; -- can add columns to the existing table

Alter table facility 
drop column contact_number; -- used to delete an existing column from the table.

Alter Table facility 
modify Reporting_Source varchar(20); -- modify the definition of an existing column

Truncate Table facility; --  deletes all the rows from a table but it doesn't delete the structure of the table 

Rename table facility_2 
to bed_facility; -- used to rename a table

select * from bed_facility;

DROP DATABASE covid_19; -- used to drop the existing database
DROP TABLE bed_facility; -- used to drop the existing table

SET SQL_SAFE_UPDATES = 0; -- when we are using a safe update mode and tried to update a table without WHERE that uses a key column

update facility set Zip_code =99610 
where city= 'ANCHORAGE'; -- used to modify the existing records in a table.

select * from facility;

Delete from facility 
where CCN =21301; -- used to delete rows from a table.

-- Arithmetic operators

SELECT Facility_Name, City, 
Certified_Bed_Count, 
Certified_Bed_Count + 50 
As Revised_bcount 
FROM facility; -- Addition

SELECT Facility_Name, City, 
Certified_Bed_Count, Certified_Bed_Count - 50 
As old_bcount 
FROM facility;   -- Subtraction

SELECT Facility_Name, 
City, 
Certified_Bed_Count, 
Certified_Bed_Count * 2 
As Revised_bcount_2026 
FROM facility;  -- Multiplication

SELECT Facility_Name, 
City, 
Certified_Bed_Count, 
Certified_Bed_Count/2 
As bedcount_2015 
FROM facility;  -- Division

-- Comparison Operators

Select * from confirmed_cases 
where previous_day_admission_influenza_confirmed= 27; -- Equality operator

Select * from suspected_cases 
where staffed_icu_adult_patients_confirmed_and_suspected_covid <> 15; -- Not equal to 


Select total_adult_patients_hospitalized_confirmed_and_suspected_covid 
as adult_patient, staffed_icu_adult_patients_confirmed_and_suspected_covid 
as adult_icu_confirmed 
from suspected_cases 
where staffed_icu_adult_patients_confirmed_and_suspected_covid != 15;

select total_beds 
as TB, inpatient_beds 
as inpatient_b 
from facility_2 
where total_beds != 0;

Select * from suspected_cases 
where hospital_onset_covid < 27; -- Less than Operator

Select * from facility_2 
where overflow_covid > 25;  --  Greater than Operator

Select * from confirmed_cases 
where staffed_icu_adult_patients_confirmed_covid <=27;  -- Less than or Equal to Operator

Select * from deaths 
where deaths_covid >=5;  -- greater than or equal to Operator

-- AND operator 

Select * from deaths
 where previous_day_deaths_influenza> 1 
 and deaths_covid = 28;

-- OR operator 

Select * from confirmed_cases 
where total_adult_patients_hospitalized_confirmed_covid >25 
or staffed_icu_adult_patients_confirmed_covid = 27;

-- NOT operator 

Select * from suspected_cases 
where not total_pediatric_hospitalized_confirmed_and_suspected_covid =15;

-- NULL Operator

UPDATE facility_2 
set overflow_covid = NULL 
where overflow_covid='0';
 
Select * from facility_2 
where overflow_covid is null;

-- NOT NULL Operator

Select * from facility_2 
where overflow_covid is not null;

-- BETWEEN Operator

Select previous_day_admission_adult_covid_suspected_all
 as suspected, staffed_icu_adult_patients_confirmed_and_suspected_covid 
 as confirmed_cases 
 from suspected_cases 
 where previous_day_admission_adult_covid_suspected_all 
 between 11 and 28;

-- NOT BETWEEN Operator

Select total_patients_hospitalized_confirmed_influenza
 as present_day_influenza_confirmed, previous_day_admission_influenza_confirmed
 as previous_day_influenza_confirmed
 from confirmed_cases 
 where total_patients_hospitalized_confirmed_influenza 
 not between 11 and 28;

-- IN Operator

Select * from facility_2 
where overflow_covid 
in (11,15, 27, 28);

-- NOT IN Operator

Select * from facility_2 
where overflow_covid 
not in (11,15, 27, 28);

-- Like Operator

Select * from facility where Facility_Name like 'LA%';  -- find all the records of an employee whose name starts with "AL"

Select * from facility where Facility_Name like '%LA';  --  find all the records of an employee whose name ends with "AL".

Select * from facility where Facility_Name like '%LA%';  -- find all the records of an employee whose name has "AL".

Select * from facility where Facility_Name like '_a____________________';

Select * from facility where Facility_Name like '_____________________________________';

-- ORDER BY Clause

Select * from facility order by CCN;

Select * from facility order by CCN desc;

-- Aggregate Functions
-- SUM

SELECT SUM(previous_day_admission_adult_covid_suspected_all) 
AS total_susspected_cases 
FROM suspected_cases;

-- Average
SELECT AVG(previous_day_admission_adult_covid_suspected_all) 
AS total_susspected_cases 
FROM suspected_cases;

-- MIN

SELECT MIN(total_pediatric_patients_hospitalized_confirmed_covid) 
AS Minimum_pediatric_cases_confirmed 
FROM confirmed_cases;	

-- MAX

SELECT MAX(total_pediatric_patients_hospitalized_confirmed_covid) 
AS Minimum_pediatric_cases_confirmed 
FROM confirmed_cases;

-- COUNT
SELECT COUNT(total_pediatric_patients_hospitalized_confirmed_covid) 
AS total_covid_cases 
FROM confirmed_cases;

-- Group By
SELECT Facility_Name, SUM(Certified_Bed_Count) AS Bed_count FROM facility GROUP BY 
Facility_Name;	

-- Having Clause

SELECT Facility_Name, SUM(Certified_Bed_Count) AS Bed_count
FROM facility
GROUP BY Facility_Name
HAVING Bed_count > 300;

--  Inner Join
drop table analysis;
create table analysis(
S_NO int primary key auto_increment,
CCN int,
Facility_Name varchar(100),
City varchar(100),
Fips_Code int,
Certified_Bed_Count int,
ventilators_used int,
overflow_covid int,
all_adult_hospital_inpatient_bed_occupied int,
hospital_onset_covid int,
total_adult_patients_hospitalized_confirmed_covid int,
deaths_covid int,
previous_day_deaths_influenza int,
previous_day_deaths_covid_and_influenza int);

select * from analysis;

-- ON clause
SELECT 
 a. S_NO,
 f.CCN, 
 f.Facility_Name AS Facility, 
 a.Certified_Bed_Count, 
 a.total_adult_patients_hospitalized_confirmed_covid AS Covid_confirmed, 
 a.deaths_covid
FROM
 facility f 
INNER JOIN analysis a ON f.Facility_Name = a.Facility_Name;

-- Using Clause

SELECT 
 a. S_NO,
 f.CCN, 
 f.Facility_Name AS Facility, 
 a.Certified_Bed_Count, 
 a.total_adult_patients_hospitalized_confirmed_covid AS Covid_confirmed, 
 a.deaths_covid
FROM
 facility f 
INNER JOIN analysis a using(Facility_Name);

-- Outer Join (Left Join)

select 
a.S_NO,
a.Facility_Name as Facility,
a.Certified_Bed_Count,
s.staffed_icu_adult_patients_confirmed_and_suspected_covid
from 
analysis a left join suspected_cases s 
using(hospital_onset_covid) 
order by staffed_icu_adult_patients_confirmed_and_suspected_covid;

-- Outer Join (Right Join

select 
a.S_NO,
a.Facility_Name as Facility,
a.Certified_Bed_Count,
s.staffed_icu_adult_patients_confirmed_and_suspected_covid
from 
analysis a right join suspected_cases s 
using(hospital_onset_covid) 
order by staffed_icu_adult_patients_confirmed_and_suspected_covid;

-- cross join 

SELECT 
a.S_NO,
a.Facility_Name as Facility, 
a.Certified_Bed_Count,
s.staffed_icu_adult_patients_confirmed_and_suspected_covid
FROM
analysis a
CROSS JOIN suspected_cases s;

-- Checking for NULL VALUES

SELECT * FROM Facility WHERE Certified_Bed_Count IS NULL; 
SELECT * FROM Facility WHERE Certified_Bed_Count IS NOT NULL; 

-- Replacing NULL VALUES
-- with COALESCE
SELECT S_NO, Facility_Name, Certified_Bed_Count, COALESCE(Certified_Bed_Count, 0) AS Bed_count FROM analysis;

-- IFNULL()

 SELECT AVG(IFNULL(Certified_Bed_Count, 0)) AS average_bed_count FROM analysis;
 
 -- scalar subquery
 
SELECT Facility_Name, CCN,
Certified_Bed_Count, 
overflow_covid
FROM analysis
WHERE overflow_covid > (SELECT AVG(overflow_covid) FROM analysis);

-- Row Subquery 

SELECT Facility_Name, CCN
FROM analysis
WHERE (Facility_Name, CCN) = (SELECT first_name, last_name FROM temp_employees WHERE status = 'active');

















	






































select * from facility where city = 'PALMER';


SELECT * FROM covid_19.facility;
SET SQL_SAFE_UPDATES = 0;

update covid_19.facility set Week_Ending = "2024-02-24";
 
 
 
 





 


 




