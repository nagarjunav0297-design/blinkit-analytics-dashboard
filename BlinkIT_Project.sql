CREATE DATABASE blinkit_project;
USE blinkit_project;

CREATE TABLE master_staging (
  item_fat_content VARCHAR(20), 
  item_identifier VARCHAR(10), 
  item_type VARCHAR(50),
  outlet_establishment_year INT, 
  store_id VARCHAR(10), 
  outlet_location_type VARCHAR(10),
  outlet_size VARCHAR(10), 
  outlet_type VARCHAR(30), 
  item_visibility DECIMAL(10,8),
  item_weight DECIMAL(6,2), 
  sales DECIMAL(10,4), 
  rating DECIMAL(3,1)
);

SET GLOBAL LOCAL_INFILE = ON ;
LOAD DATA LOCAL INFILE 'C:/Users/Hp/OneDrive/Desktop/Excel/Projects/master_dataset.csv'
INTO TABLE master_staging
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

TRUNCATE TABLE master_staging;

SELECT COUNT(*) FROM master_staging;                    -- should be 8523
SELECT MIN(item_visibility), MAX(item_visibility) FROM master_staging;  -- should look like 0.00 to ~0.33
SELECT * FROM master_staging LIMIT 5;