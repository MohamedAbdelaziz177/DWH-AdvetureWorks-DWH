
DROP TABLE IF EXISTS fact_sales
CREATE TABLE fact_sales
  (
     product_key    INT NOT NULL,
     customer_key   INT NOT NULL,
     territory_key  INT NOT NULL,
     order_date_key INT NOT NULL,
     sales_order_id VARCHAR(50) NOT NULL,
     line_number    INT NOT NULL,
     quantity       INT,
     unit_price     MONEY,
     unit_cost      MONEY,
     tax_amount     MONEY,
     freight        MONEY,
     extended_sales MONEY,
     extened_cost   MONEY,
     created_at     DATETIME NOT NULL DEFAULT(Getdate()),


     CONSTRAINT pk_fact_sales PRIMARY KEY CLUSTERED (sales_order_id, line_number),


     CONSTRAINT fk_fact_sales_dim_product FOREIGN KEY (product_key) REFERENCES
     dim_product(product_key),

     CONSTRAINT fk_fact_sales_dim_customer FOREIGN KEY (customer_key) REFERENCES
     dim_customer(customer_key),

     CONSTRAINT fk_fact_sales_dim_territory FOREIGN KEY (territory_key)
     REFERENCES dim_territory(territory_key),

     CONSTRAINT fk_fact_sales_dim_date FOREIGN KEY (order_date_key) REFERENCES
     dim_date(date_id)
  );


-- creating indexing
DROP INDEX if exists fact_sales.fact_sales_dim_customer;
CREATE INDEX fact_sales_dim_customer
  ON fact_sales(customer_key);


DROP INDEX if exists fact_sales.fact_sales_dim_territory;
CREATE INDEX fact_sales_dim_territory
  ON fact_sales(territory_key);


DROP INDEX if exists fact_sales.fact_sales_dim_date;
CREATE INDEX fact_sales_dim_date
  ON fact_sales(order_date_key);


  