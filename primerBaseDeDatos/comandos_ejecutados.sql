CREATE DATABASE mi_bd;
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


SET FOREIGN_KEY_CHECKS = 0; -- Deshabilitar restricciones de llaves foráneas
DELETE FROM empleados;
SET FOREIGN_KEY_CHECKS = 1; -- Habilitar nuevamente las restricciones de llaves foráneas

SET FOREIGN_KEY_CHECKS = 0; -- Deshabilitar restricciones de llaves foráneas
TRUNCATE TABLE empleados;
SET FOREIGN_KEY_CHECKS = 1; -- Habilitar nuevamente las restricciones de llaves foráneas

INSERT INTO departamentos (nombre) VALUES ('Ventas'), ('Recursos Humanos'), ('Contabilidad');

INSERT INTO empleados (nombre, apellido, edad, salario, departamento_id) 
VALUES ('Ana', 'Rodríguez', '28', '3707.55', '1'),
('Carlos', 'López', '32', '3360.53', '3'),
('Laura', 'López', '32', '3360.53', '3'),
('Martín', 'González', '30', '3255.26', '2'),
('Luis', 'Fernández', '28', '3145.80', '1'),
('Marta', 'Ramírez', '32', '3317.00', '1'),
('Lorena', 'Guzmán', '26', '2600.00', '1');

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
  
# Ejercicios cláusula IN
-- Encuentra los empleados cuyos IDs son 1, 3 o 5.
SELECT * FROM empleados WHERE id IN (1, 3, 5);
-- Busca los productos con IDs 2, 4 o 6 en la tabla de productos.
SELECT * FROM productos WHERE id IN (2, 4, 6);
-- Encuentra las ventas que tienen los clientes con IDs 1, 3 o 5.
SELECT * FROM ventas WHERE cliente_id IN (1, 3, 5);

# Ejercicios cláusula LIKE
-- Encuentra los empleados cuyos nombres comienzan con "L".
SELECT * FROM empleados WHERE nombre LIKE 'L%';
-- Busca los productos cuyos nombres contengan la palabra "Teléfono".
SELECT * FROM productos WHERE nombre LIKE '%Teléfono%';
-- Encuentra los clientes cuyas direcciones contienen la palabra "Calle".
SELECT * FROM clientes WHERE direccion LIKE '%Calle%';

#Ejercicios cláusula ORDER BY:
-- Ordena los empleados por salario de manera ascendente.
SELECT * FROM empleados
ORDER BY salario ASC;
-- Ordena los productos por nombre de manera descendente.
SELECT * FROM productos
ORDER BY nombre DESC;
-- Ordena las ventas por cantidad de manera ascendente y luego por precio_unitario de manera descendente.
SELECT * FROM ventas
ORDER BY cantidad ASC, precio_unitario DESC;

#Ejercicios LIMIT
-- Muestra los 5 productos más caros de la tabla "productos".
SELECT * FROM productos
ORDER BY precio DESC
LIMIT 5;
-- Muestra los 10 primeros empleados en orden alfabético por apellido.
SELECT * FROM empleados
ORDER BY apellido ASC
LIMIT 10;
-- Muestra las 3 ventas con el monto total más alto.
SELECT * FROM ventas
ORDER BY monto_total DESC
LIMIT 3;

#Ejercicios AS
-- Crea una consulta que muestre el salario de los empleados junto con el salario aumentado en un 10% nombrando a la columna como “Aumento del 10%”.
SELECT nombre, salario,
       salario * 1.10 AS "Aumento del 10%"
FROM empleados;
-- Crea una consulta que calcule el monto total de las compras realizadas por cliente y que la columna se llame “Monto total gastado”.
SELECT cliente_id,
       SUM(monto_total) AS "Monto total gastado"
FROM ventas
GROUP BY cliente_id;
-- Muestra los nombres completos de los empleados concatenando los campos "nombre" y "apellido" y que la columna se llame “Nombre y apellido”.
SELECT CONCAT(nombre, ' ', apellido) AS "Nombre y apellido"
FROM empleados;


#Ejercicios CASE
-- Crea una consulta que muestre el nombre de los productos y los categorice como "Caro" si el precio es mayor o igual a $500, "Medio" si es mayor 
-- o igual a $200 y menor que $500, y "Barato" en otros casos.
SELECT nombre,
       CASE
           WHEN precio >= 500 THEN 'Caro'
           WHEN precio >= 200 AND precio < 500 THEN 'Medio'
           ELSE 'Barato'
       END AS Categoria
