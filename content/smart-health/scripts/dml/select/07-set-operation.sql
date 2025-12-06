--mostrar la interseccion donde un doctor tenga las dos especialidades de internista y radiologo
SELECT
    'Dr. '||T1.first_name||' '||T1.last_name AS doctor,
    T3.specialty_name AS especialidad
FROM doctors T1 
JOIN doctor_specialties T1 ON T1.doctor_id= T2.doctor_id
JOIN specialties T3 ON T2.specialty_id = T3.specialty_id
GROUP BY T3.specialty_id, T1.first_name, T1.last_name;




--listar todos los pacientes que tienen alergias registradas
-- pero que NO tienen prescripciones médicas activas,
-- mostrando el ID del paciente, nombre completo,
-- tipo de sangre y cantidad de alergias,
-- utilizando EXCEPT para excluir aquellos con prescripciones 

FROM patients T1
INNER JOIN 







--FUNCIONES

CREATE OR REPLACE FUNCTION smart_health.obtener_edad_paciente(
    p_id INTEGER)
    RETURNS INTEGER
    LANGUAGE plpgsql
    AS
$$
DECLARE 
    v_age INTEGER :=0;
BEGIN
    SELECT  
        EXTRACT (YEAR FROM AGE(CURRENT_DATE, birth_date))
        INTO v_age
    FROM smart_health.patients  
        WHERE patient_id=p_id;
    RETURN COALESCE(v_age,0); 
END;
$$;



--consulta
SELECT 
    patient_id,
    birth_date,
    smart_health.obtener_edad_paciente(patient_id)
FROM patients
LIMIT 15;


-- ##################################################
-- # CONSULTAS SET OPERATIONS - SMART HEALTH #
-- ##################################################

-- 1. Obtener una lista combinada de todos los nombres únicos
-- de pacientes y doctores en el sistema, mostrando el nombre completo
-- y el tipo de registro (Paciente o Doctor),
-- ordenados alfabéticamente por nombre completo.
-- Dificultad: BAJA

-- 2. Listar todos los municipios que tienen tanto pacientes como doctores registrados,
-- mostrando el código del municipio, el nombre del municipio y el nombre del departamento,
-- utilizando INTERSECT para encontrar solo los municipios con ambos tipos de usuarios.
-- Dificultad: BAJA-INTERMEDIA

-- 3. Obtener una lista unificada de todos los IDs de pacientes
-- que aparecen en citas o en órdenes de pago,
-- mostrando el ID del paciente, nombre completo y correo electrónico,
-- eliminando duplicados y ordenados por ID de paciente.
-- Dificultad: BAJA

-- 4. Listar todos los pacientes que tienen alergias registradas
-- pero que NO tienen prescripciones médicas activas,
-- mostrando el ID del paciente, nombre completo, tipo de sangre y cantidad de alergias,
-- utilizando EXCEPT para excluir aquellos con prescripciones.
-- Dificultad: INTERMEDIA


-- 5. Obtener una lista combinada de todos los métodos de pago utilizados
-- y todos los tipos de citas registradas en el sistema,
-- mostrando el nombre del concepto, el tipo (Método de Pago o Tipo de Cita),
-- y un contador de cuántas veces aparece cada uno,
-- ordenados primero por tipo y luego por cantidad descendente.
-- Dificultad: INTERMEDIA-ALTA


-- ##################################################
-- #                 END OF QUERIES                 #
-- ##################################################  