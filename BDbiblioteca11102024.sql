-- MariaDB dump 10.19  Distrib 10.4.33-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: biblioteca2
-- ------------------------------------------------------
-- Server version	10.4.33-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `IDEmpleado` int(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `contraseña` varchar(20) NOT NULL,
  `apellidoma` varchar(50) NOT NULL,
  `apellidopa` varchar(50) NOT NULL,
  PRIMARY KEY (`IDEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Pedro','password123','Fernandez','Gomez'),(2,'Lucia','password456','Martinez','Lopez'),(3,'Miguel','password789','Hernandez','Perez'),(4,'Laura','password101','Diaz','Garcia'),(5,'Sofia','password202','Ruiz','Rodriguez');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esprestado`
--

DROP TABLE IF EXISTS `esprestado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esprestado` (
  `fechaPrestamo` date NOT NULL,
  `fechaDevolucion` date NOT NULL,
  `DiasPrestado` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `IDUsuario` int(11) NOT NULL,
  PRIMARY KEY (`codigo`,`IDUsuario`),
  KEY `IDUsuario` (`IDUsuario`),
  CONSTRAINT `esprestado_ibfk_1` FOREIGN KEY (`codigo`) REFERENCES `libro` (`codigo`),
  CONSTRAINT `esprestado_ibfk_2` FOREIGN KEY (`IDUsuario`) REFERENCES `usuario` (`IDUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esprestado`
--

LOCK TABLES `esprestado` WRITE;
/*!40000 ALTER TABLE `esprestado` DISABLE KEYS */;
INSERT INTO `esprestado` VALUES ('2023-05-01','2023-05-15',14,1,1),('2023-06-05','2023-06-10',5,2,2),('2023-04-10','2023-04-25',15,3,3),('2023-03-20','2023-04-05',16,4,4),('2023-05-10','2023-05-20',10,5,5);
/*!40000 ALTER TABLE `esprestado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esregistrado`
--

DROP TABLE IF EXISTS `esregistrado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esregistrado` (
  `IDUsuario` int(11) NOT NULL,
  `IDEmpleado` int(11) NOT NULL,
  PRIMARY KEY (`IDUsuario`,`IDEmpleado`),
  KEY `IDEmpleado` (`IDEmpleado`),
  CONSTRAINT `esregistrado_ibfk_1` FOREIGN KEY (`IDUsuario`) REFERENCES `usuario` (`IDUsuario`),
  CONSTRAINT `esregistrado_ibfk_2` FOREIGN KEY (`IDEmpleado`) REFERENCES `empleado` (`IDEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esregistrado`
--

LOCK TABLES `esregistrado` WRITE;
/*!40000 ALTER TABLE `esregistrado` DISABLE KEYS */;
INSERT INTO `esregistrado` VALUES (1,2),(2,3),(3,1),(4,5),(5,4);
/*!40000 ALTER TABLE `esregistrado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libro` (
  `codigo` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `autor` varchar(50) NOT NULL,
  `genero` varchar(30) NOT NULL,
  `editorial` varchar(100) NOT NULL,
  `NoEjemplares` int(11) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES (1,'Cien años de soledad','Gabriel Garcia Marquez','Novela','Editorial Sudamericana',10),(2,'Don Quijote de la Mancha','Miguel de Cervantes','Novela','Francisco de Robles',5),(3,'La sombra del viento','Carlos Ruiz Zafon','Misterio','Planeta',8),(4,'El amor en los tiempos del colera','Gabriel Garcia Marquez','Novela','Editorial Oveja Negra',7),(5,'Ficciones','Jorge Luis Borges','Cuentos','Editorial Sur',12);
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `nombres` varchar(50) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `correoElectronico` varchar(30) NOT NULL,
  `apellidopa` varchar(50) NOT NULL,
  `apellidoma` varchar(50) NOT NULL,
  `IDUsuario` int(11) NOT NULL,
  `motivo` varchar(100) NOT NULL,
  `fechaMulta` date NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`IDUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('Juan','Calle Falsa 123','5551234567','juan@example.com','Perez','Gomez',1,'Retraso en devolucion','2024-01-01',50),('Maria','Avenida Siempre Viva 456','5559876543','maria@example.com','Lopez','Martinez',2,'Libro danado','2024-02-15',75),('Carlos','Boulevard de los Suenos 789','5554567890','carlos@example.com','Hernandez','Ruiz',3,'Perdida de libro','2024-03-10',100),('Ana','Calle Luna 321','5552345678','ana@example.com','Rodriguez','Diaz',4,'Retraso en devolucion','2024-04-05',50),('Luis','Avenida Sol 654','5558765432','luis@example.com','Garcia','Fernandez',5,'Libro danado','2024-05-20',75),('Abril','Centro Oaxaca','521346789008','Abril@gmail.com','Perez','Flores',6,'0','0000-00-00',0),('Heriberto','Centro Oaxaca','521346734508','Heriberto@gmail.com','Gomez','Villa',7,'0','0000-00-00',0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-11 17:39:40