FROM productos;
-- Crea una consulta que muestre el nombre de los empleados y los categorice como "Joven" si tienen menos de 30 años, "Adulto" si tienen entre 30 y 40 años, 
-- y "Mayor" si tienen más de 40 años.
SELECT nombre,
       CASE
           WHEN edad < 30 THEN 'Joven'
           WHEN edad BETWEEN 30 AND 40 THEN 'Adulto'
           ELSE 'Mayor'
       END AS Categoria
FROM empleados;

-- Crea una consulta que muestre el ID de la venta y los categorice como "Poca cantidad" si la cantidad es menor que 3, "Cantidad moderada" si es igual o 
-- mayor que 3 y menor que 6, y "Mucha cantidad" en otros casos.
SELECT id,
       CASE
           WHEN cantidad < 3 THEN 'Poca cantidad'
           WHEN cantidad >= 3 AND cantidad < 6 THEN 'Cantidad moderada'
           ELSE 'Mucha cantidad'
       END AS Categoria
FROM ventas;

-- Crea una consulta que muestre el nombre de los clientes y los categorice como "Comienza con A" si su nombre comienza con la letra 'A', "Comienza con M" 
-- si comienza con 'M' y "Otros" en otros casos.
SELECT nombre,
       CASE
           WHEN nombre LIKE 'A%' THEN 'Comienza con A'
           WHEN nombre LIKE 'M%' THEN 'Comienza con M'
           ELSE 'Otros'
       END AS Categoria
FROM clientes;

-- Crea una consulta que muestre el nombre de los empleados y los categorice como "Salario alto" si el salario es mayor o igual a $3500, "Salario medio" 
-- si es mayor o igual a $3000 y menor que $3500, y "Salario bajo" en otros casos.
SELECT nombre,
       CASE
           WHEN salario >= 3500 THEN 'Salario alto'
           WHEN salario >= 3000 AND salario < 3500 THEN 'Salario medio'
           ELSE 'Salario bajo'
       END AS Categoria
FROM empleados;


#Ejercicios Función MAX() 
-- Encuentra el salario máximo de todos los empleados.
SELECT MAX(salario) AS SalarioMaximo
FROM empleados;

-- Encuentra la cantidad máxima de productos vendidos en una sola venta.
SELECT MAX(cantidad) AS CantidadMaxima
FROM ventas;

-- Encuentra la edad máxima de los empleados.
SELECT MAX(edad) AS EdadMaxima
FROM empleados;


#Ejercicios Función MIN()
-- Encuentra el salario mínimo de todos los empleados.
SELECT MIN(salario) AS SalarioMinimo
FROM empleados;

-- Encuentra la cantidad mínima de productos vendidos en una sola venta.
SELECT MIN(cantidad) AS CantidadMinima
FROM ventas;

-- Encuentra la edad mínima de los empleados.
SELECT MIN(edad) AS EdadMinima
FROM empleados;


#Ejercicios de la Función COUNT()
-- Cuenta cuántos empleados hay en total.
SELECT COUNT(*) AS TotalEmpleados
FROM empleados;

-- Cuenta cuántas ventas se han realizado.
SELECT COUNT(*) AS TotalVentas
FROM ventas;

-- Cuenta cuántos productos tienen un precio superior a $500.
SELECT COUNT(*) AS ProductosCaros
FROM productos
WHERE precio > 500;


#Ejercicios de la Función SUM()
-- Calcula la suma total de salarios de todos los empleados.
SELECT SUM(salario) AS SumaSalarios
FROM empleados;

-- Calcula la suma total de montos vendidos en todas las ventas.
SELECT SUM(monto_total) AS SumaMontosVendidos
FROM ventas;

-- Calcula la suma de precios de productos con ID par.
SELECT SUM(precio) AS SumaPreciosProductosPar
FROM productos
WHERE id % 2 = 0;


#Ejercicios Función AVG()
-- Calcula el salario promedio de todos los empleados.
SELECT AVG(salario) AS SalarioPromedio
FROM empleados;

--  el precio unitario promedio de todos los productos.
SELECT AVG(precio) AS PrecioPromedio
FROM productos;

-- Calcula la edad promedio de los empleados.
SELECT AVG(edad) AS EdadPromedio
FROM empleados;

