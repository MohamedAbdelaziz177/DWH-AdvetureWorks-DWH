
DROP TABLE IF EXISTS dim_territory
CREATE TABLE dim_territory
  (
     territory_key      INT PRIMARY KEY IDENTITY(1, 1),
     territory_id       INT NOT NULL,
     territory_name     NVARCHAR(50),
     territory_country  NVARCHAR(400),
     territory_group    NVARCHAR(50),
    -- source_system_code TINYINT NOT NULL,
     start_date         DATETIME NOT NULL DEFAULT (Getdate()),
     end_date           DATETIME,
     is_current         TINYINT NOT NULL DEFAULT (1),
    
  );


  -- Creating Indexing
  DROP INDEX IF EXISTS dim_territory.territory_id
  CREATE INDEX dim_territory_territory_id
  ON dim_territory(territory_id); 

  DROP INDEX IF EXISTS dim_territory.territory_name
  CREATE INDEX dim_territory_territory_name
  ON dim_territory(territory_name); 

  DROP INDEX IF EXISTS dim_territory.territory_country
  CREATE INDEX dim_territory_territory_country
  ON dim_territory(territory_country); 


   -- Switching Foreign Keys mode

---------------------------------------------------------------------------------------
alter table dim_territory
DROP CONSTRAINT fk_fact_sales_dim_territory 

alter table dim_customer
ADD CONSTRAINT  fk_fact_sales_dim_territory  FOREIGN KEY (territory_key) REFERENCES
     dim_product(territory_key)

----------------------------------------------------------------------------------------