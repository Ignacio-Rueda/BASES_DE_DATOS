-- permitir la ejecución de ciertas operaciones administrativas que normalmente están restringidas
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
-- crear un usuario con contraseña, asignamos espacios de tabla predeterminado y temporal
CREATE USER IGNACIO IDENTIFIED BY "1234"
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";
-- puede usar todo el espacio disponible sin restricciones
ALTER USER IGNACIO QUOTA UNLIMITED ON USERS;
-- permitimos al usuario iniciar sesión
GRANT CREATE SESSION TO IGNACIO;
-- privilegios para crear objetos, como tablas, vistas, procedimientos
GRANT "RESOURCE" TO IGNACIO;
-- establecemos el rol 'resource' como predeterminado, se habilitará automáticamente al iniciar sesión
ALTER USER IGNACIO DEFAULT ROLE "RESOURCE";