#Ejercicios GROUP BY()
-- Agrupa las ventas por empleado y muestra la cantidad total de ventas realizadas por cada empleado.
SELECT empleado_id,
       COUNT(*) AS TotalVentas
FROM ventas
GROUP BY empleado_id;

-- Agrupa los productos por precio y muestra la cantidad de productos con el mismo precio.
SELECT precio,
       COUNT(*) AS CantidadProductos
FROM productos
GROUP BY precio;

-- Agrupa los empleados por departamento y muestra la cantidad de empleados en cada departamento.
SELECT departamento_id,
       COUNT(*) AS CantidadEmpleados
FROM empleados
GROUP BY departamento_id;

#Ejercicios HAVING 
-- Encuentra los departamentos con un salario promedio de sus empleados superior a $3,000.
SELECT departamento_id,
       AVG(salario) AS SalarioPromedio
FROM empleados
GROUP BY departamento_id
HAVING AVG(salario) > 3000;

-- Encuentra los productos que se han vendido al menos 5 veces.
SELECT producto_id,
       COUNT(*) AS CantidadVentas
FROM ventas
GROUP BY producto_id
HAVING COUNT(*) >= 5;

-- Selecciona los empleados que tengan una “o” en su nombre o apellido y agrúpalos por departamento y muestra los que tengan el salario máximo.
SELECT departamento_id,
       nombre,
       apellido,
       MAX(salario) AS SalarioMaximo
FROM empleados
WHERE nombre LIKE '%o%' OR apellido LIKE '%o%'
GROUP BY departamento_id, nombre, apellido;


#✏️Ejercicios consultas multitabla  - Parte 1
-- Une las tablas de empleados con departamentos y solo muestra las columnas nombre, apellido, edad, salario de empleados y la columna nombre de departamentos.
SELECT empleados.nombre,
       empleados.apellido,
       empleados.edad,
       empleados.salario,
       departamentos.nombre AS 'nombre_departamento'
FROM empleados
JOIN departamentos
ON empleados.departamento_id = departamentos.id;

-- Une las tablas ventas con la tabla empleados donde se muestren todas las columnas de ventas exceptuando la columna empleado_id y en su lugar muestres el nombre y apellido de la tabla empleados.
SELECT ventas.id,
       ventas.producto_id,
       ventas.cliente_id,
       ventas.cantidad,
       ventas.precio_unitario,
       ventas.monto_total,
       empleados.nombre,
       empleados.apellido
FROM ventas
JOIN empleados
ON ventas.empleado_id = empleados.id;

-- Une las tablas ventas con la tabla productos donde se muestren todas las columnas de ventas exceptuando la columna producto_id y en su lugar muestres la columna nombre de la tabla productos.
SELECT ventas.id,
       productos.nombre AS nombre_producto,
       ventas.cliente_id,
       ventas.cantidad,
       ventas.precio_unitario,
       ventas.monto_total,
       ventas.empleado_id
FROM ventas
JOIN productos
ON ventas.producto_id = productos.id;

-- Une las tablas ventas con la tabla clientes donde se muestren todas las columnas de ventas exceptuando la columna cliente_id y en su lugar muestres la columna nombre de la tabla clientes.
SELECT ventas.id,
       ventas.producto_id,
       clientes.nombre AS nombre_cliente,
       ventas.cantidad,
       ventas.precio_unitario,
       ventas.monto_total,
       ventas.empleado_id
FROM ventas
JOIN clientes
ON ventas.cliente_id = clientes.id;

-- Une las tablas ventas con la tablas empleados y departamentos donde se muestren todas las columnas de ventas exceptuando la columna empleado_id y en su lugar muestres el nombre y apellido de la tabla empleados y además muestres la columna nombre de la tabla departamentos.
SELECT ventas.id,
       ventas.producto_id,
       ventas.cliente_id,
       ventas.cantidad,
       ventas.precio_unitario,
       ventas.monto_total,
       empleados.nombre,
       empleados.apellido,
       departamentos.nombre AS nombre_departamento
FROM ventas
JOIN empleados
ON ventas.empleado_id = empleados.id
JOIN departamentos
ON empleados.departamento_id = departamentos.id;

-- Une las tablas ventas, empleados, productos y clientes donde se muestren las columnas de la tabla ventas reemplazando sus columnas de FOREIGN KEYs con las respectivas columnas de “nombre” de las otras tablas.
SELECT ventas.id,
       productos.nombre AS nombre_producto,
       clientes.nombre AS nombre_cliente,
       empleados.nombre AS nombre_empleado,
       empleados.apellido AS apellido_empleado,
       ventas.cantidad,
       ventas.precio_unitario,
       ventas.monto_total
