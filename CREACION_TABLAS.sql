CREATE TABLE propietario(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	telefono CHAR(9) NOT NULL,
	nacion VARCHAR(50) NOT NULL DEFAULT 'España'
);

CREATE TABLE empleado(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	fechini DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE inmueble(
	id SERIAL PRIMARY KEY,
	direc TEXT NOT NULL,
	cp CHAR(5) NOT NULL,
	detalle TEXT NOT NULL,
	propietario_id INT NOT NULL,
	empleado_id INT
);

CREATE TABLE dormitorio(
	inmueble_id INT NOT NULL,
	num INT NOT NULL,
	capacidad NUMERIC (4,1) NOT NULL,
	pvp NUMERIC (3) NOT NULL,
	calidad VARCHAR(9) NOT NULL,
	CHECK(num>0),
	CHECK(capacidad>0),
	CHECK(pvp>0),
	CHECK(calidad IN ('mala','regular','buena','muy buena')),
	PRIMARY KEY(inmueble_id,num)
);
/*Creación de las claves ajenas
La definición de las claves ajenas, se podrían crear con la sentencia CREATE TABLE, pero las vamos a definir con la sentencia
ALTER TABLE para no tener en cuenta el orden de creación de las tablas.

*/

ALTER TABLE inmueble
ADD FOREIGN KEY(propietario_id) REFERENCES propietario(id);

ALTER TABLE inmueble
ADD FOREIGN KEY(empleado_id) REFERENCES empleado(id);

ALTER TABLE dormitorio 
ADD FOREIGN KEY (inmueble_id) REFERENCES inmueble(id);







