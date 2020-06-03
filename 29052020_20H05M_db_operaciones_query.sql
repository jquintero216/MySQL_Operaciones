/* query para mostrar todos los datos de la tabla turnos */
SELECT * FROM db_operaciones.tb_turnos;
/* query para mostrar todos los datos de la tabla operador */
SELECT * FROM db_operaciones.tb_operador;
/* query calculo de primer y ultimo registro */

/* query para mostrar todos los datos de la tabla registro x operacion */
SELECT * FROM db_operaciones.tb_registro_operacion;
/* query para mostrar la relacion entre la tabla maquina con la tabla plantas \ maquinas asociadas a las plantas */
SELECT 		db_operaciones.tb_maquinas.maquinas_id,
			db_operaciones.tb_maquinas.maquinas_desc,
			db_operaciones.tb_maquinas.maquinas_cod,
			db_operaciones.tb_plantas.plantas_desc
FROM 		db_operaciones.tb_maquinas
			INNER JOIN db_operaciones.tb_plantas ON db_operaciones.tb_maquinas.plantas_id = db_operaciones.tb_plantas.plantas_id
ORDER BY 	db_operaciones.tb_maquinas.maquinas_id ASC ;
/* query para mostrar todos los datos de la tabla categoria de falla */
SELECT * FROM db_operaciones.tb_categoria_falla;
/* query para mostrar la relacion entre la tabla causa de falla con la tabla categoria de falla */
SELECT 		db_operaciones.tb_causa_falla.causa_falla_id,
			db_operaciones.tb_causa_falla.causa_falla_desc,
			db_operaciones.tb_causa_falla.causa_falla_cod,
			db_operaciones.tb_categoria_falla.caterogia_falla_desc
FROM 		db_operaciones.tb_causa_falla
			INNER JOIN db_operaciones.tb_categoria_falla ON db_operaciones.tb_causa_falla.caterogia_falla_id = db_operaciones.tb_categoria_falla.caterogia_falla_id
ORDER BY 	db_operaciones.tb_causa_falla.causa_falla_id ASC ;
/* query para mostrar todos los datos de la tabla estados de operacion */
SELECT * FROM db_operaciones.tb_estados;
/* query para mostrar todos los datos de la tabla eventos */
SELECT * FROM db_operaciones.tb_eventos;
/* query para mostrar la relacion entre todas las tablas con indices vinculados a los registro por operacion */
SELECT		db_operaciones.tb_registro_operacion.registro_operacion_id,
			db_operaciones.tb_registro_operacion.registro_operacion_tiempo_operativo,
			db_operaciones.tb_registro_operacion.registro_falla_tiempo_inoperativo,
			db_operaciones.tb_registro_operacion.registro_falla_fecha,
			db_operaciones.tb_registro_operacion.registro_operacion_produccion_hora,
			db_operaciones.tb_registro_operacion.registro_operacion_energia_minuto,
			db_operaciones.tb_operador.trabajador_nombre,
			db_operaciones.tb_operador.trabajador_apellido,
			db_operaciones.tb_plantas.plantas_desc,
			db_operaciones.tb_turnos.turno_desc,
			db_operaciones.tb_maquinas.maquinas_desc,
			db_operaciones.tb_estados.estados_desc,
			db_operaciones.tb_eventos.eventos_desc
FROM		db_operaciones.tb_registro_operacion
			INNER JOIN db_operaciones.tb_plantas ON db_operaciones.tb_registro_operacion.plantas_id = db_operaciones.tb_plantas.plantas_id
			INNER JOIN db_operaciones.tb_turnos ON db_operaciones.tb_registro_operacion.turno_id = db_operaciones.tb_turnos.turno_id
			INNER JOIN db_operaciones.tb_operador ON db_operaciones.tb_registro_operacion.trabajador_id = db_operaciones.tb_operador.trabajador_id
			INNER JOIN db_operaciones.tb_maquinas ON db_operaciones.tb_registro_operacion.maquinas_id = db_operaciones.tb_maquinas.maquinas_id
			INNER JOIN db_operaciones.tb_estados ON db_operaciones.tb_registro_operacion.estados_id = db_operaciones.tb_estados.estados_id
			INNER JOIN db_operaciones.tb_eventos ON db_operaciones.tb_registro_operacion.eventos_id = db_operaciones.tb_eventos.eventos_id
