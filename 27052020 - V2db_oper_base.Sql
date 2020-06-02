/*============================================================================*/
/* DBMS: MySql 5*/
/* Created on : 28/05/2020 22:39:39                                           */
/*============================================================================*/


/*============================================================================*/
/*                                  TABLES                                    */
/*============================================================================*/

CREATE DATABASE IF NOT EXISTS db_operaciones;

USE db_operaciones;

CREATE TABLE `TB_TURNOS` (
  `turno_id`                          INTEGER(11) NOT NULL AUTO_INCREMENT,
  `turno_desc`                        VARCHAR(45) NOT NULL,
  `turno_cod`                         VARCHAR(45) NOT NULL,
CONSTRAINT `PK_TB_TURNOS` PRIMARY KEY (`turno_id`)
);

CREATE TABLE `TB_OPERADOR` (
  `trabajador_id`           INTEGER(11) NOT NULL AUTO_INCREMENT,
  `trabajador_nombre`       VARCHAR(45) NOT NULL,
  `trabajador_apellido`     VARCHAR(45) NOT NULL,
  `trabajador_dni`          VARCHAR(14) NOT NULL,
  `trabajador_cod`          VARCHAR(45) NOT NULL,
CONSTRAINT `PK_TB_OPERADOR` PRIMARY KEY (`trabajador_id`)
);

CREATE TABLE `TB_PLANTAS` (
  `plantas_id`              INTEGER(11) NOT NULL AUTO_INCREMENT,
  `plantas_desc`            VARCHAR(45) NOT NULL,
  `plantas_cod`             VARCHAR(45) NOT NULL,
CONSTRAINT `PK_TB_PLANTAS` PRIMARY KEY (`plantas_id`)
);

CREATE TABLE `tb_maquinas` (
  `maquinas_id`             INTEGER(11) NOT NULL AUTO_INCREMENT,
  `maquinas_desc`           VARCHAR(45) NOT NULL,
  `maquinas_cod`            VARCHAR(45) NOT NULL,
  `plantas_id`              INTEGER(11) NOT NULL,
CONSTRAINT `PK_tb_maquinas` PRIMARY KEY (`maquinas_id`)
);

CREATE TABLE `TB_CAUSA_FALLA` (
  `causa_falla_id`          INTEGER(11) NOT NULL AUTO_INCREMENT,
  `causa_falla_desc`        VARCHAR(45) NOT NULL,
  `causa_falla_cod`         VARCHAR(45) NOT NULL,
  `categoria_id`            INTEGER(11) NOT NULL,
  `caterogia_falla_id`      INTEGER(11) NOT NULL,
CONSTRAINT `PK_TB_CAUSA_FALLA` PRIMARY KEY (`causa_falla_id`)
);

CREATE TABLE `tb_categoria_falla` (
  `caterogia_falla_id`      INTEGER(11) NOT NULL AUTO_INCREMENT,
  `caterogia_falla_desc`    VARCHAR(45) NOT NULL,
  `caterogia_falla_cod`     VARCHAR(45) NOT NULL,
CONSTRAINT `PK_tb_categoria_falla` PRIMARY KEY (`caterogia_falla_id`)
);

CREATE TABLE `tb_registro_falla` (
  `registro_falla_id`       INTEGER(11) NOT NULL AUTO_INCREMENT,
  `registro_falla_fecha_inicio` DATE NOT NULL,
  `registro_falla_fecha_fin` DATE NOT NULL,
  `registro_falla_fecha`    DATETIME NOT NULL,
  `trabajador_id`           INTEGER(11) NOT NULL,
  `plantas_id`              INTEGER(11) NOT NULL,
  `maquinas_id`             INTEGER(11) NOT NULL,
  `turno_id`                INTEGER(11) NOT NULL,
  `causa_falla_id`          INTEGER(11) NOT NULL,
CONSTRAINT `PK_tb_registro_falla` PRIMARY KEY (`registro_falla_id`)
);

