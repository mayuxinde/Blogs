/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : project

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2020-01-09 10:34:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `message` varchar(50) NOT NULL,
  `time` varchar(50) NOT NULL,
  `userImageUrl` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message_userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=563 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('536', '1', '马宇欣', '你是谁\r\n', '2020:01:04 21:39:15', '.jpg');
INSERT INTO `message` VALUES ('537', '1', '马宇欣', '数据库', '2020:01:04 21:39:26', '.jpg');
INSERT INTO `message` VALUES ('538', '1', '马宇欣', 'java', '2020:01:04 21:39:35', '.jpg');
INSERT INTO `message` VALUES ('540', '1', '马宇欣', '呦呦呦！！！！！', '2020:01:04 21:58:43', '.jpg');
INSERT INTO `message` VALUES ('542', '1', '马宇欣', '发表内容1', '2020:01:04 22:15:39', '.jpg');
INSERT INTO `message` VALUES ('543', '1', '马宇欣', '发表内容2\r\n', '2020:01:04 22:15:50', '.jpg');
INSERT INTO `message` VALUES ('544', '1', '马宇欣', '发表内容3', '2020:01:04 22:15:57', '.jpg');
INSERT INTO `message` VALUES ('545', '1', '马宇欣', '啦啦啦', '2020:01:04 22:16:25', '.jpg');
INSERT INTO `message` VALUES ('546', '1', '马宇欣', '下一页', '2020:01:04 22:16:31', '.jpg');
INSERT INTO `message` VALUES ('547', '1', '马宇欣', '课设', '2020:01:04 22:16:43', '.jpg');
INSERT INTO `message` VALUES ('548', '1', '马宇欣', '多读都多大', '2020:01:04 22:17:00', '.jpg');
INSERT INTO `message` VALUES ('550', '1', '马宇欣', '五光十色', '2020:01:04 22:17:21', '.jpg');
INSERT INTO `message` VALUES ('551', '1', '马宇欣', '11', '2020:01:06 09:25:14', '.jpg');
INSERT INTO `message` VALUES ('552', '1', '马宇欣', 'aas', '2020:01:06 09:25:21', '.jpg');
INSERT INTO `message` VALUES ('553', '1', '马宇欣', 'qw', '2020:01:06 09:25:25', '.jpg');
INSERT INTO `message` VALUES ('554', '1', '马宇欣', '请问', '2020:01:06 09:25:29', '.jpg');
INSERT INTO `message` VALUES ('555', '1', '马宇欣', '速度', '2020:01:06 09:25:34', '.jpg');
INSERT INTO `message` VALUES ('556', '1', '马宇欣', '按时', '2020:01:06 09:25:39', '.jpg');
INSERT INTO `message` VALUES ('557', '1', '马宇欣', '非', '2020:01:06 09:25:43', '.jpg');
INSERT INTO `message` VALUES ('558', '1', '马宇欣', '收到', '2020:01:06 09:25:47', '.jpg');
INSERT INTO `message` VALUES ('559', '1', '马宇欣', '为', '2020:01:06 09:25:52', '.jpg');
INSERT INTO `message` VALUES ('560', '2', '其他人', '123', '2020:01:07 09:39:17', '.jpg');
INSERT INTO `message` VALUES ('561', '2', '其他人', '111', '2020:01:08 08:55:46', '.jpg');
INSERT INTO `message` VALUES ('562', '1', '马宇欣', '123', '2020:01:08 08:56:41', '.jpg');

-- ----------------------------
-- Table structure for `replymessage`
-- ----------------------------
DROP TABLE IF EXISTS `replymessage`;
CREATE TABLE `replymessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `replyUserId` int(11) NOT NULL,
  `replyUserName` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `userImageUrl` varchar(255) NOT NULL,
  `replyMessageId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of replymessage
-- ----------------------------
INSERT INTO `replymessage` VALUES ('1', '1', '马宇欣', '2', '尹茂旭', '你爱放在哪就放在哪呗，矫情。', '2018:12:07 18:57:07', 'upload//1544179952401-小猪.jpg', '2');
INSERT INTO `replymessage` VALUES ('3', '5', '海南彭于晏', '1', '马宇欣', '哎呀，你咋那么能整事呢，给我消停的，别臭不要脸奥，打你。', '2018:12:07 19:07:43', 'upload//1544180747886-彭于晏.jpeg', '1');
INSERT INTO `replymessage` VALUES ('4', '6', '黑河吴彦祖', '5', '海南彭于晏', '你是海南彭于晏啊，我是黑河吴彦祖，咱俩有一拼奥，有时间喝点。', '2018:12:07 19:35:00', 'upload//1544182381607-吴彦祖.jpeg', '3');
INSERT INTO `replymessage` VALUES ('7', '5', '海南彭于晏', '6', '黑河吴彦祖', '你是谁啊', '2018:12:09 23:42:36', 'upload//1544180747886-彭于晏.jpeg', '4');
INSERT INTO `replymessage` VALUES ('8', '5', '海南彭于晏', '6', '黑河吴彦祖', '大傻逼', '2018:12:09 23:42:40', 'upload//1544180747886-彭于晏.jpeg', '4');
INSERT INTO `replymessage` VALUES ('10', '6', '黑河吴彦祖', '5', '海南彭于晏', 'dasdasdasdas', '2018:12:10 22:35:30', 'upload//1544182381607-吴彦祖.jpeg', '3');
INSERT INTO `replymessage` VALUES ('11', '6', '黑河吴彦祖', '5', '海南彭于晏', 'gdfgdgdfsgd', '2018:12:10 22:35:33', 'upload//1544182381607-吴彦祖.jpeg', '3');
INSERT INTO `replymessage` VALUES ('12', '6', '黑河吴彦祖', '2', '尹茂旭', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', '2018:12:11 11:33:15', 'upload//1544182381607-吴彦祖.jpeg', '2');
INSERT INTO `replymessage` VALUES ('13', '2', '其他人', '1', '马宇欣', '111', '2020:01:07 09:39:49', '.jpg', '559');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `imageurl` varchar(200) NOT NULL,
  `usermode` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '马宇欣', '123456', 'C:\\Users\\笑晨\\Desktop\\LastProject\\WebRoot\\images\\1.jpg', '管理员', '487973708@qq.com');
INSERT INTO `user` VALUES ('2', '其他人', '123123', 'C:\\Users\\笑晨\\Desktop\\LastProject\\WebRoot\\images\\2.jpg', '用户', '11111111@qq.com');
