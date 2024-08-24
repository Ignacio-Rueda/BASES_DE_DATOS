INSERT INTO propietario (nombre,telefono,nacion)
	VALUES ('Alberto Crespo','679346678','España'),
		   ('Mónica Paredes','661294715','Italia'),
		   ('Eva Jimena','603682187','España');

INSERT INTO empleado (nombre,email,fechini)
	VALUES('Luis Romero','luis@gmail.com','2016-01-02'),
		  ('Ana Sánchez','ana@gmail.com','2017-07-01'),
		  ('Lucía Parrilla','lucia@gmail.com','2018-08-15');
		  
INSERT INTO inmueble(direc,cp,detalle,propietario_id,empleado_id)
	VALUES('Avda.Sistema Solar,12,5ºA','23700','junto aeropuerto',3,1),
	('Calle Pablo Picasso,1,3ºB','23730','bien ubicado',1,2),
	('Avda. Andalucía,56,7ºC','23740','cerca comercios',3,1),
	('Calle Alfonso X el Sabio,34,2ºD','23700','cerca metro',2,2),
	('Avda.Cristobal Colón,26,6ºE','23730','muy soleado',1,2),
	('Calle Miguel Hernández,13,4ºF','23700','zona expansión',3,NULL);

INSERT INTO dormitorio(inmueble_id,num,capacidad,pvp,calidad)
	VALUES(1,1,25,200,'buena'),
		  (1,2,18,160,'regular'),
		  (2,1,15,180,'mala'),
		  (2,2,25,280,'muy buena'),
		  (2,3,19,160,'regular'),
		  (3,1,18,180,'buena'),
		  (4,1,22,190,'buena'),
		  (4,2,20,170,'regular'),
		  (5,1,21,180,'buena'),
		  (5,2,17,150,'mala'),
		  (6,1,20,250,'muy buena');



	