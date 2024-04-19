CREATE TABLE
    `products` (
        `productId` int(11) NOT NULL AUTO_INCREMENT,
        `productName` varchar(255) NOT NULL,
        `productDescription` text NOT NULL,
        `productPrice` decimal(10, 2) NOT NULL,
        `productImgUrl` varchar(255) NOT NULL,
        `productStock` int(11) NOT NULL DEFAULT 0,
        `productStatus` char(3) NOT NULL,
        PRIMARY KEY (`productId`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4;

CREATE TABLE
    `carretilla` (
        `usercod` BIGINT(10) NOT NULL,
        `productId` int(11) NOT NULL,
        `crrctd` INT(5) NOT NULL,
        `crrprc` DECIMAL(12, 2) NOT NULL,
        `crrfching` DATETIME NOT NULL,
        PRIMARY KEY (`usercod`, `productId`),
        INDEX `productId_idx` (`productId` ASC),
        CONSTRAINT `carretilla_user_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `carretilla_prd_key` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE NO ACTION ON UPDATE NO ACTION
    );

CREATE TABLE
    `carretillaanon` (
        `anoncod` varchar(128) NOT NULL,
        `productId` int(11) NOT NULL,
        `crrctd` int(5) NOT NULL,
        `crrprc` decimal(12, 2) NOT NULL,
        `crrfching` datetime NOT NULL,
        PRIMARY KEY (`anoncod`, `productId`),
        KEY `productId_idx` (`productId`),
        CONSTRAINT `carretillaanon_prd_key` FOREIGN KEY (`productId`) REFERENCES `productos` (`productId`) ON DELETE NO ACTION ON UPDATE NO ACTION
    );

CREATE TABLE `productos` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(255) NOT NULL,
  `productDescription` text NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productImgUrl` varchar(255) NOT NULL,
  `productStatus` char(3) NOT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci


INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`,`productStatus`) VALUES (1, 'Celular Galaxy 8', 'Celular de la marca Samsung Galaxy 8', 6500, 'https://i.ibb.co/kg7n2HN/C-GALAXY8.png',0);
INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`,`productStatus`) VALUES (2, 'Celular Galaxy Note 8', 'Celular de la marca Samsung Galaxy Note 8', 8500, 'https://i.ibb.co/CWZZDQH/C-GALAXYNOTE8.png',0);
INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`,`productStatus`) VALUES (3, 'Celular Galaxy S8', 'Celular de la marca Samsung Galaxy S8', 9800, 'https://i.ibb.co/xCH7YKV/C-GALAXYS8.png',0);
INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`,`productStatus`) VALUES (4, 'Celular Iphone X', 'Celular de la marca Apple modelo Iphone X', 13000, 'https://i.ibb.co/5sJdKV1/C-IPHONEX.png',0);
INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`,`productStatus`) VALUES (5, 'Camara DHUA', 'Camara de seguridad de la marca DHUA', 2200, 'https://i.ibb.co/km1qM77/CA-DAHUA.png',0);
INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`,`productStatus`) VALUES (6, 'Camara GUARD', 'Camara de seguridad de la marca GUARD', 1800, 'https://i.ibb.co/yff0FrK/CA-GUARD.png',0);
INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`,`productStatus`) VALUES (7, 'Camara HIKVISION', 'Camara de seguirdad de la marca HIKVISION', 2500, 'https://i.ibb.co/rxBH7Kp/CA-HIKVISION.png',0);
INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`,`productStatus`) VALUES (8, 'Camara LOREX', 'Camara de seguidad de la marca LOREX', 1500, 'https://i.ibb.co/DD2CXMp/CA-LOREX.png',0);
INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`,`productStatus`) VALUES (9, 'Computadora ASUS', 'Computadora de escritorio de la marca ASUS', 50000, 'https://i.ibb.co/xj9ppkr/E-ASUS.png',0);
INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`,`productStatus`) VALUES (10, 'Computadora DELL', 'Computadora de escritorio de la marca DELL', 10000, 'https://i.ibb.co/j8ywnDZ/E-DELL.png',0);
INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`,`productStatus`) VALUES (11, 'Computadora Lenovo', 'Computadora de escritorio de la marca Lenovo', 25000, 'https://i.ibb.co/cNsS0JY/E-LENOVO.png',0);
INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`,`productStatus`) VALUES (12, 'Computadora TOSHIBA', 'Computadora de escritorio de la marca TOSHIBA', 35000, 'https://i.ibb.co/Hg6rpHf/E-TOSHIBA.png',0);
INSERT INTO `productos` (`productId`,`productName`,`productDescription`,`productPrice`,`productImgUrl`,`productStatus`) VALUES(13,'Laptop ACER','Computadora portatil de la marca ACER',14000,'https://i.ibb.co/Gcj8dch/L-ACER.png',0);
INSERT INTO `productos` (`productName`,`productDescription`,`productPrice`,`productImgUrl`,`productId`,`productStatus`) VALUES('Laptop ASUS','Computadora portatil de la marca ASUS',19000,'https://i.ibb.co/VDqtwtY/L-ASUS.png',14,0);
INSERT INTO `productos` (`productName`,`productDescription`,`productPrice`,`productImgUrl`,`productId`,`productStatus`) VALUES('Laptop HP','Computadora portatil de la marca HP',12000,'https://i.ibb.co/bbhLPx1/L-HP.png',15,0);
INSERT INTO `productos` (`productName`,`productDescription`,`productPrice`,`productImgUrl`,`productId`,`productStatus`) VALUES('Laptop Lenovo','Computadora portatil de la marca Lenovo',16500,'https://i.ibb.co/YyynWry/L-LENOVO.png',16,0);
INSERT INTO `productos` (`productName`,`productDescription`,`productPrice`,`productImgUrl`,`productId`,`productStatus`) VALUES('Router ASUS','Router de la marca ASUS',1800,'https://i.ibb.co/QPJ0pzL/RA-ASUS.png',17,0);
INSERT INTO `productos` (`productName`,`productDescription`,`productPrice`,`productImgUrl`,`productId`,`productStatus`) VALUES('Router D-Link','Router de la marca D-Link',800,'https://i.ibb.co/R6sB0M6/RA-DLINK.png',18,0);
INSERT INTO `productos` (`productName`,`productDescription`,`productPrice`,`productImgUrl`,`productId`,`productStatus`) VALUES('Router NETGEAR','Router de la marca NETGEAR',950,'https://i.ibb.co/CbpNrDR/RA-NETGEAR.png',19,0);
INSERT INTO `productos` (`productName`,`productDescription`,`productPrice`,`productImgUrl`,`productId`,`productStatus`) VALUES('Router TP-LINK','Router de la marca TP-LINK',2500,'https://i.ibb.co/F40nBvk/RA-TPLINK.png',20,0);

