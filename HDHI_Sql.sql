create database HDMI;
use HDMI;

-- Data Cleaning

select * from HDHI_Admission_data;

-- D_O_A data type Changing
--   4/13/2017 --> 2017/04/13

select D_O_A from HDHI_Admission_data where LEN(D_O_A) = 9;

update HDHI_Admission_data
set D_O_A = concat('0',D_O_A)
where len(D_O_A) = 9 ;

--    04/13/2017 --> 04-13-2017

select D_O_A, SUBSTRING(D_O_A,3,1) from HDHI_Admission_data;

select D_O_A, concat(SUBSTRING(D_O_A,1,2),'-',SUBSTRING(D_O_A,4,2),'-',SUBSTRING(D_O_A,7,4)) from HDHI_Admission_data;

select D_O_A from HDHI_Admission_data where SUBSTRING(D_O_A,3,1) = '/';

update HDHI_Admission_data
set D_O_A = concat(SUBSTRING(D_O_A,1,2),'-',SUBSTRING(D_O_A,4,2),'-',SUBSTRING(D_O_A,7,4)) 
where SUBSTRING(D_O_A,3,1) = '/';

select D_O_A, concat(SUBSTRING(D_O_A,7,4),'-',SUBSTRING(D_O_A,1,2),'-',SUBSTRING(D_O_A,4,2)) from HDHI_Admission_data;

update HDHI_Admission_data
set D_O_A = concat(SUBSTRING(D_O_A,7,4),'-',SUBSTRING(D_O_A,1,2),'-',SUBSTRING(D_O_A,4,2));

alter table HDHI_Admission_data
alter column D_O_A date;

select D_O_A from HDHI_Admission_data where SUBSTRING(D_O_A,5,1) = '-' and SUBSTRING(D_O_A,8,1) = '-';

select try_cast(D_O_A as date) from HDHI_Admission_data;

update HDHI_Admission_data
set D_O_A = try_cast(D_O_A as date);

-- D_O_D data type Changing
--   4/13/2017 --> 2017/04/13

select D_O_D from HDHI_Admission_data where LEN(D_O_D) = 9;

update HDHI_Admission_data
set D_O_D = concat('0',D_O_D)
where len(D_O_D) = 9;

--    04/13/2017 --> 04-13-2017

select D_O_D, SUBSTRING(D_O_D,3,1) from HDHI_Admission_data;

select D_O_D, concat(SUBSTRING(D_O_D,1,2),'-',SUBSTRING(D_O_D,4,2),'-',SUBSTRING(D_O_D,7,4)) from HDHI_Admission_data;

select D_O_D from HDHI_Admission_data where SUBSTRING(D_O_D,3,1) = '/';

update HDHI_Admission_data
set D_O_D = concat(SUBSTRING(D_O_D,1,2),'-',SUBSTRING(D_O_D,4,2),'-',SUBSTRING(D_O_D,7,4)) 
where SUBSTRING(D_O_D,3,1) = '/';

select D_O_D, concat(SUBSTRING(D_O_D,7,4),'-',SUBSTRING(D_O_D,1,2),'-',SUBSTRING(D_O_D,4,2)) from HDHI_Admission_data;

update HDHI_Admission_data
set D_O_D = concat(SUBSTRING(D_O_D,7,4),'-',SUBSTRING(D_O_D,1,2),'-',SUBSTRING(D_O_D,4,2));

alter table HDHI_Admission_data
alter column D_O_D date;

select D_O_D from HDHI_Admission_data where SUBSTRING(D_O_D,5,1) = '-' and SUBSTRING(D_O_D,8,1) = '-';

select try_cast(D_O_D as date) from HDHI_Admission_data;

update HDHI_Admission_data
set D_O_D = try_cast(D_O_D as date);

------------------------------------------------------------------------------------------------------------------------------
-- MRD_No 
select * from HDHI_Admission_data;

select * from HDHI_Admission_data where MRD_No = 'nill';

update HDHI_Admission_data
set MRD_No = '0'
where MRD_No = 'Nill';

alter table HDHI_Admission_data
alter column MRD_No int;

------------------------------------------------------------------------------------------------------------------------------

select distinct duration_of_stay from HDHI_Admission_data;

alter table HDHI_Admission_data 
alter column duration_of_stay int;

select distinct duration_of_intensive_unit_stay from HDHI_Admission_data;

alter table HDHI_Admission_data 
alter column duration_of_intensive_unit_stay int;

select distinct outcome from HDHI_Admission_data;

select distinct smoking from HDHI_Admission_data;

alter table HDHI_Admission_data 
alter column smoking int;

select distinct alcohol from HDHI_Admission_data;

alter table HDHI_Admission_data 
alter column alcohol int;

select distinct DM from HDHI_Admission_data;

alter table HDHI_Admission_data 
alter column DM int;

select distinct HTN from HDHI_Admission_data;

alter table HDHI_Admission_data 
alter column HTN int;

