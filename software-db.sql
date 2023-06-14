/*
 Navicat Premium Data Transfer

 Source Server         : MySQL8.0
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : software-db

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 14/06/2023 17:58:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `pId` int(0) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `pContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `pDate` datetime(0) NOT NULL COMMENT '评论日期',
  `pSellerOfLevel` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户评价等级',
  `pGoodsOfLevel` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品评价等级',
  `bId` int(0) NOT NULL COMMENT '买家ID',
  `gId` int(0) NOT NULL COMMENT '商品ID',
  PRIMARY KEY (`pId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, '好评，商品很棒！', '2022-12-26 10:10:10', 3, 4, 46, 46);
INSERT INTO `comment` VALUES (2, '差评，不够大', '2022-12-26 10:10:10', 4, 2, 47, 47);
INSERT INTO `comment` VALUES (3, '好评，颜值爆表', '2022-12-26 10:10:10', 2, 5, 48, 48);
INSERT INTO `comment` VALUES (4, '中评，还行', '2022-12-26 10:10:10', 3, 3, 49, 49);
INSERT INTO `comment` VALUES (5, '好评，服务不错', '2022-12-26 10:10:10', 4, 4, 50, 50);
INSERT INTO `comment` VALUES (6, '差评，卖家太差', '2022-12-26 10:10:10', 1, 2, 22, 1);
INSERT INTO `comment` VALUES (7, '好评，物流很快', '2022-12-26 10:10:10', 3, 5, 22, 2);
INSERT INTO `comment` VALUES (8, '中评，还可以', '2022-12-26 10:10:10', 2, 3, 22, 3);
INSERT INTO `comment` VALUES (9, '好评，买的很值', '2022-12-26 10:10:10', 4, 4, 8, 4);
INSERT INTO `comment` VALUES (10, '差评，品质不符', '2022-12-26 10:10:10', 1, 2, 8, 5);
INSERT INTO `comment` VALUES (11, '好评，感觉还不错', '2022-12-26 10:10:10', 3, 4, 16, 6);
INSERT INTO `comment` VALUES (12, '中评，合适', '2022-12-26 10:10:10', 2, 3, 32, 7);
INSERT INTO `comment` VALUES (13, '好评，很划算', '2022-12-26 10:10:10', 4, 4, 32, 8);
INSERT INTO `comment` VALUES (14, '差评，差评', '2022-12-26 10:10:10', 1, 2, 34, 9);
INSERT INTO `comment` VALUES (15, '好评，不错，很喜欢', '2022-12-26 10:10:10', 3, 5, 15, 10);
INSERT INTO `comment` VALUES (16, '中评，可以接受', '2022-12-26 10:10:10', 2, 3, 23, 11);
INSERT INTO `comment` VALUES (17, '好评，质量可靠', '2022-12-26 10:10:10', 4, 4, 12, 12);
INSERT INTO `comment` VALUES (18, '差评，太贵了', '2022-12-26 10:10:10', 1, 2, 16, 13);
INSERT INTO `comment` VALUES (19, '好评，值得购买', '2022-12-26 10:10:10', 3, 5, 8, 14);
INSERT INTO `comment` VALUES (20, '中评，不太合适', '2022-12-26 10:10:10', 2, 3, 41, 15);
INSERT INTO `comment` VALUES (21, '好评，服务态度好', '2022-12-26 10:10:10', 4, 4, 24, 16);
INSERT INTO `comment` VALUES (22, '差评，不好', '2022-12-26 10:10:10', 1, 2, 13, 17);
INSERT INTO `comment` VALUES (23, '好评，很好很满意', '2022-12-26 10:10:10', 3, 5, 32, 18);
INSERT INTO `comment` VALUES (24, '中评，一般般', '2022-12-26 10:10:10', 2, 3, 33, 19);
INSERT INTO `comment` VALUES (25, '好评，一如既往的好', '2022-12-26 10:10:10', 4, 4, 24, 20);
INSERT INTO `comment` VALUES (26, '差评，太差了', '2022-12-26 10:10:10', 1, 2, 10, 21);
INSERT INTO `comment` VALUES (27, '好评，服务很好', '2022-12-26 10:10:10', 3, 5, 6, 22);
INSERT INTO `comment` VALUES (28, '中评，中规中矩', '2022-12-26 10:10:10', 2, 3, 6, 23);
INSERT INTO `comment` VALUES (29, '好评，很满意', '2022-12-26 10:10:10', 4, 4, 36, 24);
INSERT INTO `comment` VALUES (30, '差评，不行', '2022-12-26 10:10:10', 1, 2, 25, 25);
INSERT INTO `comment` VALUES (31, '好评，评价好', '2022-12-26 10:10:10', 3, 5, 26, 26);
INSERT INTO `comment` VALUES (32, '中评，一般', '2022-12-26 10:10:10', 2, 3, 28, 27);
INSERT INTO `comment` VALUES (33, '好评，不错', '2022-12-26 10:10:10', 4, 4, 28, 28);
INSERT INTO `comment` VALUES (34, '差评，不好', '2022-12-26 10:10:10', 1, 2, 39, 29);
INSERT INTO `comment` VALUES (35, '好评，棒棒哒', '2022-12-26 10:10:10', 3, 5, 21, 30);
INSERT INTO `comment` VALUES (36, '中评，一般', '2022-12-26 10:10:10', 2, 3, 12, 31);
INSERT INTO `comment` VALUES (37, '好评，满意', '2022-12-26 10:10:10', 4, 4, 30, 32);
INSERT INTO `comment` VALUES (38, '差评，不喜欢', '2022-12-26 10:10:10', 1, 2, 30, 33);
INSERT INTO `comment` VALUES (39, '好评，很满意', '2022-12-26 10:10:10', 3, 5, 22, 34);
INSERT INTO `comment` VALUES (40, '中评，还可以', '2022-12-26 10:10:10', 2, 3, 23, 35);
INSERT INTO `comment` VALUES (41, '好评，物美价廉', '2022-12-26 10:10:10', 4, 4, 42, 36);
INSERT INTO `comment` VALUES (42, '差评，不好', '2022-12-26 10:10:10', 1, 2, 15, 37);
INSERT INTO `comment` VALUES (43, '好评，很好看', '2022-12-26 10:10:10', 3, 5, 15, 38);
INSERT INTO `comment` VALUES (44, '中评，一般般', '2022-12-26 10:10:10', 2, 3, 39, 39);
INSERT INTO `comment` VALUES (45, '好评，好评', '2022-12-26 10:10:10', 4, 4, 2, 40);
INSERT INTO `comment` VALUES (46, '差评，太贵了', '2022-12-26 10:10:10', 1, 2, 41, 41);
INSERT INTO `comment` VALUES (47, '好评，优秀', '2022-12-26 10:10:10', 3, 5, 42, 42);
INSERT INTO `comment` VALUES (48, '中评，不太好', '2022-12-26 10:10:10', 2, 3, 43, 43);
INSERT INTO `comment` VALUES (49, '好评，买的很值', '2022-12-26 10:10:10', 4, 4, 44, 44);
INSERT INTO `comment` VALUES (50, '差评，不好', '2022-12-26 10:10:10', 1, 2, 45, 45);

-- ----------------------------
-- Table structure for currentuser
-- ----------------------------
DROP TABLE IF EXISTS `currentuser`;
CREATE TABLE `currentuser`  (
  `uId` int(0) NOT NULL COMMENT '已登录的用户ID',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '唯一的身份标识'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of currentuser
-- ----------------------------
INSERT INTO `currentuser` VALUES (45, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMDQzMzkzMzY0QHFxLmNvbSIsImV4cCI6MTY4Njk3MTkwNTcwMSwiaWF0IjoxNjg2MTA3OTA1NzAxfQ.z13B4ZY5ulV-gAyI_SxJFtp8ppDvyqeITMe2w-PMOFc');
INSERT INTO `currentuser` VALUES (45, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMDQzMzkzMzY0QHFxLmNvbSIsImV4cCI6MTY4Njk3MTk0MjUzMSwiaWF0IjoxNjg2MTA3OTQyNTMxfQ.ke2BXhnY5TEbTGpzK6_eiFRM2rnd8_Abz6x0op7nTEk');
INSERT INTO `currentuser` VALUES (45, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMDQzMzkzMzY0QHFxLmNvbSIsImV4cCI6MTY4NzE0MDk0Mjk5NywiaWF0IjoxNjg2Mjc2OTQyOTk3fQ.PMn5wc93Ej5P8HpRt2tDZW34jZHR-RMNkbzsll3Xvlw');
INSERT INTO `currentuser` VALUES (45, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMDQzMzkzMzY0QHFxLmNvbSIsImV4cCI6MTY4NzE0MDk5NDM3OSwiaWF0IjoxNjg2Mjc2OTk0Mzc5fQ.xKpq8ztscaLtdMELP40gVmm7wIi8CGvFzq4Dd623nPw');
INSERT INTO `currentuser` VALUES (45, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMDQzMzkzMzY0QHFxLmNvbSIsImV4cCI6MTY4NzE0MTA3MjAxMCwiaWF0IjoxNjg2Mjc3MDcyMDEwfQ.z6P3O3MoxMNlSpkXIDFHczT6R4bdvC_l5T4yq8Mg5b0');
INSERT INTO `currentuser` VALUES (45, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMDQzMzkzMzY0QHFxLmNvbSIsImV4cCI6MTY4NzE0MTExNjk0NSwiaWF0IjoxNjg2Mjc3MTE2OTQ1fQ.KHpgvIzhT9uzviXNlcDw1rmUGZzOSWY09vihGRTKqAk');
INSERT INTO `currentuser` VALUES (45, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMDQzMzkzMzY0QHFxLmNvbSIsImV4cCI6MTY4NzE0MTI0OTc0NiwiaWF0IjoxNjg2Mjc3MjQ5NzQ2fQ.1GqZXGqTZ66huAr43PLRt9qb3T16cmEWrzm7Nt75hvU');
INSERT INTO `currentuser` VALUES (51, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjM0IiwiZXhwIjoxNjg3MTQ2MzI2ODk3LCJpYXQiOjE2ODYyODIzMjY4OTd9.auNM6bA8vsddN4gGQhpHK6l8cXAOoBXuzZRE2Alpu-I');
INSERT INTO `currentuser` VALUES (45, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMDQzMzkzMzY0QHFxLmNvbSIsImV4cCI6MTY4NzE2NjU0OTg0MSwiaWF0IjoxNjg2MzAyNTQ5ODQxfQ.IAQbH8cWicncHS-01B0WAoy8h4Qd331gyfOmyUbIsro');
INSERT INTO `currentuser` VALUES (54, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtbnpkbmFAMTYzLmNvbSIsImV4cCI6MTY4NzQyMTU0NjUwOSwiaWF0IjoxNjg2NTU3NTQ2NTA5fQ.cJe3IDWafuMXkxcmusZSwyPBhVUo-tH9OyVn1xVLna4');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `gId` int(0) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `gName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名称',
  `gCount` int(0) NOT NULL COMMENT '商品库存数量',
  `gContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品描述',
  `gPrice` double(10, 2) NOT NULL COMMENT '商品价格',
  `uId` int(0) NOT NULL COMMENT '售卖商品的用户ID',
  `gImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品图片URL地址',
  `gLevel` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品评价等级',
  PRIMARY KEY (`gId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (2, '商品2', 192, '这是商品2的描述', 199.99, 2, 'https://img.alicdn.com/bao/uploaded/i4/2064892827/O1CN01CI3KNJ1WkoWcUFeBH_!!0-item_pic.jpg', 8);
INSERT INTO `goods` VALUES (3, '商品3', 293, '这是商品3的描述', 299.99, 3, 'https://img.alicdn.com/bao/uploaded/O1CN01ls8mD21ZVeFYGT1K9_!!6000000003200-0-yinhe.jpg', 9);
INSERT INTO `goods` VALUES (4, '商品4', 397, '这是商品4的描述', 399.99, 4, 'https://img.alicdn.com/bao/uploaded/i4/2211448736265/O1CN01yTjnmw1w9QCAmxfpS_!!0-item_pic.jpg', 10);
INSERT INTO `goods` VALUES (5, '商品5', 100, '这是商品1的描述', 99.99, 1, 'https://img.alicdn.com/bao/uploaded/i1/692011888/O1CN01GNCKM01PokcQ7gXqx_!!692011888-0-picasso.jpg', 6);
INSERT INTO `goods` VALUES (6, '商品6', 199, '这是商品2的描述', 199.99, 2, 'https://img.alicdn.com/bao/uploaded/i4/75566954/O1CN01vZ7FYi21Ez3vVf2p5_!!75566954.jpg', 8);
INSERT INTO `goods` VALUES (7, '商品7', 298, '这是商品3的描述', 299.99, 3, 'https://img.alicdn.com/bao/uploaded/i1/2209336523765/O1CN01FHfPrN1dgQ1zXwZbU_!!2209336523765-0-picasso.jpg', 9);
INSERT INTO `goods` VALUES (8, '商品8', 400, '这是商品4的描述', 399.99, 4, 'https://img.alicdn.com/bao/uploaded/i3/2064892827/O1CN016rGMI21WkoWdYPUfM_!!0-item_pic.jpg', 10);
INSERT INTO `goods` VALUES (9, '商品9', 100, '这是商品1的描述', 99.99, 1, 'https://img.alicdn.com/bao/uploaded/i1/2209336523765/O1CN01FHfPrN1dgQ1zXwZbU_!!2209336523765-0-picasso.jpg', 6);
INSERT INTO `goods` VALUES (10, '商品2', 200, '这是商品2的描述', 199.99, 2, 'https://img.alicdn.com/bao/uploaded/i1/2211208943255/O1CN01ydx9fy1Zuq1zc0ZpO_!!2211208943255.jpg', 8);
INSERT INTO `goods` VALUES (11, '商品3', 300, '这是商品3的描述', 299.99, 3, 'https://img.alicdn.com/bao/uploaded/i3/2262039169/O1CN012NGMpq2HbSMdWS6yd_!!2262039169.jpg', 9);
INSERT INTO `goods` VALUES (12, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods` VALUES (13, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods` VALUES (14, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods` VALUES (15, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods` VALUES (16, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods` VALUES (17, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods` VALUES (18, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods` VALUES (19, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods` VALUES (20, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods` VALUES (21, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods` VALUES (22, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods` VALUES (23, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods` VALUES (24, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods` VALUES (25, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods` VALUES (26, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods` VALUES (27, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods` VALUES (28, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods` VALUES (29, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods` VALUES (30, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods` VALUES (31, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods` VALUES (32, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods` VALUES (33, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods` VALUES (34, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods` VALUES (35, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods` VALUES (36, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods` VALUES (37, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods` VALUES (38, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods` VALUES (39, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods` VALUES (40, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods` VALUES (41, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods` VALUES (42, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods` VALUES (43, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods` VALUES (44, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods` VALUES (45, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods` VALUES (46, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods` VALUES (47, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods` VALUES (48, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods` VALUES (49, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods` VALUES (50, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods` VALUES (51, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods` VALUES (52, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods` VALUES (53, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods` VALUES (54, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods` VALUES (55, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods` VALUES (56, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods` VALUES (57, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods` VALUES (58, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods` VALUES (59, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods` VALUES (60, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods` VALUES (61, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods` VALUES (62, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods` VALUES (63, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods` VALUES (64, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods` VALUES (65, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods` VALUES (66, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods` VALUES (67, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods` VALUES (68, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods` VALUES (69, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods` VALUES (72, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods` VALUES (73, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods` VALUES (74, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods` VALUES (75, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods` VALUES (76, '商品4', 400, '这是商品4的描述', 399.99, 4, 'http://static.runoob.com/images/demo/demo2.jpg', 10);
INSERT INTO `goods` VALUES (77, '商品1', 100, '这是商品1的描述', 99.99, 1, 'http://static.runoob.com/images/demo/demo2.jpg', 6);
INSERT INTO `goods` VALUES (78, '商品2', 200, '这是商品2的描述', 199.99, 2, 'http://static.runoob.com/images/demo/demo2.jpg', 8);
INSERT INTO `goods` VALUES (79, '商品3', 300, '这是商品3的描述', 299.99, 3, 'http://static.runoob.com/images/demo/demo2.jpg', 9);
INSERT INTO `goods` VALUES (86, '宁宁漆发布的商品', 1, '无价之宝', 999999.00, 45, 'https://cube.elemecdn.com/6/94/4d3ea53c084bad6931a56d5158a48jpeg.jpeg', 0);
INSERT INTO `goods` VALUES (88, '管理员吉祥物', 1, '只因祥物', 9999999.00, 54, 'https://img.alicdn.com/bao/uploaded/O1CN01ls8mD21ZVeFYGT1K9_!!6000000003200-0-yinhe.jpg', 0);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `dId` int(0) NOT NULL AUTO_INCREMENT COMMENT '订单ID，自增',
  `dStatue` tinyint(1) NOT NULL DEFAULT 0 COMMENT '订单支付状态',
  `dDate` datetime(0) NOT NULL COMMENT '订单创建的日期',
  `dAmount` double(5, 2) NOT NULL COMMENT '订单所涉及的金额',
  `dCount` int(0) NOT NULL COMMENT '商品数量',
  `sId` int(0) NOT NULL COMMENT '出售该商品的用户ID',
  `bId` int(0) NOT NULL COMMENT '购买该商品的用户ID',
  `gId` int(0) NOT NULL COMMENT '商品ID',
  PRIMARY KEY (`dId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 348 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, 1, '2022-11-11 11:11:11', 100.00, 20, 1, 22, 1);
INSERT INTO `order` VALUES (2, 0, '2022-11-12 12:12:12', 100.00, 20, 1, 22, 2);
INSERT INTO `order` VALUES (3, 1, '2022-11-13 13:13:13', 100.00, 30, 1, 22, 3);
INSERT INTO `order` VALUES (4, 0, '2022-11-14 14:14:14', 100.00, 40, 2, 8, 4);
INSERT INTO `order` VALUES (5, 1, '2022-11-15 15:15:15', 100.00, 20, 2, 8, 5);
INSERT INTO `order` VALUES (6, 0, '2022-11-16 16:16:16', 110.00, 30, 2, 16, 6);
INSERT INTO `order` VALUES (7, 1, '2022-11-17 17:17:17', 110.00, 30, 3, 32, 7);
INSERT INTO `order` VALUES (8, 0, '2022-11-18 18:18:18', 110.00, 30, 3, 32, 8);
INSERT INTO `order` VALUES (9, 1, '2022-11-19 19:19:19', 110.00, 30, 3, 34, 9);
INSERT INTO `order` VALUES (10, 0, '2022-11-20 20:20:20', 110.00, 50, 4, 15, 10);
INSERT INTO `order` VALUES (11, 1, '2022-11-21 21:21:21', 2.00, 100, 4, 23, 11);
INSERT INTO `order` VALUES (12, 0, '2022-11-22 22:22:22', 2.00, 100, 4, 12, 12);
INSERT INTO `order` VALUES (13, 1, '2022-11-23 23:23:23', 2.00, 100, 5, 16, 13);
INSERT INTO `order` VALUES (14, 0, '2022-11-24 00:00:00', 2.00, 200, 5, 8, 14);
INSERT INTO `order` VALUES (15, 1, '2022-11-25 00:00:00', 2.00, 200, 5, 41, 15);
INSERT INTO `order` VALUES (16, 0, '2022-11-26 00:00:00', 10.00, 50, 6, 24, 16);
INSERT INTO `order` VALUES (17, 1, '2022-11-27 00:00:00', 10.00, 50, 6, 13, 17);
INSERT INTO `order` VALUES (18, 0, '2022-11-28 00:00:00', 10.00, 50, 6, 32, 18);
INSERT INTO `order` VALUES (19, 1, '2022-11-29 00:00:00', 10.00, 50, 7, 33, 19);
INSERT INTO `order` VALUES (20, 0, '2022-11-30 00:00:00', 10.00, 60, 7, 24, 20);
INSERT INTO `order` VALUES (21, 1, '2022-12-01 00:00:00', 5.00, 60, 7, 10, 21);
INSERT INTO `order` VALUES (22, 0, '2022-12-02 00:00:00', 5.00, 60, 8, 6, 22);
INSERT INTO `order` VALUES (23, 1, '2022-12-03 00:00:00', 5.00, 50, 8, 6, 23);
INSERT INTO `order` VALUES (24, 0, '2022-12-04 00:00:00', 5.00, 50, 8, 36, 24);
INSERT INTO `order` VALUES (25, 1, '2022-12-05 00:00:00', 5.00, 30, 9, 25, 25);
INSERT INTO `order` VALUES (26, 0, '2022-12-06 00:00:00', 20.00, 30, 9, 26, 26);
INSERT INTO `order` VALUES (27, 1, '2022-12-07 00:00:00', 20.00, 60, 9, 28, 27);
INSERT INTO `order` VALUES (28, 0, '2022-12-08 00:00:00', 20.00, 30, 10, 28, 28);
INSERT INTO `order` VALUES (29, 1, '2022-12-09 00:00:00', 20.00, 30, 10, 39, 29);
INSERT INTO `order` VALUES (30, 0, '2022-12-10 00:00:00', 20.00, 30, 10, 21, 30);
INSERT INTO `order` VALUES (31, 1, '2022-12-11 00:00:00', 9.00, 50, 11, 12, 31);
INSERT INTO `order` VALUES (32, 0, '2022-12-12 00:00:00', 9.00, 100, 11, 30, 32);
INSERT INTO `order` VALUES (33, 1, '2022-12-13 00:00:00', 9.00, 30, 11, 30, 33);
INSERT INTO `order` VALUES (34, 0, '2022-12-14 00:00:00', 9.00, 30, 12, 22, 34);
INSERT INTO `order` VALUES (35, 1, '2022-12-15 00:00:00', 9.00, 60, 12, 23, 35);
INSERT INTO `order` VALUES (36, 0, '2022-12-16 00:00:00', 32.00, 10, 12, 42, 36);
INSERT INTO `order` VALUES (37, 1, '2022-12-17 00:00:00', 32.00, 10, 13, 15, 37);
INSERT INTO `order` VALUES (38, 0, '2022-12-18 00:00:00', 32.00, 10, 13, 15, 38);
INSERT INTO `order` VALUES (39, 1, '2022-12-19 00:00:00', 32.00, 30, 13, 39, 39);
INSERT INTO `order` VALUES (40, 0, '2022-12-20 00:00:00', 32.00, 40, 14, 2, 40);
INSERT INTO `order` VALUES (41, 1, '2022-12-21 00:00:00', 35.00, 60, 14, 41, 41);
INSERT INTO `order` VALUES (42, 0, '2022-12-22 00:00:00', 35.00, 60, 14, 42, 42);
INSERT INTO `order` VALUES (43, 1, '2022-12-23 00:00:00', 35.00, 70, 15, 43, 43);
INSERT INTO `order` VALUES (44, 0, '2022-12-24 00:00:00', 35.00, 100, 15, 44, 44);
INSERT INTO `order` VALUES (45, 1, '2022-12-25 00:00:00', 35.00, 100, 15, 45, 45);
INSERT INTO `order` VALUES (46, 0, '2022-12-26 00:00:00', 88.00, 100, 16, 46, 46);
INSERT INTO `order` VALUES (47, 1, '2022-12-27 00:00:00', 88.00, 60, 16, 47, 47);
INSERT INTO `order` VALUES (48, 0, '2022-12-28 00:00:00', 88.00, 80, 16, 48, 48);
INSERT INTO `order` VALUES (49, 1, '2022-12-29 00:00:00', 88.00, 40, 17, 49, 49);
INSERT INTO `order` VALUES (50, 0, '2022-12-30 00:00:00', 88.00, 100, 17, 50, 50);
INSERT INTO `order` VALUES (51, 1, '2022-11-11 11:11:11', 100.00, 20, 1, 22, 1);
INSERT INTO `order` VALUES (52, 0, '2022-11-12 12:12:12', 100.00, 20, 1, 22, 2);
INSERT INTO `order` VALUES (53, 1, '2022-11-13 13:13:13', 100.00, 30, 1, 22, 3);
INSERT INTO `order` VALUES (54, 0, '2022-11-14 14:14:14', 100.00, 40, 2, 8, 4);
INSERT INTO `order` VALUES (55, 1, '2022-11-15 15:15:15', 100.00, 20, 2, 8, 5);
INSERT INTO `order` VALUES (56, 0, '2022-11-16 16:16:16', 110.00, 30, 2, 16, 6);
INSERT INTO `order` VALUES (57, 1, '2022-11-17 17:17:17', 110.00, 30, 3, 32, 7);
INSERT INTO `order` VALUES (58, 0, '2022-11-18 18:18:18', 110.00, 30, 3, 32, 8);
INSERT INTO `order` VALUES (59, 1, '2022-11-19 19:19:19', 110.00, 30, 3, 34, 9);
INSERT INTO `order` VALUES (60, 0, '2022-11-20 20:20:20', 110.00, 50, 4, 15, 10);
INSERT INTO `order` VALUES (61, 1, '2022-11-21 21:21:21', 2.00, 100, 4, 23, 11);
INSERT INTO `order` VALUES (62, 0, '2022-11-22 22:22:22', 2.00, 100, 4, 12, 12);
INSERT INTO `order` VALUES (63, 1, '2022-11-23 23:23:23', 2.00, 100, 5, 16, 13);
INSERT INTO `order` VALUES (64, 0, '2022-11-24 00:00:00', 2.00, 200, 5, 8, 14);
INSERT INTO `order` VALUES (65, 1, '2022-11-25 00:00:00', 2.00, 200, 5, 41, 15);
INSERT INTO `order` VALUES (66, 0, '2022-11-26 00:00:00', 10.00, 50, 6, 24, 16);
INSERT INTO `order` VALUES (67, 1, '2022-11-27 00:00:00', 10.00, 50, 6, 13, 17);
INSERT INTO `order` VALUES (68, 0, '2022-11-28 00:00:00', 10.00, 50, 6, 32, 18);
INSERT INTO `order` VALUES (69, 1, '2022-11-29 00:00:00', 10.00, 50, 7, 33, 19);
INSERT INTO `order` VALUES (70, 0, '2022-11-30 00:00:00', 10.00, 60, 7, 24, 20);
INSERT INTO `order` VALUES (71, 1, '2022-12-01 00:00:00', 5.00, 60, 7, 10, 21);
INSERT INTO `order` VALUES (72, 0, '2022-12-02 00:00:00', 5.00, 60, 8, 6, 22);
INSERT INTO `order` VALUES (73, 1, '2022-12-03 00:00:00', 5.00, 50, 8, 6, 23);
INSERT INTO `order` VALUES (74, 0, '2022-12-04 00:00:00', 5.00, 50, 8, 36, 24);
INSERT INTO `order` VALUES (75, 1, '2022-12-05 00:00:00', 5.00, 30, 9, 25, 25);
INSERT INTO `order` VALUES (76, 0, '2022-12-06 00:00:00', 20.00, 30, 9, 26, 26);
INSERT INTO `order` VALUES (77, 1, '2022-12-07 00:00:00', 20.00, 60, 9, 28, 27);
INSERT INTO `order` VALUES (78, 0, '2022-12-08 00:00:00', 20.00, 30, 10, 28, 28);
INSERT INTO `order` VALUES (79, 1, '2022-12-09 00:00:00', 20.00, 30, 10, 39, 29);
INSERT INTO `order` VALUES (80, 0, '2022-12-10 00:00:00', 20.00, 30, 10, 21, 30);
INSERT INTO `order` VALUES (81, 1, '2022-12-11 00:00:00', 9.00, 50, 11, 12, 31);
INSERT INTO `order` VALUES (82, 0, '2022-12-12 00:00:00', 9.00, 100, 11, 30, 32);
INSERT INTO `order` VALUES (83, 1, '2022-12-13 00:00:00', 9.00, 30, 11, 30, 33);
INSERT INTO `order` VALUES (84, 0, '2022-12-14 00:00:00', 9.00, 30, 12, 22, 34);
INSERT INTO `order` VALUES (85, 1, '2022-12-15 00:00:00', 9.00, 60, 12, 23, 35);
INSERT INTO `order` VALUES (86, 0, '2022-12-16 00:00:00', 32.00, 10, 12, 42, 36);
INSERT INTO `order` VALUES (87, 1, '2022-12-17 00:00:00', 32.00, 10, 13, 15, 37);
INSERT INTO `order` VALUES (88, 0, '2022-12-18 00:00:00', 32.00, 10, 13, 15, 38);
INSERT INTO `order` VALUES (89, 1, '2022-12-19 00:00:00', 32.00, 30, 13, 39, 39);
INSERT INTO `order` VALUES (90, 0, '2022-12-20 00:00:00', 32.00, 40, 14, 2, 40);
INSERT INTO `order` VALUES (91, 1, '2022-12-21 00:00:00', 35.00, 60, 14, 41, 41);
INSERT INTO `order` VALUES (92, 0, '2022-12-22 00:00:00', 35.00, 60, 14, 42, 42);
INSERT INTO `order` VALUES (93, 1, '2022-12-23 00:00:00', 35.00, 70, 15, 43, 43);
INSERT INTO `order` VALUES (94, 0, '2022-12-24 00:00:00', 35.00, 100, 15, 44, 44);
INSERT INTO `order` VALUES (95, 1, '2022-12-25 00:00:00', 35.00, 100, 15, 45, 45);
INSERT INTO `order` VALUES (96, 0, '2022-12-26 00:00:00', 88.00, 100, 16, 46, 46);
INSERT INTO `order` VALUES (97, 1, '2022-12-27 00:00:00', 88.00, 60, 16, 47, 47);
INSERT INTO `order` VALUES (98, 0, '2022-12-28 00:00:00', 88.00, 80, 16, 48, 48);
INSERT INTO `order` VALUES (99, 1, '2022-12-29 00:00:00', 88.00, 40, 17, 49, 49);
INSERT INTO `order` VALUES (100, 0, '2022-12-30 00:00:00', 88.00, 100, 17, 50, 50);
INSERT INTO `order` VALUES (101, 1, '2022-11-11 11:11:11', 100.00, 20, 1, 22, 1);
INSERT INTO `order` VALUES (102, 0, '2022-11-12 12:12:12', 100.00, 20, 1, 22, 2);
INSERT INTO `order` VALUES (103, 1, '2022-11-13 13:13:13', 100.00, 30, 1, 22, 3);
INSERT INTO `order` VALUES (104, 0, '2022-11-14 14:14:14', 100.00, 40, 2, 8, 4);
INSERT INTO `order` VALUES (105, 1, '2022-11-15 15:15:15', 100.00, 20, 2, 8, 5);
INSERT INTO `order` VALUES (106, 0, '2022-11-16 16:16:16', 110.00, 30, 2, 16, 6);
INSERT INTO `order` VALUES (107, 1, '2022-11-17 17:17:17', 110.00, 30, 3, 32, 7);
INSERT INTO `order` VALUES (108, 0, '2022-11-18 18:18:18', 110.00, 30, 3, 32, 8);
INSERT INTO `order` VALUES (109, 1, '2022-11-19 19:19:19', 110.00, 30, 3, 34, 9);
INSERT INTO `order` VALUES (110, 0, '2022-11-20 20:20:20', 110.00, 50, 4, 15, 10);
INSERT INTO `order` VALUES (111, 1, '2022-11-21 21:21:21', 2.00, 100, 4, 23, 11);
INSERT INTO `order` VALUES (112, 0, '2022-11-22 22:22:22', 2.00, 100, 4, 12, 12);
INSERT INTO `order` VALUES (113, 1, '2022-11-23 23:23:23', 2.00, 100, 5, 16, 13);
INSERT INTO `order` VALUES (114, 0, '2022-11-24 00:00:00', 2.00, 200, 5, 8, 14);
INSERT INTO `order` VALUES (115, 1, '2022-11-25 00:00:00', 2.00, 200, 5, 41, 15);
INSERT INTO `order` VALUES (116, 0, '2022-11-26 00:00:00', 10.00, 50, 6, 24, 16);
INSERT INTO `order` VALUES (117, 1, '2022-11-27 00:00:00', 10.00, 50, 6, 13, 17);
INSERT INTO `order` VALUES (118, 0, '2022-11-28 00:00:00', 10.00, 50, 6, 32, 18);
INSERT INTO `order` VALUES (119, 1, '2022-11-29 00:00:00', 10.00, 50, 7, 33, 19);
INSERT INTO `order` VALUES (120, 0, '2022-11-30 00:00:00', 10.00, 60, 7, 24, 20);
INSERT INTO `order` VALUES (121, 1, '2022-12-01 00:00:00', 5.00, 60, 7, 10, 21);
INSERT INTO `order` VALUES (122, 0, '2022-12-02 00:00:00', 5.00, 60, 8, 6, 22);
INSERT INTO `order` VALUES (123, 1, '2022-12-03 00:00:00', 5.00, 50, 8, 6, 23);
INSERT INTO `order` VALUES (124, 0, '2022-12-04 00:00:00', 5.00, 50, 8, 36, 24);
INSERT INTO `order` VALUES (125, 1, '2022-12-05 00:00:00', 5.00, 30, 9, 25, 25);
INSERT INTO `order` VALUES (126, 0, '2022-12-06 00:00:00', 20.00, 30, 9, 26, 26);
INSERT INTO `order` VALUES (127, 1, '2022-12-07 00:00:00', 20.00, 60, 9, 28, 27);
INSERT INTO `order` VALUES (128, 0, '2022-12-08 00:00:00', 20.00, 30, 10, 28, 28);
INSERT INTO `order` VALUES (129, 1, '2022-12-09 00:00:00', 20.00, 30, 10, 39, 29);
INSERT INTO `order` VALUES (130, 0, '2022-12-10 00:00:00', 20.00, 30, 10, 21, 30);
INSERT INTO `order` VALUES (131, 1, '2022-12-11 00:00:00', 9.00, 50, 11, 12, 31);
INSERT INTO `order` VALUES (132, 0, '2022-12-12 00:00:00', 9.00, 100, 11, 30, 32);
INSERT INTO `order` VALUES (133, 1, '2022-12-13 00:00:00', 9.00, 30, 11, 30, 33);
INSERT INTO `order` VALUES (134, 0, '2022-12-14 00:00:00', 9.00, 30, 12, 22, 34);
INSERT INTO `order` VALUES (135, 1, '2022-12-15 00:00:00', 9.00, 60, 12, 23, 35);
INSERT INTO `order` VALUES (136, 0, '2022-12-16 00:00:00', 32.00, 10, 12, 42, 36);
INSERT INTO `order` VALUES (137, 1, '2022-12-17 00:00:00', 32.00, 10, 13, 15, 37);
INSERT INTO `order` VALUES (138, 0, '2022-12-18 00:00:00', 32.00, 10, 13, 15, 38);
INSERT INTO `order` VALUES (139, 1, '2022-12-19 00:00:00', 32.00, 30, 13, 39, 39);
INSERT INTO `order` VALUES (140, 0, '2022-12-20 00:00:00', 32.00, 40, 14, 2, 40);
INSERT INTO `order` VALUES (141, 1, '2022-12-21 00:00:00', 35.00, 60, 14, 41, 41);
INSERT INTO `order` VALUES (142, 0, '2022-12-22 00:00:00', 35.00, 60, 14, 42, 42);
INSERT INTO `order` VALUES (143, 1, '2022-12-23 00:00:00', 35.00, 70, 15, 43, 43);
INSERT INTO `order` VALUES (144, 0, '2022-12-24 00:00:00', 35.00, 100, 15, 44, 44);
INSERT INTO `order` VALUES (145, 1, '2022-12-25 00:00:00', 35.00, 100, 15, 45, 45);
INSERT INTO `order` VALUES (146, 0, '2022-12-26 00:00:00', 88.00, 100, 16, 46, 46);
INSERT INTO `order` VALUES (147, 1, '2022-12-27 00:00:00', 88.00, 60, 16, 47, 47);
INSERT INTO `order` VALUES (148, 0, '2022-12-28 00:00:00', 88.00, 80, 16, 48, 48);
INSERT INTO `order` VALUES (149, 1, '2022-12-29 00:00:00', 88.00, 40, 17, 49, 49);
INSERT INTO `order` VALUES (150, 0, '2022-12-30 00:00:00', 88.00, 100, 17, 50, 50);
INSERT INTO `order` VALUES (151, 1, '2022-11-11 11:11:11', 100.00, 20, 1, 22, 1);
INSERT INTO `order` VALUES (152, 0, '2022-11-12 12:12:12', 200.00, 20, 1, 22, 2);
INSERT INTO `order` VALUES (153, 1, '2022-11-13 13:13:13', 198.00, 30, 1, 22, 3);
INSERT INTO `order` VALUES (154, 0, '2022-11-14 14:14:14', 100.00, 40, 2, 8, 4);
INSERT INTO `order` VALUES (155, 1, '2022-11-15 15:15:15', 100.00, 20, 2, 8, 5);
INSERT INTO `order` VALUES (156, 0, '2022-11-16 16:16:16', 110.00, 30, 2, 16, 6);
INSERT INTO `order` VALUES (157, 1, '2022-11-17 17:17:17', 110.00, 30, 3, 32, 7);
INSERT INTO `order` VALUES (158, 0, '2022-11-18 18:18:18', 110.00, 30, 3, 32, 8);
INSERT INTO `order` VALUES (159, 1, '2022-11-19 19:19:19', 110.00, 30, 3, 34, 9);
INSERT INTO `order` VALUES (160, 0, '2022-11-20 20:20:20', 110.00, 50, 4, 15, 10);
INSERT INTO `order` VALUES (161, 1, '2022-11-21 21:21:21', 2.00, 100, 4, 23, 11);
INSERT INTO `order` VALUES (162, 0, '2022-11-22 22:22:22', 2.00, 100, 4, 12, 12);
INSERT INTO `order` VALUES (163, 1, '2022-11-23 23:23:23', 2.00, 100, 5, 16, 13);
INSERT INTO `order` VALUES (164, 0, '2022-11-24 00:00:00', 2.00, 200, 5, 8, 14);
INSERT INTO `order` VALUES (165, 1, '2022-11-25 00:00:00', 2.00, 200, 5, 41, 15);
INSERT INTO `order` VALUES (166, 0, '2022-11-26 00:00:00', 10.00, 50, 6, 24, 16);
INSERT INTO `order` VALUES (167, 1, '2022-11-27 00:00:00', 10.00, 50, 6, 13, 17);
INSERT INTO `order` VALUES (168, 0, '2022-11-28 00:00:00', 10.00, 50, 6, 32, 18);
INSERT INTO `order` VALUES (169, 1, '2022-11-29 00:00:00', 10.00, 50, 7, 33, 19);
INSERT INTO `order` VALUES (170, 0, '2022-11-30 00:00:00', 10.00, 60, 7, 24, 20);
INSERT INTO `order` VALUES (171, 1, '2022-12-01 00:00:00', 5.00, 60, 7, 10, 21);
INSERT INTO `order` VALUES (172, 0, '2022-12-02 00:00:00', 5.00, 60, 8, 6, 22);
INSERT INTO `order` VALUES (173, 1, '2022-12-03 00:00:00', 5.00, 50, 8, 6, 23);
INSERT INTO `order` VALUES (174, 0, '2022-12-04 00:00:00', 5.00, 50, 8, 36, 24);
INSERT INTO `order` VALUES (175, 1, '2022-12-05 00:00:00', 5.00, 30, 9, 25, 25);
INSERT INTO `order` VALUES (176, 0, '2022-12-06 00:00:00', 20.00, 30, 9, 26, 26);
INSERT INTO `order` VALUES (177, 1, '2022-12-07 00:00:00', 20.00, 60, 9, 28, 27);
INSERT INTO `order` VALUES (178, 0, '2022-12-08 00:00:00', 20.00, 30, 10, 28, 28);
INSERT INTO `order` VALUES (179, 1, '2022-12-09 00:00:00', 20.00, 30, 10, 39, 29);
INSERT INTO `order` VALUES (180, 0, '2022-12-10 00:00:00', 20.00, 30, 10, 21, 30);
INSERT INTO `order` VALUES (181, 1, '2022-12-11 00:00:00', 9.00, 50, 11, 12, 31);
INSERT INTO `order` VALUES (182, 0, '2022-12-12 00:00:00', 9.00, 100, 11, 30, 32);
INSERT INTO `order` VALUES (183, 1, '2022-12-13 00:00:00', 9.00, 30, 11, 30, 33);
INSERT INTO `order` VALUES (184, 0, '2022-12-14 00:00:00', 9.00, 30, 12, 22, 34);
INSERT INTO `order` VALUES (185, 1, '2022-12-15 00:00:00', 9.00, 60, 12, 23, 35);
INSERT INTO `order` VALUES (186, 0, '2022-12-16 00:00:00', 32.00, 10, 12, 42, 36);
INSERT INTO `order` VALUES (187, 1, '2022-12-17 00:00:00', 32.00, 10, 13, 15, 37);
INSERT INTO `order` VALUES (188, 0, '2022-12-18 00:00:00', 32.00, 10, 13, 15, 38);
INSERT INTO `order` VALUES (189, 1, '2022-12-19 00:00:00', 32.00, 30, 13, 39, 39);
INSERT INTO `order` VALUES (190, 0, '2022-12-20 00:00:00', 32.00, 40, 14, 2, 40);
INSERT INTO `order` VALUES (191, 1, '2022-12-21 00:00:00', 35.00, 60, 14, 41, 41);
INSERT INTO `order` VALUES (192, 0, '2022-12-22 00:00:00', 35.00, 60, 14, 42, 42);
INSERT INTO `order` VALUES (193, 1, '2022-12-23 00:00:00', 35.00, 70, 15, 43, 43);
INSERT INTO `order` VALUES (194, 0, '2022-12-24 00:00:00', 35.00, 100, 15, 44, 44);
INSERT INTO `order` VALUES (195, 1, '2022-12-25 00:00:00', 35.00, 100, 15, 45, 45);
INSERT INTO `order` VALUES (196, 0, '2022-12-26 00:00:00', 88.00, 100, 16, 46, 46);
INSERT INTO `order` VALUES (197, 1, '2022-12-27 00:00:00', 88.00, 60, 16, 47, 47);
INSERT INTO `order` VALUES (198, 0, '2022-12-28 00:00:00', 88.00, 80, 16, 48, 48);
INSERT INTO `order` VALUES (199, 1, '2022-12-29 00:00:00', 88.00, 40, 17, 49, 49);
INSERT INTO `order` VALUES (200, 0, '2022-12-30 00:00:00', 88.00, 100, 17, 50, 50);
INSERT INTO `order` VALUES (201, 1, '2022-11-11 11:11:11', 75.20, 20, 1, 22, 1);
INSERT INTO `order` VALUES (202, 0, '2022-11-12 12:12:12', 100.00, 20, 1, 22, 2);
INSERT INTO `order` VALUES (203, 1, '2022-11-13 13:13:13', 100.00, 30, 1, 22, 3);
INSERT INTO `order` VALUES (204, 0, '2022-11-14 14:14:14', 100.00, 40, 2, 8, 4);
INSERT INTO `order` VALUES (205, 1, '2022-11-15 15:15:15', 100.00, 20, 2, 8, 5);
INSERT INTO `order` VALUES (206, 0, '2022-11-16 16:16:16', 110.00, 30, 2, 16, 6);
INSERT INTO `order` VALUES (207, 1, '2022-11-17 17:17:17', 110.00, 30, 3, 32, 7);
INSERT INTO `order` VALUES (208, 0, '2022-11-18 18:18:18', 110.00, 30, 3, 32, 8);
INSERT INTO `order` VALUES (209, 1, '2022-11-19 19:19:19', 110.00, 30, 3, 34, 9);
INSERT INTO `order` VALUES (210, 0, '2022-11-20 20:20:20', 110.00, 50, 4, 15, 10);
INSERT INTO `order` VALUES (211, 1, '2022-11-21 21:21:21', 2.00, 100, 4, 23, 11);
INSERT INTO `order` VALUES (212, 0, '2022-11-22 22:22:22', 2.00, 100, 4, 12, 12);
INSERT INTO `order` VALUES (213, 1, '2022-11-23 23:23:23', 2.00, 100, 5, 16, 13);
INSERT INTO `order` VALUES (214, 0, '2022-11-24 00:00:00', 2.00, 200, 5, 8, 14);
INSERT INTO `order` VALUES (215, 1, '2022-11-25 00:00:00', 2.00, 200, 5, 41, 15);
INSERT INTO `order` VALUES (216, 0, '2022-11-26 00:00:00', 10.00, 50, 6, 24, 16);
INSERT INTO `order` VALUES (217, 1, '2022-11-27 00:00:00', 10.00, 50, 6, 13, 17);
INSERT INTO `order` VALUES (218, 0, '2022-11-28 00:00:00', 10.00, 50, 6, 32, 18);
INSERT INTO `order` VALUES (219, 1, '2022-11-29 00:00:00', 10.00, 50, 7, 33, 19);
INSERT INTO `order` VALUES (220, 0, '2022-11-30 00:00:00', 10.00, 60, 7, 24, 20);
INSERT INTO `order` VALUES (221, 1, '2022-12-01 00:00:00', 5.00, 60, 7, 10, 21);
INSERT INTO `order` VALUES (222, 0, '2022-12-02 00:00:00', 5.00, 60, 8, 6, 22);
INSERT INTO `order` VALUES (223, 1, '2022-12-03 00:00:00', 5.00, 50, 8, 6, 23);
INSERT INTO `order` VALUES (224, 0, '2022-12-04 00:00:00', 5.00, 50, 8, 36, 24);
INSERT INTO `order` VALUES (225, 1, '2022-12-05 00:00:00', 5.00, 30, 9, 25, 25);
INSERT INTO `order` VALUES (226, 0, '2022-12-06 00:00:00', 20.00, 30, 9, 26, 26);
INSERT INTO `order` VALUES (227, 1, '2022-12-07 00:00:00', 20.00, 60, 9, 28, 27);
INSERT INTO `order` VALUES (228, 0, '2022-12-08 00:00:00', 20.00, 30, 10, 28, 28);
INSERT INTO `order` VALUES (229, 1, '2022-12-09 00:00:00', 20.00, 30, 10, 39, 29);
INSERT INTO `order` VALUES (230, 0, '2022-12-10 00:00:00', 20.00, 30, 10, 21, 30);
INSERT INTO `order` VALUES (231, 1, '2022-12-11 00:00:00', 9.00, 50, 11, 12, 31);
INSERT INTO `order` VALUES (232, 0, '2022-12-12 00:00:00', 9.00, 100, 11, 30, 32);
INSERT INTO `order` VALUES (233, 1, '2022-12-13 00:00:00', 9.00, 30, 11, 30, 33);
INSERT INTO `order` VALUES (234, 0, '2022-12-14 00:00:00', 9.00, 30, 12, 22, 34);
INSERT INTO `order` VALUES (235, 1, '2022-12-15 00:00:00', 9.00, 60, 12, 23, 35);
INSERT INTO `order` VALUES (236, 1, '2022-11-11 11:11:11', 100.00, 20, 1, 22, 1);
INSERT INTO `order` VALUES (237, 0, '2022-11-12 12:12:12', 100.00, 20, 1, 22, 2);
INSERT INTO `order` VALUES (238, 1, '2022-11-13 13:13:13', 100.00, 30, 1, 22, 3);
INSERT INTO `order` VALUES (239, 0, '2022-11-14 14:14:14', 100.00, 40, 2, 8, 4);
INSERT INTO `order` VALUES (240, 1, '2022-11-15 15:15:15', 100.00, 20, 2, 8, 5);
INSERT INTO `order` VALUES (241, 0, '2022-11-16 16:16:16', 110.00, 30, 2, 16, 6);
INSERT INTO `order` VALUES (242, 1, '2022-11-17 17:17:17', 110.00, 30, 3, 32, 7);
INSERT INTO `order` VALUES (243, 0, '2022-11-18 18:18:18', 110.00, 30, 3, 32, 8);
INSERT INTO `order` VALUES (244, 1, '2022-11-19 19:19:19', 110.00, 30, 3, 34, 9);
INSERT INTO `order` VALUES (245, 0, '2022-11-20 20:20:20', 110.00, 50, 4, 15, 10);
INSERT INTO `order` VALUES (246, 1, '2022-11-21 21:21:21', 2.00, 100, 4, 23, 11);
INSERT INTO `order` VALUES (247, 0, '2022-11-22 22:22:22', 2.00, 100, 4, 12, 12);
INSERT INTO `order` VALUES (248, 1, '2022-11-23 23:23:23', 2.00, 100, 5, 16, 13);
INSERT INTO `order` VALUES (249, 0, '2022-11-24 00:00:00', 2.00, 200, 5, 8, 14);
INSERT INTO `order` VALUES (250, 1, '2022-11-25 00:00:00', 2.00, 200, 5, 41, 15);
INSERT INTO `order` VALUES (251, 0, '2022-11-26 00:00:00', 10.00, 50, 6, 24, 16);
INSERT INTO `order` VALUES (252, 1, '2022-11-27 00:00:00', 10.00, 50, 6, 13, 17);
INSERT INTO `order` VALUES (253, 0, '2022-11-28 00:00:00', 10.00, 50, 6, 32, 18);
INSERT INTO `order` VALUES (254, 1, '2022-11-29 00:00:00', 10.00, 50, 7, 33, 19);
INSERT INTO `order` VALUES (255, 0, '2022-11-30 00:00:00', 10.00, 60, 7, 24, 20);
INSERT INTO `order` VALUES (256, 1, '2022-12-01 00:00:00', 5.00, 60, 7, 10, 21);
INSERT INTO `order` VALUES (257, 0, '2022-12-02 00:00:00', 5.00, 60, 8, 6, 22);
INSERT INTO `order` VALUES (258, 1, '2022-12-03 00:00:00', 5.00, 50, 8, 6, 23);
INSERT INTO `order` VALUES (259, 0, '2022-12-04 00:00:00', 5.00, 50, 8, 36, 24);
INSERT INTO `order` VALUES (260, 1, '2022-12-05 00:00:00', 5.00, 30, 9, 25, 25);
INSERT INTO `order` VALUES (261, 0, '2022-12-06 00:00:00', 20.00, 30, 9, 26, 26);
INSERT INTO `order` VALUES (262, 1, '2022-12-07 00:00:00', 20.00, 60, 9, 28, 27);
INSERT INTO `order` VALUES (263, 0, '2022-12-08 00:00:00', 20.00, 30, 10, 28, 28);
INSERT INTO `order` VALUES (264, 1, '2022-12-09 00:00:00', 20.00, 30, 10, 39, 29);
INSERT INTO `order` VALUES (265, 0, '2022-12-10 00:00:00', 20.00, 30, 10, 21, 30);
INSERT INTO `order` VALUES (266, 1, '2022-12-11 00:00:00', 9.00, 50, 11, 12, 31);
INSERT INTO `order` VALUES (267, 0, '2022-12-12 00:00:00', 9.00, 100, 11, 30, 32);
INSERT INTO `order` VALUES (268, 1, '2022-12-13 00:00:00', 9.00, 30, 11, 30, 33);
INSERT INTO `order` VALUES (269, 0, '2022-12-14 00:00:00', 9.00, 30, 12, 22, 34);
INSERT INTO `order` VALUES (270, 1, '2022-12-15 00:00:00', 9.00, 60, 12, 23, 35);
INSERT INTO `order` VALUES (271, 1, '2022-11-11 11:11:11', 100.00, 20, 1, 22, 1);
INSERT INTO `order` VALUES (272, 0, '2022-11-12 12:12:12', 100.00, 20, 1, 22, 2);
INSERT INTO `order` VALUES (273, 1, '2022-11-13 13:13:13', 100.00, 30, 1, 22, 3);
INSERT INTO `order` VALUES (274, 0, '2022-11-14 14:14:14', 100.00, 40, 2, 8, 4);
INSERT INTO `order` VALUES (275, 1, '2022-11-15 15:15:15', 100.00, 20, 2, 8, 5);
INSERT INTO `order` VALUES (276, 0, '2022-11-16 16:16:16', 110.00, 30, 2, 16, 6);
INSERT INTO `order` VALUES (277, 1, '2022-11-17 17:17:17', 110.00, 30, 3, 32, 7);
INSERT INTO `order` VALUES (278, 0, '2022-11-18 18:18:18', 110.00, 30, 3, 32, 8);
INSERT INTO `order` VALUES (279, 1, '2022-11-19 19:19:19', 110.00, 30, 3, 34, 9);
INSERT INTO `order` VALUES (280, 0, '2022-11-20 20:20:20', 110.00, 50, 4, 15, 10);
INSERT INTO `order` VALUES (281, 1, '2022-11-21 21:21:21', 2.00, 100, 4, 23, 11);
INSERT INTO `order` VALUES (282, 0, '2022-11-22 22:22:22', 2.00, 100, 4, 12, 12);
INSERT INTO `order` VALUES (283, 1, '2022-11-23 23:23:23', 2.00, 100, 5, 16, 13);
INSERT INTO `order` VALUES (284, 0, '2022-11-24 00:00:00', 2.00, 200, 5, 8, 14);
INSERT INTO `order` VALUES (285, 1, '2022-11-25 00:00:00', 2.00, 200, 5, 41, 15);
INSERT INTO `order` VALUES (286, 0, '2022-11-26 00:00:00', 10.00, 50, 6, 24, 16);
INSERT INTO `order` VALUES (287, 1, '2022-11-27 00:00:00', 10.00, 50, 6, 13, 17);
INSERT INTO `order` VALUES (288, 0, '2022-11-28 00:00:00', 10.00, 50, 6, 32, 18);
INSERT INTO `order` VALUES (289, 1, '2022-11-29 00:00:00', 10.00, 50, 7, 33, 19);
INSERT INTO `order` VALUES (290, 0, '2022-11-30 00:00:00', 10.00, 60, 7, 24, 20);
INSERT INTO `order` VALUES (291, 1, '2022-12-01 00:00:00', 5.00, 60, 7, 10, 21);
INSERT INTO `order` VALUES (292, 0, '2022-12-02 00:00:00', 5.00, 60, 8, 6, 22);
INSERT INTO `order` VALUES (293, 1, '2022-12-03 00:00:00', 5.00, 50, 8, 6, 23);
INSERT INTO `order` VALUES (294, 0, '2022-12-04 00:00:00', 5.00, 50, 8, 36, 24);
INSERT INTO `order` VALUES (295, 1, '2022-12-05 00:00:00', 5.00, 30, 9, 25, 25);
INSERT INTO `order` VALUES (296, 0, '2022-12-06 00:00:00', 20.00, 30, 9, 26, 26);
INSERT INTO `order` VALUES (297, 1, '2022-12-07 00:00:00', 20.00, 60, 9, 28, 27);
INSERT INTO `order` VALUES (298, 0, '2022-12-08 00:00:00', 20.00, 30, 10, 28, 28);
INSERT INTO `order` VALUES (299, 1, '2022-12-09 00:00:00', 20.00, 30, 10, 39, 29);
INSERT INTO `order` VALUES (300, 0, '2022-12-10 00:00:00', 20.00, 30, 10, 21, 30);
INSERT INTO `order` VALUES (301, 1, '2022-12-11 00:00:00', 9.00, 50, 11, 12, 31);
INSERT INTO `order` VALUES (302, 0, '2022-12-12 00:00:00', 9.00, 100, 11, 30, 32);
INSERT INTO `order` VALUES (303, 1, '2022-12-13 00:00:00', 9.00, 30, 11, 30, 33);
INSERT INTO `order` VALUES (304, 0, '2022-12-14 00:00:00', 9.00, 30, 12, 22, 34);
INSERT INTO `order` VALUES (305, 1, '2022-12-15 00:00:00', 9.00, 60, 12, 23, 35);
INSERT INTO `order` VALUES (306, 1, '2022-11-11 11:11:11', 100.00, 20, 1, 22, 1);
INSERT INTO `order` VALUES (307, 0, '2022-11-12 12:12:12', 100.00, 20, 1, 22, 2);
INSERT INTO `order` VALUES (308, 1, '2022-11-13 13:13:13', 100.00, 30, 1, 22, 3);
INSERT INTO `order` VALUES (309, 0, '2022-11-14 14:14:14', 100.00, 40, 2, 8, 4);
INSERT INTO `order` VALUES (310, 1, '2022-11-15 15:15:15', 100.00, 20, 2, 8, 5);
INSERT INTO `order` VALUES (311, 0, '2022-11-16 16:16:16', 110.00, 30, 2, 16, 6);
INSERT INTO `order` VALUES (312, 1, '2022-11-17 17:17:17', 110.00, 30, 3, 32, 7);
INSERT INTO `order` VALUES (313, 0, '2022-11-18 18:18:18', 110.00, 30, 3, 32, 8);
INSERT INTO `order` VALUES (314, 1, '2022-11-19 19:19:19', 110.00, 30, 3, 34, 9);
INSERT INTO `order` VALUES (315, 0, '2022-11-20 20:20:20', 110.00, 50, 4, 15, 10);
INSERT INTO `order` VALUES (316, 1, '2022-11-21 21:21:21', 2.00, 100, 4, 23, 11);
INSERT INTO `order` VALUES (317, 1, '2022-11-11 11:11:11', 100.00, 20, 1, 22, 1);
INSERT INTO `order` VALUES (318, 0, '2022-11-12 12:12:12', 100.00, 20, 1, 22, 2);
INSERT INTO `order` VALUES (319, 1, '2022-11-13 13:13:13', 100.00, 30, 1, 22, 3);
INSERT INTO `order` VALUES (320, 0, '2022-11-14 14:14:14', 100.00, 40, 2, 8, 4);
INSERT INTO `order` VALUES (321, 1, '2022-11-15 15:15:15', 100.00, 20, 2, 8, 5);
INSERT INTO `order` VALUES (322, 0, '2022-11-16 16:16:16', 110.00, 30, 2, 16, 6);
INSERT INTO `order` VALUES (323, 1, '2022-11-17 17:17:17', 110.00, 30, 3, 32, 7);
INSERT INTO `order` VALUES (324, 0, '2022-11-18 18:18:18', 110.00, 30, 3, 32, 8);
INSERT INTO `order` VALUES (325, 1, '2022-11-19 19:19:19', 110.00, 30, 3, 34, 9);
INSERT INTO `order` VALUES (326, 0, '2022-11-20 20:20:20', 110.00, 50, 4, 15, 10);
INSERT INTO `order` VALUES (327, 1, '2022-11-21 21:21:21', 2.00, 100, 4, 23, 11);
INSERT INTO `order` VALUES (328, 1, '2023-06-11 20:44:53', 199.99, 1, 2, 45, 2);
INSERT INTO `order` VALUES (329, 0, '2023-06-11 20:44:59', 199.99, 1, 2, 45, 2);
INSERT INTO `order` VALUES (330, 1, '2023-06-11 20:45:00', 199.99, 1, 2, 45, 2);
INSERT INTO `order` VALUES (331, 0, '2023-06-11 20:46:14', 199.99, 1, 2, 45, 2);
INSERT INTO `order` VALUES (332, 1, '2023-06-11 21:40:11', 199.99, 1, 2, 54, 2);
INSERT INTO `order` VALUES (333, 1, '2023-06-11 21:40:13', 199.99, 1, 2, 54, 2);
INSERT INTO `order` VALUES (334, 1, '2023-06-11 21:59:05', 199.99, 1, 2, 54, 2);
INSERT INTO `order` VALUES (335, 1, '2023-06-11 22:00:31', 299.99, 1, 3, 54, 7);
INSERT INTO `order` VALUES (336, 1, '2023-06-11 22:04:06', 299.99, 1, 3, 54, 3);
INSERT INTO `order` VALUES (337, 1, '2023-06-11 22:04:08', 299.99, 1, 3, 54, 3);
INSERT INTO `order` VALUES (338, 1, '2023-06-11 22:04:10', 399.99, 1, 4, 54, 4);
INSERT INTO `order` VALUES (339, 1, '2023-06-11 22:04:12', 399.99, 1, 4, 54, 4);
INSERT INTO `order` VALUES (340, 0, '2023-06-11 22:23:18', 199.99, 1, 2, 45, 2);
INSERT INTO `order` VALUES (341, 0, '2023-06-11 23:05:04', 299.99, 1, 3, 54, 3);
INSERT INTO `order` VALUES (342, 0, '2023-06-11 23:05:05', 399.99, 1, 4, 54, 4);
INSERT INTO `order` VALUES (343, 0, '2023-06-11 23:05:08', 199.99, 1, 2, 54, 6);
INSERT INTO `order` VALUES (344, 0, '2023-06-11 23:05:10', 299.99, 1, 3, 54, 7);
INSERT INTO `order` VALUES (345, 1, '2023-06-12 09:38:07', 299.99, 1, 3, 45, 3);
INSERT INTO `order` VALUES (346, 0, '2023-06-12 09:38:16', 299.99, 1, 3, 45, 3);
INSERT INTO `order` VALUES (347, 0, '2023-06-12 15:44:15', 299.99, 1, 3, 54, 3);
INSERT INTO `order` VALUES (348, 0, '2023-06-12 16:11:06', 299.99, 1, 3, 45, 3);

-- ----------------------------
-- Table structure for profit
-- ----------------------------
DROP TABLE IF EXISTS `profit`;
CREATE TABLE `profit`  (
  `dId` int(0) NOT NULL COMMENT '订单ID',
  `profit` double(5, 2) NOT NULL COMMENT ' 平台从该笔交易中所得收益'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of profit
-- ----------------------------
INSERT INTO `profit` VALUES (332, 4.00);
INSERT INTO `profit` VALUES (333, 4.00);
INSERT INTO `profit` VALUES (334, 4.00);
INSERT INTO `profit` VALUES (335, 6.00);
INSERT INTO `profit` VALUES (336, 6.00);
INSERT INTO `profit` VALUES (337, 6.00);
INSERT INTO `profit` VALUES (338, 8.00);
INSERT INTO `profit` VALUES (339, 8.00);
INSERT INTO `profit` VALUES (1, 1.00);
INSERT INTO `profit` VALUES (3, 1.00);
INSERT INTO `profit` VALUES (5, 1.00);
INSERT INTO `profit` VALUES (7, 1.10);
INSERT INTO `profit` VALUES (9, 1.10);
INSERT INTO `profit` VALUES (11, 0.02);
INSERT INTO `profit` VALUES (13, 0.02);
INSERT INTO `profit` VALUES (15, 0.02);
INSERT INTO `profit` VALUES (17, 0.10);
INSERT INTO `profit` VALUES (19, 0.10);
INSERT INTO `profit` VALUES (21, 0.05);
INSERT INTO `profit` VALUES (23, 0.05);
INSERT INTO `profit` VALUES (25, 0.05);
INSERT INTO `profit` VALUES (27, 0.20);
INSERT INTO `profit` VALUES (29, 0.20);
INSERT INTO `profit` VALUES (31, 0.09);
INSERT INTO `profit` VALUES (33, 0.09);
INSERT INTO `profit` VALUES (35, 0.09);
INSERT INTO `profit` VALUES (37, 0.32);
INSERT INTO `profit` VALUES (39, 0.32);
INSERT INTO `profit` VALUES (41, 0.35);
INSERT INTO `profit` VALUES (43, 0.35);
INSERT INTO `profit` VALUES (45, 0.35);
INSERT INTO `profit` VALUES (47, 0.88);
INSERT INTO `profit` VALUES (49, 0.88);
INSERT INTO `profit` VALUES (51, 1.00);
INSERT INTO `profit` VALUES (53, 1.00);
INSERT INTO `profit` VALUES (55, 1.00);
INSERT INTO `profit` VALUES (57, 1.10);
INSERT INTO `profit` VALUES (59, 1.10);
INSERT INTO `profit` VALUES (61, 0.02);
INSERT INTO `profit` VALUES (63, 0.02);
INSERT INTO `profit` VALUES (65, 0.02);
INSERT INTO `profit` VALUES (67, 0.10);
INSERT INTO `profit` VALUES (69, 0.10);
INSERT INTO `profit` VALUES (71, 0.05);
INSERT INTO `profit` VALUES (73, 0.05);
INSERT INTO `profit` VALUES (75, 0.05);
INSERT INTO `profit` VALUES (77, 0.20);
INSERT INTO `profit` VALUES (79, 0.20);
INSERT INTO `profit` VALUES (81, 0.09);
INSERT INTO `profit` VALUES (83, 0.09);
INSERT INTO `profit` VALUES (85, 0.09);
INSERT INTO `profit` VALUES (87, 0.32);
INSERT INTO `profit` VALUES (89, 0.32);
INSERT INTO `profit` VALUES (91, 0.35);
INSERT INTO `profit` VALUES (93, 0.35);
INSERT INTO `profit` VALUES (97, 0.88);
INSERT INTO `profit` VALUES (99, 0.88);
INSERT INTO `profit` VALUES (101, 1.00);
INSERT INTO `profit` VALUES (103, 1.00);
INSERT INTO `profit` VALUES (105, 1.00);
INSERT INTO `profit` VALUES (107, 1.10);
INSERT INTO `profit` VALUES (109, 1.10);
INSERT INTO `profit` VALUES (111, 0.02);
INSERT INTO `profit` VALUES (113, 0.02);
INSERT INTO `profit` VALUES (115, 0.02);
INSERT INTO `profit` VALUES (117, 0.10);
INSERT INTO `profit` VALUES (119, 0.10);
INSERT INTO `profit` VALUES (121, 0.05);
INSERT INTO `profit` VALUES (123, 0.05);
INSERT INTO `profit` VALUES (125, 0.05);
INSERT INTO `profit` VALUES (127, 0.20);
INSERT INTO `profit` VALUES (129, 0.20);
INSERT INTO `profit` VALUES (131, 0.09);
INSERT INTO `profit` VALUES (133, 0.09);
INSERT INTO `profit` VALUES (135, 0.09);
INSERT INTO `profit` VALUES (137, 0.32);
INSERT INTO `profit` VALUES (139, 0.32);
INSERT INTO `profit` VALUES (141, 0.35);
INSERT INTO `profit` VALUES (143, 0.35);
INSERT INTO `profit` VALUES (145, 0.35);
INSERT INTO `profit` VALUES (147, 0.88);
INSERT INTO `profit` VALUES (149, 0.88);
INSERT INTO `profit` VALUES (151, 1.00);
INSERT INTO `profit` VALUES (153, 1.98);
INSERT INTO `profit` VALUES (155, 1.00);
INSERT INTO `profit` VALUES (157, 1.10);
INSERT INTO `profit` VALUES (159, 1.10);
INSERT INTO `profit` VALUES (161, 0.02);
INSERT INTO `profit` VALUES (163, 0.02);
INSERT INTO `profit` VALUES (165, 0.02);
INSERT INTO `profit` VALUES (167, 0.10);
INSERT INTO `profit` VALUES (169, 0.10);
INSERT INTO `profit` VALUES (171, 0.05);
INSERT INTO `profit` VALUES (173, 0.05);
INSERT INTO `profit` VALUES (175, 0.05);
INSERT INTO `profit` VALUES (177, 0.20);
INSERT INTO `profit` VALUES (179, 0.20);
INSERT INTO `profit` VALUES (181, 0.09);
INSERT INTO `profit` VALUES (183, 0.09);
INSERT INTO `profit` VALUES (185, 0.09);
INSERT INTO `profit` VALUES (187, 0.32);
INSERT INTO `profit` VALUES (189, 0.32);
INSERT INTO `profit` VALUES (191, 0.35);
INSERT INTO `profit` VALUES (193, 0.35);
INSERT INTO `profit` VALUES (195, 0.35);
INSERT INTO `profit` VALUES (197, 0.88);
INSERT INTO `profit` VALUES (199, 0.88);
INSERT INTO `profit` VALUES (201, 0.75);
INSERT INTO `profit` VALUES (203, 1.00);
INSERT INTO `profit` VALUES (205, 1.00);
INSERT INTO `profit` VALUES (207, 1.10);
INSERT INTO `profit` VALUES (209, 1.10);
INSERT INTO `profit` VALUES (211, 0.02);
INSERT INTO `profit` VALUES (213, 0.02);
INSERT INTO `profit` VALUES (215, 0.02);
INSERT INTO `profit` VALUES (217, 0.10);
INSERT INTO `profit` VALUES (219, 0.10);
INSERT INTO `profit` VALUES (221, 0.05);
INSERT INTO `profit` VALUES (223, 0.05);
INSERT INTO `profit` VALUES (225, 0.05);
INSERT INTO `profit` VALUES (227, 0.20);
INSERT INTO `profit` VALUES (229, 0.20);
INSERT INTO `profit` VALUES (231, 0.09);
INSERT INTO `profit` VALUES (233, 0.09);
INSERT INTO `profit` VALUES (235, 0.09);
INSERT INTO `profit` VALUES (236, 1.00);
INSERT INTO `profit` VALUES (238, 1.00);
INSERT INTO `profit` VALUES (240, 1.00);
INSERT INTO `profit` VALUES (242, 1.10);
INSERT INTO `profit` VALUES (244, 1.10);
INSERT INTO `profit` VALUES (246, 0.02);
INSERT INTO `profit` VALUES (248, 0.02);
INSERT INTO `profit` VALUES (250, 0.02);
INSERT INTO `profit` VALUES (252, 0.10);
INSERT INTO `profit` VALUES (254, 0.10);
INSERT INTO `profit` VALUES (256, 0.05);
INSERT INTO `profit` VALUES (258, 0.05);
INSERT INTO `profit` VALUES (260, 0.05);
INSERT INTO `profit` VALUES (262, 0.20);
INSERT INTO `profit` VALUES (264, 0.20);
INSERT INTO `profit` VALUES (266, 0.09);
INSERT INTO `profit` VALUES (268, 0.09);
INSERT INTO `profit` VALUES (270, 0.09);
INSERT INTO `profit` VALUES (271, 1.00);
INSERT INTO `profit` VALUES (273, 1.00);
INSERT INTO `profit` VALUES (275, 1.00);
INSERT INTO `profit` VALUES (277, 1.10);
INSERT INTO `profit` VALUES (279, 1.10);
INSERT INTO `profit` VALUES (281, 0.02);
INSERT INTO `profit` VALUES (283, 0.02);
INSERT INTO `profit` VALUES (285, 0.02);
INSERT INTO `profit` VALUES (287, 0.10);
INSERT INTO `profit` VALUES (289, 0.10);
INSERT INTO `profit` VALUES (291, 0.05);
INSERT INTO `profit` VALUES (293, 0.05);
INSERT INTO `profit` VALUES (295, 0.05);
INSERT INTO `profit` VALUES (297, 0.20);
INSERT INTO `profit` VALUES (299, 0.20);
INSERT INTO `profit` VALUES (301, 0.09);
INSERT INTO `profit` VALUES (303, 0.09);
INSERT INTO `profit` VALUES (305, 0.09);
INSERT INTO `profit` VALUES (306, 1.00);
INSERT INTO `profit` VALUES (308, 1.00);
INSERT INTO `profit` VALUES (310, 1.00);
INSERT INTO `profit` VALUES (312, 1.10);
INSERT INTO `profit` VALUES (314, 1.10);
INSERT INTO `profit` VALUES (316, 0.02);
INSERT INTO `profit` VALUES (317, 1.00);
INSERT INTO `profit` VALUES (319, 1.00);
INSERT INTO `profit` VALUES (321, 1.00);
INSERT INTO `profit` VALUES (323, 1.10);
INSERT INTO `profit` VALUES (325, 1.10);
INSERT INTO `profit` VALUES (327, 0.02);
INSERT INTO `profit` VALUES (328, 2.00);
INSERT INTO `profit` VALUES (330, 2.00);
INSERT INTO `profit` VALUES (332, 2.00);
INSERT INTO `profit` VALUES (333, 2.00);
INSERT INTO `profit` VALUES (334, 2.00);
INSERT INTO `profit` VALUES (335, 3.00);
INSERT INTO `profit` VALUES (336, 3.00);
INSERT INTO `profit` VALUES (337, 3.00);
INSERT INTO `profit` VALUES (338, 4.00);
INSERT INTO `profit` VALUES (339, 4.00);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uId` int(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `uPhone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户联系方式',
  `uNickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `uEmail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户邮箱',
  `uPassword` varchar(78) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码',
  `uIsVerify` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否进行了实名验证',
  `uAddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户校园的地址',
  `uLevel` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户评价等级',
  PRIMARY KEY (`uId`, `uEmail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '70853941956', 'EUzm68ki', 'EUzm68ki@example.com', '9fgB2GeK', 1, '科技大A10栋168', 2);
INSERT INTO `user` VALUES (2, '63481902795', 'N4rxqJkX', 'N4rxqJkX@example.com', 'K3ShwAdE', 1, '科技大A10栋133', 2);
INSERT INTO `user` VALUES (3, '41908576327', 'xJ81CPjb', 'xJ81CPjb@example.com', 'aM93r8vk', 1, '科技大A10栋206', 4);
INSERT INTO `user` VALUES (4, '57189640293', 'Gy5URhfB', 'Gy5URhfB@example.com', 'oz5up0kK', 1, '科技大A10栋267', 2);
INSERT INTO `user` VALUES (5, '53014829776', 's0QAr4uG', 's0QAr4uG@example.com', 'Ce81dK2x', 1, '科技大A10栋299', 2);
INSERT INTO `user` VALUES (6, '46903812572', 'cHKvNl50', 'cHKvNl50@example.com', 'fu4erw9x', 1, '科技大B11栋212', 4);
INSERT INTO `user` VALUES (7, '28107954603', 'xmnT4DFv', 'xmnT4DFv@example.com', 'OhS7xUyp', 1, '科技大B11栋403', 3);
INSERT INTO `user` VALUES (8, '13240756890', 'w1R8Cjhi', 'w1R8Cjhi@example.com', '6Lj3zmZf', 0, '科技大B11栋428', 4);
INSERT INTO `user` VALUES (9, '03594876291', 'WkTHjPqe', 'WkTHjPqe@example.com', 'vJ2y7zrm', 0, '科技大B11栋244', 2);
INSERT INTO `user` VALUES (10, '92357046128', 'p6AqwaV2', 'p6AqwaV2@example.com', 'y3xTFogz', 1, '科技大B11栋420', 5);
INSERT INTO `user` VALUES (11, '13720589640', 'J9OPF27h', 'J9OPF27h@example.com', 'z83cK1GT', 0, '科技大C12栋336', 2);
INSERT INTO `user` VALUES (12, '49068753182', 'OBz8uYHv', 'OBz8uYHv@example.com', 'b78Kt6Lw', 0, '科技大C12栋228', 1);
INSERT INTO `user` VALUES (13, '05167342897', 'T9w4RGMN', 'T9w4RGMN@example.com', 'U7GhL1Fm', 0, '科技大C12栋312', 3);
INSERT INTO `user` VALUES (14, '02613987504', 'j8PNfuLc', 'j8PNfuLc@example.com', '0o1qtI4X', 0, '科技大C12栋316', 3);
INSERT INTO `user` VALUES (15, '73912054628', 'sEgwLr2M', 'sEgwLr2M@example.com', 'f2KUx1pJ', 0, '科技大C12栋500', 1);
INSERT INTO `user` VALUES (16, '20973415685', 'r8p0gXYb', 'r8p0gXYb@example.com', 'wYzl5Hc7', 1, '科技大D14栋140', 1);
INSERT INTO `user` VALUES (17, '05841632779', 'Bko3qMcL', 'Bko3qMcL@example.com', 'mHjq4nZE', 1, '科技大I9栋526', 3);
INSERT INTO `user` VALUES (18, '30426178509', 'xBK1ZgYO', 'xBK1ZgYO@example.com', 't23ilN8y', 0, '科技大D14栋513', 1);
INSERT INTO `user` VALUES (19, '80763194250', 'wpbJiZ5Y', 'wpbJiZ5Y@example.com', 'vlVRaL2Q', 0, '科技大D14栋103', 3);
INSERT INTO `user` VALUES (20, '19503846257', 'u5XwLQGm', 'u5XwLQGm@example.com', 'Us3G6TYP', 0, '科技大D14栋495', 5);
INSERT INTO `user` VALUES (21, '46082795314', 'TxbfzR1j', 'TxbfzR1j@example.com', 'GKUcH0jI', 1, '科技大E15栋176', 5);
INSERT INTO `user` VALUES (22, '93160875442', 'sWl6Bkbj', 'sWl6Bkbj@example.com', 'CiHd69fl', 1, '科技大E15栋117', 5);
INSERT INTO `user` VALUES (23, '21036759874', 'WkDqXZ2h', 'WkDqXZ2h@example.com', 'GKUH3cNa', 1, '科技大E15栋238', 1);
INSERT INTO `user` VALUES (24, '78534061279', 'I6jzQf8N', 'I6jzQf8N@example.com', 'Jl89EbV4', 0, '科技大E15栋213', 2);
INSERT INTO `user` VALUES (25, '49062371856', 'A1RfKLMn', 'A1RfKLMn@example.com', 'iSDwV5Um', 1, '科技大E15栋409', 1);
INSERT INTO `user` VALUES (26, '72015986435', 'TIaiP8qu', 'TIaiP8qu@example.com', '34BfihbZ', 1, '科技大F16栋500', 4);
INSERT INTO `user` VALUES (27, '09357842156', 'PjphMX7c', 'PjphMX7c@example.com', 'V9aFtAr2', 0, '科技大F16栋503', 5);
INSERT INTO `user` VALUES (28, '12830745695', 'bydBhXJy', 'bydBhXJy@example.com', '9lVLZUqF', 1, '科技大F16栋415', 4);
INSERT INTO `user` VALUES (29, '56473902821', 'rZDgjK9f', 'rZDgjK9f@example.com', 'itbxU2Ll', 0, '科技大F16栋405', 1);
INSERT INTO `user` VALUES (30, '38962751084', 'ba80I3nr', 'ba80I3nr@example.com', 'Aprf9Vs3', 1, '科技大F16栋355', 4);
INSERT INTO `user` VALUES (31, '76835029114', 'XvDEg41W', 'XvDEg41W@example.com', 'V2GWbj7Y', 0, '科技大G17栋413', 5);
INSERT INTO `user` VALUES (32, '90438125667', 'lMcuoxLG', 'lMcuoxLG@example.com', 'kmiJF5th', 0, '科技大G17栋109', 5);
INSERT INTO `user` VALUES (33, '30278491650', 'IOVuvQkr', 'IOVuvQkr@example.com', 'ELTdU58i', 0, '科技大G17栋305', 1);
INSERT INTO `user` VALUES (34, '27654901873', '0WBig8AP', '0WBig8AP@example.com', '43DboJxv', 0, '科技大G17栋438', 1);
INSERT INTO `user` VALUES (35, '09762385164', '4Jhc81LZ', '4Jhc81LZ@example.com', 'F8mV1v3Z', 1, '科技大G17栋326', 1);
INSERT INTO `user` VALUES (36, '69731084215', 'csYZHuO2', 'csYZHuO2@example.com', 'PfMt9zGb', 1, '科技大H18栋105', 5);
INSERT INTO `user` VALUES (37, '48126730958', 'ZJszlhrL', 'ZJszlhrL@example.com', 'fVLtTxjI', 1, '科技大H18栋322', 5);
INSERT INTO `user` VALUES (38, '62358740119', '24gxsjta', '24gxsjta@example.com', 'vBw1KfDb', 1, '科技大H18栋168', 3);
INSERT INTO `user` VALUES (39, '85012463957', 'hUPZEkzF', 'hUPZEkzF@example.com', 'R3odmHJf', 1, '科技大H18栋197', 1);
INSERT INTO `user` VALUES (40, '60531847219', 'rPiwdg7j', 'rPiwdg7j@example.com', 'b0M9Jako', 0, '科技大H18栋538', 4);
INSERT INTO `user` VALUES (44, '94701382650', '8eOMVAIu', '8eOMVAIu@example.com', 'zQtKme0s', 1, '科技大J20栋435', 2);
INSERT INTO `user` VALUES (45, '19873781066', 'NingNing0111', '2043393364@qq.com', '$2a$10$xGa9GX8QYqb0Bo.lTmxLiuNLmgeYG0F74ZgMdcAUVFQeXNmjqjuje', 0, '九公220', 1);
INSERT INTO `user` VALUES (46, '94701382650', '8eOMVAIu', '8eOMVAIu@example.com', 'zQtKme0s', 1, '科技大J20栋435', 2);
INSERT INTO `user` VALUES (52, '94701382650', '8eOMVAIu', '8eOMVAIu@example.com', 'zQtKme0s', 1, '科技大J20栋435', 2);
INSERT INTO `user` VALUES (54, '19873781066', 'admin', 'mnzdna@163.com', '$2a$10$fZ5e7ZwDdBIQxmJYh9zwI.pUHCK64rFPKrxJAzHDSEjtgUfSQAxmO', 0, '九公220', 0);
INSERT INTO `user` VALUES (55, '94701382650', '8eOMVAIu', '8eOMVAIu@example.com', 'zQtKme0s', 1, '科技大J20栋435', 2);
INSERT INTO `user` VALUES (56, '94701382650', '8eOMVAIu', '8eOMVAIu@example.com', 'zQtKme0s', 1, '科技大J20栋435', 2);
INSERT INTO `user` VALUES (57, '94701382650', '8eOMVAIu', '8eOMVAIu@example.com', 'zQtKme0s', 1, '科技大J20栋435', 2);

-- ----------------------------
-- Function structure for fun_init_profit
-- ----------------------------
DROP FUNCTION IF EXISTS `fun_init_profit`;
delimiter ;;
CREATE FUNCTION `fun_init_profit`()
 RETURNS varchar(50) CHARSET utf8mb4
  DETERMINISTIC
BEGIN
    DECLARE done INT DEFAULT 0;  
    DECLARE order_id INT;            
    DECLARE order_status TINYINT;    
    DECLARE order_amount DOUBLE;     
    DECLARE profit1 DOUBLE;          
    DECLARE factor FLOAT DEFAULT 0.01;
    DECLARE cur CURSOR FOR SELECT `order`.dId,`order`.dStatue,`order`.dAmount FROM `order` WHERE `order`.dStatue = 1;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
		FETCH cur INTO order_id, order_status, order_amount; 
		WHILE done != 1 DO	
       IF order_status = 1 THEN
            SET profit1 = round(order_amount * factor,2);
            INSERT INTO profit VALUES (order_id, profit1);
       END IF;
	 FETCH cur INTO order_id, order_status, order_amount; 
    END WHILE;
    CLOSE cur;  
    RETURN '初始化完成';
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_sLevel_by_uId
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_sLevel_by_uId`;
delimiter ;;
CREATE PROCEDURE `get_sLevel_by_uId`(IN `in_uId` int)
BEGIN
	select `goods`.uId,floor(avg(pSellerOfLevel)) as avgSellerLevel
	from `comment`,`goods`
	where `comment`.gId in (
		select `goods`.gId
		from `goods`
		where `goods`.uId = `in_uId`) and `goods`.gId = `comment`.gId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_user_by_token
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_user_by_token`;
delimiter ;;
CREATE PROCEDURE `get_user_by_token`(IN `in_token` varchar(255))
BEGIN
	  select `user`.*
		from `user`,`currentuser`
		where `user`.uId = `currentuser`.uId AND `currentuser`.token = `in_token`;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table comment
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_update_goods_level`;
delimiter ;;
CREATE TRIGGER `trg_update_goods_level` AFTER INSERT ON `comment` FOR EACH ROW BEGIN 
     UPDATE `goods` SET gLevel = FLOOR((
		     SELECT AVG(pGoodsOfLevel) FROM `comment` 
			      WHERE `comment`.gId = NEW.gId))
     WHERE gId=NEW.gId;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table comment
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_update_host_level`;
delimiter ;;
CREATE TRIGGER `trg_update_host_level` AFTER INSERT ON `comment` FOR EACH ROW BEGIN
    UPDATE `user` SET uLevel = FLOOR((
      SELECT AVG(pSellerOfLevel) FROM `comment` WHERE pId = NEW.pId))
      WHERE uId = (
      SELECT g.uId FROM `goods` g JOIN `comment` c WHERE g.gId=c.gId AND c.pId=NEW.pId);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table goods
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_delete_comments`;
delimiter ;;
CREATE TRIGGER `trg_delete_comments` AFTER DELETE ON `goods` FOR EACH ROW begin
  delete from `comment` where `comment`.gId = old.gId;
	
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table order
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_calc_profit1`;
delimiter ;;
CREATE TRIGGER `trg_calc_profit1` AFTER INSERT ON `order` FOR EACH ROW BEGIN
     IF NEW.dStatue = 1 THEN
          INSERT INTO profit (dId,profit) VALUES (NEW.dId,round(NEW.dAmount * 0.01,2));
END IF;
     
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table order
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_calc_profit2`;
delimiter ;;
CREATE TRIGGER `trg_calc_profit2` AFTER UPDATE ON `order` FOR EACH ROW BEGIN
     IF NEW.dStatue = 1 AND OLD.dStatue = 0 THEN
          INSERT INTO profit (dId,profit) VALUES (NEW.dId,round(NEW.dAmount * 0.01,2));
END IF;
     
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table order
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_check_inventory`;
delimiter ;;
CREATE TRIGGER `trg_check_inventory` BEFORE INSERT ON `order` FOR EACH ROW BEGIN
    DECLARE vCount INT;
    
    SELECT gCount INTO vCount FROM `goods` WHERE gId = NEW.gId;
    
-- 订单的商品数量大于商品的库存量时，触发器会使用 SIGNAL 语句来返回 SQLSTATE '45000'，表示自定义的异常状态，同时设置 MESSAGE_TEXT 为 '商品库存不足'，表示异常信息
		IF NEW.dCount > vCount THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = '商品库存不足';
    ELSE
        UPDATE `goods` SET gCount = vCount - NEW.dCount WHERE gId = NEW.gId;
    END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
