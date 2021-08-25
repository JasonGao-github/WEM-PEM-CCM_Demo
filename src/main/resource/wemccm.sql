/*
 Navicat Premium Data Transfer

 Source Server         : SEF
 Source Server Type    : MySQL
 Source Server Version : 50515
 Source Host           : localhost:3306
 Source Schema         : wemccm

 Target Server Type    : MySQL
 Target Server Version : 50515
 File Encoding         : 65001

 Date: 25/08/2021 22:05:19
*/

/*
tips:
1.每个表的主键id都需要改成自动自增。
2.不需要类似于’latin1_swedish_ci‘的编码声明，删除。
3.’BTREE‘这种声明也不需要。
4.脚本里字段的排列顺序稍微讲究一下，至少把id写在第一个。
5.对于varchar类型的字段，除非是大段的描述性文字，其他字段的长度16或者32就够了，255太长以后查询会很慢。
6.同理，如果int类型的字段仅仅是个外键，那8就够了。如果要存数据，那就视情况而定。
7.drop语句，建表语句，添加数据的语句分开写。这样能缩短篇幅增加可读性。
8.直接用工具导出sql语句没问题，但是要自己优化了过后再贴到脚本里来。
*/
-- ----------------------------
-- Table structure for currentoccupy
-- ----------------------------
DROP TABLE IF EXISTS `currentoccupy`;
CREATE TABLE `currentoccupy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL,
  `projectId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) 
) 

-- ----------------------------
-- Records of currentoccupy
-- ----------------------------

-- ----------------------------
-- Table structure for customercontribution
-- ----------------------------
DROP TABLE IF EXISTS `customercontribution`;
CREATE TABLE `customercontribution`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NULL DEFAULT NULL,
  `jemenaWBS` varchar(32)  NULL DEFAULT NULL,
  `inquiryNumber` int(11) NULL DEFAULT NULL,
  `jemenaSapPmOrder` varchar(32)  NULL DEFAULT NULL,
  `zinfraWBS` varchar(32)  NULL DEFAULT NULL,
  `projectTitle` varchar(32)  NULL DEFAULT NULL,
  `projectTypeId` int(11) NULL DEFAULT NULL,
  `supplyAddress` varchar(32)  NULL DEFAULT NULL,
  `customerReasonForWorks` varchar(32)  NULL DEFAULT NULL,
  `customerScopeOfWork` varchar(32)  NULL DEFAULT NULL,
  `jemenaScopeOfWork` varchar(32)  NULL DEFAULT NULL,
  `jemenaScopeExclusions` varchar(32)  NULL DEFAULT NULL,
  `assumption` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) 
) 

-- ----------------------------
-- Records of customercontribution
-- ----------------------------

-- ----------------------------
-- Table structure for customercontributionauthoris
-- ----------------------------
DROP TABLE IF EXISTS `customercontributionauthoris`;
CREATE TABLE `customercontributionauthoris`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerContributionId` int(11) NULL DEFAULT NULL,
  `details` varchar(32)  NULL DEFAULT NULL,
  `dateOfRevision` datetime NULL DEFAULT NULL,
  `isAuthorised` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) 
) 

-- ----------------------------
-- Records of customercontributionauthoris
-- ----------------------------

-- ----------------------------
-- Table structure for customercontributionprice
-- ----------------------------
DROP TABLE IF EXISTS `customercontributionprice`;
CREATE TABLE `customercontributionprice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerContributionId` int(11) NULL DEFAULT NULL,
  `customerContributionPriceTypeId` int(11) NULL DEFAULT NULL,
  `originalPrice` double(10, 2) NULL DEFAULT NULL,
  `revisedPrice` double(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) 

-- ----------------------------
-- Records of customercontributionprice
-- ----------------------------

-- ----------------------------
-- Table structure for customercontributionpricetype
-- ----------------------------
DROP TABLE IF EXISTS `customercontributionpricetype`;
CREATE TABLE `customercontributionpricetype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) 
) 

-- ----------------------------
-- Records of customercontributionpricetype
-- ----------------------------

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `from` int(11) NULL DEFAULT NULL,
  `to` int(11) NULL DEFAULT NULL,
  `content` varchar(32)  NULL DEFAULT NULL,
  `type` varchar(32)  NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) 
) 

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(32)  NULL DEFAULT NULL,
  `statues` varchar(32)  NULL DEFAULT NULL,
  `createDate` datetime NULL DEFAULT NULL,
  `JemenaWBS` varchar(32)  NULL DEFAULT NULL,
  `ProjectTitle` varchar(32)  NULL DEFAULT NULL,
  `ProjectType` varchar(32)  NULL DEFAULT NULL,
  `JemenaSAPPMOrder` varchar(32)  NULL DEFAULT NULL,
  `ZimfraWBS` varchar(32)  NULL DEFAULT NULL,
  `InquiryNumber` int(32) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) 
) 

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (123, '123', '123', '2021-08-23 23:32:27', '123', '123', '123', '123', '123', 123);

-- ----------------------------
-- Table structure for projectattachment
-- ----------------------------
DROP TABLE IF EXISTS `projectattachment`;
CREATE TABLE `projectattachment`  (
  `url` varchar(32)  NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) 
) 

-- ----------------------------
-- Records of projectattachment
-- ----------------------------

-- ----------------------------
-- Table structure for projecttype
-- ----------------------------
DROP TABLE IF EXISTS `projecttype`;
CREATE TABLE `projecttype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32)  NULL DEFAULT NULL,
  `description` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) 
) 

-- ----------------------------
-- Records of projecttype
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32)  NULL DEFAULT NULL,
  `password` varchar(32)  NULL DEFAULT NULL,
  `email` varchar(32)  NULL DEFAULT NULL,
  `userTypeId` int(11) NULL DEFAULT NULL,
  `leaderId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) 
) 

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for usertype
-- ----------------------------
DROP TABLE IF EXISTS `usertype`;
CREATE TABLE `usertype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) 
) 

