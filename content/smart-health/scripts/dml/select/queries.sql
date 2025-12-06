-- 1. Obtener los últimos 5 pacientes registrados,
-- mostrando su nombre completo en mayúsculas, las iniciales en formato concatenado (primer nombre, primer apellido),
-- el tipo de documento en minúsculas, los últimos 4 dígitos del documento,
-- y la longitud total de su correo electrónico,
-- ordenados por fecha de registro de más reciente a más antiguo.
-- Dificultad: BAJA
-- Value(0.4)


--  patient_id | nombre_completo_mayusculas | iniciales |               tipo_documento_minusculas               | ultimos_cuatro_digitos | longitud_email |       fecha_registro
-- ------------+----------------------------+-----------+-------------------------------------------------------+------------------------+----------------+----------------------------
--           4 | LAURA MORALES LEóN         | L.M.      | certificado cabildo                                   | 5750                   |             25 | 2025-10-26 17:32:41.882538
--           5 | GABRIELA LóPEZ CIFUENTES   | G.L.      | cédula de extranjería / identificación de extranjería | 1283                   |             26 | 2025-10-26 17:32:41.882538
--           6 | JULIANA ÁLVAREZ RODRíGUEZ  | J.Á.      | cédula de ciudadanía                                  | 3036                   |             25 | 2025-10-26 17:32:41.882538
--           8 | MARíA CASTAñO LóPEZ        | M.C.      | número de identificación personal (nip)               | 7933                   |             23 | 2025-10-26 17:32:41.882538
--           3 | DIEGO PéREZ PINEDA         | D.P.      | tarjeta de identidad                                  | 3023                   |             27 | 2025-10-26 17:32:41.882538
-- (5 filas)



-- 2. Mostrar los 5 tipos de documento más utilizados por los pacientes,
-- mostrando el nombre del tipo de documento, la cantidad total de pacientes,
-- y la edad promedio de los pacientes que usan ese tipo de documento,
-- ordenados por cantidad de pacientes de mayor a menor.
-- Dificultad: BAJA
-- Value(0.8)

--                     tipo_documento                     | total_pacientes | edad_promedio
-- -------------------------------------------------------+-----------------+---------------
--  Cédula de Ciudadanía                                  |            7630 |          42.1
--  Número Único de Identificación Personal (NUIP)        |            7594 |          41.7
--  Registro Civil de Nacimiento                          |            7490 |          42.0
--  Cédula de Extranjería / Identificación de Extranjería |            7482 |          41.8
--  Tarjeta de Identidad                                  |            7481 |          42.1
-- (5 filas)


-- 3. Listar los 8 médicos con mayor cantidad de citas en los últimos 6 meses,
-- mostrando su nombre completo, el total de citas realizadas,
-- los años que llevan trabajando en el hospital calculados desde su fecha de admisión hasta hoy,
-- y la fecha de su ultima cita,
-- ordenados por el número total de citas de mayor a menor.
-- Dificultad: INTERMEDIA
-- Value(1.00)

--  nombre_completo_doctor | total_citas | años_en_hospital | fecha_ultima_cita
-- ------------------------+-------------+------------------+-------------------
--  Miguel Díaz            |           7 |                9 | 2025-12-29
--  Miguel Mendoza         |           6 |               16 | 2025-10-10
--  Daniela Cabrera        |           6 |               11 | 2025-12-28
--  Carolina Jiménez       |           5 |               21 | 2025-11-04
--  Tatiana Mendoza        |           5 |               12 | 2025-12-13
--  Daniela Rincón         |           5 |                6 | 2025-12-07
--  Mariana Rojas          |           5 |               11 | 2025-11-26
--  Adriana Ríos           |           5 |               11 | 2025-12-25
-- (8 filas)


-- 4. Listar los 15 pagos más recientes mostrando el número de referencia del pago,
-- la fecha y monto del pago, el método de pago utilizado, el monto total de la orden asociada,
-- el nombre completo del paciente, la fecha de la cita si existe, y el doctor asignado,
-- ordenados por fecha de pago de más reciente a más antiguo, y luego por monto de mayor a menor.
-- Dificultad: INTERMEDIA-ALTA
-- Value(1.2)

