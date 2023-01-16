SELECT company_name, orders.order_id FROM customers
LEFT JOIN orders USING (customer_id)
WHERE orders.order_id IS NULL
