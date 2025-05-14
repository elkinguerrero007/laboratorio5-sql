CREATE DATABASE empresa;
USE empresa;

-- Tabla de cargos
CREATE TABLE Cargo (
    id_cargo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cargo VARCHAR(50) NOT NULL,
    descripcion TEXT,
    salario DECIMAL(10,2)
);

-- Tabla de empleados
CREATE TABLE Empleados (
    id_empl INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_cargo INT,
    salario DECIMAL(10,2),
    FOREIGN KEY (id_cargo) REFERENCES Cargo(id_cargo)
);


-- Insertar cargos
INSERT INTO Cargo (nombre_cargo, descripcion, salario) VALUES
('Gerente', 'Responsable de la dirección general', 500000),
('Asistente', 'Asistencia administrativa y logística', 250000),
('Desarrollador', 'Desarrollador de software', 400000);

-- Insertar empleados
INSERT INTO Empleados (nombre, id_cargo, salario) VALUES
('Juan Pérez', (SELECT id_cargo FROM Cargo WHERE nombre_cargo = 'Gerente'), 7500000),
('Ana Gómez', (SELECT id_cargo FROM Cargo WHERE nombre_cargo = 'Desarrollador'), 6000000),
('Luis Castro', (SELECT id_cargo FROM Cargo WHERE nombre_cargo = 'Gerente'), 10000000);



----------CONSULTAS-------------

-- a) Mostrar todos los datos de los empleados
SELECT * FROM Empleados;

-- b) Seleccionar todos los cargos
SELECT * FROM Cargo;

-- c) Seleccionar empleados que ganan más de 7,000,000
SELECT * FROM Empleados WHERE salario > 7000000;

-- d) Actualizar salario de Ana Gómez a 6,500,000
UPDATE Empleados SET salario = 6500000 WHERE nombre = 'Ana Gómez';

-- e) Eliminar a Luis Castro
DELETE FROM Empleados WHERE nombre = 'Luis Castro';

-- f) Seleccionar empleados con cargo 'Desarrollador'
SELECT e.* FROM Empleados e
JOIN Cargo c ON e.id_cargo = c.id_cargo
WHERE c.nombre_cargo = 'Desarrollador';

-- g) Insertar nueva empleada Marta López como Asistente con salario 3,000,000
INSERT INTO Empleados (nombre, id_cargo, salario)
VALUES ('Marta López', (SELECT id_cargo FROM Cargo WHERE nombre_cargo = 'Asistente'), 3000000);



----------------BIBLIOTECA-----------------

-- a) Marcar un libro como no disponible (por ejemplo, libro con ID 1)
UPDATE Libros SET Disponible = FALSE WHERE ID_Libro = 1;

-- b) Actualizar la fecha de devolución de un préstamo (por ejemplo, préstamo con ID = 1)
UPDATE Prestamos SET Fecha_Devolucion = '2024-08-20' WHERE ID_Prestamo = 1;

-- c) Eliminar un libro de la base (por ejemplo, libro con ID = 3)
DELETE FROM Libros WHERE ID_Libro = 3;



## Consultas de validacion

-- a) Seleccionar todos los libros
SELECT * FROM Libros;

-- b) Seleccionar todos los autores
SELECT * FROM Autores;

-- c) Seleccionar el libro de Gabriel García Márquez
SELECT l.* FROM Libros l
JOIN Autores a ON l.ID_Autor = a.ID_Autor
WHERE a.Nombre = 'Gabriel García Márquez';

-- d) Mostrar libros devueltos en el mes 8 del año 2024
SELECT * FROM Prestamos
WHERE MONTH(Fecha_Devolucion) = 8 AND YEAR(Fecha_Devolucion) = 2024;

