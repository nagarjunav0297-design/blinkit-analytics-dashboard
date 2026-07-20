SELECT store_id, COUNT(*) FROM orders GROUP BY store_id;
SELECT order_status, COUNT(*) FROM orders GROUP BY order_status;
SELECT COUNT(*) FROM inventory WHERE stock_on_hand < reorder_level;