USE mi_bd;

INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Carlos', 'Martínez', 25, 1800.75);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Lucía', 'Gómez', 32, 2900.30);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Miguel', 'Fernández', 28, 2200.60);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Ana', 'López', 40, 3100.20);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Jorge', 'Sánchez', 35, 2700.80);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Elena', 'Ramírez', 29, 1950.90);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Roberto', 'Díaz', 45, 3500.50);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Sandra', 'Cruz', 22, 1600.25);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('David', 'Torres', 38, 2950.40);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Marta', 'Reyes', 33, 2700.10);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Pablo', 'Ortiz', 27, 2400.75);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Laura', 'Morales', 36, 3200.60);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Luis', 'Méndez', 26, 2100.30);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Rosa', 'Castro', 31, 2850.70);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Iván', 'Herrera', 24, 1800.55);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Carmen', 'Ruiz', 29, 2300.90);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Alberto', 'Jiménez', 42, 3400.20);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Paula', 'Ramos', 39, 3050.50);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Santiago', 'Aguilar', 23, 1750.85);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Raúl', 'Navarro', 34, 2650.90);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Daniela', 'Domínguez', 30, 2500.10);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Felipe', 'Vargas', 28, 2250.75);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Gloria', 'Silva', 37, 3100.40);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Fernando', 'Soto', 41, 3350.20);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Lorena', 'Hernández', 27, 1950.30);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Francisco', 'Gutiérrez', 44, 3500.90);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('María', 'Peña', 30, 2600.25);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Isabel', 'Vega', 33, 2800.10);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Oscar', 'Molina', 31, 2750.70);
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Gabriel', 'Suárez', 26, 2000.50);
INSERT INTO empleados (nombre, apellido, edad, salario, correo_electronico, departamento_id)
VALUES ('Carlos', 'López', 32, 3200.50, 'carloslopez@mail.com', 
        (SELECT id FROM departamentos WHERE nombre = 'Recursos Humanos'));

INSERT INTO empleados (nombre, apellido, edad, salario, correo_electronico, departamento_id)
VALUES ('Laura', 'Pérez', 26, 2800.75, 'lauraperez@mail.com', 
        (SELECT id FROM departamentos WHERE nombre = 'Ventas'));

INSERT INTO empleados (nombre, apellido, edad, salario, correo_electronico, departamento_id)
VALUES ('Martín', 'González', 30, 3100.25, 'martingonzalez@mail.com', 
        (SELECT id FROM departamentos WHERE nombre = 'Recursos Humanos'));

SET SQL_SAFE_UPDATES = 0;

UPDATE empleados
SET salario = salario * 1.10
WHERE nombre = 'Ana';

INSERT INTO departamentos (nombre)
VALUES ('Contabilidad');

UPDATE empleados
SET departamento_id = (SELECT id FROM departamentos WHERE nombre = 'Contabilidad')
WHERE nombre = 'Carlos';

DELETE FROM empleados
WHERE nombre = 'Laura';


-- Crea la tabla "ventas"
CREATE TABLE ventas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  producto_id INT,
  cliente_id INT,
  cantidad INT,
  precio_unitario DECIMAL(10, 2),
  monto_total DECIMAL(10, 2) DEFAULT 0,
  empleado_id INT
);

-- Inserta un nuevo cliente en la tabla "clientes"
INSERT INTO clientes (nombre, direccion)
VALUES ('Juan Pérez', 'Libertad 3215, Mar del Plata');

-- Inserta un nuevo producto en la tabla "productos"
INSERT INTO productos (nombre, precio)
VALUES ('Laptop', 1200.00);

ALTER TABLE Ventas
ADD CONSTRAINT fk_producto_id FOREIGN KEY (producto_id) REFERENCES Productos(id),
ADD CONSTRAINT fk_cliente_id FOREIGN KEY (cliente_id) REFERENCES Clientes(id);
ALTER TABLE Ventas MODIFY COLUMN empleado_id INT UNSIGNED NOT NULL;
ALTER TABLE Ventas
ADD CONSTRAINT fk_empleado_id FOREIGN KEY (empleado_id) REFERENCES Empleados(id);

