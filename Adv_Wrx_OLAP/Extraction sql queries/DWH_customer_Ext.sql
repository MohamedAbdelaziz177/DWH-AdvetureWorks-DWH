
select


CustomerID as customer_id,
isnull(FirstName,'') as FN,
isnull(MiddleName, '') as MN,
isnull(LastName, '') as LN,
isnull(AddressLine1, 'unkown') as customer_address1,
isnull(AddressLine2, 'unkown') as customer_address2,
isnull(City, 'unkown') as customer_city,
isnull(PhoneNumber,'0') as customer_phone


from sales.Customer c

left join person.person p on (PersonID is not null) and (c.CustomerID = p.BusinessEntityID)

left join Person.BusinessEntityAddress ad on ad.BusinessEntityID = p.BusinessEntityID

left join Person.Address pad on pad.AddressID = ad.AddressID

left join Person.PersonPhone ph on ph.BusinessEntityID = p.BusinessEntityID

