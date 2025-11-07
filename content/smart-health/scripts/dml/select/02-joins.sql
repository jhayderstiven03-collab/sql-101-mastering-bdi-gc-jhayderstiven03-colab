--1. obtiene el listado de municipios y sus respectivos departamentos, 
--uniendo ambas tablas mediante la clave foránea department_code. Se ordena por el nombre del departamento 
--para facilitar la localización geográfica, mostrando los 15 primeros resultados.

--INNER JOIN
--1. tablas asociadas
--smart_health.municipalities  T1
-- smart_health.departments    T2

--2. llaves de cruce
--T1.department_code
--T2.department_code

SELECT
    T1.T1.municipality_code AS codigo_municipio,
    T1.municipality_name AS municipio,
    T2.department_name AS departamento
FROM municipalities T1
INNER JOIN T2 ON T1.department_code = T2.department_code
ORDER BY T2.department_name
Limit 15;

--Contar los pacientes que tengan o no tengan un numero de telefono asociado

--RIGHT JOIN
--1. tablas asociadas
--smart_health.patients  T1
-- smart_health.patients_phones    T2

--2. llaves de cruce
--T1.patient_id
--T2.patient_id

SELECT  
    COUNT(DISTINCT T1.patients_id)
FROM patient_phones T1
RIGHT JOIN patients T2 ON T1.patient_id = T2.patient_id;



--Contar los doctores que no tengan una especialidad

--LEFT JOIN 
--1. tablas asociadas
-- smarth_health.doctors   T1
--smarth_health.doctor_spacialities  T2


--2. llaves de cruce
-- T1.doctor_id
--T2.doctor_id

SELECT
    COUNT(*)
    FROM doctor_specialties  T1
    LEFT JOIN doctors T2 On T1.doctor_id = T2.doctor_id
    WHERE T2.doctor_id IS NULL;



-- 4. Mostrar las citas que se haya cancelado
-- entre el 20 de octubre del 2025 y el 23 de octubre del 2025.
-- Adicionalmente, es importante conocer, en que cuarto se iban 
-- a atender estas citas. Y la razon de la cancelacion si la hay.
-- Mostrar solo los 10 primeros registros.

-- JOIN 
--1. tablas asociadas
-- smarth_health.appointments   T1
--smarth_health.rooms  T2


--2. llaves de cruce
-- T1.room_id
--T2.room_id

SELECT 
    T1.appointment_type AS cita,
    T2.room_name AS sala,
    T1.reason AS  razon,
	T1. appointment_date AS fecha
FROM appointments T1 
JOIN rooms T2 ON T1.room_id = T2.room_id
WHERE T1.status = 'Cancelled'
AND T1.appointment_date BETWEEN DATE '2025-10-20' AND DATE'2025-10-23'
ORDER BY T2.room_name
LIMIT 10; 




--1. Obtener los nombres, apellidos y número de documento de los pacientes junto con el nombre del tipo de documento al que pertenecen.

--JOIN
--1. tablas asociadas
-- smart_health.patients  T1
-- smart_health.document_types  T2

--2. llaves de cruce
-- T1.documwnt_type_id
-- T2.document_type_id
SELECT  
    T1.first_name || ' ' || T1.middle_name || ' ' || T1.first_surname || ' ' || T1.second_surname AS nombre_completo,
    T2.type_name AS tipo_documento, T1.document_number AS numero_documento
FROM patients T1
INNER JOIN document_types T2 On T1.document_type_id = T2.document_type_id;


--2. Listar los nombres de los municipios y las direcciones registradas en cada uno, de manera que se muestren todos los municipios,
--incluso los que no tengan direcciones asociadas.

--RIGHT JOIN
--1. tablas asociadas
-- smart_health.municipalities  T1
-- smart_health.addresses  T2

--2. llaves de cruce
-- T1.municipality_code
-- T2.municipality_code

SELECT
    T2.municipality_name As municipio, T1.address_line AS direccion
FROM  addresses T1
LEFT JOIN municipalities T2 ON T2.municipality_code = T1.municipality_code;



--3. Consultar las citas médicas junto con el nombre y apellido del médico asignado, filtrando solo las citas con estado “Confirmed”.

--JOIN
--1. tablas asociadas
--appointments T1
--doctors T2

--2. llaves de cruce
-- T1.doctor_id
-- T2.doctor_id
SELECT
    T1.appointment_type AS cita,
    T2.first_name || ' ' || T2.last_name AS medico
FROM appointments T1
JOIN doctors T2 ON T1.doctor_id = T2.doctor_id
WHERE T1.status = 'Confirmed';

--4. Mostrar los nombres y apellidos de los pacientes junto con su dirección principal, de forma que aparezcan también los pacientes 
--sin dirección registrada.

SELECT
    T2.first_name || ' ' || T2.middle_name || T2.first_surname || ' ' || T2.second_surname AS nombre_completo,
    T3.address_line AS direccion
FROM patient_addresses T1
LEFT JOIN patients T2 ON T1.patient_id = T2.patient_id 
JOIN addresses T3 ON T1.address_id = T3.address_id
WHERE T1.is_primary = TRUE;

--5. Agrupar los pacientes por tipo de sangre y mostrar la cantidad de tipos de sangre que tienen cada uno.

SELECT 
T1.blood_type AS tipo_sangre,
COUNT (T1.blood_type ) AS cantidad_pacientes
FROM patients T1
GROUP BY T1.blood_type



--6.Obtener los nombres y apellidos de los pacientes junto con el nombre del médico que los atendió,
--la especialidad del médico, la fecha de la cita y el departamento donde reside el paciente. 
--Aplicar condiciones para mostrar solo pacientes y doctores activos, citas con estado confirmado 
--y limitar el resultado a los 5 registros más recientes.


SELECT
    T3.first_name || ' ' || COALESCE(T3.middle_name || ' ', '') || T3.first_surname || ' ' || COALESCE(T3.second_surname, '') AS nombre_paciente,
    T2.first_name || ' ' || COALESCE(T2.middle_name || ' ', '') || T2.first_surname || ' ' || COALESCE(T2.second_surname, '') AS nombre_medico,
    T9.speciality_name,
    T1.appointment_date,
    T7.demartment_name
 FROM appointments T1
 JOIN doctors T2 ON T1.doctor_id = T2.doctor_id 
 JOIN doctor_specialties T8 ON T2.doctor_specialty_id = T8.doctor_specialty_id
 JOIN specialties T9 ON T8.specialty_id = T9.specialty_id
 JOIN patients T3 ON T1.patient_id = T3.patient_id 
 JOIN patient_addresses T4 ON T3.patient_id = T4.patient_id
 JOIN addresses T5 ON T4.address_id = T5.address_id
 JOIN municipalities T6 ON T5.municipality_id = T6.municipality_id 
 JOIN departments T7 ON T6.department_id = T7.depertment_id
 WHERE T1.status= 'Confirmed'
 AND T2.active = TRUE
 AND T3.active = TRUE
 LIMIT 5;