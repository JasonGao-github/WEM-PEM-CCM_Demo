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

 Date: 18/08/2021 16:52:19
*/
----------------------------
----------------------------
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
----------------------------
----------------------------

-- ----------------------------
-- Records 
-- ----------------------------
SET NAMES utf8mb4;

-- ----------------------------
-- Table structure for customercontribution
-- ----------------------------
DROP TABLE IF EXISTS `customercontribution`;
DROP TABLE IF EXISTS `customercontributionauthoris`;
DROP TABLE IF EXISTS `customercontributionprice`;
DROP TABLE IF EXISTS `customercontributionpricetype`;
DROP TABLE IF EXISTS `project`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `projecttype`;
DROP TABLE IF EXISTS `usertype`;


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

CREATE TABLE `customercontributionpricetype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) 
) 

-- ----------------------------
-- Records of customercontributionpricetype
-- ----------------------------

-- ----------------------------
-- Table structure for project
-- ----------------------------

CREATE TABLE `project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(32)  NULL DEFAULT NULL,
  `statues` varchar(32)  NULL DEFAULT NULL,
  `createDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) 
) 

-- ----------------------------
-- Records of project
-- ----------------------------

-- ----------------------------
-- Table structure for projecttype
-- ----------------------------

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

CREATE TABLE `usertype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) 
) 

-- ----------------------------
-- Records of usertype
-- ----------------------------