select distinct rural from HDHI_Admission_data;
------------------------------------------------------------------------------------------------------------

-- HDHI_Mortality_Date 

select * from HDHI_Mortality_Data;

alter table HDHI_Mortality_Data 
alter column S_NO int;

select date_of_brought_dead from HDHI_Mortality_Data;

-- date format of [4/2/2017], [4/11/2017], [11/1/2017]

select Date_of_brought_dead from HDHI_Mortality_Data;

select Date_of_brought_dead from HDHI_Mortality_Data where len(Date_of_brought_dead) = 8;

select Date_of_brought_dead, concat(0,SUBSTRING(Date_of_brought_dead,1,2),'0',SUBSTRING(Date_of_brought_dead,3,6)) 
from HDHI_Mortality_Data where len(Date_of_brought_dead) = 8;

update HDHI_Mortality_Data
set Date_of_brought_dead = concat(0,SUBSTRING(Date_of_brought_dead,1,2),'0',SUBSTRING(Date_of_brought_dead,3,6))
where len(Date_of_brought_dead) = 8;

select Date_of_brought_dead, REVERSE(date_of_brought_dead) from HDHI_Mortality_Data where len(Date_of_brought_dead) = 9;

select Date_of_brought_dead, substring(reverse(date_of_brought_dead),6,2),
substring(substring(reverse(date_of_brought_dead),6,2),2,2)
from HDHI_Mortality_Data where len(Date_of_brought_dead) = 9;

select DATE_OF_BROUGHT_DEAD, concat(SUBSTRING(date_of_brought_dead,1,3),'0',substring(date_of_brought_dead,4,6))
from HDHI_Mortality_Data where substring(substring(reverse(date_of_brought_dead),6,2),2,2) = '/';

update HDHI_Mortality_Data
set DATE_OF_BROUGHT_DEAD = concat(SUBSTRING(date_of_brought_dead,1,3),'0',substring(date_of_brought_dead,4,6))
where substring(substring(reverse(date_of_brought_dead),6,2),2,2) = '/';

select Date_of_brought_dead from HDHI_Mortality_Data where len(DATE_OF_BROUGHT_DEAD) <> 10

select Date_of_brought_dead, concat('0',DATE_OF_BROUGHT_DEAD) from HDHI_Mortality_Data where len(DATE_OF_BROUGHT_DEAD) <> 10;

update HDHI_Mortality_Data
set Date_of_brought_dead = concat('0',DATE_OF_BROUGHT_DEAD)
where len(DATE_OF_BROUGHT_DEAD) <> 10;

select Date_of_brought_dead, concat(SUBSTRING(date_of_brought_dead,4,2),'-',SUBSTRING(date_of_brought_dead,1,2),'-',SUBSTRING(date_of_brought_dead,7,4))
from HDHI_Mortality_Data;

update HDHI_Mortality_Data
set DATE_OF_BROUGHT_DEAD = concat(SUBSTRING(date_of_brought_dead,4,2),'-',SUBSTRING(date_of_brought_dead,1,2),'-',SUBSTRING(date_of_brought_dead,7,4));

update HDHI_Mortality_data
set DATE_OF_BROUGHT_DEAD = try_cast(Date_of_brought_dead as date);

select * from HDHI_Mortality_Data;

-- HDHI_Pollution_Data

select date from HDHI_Pollution_Data;

select distinct len(date) from HDHI_Pollution_Data;

select Date from HDHI_Pollution_Data where len(date) = 8;

select date, concat('0',substring(date,1,2),'0',substring(date,3,6)) from HDHI_Pollution_Data where LEN(date) = 8;

update HDHI_Pollution_Data
set date = concat('0',substring(date,1,2),'0',substring(date,3,6))
where LEN(date) = 8;

select date, reverse(date) from HDHI_Pollution_Data where len(date) = 9;

select date, reverse(concat(reverse(date),'0')) from HDHI_Pollution_Data where substring(reverse(date),8,1) = '/' and len(date) = 9;

update HDHI_Pollution_Data
set date = reverse(concat(reverse(date),'0'))
where substring(reverse(date),8,1) = '/' and len(date) = 9;

select date, reverse(concat(substring(reverse(date),1,6),'0',substring(reverse(date),7,3))) from HDHI_Pollution_Data where len(date) = 9;

update HDHI_Pollution_Data
set date = reverse(concat(substring(reverse(date),1,6),'0',substring(reverse(date),7,3)))
where LEN(date) = 9;

select distinct(len(date)) from HDHI_Pollution_Data;

select date, concat(SUBSTRING(date,1,2),'-',substring(date,4,2),'-',substring(date,7,4)) from HDHI_Pollution_Data;

update HDHI_Pollution_Data
set date = concat(SUBSTRING(date,1,2),'-',substring(date,4,2),'-',substring(date,7,4));

alter table hdhi_pollution_data
alter column date date;


-- Diagnosis Table

select * from HDHI_Admission_data;
