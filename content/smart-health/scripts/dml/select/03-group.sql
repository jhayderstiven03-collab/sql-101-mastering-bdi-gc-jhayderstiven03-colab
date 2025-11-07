-- ##################################################
-- # CONSULTAS CON JOINS Y AGREGACIÓN - SMART HEALTH #
-- ##################################################

-- 1. Contar cuántos pacientes están registrados por cada tipo de documento,
-- mostrando el nombre del tipo de documento y la cantidad total de pacientes,
-- ordenados por cantidad de mayor a menor.
SELECT
    T1.type_name,
    COUNT(T2.patient_id) AS numero_pacientes
FROM document_types T1
JOIN patients T2 ON T1.document_type_id = T2.document_type_id
GROUP BY (T1.type_name)
ORDER BY (COUNT(T2.patient_id));


-- 2. Obtener la cantidad de citas programadas por cada médico,
-- mostrando el nombre completo del doctor y el total de citas,
-- filtrando solo médicos con más de 5 citas, ordenados por cantidad descendente.
SELECT
    T1.first_name || ' ' ||T1.last_name AS nombre_medico,
    COUNT (T1.doctor_id) AS doctor
FROM doctors T1
JOIN appointments T2 ON T1.doctor_id = T2.doctor_id
GROUP BY (nombre_medico)
HAVING COUNT (T1.doctor_id) > 5
ORDER BY ( doctor) DESC;


-- 3. Contar cuántas especialidades tiene cada médico activo,
-- mostrando el nombre del doctor y el número total de especialidades,
-- ordenados por cantidad de especialidades de mayor a menor.

SELECT
    T1.first_name || ' ' ||T1.last_name AS nombre_medico,
    COUNT (T2.doctor_id) AS especialidades
FROM doctors T1
JOIN doctor_specialties T2 ON T1.doctor_id = T2.doctor_id
WHERE T1.active = TRUE
GROUP BY (nombre_medico)
ORDER BY especialidades DESC;

-- 4. Calcular cuántos pacientes residen en cada departamento,
-- mostrando el nombre del departamento y la cantidad total de pacientes,
-- filtrando solo departamentos con al menos 3 pacientes, ordenados alfabéticamente.
SELECT 
    T1.department_name AS departamento,
    COUNT (T5.patient_id) AS pacientes
FROM departments T1
JOIN municipalities T2 ON T1.department_code = T2.department_code
JOIN addresses T3 ON T2.municipality_code = T3.municipality_code
JOIN patient_addresses T4 ON T3.address_id = T4.address_id
JOIN patients T5 ON T4.patient_id = T5.patient_id
GROUP BY (departamento)
HAVING COUNT (T5.patient_id) > 2
ORDER BY T1.department_name;

-- 5. Contar cuántas citas ha tenido cada paciente por estado de cita,
-- mostrando el nombre del paciente, estado de la cita y cantidad,
-- ordenados por nombre de paciente y estado.

SELECT
    T1.first_name || ' ' || COALESCE(T1.middle_name || ' ', '') || T1.first_surname || ' ' || COALESCE(T1.second_surname, '') AS paciente,
    T2.status,
    COUNT(T2.patient_id)
FROM patients T1 
JOIN appointments T2 ON T1.patient_id = T2.patient_id
ORDER BY (T1.first_name) AND (T2.status);

-- 6. Calcular cuántos registros médicos ha realizado cada doctor,
-- mostrando el nombre del doctor y el total de registros,
-- filtrando solo doctores con más de 10 registros, ordenados por cantidad descendente.

-- 7. Contar cuántas prescripciones se han emitido para cada medicamento,
-- mostrando el nombre comercial del medicamento y el total de prescripciones,
-- filtrando medicamentos con al menos 2 prescripciones, ordenados por cantidad descendente.

-- 8. Calcular cuántos pacientes tienen alergias por cada medicamento,
-- mostrando el nombre del medicamento y la cantidad de pacientes alérgicos,
-- ordenados por cantidad de mayor a menor.

-- 9. Contar cuántas direcciones tiene registrado cada paciente,
-- mostrando el nombre del paciente y el total de direcciones,
-- filtrando solo pacientes con más de 1 dirección, ordenados por cantidad descendente.

-- 10. Calcular cuántas salas de cada tipo están activas en el hospital,
-- mostrando el tipo de sala y la cantidad total,
-- filtrando solo tipos con al menos 2 salas, ordenados por cantidad descendente.