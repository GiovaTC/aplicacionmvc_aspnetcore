USE dataejemplo;

-- Crear la tabla de cantidades de productos
CREATE TABLE cantidad_productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT,
    cantidad INT NOT NULL,
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE
);

-- Insertar datos en cantidad_productos
INSERT INTO cantidad_productos (producto_id, cantidad) VALUES
(1, 50),
(2, 20),
(3, 100),
(4, 75),
(5, 30),
(6, 200),
(7, 40),
(8, 60),
(9, 25),
(10, 90);

-- Modificar el procedimiento almacenado para incluir la cantidad
DELIMITER //

CREATE PROCEDURE ObtenerProductosYTipos()
BEGIN
    SELECT p.id, p.nombre_producto, tp.nombre_tipo AS tipo_producto, cp.cantidad
    FROM productos p
    JOIN tipo_producto tp ON p.tipo_id = tp.id
    LEFT JOIN cantidad_productos cp ON p.id = cp.producto_id;
END //

DELIMITER ;

-- Ejecutar el procedimiento almacenado
CALL ObtenerProductosYTipos();
