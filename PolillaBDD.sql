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
    FOREIGN KEY (id_categoria) REFERENCES categoria(idCategoria)
);

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