INSERT INTO ventas (cliente_id, producto_id, empleado_ID, cantidad) VALUES (1,1,42,1);

-- Inserta un nuevo producto en la tabla "productos" con el nombre "Teléfono móvil" y un precio de 450.00.
INSERT INTO productos (nombre, precio) VALUES ('Teléfono móvil', 450.00);

-- Inserta un nuevo cliente en la tabla "clientes" con el nombre "María García" y la dirección "Constitución 456, Luján".
INSERT INTO clientes (nombre, direccion) VALUES ('María García', 'Constitución 456, Luján');

-- Modifica la columna correo_electronico de la tabla empleados para que se genere automáticamente concatenado el nombre, apellido y el string “@mail.com”.
ALTER TABLE empleados MODIFY correo_electronico VARCHAR(255) GENERATED ALWAYS AS (CONCAT(nombre, apellido, '@mail.com')) STORED;

-- Inserta un nuevo empleado en la tabla "empleados" con el nombre "Luis", apellido "Fernández", edad 28, salario 2800.00 y que pertenezca al departamento “ventas”.
INSERT INTO empleados (nombre, apellido, edad, salario, departamento_id) 
VALUES ('Luis', 'Fernández', 28, 2800.00, (SELECT id FROM departamentos WHERE nombre = 'Ventas'));




-- Actualiza el precio del producto "Laptop" a 1350.00 en la tabla "productos".
UPDATE productos SET precio = 1350.00 WHERE nombre = 'Laptop';

-- Modifica la dirección del cliente "Juan Pérez" a "Alberti 1789, Mar del Plata" en la tabla "clientes".
UPDATE clientes SET direccion = 'Alberti 1789, Mar del Plata' WHERE nombre = 'Juan Pérez';

-- Incrementa el salario de todos los empleados en un 5% en la tabla "empleados".
UPDATE empleados SET salario = salario * 1.05;

-- Inserta un nuevo producto en la tabla "productos" con el nombre "Tablet" y un precio de 350.00.
INSERT INTO productos (nombre, precio) VALUES ('Tablet', 350.00);

-- Inserta un nuevo cliente en la tabla "clientes" con el nombre "Ana López" y la dirección "Beltrán 1452, Godoy Cruz".
INSERT INTO clientes (nombre, direccion) VALUES ('Ana López', 'Beltrán 1452, Godoy Cruz');

-- Inserta un nuevo empleado en la tabla "empleados" con el nombre "Marta", apellido "Ramírez", edad 32, salario 3100.00 y que pertenezca al departamento “ventas”.
INSERT INTO empleados (nombre, apellido, edad, salario, departamento_id)
VALUES ('Marta', 'Ramírez', 32, 3100.00, (SELECT id FROM departamentos WHERE nombre = 'Ventas'));

-- Actualiza el precio del producto "Teléfono móvil" a 480.00 en la tabla "productos".
UPDATE productos SET precio = 480.00 WHERE nombre = 'Teléfono móvil';

-- Modifica la dirección del cliente "María García" a "Avenida 789, Ciudad del Este" en la tabla "clientes".
UPDATE clientes SET direccion = 'Avenida 789, Ciudad del Este' WHERE nombre = 'María García';

-- Incrementa el salario de todos los empleados en el departamento de "Ventas" en un 7% en la tabla "empleados".
UPDATE empleados SET salario = salario * 1.07 WHERE departamento_id = (SELECT id FROM departamentos WHERE nombre = 'Ventas');

-- Inserta un nuevo producto en la tabla "productos" con el nombre "Impresora" y un precio de 280.00.
INSERT INTO productos (nombre, precio) VALUES ('Impresora', 280.00);

