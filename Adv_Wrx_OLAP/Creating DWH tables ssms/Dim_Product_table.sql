

drop table if exists Dim_Product;
CREATE TABLE dim_product
  (
     product_key         INT NOT NULL PRIMARY KEY IDENTITY(1, 1),-- surrogate key
     product_id          INT NOT NULL,--alternate key, business key
     product_name        NVARCHAR(50),
     Product_description NVARCHAR(400),
     product_subcategory NVARCHAR(50),
     product_category    NVARCHAR(50),
     color               NVARCHAR(15),
     model_name          NVARCHAR(50),
     --  reorder_point       SMALLINT,
     unit_price       MONEY,
     -- Metadata
     --  source_system_code  TINYINT NOT NULL,
     -- SCD
     start_date          DATETIME NOT NULL DEFAULT (Getdate()),
     end_date            DATETIME,
     is_current          TINYINT NOT NULL DEFAULT (1),
     
	 
  );


  -- creating indexing

  DROP INDEX IF EXISTS dim_product_product_id ON dim_product
  CREATE INDEX dim_product_product_id
  ON dim_product(product_id);


  DROP INDEX IF EXISTS dim_prodct_product_category ON dim_product
  CREATE INDEX dim_prodct_product_category
  ON dim_product(product_category); 

  DROP INDEX IF EXISTS dim_prodct_product_name ON dim_product
  CREATE INDEX dim_prodct_product_name
  ON dim_product(product_name); 

  -- Switching Foreign Keys mode

---------------------------------------------------------------------------------------
alter table Dim_Product
DROP CONSTRAINT fk_fact_sales_dim_product

alter table Dim_Product
ADD CONSTRAINT CONSTRAINT fk_fact_sales_dim_product FOREIGN KEY (product_key) REFERENCES
     dim_product(product_key)

-------------------------------------------------------------------------------------