--  payment_id | numero_referencia  | fecha_pago | monto_pago |    metodo_pago     | monto_total_orden | fecha_orden |  nombre_paciente  | fecha_cita |   nombre_doctor   |   tipo_cita
-- ------------+--------------------+------------+------------+--------------------+-------------------+-------------+-------------------+------------+-------------------+---------------
--           1 | PAY-20241217-K57JQ | 2025-11-11 |   63337.07 | Efectivo           |         413490.49 | 2024-11-09  | Natalia Vega      | 2020-12-16 | Lorena Torres     | Terapia
--       22217 | PAY-20241231-KAHVE | 2024-12-31 |  373217.92 | Transferencia      |         404027.01 | 2024-10-27  | Jorge Pérez       | 2020-10-12 | Natalia Mendoza   | Vacunación
--        1538 | PAY-20241231-U3ICK | 2024-12-31 |  194614.20 | Efectivo           |         194614.20 | 2024-01-17  | Mónica Peña       |            |                   |
--       18817 | PAY-20241231-G7B7D | 2024-12-31 |  122987.28 | Transferencia      |         376952.16 | 2024-06-05  | Rodrigo Lozano    | 2021-09-27 | Diego Castro      | Psicología
--       14507 | PAY-20241231-PH3UJ | 2024-12-31 |  106911.43 | Tarjeta de débito  |         238076.08 | 2024-04-09  | Santiago Montoya  |            |                   |
--        8982 | PAY-20241231-YISFZ | 2024-12-31 |   75352.14 | Efectivo           |         177506.78 | 2024-09-30  | Paola López       | 2020-05-11 | Jorge Soto        | Psicología
--        4685 | PAY-20241231-1VB04 | 2024-12-31 |   18457.80 | Efectivo           |         379092.54 | 2024-11-14  | Mariana Ramírez   | 2024-06-26 | Santiago Cárdenas | Teleconsulta
--       18547 | PAY-20241231-Z3ALO | 2024-12-31 |   13654.91 | Bre-B              |         166357.58 | 2024-10-21  | Felipe Vargas     | 2020-04-03 | Sara Medina       | Nutrición
--        6917 | PAY-20241231-BGTRU | 2024-12-31 |    4911.70 | Tarjeta de crédito |         126331.02 | 2024-12-03  | Gabriela Salazar  | 2023-01-12 | Alejandro Ramírez | Examen Médico
--       23417 | PAY-20241230-GFBA1 | 2024-12-30 |  244689.65 | Efectivo           |         290449.67 | 2024-01-31  | Miguel Castro     |            |                   |
--       18994 | PAY-20241230-G5CWT | 2024-12-30 |  190197.64 | Bre-B              |         190197.64 | 2024-01-01  | Carlos Herrera    | 2021-08-10 | Carlos Castro     | Control
--       24129 | PAY-20241230-JZVWX | 2024-12-30 |  168240.08 | Tarjeta de crédito |         208866.91 | 2024-10-29  | Valentina Navarro | 2023-12-18 | Carlos Salazar    | Nutrición
--        1526 | PAY-20241230-I7Z0K | 2024-12-30 |  153943.08 | Tarjeta de crédito |         397788.15 | 2024-08-21  | Carlos Mendoza    | 2022-05-10 | Daniela Peña      | Nutrición
--       24229 | PAY-20241230-OLPK4 | 2024-12-30 |  117567.19 | Bre-B              |         319696.22 | 2024-05-13  | Felipe Hernández  |            |                   |
--       19809 | PAY-20241230-COY7A | 2024-12-30 |  103212.51 | Bre-B              |         492566.59 | 2024-07-31  | Andrés Castro     |            |                   |
-- (15 filas)


-- 5. Listar los 8 métodos de pago más utilizados mostrando el nombre del método,
-- la cantidad total de transacciones realizadas, el monto total recaudado por ese método,
-- el monto promedio por transacción (redondeado a 2 decimales), el monto máximo y mínimo registrado,
-- y el número de pacientes que han usado ese método de pago,
-- solo para aquellos métodos que tengan más de 5 transacciones y un monto total mayor a 1000,
-- ordenados primero por cantidad de transacciones de mayor a menor, y luego por monto total descendente.
-- Dificultad: ALTA
-- Value(1.6)

SELECT
    T2.payment_name AS metodo_pago,
    COUNT(T3.order_id) AS total_transacciones,
    SUM(T1.amount) AS monto_total_recaudado,
    AVG(T1.amount) AS monto_promedio_transaccion,
    MAX(T1.amount) AS monto_maximo,
    MIN(T1.amount) AS monto_minimo,
    COUNT(T3.patient_id) AS pacientes_por_metodos_pago
FROM smart_health.payments T1
INNER JOIN smart_health.payment_methods T2 ON T1.payment_method_id = T2.payment_method_id
INNER JOIN smart_health.orders T3 ON T3.order_id = T1.order_id
GROUP BY T2.payment_name
HAVING COUNT(T3.order_id) > 5 AND  SUM(T1.amount) > 1000
ORDER BY total_transacciones DESC, monto_total_recaudado DESC
LIMIT 8;