-- Inserta un nuevo cliente en la tabla "clientes" con el nombre "Carlos Sánchez" y la dirección "Saavedra 206, Las Heras".
INSERT INTO clientes (nombre, direccion) VALUES ('Carlos Sánchez', 'Saavedra 206, Las Heras');

-- Inserta un nuevo empleado en la tabla "empleados" con el nombre "Lorena", apellido "Guzmán", edad 26, salario 2600.00 y que pertenezca al departamento “ventas”.
INSERT INTO empleados (nombre, apellido, edad, salario, departamento_id) 
VALUES ('Lorena', 'Guzmán', 26, 2600.00, (SELECT id FROM departamentos WHERE nombre = 'Ventas'));

-- Haz una consulta simple de los datos de la tabla empleados y verifica que se presente de la siguiente manera:
SELECT * FROM empleados;

-- Inserta una venta en la tabla "ventas" donde el cliente "Juan Pérez" compra una "Laptop" con una cantidad de 2 y el vendedor tiene el nombre "Ana" y apellido "Rodríguez".
-- Inserta una venta en la tabla "ventas" donde el cliente "María García" compra un "Teléfono móvil" con una cantidad de 3 y el vendedor tiene el nombre "Carlos" y apellido "López".
-- Crea una venta en la tabla "ventas" donde el cliente "Carlos Sánchez" compra una "Impresora" con una cantidad de 1 y el vendedor tiene el nombre "Marta" y apellido "Ramírez".
-- Inserta una venta en la tabla "ventas" donde el cliente "Ana López" compra una "Laptop" con una cantidad de 1 y el vendedor tiene el nombre "Carlos" y apellido "López".
-- Crea una venta en la tabla "ventas" donde el cliente "Juan Pérez" compra una "Tablet" con una cantidad de 2 y el vendedor tiene el nombre "Luis" y apellido "Fernández".
-- Inserta una venta en la tabla "ventas" donde el cliente "María García" compra un "Teléfono móvil" con una cantidad de 1 y el vendedor tiene el nombre "Marta" y apellido "Ramírez".
-- Crea una venta en la tabla "ventas" donde el cliente "Carlos Sánchez" compra una "Impresora" con una cantidad de 2 y el vendedor tiene el nombre "Lorena" y apellido "Guzmán".
INSERT INTO ventas (cliente_id, producto_id, cantidad, empleado_id)
VALUES 
((SELECT id FROM clientes WHERE nombre = 'Juan Pérez'), (SELECT id FROM productos WHERE nombre = 'Laptop'), 2, (SELECT id FROM empleados WHERE nombre = 'Ana' AND apellido = 'Rodríguez')),
((SELECT id FROM clientes WHERE nombre = 'María García'), (SELECT id FROM productos WHERE nombre = 'Teléfono móvil'), 3, (SELECT id FROM empleados WHERE nombre = 'Carlos' AND apellido = 'López')),
((SELECT id FROM clientes WHERE nombre = 'Carlos Sánchez'), (SELECT id FROM productos WHERE nombre = 'Impresora'), 1, (SELECT id FROM empleados WHERE nombre = 'Marta' AND apellido = 'Ramírez')),
((SELECT id FROM clientes WHERE nombre = 'Ana López'), (SELECT id FROM productos WHERE nombre = 'Laptop'), 1, (SELECT id FROM empleados WHERE nombre = 'Carlos' AND apellido = 'López')),
((SELECT id FROM clientes WHERE nombre = 'Juan Pérez'), (SELECT id FROM productos WHERE nombre = 'Tablet'), 2, (SELECT id FROM empleados WHERE nombre = 'Luis' AND apellido = 'Fernández')),
((SELECT id FROM clientes WHERE nombre = 'María García'), (SELECT id FROM productos WHERE nombre = 'Teléfono móvil'), 1, (SELECT id FROM empleados WHERE nombre = 'Marta' AND apellido = 'Ramírez')),
((SELECT id FROM clientes WHERE nombre = 'Carlos Sánchez'), (SELECT id FROM productos WHERE nombre = 'Impresora'), 2, (SELECT id FROM empleados WHERE nombre = 'Lorena' AND apellido = 'Guzmán'));

