--Quiero saber la produccion de grillos en cada mes
--Cada caja de tipo 'E' va a producir 2.5 kg harina
--Cada caja de tipo 'R' va a producir 1.5 kg harina

WITH PRE AS(
SELECT 
    count(*) as number_of_boxes,  
    EXTRACT(MONTH FROM fecha_sacrificio_esperada) as month, 
    tipo as type
FROM silver.aggr_data
GROUP BY 2, 3
ORDER BY 2, 3
),
PROD AS(
    SELECT 
        month,
        type,
        number_of_boxes,
        CASE 
            WHEN type = 'E' THEN number_of_boxes * 2.5
            WHEN type = 'R' THEN number_of_boxes * 1.5
        END as flour_produced_kg
    FROM PRE
)
SELECT
    month as mes, 
    sum(number_of_boxes) as numero_de_cajas,
    sum(flour_produced_kg) as total_kg_harina
FROM PROD
GROUP BY 1

--RETO
--cambiar columna de mes por el nombre del mes
