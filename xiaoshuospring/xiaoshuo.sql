/*
Navicat MySQL Data Transfer

Source Server         : hidm
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : xiaoshuo

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2020-01-31 18:51:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) NOT NULL,
  `userPw` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catelog_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `zuozhe` varchar(50) NOT NULL,
  `dianquan` int(11) NOT NULL,
  `jieshao` varchar(500) NOT NULL,
  `fujian` varchar(100) NOT NULL,
  `fabushijian` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '1', '很纯很暧昧', '杨光', '20', '都市言情很纯很暧昧,都市言情很纯很暧昧。很纯很暧昧都市言情。', '很纯很暧昧.txt', '2019-12-20 17:00:00');
INSERT INTO `book` VALUES ('2', '3', '资质通鉴', '司马光', '50', '中国一部编年体通史巨著，它以深邃的历史眼光，全面总结了历朝历代的政治智慧，记录了上起春秋战国，下至宋朝建立之前，总共1362年历史发展的轨迹', '资质通鉴.txt', '2019-12-21 17:00:00');
INSERT INTO `book` VALUES ('3', '4', '足球戏说', '范德彪', '60', '中国一部讲解足球的巨著，从诞生到发展为世界第一大运动，它以深邃的历史眼光，进行全面总结', '足球戏说.txt', '2019-12-21 17:00:00');
INSERT INTO `book` VALUES ('4', '2', '修仙记', '仙道子', '20', '中国一部讲解修仙的奇幻小说，想象奇特，布局宏大', '修仙记.txt', '2019-12-22 17:00:00');
INSERT INTO `book` VALUES ('5', '3', '红楼梦', '曹雪芹', '20', '《红楼梦》，中国古代章回体长篇小说，又名《石头记》等，被列为中国古典四大名著之首，一般认为是清代作家曹雪芹所著。', 'upload/红楼梦.txt', '2020/01/13');
INSERT INTO `book` VALUES ('6', '2', '斗破苍穹', '天蚕土豆', '30', '这里是属于斗气的世界，没有花俏艳丽的魔法，有的，仅仅是繁衍到巅峰的斗气！', 'upload/斗破苍穹.txt', '2020/01/13');
INSERT INTO `book` VALUES ('7', '2', '武动乾坤', '天蚕土豆', '30', '讲述了大炎王朝天都郡炎城青阳镇，落魄的林氏子弟林动在山洞间偶然捡到一块神秘的石符而走上的逆袭之路。', 'upload/武动乾坤.txt', '2020/01/13');
INSERT INTO `book` VALUES ('8', '3', '三国演义', '罗贯中', '20', '元末明初小说家罗贯中创作的长篇章回体历史演义小说。该作品成书后有嘉靖壬午本等多个版本传于世，到了明末清初，毛宗岗对《三国演义》整顿回目、修正文辞、改换诗文。', 'upload/随记.txt', '2020/01/14');
INSERT INTO `book` VALUES ('9', '4', '超级碗', '阿婉', '0', '超级碗超级碗超级碗超级碗超级碗超级碗超级碗超级碗超级碗超级碗超级碗超级碗超级碗超级碗超级碗。', 'upload/超级碗.txt', '2020/01/14');
INSERT INTO `book` VALUES ('10', '3', '聊斋志异', '蒲松龄', '30', '中国成就最高的文言短篇小说集，它不仅集志怪传奇小说之大成，使短篇小说的艺术水平达到空前高度。', 'upload/聊斋志异.txt', '2020/01/14');

-- ----------------------------
-- Table structure for catelog
-- ----------------------------
DROP TABLE IF EXISTS `catelog`;
CREATE TABLE `catelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catelog
-- ----------------------------
INSERT INTO `catelog` VALUES ('1', '都市言情');
INSERT INTO `catelog` VALUES ('2', '玄幻奇侠');
INSERT INTO `catelog` VALUES ('3', '历史名著');
INSERT INTO `catelog` VALUES ('4', '体育百科');

-- ----------------------------
-- Table structure for chongzhi
-- ----------------------------
DROP TABLE IF EXISTS `chongzhi`;
CREATE TABLE `chongzhi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `dianquan` int(11) NOT NULL,
  `fukuanfangshi` varchar(50) NOT NULL,
  `shijian` varchar(50) NOT NULL,
  `zhuangtai` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chongzhi
-- ----------------------------
INSERT INTO `chongzhi` VALUES ('1', '2', '100', '建设银行', '2019-12-31 18:00:00', 'Y');
INSERT INTO `chongzhi` VALUES ('2', '1', '100', '支付宝', '2020-01-14 12:01:06', 'Y');

-- ----------------------------
-- Table structure for gonggao
-- ----------------------------
DROP TABLE IF EXISTS `gonggao`;
CREATE TABLE `gonggao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` varchar(500) NOT NULL,
  `sendtime` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gonggao
-- ----------------------------
INSERT INTO `gonggao` VALUES ('1', '欢迎书友', '欢迎天南海北的书友来到书的海洋，best wish!', '2019-12-01 18:00:00');

-- ----------------------------
-- Table structure for liuyan
-- ----------------------------
DROP TABLE IF EXISTS `liuyan`;
CREATE TABLE `liuyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) NOT NULL,
  `shijian` varchar(50) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `userName` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of liuyan
-- ----------------------------
INSERT INTO `liuyan` VALUES ('1', '修仙记太好看了，疯狂打call', '2019-12-31 18:00:00', '1', '李白');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(50) NOT NULL,
  `loginpw` varchar(50) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `age` int(3) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `dianquan` int(11) NOT NULL,
  `registerTime` varchar(50) NOT NULL,
  `del` varchar(50) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '李白', '123456', '男', '23', '15094074032', '538292323@qq.com', '80', '2019-12-30 17:00:00', 'N');
INSERT INTO `users` VALUES ('2', '宋娇娇', '123456', '女', '21', '15094074742', '538292973@qq.com', '100', '2019-12-31 17:00:00', 'N');

-- ----------------------------
-- Table structure for zhang
-- ----------------------------
DROP TABLE IF EXISTS `zhang`;
CREATE TABLE `zhang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `mingcheng` varchar(50) NOT NULL,
  `neirong` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zhang
-- ----------------------------
INSERT INTO `zhang` VALUES ('1', '2', '卷一', '<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>');
INSERT INTO `zhang` VALUES ('2', '2', '卷二', '<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>');
INSERT INTO `zhang` VALUES ('3', '2', '卷三', '<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>');
INSERT INTO `zhang` VALUES ('4', '2', '卷四', '<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>');
INSERT INTO `zhang` VALUES ('5', '2', '卷五', '<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>');
INSERT INTO `zhang` VALUES ('6', '2', '卷六', '<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>');
INSERT INTO `zhang` VALUES ('7', '2', '卷七', '<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>');
INSERT INTO `zhang` VALUES ('8', '2', '卷八', '<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>\r\n<p>二十三年戊寅，公元前四零三年，初命晋大夫魏斯、赵籍、韩虔为诸侯......</p>');
