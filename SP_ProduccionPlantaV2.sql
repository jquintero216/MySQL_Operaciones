CREATE DEFINER=`jaqp`@`localhost` PROCEDURE `SP_PRODUCCION_X_PLANTA_V2`(fecha1 DATETIME, fecha2 DATETIME)
BEGIN
	SELECT 		db_operaciones.tb_plantas.plantas_desc,
				AVG(db_operaciones.tb_registro_operacion.registro_operacion_produccion_hora) AS Produccion
	FROM		db_operaciones.tb_registro_operacion
				INNER JOIN db_operaciones.tb_plantas ON db_operaciones.tb_registro_operacion.plantas_id = db_operaciones.tb_plantas.plantas_id
    WHERE		db_operaciones.tb_registro_operacion.registro_falla_fecha >= fecha1 AND
				db_operaciones.tb_registro_operacion.registro_falla_fecha <= fecha2
	GROUP BY	db_operaciones.tb_registro_operacion.plantas_id;

END