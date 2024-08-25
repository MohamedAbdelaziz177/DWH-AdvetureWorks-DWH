

select id1 as product_id,
isnull(product_name, 'unkown'),
isnull(Product_description, 'unkown'),
isnull(product_subcategory, 'unkown'),
isnull(product_category,'unkown'),
isnull(color, 'unkown'),
isnull(product_model, 'unkown') as model_name,
unit_price

from
(
select p.ProductID id1, p.name as Product_name, p.StandardCost AS unit_price,
color, ps.Name as product_SubCategory, pc.Name as product_category
from
Production.Product p left join Production.ProductSubcategory ps
on p.ProductSubcategoryID = ps.ProductSubcategoryID
left join Production.ProductCategory pc
on ps.ProductCategoryID = pc.ProductCategoryID

) t1

join
(
select ProductID id2, pm.Name as product_model, Description as product_description
from Production.Product p left join Production.ProductModel pm
on p.ProductModelID = pm.ProductModelID
left join Production.ProductModelProductDescriptionCulture pmd
on p.ProductModelID = pmd.ProductModelID
left join Production.ProductDescription pd
on pmd.ProductDescriptionID = pd.ProductDescriptionID

) t2

on id1 = id2
order by id1