FROM ventas
JOIN productos
ON ventas.producto_id = productos.id
JOIN clientes
ON ventas.cliente_id = clientes.id
JOIN empleados
ON ventas.empleado_id = empleados.id;

-- Calcular el salario máximo de los empleados en cada departamento y mostrar el nombre del departamento junto con el salario máximo.
SELECT departamentos.nombre AS nombre_departamento,
       MAX(empleados.salario) AS salario_maximo
FROM empleados
JOIN departamentos
ON empleados.departamento_id = departamentos.id
GROUP BY departamentos.nombre;


-- arreglando ventas que su monto tatal es 0.00
UPDATE ventas
SET monto_total = cantidad * precio_unitario
WHERE monto_total = 0.00;
-- agregando regla para que se calcule solo 
ALTER TABLE ventas
MODIFY COLUMN monto_total DECIMAL(10, 2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED;


#✏️Ejercicios consultas multitabla - Parte 2 
-- Calcular el monto total de ventas por departamento y mostrar el nombre del departamento junto con el monto total de ventas.
SELECT d.nombre AS nombre_departamento, SUM(v.monto_total) AS monto_total_ventas
FROM ventas v
JOIN empleados e ON v.empleado_id = e.id
JOIN departamentos d ON e.departamento_id = d.id
GROUP BY d.nombre;

-- Encontrar el empleado más joven de cada departamento y mostrar el nombre del departamento junto con la edad del empleado más joven.
SELECT d.nombre AS nombre_departamento, MIN(e.edad) AS edad_empleado_mas_joven
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.id
GROUP BY d.nombre;

SELECT d.nombre AS nombre_departamento, e.nombre AS nombre_empleado, e.apellido AS apellido_empleado, e.edad AS edad_empleado_mas_joven
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.id
WHERE e.edad = (
    SELECT MIN(e2.edad)
    FROM empleados e2
    WHERE e2.departamento_id = e.departamento_id
)
ORDER BY d.nombre;


-- Calcular el volumen de productos vendidos por cada producto (por ejemplo, menos de 5 “bajo”, menos 8 “medio” y mayor o igual a 8 “alto”) y mostrar la categoría de volumen junto con la cantidad y el nombre del producto.
SELECT p.nombre AS nombre_producto, 
       SUM(v.cantidad) AS total_vendido,
       CASE 
           WHEN SUM(v.cantidad) < 5 THEN 'bajo'
           WHEN SUM(v.cantidad) < 8 THEN 'medio'
           ELSE 'alto'
       END AS categoria_volumen
FROM ventas v
JOIN productos p ON v.producto_id = p.id
GROUP BY p.nombre;

-- Encontrar el cliente que ha realizado el mayor monto total de compras y mostrar su nombre y el monto total.
SELECT c.nombre AS nombre_cliente, SUM(v.monto_total) AS monto_total_compras
FROM ventas v
JOIN clientes c ON v.cliente_id = c.id
GROUP BY c.nombre
ORDER BY monto_total_compras DESC
LIMIT 1;

-- Calcular el precio promedio de los productos vendidos por cada empleado y mostrar el nombre del empleado junto con el precio promedio de los productos que ha vendido.
SELECT e.nombre, e.apellido, AVG(p.precio) AS precio_promedio_vendido
FROM ventas v
JOIN empleados e ON v.empleado_id = e.id
JOIN productos p ON v.producto_id = p.id
GROUP BY e.nombre, e.apellido;

-- Encontrar el departamento con el salario mínimo más bajo entre los empleados y mostrar el nombre del departamento junto con el salario mínimo más bajo.
SELECT d.nombre AS nombre_departamento, MIN(e.salario) AS salario_minimo
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.id
GROUP BY d.nombre
ORDER BY salario_minimo ASC
LIMIT 1;

-- Encuentra el departamento con el salario promedio más alto entre los empleados mayores de 30 años y muestra el nombre del departamento junto con el salario promedio. Limita los resultados a mostrar solo los departamentos con el salario promedio mayor a 3320.
SELECT d.nombre AS nombre_departamento, AVG(e.salario) AS salario_promedio
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.id
WHERE e.edad > 30
GROUP BY d.nombre
HAVING salario_promedio > 3320
ORDER BY salario_promedio DESC;


#✏️Ejercicios consultas multitabla - Parte 3
-- Encontrar la cantidad de productos vendidos por cada empleado y mostrar el nombre del empleado junto con la cantidad de productos vendidos.
SELECT e.nombre, e.apellido, SUM(v.cantidad) AS cantidad_productos_vendidos
FROM empleados e
JOIN ventas v ON e.id = v.empleado_id
GROUP BY e.id, e.nombre, e.apellido;

-- Calcular el monto total de ventas por cada cliente y mostrar el nombre del cliente junto con el monto total de sus compras.
SELECT c.nombre, SUM(v.monto_total) AS monto_total_compras
FROM clientes c
JOIN ventas v ON c.id = v.cliente_id
GROUP BY c.id, c.nombre;

-- Encuentra el producto más caro vendido y muestra su nombre y precio
SELECT p.nombre, p.precio
FROM productos p
JOIN ventas v ON p.id = v.producto_id
ORDER BY p.precio DESC
LIMIT 1;


-- Calcular el salario promedio de los empleados en cada departamento y mostrar el nombre del departamento junto con el salario promedio.
SELECT d.nombre AS nombre_departamento, AVG(e.salario) AS salario_promedio
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.id
GROUP BY d.id, d.nombre;

-- Encontrar la cantidad total de ventas realizadas por cada empleado y mostrar el nombre y apellido del empleado junto con la cantidad total de ventas.
SELECT e.nombre, e.apellido, COUNT(v.id) AS cantidad_total_ventas
FROM empleados e
JOIN ventas v ON e.id = v.empleado_id
GROUP BY e.id, e.nombre, e.apellido;

-- Encuentra la cantidad de ventas realizadas por cada empleado y muestra el nombre y apellido del empleado junto con la cantidad total de ventas. Limita los resultados a mostrar solo a los empleados que hayan realizado más de 5 ventas y ordenarlos de forma descendente con respecto a la cantidad de ventas.
SELECT e.nombre, e.apellido, COUNT(v.id) AS cantidad_total_ventas
FROM empleados e
JOIN ventas v ON e.id = v.empleado_id
GROUP BY e.id, e.nombre, e.apellido
HAVING COUNT(v.id) > 5
ORDER BY cantidad_total_ventas DESC;

-- Calcula el monto total vendido por cada empleado y muestra el nombre del empleado junto con el monto total. Usa la cláusula HAVING para filtrar a aquellos empleados que hayan vendido más de 10 productos en total. Muestra el resultado en orden descendente según el monto total vendido.
SELECT e.nombre, e.apellido, SUM(v.monto_total) AS monto_total_vendido
FROM empleados e
JOIN ventas v ON e.id = v.empleado_id
GROUP BY e.id, e.nombre, e.apellido
HAVING SUM(v.cantidad) > 10
ORDER BY monto_total_vendido DESC;

-- Encuentra el monto total vendido a cada cliente y muestra el nombre del cliente junto con el monto total. Usa la cláusula HAVING para filtrar a aquellos clientes cuyo monto total promedio en sus compras sea superior a $1500. Muestra el resultado en orden descendente según el monto total vendido.
SELECT c.nombre, SUM(v.monto_total) AS monto_total_vendido
FROM clientes c
JOIN ventas v ON c.id = v.cliente_id
GROUP BY c.id, c.nombre
HAVING AVG(v.monto_total) > 1500
ORDER BY monto_total_vendido DESC;

-- Calcula la cantidad total de ventas realizadas a cada cliente y muestra el nombre del cliente junto con la cantidad total de ventas. Limita los resultados a mostrar solo a los clientes que hayan realizado más de 3 ventas ordénalos de forma descendente según la cantidad de ventas.
SELECT c.nombre, COUNT(v.id) AS cantidad_total_ventas
FROM clientes c
JOIN ventas v ON c.id = v.cliente_id
GROUP BY c.id, c.nombre
HAVING COUNT(v.id) > 3
ORDER BY cantidad_total_ventas DESC;

-- Encuentra los productos más caros vendidos (precio mayor a 1000), muestra su nombre y precio y ordenarlos de forma descendente por precio.
SELECT p.nombre, p.precio
FROM productos p
JOIN ventas v ON p.id = v.producto_id
WHERE p.precio > 1000
ORDER BY p.precio DESC;
