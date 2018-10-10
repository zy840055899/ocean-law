/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50560
Source Host           : localhost:3306
Source Database       : haiyang

Target Server Type    : MYSQL
Target Server Version : 50560
File Encoding         : 65001

Date: 2018-10-09 16:34:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for case
-- ----------------------------
DROP TABLE IF EXISTS `case`;
CREATE TABLE `case` (
  `case_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '案件id 主键',
  `case_name` varchar(200) NOT NULL COMMENT '案件名称',
  `case_no` varchar(200) DEFAULT NULL COMMENT '案件编号',
  `case_cause` varchar(500) DEFAULT NULL COMMENT '案由，此字段可能是案由编号',
  `cause_item` varchar(200) DEFAULT NULL COMMENT '案由条款，可能是条款编号',
  `punish_gist` varchar(100) DEFAULT NULL COMMENT '处罚依据，选定案由，可能要参考数据字典',
  `law_persons` varchar(100) DEFAULT NULL COMMENT '执法人员编号，英文逗号隔开',
  `law_no` varchar(100) DEFAULT NULL COMMENT '执法号，根据执法人员获得',
  `status` varchar(5) DEFAULT NULL COMMENT '状态，123见数据字典',
  `check_addr` varchar(500) DEFAULT NULL COMMENT '检查地点',
  `discretion_grade` varchar(10) DEFAULT NULL COMMENT '裁量阶次，可能用数据字典',
  `case_from` varchar(5) DEFAULT NULL COMMENT '案件来源，123，见数据字典',
  `check_time` datetime NOT NULL COMMENT '检查时间',
  `accept_time` datetime DEFAULT NULL COMMENT '受案时间',
  `createtime` datetime NOT NULL,
  `obj_id` varchar(20) DEFAULT NULL COMMENT '被执法人id，obj_of_law',
  `audio_url` varchar(200) DEFAULT NULL COMMENT '音频信息',
  `pics_url` varchar(500) DEFAULT NULL COMMENT '图片URL地址，@@@隔开',
  `video_url` varchar(500) DEFAULT NULL COMMENT '视频地址',
  `attach_url` varchar(500) DEFAULT NULL COMMENT '附件地址',
  `lng` varchar(100) DEFAULT NULL COMMENT '经度',
  `lat` varchar(100) DEFAULT NULL COMMENT '纬度',
  `updatetime` date DEFAULT NULL,
  `isdel` varchar(5) DEFAULT '0',
  PRIMARY KEY (`case_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='案件信息表';

-- ----------------------------
-- Records of case
-- ----------------------------
INSERT INTO `case` VALUES ('1', '', '赣榆执立-2018-838620号', null, null, null, null, null, null, null, null, null, '2018-10-08 09:03:33', '2018-10-08 09:12:05', '2018-10-08 09:03:39', '1', null, null, null, null, '120', '30', null, '0');

-- ----------------------------
-- Table structure for dic_case_cause
-- ----------------------------
DROP TABLE IF EXISTS `dic_case_cause`;
CREATE TABLE `dic_case_cause` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_cause` varchar(200) DEFAULT NULL,
  `cause_item` varchar(200) DEFAULT NULL COMMENT '条款',
  `punish_gist` varchar(200) DEFAULT NULL COMMENT '依据',
  `remark` varchar(200) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='立案事由字典';

-- ----------------------------
-- Records of dic_case_cause
-- ----------------------------
INSERT INTO `dic_case_cause` VALUES ('1', '禁渔期违法捕鱼', '《中华人民共和国渔业法》第三十条第一款', '《中华人民共和国渔业法》第三十八条第一款', null, '2018-09-26 09:18:21');

-- ----------------------------
-- Table structure for dic_case_from
-- ----------------------------
DROP TABLE IF EXISTS `dic_case_from`;
CREATE TABLE `dic_case_from` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_from` varchar(20) NOT NULL,
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `isdel` varchar(5) DEFAULT '0',
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='案件来源字典';

-- ----------------------------
-- Records of dic_case_from
-- ----------------------------
INSERT INTO `dic_case_from` VALUES ('1', '检查发现', null, '0', '2018-09-26 09:00:11', null);
INSERT INTO `dic_case_from` VALUES ('2', '领导交办', null, '0', '2018-09-26 09:00:26', null);
INSERT INTO `dic_case_from` VALUES ('3', '群众举报', '', '0', '2018-09-28 10:34:18', '2018-09-28 10:37:09');
INSERT INTO `dic_case_from` VALUES ('4', '媒体曝光', null, '0', '2018-10-09 01:47:29', null);

-- ----------------------------
-- Table structure for dic_case_type
-- ----------------------------
DROP TABLE IF EXISTS `dic_case_type`;
CREATE TABLE `dic_case_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_type` varchar(20) DEFAULT NULL COMMENT '案件类型',
  `remark` varchar(100) DEFAULT NULL,
  `isdel` varchar(5) DEFAULT '0',
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='案件类型字典';

-- ----------------------------
-- Records of dic_case_type
-- ----------------------------
INSERT INTO `dic_case_type` VALUES ('1', '一般案件', null, '0', '2018-09-26 09:02:55', null);
INSERT INTO `dic_case_type` VALUES ('2', '刑事案件', 'wu', '0', '2018-09-28 11:15:14', null);

-- ----------------------------
-- Table structure for dic_discretion_grade
-- ----------------------------
DROP TABLE IF EXISTS `dic_discretion_grade`;
CREATE TABLE `dic_discretion_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discretion_grade` varchar(100) DEFAULT NULL COMMENT '阶次',
  `remark` varchar(200) DEFAULT NULL,
  `isdel` varchar(5) DEFAULT '0',
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='裁量阶次字典';

-- ----------------------------
-- Records of dic_discretion_grade
-- ----------------------------
INSERT INTO `dic_discretion_grade` VALUES ('1', '一般', null, '0', '2018-09-26 09:21:34', null);

-- ----------------------------
-- Table structure for dic_ship_type
-- ----------------------------
DROP TABLE IF EXISTS `dic_ship_type`;
CREATE TABLE `dic_ship_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ship_type` varchar(50) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `isdel` varchar(5) DEFAULT '0',
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='主体（船舶）类别字典';

-- ----------------------------
-- Records of dic_ship_type
-- ----------------------------
INSERT INTO `dic_ship_type` VALUES ('1', '渔船', null, '0', '2018-09-26 09:16:44', null);
INSERT INTO `dic_ship_type` VALUES ('2', '紫菜种植', null, '0', '2018-09-26 09:16:57', null);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `permission_name` varchar(100) DEFAULT NULL COMMENT '权限名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '案件信息权限');
INSERT INTO `permission` VALUES ('2', '立案案件信息权限');
INSERT INTO `permission` VALUES ('3', '案件办理信息权限');
INSERT INTO `permission` VALUES ('4', '案件归档信息权限');
INSERT INTO `permission` VALUES ('5', '暂缓案件信息权限');
INSERT INTO `permission` VALUES ('6', '开捕检查权限');

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '人员id',
  `name` varchar(20) DEFAULT NULL,
  `id_number` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `ship_name` varchar(100) DEFAULT NULL COMMENT '负责的船舶名称',
  `gender` varchar(5) DEFAULT NULL COMMENT '性别，0女 1男',
  `age` varchar(5) DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL COMMENT '职务，字典',
  `certificate_type` varchar(50) DEFAULT NULL COMMENT '证书类型',
  `phone` varchar(20) DEFAULT NULL,
  `addr` varchar(200) DEFAULT NULL COMMENT '住址',
  `isdel` varchar(5) DEFAULT '0',
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='被检查人员信息表';

-- ----------------------------
-- Records of person
-- ----------------------------

-- ----------------------------
-- Table structure for ship
-- ----------------------------
DROP TABLE IF EXISTS `ship`;
CREATE TABLE `ship` (
  `ship_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '船舶id',
  `ship_name` varchar(100) NOT NULL COMMENT '船舶名号',
  `shipowner` varchar(100) DEFAULT NULL COMMENT '船主',
  `phone` varchar(20) DEFAULT NULL,
  `ship_type` varchar(5) DEFAULT NULL COMMENT '船舶类型，字典',
  `work_type` varchar(5) DEFAULT NULL COMMENT '作业类型，字典',
  `work_way` varchar(5) DEFAULT NULL COMMENT '作业方式，字典',
  `power` varchar(20) DEFAULT NULL COMMENT '功率（KW）',
  `ship_material` varchar(20) DEFAULT NULL COMMENT '船体材料',
  `tonnage` varchar(20) DEFAULT NULL COMMENT '吨位',
  `load_person` varchar(10) DEFAULT NULL COMMENT '核定载重人数',
  `harbor` varchar(20) DEFAULT NULL COMMENT '船籍港名称',
  `ais_no` varchar(50) DEFAULT NULL COMMENT 'ais号码',
  `bds_id` varchar(50) DEFAULT NULL COMMENT '北斗ID号',
  `has_fishing_license` varchar(5) DEFAULT NULL COMMENT '捕捞许可证，0没有 1有',
  `has_owner_license` varchar(5) DEFAULT NULL COMMENT '船舶所有权证书 1有 0没有',
  `has_ship_certificate` varchar(5) DEFAULT NULL COMMENT '船检证书 1有 0没有',
  `has_illegal` varchar(5) DEFAULT '0' COMMENT '1：是 0：否',
  `pic_url` varchar(200) DEFAULT NULL COMMENT '图片路径',
  `isdel` varchar(5) DEFAULT '0',
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`ship_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='船舶表';

-- ----------------------------
-- Records of ship
-- ----------------------------
INSERT INTO `ship` VALUES ('1', '黑珍珠号', '斯派洛', '13912345678', '1', '手工', '人力', '1000', '铁', '600', '200', '加勒比港', '123', '456', '0', '1', '1', '1', 'www.baidu.com', '', '2018-09-29 07:11:56', null);

-- ----------------------------
-- Table structure for ship_of_law
-- ----------------------------
DROP TABLE IF EXISTS `ship_of_law`;
CREATE TABLE `ship_of_law` (
  `ship_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '对象id',
  `ship_type` varchar(5) DEFAULT NULL COMMENT '对象类型，参考字典',
  `ship_name` varchar(100) DEFAULT NULL COMMENT '主体名称',
  `duty_person_name` varchar(50) DEFAULT NULL COMMENT '责任人名称',
  `phone` varchar(20) DEFAULT NULL,
  `addr` varchar(200) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL COMMENT '0：女，1：男',
  `age` varchar(5) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`ship_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='执法对象表';

-- ----------------------------
-- Records of ship_of_law
-- ----------------------------
INSERT INTO `ship_of_law` VALUES ('1', '1', '渔01219', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '执法队伍名称',
  `phone` varchar(15) DEFAULT NULL,
  `head` varchar(20) DEFAULT NULL COMMENT '负责人',
  `head_area` varchar(50) DEFAULT NULL COMMENT '管辖区域',
  `isdel` varchar(5) DEFAULT '0' COMMENT '是否删除0否1是',
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间（删除时间）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='执法队伍表';

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES ('1', '执法三对3', '13712345678', '李四', '赣榆区也', '0', '2018-09-27 08:23:12', '2018-09-28 09:56:50');
INSERT INTO `team` VALUES ('3', '执法二队', '13912341234', '王五', '燕尾港', '0', '2018-09-28 09:50:19', '2018-09-28 09:54:39');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `isdel` varchar(5) DEFAULT '0',
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '81dc9bdb52d04dc20036dbd8313ed055', '0', '2018-10-08 01:02:51', null);