CREATE TABLE `TB_OPERADOR_X_TURNO` (
  `operador_x_turno_id`     INTEGER(11) NOT NULL AUTO_INCREMENT,
  `turno_id`                INTEGER(11) NOT NULL,
  `trabajador_id`           INTEGER(11) NOT NULL,
CONSTRAINT `PK_TB_OPERADOR_X_TURNO` PRIMARY KEY (`operador_x_turno_id`,`trabajador_id`,`turno_id`)
);

CREATE TABLE `TB_OPERADOR_X_PLANTA` (
  `operador_x_planta`       INTEGER(11) NOT NULL AUTO_INCREMENT,
  `plantas_id`              INTEGER(11) NOT NULL,
  `trabajador_id`           INTEGER(11) NOT NULL,
CONSTRAINT `PK_TB_OPERADOR_X_PLANTA` PRIMARY KEY (`operador_x_planta`,`plantas_id`,`trabajador_id`)
);

/*============================================================================*/
/*                               FOREIGN KEYS                                 */
/*============================================================================*/
ALTER TABLE `tb_maquinas`
    ADD CONSTRAINT `FK_REFERENCE_10`
        FOREIGN KEY (`plantas_id`)
            REFERENCES `TB_PLANTAS` (`plantas_id`)
 ;


ALTER TABLE `TB_CAUSA_FALLA`
    ADD CONSTRAINT `FK_REFERENCE_4`
        FOREIGN KEY (`caterogia_falla_id`)
            REFERENCES `tb_categoria_falla` (`caterogia_falla_id`)
 ;


ALTER TABLE `tb_registro_falla`
    ADD CONSTRAINT `FK_REFERENCE_5`
        FOREIGN KEY (`trabajador_id`)
            REFERENCES `TB_OPERADOR` (`trabajador_id`)
 ;

ALTER TABLE `tb_registro_falla`
    ADD CONSTRAINT `FK_REFERENCE_6`
        FOREIGN KEY (`plantas_id`)
            REFERENCES `TB_PLANTAS` (`plantas_id`)
 ;

ALTER TABLE `tb_registro_falla`
    ADD CONSTRAINT `FK_REFERENCE_7`
        FOREIGN KEY (`maquinas_id`)
            REFERENCES `tb_maquinas` (`maquinas_id`)
 ;

ALTER TABLE `tb_registro_falla`
    ADD CONSTRAINT `FK_REFERENCE_8`
        FOREIGN KEY (`turno_id`)
            REFERENCES `TB_TURNOS` (`turno_id`)
 ;

ALTER TABLE `tb_registro_falla`
    ADD CONSTRAINT `FK_REFERENCE_9`
        FOREIGN KEY (`causa_falla_id`)
            REFERENCES `TB_CAUSA_FALLA` (`causa_falla_id`)
 ;


ALTER TABLE `TB_OPERADOR_X_TURNO`
    ADD CONSTRAINT `FK_REFERENCE_11`
        FOREIGN KEY (`trabajador_id`)
            REFERENCES `TB_OPERADOR` (`trabajador_id`)
 ;

ALTER TABLE `TB_OPERADOR_X_TURNO`
    ADD CONSTRAINT `FK_REFERENCE_12`
        FOREIGN KEY (`turno_id`)
            REFERENCES `TB_TURNOS` (`turno_id`)
 ;


ALTER TABLE `TB_OPERADOR_X_PLANTA`
    ADD CONSTRAINT `FK_REFERENCE_13`
        FOREIGN KEY (`plantas_id`)
            REFERENCES `TB_PLANTAS` (`plantas_id`)
 ;

ALTER TABLE `TB_OPERADOR_X_PLANTA`
    ADD CONSTRAINT `FK_REFERENCE_14`
        FOREIGN KEY (`trabajador_id`)
            REFERENCES `TB_OPERADOR` (`trabajador_id`)
 ;


