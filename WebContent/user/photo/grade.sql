/*
Navicat MySQL Data Transfer

Source Server         : mysql56
Source Server Version : 50619
Source Host           : localhost:3306
Source Database       : familyedu

Target Server Type    : MYSQL
Target Server Version : 50619
File Encoding         : 65001

Date: 2016-06-29 09:17:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `grade`
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_name` varchar(10) DEFAULT NULL,
  `number` int(2) DEFAULT NULL,
  `price` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1', '一年级', '1', '50');
INSERT INTO `grade` VALUES ('2', '二年级', '2', '50');
INSERT INTO `grade` VALUES ('3', '三年级', '3', '50');
INSERT INTO `grade` VALUES ('4', '四年级', '4', '50');
INSERT INTO `grade` VALUES ('5', '五年级', '5', '50');
INSERT INTO `grade` VALUES ('6', '六年级', '6', '50');
INSERT INTO `grade` VALUES ('7', '初一', '7', '70');
INSERT INTO `grade` VALUES ('8', '初二', '8', '70');
INSERT INTO `grade` VALUES ('9', '初三', '9', '70');
INSERT INTO `grade` VALUES ('10', '高一', '10', '90');
INSERT INTO `grade` VALUES ('11', '高二', '11', '90');
INSERT INTO `grade` VALUES ('12', '高三', '12', '90');

-- ----------------------------
-- Table structure for `lesson`
-- ----------------------------
DROP TABLE IF EXISTS `lesson`;
CREATE TABLE `lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `t_id` int(11) DEFAULT NULL,
  `g_id` int(11) DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lesson
-- ----------------------------
INSERT INTO `lesson` VALUES ('1', '1', '2', '1');

-- ----------------------------
-- Table structure for `region`
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `r_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO `region` VALUES ('1', '普兰店市');
INSERT INTO `region` VALUES ('2', '瓦房店市');
INSERT INTO `region` VALUES ('3', '庄河市');
INSERT INTO `region` VALUES ('4', '长海县');
INSERT INTO `region` VALUES ('5', '沙河口区');
INSERT INTO `region` VALUES ('6', '西岗区');
INSERT INTO `region` VALUES ('7', '中山区');
INSERT INTO `region` VALUES ('8', '甘井子区');
INSERT INTO `region` VALUES ('9', '高新园区');
INSERT INTO `region` VALUES ('10', '大连开发区');
INSERT INTO `region` VALUES ('11', '金州区');
INSERT INTO `region` VALUES ('12', '旅顺口区');

-- ----------------------------
-- Table structure for `reservation`
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `t_id` int(11) DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL,
  `t_name` varchar(100) DEFAULT NULL,
  `t_tell` varchar(100) DEFAULT NULL,
  `s_tell` varchar(100) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `Rtime` varchar(300) DEFAULT NULL,
  `Rstatu` varchar(20) DEFAULT NULL,
  `creat_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reservation
-- ----------------------------

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `age` int(10) DEFAULT NULL,
  `tell` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `grade` varchar(10) DEFAULT NULL,
  `status` varchar(500) DEFAULT NULL,
  `requestSex` varchar(100) DEFAULT NULL,
  `requestMoney` varchar(300) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `authentication` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for `subject`
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('1', '语文');
INSERT INTO `subject` VALUES ('2', '数学');
INSERT INTO `subject` VALUES ('3', '英语');
INSERT INTO `subject` VALUES ('4', '物理');
INSERT INTO `subject` VALUES ('5', '化学');
INSERT INTO `subject` VALUES ('6', '生物');
INSERT INTO `subject` VALUES ('7', '政治');
INSERT INTO `subject` VALUES ('8', '历史');
INSERT INTO `subject` VALUES ('9', '地理');
INSERT INTO `subject` VALUES ('10', '奥数');
INSERT INTO `subject` VALUES ('11', '科学');
INSERT INTO `subject` VALUES ('12', '陪读');
INSERT INTO `subject` VALUES ('13', '信息技术');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `p_name` varchar(200) DEFAULT NULL,
  `sex` char(2) DEFAULT NULL,
  `age` varchar(3) DEFAULT NULL,
  `nationality` varchar(100) DEFAULT NULL,
  `tell` varchar(200) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `motto` varchar(500) DEFAULT NULL,
  `introduce` varchar(500) DEFAULT NULL,
  `graduate_school` varchar(200) DEFAULT NULL,
  `specialty` varchar(200) DEFAULT NULL,
  `education` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `authentication` varchar(100) DEFAULT NULL,
  `experience` varchar(500) DEFAULT NULL,
  `money` varchar(100) DEFAULT NULL,
  `teach_time` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '53212898121281', 'image/sxc.jpg', '沈先春', '男', '21', '汉族', '18842647134', '111111', '1452825523@qq.com', '1993-11-19', '电从不打在相同的地方,人不该被相同的方式伤害两次', '有责任心,条理性强;易与人相处,对工作充满热情,勤奋好学,敢挑重担,具有很强的团队精神和协调能力。在为人方面,我诚实善良、开朗自信,能够吃苦。在生活中,我尊敬他人,能够和别人友好相处,现在我唯一的不足就是应届毕业,还没有足够的工作经验。但我擅长快速学习新知识,并且对工作有高度责任感,能够全身心的为工作奉献', '大连民族大学', '计算机', '本科', '金石路大连民族大学', '1', '大一我是一名本科三年级在读学生，我性格开朗善于沟通，有责任心，有耐心，更有信心做好每一份工作。我善于沟通，我本身也是学理科专业，在高中初中事我数理化都非常好，其他的也不错', '小学【语文、数学、英语、奥数】每小时30-50元，初中每小时40-60元，高中/三校生/自学考试：每小时60-100元', '周一到周五晚上，周六和周日全天。', '2016-06-22 18:42:31');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tell` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL,
  `t_id` int(11) DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '18842647134', '123456', '教员', '1', null);
INSERT INTO `user` VALUES ('2', '18843241542', '123456', '学员', null, '1');
