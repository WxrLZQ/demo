/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : ssh

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 30/12/2019 17:03:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_title` varchar(100) DEFAULT NULL,
  `article_time` varchar(50) DEFAULT NULL,
  `article_content` text,
  `article_pic` varchar(100) DEFAULT NULL,
  `article_desc` varchar(255) DEFAULT NULL,
  `article_cid` int(11) DEFAULT NULL,
  `as` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`article_id`),
  KEY `FKgbujg8jnpactfx004udyx69y6` (`article_cid`),
  CONSTRAINT `FKgbujg8jnpactfx004udyx69y6` FOREIGN KEY (`article_cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article` VALUES (4, 'WXR', '2019-12-15 17:06:48', '<p><br/></p><h1 style=\"border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;text-align:center;margin:0px 0px 20px;\" class=\"ue_t\">[此处键入文章标题]</h1><p><img src=\"http://img.baidu.com/hi/youa/y_0034.gif\" width=\"300\" height=\"200\"/>图文混排方法</p><p>1. 图片居左，文字围绕图片排版</p><p>方法：在文字前面插入图片，设置居左对齐，然后即可在右边输入多行文本</p><p><br/></p><p>2. 图片居右，文字围绕图片排版</p><p>方法：在文字前面插入图片，设置居右对齐，然后即可在左边输入多行文本</p><p><br/></p><p>3. 图片居中环绕排版</p><p>方法：亲，这个真心没有办法。。。</p><p><br/></p><p><br/></p><p><img src=\"http://img.baidu.com/hi/youa/y_0040.gif\" width=\"300\" height=\"300\"/></p><p>还有没有什么其他的环绕方式呢？这里是居右环绕</p><p><br/></p><p>欢迎大家多多尝试，为UEditor提供更多高质量模板！</p><p><br/></p><p>占位</p><p><br/></p><p>占位</p><p><br/></p><p>占位</p><p><br/></p><p>占位</p><p><br/></p><p>占位</p><p><br/></p><p><br/></p><p><br/></p>', '428a2ccc1ed5445fbddc594b1f56246f.jpg', '[此处键入文章标题]图文混排方法1. 图片居左，文字围绕图片排版方法：在文字前面插入图片，设置居左对齐，然后即可在右边输入多行文本2. 图片居右，文字围绕图片排版方法：在文字前面插入图片，设置居右对齐，然后即可在左边输入多行文本3. 图片居中环绕排版方法：亲，这个真心没有办法。。。还有没有什么其他的...', 5, NULL);
INSERT INTO `article` VALUES (5, '-=', '2019-12-15 17:07:16', '<h1 style=\"border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;margin:0px 0px 10px;\"><span style=\"color:#e36c09;\" class=\"ue_t\">[此处键入简历标题]</span></h1><p><span style=\"color:#e36c09;\"><br/></span></p><table width=\"100%\" border=\"1\" style=\"border-collapse:collapse;\"><tbody><tr class=\"firstRow\"><td width=\"200\" style=\"text-align:center;\" class=\"ue_t\">【此处插入照片】</td><td><p><br/></p><p>联系电话：<span class=\"ue_t\">[键入您的电话]</span></p><p><br/></p><p>电子邮件：<span class=\"ue_t\">[键入您的电子邮件地址]</span></p><p><br/></p><p>家庭住址：<span class=\"ue_t\">[键入您的地址]</span></p><p><br/></p></td></tr></tbody></table><h3><span style=\"color:#e36c09;font-size:20px;\">目标职位</span></h3><p style=\"text-indent:2em;\" class=\"ue_t\">[此处键入您的期望职位]</p><h3><span style=\"color:#e36c09;font-size:20px;\">学历</span></h3><p><span style=\"display:none;line-height:0px;\">﻿</span></p><ol style=\"list-style-type: decimal;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入学校名称] </span> <span class=\"ue_t\">[键入所学专业]</span> <span class=\"ue_t\">[键入所获学位]</span></p></li><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入学校名称]</span> <span class=\"ue_t\">[键入所学专业]</span> <span class=\"ue_t\">[键入所获学位]</span></p></li></ol><h3><span style=\"color:#e36c09;font-size:20px;\" class=\"ue_t\">工作经验</span></h3><ol style=\"list-style-type: decimal;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入公司名称]</span> <span class=\"ue_t\">[键入职位名称]</span></p></li><ol style=\"list-style-type: lower-alpha;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入负责项目]</span> <span class=\"ue_t\">[键入项目简介]</span></p></li><li><p><span class=\"ue_t\">[键入负责项目]</span> <span class=\"ue_t\">[键入项目简介]</span></p></li></ol><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入公司名称]</span> <span class=\"ue_t\">[键入职位名称]</span></p></li><ol style=\"list-style-type: lower-alpha;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入负责项目]</span> <span class=\"ue_t\">[键入项目简介]</span></p></li></ol></ol><p><span style=\"color:#e36c09;font-size:20px;\">掌握技能</span></p><p style=\"text-indent:2em;\">&nbsp;<span class=\"ue_t\">[这里可以键入您所掌握的技能]</span><br/></p><p><br/></p>', 'f7b773c3e4834a62a67b67a374294080.jpeg', '[此处键入简历标题]【此处插入照片】联系电话：[键入您的电话]电子邮件：[键入您的电子邮件地址]家庭住址：[键入您的地址]目标职位[此处键入您的期望职位]学历﻿[键入起止时间] [键入学校名称]  [键入所学专业] [键入所获学位][键入起止时间] [键入学校名称] [键入所学专业] [键入所获学位...', 8, NULL);
INSERT INTO `article` VALUES (6, 'CCC', '2019-12-15 17:07:34', '<h1 style=\"border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;margin:0px 0px 10px;\"><span style=\"color:#e36c09;\" class=\"ue_t\">[此处键入简历标题]</span></h1><p><span style=\"color:#e36c09;\"><br/></span></p><table width=\"100%\" border=\"1\" style=\"border-collapse:collapse;\"><tbody><tr class=\"firstRow\"><td width=\"200\" style=\"text-align:center;\" class=\"ue_t\">【此处插入照片】</td><td><p><br/></p><p>联系电话：<span class=\"ue_t\">[键入您的电话]</span></p><p><br/></p><p>电子邮件：<span class=\"ue_t\">[键入您的电子邮件地址]</span></p><p><br/></p><p>家庭住址：<span class=\"ue_t\">[键入您的地址]</span></p><p><br/></p></td></tr></tbody></table><h3><span style=\"color:#e36c09;font-size:20px;\">目标职位</span></h3><p style=\"text-indent:2em;\" class=\"ue_t\">[此处键入您的期望职位]</p><h3><span style=\"color:#e36c09;font-size:20px;\">学历</span></h3><p><span style=\"display:none;line-height:0px;\">﻿</span></p><ol style=\"list-style-type: decimal;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入学校名称] </span> <span class=\"ue_t\">[键入所学专业]</span> <span class=\"ue_t\">[键入所获学位]</span></p></li><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入学校名称]</span> <span class=\"ue_t\">[键入所学专业]</span> <span class=\"ue_t\">[键入所获学位]</span></p></li></ol><h3><span style=\"color:#e36c09;font-size:20px;\" class=\"ue_t\">工作经验</span></h3><ol style=\"list-style-type: decimal;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入公司名称]</span> <span class=\"ue_t\">[键入职位名称]</span></p></li><ol style=\"list-style-type: lower-alpha;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入负责项目]</span> <span class=\"ue_t\">[键入项目简介]</span></p></li><li><p><span class=\"ue_t\">[键入负责项目]</span> <span class=\"ue_t\">[键入项目简介]</span></p></li></ol><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入公司名称]</span> <span class=\"ue_t\">[键入职位名称]</span></p></li><ol style=\"list-style-type: lower-alpha;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入负责项目]</span> <span class=\"ue_t\">[键入项目简介]</span></p></li></ol></ol><p><span style=\"color:#e36c09;font-size:20px;\">掌握技能</span></p><p style=\"text-indent:2em;\">&nbsp;<span class=\"ue_t\">[这里可以键入您所掌握的技能]</span><br/></p><p><br/></p>', 'e038dc019e344c1398df4f0240855a2e.jpg', '[此处键入简历标题]【此处插入照片】联系电话：[键入您的电话]电子邮件：[键入您的电子邮件地址]家庭住址：[键入您的地址]目标职位[此处键入您的期望职位]学历﻿[键入起止时间] [键入学校名称]  [键入所学专业] [键入所获学位][键入起止时间] [键入学校名称] [键入所学专业] [键入所获学位...', 10, NULL);
INSERT INTO `article` VALUES (7, 'AAA', '2019-12-15 17:07:50', '<h2 style=\"border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;margin:0px 0px 10px;text-align:center;\" class=\"ue_t\">[键入文章标题]</h2><p><strong><span style=\"font-size:12px;\">摘要</span></strong><span style=\"font-size:12px;\" class=\"ue_t\">：这里可以输入很长很长很长很长很长很长很长很长很差的摘要</span></p><p style=\"line-height:1.5em;\"><strong>标题 1</strong></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\" class=\"ue_t\">这里可以输入很多内容，可以图文混排，可以有列表等。</span></p><p style=\"line-height:1.5em;\"><strong>标题 2</strong></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\" class=\"ue_t\">来个列表瞅瞅：</span></p><ol style=\"list-style-type: lower-alpha;\" class=\" list-paddingleft-2\"><li><p class=\"ue_t\">列表 1</p></li><li><p class=\"ue_t\">列表 2</p></li><ol style=\"list-style-type: lower-roman;\" class=\" list-paddingleft-2\"><li><p class=\"ue_t\">多级列表 1</p></li><li><p class=\"ue_t\">多级列表 2</p></li></ol><li><p class=\"ue_t\">列表 3<br/></p></li></ol><p style=\"line-height:1.5em;\"><strong>标题 3</strong></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\" class=\"ue_t\">来个文字图文混排的</span></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\" class=\"ue_t\">这里可以多行</span></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\" class=\"ue_t\">右边是图片</span></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\" class=\"ue_t\">绝对没有问题的，不信你也可以试试看</span></p><p><br/></p><p><br/></p>', 'aea56801ec2e4af1b16bdb7aaa08d1d3.jpeg', '[键入文章标题]摘要：这里可以输入很长很长很长很长很长很长很长很长很差的摘要标题 1这里可以输入很多内容，可以图文混排，可以有列表等。标题 2来个列表瞅瞅：列表 1列表 2多级列表 1多级列表 2列表 3标题 3来个文字图文混排的这里可以多行右边是图片绝对没有问题的，不信你也可以试试看...', 9, NULL);
INSERT INTO `article` VALUES (8, '复仇者联盟', '2019-12-28 13:00:00', '<p>英雄。。。。。。。。。。。。。。。。go</p>', '3f20141753e346339edafe4598efef95.jpeg', '英雄。。。。。。。。。。。。。。。。go...', 11, NULL);
COMMIT;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` int(11) NOT NULL,
  `cname` varchar(50) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES (1, 'java', 0);
INSERT INTO `category` VALUES (2, 'python', 0);
INSERT INTO `category` VALUES (3, 'web', 0);
INSERT INTO `category` VALUES (4, 'sql', 0);
INSERT INTO `category` VALUES (5, 'web服务器', 1);
INSERT INTO `category` VALUES (6, 'css', 3);
INSERT INTO `category` VALUES (7, 'html', 3);
INSERT INTO `category` VALUES (8, 'js', 3);
INSERT INTO `category` VALUES (9, 'mysql', 4);
INSERT INTO `category` VALUES (10, 'c#', 2);
INSERT INTO `category` VALUES (11, 'c++', 2);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'root', '123456');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
