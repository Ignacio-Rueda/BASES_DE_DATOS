--Obtener toda la información de los propietarios
SELECT * FROM propietario;

--Obtener el nombre y teléfono de los propietarios
SELECT nombre,telefono FROM propietario;

--Obtener las distintas nacionalidades de los propietarios
SELECT DISTINCT nacion AS nacionalidad FROM propietario;

/*
Obtener toda la información de los inmuebles que no son gestionados
por ningún empleado o que pertenezcan a cualquiera de los códigos
postales 23730,23740
*/
SELECT * FROM inmueble 
WHERE inmueble.empleado_id IS NULL OR inmueble.cp IN ('23730','23740');

/*
Obtener el código, dirección, código postal y detalle de los inmuebles que tengan un código
comprendido entre 3 y 6 y estén ubicados en una avenida
*/

SELECT id,direc,cp,detalle 
FROM inmueble WHERE id BETWEEN 3 and 6 and direc LIKE 'Avda.%';

/*
El producto cartesiano de dos tablas, está compuesto por la suma de sus columnas o campos y por
el producto de sus filas o tuplas.
*/

/*
Producto cartesiano de las tablas empleado e inmueble
*/
SELECT * FROM inmueble CROSS JOIN empleado;
--Sería lo mismo
SELECT * FROM inmueble,empleado;

/*
Con el producto cartesiano combinamos cualquier fila de una tabla con todas las de la otra, tengan 
o no tengan relación.
Con el operador JOIN podemos seleccionar las filas que cumplan ciertas condiciones del producto cartesiano 
y descartar el resto.
Las filas que cumplan la condición definida en la cláusula ON o WHERE formarán el resultado de la consulta.
*/

--Obtener el código,dirección y código postal de cada inmueble junto con el nombre del empleado que lo gestiona

SELECT inmueble.id,inmueble.direc,inmueble.cp,empleado.nombre FROM inmueble JOIN empleado ON inmueble.empleado_id = empleado.id;

--También se puede obtener (Obtener el código,dirección y código postal de cada inmueble junto con el nombre del empleado que lo gestiona), del siguiente modo
SELECT inmueble.id,inmueble.direc,inmueble.cp,empleado.nombre FROM inmueble,empleado WHERE empleado.id = inmueble.empleado_id;

/*
LEFT JOIN: Obtenemos las tuplas resultantes de un INNER JOIN más todas aquellas de la primera tabla descrita en el FROM:tabla_izq que no cumplen 
con el filtro del JOIN. En estas últimas tuplas los valores de los campos de la tabla_drcha tendrán valor NULL.
*/


-- Obtener el código,dirección y código postal de cada inmueble junto con el empleado que lo gestiona, INCLUYENDO también los inmuebles que no son gestionados por ningún empleado.

SELECT inmueble.id,direc,cp,nombre FROM inmueble LEFT JOIN empleado ON inmueble.empleado_id = empleado.id;

/*
RIGHT JOIN: Obtenemos las tuplas resultantes de un INNER JOIN mas todas aquellas de la segunda tabla descrita en el FROM:tabla_drcha que no cumplen el filtro del JOIN
*/

-- Obtener el nombre y email de los empleados junto con el código,dirección y código postal de cada inmueble que gestionan, incluyendo también los empleados que no gestionan ningún inmueble.
SELECT nombre,email,inmueble.id,direc,cp FROM inmueble RIGHT JOIN empleado ON inmueble.empleado_id = empleado.id;


/*
FULL JOIN: Aplicamos las operaciones LEFT JOIN y RIGHT JOIN a las tablas combinadas
*/

/* Obtener el código,dirección y código postal de cada inmueble junto con el nombre y email del empleado que lo gestiona, incluyendo tanto los inmuebles que no son gestionados por ningún empleado 
 	como los empleados que no gestionan ningún inmueble.
*/

SELECT inmueble.id,direc,cp,nombre,email FROM inmueble FULL JOIN empleado ON inmueble.empleado_id = empleado.id; 


/*
Obtener la dirección y código postal de los inmuebles y el nombre de los empleados que los gestionan, clasificados ascendentemente por el nombre de empleado y descendentemente por el código postal
*/


SELECT direc,cp,nombre FROM inmueble AS i INNER JOIN empleado AS e ON i.empleado_id = e.id ORDER BY nombre ASC, cp DESC;

/*
LIMIT: Especifica el número máximo de filas que se obtienen de una consulta. La cláusula OFFSET indica el número de filas que se omitirán antes de aplicar LIMIT.
*/

-- Obtener los tres dormitorios de menor coste, sin contar los dos más económicos.

SELECT * FROM dormitorio ORDER BY pvp LIMIT 3 OFFSET 2;

/*
FUNCIONES DE AGREGACIÓN: Solo se pueden usar en estos dos casos:
	-La lista de selección de una instrucción SELECT (una subconsulta o una consulta principal).
	-Cláusula HAVING
*/











