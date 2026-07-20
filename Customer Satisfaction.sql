SET SESSION cte_max_recursion_depth = 4000;

CREATE TABLE customers (
  customer_id VARCHAR(12) PRIMARY KEY,
  home_store_id VARCHAR(10),
  delivery_pincode INT,
  distance_km DECIMAL(4,2),
  delivery_partner_id VARCHAR(10),
  FOREIGN KEY (home_store_id) REFERENCES stores(store_id)
);

INSERT INTO customers
WITH RECURSIVE seq AS (
  SELECT 1 AS n
  UNION ALL SELECT n+1 FROM seq WHERE n < 3500
)
SELECT
  CONCAT('CUST', 100000+n),
  (SELECT store_id FROM stores ORDER BY RAND() LIMIT 1),
  560001 + FLOOR(RAND()*6000),
  ROUND(0.5 + RAND()*11, 2),
  CONCAT('DP', 2000+FLOOR(RAND()*180))
FROM seq;