ORDER BY 	db_operaciones.tb_registro_operacion.registro_operacion_id ASC;
/* query para calcular delta de produccion entre intervalos de tiempos - SOLO PARA EFECTOS DE PRUEBAS */
SELECT 	db_operaciones.tb_registro_operacion.registro_operacion_id,
		db_operaciones.tb_registro_operacion.registro_operacion_produccion_hora,
        (db_operaciones.tb_registro_operacion.registro_operacion_produccion_hora - 
        ( SELECT db_operaciones.tb_registro_operacion.registro_operacion_produccion_hora 
          FROM db_operaciones.tb_registro_operacion 
          WHERE db_operaciones.tb_registro_operacion.registro_operacion_id = 6
		)
        ) 
        AS Consumo
FROM	db_operaciones.tb_registro_operacion
WHERE 	db_operaciones.tb_registro_operacion.registro_operacion_id = 7;
/* query para calcular delta de produccion entre intervalos de tiempos por fechas - QUERY PARA PRODUCCION */
SELECT 	db_operaciones.tb_registro_operacion.registro_operacion_id,
		db_operaciones.tb_registro_operacion.registro_operacion_produccion_hora,
        (db_operaciones.tb_registro_operacion.registro_operacion_produccion_hora - 
        ( SELECT db_operaciones.tb_registro_operacion.registro_operacion_produccion_hora 
          FROM db_operaciones.tb_registro_operacion 
          WHERE db_operaciones.tb_registro_operacion.registro_falla_fecha = "2020-11-16 14:20:45"
		)
        ) 
        AS produccion_x_hora
FROM	db_operaciones.tb_registro_operacion
WHERE 	db_operaciones.tb_registro_operacion.registro_falla_fecha = "2020-11-16 14:20:47" AND
        db_operaciones.tb_registro_operacion.plantas_id = 1;
/* query para calcular el diferencial entre la produccion por planta y la energia consumida */
SELECT 	db_operaciones.tb_registro_operacion.registro_operacion_id,
		db_operaciones.tb_registro_operacion.registro_operacion_energia_minuto,
        db_operaciones.tb_plantas.plantas_desc,
        (db_operaciones.tb_registro_operacion.registro_operacion_energia_minuto / 
		(
		SELECT db_operaciones.tb_registro_operacion.registro_operacion_produccion_hora 
		FROM db_operaciones.tb_registro_operacion 
		WHERE db_operaciones.tb_registro_operacion.registro_falla_fecha = "2020-11-16 14:20:45"
		)
        ) 
        AS energia_x_tonelada
FROM	db_operaciones.tb_registro_operacion
		INNER JOIN db_operaciones.tb_plantas ON db_operaciones.tb_registro_operacion.plantas_id = db_operaciones.tb_plantas.plantas_id
WHERE 	db_operaciones.tb_registro_operacion.registro_falla_fecha = "2020-11-16 14:20:47" AND
        db_operaciones.tb_registro_operacion.plantas_id = 1;        
/* query para mostrar el calculo consolidado de estados no operativos */
SELECT 		db_operaciones.tb_estados.estados_desc,
			db_operaciones.tb_maquinas.maquinas_desc,
			SUM(db_operaciones.tb_registro_operacion.registro_falla_tiempo_inoperativo) AS consolidado
FROM		db_operaciones.tb_registro_operacion
			INNER JOIN db_operaciones.tb_estados ON db_operaciones.tb_registro_operacion.estados_id = db_operaciones.tb_estados.estados_id
			INNER JOIN db_operaciones.tb_maquinas ON db_operaciones.tb_registro_operacion.maquinas_id = db_operaciones.tb_maquinas.maquinas_id
WHERE		db_operaciones.tb_registro_operacion.turno_id = 1
GROUP BY	db_operaciones.tb_registro_operacion.maquinas_id;
/* query para mostrar el calculo consolidado de estados operativos */
SELECT 		db_operaciones.tb_estados.estados_desc,
			db_operaciones.tb_maquinas.maquinas_desc,
            SUM(db_operaciones.tb_registro_operacion.registro_operacion_tiempo_operativo) AS consolidado
FROM		db_operaciones.tb_registro_operacion
			INNER JOIN db_operaciones.tb_estados ON db_operaciones.tb_registro_operacion.estados_id = db_operaciones.tb_estados.estados_id
			INNER JOIN db_operaciones.tb_maquinas ON db_operaciones.tb_registro_operacion.maquinas_id = db_operaciones.tb_maquinas.maquinas_id
WHERE		db_operaciones.tb_registro_operacion.turno_id = 1
GROUP BY	db_operaciones.tb_registro_operacion.maquinas_id;
