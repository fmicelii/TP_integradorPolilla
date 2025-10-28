-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: TPFinal_MiceliTabuada
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Alerta_Stock`
--

DROP TABLE IF EXISTS `Alerta_Stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Alerta_Stock` (
  `idAlerta` int NOT NULL AUTO_INCREMENT,
  `idIngrediente` int NOT NULL,
  `fechaAlerta` datetime DEFAULT NULL,
  `mensaje` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idAlerta`),
  KEY `idIngrediente` (`idIngrediente`),
  CONSTRAINT `Alerta_Stock_ibfk_1` FOREIGN KEY (`idIngrediente`) REFERENCES `Ingredientes` (`idIngrediente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alerta_Stock`
--

LOCK TABLES `Alerta_Stock` WRITE;
/*!40000 ALTER TABLE `Alerta_Stock` DISABLE KEYS */;
INSERT INTO `Alerta_Stock` VALUES (1,2,'2025-10-24 11:27:27','Stock bajo: Carne vacuna (25 unidades restantes, mínimo 30)'),(2,3,'2025-10-24 11:27:27','Stock bajo: Queso cheddar (10 unidades restantes, mínimo 15)'),(3,7,'2025-10-24 11:27:27','Stock bajo: Pollo grillado (8 unidades restantes, mínimo 10)');
/*!40000 ALTER TABLE `Alerta_Stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categoria` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `nombreCategoria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria`
--

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
INSERT INTO `Categoria` VALUES (1,'Pizzas'),(2,'Bebidas'),(3,'Hamburguesas'),(4,'Postres');
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DetallePedido`
--

DROP TABLE IF EXISTS `DetallePedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DetallePedido` (
  `idDetalle` int NOT NULL AUTO_INCREMENT,
  `idPedido` int NOT NULL,
  `idProducto` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  PRIMARY KEY (`idDetalle`),
  KEY `idPedido` (`idPedido`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `DetallePedido_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `Pedido` (`idPedido`),
  CONSTRAINT `DetallePedido_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `Producto` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DetallePedido`
--

LOCK TABLES `DetallePedido` WRITE;
/*!40000 ALTER TABLE `DetallePedido` DISABLE KEYS */;
INSERT INTO `DetallePedido` VALUES (1,1,1,3,2500),(2,2,2,4,800),(3,3,3,1,3000),(4,4,4,2,1500);
/*!40000 ALTER TABLE `DetallePedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ingredientes`
--

DROP TABLE IF EXISTS `Ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ingredientes` (
  `idIngrediente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `stockMinimo` int DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `Producto_idProducto` int DEFAULT NULL,
  PRIMARY KEY (`idIngrediente`),
  KEY `Producto_idProducto` (`Producto_idProducto`),
  CONSTRAINT `Ingredientes_ibfk_1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `Producto` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingredientes`
--

LOCK TABLES `Ingredientes` WRITE;
/*!40000 ALTER TABLE `Ingredientes` DISABLE KEYS */;
INSERT INTO `Ingredientes` VALUES (1,'Pan de hamburguesa',50,20,100,NULL),(2,'Carne vacuna',25,10,350,NULL),(3,'Queso cheddar',30,15,120,NULL),(4,'Lechuga',40,10,50,NULL),(5,'Tomate',35,10,80,NULL),(6,'Papas fritas',100,30,150,NULL),(7,'Pollo grillado',20,10,300,NULL),(8,'Pan de sándwich',45,15,90,NULL),(9,'Cebolla caramelizada',15,5,60,NULL),(10,'Bebida cola',60,25,200,NULL),(11,'Manteca',20,25,200,NULL);
/*!40000 ALTER TABLE `Ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pedido`
--

DROP TABLE IF EXISTS `Pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int NOT NULL,
  `idRestaurante` int NOT NULL,
  `fechaPedido` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('pendiente','enPreparacion','enCamino','entregado','cancelado') DEFAULT 'pendiente',
  `total` float DEFAULT NULL,
  `metodoPago` enum('efectivo','tarjeta','transferencia') DEFAULT NULL,
  `direccionEntrega` varchar(45) DEFAULT NULL,
  `fechaEntrega` datetime DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idRestaurante` (`idRestaurante`),
  CONSTRAINT `Pedido_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`idUsuario`),
  CONSTRAINT `Pedido_ibfk_2` FOREIGN KEY (`idRestaurante`) REFERENCES `Restaurante` (`idRestaurante`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pedido`
--

LOCK TABLES `Pedido` WRITE;
/*!40000 ALTER TABLE `Pedido` DISABLE KEYS */;
INSERT INTO `Pedido` VALUES (1,1,1,'2025-10-20 12:30:01','pendiente',3300,'tarjeta','Calle Falsa 123',NULL),(2,3,2,'2025-10-20 12:30:01','enPreparacion',4500,'efectivo','Av. Central 456',NULL),(3,1,1,'2025-10-20 12:32:09','pendiente',3300,'tarjeta','Calle Falsa 123',NULL),(4,3,2,'2025-10-20 12:32:09','enPreparacion',4500,'efectivo','Av. Central 456',NULL),(5,1,1,'2025-10-21 14:03:15','cancelado',3300,'tarjeta','Calle Falsa 123',NULL),(6,3,2,'2025-10-21 14:03:15','cancelado',4500,'efectivo','Av. Central 456',NULL),(7,1,1,'2025-10-21 14:03:22','cancelado',3300,'tarjeta','Calle Falsa 123',NULL),(8,3,2,'2025-10-21 14:03:22','cancelado',4500,'efectivo','Av. Central 456',NULL),(15,1,1,'2025-10-10 12:00:00','entregado',3300,'tarjeta','Calle Falsa 123','2025-10-10 12:45:00'),(16,2,1,'2025-10-10 13:20:00','entregado',4200,'efectivo','Av. Central 456','2025-10-10 14:10:00'),(17,3,1,'2025-10-10 19:30:00','entregado',2800,'tarjeta','Av. del Sol 789','2025-10-10 20:05:00'),(18,1,1,'2025-10-12 12:00:00','entregado',3300,'tarjeta','Calle Falsa 123','2025-10-12 12:45:00'),(19,2,2,'2025-10-11 13:20:00','entregado',4200,'efectivo','Av. Central 456','2025-10-11 14:10:00'),(20,3,2,'2025-10-12 19:30:00','entregado',2800,'tarjeta','Av. del Sol 789','2025-10-12 20:05:00');
/*!40000 ALTER TABLE `Pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Producto`
--

DROP TABLE IF EXISTS `Producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Producto` (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `idRestaurante` int NOT NULL,
  `idCategoria` int DEFAULT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` text,
  `precio` float DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idProducto`),
  KEY `idRestaurante` (`idRestaurante`),
  KEY `idCategoria` (`idCategoria`),
  CONSTRAINT `Producto_ibfk_1` FOREIGN KEY (`idRestaurante`) REFERENCES `Restaurante` (`idRestaurante`),
  CONSTRAINT `Producto_ibfk_2` FOREIGN KEY (`idCategoria`) REFERENCES `Categoria` (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Producto`
--

LOCK TABLES `Producto` WRITE;
/*!40000 ALTER TABLE `Producto` DISABLE KEYS */;
INSERT INTO `Producto` VALUES (1,1,1,'Pizza Margarita','Pizza con salsa de tomate, mozzarella y albahaca.',2500,'pizza_margarita.jpg',1),(2,1,2,'Gaseosa Cola 500ml','Bebida refrescante con gas.',800,'gaseosa_cola.jpg',1),(3,2,3,'Hamburguesa Clásica','Pan, carne, queso, lechuga y tomate.',3000,'hamburguesa_clasica.jpg',1),(4,2,4,'Brownie con helado','Brownie de chocolate con una bocha de helado.',1500,'brownie_helado.jpg',1);
/*!40000 ALTER TABLE `Producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Resenia`
--

DROP TABLE IF EXISTS `Resenia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Resenia` (
  `idResenia` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int NOT NULL,
  `idRestaurante` int NOT NULL,
  `calificacion` int DEFAULT NULL,
  `comentario` text,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`idResenia`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idRestaurante` (`idRestaurante`),
  CONSTRAINT `Resenia_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`idUsuario`),
  CONSTRAINT `Resenia_ibfk_2` FOREIGN KEY (`idRestaurante`) REFERENCES `Restaurante` (`idRestaurante`),
  CONSTRAINT `Resenia_chk_1` CHECK ((`calificacion` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Resenia`
--

LOCK TABLES `Resenia` WRITE;
/*!40000 ALTER TABLE `Resenia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Resenia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Restaurante`
--

DROP TABLE IF EXISTS `Restaurante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Restaurante` (
  `idRestaurante` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` text,
  `direccion` varchar(45) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `horarioApertura` time DEFAULT NULL,
  `horarioCierre` time DEFAULT NULL,
  `estado` enum('activo','inactivo') DEFAULT 'activo',
  `fechaRegistro` datetime DEFAULT NULL,
  PRIMARY KEY (`idRestaurante`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `Restaurante_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Restaurante`
--

LOCK TABLES `Restaurante` WRITE;
/*!40000 ALTER TABLE `Restaurante` DISABLE KEYS */;
INSERT INTO `Restaurante` VALUES (1,2,'La Pizzería Italiana','Pizzas artesanales al estilo napolitano.','Av. San Martín 123','Buenos Aires','114567890','11:00:00','23:00:00','activo','2025-10-20 12:29:26'),(2,4,'BurgerLand','Hamburguesas caseras y papas fritas.','Calle 25 de Mayo 456','Córdoba','115678901','12:00:00','00:00:00','activo','2025-10-20 12:29:26');
/*!40000 ALTER TABLE `Restaurante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `contrasenia` varchar(45) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `tipoUsuario` enum('cliente','restaurante','admin') DEFAULT 'cliente',
  `fechaRegistro` datetime DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,'Carlos','Gómez','carlos@gmail.com','1234','111111111','cliente','2025-10-20 12:29:12'),(2,'María','López','maria@gmail.com','abcd','222222222','restaurante','2025-10-20 12:29:12'),(3,'Lucía','Pérez','lucia@gmail.com','lucia123','333333333','cliente','2025-10-20 12:29:12'),(4,'Andrés','Ramos','andres@gmail.com','andrespass','444444444','restaurante','2025-10-20 12:29:12'),(5,'Admin','General','admin@poliya.com','admin','555555555','admin','2025-10-20 12:29:12');
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-24 11:43:12
