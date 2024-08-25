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





















