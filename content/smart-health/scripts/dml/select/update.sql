-- EJERCICIO 1 - REASIGNACION DE MÉTODO DE PAGO
-- Actualizar la información de un pago ya existente para modificar 
-- su método de pago debido a un error en la digitación.

-- Instrucciones:

-- 1. Identifique el pago asociado a la orden cuyo número de referencia sea REF-2025-001.
-- 2. Modifique su método de pago a “Transferencia” (verifique el payment_method_id correspondiente).
-- 3. Actualice la fecha de pago al día actual (CURRENT_DATE).

-- Validación esperada:
-- - El registro debe mantener el mismo monto y número de referencia, pero reflejar el nuevo método de pago y la nueva fecha.

-- Valida con esta consulta, antes y despúes de realizar el cambio.
SELECT 
    T1.reference_number,
    T1.order_id,
    T1.payment_date,
    T2.payment_name
FROM smart_health.payments T1
INNER JOIN smart_health.payment_methods T2 ON T1.payment_method_id = T2.payment_method_id
WHERE T1.reference_number = 'PAY-20241217-K57JQ';

--- REGISTROS ANTES DE ACTUALIZAR
--   reference_number  | order_id | payment_date | payment_name
-- --------------------+----------+--------------+---------------
--  PAY-20241217-K57JQ |        1 | 2024-12-17   | Transferencia
-- (1 fila)

--- REGISTROS DESPUES DE ACTUALIZAR
--   reference_number  | order_id | payment_date | payment_name
-- --------------------+----------+--------------+--------------
--  PAY-20241217-K57JQ |        1 | 2025-11-11   | Efectivo
-- (1 fila)

--------------------------------------------------------------------------
--------------------------------------------------------------------------

-- EJERCICIO 2: CORRECCION DE IMPUESTOS EN ÓRDENES

-- Objetivo:
-- Ajustar el valor del impuesto (tax_amount) en una orden debido a un cambio en la tarifa impositiva.

-- Instrucciones:

-- 1. Seleccione la orden del paciente con patient_id = 10.
-- 2. Aumente el valor del impuesto (tax_amount) en un 10% del total_amount.
-- 3. Actualice el campo order_date al día actual para reflejar la modificación.

-- Validación esperada:
-- El campo tax_amount debe reflejar el incremento calculado, y order_date debe mostrar la fecha actual.

-- Valida con esta consulta, antes y despúes de realizar el cambio.


SELECT
    CONCAT(T1.first_name,' ',T1.first_surname) AS patient,
    T2.total_amount as monto_total,
    T2.tax_amount AS impuesto,
    T2.order_date
FROM smart_health.patients T1
INNER JOIN smart_health.orders T2 ON T1.patient_id = T2.patient_id
WHERE T1.patient_id = 25;

--- REGISTROS ANTES DE ACTUALIZAR
--    patient    | monto_total | impuesto | order_date
-- --------------+-------------+----------+------------
--  Manuel Gómez |   454675.29 | 86388.31 | 2024-09-20
-- (1 fila)

--- REGISTROS DESPÚES DE ACTUALIZAR
--    patient    | monto_total | impuesto  | order_date
-- --------------+-------------+-----------+------------
--  Manuel Gómez |   454675.29 | 131855.84 | 2025-11-11
-- (1 fila)