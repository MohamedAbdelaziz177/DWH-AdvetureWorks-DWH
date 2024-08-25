

select
x.SalesOrderID, TerritoryID, CustomerID,
cast(convert(varchar(50), OrderDate, 112) as int) as orderDate,
cast(convert(varchar(50), ShipDate, 112) as int) as shipDate,
cast(convert(varchar(50), DueDate, 112) as int) as DueDate,

Freight,
TaxAmt

from Sales.SalesOrderHeader x 

