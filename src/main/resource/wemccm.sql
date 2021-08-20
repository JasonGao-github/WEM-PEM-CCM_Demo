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
-- Table structures
-- ----------------------------
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `usertype`;

CREATE TABLE `user`  (
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `userTypeId` int(11) NULL DEFAULT NULL,
  `leaderId` int(11) NULL DEFAULT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

CREATE TABLE `usertype`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `user` VALUES ('123', '123', 'asd', 1, 2, 1);
