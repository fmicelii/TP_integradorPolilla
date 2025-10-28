CREATE TABLE Usuario (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45),
    email VARCHAR(45) UNIQUE NOT NULL,
    contrasenia VARCHAR(45) NOT NULL,
    telefono VARCHAR(45),
    tipoUsuario ENUM('cliente', 'restaurante', 'admin') DEFAULT 'cliente',
    fechaRegistro DATETIME
);

CREATE TABLE Restaurante (
    idRestaurante INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    descripcion TEXT,
    direccion VARCHAR(45),
    ciudad VARCHAR(45),
    telefono VARCHAR(45),
    horarioApertura TIME,
    horarioCierre TIME,
    estado ENUM('activo', 'inactivo') DEFAULT 'activo',
    fechaRegistro DATETIME,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

CREATE TABLE Categoria(
	idCategoria INT AUTO_INCREMENT PRIMARY KEY,
    nombreCategoria VARCHAR(45)
);

CREATE TABLE Producto (
    idProducto INT AUTO_INCREMENT PRIMARY KEY,
    idRestaurante INT NOT NULL,
    idCategoria INT,
    nombre VARCHAR(45) NOT NULL,
    descripcion TEXT,
    precio FLOAT,
    imagen VARCHAR(45),
    disponible BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (idRestaurante) REFERENCES Restaurante(idRestaurante),
    FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
);

drop table Producto;

CREATE TABLE Pedido (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT NOT NULL,
    idRestaurante INT NOT NULL,
    fechaPedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('pendiente', 'enPreparacion', 'enCamino', 'entregado', 'cancelado') DEFAULT 'pendiente',
    total FLOAT,
    metodoPago ENUM('efectivo', 'tarjeta', 'transferencia'),
    direccionEntrega VARCHAR(45),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (idRestaurante) REFERENCES Restaurante(idRestaurante)
);	

CREATE TABLE DetallePedido (
    idDetalle INT AUTO_INCREMENT PRIMARY KEY,
    idPedido INT NOT NULL,
    idProducto INT NOT NULL,
    cantidad INT,
    subtotal FLOAT,
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);
drop table DetallePedido;

CREATE TABLE Resenia (
    idResenia INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT NOT NULL,
    idRestaurante INT NOT NULL,
    calificacion INT CHECK (calificacion BETWEEN 1 AND 5),
    comentario TEXT,
    fecha DATETIME,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (idRestaurante) REFERENCES Restaurante(idRestaurante)
);

INSERT INTO Usuario (nombre, apellido, email, contrasenia, telefono, tipoUsuario, fechaRegistro) VALUES
('Carlos', 'Gómez', 'carlos@gmail.com', '1234', '111111111', 'cliente', NOW()),
('María', 'López', 'maria@gmail.com', 'abcd', '222222222', 'restaurante', NOW()),
('Lucía', 'Pérez', 'lucia@gmail.com', 'lucia123', '333333333', 'cliente', NOW()),
('Andrés', 'Ramos', 'andres@gmail.com', 'andrespass', '444444444', 'restaurante', NOW()),
('Admin', 'General', 'admin@poliya.com', 'admin', '555555555', 'admin', NOW());

INSERT INTO Restaurante (idUsuario, nombre, descripcion, direccion, ciudad, telefono, horarioApertura, horarioCierre, estado, fechaRegistro) VALUES
(2, 'La Pizzería Italiana', 'Pizzas artesanales al estilo napolitano.', 'Av. San Martín 123', 'Buenos Aires', '114567890', '11:00:00', '23:00:00', 'activo', NOW()),
(4, 'BurgerLand', 'Hamburguesas caseras y papas fritas.', 'Calle 25 de Mayo 456', 'Córdoba', '115678901', '12:00:00', '00:00:00', 'activo', NOW());

INSERT INTO Categoria (nombreCategoria) VALUES
('Pizzas'),
('Bebidas'),
('Hamburguesas'),
('Postres');

INSERT INTO Producto (idRestaurante, idCategoria, nombre, descripcion, precio, imagen, disponible) VALUES
(1, 1, 'Pizza Margarita', 'Pizza con salsa de tomate, mozzarella y albahaca.', 2500, 'pizza_margarita.jpg', TRUE),
(1, 2, 'Gaseosa Cola 500ml', 'Bebida refrescante con gas.', 800, 'gaseosa_cola.jpg', TRUE),
(2, 3, 'Hamburguesa Clásica', 'Pan, carne, queso, lechuga y tomate.', 3000,'hamburguesa_clasica.jpg', TRUE),
(2, 4, 'Brownie con helado', 'Brownie de chocolate con una bocha de helado.', 1500, 'brownie_helado.jpg', TRUE);

INSERT INTO Pedido (idUsuario, idRestaurante, fechaPedido, estado, total, metodoPago, direccionEntrega) VALUES
(1, 1, NOW(), 'Cancelado', 3300, 'tarjeta', 'Calle Falsa 123'),
(3, 2, NOW(), 'Cancelado', 4500, 'efectivo', 'Av. Central 456');

INSERT INTO Pedido 
(idUsuario, idRestaurante, fechaPedido, fechaEntrega, estado, total, metodoPago, direccionEntrega) VALUES
(1, 1, '2025-10-12 12:00:00', '2025-10-12 12:45:00', 'entregado', 3300, 'tarjeta', 'Calle Falsa 123'),
(2, 2, '2025-10-11 13:20:00', '2025-10-11 14:10:00', 'entregado', 4200, 'efectivo', 'Av. Central 456'),
(3, 2, '2025-10-12 19:30:00', '2025-10-12 20:05:00', 'entregado', 2800, 'tarjeta', 'Av. del Sol 789');

INSERT INTO DetallePedido (idDetalle, idPedido, idProducto, cantidad, subtotal) VALUES
(1, 1, 1, 3, 2500),
(2, 2, 2, 4, 800),
(3, 3, 3, 1, 3000),
(4, 4, 4, 2, 1500);

INSERT INTO Ingredientes (nombre, stock, stockMinimo, precio)
VALUES
('Pan de hamburguesa', 50, 20, 100.00),
('Carne vacuna', 25, 10, 350.00),
('Queso cheddar', 30, 15, 120.00),
('Lechuga', 40, 10, 50.00),
('Tomate', 35, 10, 80.00),
('Papas fritas', 100, 30, 150.00),
('Pollo grillado', 20, 10, 300.00),
('Pan de sándwich', 45, 15, 90.00),
('Cebolla caramelizada', 15, 5, 60.00),
('Manteca', 20, 25, 200.00);



INSERT INTO Alerta_Stock (idIngrediente, mensaje, fechaAlerta)
VALUES
(2, 'Stock bajo: Carne vacuna (25 unidades restantes, mínimo 30)', NOW()),
(3, 'Stock bajo: Queso cheddar (10 unidades restantes, mínimo 15)', NOW()),
(7, 'Stock bajo: Pollo grillado (8 unidades restantes, mínimo 10)', NOW());



DELIMITER //

CREATE TRIGGER verificarStock BEFORE INSERT ON DetallePedido FOR EACH ROW
BEGIN
    DECLARE stock_actual INT;
	SELECT stock INTO stock_actual FROM productos WHERE idProducto = NEW.idProducto;
	IF stock_actual < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Stock insuficiente";
    END IF;
END;
//
DELIMITER ;

DELIMITER //

CREATE TRIGGER restaurarStock AFTER UPDATE ON Pedido FOR EACH ROW
BEGIN
    IF NEW.estado = "cancelado" AND OLD.estado != "cancelado" THEN
        UPDATE Producto JOIN DetallePedido d ON Producto.idProducto = DetallePedido.idProducto 
        SET Producto.stock = Producto.stock + DetallePedido.cantidad WHERE d.idPedido = NEW.idPedido;
    END IF;
END;
//

DELIMITER ;

DELIMITER //

CREATE PROCEDURE MasVendidos(IN p_idRestaurante INT, IN p_fechaInicio DATETIME, IN p_fechaFin DATETIME)
BEGIN
    SELECT Producto.nombre AS Producto, SUM(DetallePedido.cantidad) AS cantidad_vendida,
        SUM(DetallePedido.subtotal) AS ganancia_generada FROM DetallePedido JOIN Producto ON DetallePedido.idProducto = Producto.idProducto
    JOIN Pedido ON DetallePedido.idPedido = Pedido.idPedido WHERE Pedido.idRestaurante = p_idRestaurante
      AND Pedido.fechaPedido BETWEEN p_fechaInicio AND p_fechaFin AND Pedido.estado != "cancelado" GROUP BY Producto.idProducto
    ORDER BY cantidad_vendida DESC
    LIMIT 10;
END;
//
DELIMITER ;
CALL MasVendidos(2, '2025-10-20 12:00:00', '2025-10-21 12:00:00');

DELIMITER //

CREATE PROCEDURE TiempoPromedioEspera()
BEGIN
    SELECT 
        Restaurante.nombre AS Restaurante,
        YEAR(Pedido.fechaPedido) AS Año,
        MONTH(Pedido.fechaPedido) AS Mes,
        ROUND(AVG(TIMESTAMPDIFF(MINUTE, Pedido.fechaPedido, Pedido.fechaEntrega)), 2) AS Promedio
    FROM Pedido JOIN Restaurante ON Pedido.idRestaurante = Restaurante.idRestaurante
    WHERE Pedido.estado = 'entregado' AND Pedido.fechaEntrega IS NOT NULL GROUP BY Restaurante.nombre,
        Restaurante.idRestaurante,
        YEAR(Pedido.fechaPedido),
        MONTH(Pedido.fechaPedido),
        CONCAT(MONTHNAME(Pedido.fechaPedido), ' ', YEAR(Pedido.fechaPedido))
    ORDER BY Año DESC, Mes DESC, Restaurante.nombre;
END;
//
DELIMITER ;
drop procedure TiempoPromedioEspera;
call TiempoPromedioEspera();


CREATE TABLE Alerta_Stock (
    idAlerta INT AUTO_INCREMENT PRIMARY KEY,
    idIngrediente INT NOT NULL,
    fechaAlerta DATETIME,
    mensaje VARCHAR(250),
    FOREIGN KEY (idIngrediente) REFERENCES Ingredientes(idIngrediente)
);

drop table Alerta_Stock;

CREATE TABLE Ingredientes(
	idIngrediente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45),
    stock INT,
    stockMinimo INT,
    precio FLOAT,
    Producto_idProducto INT,
    FOREIGN KEY (Producto_idProducto) REFERENCES Producto(idProducto)
    );

DELIMITER //

CREATE EVENT IF NOT EXISTS EventoAlertaStock ON SCHEDULE EVERY 1 DAY STARTS TIMESTAMP(CURRENT_DATE, '06:00:00') DO
BEGIN
    INSERT INTO Alerta_Stock (idIngrediente, mensaje)
    SELECT idIngrediente, CONCAT('Stock bajo: ', nombre, ' (', stock, ' disponibles)') FROM Ingredientes WHERE stock < stockMinimo
      AND idIngrediente NOT IN (SELECT idIngrediente FROM Alerta_Stock);
END;
//

DELIMITER ;

DELIMITER //

CREATE EVENT IF NOT EXISTS LimpiezaAlertas ON SCHEDULE EVERY 3 DAY
STARTS TIMESTAMP(CURRENT_DATE, '06:00:00')DO
BEGIN
    DELETE FROM Alerta_Stock WHERE idIngrediente IN (SELECT idIngrediente FROM Ingrediente WHERE stock >= stockMinimo);
END;
//

DELIMITER ;
