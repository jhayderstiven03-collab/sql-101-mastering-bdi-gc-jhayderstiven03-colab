--obtener cuales son los 10 doctores con mas citas programadas en el segundo periodo del 2025
--cual fue la fecha maxima y minima de la consulta



SELECT
    SUB.doctor,
    COUNT(T1.doctor_id) AS total_citas,
    MAX(SUB.appointment_date) AS cita_reciente,
    MIN(SUB.appointment_date) AS primera_cita

FROM 
(
SELECT
	'Dr.'||T1.first_name ||T1.last_name AS doctor,
	T2.appointment_date

FROM smart_health.doctors T1
JOIN smart_health.appointments T2 ON T1.doctor_id=T2.doctor_id 
AND  T1.active = TRUE
WHERE T2.appointment_date BETWEEN 
    CURRENT_DATE - INTERVAL '6 months' AND CURRENT_DATE  
) SUB
GROUP BY SUB.doctor
ORDER BY total_citas DESC
LIMIT 10;






--cte
--obtener los datos de los 5 pacientes mas antiguos registrados en el sistema y que esten activos
--cuya ubicacion sea norte de santander, calcular una vista 360° a partir de los datos obtenidos con los 
--siguientes valores nombre completo del paciente, departamento, municipio, numero de contacto(solo uno en caso de que tenga mas)
--fecha de la primera y ultima cita y el tipo de sangre


WITH paciente AS(
    SELECT 
        T1.first_name||' 'COALESCE(T1.second_name,' ')||' '||COALESCE(T1.first_surname,' ')||' '||T1.second_surname AS paciente, 
        T5.department_name AS departamento,
        T4.municipality_name AS municipio,
        T6.phone_number AS numero de contacto,
        MAX(T7.appointment_date) AS primera_cita,
        MIN(T7.appointment_date) AS ultima_cita,
        T1.blood_type AS tipo de sangre,
        
    FROM smart_health.patients
    JOIN smart_health.patient_addresses T2 ON T1.patient_id=T2.patient_id
    JOIN smart_health.addresses T3 ON T2.address_id = T3.address_id
    JOIN smart_health.municipalities T4 ON T3.municipality_code= T4.municipality_code
    JOIN smart_health.departments T5 ON T4.department_code=T5.department_code
    JOIN smart_health.patient_phones T6 ON T1.patient_id=T6.patient_id
    JOIN smart_health.appointments T7= T1.patient_id=T7.patient_id
    --WHERE T1.active=TRUE
    GROUP BY paciente
)




