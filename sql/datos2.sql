-- Crear la tabla de tipos de producto
CREATE TABLE tipo_producto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tipo VARCHAR(100) NOT NULL
);

-- Insertar datos en tipo_producto
INSERT INTO tipo_producto (nombre_tipo) VALUES
('Medicamento'),
('Electrónica'),
('Alimento'),
('Ropa'),
('Muebles');

-- Crear la tabla de productos con clave foránea a tipo_producto
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(255) NOT NULL,
    tipo_id INT,
    FOREIGN KEY (tipo_id) REFERENCES tipo_producto(id)
);

-- Insertar datos en productos
INSERT INTO productos (nombre_producto, tipo_id) VALUES
('Paracetamol', 1),
('Laptop Dell XPS', 2),
('Manzana Roja', 3),
('Camiseta Nike', 4),
('Silla de Oficina', 5);

-- Crear el procedimiento almacenado
DELIMITER //

CREATE PROCEDURE ObtenerProductosYTipos()
BEGIN
    SELECT p.id, p.nombre_producto, tp.nombre_tipo AS tipo_producto
    FROM productos p
    JOIN tipo_producto tp ON p.tipo_id = tp.id;
END //

DELIMITER ;

-- Ejecutar el procedimiento almacenado
CALL ObtenerProductosYTipos();
