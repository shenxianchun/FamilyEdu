/*
Navicat MySQL Data Transfer

Source Server         : mysql56
Source Server Version : 50619
Source Host           : localhost:3306
Source Database       : familyedu

Target Server Type    : MYSQL
Target Server Version : 50619
File Encoding         : 65001

Date: 2016-08-23 09:01:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tell` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL,
  `content` longtext,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('3', '18842640003', '小明', '教员', '巨大的房间很舒服的开发', '2016-08-02 14:47:40');
INSERT INTO `feedback` VALUES ('4', '18842640004', '二狗', '教员', '地址发v号放假GV皇家韩服', '2016-08-02 14:48:12');
INSERT INTO `feedback` VALUES ('5', '18842640005', '笑话', '教员', '好多时间好的事', '2016-08-02 14:48:45');
INSERT INTO `feedback` VALUES ('6', '18842640006', '就是', '教员', '夜，静谧。北国的深秋，不再延续夏季的风情，日光不再热烈而奔放，月色也不再朦胧又温柔.冽的北风牵引出了记忆深处多少欲说还休的过往。风缠绕着青丝，突然有种想要涂抹文字的冲动。我说，冥冥之中，注定相遇，你是我眼眸深处晶莹剔透的寒玉，又是红尘春暖中最澄澈的溪，十世九生，穿越岁月的梵音，只是为了结一段，相遇的缘。', '2016-08-02 14:49:30');
INSERT INTO `feedback` VALUES ('7', '18842640007', '的话', '教员', '南方不发的话大部分的是金山毒霸', '2016-08-02 14:49:56');

-- ----------------------------
-- Table structure for grade
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
-- Table structure for lesson
-- ----------------------------
DROP TABLE IF EXISTS `lesson`;
CREATE TABLE `lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tell` varchar(100) DEFAULT NULL,
  `grade` varchar(100) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lesson
-- ----------------------------
INSERT INTO `lesson` VALUES ('1', '18842640001', '初三', '化学');
INSERT INTO `lesson` VALUES ('2', '18842640002', '四年级', '物理');
INSERT INTO `lesson` VALUES ('4', '18842640003', '二年级', '奥数');
INSERT INTO `lesson` VALUES ('5', '18842640001', '初三', '数学');
INSERT INTO `lesson` VALUES ('6', '18842640006', '二年级', '数学');
INSERT INTO `lesson` VALUES ('7', '18842640006', '三年级', '物理');
INSERT INTO `lesson` VALUES ('8', '18842640006', '三年级', '英语');
INSERT INTO `lesson` VALUES ('9', '18842640003', '初一', '政治');
INSERT INTO `lesson` VALUES ('10', '18842647133', '一年级', '数学');
INSERT INTO `lesson` VALUES ('11', '18842647133', '四年级', '生物');
INSERT INTO `lesson` VALUES ('12', '18842647133', '二年级', '数学');
INSERT INTO `lesson` VALUES ('13', '18842647133', '二年级', '语文');
INSERT INTO `lesson` VALUES ('14', '18842647133', '初二', '语文');
INSERT INTO `lesson` VALUES ('15', '18842640003', '五年级', '语文');
INSERT INTO `lesson` VALUES ('16', '18842640003', '一年级', '数学');
INSERT INTO `lesson` VALUES ('17', '18842640003', '初一', '语文');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `m_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`u_id`),
  CONSTRAINT `mid` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', '21', '徐畅');

-- ----------------------------
-- Table structure for region
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
-- Table structure for reservation
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `t_name` varchar(100) DEFAULT NULL,
  `t_tell` varchar(100) DEFAULT NULL,
  `s_tell` varchar(100) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `Rtime` varchar(300) DEFAULT NULL,
  `Rstatu` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `money` varchar(200) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `s_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reservation
-- ----------------------------
INSERT INTO `reservation` VALUES ('1', '张三', '18842640001', '18842640011', '语文', '周三下午', '4', '2016-07-12 13:35:21', '大连民族大学', '老师上门', '40', '备注', '小明');
INSERT INTO `reservation` VALUES ('2', '李四', '18842640002', '18842640012', '数学', '周三下午', '2', '2016-07-01 13:40:05', '大连民族大学', '老师上门', '20', '备注', '翠花');
INSERT INTO `reservation` VALUES ('3', '王五', '18842640003', '18842640013', '高一语文', '1小时', '4', '2016-07-06 21:15:53', '大连民族大学', '学生上门', '20', '备注', '乐乐');
INSERT INTO `reservation` VALUES ('4', '李明', '18842640004', '18842640014', '高二数学', '周六上午', '4', '2016-06-27 21:15:58', '大连民族大学', '老师上门', '20', '备注', '狗蛋');
INSERT INTO `reservation` VALUES ('6', '张芳', '18842640006', '18842640016', '高一数学', '周六上午', '4', '2016-06-26 21:16:09', '大连民族大学', '老师上门', '60', '备注', '大明');
INSERT INTO `reservation` VALUES ('7', '李小强', '18842640007', '18842640017', '高一数学', '周六上午', '3', '2016-06-29 21:16:14', '大连民族大学', '老师上门', '40', '备注', '萨姆');
INSERT INTO `reservation` VALUES ('8', '王媛', '18842640008', '18842640018', '化学', '周日', '4', '2016-07-10 21:16:21', '大连民族大学', '老师上门', '60', '备注', '玲玲');
INSERT INTO `reservation` VALUES ('9', '周彤', '18842640009', '18842640019', '物理', '周日', '4', '2016-06-26 21:16:26', '大连民族大学', '老师上门', '50', '备注', '笑笑');
INSERT INTO `reservation` VALUES ('10', '吴洋', '18842640010', '18842640020', '英语', '周日', '3', '2016-07-20 21:16:33', '大连民族大学', '老师上门', '50', '备注', '哈哈');
INSERT INTO `reservation` VALUES ('11', '张三', '18842640010', '18842640001', '初三数学', '1小时', '4', '2016-07-13 11:36:23', '大连', '老师上门', '50', '备注', '张三');
INSERT INTO `reservation` VALUES ('14', '李四', '18842640002', '18842640003', '初三数学', '1小时', '3', '2016-07-23 12:17:13', '大连民族大学', '学生上门', '80', '李金铭哦', '王五');
INSERT INTO `reservation` VALUES ('15', '沈先春', '18842647133', '18842640003', '二年级语文', '20小时', '2', '2016-07-28 19:45:23', '大连民族大学', '老师上门', '70', '李金铭哦', '王五');
INSERT INTO `reservation` VALUES ('19', '李小强', '18842640007', '18842640011', '初三语文', '20小时', '3', '2016-07-31 20:23:12', '大连民族大学', '老师上门', '50', '哈哈哈哈哈哈', '小明');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `s_name` varchar(20) DEFAULT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `age` int(10) DEFAULT NULL,
  `tell` varchar(20) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `grade` varchar(10) DEFAULT NULL,
  `status` varchar(500) DEFAULT NULL,
  `requestSex` varchar(100) DEFAULT NULL,
  `requestMoney` varchar(300) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `authentication` varchar(10) DEFAULT NULL,
  `pid` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `su_id` (`u_id`),
  CONSTRAINT `su_id` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '11', '小明', '男', '21', '18842640011', '周六', '金州区', '大连民族大学', '初三语文', '可接受的吧斯柯达解放碑考四级的分', '男', '90', '123456', '1', '892173621', '2016-08-02 10:03:18');
INSERT INTO `student` VALUES ('2', '12', '翠花', '男', '23', '18842640012', '周一下午,周六一天', '金州区', '金石滩', '初一', '最近学习不再一条线上', '男', '50', '123456', '1', '543534265262626256', '2016-07-16 14:35:08');
INSERT INTO `student` VALUES ('3', '13', '乐乐', '女', '22', '18842640013', '周一下午,周六一天', '金州区', '金石滩', '三年级', '最近学习不再一条线上', '男', '60', '123456', '4', '642654623625626266', '2016-07-31 12:00:11');
INSERT INTO `student` VALUES ('4', '14', '狗蛋', '男', '22', '18842640014', '周一下午,周六一天', '金州区', '金石滩', '三年级', '最近学习不再一条线上', '男', '60', '123456', '1', '265754654734654656', '2016-07-19 14:35:15');
INSERT INTO `student` VALUES ('5', '15', '小强', '男', '21', '18842640015', '周一下午,周六一天', '金州区', '金石滩', '六年级', '最近学习不再一条线上', '男', '120', '123456', '1', '654754634565465677', '2016-07-31 11:59:58');
INSERT INTO `student` VALUES ('6', '16', '大明', '男', '23', '18842640016', '周一下午,周六一天', '金州区', '金石滩', '六年级', '最近学习不再一条线上', '女', '100', '123456', '1', '756835673657365736', '2016-07-23 14:35:26');
INSERT INTO `student` VALUES ('7', '17', '萨姆', '女', '16', '18842640017', '周一下午,周六一天', '金州区', '金石滩', '初三', '最近学习不再一条线上', '女', '80', '123456', '1', '867947356748647657', '2016-07-31 11:59:44');
INSERT INTO `student` VALUES ('8', '18', '玲玲', '女', '14', '18842640018', '周一下午,周六一天', '金州区', '金石滩', '高一', '最近学习不再一条线上', '女', '80', '123456', '4', '376584754885647745', '2016-07-23 14:35:33');
INSERT INTO `student` VALUES ('9', '19', '笑笑', '女', '17', '18842640019', '周一下午,周六一天', '金州区', '金石滩', '高三', '最近学习不再一条线上', '女', '60', '123456', '1', '375687698567654848', '2016-07-22 14:35:36');

-- ----------------------------
-- Table structure for subject
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
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `pid` varchar(200) DEFAULT NULL,
  `images` varchar(200) DEFAULT NULL,
  `t_name` varchar(200) DEFAULT NULL,
  `sex` char(2) DEFAULT NULL,
  `age` varchar(3) DEFAULT NULL,
  `nationality` varchar(100) DEFAULT NULL,
  `tell` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `motto` varchar(500) DEFAULT NULL,
  `introduce` varchar(500) DEFAULT NULL,
  `graduate_school` varchar(200) DEFAULT NULL,
  `specialty` varchar(200) DEFAULT NULL,
  `education` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `authentication` varchar(5) DEFAULT NULL,
  `experience` varchar(500) DEFAULT NULL,
  `money` varchar(100) DEFAULT NULL,
  `teach_time` varchar(200) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `imageC` varchar(100) DEFAULT NULL,
  `imageE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `u_id` (`u_id`) USING BTREE,
  CONSTRAINT `u_id` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '1', '53465465464324', 'http://localhost:8080/FamilyEdu/image/18842640001h.jpg', '张三', '男', '28', '汉族', '18842640001', '4356546456@qq.com', '古今中外有学问的人，有成就的人，总是十分注意积累的。知识就是机积累起来的，经验也是积累起来的。我们对什么事情都不应该像“过眼云烟”。', '有责任心,条理性强;易与人相处,对工作充满热情,勤奋好学,敢挑重担,具有很强的团队精神和协调能力。在为人方面,我诚实善良、开朗自信,能够吃苦。在生活中,我尊敬他人,能够和别人友好相处,现在我唯一的不足就是应届毕业,还没有足够的工作经验。但我擅长快速学习新知识,并且对工作有高度责任感,能够全身心的为工作奉献', '大连民族大学', '计算机', '本科', '金石路大连民族大学', '4', '大一我是一名本科三年级在读学生，我性格开朗善于沟通，有责任心，有耐心，更有信心做好每一份工作。我善于沟通，我本身也是学理科专业，在高中初中事我数理化都非常好，其他的也不错', '50', '周一', '初三科学|三年级化学|二年级奥数|', '庄河市', '2016-06-22 18:42:31', null, null);
INSERT INTO `teacher` VALUES ('3', '3', '212121212121', 'http://localhost:8080/FamilyEdu/image/18842640003h.jpg', '王五', '男', '22', '汉族', '18842640003', '1452825523@qq.com', '古今中外有学问的人，有成就的人，总是十分注意积累的。知识就是机积累起来的，经验也是积累起来的。我们对什么事情都不应该像“过眼云烟”。', '有责任心,条理性强;易与人相处,对工作充满热情,勤奋好学,敢挑重担,具有很强的团队精神和协调能力。在为人方面,我诚实善良、开朗自信,能够吃苦。在生活中,我尊敬他人,能够和别人友好相处,现在我唯一的不足就是应届毕业,还没有足够的工作经验。但我擅长快速学习新知识,并且对工作有高度责任感,能够全身心的为工作奉献', '大连民族大学', '计算机', '本科', '大连民族大学', '4', '大一我是一名本科三年级在读学生，我性格开朗善于沟通，有责任心，有耐心，更有信心做好每一份工作。我善于沟通，我本身也是学理科专业，在高中初中事我数理化都非常好，其他的也不错', '60-100', '周一到周五晚上，周六和周日全天。', '初一政治|五年级语文|一年级数学|初一语文|', '普兰店市', '2016-08-01 12:48:34', 'http://localhost:8080/FamilyEdu/imageP/18842640003p.jpg', 'http://localhost:8080/FamilyEdu/imageE/18842640003e.jpg');
INSERT INTO `teacher` VALUES ('4', '4', '21212324356232', 'http://localhost:8080/FamilyEdu/image/18842640004h.jpg', '李明', '男', '21', '汉族', '18842640004', '1452825523@qq.com', '古今中外有学问的人，有成就的人，总是十分注意积累的。知识就是机积累起来的，经验也是积累起来的。我们对什么事情都不应该像“过眼云烟”。', '有责任心,条理性强;易与人相处,对工作充满热情,勤奋好学,敢挑重担,具有很强的团队精神和协调能力。在为人方面,我诚实善良、开朗自信,能够吃苦。在生活中,我尊敬他人,能够和别人友好相处,现在我唯一的不足就是应届毕业,还没有足够的工作经验。但我擅长快速学习新知识,并且对工作有高度责任感,能够全身心的为工作奉献', '大连民族大学', '计算机', '本科', '金石路大连民族大学', '1', '大一我是一名本科三年级在读学生，我性格开朗善于沟通，有责任心，有耐心，更有信心做好每一份工作。我善于沟通，我本身也是学理科专业，在高中初中事我数理化都非常好，其他的也不错', '80', '周一到周五晚上，周六和周日全天。', '初三语文|初三数学', '金州区', '2016-07-29 23:09:12', null, null);
INSERT INTO `teacher` VALUES ('5', '5', '4376985434', 'http://localhost:8080/FamilyEdu/image/18842640005h.jpg', '刘红', '女', '20', '汉族', '18842640005', '1452825523@qq.com', '古今中外有学问的人，有成就的人，总是十分注意积累的。知识就是机积累起来的，经验也是积累起来的。我们对什么事情都不应该像“过眼云烟”。', '有责任心,条理性强;易与人相处,对工作充满热情,勤奋好学,敢挑重担,具有很强的团队精神和协调能力。在为人方面,我诚实善良、开朗自信,能够吃苦。在生活中,我尊敬他人,能够和别人友好相处,现在我唯一的不足就是应届毕业,还没有足够的工作经验。但我擅长快速学习新知识,并且对工作有高度责任感,能够全身心的为工作奉献', '大连民族大学', '计算机', '本科', '金石路大连民族大学', '1', '大一我是一名本科三年级在读学生，我性格开朗善于沟通，有责任心，有耐心，更有信心做好每一份工作。我善于沟通，我本身也是学理科专业，在高中初中事我数理化都非常好，其他的也不错', '60-100', '周一到周五晚上，周六和周日全天。', '初三语文|初三数学', '金州区', '2016-07-29 23:21:05', null, null);
INSERT INTO `teacher` VALUES ('6', '6', '756474687456', 'http://localhost:8080/FamilyEdu/image/18842640006h.jpg', '张芳', '女', '30', '汉族', '18842640006', '1452825523@qq.com', '古今中外有学问的人，有成就的人，总是十分注意积累的。知识就是机积累起来的，经验也是积累起来的。我们对什么事情都不应该像“过眼云烟”。', '有责任心,条理性强;易与人相处,对工作充满热情,勤奋好学,敢挑重担,具有很强的团队精神和协调能力。在为人方面,我诚实善良、开朗自信,能够吃苦。在生活中,我尊敬他人,能够和别人友好相处,现在我唯一的不足就是应届毕业,还没有足够的工作经验。但我擅长快速学习新知识,并且对工作有高度责任感,能够全身心的为工作奉献', '大连海事大学', '计算机', '本科', '大连海事大学', '1', '大一我是一名本科三年级在读学生，我性格开朗善于沟通，有责任心，有耐心，更有信心做好每一份工作。我善于沟通，我本身也是学理科专业，在高中初中事我数理化都非常好，其他的也不错', '20', '周五上午', '三年级物理|三年级英语|', '大连开发区', '2016-08-03 22:40:01', null, null);
INSERT INTO `teacher` VALUES ('7', '7', '765466874', 'http://localhost:8080/FamilyEdu/image/18842640007h.jpg', '李小强', '男', '27', '汉族', '18842640007', '1452825523@qq.com', '古今中外有学问的人，有成就的人，总是十分注意积累的。知识就是机积累起来的，经验也是积累起来的。我们对什么事情都不应该像“过眼云烟”。', '有责任心,条理性强;易与人相处,对工作充满热情,勤奋好学,敢挑重担,具有很强的团队精神和协调能力。在为人方面,我诚实善良、开朗自信,能够吃苦。在生活中,我尊敬他人,能够和别人友好相处,现在我唯一的不足就是应届毕业,还没有足够的工作经验。但我擅长快速学习新知识,并且对工作有高度责任感,能够全身心的为工作奉献', '大连民族大学', '计算机', '本科', '金石路大连民族大学', '3', '大一我是一名本科三年级在读学生，我性格开朗善于沟通，有责任心，有耐心，更有信心做好每一份工作。我善于沟通，我本身也是学理科专业，在高中初中事我数理化都非常好，其他的也不错', '50', '周一到周五晚上，周六和周日全天。', '初三语文|初三数学', '金州区', '2016-07-29 23:20:41', null, null);
INSERT INTO `teacher` VALUES ('9', '9', '637657665476', 'http://localhost:8080/FamilyEdu/image/18842640009h.jpg', '周彤', '女', '21', '汉族', '18842640009', '1452825523@qq.com', '古今中外有学问的人，有成就的人，总是十分注意积累的。知识就是机积累起来的，经验也是积累起来的。我们对什么事情都不应该像“过眼云烟”。', '有责任心,条理性强;易与人相处,对工作充满热情,勤奋好学,敢挑重担,具有很强的团队精神和协调能力。在为人方面,我诚实善良、开朗自信,能够吃苦。在生活中,我尊敬他人,能够和别人友好相处,现在我唯一的不足就是应届毕业,还没有足够的工作经验。但我擅长快速学习新知识,并且对工作有高度责任感,能够全身心的为工作奉献', '大连民族大学', '计算机', '本科', '金石路大连民族大学', '0', '大一我是一名本科三年级在读学生，我性格开朗善于沟通，有责任心，有耐心，更有信心做好每一份工作。我善于沟通，我本身也是学理科专业，在高中初中事我数理化都非常好，其他的也不错', '64-60', '周一到周五晚上，周六和周日全天。', '初三语文|初三数学', '金州区', '2016-07-04 20:42:38', null, null);
INSERT INTO `teacher` VALUES ('10', '10', '637356366', 'http://localhost:8080/FamilyEdu/image/18842640010h.jpg', '吴洋', '女', '26', '汉族', '18842640010', '1452825523@qq.com', '古今中外有学问的人，有成就的人，总是十分注意积累的。知识就是机积累起来的，经验也是积累起来的。我们对什么事情都不应该像“过眼云烟”。', '有责任心,条理性强;易与人相处,对工作充满热情,勤奋好学,敢挑重担,具有很强的团队精神和协调能力。在为人方面,我诚实善良、开朗自信,能够吃苦。在生活中,我尊敬他人,能够和别人友好相处,现在我唯一的不足就是应届毕业,还没有足够的工作经验。但我擅长快速学习新知识,并且对工作有高度责任感,能够全身心的为工作奉献', '大连民族大学', '计算机', '本科', '金石路大连民族大学', '4', '大一我是一名本科三年级在读学生，我性格开朗善于沟通，有责任心，有耐心，更有信心做好每一份工作。我善于沟通，我本身也是学理科专业，在高中初中事我数理化都非常好，其他的也不错', '70', '周一到周五晚上，周六和周日全天。', '初三语文|初三数学', '金州区', '2016-07-17 20:42:43', null, null);
INSERT INTO `teacher` VALUES ('14', '23', '562421652142167612', 'http://localhost:8080/FamilyEdu/image/18842647133h.jpg', '沈先春', '男', '21', '白族', '18842647133', '2415672167@qq.com', '古今中外有学问的人，有成就的人，总是十分注意积累的。知识就是机积累起来的，经验也是积累起来的。我们对什么事情都不应该像“过眼云烟”。', '2121', '大连民族大学', '计算机', '本科', '大连民族大学', '1', '都市风水师的地方的肤色大捱三顶四萨达大声道大大神的会计师的及会计师的费快接受都不懂', '70', '周一到周五晚上，周六和周日全天', '四年级生物|二年级数学|二年级语文|初二语文|', '大连开发区', '2016-07-29 23:20:51', null, null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tell` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '18842640001', '123456', '教员');
INSERT INTO `user` VALUES ('3', '18842640003', '123456', '教员');
INSERT INTO `user` VALUES ('4', '18842670004', '123456', '教员');
INSERT INTO `user` VALUES ('5', '18842640005', '123456', '教员');
INSERT INTO `user` VALUES ('6', '18842640006', '123456', '教员');
INSERT INTO `user` VALUES ('7', '18842640007', '123456', '教员');
INSERT INTO `user` VALUES ('9', '18842640009', '123456', '教员');
INSERT INTO `user` VALUES ('10', '18842640010', '123456', '教员');
INSERT INTO `user` VALUES ('11', '18842640011', '123456', '学员');
INSERT INTO `user` VALUES ('12', '18842640012', '123456', '学员');
INSERT INTO `user` VALUES ('13', '18842640013', '123456', '学员');
INSERT INTO `user` VALUES ('14', '18842640014', '123456', '学员');
INSERT INTO `user` VALUES ('15', '18842640015', '123456', '学员');
INSERT INTO `user` VALUES ('16', '18842640016', '123456', '学员');
INSERT INTO `user` VALUES ('17', '18842640017', '123456', '学员');
INSERT INTO `user` VALUES ('18', '18842640018', '123456', '学员');
INSERT INTO `user` VALUES ('19', '18842640019', '123456', '学员');
INSERT INTO `user` VALUES ('21', 'admin', '123456', '管理员');
INSERT INTO `user` VALUES ('23', '18842647133', '123456', '教员');
