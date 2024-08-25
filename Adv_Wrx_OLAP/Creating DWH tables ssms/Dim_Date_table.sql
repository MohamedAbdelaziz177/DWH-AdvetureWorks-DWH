
drop table if exists Dim_Date;
CREATE TABLE [Dim_Date]
(

   Date_id int NOT NULL PRIMARY KEY,
   Full_Date datetime NOT NULL,
   CalendarYear int NOT NULL,
   CalendarQuarter int NOT NULL,
   MonthOfYear int NOT NULL,
   [MonthName] varchar(15) NOT NULL,
   [DayOfMonth]int NOT NULL,
   [DayOfWeek] int NOT NULL,
   [DayName] varchar(15) NOT NULL,

)




-- Creating Indexing

DROP INDEX IF EXISTS dim_date.dim_date_CalendarYear
CREATE INDEX dim_date_CalendarYear
ON dim_date(CalendarYear)

DROP INDEX IF EXISTS dim_date.dim_MonthOfYear
CREATE INDEX dim_date_MonthOfYear
ON dim_date(MonthOfYear)

DROP INDEX IF EXISTS dim_date.dim_MonthName
CREATE INDEX dim_date_MonthName
ON dim_date(MonthName)


