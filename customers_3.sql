SELECT customers.company_name, CONCAT(employees.first_name, ' ', employees.last_name)
FROM orders
JOIN customers USING (customer_id)
JOIN employees USING (employee_id)
JOIN shippers  ON (orders.ship_via = shippers.shipper_id)
WHERE customers.city = 'London' AND employees.city = 'London'
    AND shippers.company_name = 'Speedy Express'		
