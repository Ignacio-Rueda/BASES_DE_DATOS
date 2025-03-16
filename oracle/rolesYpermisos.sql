
-- ver todos los tablespaces
SELECT * FROM DBA_TABLESPACES;

-- crear un tablespace
CREATE TABLESPACE alumnos
    DATAFILE 'alumnos.dat'
    SIZE 10M
    REUSE
    AUTOEXTEND ON NEXT 10M MAXSIZE 200M;
    
    
-- crear un usuario
CREATE USER alumno_ignacio IDENTIFIED BY "1234"
    DEFAULT TABLESPACE "ALUMNOS";

-- Modificar contraseña del usuario
ALTER USER alumno_ignacio IDENTIFIED BY "12345";

-- Conceder privilegios 'CREATE SESSION' y 'CREATE TABLE' al usuario
GRANT CREATE SESSION TO alumno_ignacio;
GRANT CREATE TABLE TO alumno_ignacio;

-- Crear un rol y conceder privilegios de seleccion y actualizacion de tablas al rol
CREATE ROLE rol_alumnos;
GRANT SELECT ANY TABLE, UPDATE ANY TABLE TO rol_alumnos;

GRANT INSERT ANY TABLE TO rol_alumnos;

-- Quitar privilegios de inserción a las tablas al ROL
REVOKE INSERT ANY TABLE FROM rol_alumnos;

--Crear PERFIL establece límites en recursos y tiempo de sesión.

CREATE PROFILE perfil_limite
   LIMIT
      SESSIONS_PER_USER 5           -- Número máximo de sesiones por usuario
      CPU_PER_SESSION 100000        -- CPU máximo por sesión (en unidades de tiempo)
      CPU_PER_CALL 1000             -- CPU máximo por llamada
      CONNECT_TIME 60               -- Tiempo máximo de conexión (en minutos)
      IDLE_TIME 30                  -- Tiempo máximo de inactividad (en minutos)
      LOGICAL_READS_PER_SESSION 10000 -- Lecturas lógicas máximas por sesión
      LOGICAL_READS_PER_CALL 1000   -- Lecturas lógicas máximas por llamada
      PRIVATE_SGA 15M               -- Memoria privada máxima por sesión (en megabytes)
      COMPOSITE_LIMIT 5000000       -- Límite de recursos combinados (CPU + sesiones)
      PASSWORD_LIFE_TIME 30         -- Duración máxima de la contraseña (en días)
      PASSWORD_REUSE_TIME 60        -- Tiempo mínimo antes de reutilizar una contraseña (en días)
      PASSWORD_REUSE_MAX 5          -- Número máximo de veces que se puede reutilizar la contraseña
      FAILED_LOGIN_ATTEMPTS 3       -- Número máximo de intentos fallidos de inicio de sesión
      PASSWORD_LOCK_TIME 1          -- Tiempo de bloqueo después de fallar intentos (en días)
      PASSWORD_GRACE_TIME 7;        -- Tiempo de gracia para cambiar la contraseña
      
      
-- Modificamos el PERFIL con otros límites

ALTER PROFILE perfil_limite
    LIMIT
    SESSIONS_PER_USER 4;


-- Asignar el rol y el perfil creados al usuario


GRANT rol_alumnos TO alumno_ignacio;
ALTER USER alumno_ignacio PROFILE perfil_limite;


SELECT username, profile FROM dba_users WHERE username = 'ALUMNO_IGNACIO';