UPDATE ventas
SET precio_unitario = (SELECT precio FROM productos WHERE id = ventas.producto_id);

UPDATE ventas
SET monto_total = precio_unitario * cantidad;

-- Lista los nombres de los empleados sin duplicados
SELECT DISTINCT nombre FROM empleados;
-- Obtén una lista de correos electrónicos únicos de todos los empleados.
SELECT DISTINCT correo_electronico FROM empleados;
-- Encuentra la lista de edades distintas entre los empleados.
SELECT DISTINCT edad FROM empleados;

-- Muestra los nombres de los empleados que tienen un salario superior a $3200.
SELECT nombre FROM Empleados WHERE salario > 3200;
-- Obtén una lista de empleados que tienen 28 años de edad.
SELECT * FROM Empleados WHERE edad = 28;
-- Lista a los empleados cuyos salarios sean menores a $2700.
SELECT * FROM Empleados WHERE salario < 2700;
-- Encuentra todas las ventas donde la cantidad de productos vendidos sea mayor que 2.
SELECT * FROM Ventas WHERE cantidad > 2;
-- Muestra las ventas donde el precio unitario sea igual a $480.00.
SELECT * FROM Ventas WHERE precio_unitario = 480.00;
-- Obtén una lista de ventas donde el monto total sea menor que $1000.00.
SELECT * FROM Ventas WHERE monto_total < 1000.00;
-- Encuentra las ventas realizadas por el empleado con el ID 1.
SELECT * FROM Ventas WHERE empleado_id = 1;

-- Muestra los nombres de los empleados que trabajan en el Departamento 1 y tienen un salario superior a $3000.
SELECT nombre FROM Empleados WHERE departamento_id = 1 AND salario > 3000;
-- Lista los empleados que tienen 32 años de edad o trabajan en el Departamento 3.
SELECT * FROM Empleados WHERE edad = 32 OR departamento_id = 3;
-- Lista las ventas donde el producto sea el ID 1 y la cantidad sea mayor o igual a 2.
SELECT * FROM Ventas WHERE producto_id = 1 AND cantidad >= 2;
-- Muestra las ventas donde el cliente sea el ID 1 o el empleado sea el ID 2.
SELECT * FROM Ventas WHERE cliente_id = 1 OR empleado_id = 2;
-- Obtén una lista de ventas donde el cliente sea el ID 2 y la cantidad sea mayor que 2.
SELECT * FROM Ventas WHERE cliente_id = 2 AND cantidad > 2;
-- Encuentra las ventas realizadas por el empleado con el ID 1 y donde el monto total sea mayor que $2000.00.
SELECT * FROM Ventas WHERE empleado_id = 1 AND monto_total > 2000.00;

-- Encuentra a los empleados cuyas edades están entre 29 y 33 años. Muestra el nombre y la edad de los registros que cumplan esa condición. 
SELECT nombre, edad FROM Empleados WHERE edad BETWEEN 29 AND 33;
-- Encuentra las ventas donde la cantidad de productos vendidos esté entre 2 y 3.
SELECT * FROM Ventas WHERE cantidad BETWEEN 2 AND 3;
-- Muestra las ventas donde el precio unitario esté entre $300.00 y $500.00.
SELECT * FROM Ventas WHERE precio_unitario BETWEEN 300.00 AND 500.00;
SELECT * FROM Ventas WHERE precio_unitario >= 300.00 AND precio_unitario <= 500.00;

DROP TABLE empleados;

