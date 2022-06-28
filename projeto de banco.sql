CREATE DATABASE  IF NOT EXISTS `mercado` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `mercado`;
-- MariaDB dump 10.19  Distrib 10.6.8-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: mercado
-- ------------------------------------------------------
-- Server version	10.6.8-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) COLLATE utf8mb3_bin DEFAULT NULL,
  `sobrenome` varchar(20) COLLATE utf8mb3_bin DEFAULT NULL,
  `cpf` varchar(15) COLLATE utf8mb3_bin DEFAULT NULL,
  `rg` varchar(15) COLLATE utf8mb3_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb3_bin DEFAULT NULL,
  `endereco` varchar(100) COLLATE utf8mb3_bin DEFAULT NULL,
  `cep` varchar(15) COLLATE utf8mb3_bin DEFAULT NULL,
  `celular` varchar(15) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  UNIQUE KEY `rg_UNIQUE` (`rg`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Ricardo','Ribeiro','35108539037','503867822','ricardao123@gmail.com','Travessa São Paulo','54270590','81956451232'),(2,'Julia','Silva','57141152016','143839433','julhinha@hotmail.com','Rua São José','54220375','81956233956'),(3,'Everton','Marques','28449155070','424478717','everton_56@outlook.com','Travessa Entre Rios','54120131','81956366504'),(4,'Gustavo','Cunha','14668227080','187183569','gusta@gmail.com','Rua São Mateus','54360162','81912564879'),(5,'Junior','Silva','44898584004','116637286','juniorjrjr@hotmail.com','Rua Eunice Caetés','54080272','81945782361'),(6,'Antony','Oliveira','14722597006','425928913','toninho@hotmail.com','Rua das Oliveiras','54170790','81965487231'),(7,'Rivaldo','Galvao','41339078090','397609978','rivaldo@gmail.com','Rua José Balarmino Bezerra','54350720','81945682321'),(8,'Leo','Correia','32921090007','221428732','leo_@outlook.com','Rua Cento e Vinte Três','54490500','81945789631'),(9,'Clara','Gomes','09138782006','145920707','clara_gomes@gmail.com','Rua São Gabriel','54460688','81954869156'),(10,'Artamiel','Luz','54068599009','424777381','artamielnat5LD@gmail.com','Rua Barra de Santana','54245165','81978569423');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada_pagamento`
--

DROP TABLE IF EXISTS `entrada_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrada_pagamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_emissao` date DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `pagamento` tinyint(1) DEFAULT NULL,
  `qunt_produto_comprado` int(11) DEFAULT NULL,
  `id_fornecedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_fornecedor_idx` (`id_fornecedor`),
  CONSTRAINT `id_fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada_pagamento`
--

LOCK TABLES `entrada_pagamento` WRITE;
/*!40000 ALTER TABLE `entrada_pagamento` DISABLE KEYS */;
INSERT INTO `entrada_pagamento` VALUES (1,'2022-06-25','2023-01-30',5865.12,1,500,18),(2,'2022-06-25','2023-01-25',8457.06,1,250,19),(3,'2022-06-25','2023-02-06',3893.36,1,350,11),(4,'2022-06-25','2023-01-04',4010.56,1,400,12),(5,'2022-06-25','2023-01-11',2523.36,1,150,13),(6,'2022-06-25','2023-01-19',9355.99,1,300,14),(7,'2022-06-25','2023-01-29',6882.99,1,250,15),(8,'2022-06-25','2023-01-31',5109.83,1,400,16),(9,'2022-06-25','2023-02-27',4589.15,1,250,17);
/*!40000 ALTER TABLE `entrada_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estoque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantidade_atual` int(11) DEFAULT NULL,
  `quantidade_min` int(11) DEFAULT NULL,
  `quantidade_max` int(11) DEFAULT NULL,
  `produto_id_estoque` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `produto_id_estoque_UNIQUE` (`produto_id_estoque`),
  CONSTRAINT `produto_id_estoque` FOREIGN KEY (`produto_id_estoque`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (11,153,100,500,1),(12,300,80,550,2),(13,350,200,500,3),(14,350,250,560,4),(15,400,200,500,5),(16,70,60,550,6),(17,200,120,500,7),(18,150,100,650,8),(19,250,160,500,9);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fidelidade`
--

DROP TABLE IF EXISTS `fidelidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fidelidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor_gasto` double DEFAULT NULL,
  `pontos` double DEFAULT NULL,
  `id_cliente_fidel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_cliente_fidel_idx` (`id_cliente_fidel`),
  CONSTRAINT `id_cliente_fidel` FOREIGN KEY (`id_cliente_fidel`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fidelidade`
--

LOCK TABLES `fidelidade` WRITE;
/*!40000 ALTER TABLE `fidelidade` DISABLE KEYS */;
INSERT INTO `fidelidade` VALUES (10,250,250,1),(11,50,50,2),(12,5000,5000,3),(13,1917,1917,4),(14,1867,1867,5),(15,80,80,6),(16,7000,7000,7),(17,456,456,8),(18,2345,2345,9);
/*!40000 ALTER TABLE `fidelidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` varchar(20) COLLATE utf8mb3_bin DEFAULT NULL,
  `cnpj` varchar(20) COLLATE utf8mb3_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb3_bin DEFAULT NULL,
  `telefone` varchar(15) COLLATE utf8mb3_bin DEFAULT NULL,
  `cep` varchar(20) COLLATE utf8mb3_bin DEFAULT NULL,
  `endereco` varchar(150) COLLATE utf8mb3_bin DEFAULT NULL,
  `categoriaA` varchar(20) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `cnpj_UNIQUE` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (11,'Brahma','13784917000176','brahma@hotmail.com','81954568234','51130240','Rua Ministro Petrônio Portela','bebidas'),(12,'Seara','06756832000119','seara@gmail.com','81945687921','51340230','Rua Jerônimo Corte Real','frios'),(13,'Coca-cola','80507862000144','cocacolabrasil@gamil.com','81945693218','51335680','Rua Serra dos Montes','bebidas'),(14,'Camil','13154978000150','camil@outlook.com','81954693251','50110305','Rua Araguaçu','grãos'),(15,'Piraque','72369493000142','piraque@hotmail.com','81954963218','50850308','Rua da Esperanca','biscoito'),(16,'Danoninho','97872365000148','danoninho@gmail.com','81945623511','52110241','Rua Tapejara','lácteos'),(17,'Nestle','00116933000149','nestle@hotmail.com','81945627312','50740685','Rua do Jasmim','biscoito'),(18,'Vitarela','15980810000129','vitalera@gamail.com','81945623187','50940730','Rua Clóvis Ávila','milhos'),(19,'Turquesa','34082684000130','turquesa@hotmail.com','81945623791','52070220','Rua Visconde de Taunay','grãos');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) COLLATE utf8mb3_bin DEFAULT NULL,
  `sobrenome` varchar(20) COLLATE utf8mb3_bin DEFAULT NULL,
  `cpf` varchar(15) COLLATE utf8mb3_bin DEFAULT NULL,
  `rg` varchar(15) COLLATE utf8mb3_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb3_bin DEFAULT NULL,
  `celular` varchar(15) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rg_UNIQUE` (`rg`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  UNIQUE KEY `celular_UNIQUE` (`celular`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (80,'Ricardo','Pereira','46134459062','149843963','ricardinho@gmail.com','81945786239'),(81,'Lucas','Ribeiro','67565602043','492627745','lucas@gmail.com','81965238917'),(82,'Godofredo','Junior','18070793090','243222166','godofredo_@outlook.com','81946532589'),(83,'Luan','Santana','81242165096','175045446','luan_@gmail.com','81945362799'),(84,'Lucas','Neto','66725559000','488761876','lucasneto@hotmail.com','81945261378'),(85,'Flavio','Costa','21077657072','442477429','flavio@hotmail.com','81945623879'),(86,'Michel','Shine','44329339099','208437691','shine@outlook.com','81945263189'),(87,'Ana','Vitoria ','25605274058','398265938','vitoria@hotmail.com','81945263179'),(88,'Mina','Stella','72364953014','398265945','mina@gmail.com','81945623187'),(89,'Kaki','Laika','00868211052','134125691','kaki@gmail.com','81945863197');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL,
  `categoria` varchar(20) COLLATE utf8mb3_bin DEFAULT NULL,
  `descricao` varchar(200) COLLATE utf8mb3_bin DEFAULT NULL,
  `preco` double DEFAULT NULL,
  `fornecedor_id_produto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fornecedor_id_idx` (`fornecedor_id_produto`),
  CONSTRAINT `fornecedor_id_produto` FOREIGN KEY (`fornecedor_id_produto`) REFERENCES `fornecedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'brahma puro malte','Bebidas','350m',7,11),(2,'Coca-cola','bebidas','2l',10,13),(3,'Arroz','alimentos','1kl',5.9,14),(4,'Feijão','alimentos','1Kl',9,19),(5,'Macarrão','alimentos','500g',3,18),(6,'Biscoito','alimentos','300g',2.5,17),(7,'Salsicha','frios','1Kl',13.99,12),(8,'Mortadela','frios','1Kl',12.89,12),(9,'Danoninho','latcínios','90g',3.5,16);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `cliente_id_venda` int(11) DEFAULT NULL,
  `produto_id_venda` int(11) DEFAULT NULL,
  `funcionario_id_venda` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id_venda_idx` (`cliente_id_venda`),
  KEY `produto_id_venda_idx` (`produto_id_venda`),
  KEY `funcionario_id_venda_idx` (`funcionario_id_venda`),
  CONSTRAINT `cliente_id_venda` FOREIGN KEY (`cliente_id_venda`) REFERENCES `cliente` (`id`),
  CONSTRAINT `funcionario_id_venda` FOREIGN KEY (`funcionario_id_venda`) REFERENCES `funcionario` (`id`),
  CONSTRAINT `produto_id_venda` FOREIGN KEY (`produto_id_venda`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (11,'2022-06-23 12:40:10',50,3,1,1,87),(12,'2022-06-23 14:22:50',18.99,5,2,2,88),(13,'2022-06-23 15:30:45',80,5,5,3,89),(14,'2022-06-23 09:20:10',20.5,6,8,4,80),(15,'2022-06-24 10:59:00',90,8,9,5,81),(16,'2022-06-24 11:30:00',40,4,6,6,82),(17,'2022-06-24 17:35:00',96,9,7,7,83),(18,'2022-06-24 20:23:00',12,5,3,8,84),(19,'2022-06-25 14:58:00',45,12,4,9,85),(20,'2022-06-25 12:45:00',50,1,10,8,86);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-26 15:09:45