CREATE TABLE `funciones` (
  `fncod` varchar(255) NOT NULL,
  `fndsc` varchar(255) DEFAULT NULL,
  `fnest` char(3) DEFAULT NULL,
  `fntyp` char(3) DEFAULT NULL,
  PRIMARY KEY (`fncod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci

CREATE TABLE `funciones_roles` (
  `rolescod` varchar(128) NOT NULL,
  `fncod` varchar(255) NOT NULL,
  `fnrolest` char(3) DEFAULT NULL,
  `fnexp` datetime DEFAULT NULL,
  PRIMARY KEY (`rolescod`,`fncod`),
  KEY `rol_funcion_key_idx` (`fncod`),
  CONSTRAINT `funcion_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rol_funcion_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci

CREATE TABLE `roles` (
  `rolescod` varchar(128) NOT NULL,
  `rolesdsc` varchar(45) DEFAULT NULL,
  `rolesest` char(3) DEFAULT NULL,
  PRIMARY KEY (`rolescod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci


CREATE TABLE `roles_usuarios` (
  `usercod` bigint(10) NOT NULL,
  `rolescod` varchar(128) NOT NULL,
  `roleuserest` char(3) DEFAULT NULL,
  `roleuserfch` datetime DEFAULT NULL,
  `roleuserexp` datetime DEFAULT NULL,
  PRIMARY KEY (`usercod`,`rolescod`),
  KEY `rol_usuario_key_idx` (`rolescod`),
  CONSTRAINT `rol_usuario_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuario_rol_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci

INSERT INTO `funciones` VALUES ('Controllers\\Productos\\Producto','Controllers\\Productos\\Producto','ACT','CTR'),('Controllers\\Productos\\Productos','Controllers\\Productos\\Productos','ACT','CTR'),('Menu_PaymentCheckout','Menu_PaymentCheckout','ACT','MNU'),('product_DEL','Eliminar Productos','ACT','FNC'),('product_DSP','Detalle de Productos','ACT','FNC'),('product_INS','Agregar Productos','ACT','FNC'),('product_UPD','Editar Productos','ACT','FNC'),('Tabla_Productos','Tabla_Productos','ACT','MNU');

INSERT INTO `funciones_roles` VALUES ('Admin','Controllers\\Productos\\Producto','ACT','2024-12-31 00:00:00'),('Admin','Controllers\\Productos\\Productos','ACT','2024-12-31 00:00:00'),('Admin','product_DEL','ACT','2024-12-31 00:00:00'),('Admin','product_DSP','ACT','2024-12-31 00:00:00'),('Admin','product_INS','ACT','2024-12-31 00:00:00'),('Admin','product_UPD','ACT','2024-12-31 00:00:00'),('Admin','Tabla_Productos','ACT','2024-12-31 00:00:00'),('Auditor','product_DSP','ACT','2024-12-31 00:00:00');

INSERT INTO `roles` VALUES ('Admin','Administrador de tablas generales','ACT'),('Auditor','Auditor de Sistema','ACT');

INSERT INTO `roles_usuarios` VALUES (1,'Admin','ACT','2024-03-19 00:00:00','2024-12-31 00:00:00'),(3,'Auditor','ACT','2024-03-20 00:00:00','2024-04-19 00:00:00'),(5,'Admin','ACT','2024-04-16 00:00:00','2024-12-31 00:00:00');

INSERT INTO `usuario` VALUES (1,'fenixg233@gmail.com','Cristian Miranda','$2y$10$q2/oGBLYWRb8NQ3dzaXCPOVoNjpZ6KZke7qFnWHl3xmwWvMzsh3ce','2024-03-19 02:48:15','ACT','2024-06-16 00:00:00','ACT','a9b42d7ce0b850a72904cec95b856d4a3e15d9f6578681030a4444f58961c771','2024-03-19 02:48:15','PBL'),(3,'cramirandav@unicah.edu','Auditor','$2y$10$X1/GYF0kQnLlTp.pSXqQ5O4ICmCvOZ1tNf2fowNQZF3a2/zTNOZEK','2024-03-21 01:23:58','ACT','2024-06-18 00:00:00','ACT','f1186449771e7f8ce69cea20b391e7bfd20fac5088e8cdbb3357b554e1c72294','2024-03-21 01:23:58','PBL'),(4,'cramirandav@gmail.com','Operador','$2y$10$XhOTgBr1YU2pQ.e/UWamqe0O3qwgn63R0.EcAc3uKj9wSPIfMocUe','2024-03-26 20:48:00','ACT','2024-06-24 00:00:00','ACT','9a340f6d37b2f81cf9db19385a76a7ecac01ae957f5ba3fe851ac61434f80e72','2024-03-26 20:48:00','PBL'),(5,'cra_mirandav@gmail.com','Cristian','$2y$10$IGdRu8SUa4fMxxMiyK/mp.059q63SWBI0JG5A4Wf9MrymlewjTEZq','2024-04-18 03:55:52','ACT','2024-07-16 00:00:00','ACT','8cae2ddb3b404542f3c4b90d73ab2e02db37f8e2401c8903164616fb933089b8','2024-04-18 03:55:52','PBL');

CREATE TABLE `highlights` (
  `highlightId` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `highlightStart` datetime NOT NULL,
  `highlightEnd` datetime NOT NULL,
  PRIMARY KEY (`highlightId`),
  KEY `fk_highlights_products_idx` (`productId`),
  CONSTRAINT `fk_highlights_products` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci


CREATE TABLE `sales` (
  `saleId` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `salePrice` decimal(10,2) NOT NULL,
  `saleStart` datetime NOT NULL,
  `saleEnd` datetime NOT NULL,
  PRIMARY KEY (`saleId`),
  KEY `fk_sales_products_idx` (`productId`),
  CONSTRAINT `fk_sales_products` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci