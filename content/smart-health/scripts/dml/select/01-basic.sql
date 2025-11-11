-- 1. cuantos doctores hay
  
--mostrar de los doctores los medical_license_number, el nombre completo con el profeijo doctor (dr) 
--y solamento los que estan activos, ordenar por el primer nombre de forma decendente.
--solo mostrar los primeros 10 resultados
SELECT 
'Dr. '||first_name||' '||last_name AS fullname,
medical_license_number

FROM smart_health.doctors 
WHERE active = TRUE
ORDER BY first_name DESC
LIMIT 10;

-- crear 5 consultas mas de la misma forma basica

-- 1️⃣ La primera consulta obtiene los nombres y apellidos de los pacientes registrados, junto con su 
-- correo electrónico y fecha de nacimiento, ordenados por fecha de registro de manera descendente para
-- visualizar los más recientes primero. Esta consulta usa un alias para facilitar la lectura de las columnas 
-- en la salida y un límite para mostrar solo los diez registros más recientes. 

    SELECT first_name||' '||middle_name||' '||first_surname||' '||second_surname AS full_name, email, birth_date
    FROM  smart_health.patients, 
    ORDER BY registration_date DESC,
    LIMIT 10;

-- 2️⃣ La segunda consulta selecciona los nombres completos de los médicos activos junto con su número de licencia médica, 
--ordenando alfabéticamente por apellidos. También aplica alias a las columnas para mostrar un encabezado más legible y 
--limita el resultado a los primeros 20 doctores.
SELECT 
    'Dr. '||first_name||' '||last_name as médico,
    medical_license_number as licencia_médica
FROM doctors 
WHERE  active = TRUE
ORDER BY last_name DESC
LIMIT 20;
 
-- 3️⃣ La tercera consulta obtiene el listado de municipios y sus respectivos departamentos, 
--niendo ambas tablas mediante la clave foránea department_code. Se ordena por el nombre del departamento 
--para facilitar la localización geográfica, mostrando los 15 primeros resultados.

SELECT 
    T1.municipality_name AS municipio, 
    T2.department_name AS departamento
FROM municipalities T1
JOIN departments T2 ON T1.department_code = T2.department_code
ORDER BY departamento
LIMIT 15;

-- 4️⃣ La cuarta consulta selecciona las citas médicas programadas (tabla appointment), 
--mostrando el tipo de cita, el estado actual y la fecha correspondiente. Se utiliza un alias 
--para cada campo y se ordena por fecha de cita en orden ascendente, limitando la salida a las próximas 10 citas.

SELECT 
    T1.appointment_type AS TIPO,
    T1.status AS estado_actual,
    T1.appointment_date AS fecha

FROM appointments T1
ORDER BY T1.appointment_date ASC 
LIMIT 10
 
-- 5️⃣ Finalmente, la quinta consulta obtiene los nombres comerciales de los medicamentos junto con su 
--ingrediente activo, presentándolos de forma alfabética. Se usa alias para mejorar la presentación de los
--encabezados y un límite de 25 registros, ideal para una vista rápida del catálogo farmacológico disponible.

SELECT
    T1.commercial_name AS nombre_comercial,
    T1.active_ingredient AS ingrediente_activo
FROM medications T1
ORDER BY T1.commercial_name 
LIMIT 25