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
