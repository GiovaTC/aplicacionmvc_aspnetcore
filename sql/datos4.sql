-- Crear la tabla de códigos de productos
CREATE TABLE codigo_productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT,
    codigo VARCHAR(10) UNIQUE NOT NULL,
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE
);

-- Insertar datos en codigo_productos
INSERT INTO codigo_productos (producto_id, codigo) VALUES
(1, 'AB001'),
(2, 'AB002'),
(3, 'AB003'),
(4, 'AB004'),
(5, 'AB005'),
(6, 'AB006'),
(7, 'AB007'),
(8, 'AB008'),
(9, 'AB009'),
(10, 'AB010');

-- Modificar el procedimiento almacenado para incluir el código del producto
DELIMITER //

CREATE PROCEDURE ObtenerProductosYTipos()
BEGIN
    SELECT p.id, p.nombre_producto, tp.nombre_tipo AS tipo_producto, cp.cantidad, cod.codigo
    FROM productos p
    JOIN tipo_producto tp ON p.tipo_id = tp.id
    LEFT JOIN cantidad_productos cp ON p.id = cp.producto_id
    LEFT JOIN codigo_productos cod ON p.id = cod.producto_id;
END //

DELIMITER ;

-- Ejecutar el procedimiento almacenado
CALL ObtenerProductosYTipos();
