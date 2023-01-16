SELECT order_id, customer_id, employee_id, order_date, required_date,
	shipped_date, ship_via, freight, ship_name, ship_address, ship_postal_code, ship_country
FROM orders
ORDER BY shipped_date, required_date DESC