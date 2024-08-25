
drop table if exists dim_customer
CREATE TABLE dim_customer
  (
     customer_key       INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
     customer_id        INT NOT NULL,
     customer_name      NVARCHAR(150),
     customer_address1           NVARCHAR(100),
     customer_address2           NVARCHAR(100),
     customer_city               NVARCHAR(30),
     customer_phone              NVARCHAR(25),
    
	 --  SCD
     start_date         DATETIME NOT NULL DEFAULT (Getdate()),
     end_date           DATETIME NULL,
     is_current         TINYINT NOT NULL DEFAULT (1)

  );

  -- creating indexing

  DROP INDEX IF EXISTS dim_customer.dim_customer_customer_id
  CREATE INDEX dim_customer_customer_id
  ON dim_customer(customer_id)

  DROP INDEX IF EXISTS dim_customer.dim_customer_customer_name
  CREATE INDEX dim_customer_customer_name
  ON dim_customer(customer_name)

  DROP INDEX IF EXISTS dim_customer.dim_customer_customer_city
  CREATE INDEX dim_customer_customer_city
  ON dim_customer(customer_city)

   -- Switching Foreign Keys mode

---------------------------------------------------------------------------------------
alter table dim_customer
DROP CONSTRAINT fk_fact_sales_dim_customer

alter table dim_customer
ADD CONSTRAINT CONSTRAINT fk_fact_sales_dim_customer FOREIGN KEY (customer_key) REFERENCES
     dim_product(customer_key)

----------------------------------------------------------------------------------------