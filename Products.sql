CREATE TABLE products (
  sku_id VARCHAR(10) PRIMARY KEY,
  product_category VARCHAR(50), 
  fat_content VARCHAR(20), 
  item_weight DECIMAL(6,2)
);

INSERT IGNORE INTO products (sku_id, product_category, fat_content, item_weight)
SELECT item_identifier, item_type, item_fat_content, item_weight 
FROM master_staging;