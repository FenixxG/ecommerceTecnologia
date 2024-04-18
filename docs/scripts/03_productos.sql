CREATE TABLE `productos` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(255) NOT NULL,
  `productDescription` text NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productImgUrl` varchar(255) NOT NULL,
  `productStatus` char(3) NOT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci


INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`) VALUES (1, 'Celular Galaxy 8', 'Celular de la marca Samsung Galaxy 8', 6500, 'https://i.ibb.co/kg7n2HN/C-GALAXY8.png');
INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`) VALUES (2, 'Celular Galaxy Note 8', 'Celular de la marca Samsung Galaxy Note 8', 8500, 'https://i.ibb.co/CWZZDQH/C-GALAXYNOTE8.png');
INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`) VALUES (3, 'Celular Galaxy S8', 'Celular de la marca Samsung Galaxy S8', 9800, 'https://i.ibb.co/xCH7YKV/C-GALAXYS8.png');
INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`) VALUES (4, 'Celular Iphone X', 'Celular de la marca Apple modelo Iphone X', 13000, 'https://i.ibb.co/5sJdKV1/C-IPHONEX.png');
INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`) VALUES (5, 'Camara DHUA', 'Camara de seguridad de la marca DHUA', 2200, 'https://i.ibb.co/km1qM77/CA-DAHUA.png');
INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`) VALUES (6, 'Camara GUARD', 'Camara de seguridad de la marca GUARD', 1800, 'https://i.ibb.co/yff0FrK/CA-GUARD.png');
INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`) VALUES (7, 'Camara HIKVISION', 'Camara de seguirdad de la marca HIKVISION', 2500, 'https://i.ibb.co/rxBH7Kp/CA-HIKVISION.png');
INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`) VALUES (8, 'Camara LOREX', 'Camara de seguidad de la marca LOREX', 1500, 'https://i.ibb.co/DD2CXMp/CA-LOREX.png');
INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`) VALUES (9, 'Computadora ASUS', 'Computadora de escritorio de la marca ASUS', 50000, 'https://i.ibb.co/xj9ppkr/E-ASUS.png');
INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`) VALUES (10, 'Computadora DELL', 'Computadora de escritorio de la marca DELL', 10000, 'https://i.ibb.co/j8ywnDZ/E-DELL.png');
INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`) VALUES (11, 'Computadora Lenovo', 'Computadora de escritorio de la marca Lenovo', 25000, 'https://i.ibb.co/cNsS0JY/E-LENOVO.png');
INSERT INTO `productos` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`) VALUES (12, 'Computadora TOSHIBA', 'Computadora de escritorio de la marca TOSHIBA', 35000, 'https://i.ibb.co/Hg6rpHf/E-TOSHIBA.png');
INSERT INTO `productos` (`productId`,`productName`,`productDescription`,`productPrice`,`productStatus`,`productImgUrl`) VALUES(13,'Laptop ACER','Computadora portatil de la marca ACER',14000,'ACT','https://i.ibb.co/Gcj8dch/L-ACER.png');
INSERT INTO `productos` (`productName`,`productDescription`,`productPrice`,`productStatus`,`productImgUrl`,`productId`) VALUES('Laptop ASUS','Computadora portatil de la marca ASUS',19000,'ACT','https://i.ibb.co/VDqtwtY/L-ASUS.png',14);
INSERT INTO `productos` (`productName`,`productDescription`,`productPrice`,`productStatus`,`productImgUrl`,`productId`) VALUES('Laptop HP','Computadora portatil de la marca HP',12000,'ACT','https://i.ibb.co/bbhLPx1/L-HP.png',15);
INSERT INTO `productos` (`productName`,`productDescription`,`productPrice`,`productStatus`,`productImgUrl`,`productId`) VALUES('Laptop Lenovo','Computadora portatil de la marca Lenovo',16500,'ACT','https://i.ibb.co/YyynWry/L-LENOVO.png',16);
INSERT INTO `productos` (`productName`,`productDescription`,`productPrice`,`productStatus`,`productImgUrl`,`productId`) VALUES('Router ASUS','Router de la marca ASUS',1800,'ACT','https://i.ibb.co/QPJ0pzL/RA-ASUS.png',17);
INSERT INTO `productos` (`productName`,`productDescription`,`productPrice`,`productStatus`,`productImgUrl`,`productId`) VALUES('Router D-Link','Router de la marca D-Link',800,'ACT','https://i.ibb.co/R6sB0M6/RA-DLINK.png',18);
INSERT INTO `productos` (`productName`,`productDescription`,`productPrice`,`productStatus`,`productImgUrl`,`productId`) VALUES('Router NETGEAR','Router de la marca NETGEAR',950,'ACT','https://i.ibb.co/CbpNrDR/RA-NETGEAR.png',19);
INSERT INTO `productos` (`productName`,`productDescription`,`productPrice`,`productStatus`,`productImgUrl`,`productId`) VALUES('Router TP-LINK','Router de la marca TP-LINK',2500,'ACT','https://i.ibb.co/F40nBvk/RA-TPLINK.png',20);
