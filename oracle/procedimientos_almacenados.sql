--PROCEDIMIENTOS ALMACENADOS

CREATE PROCEDURE INSERTAR_UN_REGISTRO_ME
    AS
    BEGIN
        INSERT INTO TB_MEDIDAS(
        CODIGO_ME,
        ABREVIATURA_ME,
        DESCRIPCION
        )VALUES(
            3,
            'LT',
            'LITROS'
        );
       COMMIT; 
    END;    
    
EXECUTE INSERTAR_UN_REGISTRO_ME;    


CREATE PROCEDURE INSERTAR_UN_REGISTRO_ME_ACTULIZAR_CATEGORIAS
    AS
    BEGIN
        INSERT INTO TB_MEDIDAS(CODIGO_ME,ABREVIATURA_ME,DESCRIPCION)
        VALUES(
            4,
            'KM',
            'KILÓMETROS'
        );
        UPDATE TB_CATEGORIA
        SET DESCRIPCION_CA = 'EVENTOS 2023'
        WHERE CODIGO_CA = 3;
    COMMIT;
    END;

EXECUTE INSERTAR_UN_REGISTRO_ME_ACTULIZAR_CATEGORIAS;     

/*
PROCEDIMIENTOS ALMACENADOS: PARÁMETROS.
Hay tres tipos de parámetros que se pueden declarar:
1) Parámetro de tipo IN. Estos tipos de parámetros se utilizan para enviar valores a procedimientos 
almacenados por lo tanto su valor de parámetro NO puede ser reemplazado.
2) Parámetro de tipo OUT: Estos tipos de parámetros se utilizan para obtener valores de los procedimientos
almacenados. Por consiguiente, es similar a un tipo de retorno en funciones.
3) Parámetro IN OUT: Estos tipos de parámetros se utilizan para enviar valores aunque también para
obtener valores en los procedimientos almacenados.

NOTA: Si un parámetro no se define explícitamente un tipo de parámetro,
entonces por defecto es un parámetro de tipo IN
*/

CREATE PROCEDURE ACTUALIZAR_CA(pCodigo in int,
                               pDescripcion in varchar2)
    AS
    BEGIN
        UPDATE TB_CATEGORIA
        SET DESCRIPCION_CA = pDescripcion
        WHERE CODIGO_CA = pCodigo;
    COMMIT;    
    END;
    
EXECUTE ACTUALIZAR_CA (3,'EVENTOS ESPECIALES');     





CREATE OR REPLACE PROCEDURE GUARDAR_AR (
                            pCODIGO_AR NUMBER,
                            pDESCRIPCION_AR VARCHAR2,
                            pCODIGO_ME NUMBER,
                            pCODIGO_CA NUMBER,
                            pMARCA_AR VARCHAR2,
                            pSTOCK_ACTUAL NUMBER,
                            pFECHA_REGISTRO DATE,
                            pACTIVO NUMBER
                            )
    AS
    BEGIN
        INSERT INTO TB_ARTICULOS(
                CODIGO_AR,
                DESCRIPCION_AR,
                CODIGO_ME,
                CODIGO_CA,
                MARCA_AR,
                STOCK_ACTUAL,
                FECHA_REGISTRO,
                ACTIVO
            )
        VALUES (
            pCODIGO_AR,
            pDESCRIPCION_AR,
            pCODIGO_ME,
            pCODIGO_CA,
            pMARCA_AR,
            pSTOCK_ACTUAL,
            pFECHA_REGISTRO,
            pACTIVO 
        );
        COMMIT;
    END;
    
EXECUTE GUARDAR_AR (7,'NUEVO ARTICULO',1,3,'MARCA NUEVA',5,'09/03/2025',1);



CREATE PROCEDURE BUSCAR_NOTA_AL(pCODIGO_ALUMNO in NUMBER,pNOTA1 out NUMBER)
    AS
    BEGIN
        SELECT NOTA1 INTO pNOTA1
        FROM TB_NOTAS_ALUMNOS
        WHERE CODIGO_ALUMNO = pCODIGO_ALUMNO;
    END;


VARIABLE vNOTA1 NUMBER;
EXECUTE BUSCAR_NOTA_AL(2,:vNOTA1);
PRINT vNOTA1;




CREATE PROCEDURE PROC_DECRIPCION_ME (pABREVIATURA_ME VARCHAR,
                                                pDESCRIPCION OUT VARCHAR)
    AS
    BEGIN
        SELECT DESCRIPCION INTO pDESCRIPCION
        FROM TB_MEDIDAS
        WHERE ABREVIATURA_ME = pABREVIATURA_ME;
    END;

VARIABLE DESCRIPCION VARCHAR2;
EXECUTE PROC_DECRIPCION_ME('LT',:DESCRIPCION);
PRINT DESCRIPCION;


CREATE PROCEDURE BUSCAR_DESCRIPCION_ME(p01 IN OUT VARCHAR2)
AS
BEGIN
    SELECT DESCRIPCION INTO p01
    FROM TB_MEDIDAS
    WHERE ABREVIATURA_ME = p01;
END;

-- ESTE CASO SE EJECUTA, EN LA PROPIA CARPETA DE PROCEDIMIENTOS
-- BUSCAMOS EL PROCEDIMIENTO -> BUSCAR_DESCRIPCION_ME
-- BOTÓN DERECHO EJECUTAR
-- INTRODUCIR VALOR EN VALOR ENTRADA





