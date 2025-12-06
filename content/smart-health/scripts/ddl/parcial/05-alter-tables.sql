ALTER TABLE smart_health.orders
ADD CONSTRAINT chk_orders_total_amount
CHECK (total_amount >=0);

ALTER TABLE smart_health.orders
ADD CONSTRAINT chk_orders_tax_amount
CHECK (tax_amount >=0);


ALTER TABLE smart_health.payments
ADD CONSTRAINT chk_payments_amount
CHECK (amount > 0);


ALTER TABLE smart_health.payment_methods
ADD CONSTRAINT chk_payment_methods_payment_name
CHECK (payment_name IN ('Tarjeta de crédito', 'Efectivo', 'Transferencia', 'Tarjeta de débito', 'Bre-B'));

