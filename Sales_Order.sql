CREATE TABLE numbers_1_3 (n INT);
INSERT INTO numbers_1_3 VALUES (1),(2),(3);

CREATE TABLE orders (
  order_id VARCHAR(12) PRIMARY KEY,
  customer_id VARCHAR(12), store_id VARCHAR(10), sku_id VARCHAR(10),
  order_timestamp DATETIME, order_value DECIMAL(10,2),
  delivery_time_minutes INT, order_status VARCHAR(20), rating DECIMAL(2,1),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (store_id) REFERENCES stores(store_id),
  FOREIGN KEY (sku_id) REFERENCES products(sku_id)
);

INSERT INTO orders (order_id, customer_id, store_id, sku_id, order_timestamp,
                     order_value, delivery_time_minutes, order_status, rating)
SELECT
  CONCAT('ORD', 100000 + ROW_NUMBER() OVER (ORDER BY m.item_identifier, n.n)),
  CONCAT('CUST', 100000 + FLOOR(1+RAND()*3500)),
  m.store_id, m.item_identifier,
  DATE_ADD('2026-01-01', INTERVAL FLOOR(RAND()*194) DAY) + INTERVAL (7+FLOOR(RAND()*16)) HOUR,
  ROUND(m.sales / (1+FLOOR(RAND()*3)), 2),
  CASE WHEN RAND() < 0.92 THEN FLOOR(8+RAND()*45) END,
  CASE WHEN RAND() < 0.92 THEN 'Delivered' ELSE 'Cancelled' END,
  CASE WHEN RAND() < 0.92 THEN ROUND(LEAST(5, GREATEST(1, m.rating + (RAND()-0.5)))) END
FROM master_staging m
JOIN numbers_1_3 n ON n.n <= 1 + FLOOR(RAND()*3);