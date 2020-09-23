/*
Navicat MySQL Data Transfer

Source Server         : 123
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-09-23 13:10:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` varchar(32) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('15fed381dc9811eab8d8509a4cd26888', '小赵', '小三', '1333333333', '124759999@qq.com');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` varchar(32) NOT NULL,
  `orderNum` varchar(50) NOT NULL,
  `orderTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `peopleCount` int(11) DEFAULT NULL,
  `orderDesc` varchar(500) DEFAULT NULL,
  `payType` int(11) DEFAULT NULL,
  `orderStatus` int(11) DEFAULT NULL,
  `productId` varchar(32) DEFAULT NULL,
  `memberId` varchar(32) DEFAULT NULL,
  `travellerId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderNum` (`orderNum`),
  KEY `productId` (`productId`),
  KEY `memberId` (`memberId`),
  KEY `travellerId` (`travellerId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('012fdcd0dc6611eab8d8509a4cd26888', '555555', '2020-08-12 22:03:25', '5', '么什么', '0', '1', '3', '15fed381dc9811eab8d8509a4cd26888', 'dfcce134dc9711eab8d8509a4cd26888');
INSERT INTO `orders` VALUES ('0c59bd76dc6611eab8d8509a4cd26888', '666666', '2020-08-12 23:34:20', '1', '1', '1', '1', '4', null, 'dfcce134dc9711eab8d8509a4cd26888');
INSERT INTO `orders` VALUES ('1', '111111', '2020-08-12 14:34:23', '123', '123', '2', '1', 'c0b36ebedbe311eab8d8509a4cd26888', null, null);
INSERT INTO `orders` VALUES ('86625770dc6d11eab8d8509a4cd26888', '888888', '2020-08-12 15:29:20', null, null, null, null, null, null, null);
INSERT INTO `orders` VALUES ('880f1164dc6d11eab8d8509a4cd26888', '999999', '2020-08-12 15:29:22', null, null, null, null, null, null, null);
INSERT INTO `orders` VALUES ('8b300e20dc6d11eab8d8509a4cd26888', '121212', '2020-08-12 15:29:28', null, null, null, null, null, null, null);
INSERT INTO `orders` VALUES ('8e788db4dc6d11eab8d8509a4cd26888', '323232', '2020-08-12 15:29:33', null, null, null, null, null, null, null);
INSERT INTO `orders` VALUES ('a08ab1bbdc6411eab8d8509a4cd26888', '222222', '2020-08-12 14:34:31', '123', '1', '0', '0', 'c7b18ee9dc5911eab8d8509a4cd26888', null, null);
INSERT INTO `orders` VALUES ('d7da0211dc6511eab8d8509a4cd26888', '777777', '2020-08-12 15:30:04', null, null, null, null, '0355ff80dc6d11eab8d8509a4cd26888', null, null);
INSERT INTO `orders` VALUES ('f4a3fcdfdc6511eab8d8509a4cd26888', '444444', '2020-07-29 14:35:02', '1', '1', '1', '1', '2', null, null);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` varchar(255) NOT NULL,
  `permissionName` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('28dab348e22811ea8626509a4cd26888', 'aaaa', 'aaaa');
INSERT INTO `permission` VALUES ('661fc39de1fb11ea8626509a4cd26888', 'user findAll', '/user/findAll.do');
INSERT INTO `permission` VALUES ('7897128ae1fb11ea8626509a4cd26888', 'user findById', '/user/findById.do');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` varchar(32) NOT NULL,
  `productNum` varchar(50) NOT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `cityName` varchar(50) DEFAULT NULL,
  `DepartureTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `productPrice` double DEFAULT NULL,
  `productDesc` varchar(500) DEFAULT NULL,
  `productStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `productNum` (`productNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('0355ff80dc6d11eab8d8509a4cd26888', 'ncast-007', null, null, '2020-08-12 15:25:40', null, null, null);
INSERT INTO `product` VALUES ('0c770fdbdc6d11eab8d8509a4cd26888', 'itcast-008', null, null, '2020-08-12 15:25:55', null, null, null);
INSERT INTO `product` VALUES ('1', 'itcast-003', '北京三日游', '上海', '2020-08-12 15:26:34', '1800', '魔都我来了', '0');
INSERT INTO `product` VALUES ('2', 'itcast-002', '北京三日游', '北京', '2018-10-10 10:10:00', '1200', '不错的旅行', '1');
INSERT INTO `product` VALUES ('3', 'itcast-001', '湖南一日游', '北京', '2020-08-12 15:26:34', '1200', '不错的旅行', '1');
INSERT INTO `product` VALUES ('4', 'itcast-x001', '湖南一日游', '湖南', '2018-08-08 22:05:00', '1000', '不错的城市', '1');
INSERT INTO `product` VALUES ('c0b36ebedbe311eab8d8509a4cd26888', 'itcast-x002', '湖南一日游', '湖南', '2018-08-24 22:55:00', '1000', '湖南是一个不错的旅游城市', '0');
INSERT INTO `product` VALUES ('c7b18ee9dc5911eab8d8509a4cd26888', 'itcast-x003', '广州一日游', '湖南', '2020-08-12 15:26:34', '1000', '不错的旅行', '1');
INSERT INTO `product` VALUES ('ec6e65f6dc6c11eab8d8509a4cd26888', 'itcast-x004', '广州一日游', '广州', '2020-08-12 15:24:01', '1231', '广州一个不错的城市', '1');
INSERT INTO `product` VALUES ('f49a85b0dc6c11eab8d8509a4cd26888', 'tcast-005', null, null, '2020-08-12 15:25:15', null, null, null);
INSERT INTO `product` VALUES ('fc444d6ddc6c11eab8d8509a4cd26888', 'tcast-006', null, null, '2020-08-12 15:25:28', null, null, null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` varchar(32) NOT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  `roleDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('c8055fb7dd4711ea8125509a4cd26888', 'USER', 'vip');
INSERT INTO `role` VALUES ('e9348c7ddd4611ea8125509a4cd26888', 'ADMIN', 'vip');
INSERT INTO `role` VALUES ('ffd42484e20011ea8626509a4cd26888', 'guest', '测试用户');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `permissionId` varchar(50) NOT NULL,
  `roleId` varchar(50) NOT NULL,
  PRIMARY KEY (`permissionId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('661fc39de1fb11ea8626509a4cd26888', 'c8055fb7dd4711ea8125509a4cd26888');
INSERT INTO `role_permission` VALUES ('7897128ae1fb11ea8626509a4cd26888', 'c8055fb7dd4711ea8125509a4cd26888');
INSERT INTO `role_permission` VALUES ('28dab348e22811ea8626509a4cd26888', 'e9348c7ddd4611ea8125509a4cd26888');
INSERT INTO `role_permission` VALUES ('661fc39de1fb11ea8626509a4cd26888', 'e9348c7ddd4611ea8125509a4cd26888');
INSERT INTO `role_permission` VALUES ('7897128ae1fb11ea8626509a4cd26888', 'e9348c7ddd4611ea8125509a4cd26888');
INSERT INTO `role_permission` VALUES ('661fc39de1fb11ea8626509a4cd26888', 'ffd42484e20011ea8626509a4cd26888');
INSERT INTO `role_permission` VALUES ('7897128ae1fb11ea8626509a4cd26888', 'ffd42484e20011ea8626509a4cd26888');

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitTime` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `executionTime` int(8) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES ('1', '2020-09-03 20:44:41', 'tom', '0:0:0:0:0:0:0:1', '', '42', '[类名]：com.ssm.controller.ProductController[方法名];findALl');
INSERT INTO `syslog` VALUES ('2', '2020-09-03 20:47:26', 'tom', '0:0:0:0:0:0:0:1', '/userfindAll.do', '21', '[类名]：com.ssm.controller.UserController[方法名];findAll');
INSERT INTO `syslog` VALUES ('3', '2020-09-03 20:47:29', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', '15', '[类名]：com.ssm.controller.RoleController[方法名];findAll');
INSERT INTO `syslog` VALUES ('4', '2020-09-03 20:47:30', 'tom', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '15', '[类名]：com.ssm.controller.PermissionController[方法名];findAll');
INSERT INTO `syslog` VALUES ('5', '2020-09-03 20:47:34', 'tom', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '5', '[类名]：com.ssm.controller.PermissionController[方法名];findAll');
INSERT INTO `syslog` VALUES ('6', '2020-09-03 20:47:36', 'tom', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '0', '[类名]：com.ssm.controller.OrdersController[方法名];findAll');
INSERT INTO `syslog` VALUES ('7', '2020-09-03 20:47:59', 'tom', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '2', '[类名]：com.ssm.controller.PermissionController[方法名];findAll');
INSERT INTO `syslog` VALUES ('8', '2020-09-03 20:48:02', 'tom', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '1', '[类名]：com.ssm.controller.OrdersController[方法名];findAll');
INSERT INTO `syslog` VALUES ('9', '2020-09-03 20:48:47', 'tom', '0:0:0:0:0:0:0:1', '/userfindAll.do', '6', '[类名]：com.ssm.controller.UserController[方法名];findAll');
INSERT INTO `syslog` VALUES ('10', '2020-09-03 20:48:55', 'tom', '0:0:0:0:0:0:0:1', '/userfindAll.do', '3', '[类名]：com.ssm.controller.UserController[方法名];findAll');
INSERT INTO `syslog` VALUES ('11', '2020-09-03 20:48:59', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', '4', '[类名]：com.ssm.controller.RoleController[方法名];findAll');
INSERT INTO `syslog` VALUES ('12', '2020-09-03 20:49:04', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '12', '[类名]：com.ssm.controller.ProductController[方法名];findALl');
INSERT INTO `syslog` VALUES ('13', '2020-09-03 20:49:35', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '8', '[类名]：com.ssm.controller.ProductController[方法名];findALl');
INSERT INTO `syslog` VALUES ('14', '2020-09-03 20:49:37', 'tom', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '5', '[类名]：com.ssm.controller.PermissionController[方法名];findAll');
INSERT INTO `syslog` VALUES ('15', '2020-09-03 20:49:42', 'tom', '0:0:0:0:0:0:0:1', '/userfindAll.do', '3', '[类名]：com.ssm.controller.UserController[方法名];findAll');
INSERT INTO `syslog` VALUES ('16', '2020-09-03 20:49:47', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', '2', '[类名]：com.ssm.controller.RoleController[方法名];findAll');
INSERT INTO `syslog` VALUES ('17', '2020-09-03 20:49:49', 'tom', '0:0:0:0:0:0:0:1', '/userfindAll.do', '7', '[类名]：com.ssm.controller.UserController[方法名];findAll');
INSERT INTO `syslog` VALUES ('18', '2020-09-03 20:49:51', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '6', '[类名]：com.ssm.controller.ProductController[方法名];findALl');
INSERT INTO `syslog` VALUES ('19', '2020-09-03 20:50:34', 'tom', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '0', '[类名]：com.ssm.controller.OrdersController[方法名];findALl');
INSERT INTO `syslog` VALUES ('20', '2020-09-03 21:25:51', 'tom', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '24', '[类名]：com.ssm.controller.SysLogConntroller[方法名];findAll');

-- ----------------------------
-- Table structure for traveller
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller` (
  `id` varchar(32) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `credentialsType` int(11) DEFAULT NULL,
  `credentialsNum` varchar(50) DEFAULT NULL,
  `travellerType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of traveller
-- ----------------------------
INSERT INTO `traveller` VALUES ('37cf7d7ddcb111eab8d8509a4cd26888', '张龙', '男', '13333333333', '1', '987654321123456789', '1');
INSERT INTO `traveller` VALUES ('dfcce134dc9711eab8d8509a4cd26888', '张龙', '男', '13333333333', '1', '987654321123456789', '1');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phoneNum` varchar(255) DEFAULT NULL,
  `status` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('23a0b60bdd1811ea8125509a4cd26888', '123456789@qq.com', '1', '1', '13333333333', '1');
INSERT INTO `users` VALUES ('d52389b5dd3a11ea8125509a4cd26888', '123123123', 'tom', '$2a$10$NjwGsVn.BLxayo1sxR3kO.uIUnRMf4s8eGLUhKWFk9B4T044y9hN6', '13333333333', '1');
INSERT INTO `users` VALUES ('fbbed108e1f111ea8626509a4cd26888', '1247592397@qq.com', 'fox', '$2a$10$yBdWSSiWdBgeRWd5LIGqoesLmu4D6Wav0x6DTLCFcJMMbfGsB2a4G', '13333333333', '1');

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role` (
  `userId` varchar(32) NOT NULL,
  `roleId` varchar(32) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES ('23a0b60bdd1811ea8125509a4cd26888', 'c8055fb7dd4711ea8125509a4cd26888');
INSERT INTO `users_role` VALUES ('d52389b5dd3a11ea8125509a4cd26888', 'c8055fb7dd4711ea8125509a4cd26888');
INSERT INTO `users_role` VALUES ('fbbed108e1f111ea8626509a4cd26888', 'c8055fb7dd4711ea8125509a4cd26888');
INSERT INTO `users_role` VALUES ('23a0b60bdd1811ea8125509a4cd26888', 'e9348c7ddd4611ea8125509a4cd26888');
INSERT INTO `users_role` VALUES ('d52389b5dd3a11ea8125509a4cd26888', 'e9348c7ddd4611ea8125509a4cd26888');
INSERT INTO `users_role` VALUES ('23a0b60bdd1811ea8125509a4cd26888', 'ffd42484e20011ea8626509a4cd26888');
INSERT INTO `users_role` VALUES ('d52389b5dd3a11ea8125509a4cd26888', 'ffd42484e20011ea8626509a4cd26888');
DROP TRIGGER IF EXISTS `member_id_trigger`;
DELIMITER ;;
CREATE TRIGGER `member_id_trigger` BEFORE INSERT ON `member` FOR EACH ROW BEGIN
    SET new.id=REPLACE(UUID(),'-','');
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `orders_id_trigger`;
DELIMITER ;;
CREATE TRIGGER `orders_id_trigger` BEFORE INSERT ON `orders` FOR EACH ROW begin
   set new.id=replace(uuid(),'-','');
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `permission_id_trigger`;
DELIMITER ;;
CREATE TRIGGER `permission_id_trigger` BEFORE INSERT ON `permission` FOR EACH ROW begin
set new.id=replace(uuid(),'-','');
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `product_id_trigger`;
DELIMITER ;;
CREATE TRIGGER `product_id_trigger` BEFORE INSERT ON `product` FOR EACH ROW BEGIN
    SET new.id=REPLACE(UUID(),'-','');
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `role_id_trigger`;
DELIMITER ;;
CREATE TRIGGER `role_id_trigger` BEFORE INSERT ON `role` FOR EACH ROW begin
set new.id=replace(uuid(),'-','');
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `traveller_id_trigger`;
DELIMITER ;;
CREATE TRIGGER `traveller_id_trigger` BEFORE INSERT ON `traveller` FOR EACH ROW BEGIN
    SET new.id=REPLACE(UUID(),'-','');
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `users_id-trigger`;
DELIMITER ;;
CREATE TRIGGER `users_id-trigger` BEFORE INSERT ON `users` FOR EACH ROW begin
set new.id=replace(uuid(),'-','');
end
;;
DELIMITER ;
