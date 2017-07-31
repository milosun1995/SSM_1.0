/*
Navicat MySQL Data Transfer

Source Server         : test-dev
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : db_dao_factory

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-07-30 23:48:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_member
-- ----------------------------
DROP TABLE IF EXISTS `t_member`;
CREATE TABLE `t_member` (
  `mid` varchar(10) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_member
-- ----------------------------
INSERT INTO `t_member` VALUES ('测试ID-172', 'Milo测试ID-172', '10', '测试PHONE-172', '2017-07-30', 'Hello.I\'m Milo!');
INSERT INTO `t_member` VALUES ('测试ID-24', 'Milo', '20', '测试PHONE-24', '2017-07-30', 'Hello.I\'m Milo!');
INSERT INTO `t_member` VALUES ('测试ID-307', 'Milo', '20', '测试PHONE-307', '2017-07-30', 'Hello.I\'m Milo!');
INSERT INTO `t_member` VALUES ('测试ID-771', 'Milo', '10', '测试PHONE-771', '2017-07-30', 'Hello.I\'m Milo!');
INSERT INTO `t_member` VALUES ('测试ID-802', 'Milo', '10', '测试PHONE-802', '2017-07-30', 'Hello.I\'m Milo!');