-- segunda practica
INSERT INTO empleados (nombre, apellido, edad, salario, departamento_id)
VALUES
  ('Laura', 'Sánchez', 27, 3300.00, 1),
  ('Javier', 'Pérez', 29, 3100.00, 1),
  ('Camila', 'Gómez', 26, 3000.00, 1),
  ('Lucas', 'Fernández', 28, 3200.00, 1),
  ('Valentina', 'Rodríguez', 30, 3500.00, 1);
INSERT INTO productos (nombre, precio)
VALUES
  ('Cámara Digital', 420.00),
  ('Smart TV 55 Pulgadas', 1200.00),
  ('Auriculares Bluetooth', 80.00),
  ('Reproductor de Blu-ray', 120.00),
  ('Lavadora de Ropa', 550.00),
  ('Refrigeradora Doble Puerta', 800.00),
  ('Horno de Microondas', 120.00),
  ('Licuadora de Alta Potencia', 70.00),
  ('Silla de Oficina Ergonómica', 150.00),
  ('Escritorio de Madera', 200.00),
  ('Mesa de Comedor', 250.00),
  ('Sofá de Tres Plazas', 350.00),
  ('Mochila para Portátil', 30.00),
  ('Reloj de Pulsera Inteligente', 100.00),
  ('Juego de Utensilios de Cocina', 40.00),
  ('Set de Toallas de Baño', 20.00),
  ('Cama King Size', 500.00),
  ('Lámpara de Pie Moderna', 70.00),
  ('Cafetera de Goteo', 40.00),
  ('Robot Aspirador', 180.00);
INSERT INTO clientes (nombre, direccion)
VALUES
  ('Alejandro López', 'Calle Rivadavia 123, Buenos Aires'),
  ('Sofía Rodríguez', 'Avenida San Martín 456, Rosario'),
  ('Joaquín Pérez', 'Calle Belgrano 789, Córdoba'),
  ('Valeria Gómez', 'Calle Mitre 101, Mendoza'),
  ('Diego Martínez', 'Avenida 9 de Julio 654, Buenos Aires');
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id)
VALUES
  (1, 6, 3, 1350.00, 1),
  (5, 8, 5, 420.00, 9),
  (10, 2, 2, 800.00, 6),
  (14, 7, 1, 200.00, 5),
  (20, 4, 4, 20.00, 6),
  (4, 5, 5, 280.00, 1),
  (9, 5, 3, 550.00, 1),
  (13, 3, 4, 150.00, 5),
  (19, 6, 2, 40.00, 1),
  (2, 9, 5, 480.00, 1);
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id)
VALUES
  (3, 9, 1, 350.00, 1),
  (6, 7, 4, 1200.00, 1),
  (7, 6, 3, 80.00, 1),
  (12, 9, 5, 70.00, 1),
  (16, 8, 2, 350.00, 6),
  (23, 9, 4, 180.00, 1),
  (18, 4, 3, 100.00, 7),
  (11, 3, 2, 120.00, 5),
  (15, 5, 4, 250.00, 6),
  (8, 8, 1, 120.00, 7);
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id)
VALUES
  (17, 3, 2, 30.00, 5),
  (21, 9, 5, 500.00, 6),
  (22, 2, 3, 70.00, 6),
  (24, 9, 2, 180.00, 1),
  (5, 1, 2, 1350.00, 1),
  (9, 6, 4, 550.00, 9),
  (13, 8, 3, 150.00, 7),
  (3, 1, 5, 350.00, 1),
  (18, 9, 1, 100.00, 6),
  (10, 5, 2, 800.00, 1);
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id)
VALUES
  (7, 4, 3, 80.00, 6),
  (2, 5, 1, 480.00, 6),
  (8, 7, 4, 120.00, 7),
  (1, 3, 5, 1350.00, 5),
  (4, 6, 2, 280.00, 5),
  (12, 1, 1, 70.00, 1),
  (19, 4, 3, 40.00, 6),
  (15, 3, 4, 250.00, 5),
  (6, 8, 2, 1200.00, 7),
  (11, 2, 3, 120.00, 5);