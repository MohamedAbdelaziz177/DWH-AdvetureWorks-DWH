
-- Filling Date_Dim
declare @startDate datetime
declare @endDate datetime

set @startDate = '2001-01-01'
set @endDate = '2024-12-30'

while @startDate <= @endDate  
begin
      insert into Dim_Date   
	  values
      (
	  cast(convert(varchar(20), @startDate,112) as int)  /* Date as int = Date_id */,
	  @startDate,
	  YEAR(@startDate)                                     /* Year of date numerically */,
	  DATEPART(qq, @startDate)                            /* Quarter of year */,
	  MONTH(@startDate)                                  /* Month as number */,
	  DATENAME(MONTH, @startDate)                       /* Months name */,                    
	  DAY(@startDate)                                  /* Day in month */,
	  DATEPART(WEEKDAY, @startDate)                   /* weekday as number */, 
	  DATENAME(WEEKDAY, @startDate)                  /* weekday as name */
      )

	set @startDate = DATEADD(day, 1, @startDate) -- i += 1
end
   