CREATE TABLE IF NOT EXISTS smart_health.orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    total_amount NUMERIC(10,2), 
    tax_amount NUMERIC(10,2), 
    status BOOLEAN DEFAULT TRUE,
    patient_id INTEGER NOT NULL,
    appointment_id INTEGER 

);


CREATE TABLE IF NOT EXISTS smart_health.payments (
    payment_id SERIAL PRIMARY KEY,
    reference_number VARCHAR (50) NOT NULL,
    payment_date DATE NOT NULL,
    amount NUMERIC(10,2) NOT NULL,
    payment_method_id INTEGER NOT NULL,
    order_id INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS smart_health.payment_methods (
    payment_method_id SERIAL PRIMARY KEY,
    payment_name VARCHAR (50) NOT NULL
);



ALTER TABLE smart_health.orders ADD CONSTRAINT fk_orders_patients
    FOREIGN KEY (patient_id) REFERENCES smart_health.patients (patient_id)
    ON UPDATE CASCADE ON DELETE RESTRICT;


ALTER TABLE smart_health.orders ADD CONSTRAINT fk_orders_appointments
    FOREIGN KEY (appointment_id) REFERENCES smart_health.appointments (appointment_id)
    ON UPDATE CASCADE ON DELETE RESTRICT;




ALTER TABLE smart_health.payments ADD CONSTRAINT fk_payments_payment_methods
    FOREIGN KEY (payment_method_id) REFERENCES smart_health.payment_methods (payment_method_id)
    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE smart_health.payments ADD CONSTRAINT fk_payments_orders
    FOREIGN KEY (order_id) REFERENCES smart_health.orders (order_id)
    ON UPDATE CASCADE ON DELETE CASCADE;