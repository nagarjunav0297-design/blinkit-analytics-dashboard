CREATE TABLE inventory (
  store_id VARCHAR(10), 
  sku_id VARCHAR(10),
  stock_on_hand INT, 
  reorder_level INT, 
  expiry_date DATE,
  PRIMARY KEY (store_id, sku_id),
  FOREIGN KEY (store_id) REFERENCES stores(store_id),
  FOREIGN KEY (sku_id) REFERENCES products(sku_id)
);

INSERT INTO inventory (store_id, sku_id, stock_on_hand, reorder_level, expiry_date)
SELECT store_id, item_identifier,
  FLOOR(5 + RAND()*245),
  FLOOR(5 + RAND()*40),
  DATE_ADD(CURDATE(), INTERVAL FLOOR(1+RAND()*365) DAY)
FROM master_staging;