/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-12-15 17:28:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `ID` varchar(32) NOT NULL COMMENT 'ID',
  `ParentID` varchar(32) NOT NULL DEFAULT '0' COMMENT '父级ID,默认为0',
  `Code` varchar(50) DEFAULT NULL COMMENT '字典编码',
  `Name` varchar(50) DEFAULT NULL COMMENT '字典名称',
  `Type` varchar(10) DEFAULT NULL COMMENT '字典类型',
  `Value` varchar(50) DEFAULT NULL COMMENT '字典值',
  `Sort` int(11) DEFAULT '0' COMMENT '排序号',
  `Memo` varchar(100) DEFAULT NULL COMMENT '备注',
  `EnabledFlag` varchar(1) DEFAULT '0' COMMENT '可用状态',
  `CreateBy` varchar(32) DEFAULT NULL COMMENT '创建者',
  `CreateDate` datetime DEFAULT NULL COMMENT '创建日期',
  `UpdateBy` varchar(32) DEFAULT NULL COMMENT '修改人',
  `UpdateDate` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典配置';

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES ('1', '0', '', '系统配置数据', '0', null, null, '用于存放系统初始化数据', '0', '1', '2017-12-15 16:25:40', null, null);
INSERT INTO `sys_dictionary` VALUES ('2', '1', 'ServerIP', '本机IP', null, '192.168.3.150', null, '运行服务的服务器IP', '0', '1', '2017-12-15 16:28:03', null, null);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `LogID` varchar(32) NOT NULL COMMENT '主键ID',
  `AppName` varchar(36) NOT NULL COMMENT '所属应用',
  `LogType` int(11) DEFAULT NULL COMMENT '日志类型，0为操作日志，1为异常日志',
  `UserID` varchar(32) DEFAULT NULL COMMENT '访问者/请求者',
  `operation` varchar(100) DEFAULT NULL COMMENT '方法描述',
  `MethodName` varchar(100) DEFAULT NULL COMMENT '请求方法名称(全路径)',
  `RequestMethod` varchar(20) DEFAULT NULL COMMENT '请求方式(GET,POST,DELETE,PUT)',
  `RequestParams` varchar(1000) DEFAULT NULL COMMENT '请求参数',
  `RequestIp` varchar(50) DEFAULT NULL COMMENT '访问者IP',
  `RequestUri` varchar(200) DEFAULT NULL COMMENT '请求URI',
  `ExceptionCode` varchar(100) DEFAULT NULL COMMENT '异常码',
  `ExceptionDetail` varchar(2000) DEFAULT NULL COMMENT '异常描述',
  `TimeConsuming` bigint(20) DEFAULT NULL COMMENT '请求耗时',
  `UserAgent` varchar(500) DEFAULT NULL COMMENT '客户端信息',
  `CreateDate` datetime DEFAULT NULL COMMENT '创建时间',
  `ModifyTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`LogID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('0148afd0e562418a8873a5e482c2f5b2', '', '0', null, '修改用户信息', 'com.absolom.dracarys.user.controller.UserController.update()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/update', null, null, '189', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 10:51:49', null);
INSERT INTO `sys_log` VALUES ('0259863c89c34d7c8db34bae03ac921d', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/select', null, null, '290', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-06 15:44:31', null);
INSERT INTO `sys_log` VALUES ('03c73654bf654245a8719dd34c06e7ff', '', '0', null, '生成代码', 'com.absolom.dracarys.controller.SysGeneratorController.code()', 'GET', 'tables=sys_dictionary&package=SysDictionary', '127.0.0.1', '/ssm-web/sys/generator/code', null, null, '3369', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 18:15:51', null);
INSERT INTO `sys_log` VALUES ('043732d023964c578bf1812de9c5dbf7', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 18:16:01', null);
INSERT INTO `sys_log` VALUES ('04eec058a54f465eb7d72fb64a1a38bc', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'Content-Type=application/json&userID={&quot;qqq&quot;:&quot;2222&quot;}', '127.0.0.1', '/ssm-web/user/query', null, null, '5565', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 17:51:20', null);
INSERT INTO `sys_log` VALUES ('0516012dfee1476497ff4db04eeb18fe', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456', '127.0.0.1', '/ssm-web/user/select', null, null, '6', 'mozilla/5.0 (windows nt 10.0 win64 x64) applewebkit/537.36 (khtml, like gecko) chrome/62.0.3202.94 safari/537.36', '2017-12-07 17:32:44', null);
INSERT INTO `sys_log` VALUES ('059c27993ffe4128a8cea60fb85d8e64', '', '1', null, '生成代码', 'com.absolom.dracarys.controller.SysGeneratorController.code()', 'GET', 'tables=[&quot;[sys_dictionary]&quot;]&package=SysDictionary', '127.0.0.1', '/ssm-web/sys/generator/code', 'com.alibaba.fastjson.JSONException', 'syntax error, pos 2, json : [&quot;[sys_dictionary]&quot;]', null, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 18:12:11', null);
INSERT INTO `sys_log` VALUES ('0938d34687b547b8869724120f24c93f', '', '1', null, '生成代码', 'com.absolom.dracarys.controller.SysGeneratorController.code()', 'GET', 'tables=[sys_dictionary]&package=SysDictionary', '127.0.0.1', '/ssm-web/sys/generator/code', 'com.alibaba.fastjson.JSONException', 'syntax error, pos 2, json : [sys_dictionary]', null, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 18:12:34', null);
INSERT INTO `sys_log` VALUES ('0a256ef0f2ce483898fb9bc074845ff2', '', '0', null, '分页获取数据表', 'com.absolom.dracarys.controller.SysGeneratorController.list()', 'GET', '', '127.0.0.1', '/ssm-web/sys/generator/list', null, null, '9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 16:40:54', null);
INSERT INTO `sys_log` VALUES ('0b0bb178d1b74ccda9adf29a17637fd3', '', '0', null, '获取用户列表', 'com.absolom.dracarys.user.controller.UserController.list()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/list', null, null, '314', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 14:39:56', null);
INSERT INTO `sys_log` VALUES ('0b1e7b4152864ff880a213c8f5aa87aa', '', '0', null, '修改用户信息', 'com.absolom.dracarys.user.controller.UserController.update()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/update', null, null, '138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 18:15:01', null);
INSERT INTO `sys_log` VALUES ('0dc11f8a438d4cb19532c06a6bf9c275', '', '0', null, '分页获取数据表', 'com.absolom.dracarys.controller.SysGeneratorController.list()', 'GET', '', '127.0.0.1', '/ssm-web/sys/generator/list', null, null, '83', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 14:00:17', null);
INSERT INTO `sys_log` VALUES ('13b55dcf43c6492fbe0c901f3591d7ca', '', '0', null, '获取用户列表', 'com.absolom.dracarys.user.controller.UserController.list()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/list', null, null, '459', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '2017-12-15 14:45:27', null);
INSERT INTO `sys_log` VALUES ('1592125b20614d7abbfb574de38de01e', '', '1', null, '生成代码', 'com.absolom.dracarys.controller.SysGeneratorController.code()', 'GET', 'tables=sys_dictionary&package=SysDictionary', '127.0.0.1', '/ssm-web/sys/generator/code', 'com.alibaba.fastjson.JSONException', 'syntax error, expect [, actual error, pos 0', null, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 18:10:04', null);
INSERT INTO `sys_log` VALUES ('164ddced52174e23861947cf7d88dbcc', '', '0', null, '获取用户列表', 'com.absolom.dracarys.user.controller.UserController.list()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/list', null, null, '61', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 10:55:31', null);
INSERT INTO `sys_log` VALUES ('172ac7b645254b62b47018058094ecfc', '', '1', null, '生成代码', 'com.absolom.dracarys.controller.SysGeneratorController.code()', 'GET', 'tables=sys_dictionary&package=&quot;[&quot;[SysDictionary]&quot;]&quot;', '127.0.0.1', '/ssm-web/sys/generator/code', 'com.alibaba.fastjson.JSONException', 'syntax error, expect [, actual error, pos 0', null, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 18:09:21', null);
INSERT INTO `sys_log` VALUES ('1a66e69b845f4ca88fe5656f61ce3a1d', '', '0', null, '修改用户信息', 'com.absolom.dracarys.user.controller.UserController.update()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/update', null, null, '118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 10:47:44', null);
INSERT INTO `sys_log` VALUES ('1ba78305c4714cf39b05a74c48affa2e', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456', '127.0.0.1', '/ssm-web/user/select', null, null, '5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 17:03:02', null);
INSERT INTO `sys_log` VALUES ('1e5289fd2fd643fbac2f7fa076403165', '', '0', null, '修改用户信息', 'com.absolom.dracarys.user.controller.UserController.update()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/update', null, null, '85', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 14:41:35', null);
INSERT INTO `sys_log` VALUES ('1f8a85b0843b45ec9d405ae24edf7443', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456', '127.0.0.1', '/ssm-web/user/select', null, null, '371', 'mozilla/5.0 (windows nt 10.0 win64 x64) applewebkit/537.36 (khtml, like gecko) chrome/62.0.3202.94 safari/537.36', '2017-12-07 17:32:03', null);
INSERT INTO `sys_log` VALUES ('202820d1fcfb41dc9f13e434972aea94', '', '0', null, '获取用户列表', 'com.absolom.dracarys.user.controller.UserController.list()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/list', null, null, '317', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 16:36:40', null);
INSERT INTO `sys_log` VALUES ('2189ef03b6184b6b984ff127b4689f13', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=', '127.0.0.1', '/ssm-web/user/query', null, null, '3239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 17:53:18', null);
INSERT INTO `sys_log` VALUES ('23e2fd7fe21e4414a780195cd6ce3f95', '', '0', null, '修改用户信息', 'com.absolom.dracarys.user.controller.UserController.update()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/update', null, null, '126', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 13:31:05', null);
INSERT INTO `sys_log` VALUES ('250685ee3ede4074accf2631d4f33664', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456', '127.0.0.1', '/ssm-web/user/query', null, null, '301', 'mozilla/5.0 (windows nt 10.0 win64 x64) applewebkit/537.36 (khtml, like gecko) chrome/62.0.3202.94 safari/537.36', '2017-12-07 17:43:29', null);
INSERT INTO `sys_log` VALUES ('25c2afd1e9e14add9653e32d8fbbeb42', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456', '127.0.0.1', '/ssm-web/user/select', null, null, '4', 'mozilla/5.0 (windows nt 10.0 win64 x64) applewebkit/537.36 (khtml, like gecko) chrome/62.0.3202.94 safari/537.36', '2017-12-07 17:30:54', null);
INSERT INTO `sys_log` VALUES ('25c76d9117a749769bb371200a8b9e12', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=003094690b164d5c869de61298ce9ce3', '127.0.0.1', '/ssm-web/user/query', null, null, '327', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 10:58:10', null);
INSERT INTO `sys_log` VALUES ('26c4d4dddcf8484387ea760613b9d2b9', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 15:58:36', null);
INSERT INTO `sys_log` VALUES ('295a9399f17046f2a730d0dadea79a89', '', '0', null, '获取用户列表', 'com.absolom.dracarys.user.controller.UserController.list()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/list', null, null, '44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 18:15:14', null);
INSERT INTO `sys_log` VALUES ('29c9b294f95d4432a97dfee1e7945265', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456', '127.0.0.1', '/ssm-web/user/select', null, null, '377', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 16:04:56', null);
INSERT INTO `sys_log` VALUES ('2aca6317f114458083dab4f22cc56a3a', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/select', null, null, '404', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 09:04:52', null);
INSERT INTO `sys_log` VALUES ('2bcf83c4c488433196d4edb204c0f336', '', '0', null, '修改用户信息', 'com.absolom.dracarys.user.controller.UserController.update()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/update', null, null, '349', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 16:32:46', null);
INSERT INTO `sys_log` VALUES ('2d1735bc27a541948b3ea1e48dc82839', '', '0', null, '修改用户信息', 'com.absolom.dracarys.user.controller.UserController.update()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/update', null, null, '66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 18:16:43', null);
INSERT INTO `sys_log` VALUES ('2d29fedfe90f4c31881ff761219faa86', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456', '127.0.0.1', '/ssm-web/user/query', null, null, '3557', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 17:48:32', null);
INSERT INTO `sys_log` VALUES ('30944544dc024355b575b420f31c8bb9', '', '0', null, '修改用户信息', 'com.absolom.dracarys.user.controller.UserController.update()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/update', null, null, '5040', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 13:51:15', null);
INSERT INTO `sys_log` VALUES ('30d7ce2b0e224800a16e739ce8c10e4d', '', '1', null, '生成代码', 'com.absolom.dracarys.controller.SysGeneratorController.code()', 'GET', 'tables=sys_dictionary&package=&quot;[SysDictionary]&quot;', '127.0.0.1', '/ssm-web/sys/generator/code', 'com.alibaba.fastjson.JSONException', 'syntax error, expect [, actual error, pos 0', null, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 17:56:24', null);
INSERT INTO `sys_log` VALUES ('30e051463d014872b90914365094e6a2', '', '1', null, '生成代码', 'com.absolom.dracarys.controller.SysGeneratorController.code()', 'GET', 'tables=sys_dictionary&package=SysDictionary', '127.0.0.1', '/ssm-web/sys/generator/code', 'com.alibaba.fastjson.JSONException', 'syntax error, expect [, actual error, pos 0', null, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 18:01:01', null);
INSERT INTO `sys_log` VALUES ('3127e7ef66f84d00840eee52b0af43fd', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '416', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 14:02:21', null);
INSERT INTO `sys_log` VALUES ('33011ce158784290be8c27bf4a8f7b44', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=', '127.0.0.1', '/ssm-web/user/query', null, null, '1163', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 17:54:33', null);
INSERT INTO `sys_log` VALUES ('342aac5735124c4fbc2d884012be3368', '', '0', null, '获取用户列表', 'com.absolom.dracarys.user.controller.UserController.list()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/list', null, null, '2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 13:42:16', null);
INSERT INTO `sys_log` VALUES ('34cfa6cb950540739144659c29079ca1', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 14:02:31', null);
INSERT INTO `sys_log` VALUES ('36d74454aa274655b8669dc1fe5ed82d', '', '0', null, '获取用户列表', 'com.absolom.dracarys.user.controller.UserController.list()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/list', null, null, '70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 14:03:12', null);
INSERT INTO `sys_log` VALUES ('3786fe6b86754c04b85094925f8ead18', '', '1', null, '修改用户信息', 'com.absolom.dracarys.user.controller.UserController.update()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/update', 'org.mybatis.spring.MyBatisSystemException', 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error committing transaction.  Cause: java.lang.NullPointerException\r\n### Cause: java.lang.NullPointerException', null, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 16:49:43', null);
INSERT INTO `sys_log` VALUES ('3a36c68385554fe1b3a03be502939f25', '', '0', null, '分页获取数据表', 'com.absolom.dracarys.controller.SysGeneratorController.list()', 'GET', '', '127.0.0.1', '/ssm-web/sys/generator/list', null, null, '8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 14:03:02', null);
INSERT INTO `sys_log` VALUES ('3ba1f05ade214ccb8b96798e6cc9cd6f', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456&ppp=123213', '127.0.0.1', '/ssm-web/user/select', null, null, '41874', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 16:36:31', null);
INSERT INTO `sys_log` VALUES ('3c8ac102b4544815a64e9b122e9e3352', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=', '127.0.0.1', '/ssm-web/user/query', null, null, '9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 17:59:07', null);
INSERT INTO `sys_log` VALUES ('3ecc2f08d2854fb89870cb8408c14d32', '', '0', null, '提取缓存', 'com.absolom.dracarys.user.controller.UserController.getCache()', 'GET', 'key=123', '127.0.0.1', '/ssm-web/user/getCache', null, null, '2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '2017-12-15 14:46:28', null);
INSERT INTO `sys_log` VALUES ('409df0b954a347c7b2d71478317df3d2', '', '0', null, '放入缓存', 'com.absolom.dracarys.user.controller.UserController.getCache()', 'GET', 'key=123&value=456', '127.0.0.1', '/ssm-web/user/setCache', null, null, '1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 13:42:00', null);
INSERT INTO `sys_log` VALUES ('43edd8ce50384ff6b0d0554e57cdb96e', '', '0', null, '放入缓存', 'com.absolom.dracarys.user.controller.UserController.getCache()', 'GET', 'key=123&value=456', '127.0.0.1', '/ssm-web/user/setCache', null, null, '97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 09:51:14', null);
INSERT INTO `sys_log` VALUES ('44cf3b023d8845f694448f4d7e4c3eae', '', '0', null, '分页获取数据表', 'com.absolom.dracarys.controller.SysGeneratorController.list()', 'GET', '', '127.0.0.1', '/ssm-web/sys/generator/list', null, null, '362', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 17:43:30', null);
INSERT INTO `sys_log` VALUES ('454f616f526141ae831f7827ba35bb7e', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456&ppp=123213', '127.0.0.1', '/ssm-web/user/select', null, null, '59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 16:31:10', null);
INSERT INTO `sys_log` VALUES ('4561e0a5f7dc4375a238a9aa692a694a', '', '1', null, '修改用户信息', 'com.absolom.dracarys.user.controller.UserController.update()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/update', 'org.mybatis.spring.MyBatisSystemException', 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error committing transaction.  Cause: java.lang.NullPointerException\r\n### Cause: java.lang.NullPointerException', null, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 16:35:16', null);
INSERT INTO `sys_log` VALUES ('45f468f72ec0495bac0d62ce8697f208', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=003094690b164d5c869de61298ce9ce3', '127.0.0.1', '/ssm-web/user/query', null, null, '18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 15:59:21', null);
INSERT INTO `sys_log` VALUES ('46ff233db6254227a8fc52c49b9979bb', '', '0', null, '获取用户列表', 'com.absolom.dracarys.user.controller.UserController.list()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/list', null, null, '32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 13:41:29', null);
INSERT INTO `sys_log` VALUES ('484e2c7b84a1499c910f3121ae9cdb5f', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 13:40:43', null);
INSERT INTO `sys_log` VALUES ('4a0f59a69ba94d23b05ee752ee5db60f', '', '0', null, '获取用户列表', 'com.absolom.dracarys.user.controller.UserController.list()', 'GET', '', '127.0.0.1', '/ssm-web/user/list', null, null, '318', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 16:30:24', null);
INSERT INTO `sys_log` VALUES ('4bf21fd3c9f94ad9bf7b450fd5dba04d', '', '0', null, '修改用户信息', 'com.absolom.dracarys.user.controller.UserController.update()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/update', null, null, '250', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 16:31:09', null);
INSERT INTO `sys_log` VALUES ('4c6a6e5d603f4579bfec1c25fb8ef441', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 10:51:20', null);
INSERT INTO `sys_log` VALUES ('50c72a447014496fb89c645256bb9273', '', '1', null, '生成代码', 'com.absolom.dracarys.controller.SysGeneratorController.code()', 'GET', 'tables=sys_dictionary&package=&quot;[SysDictionary]&quot;', '127.0.0.1', '/ssm-web/sys/generator/code', 'com.alibaba.fastjson.JSONException', 'syntax error, expect [, actual error, pos 0', null, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 17:56:55', null);
INSERT INTO `sys_log` VALUES ('51c2d8c774b24d438fe9969c9cac2802', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/select', null, null, '312', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 13:42:09', null);
INSERT INTO `sys_log` VALUES ('5286de1f693942cd99bcbb20983032b1', '', '0', null, '提取缓存', 'com.absolom.dracarys.user.controller.UserController.getCache()', 'GET', 'key=123', '127.0.0.1', '/ssm-web/user/getCache', null, null, '62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 10:18:15', null);
INSERT INTO `sys_log` VALUES ('52c340e95aaa40c4823f3ac503e9ddf8', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456', '127.0.0.1', '/ssm-web/user/query', null, null, '277', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 17:45:56', null);
INSERT INTO `sys_log` VALUES ('547b02278e2b4da69ec5880abb147588', '', '0', null, '修改用户信息', 'com.absolom.dracarys.user.controller.UserController.update()', 'GET', 'userID=025dc813df9e4ecd88a9881d607b7735', '127.0.0.1', '/ssm-web/user/update', null, null, '307', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 10:58:49', null);
INSERT INTO `sys_log` VALUES ('548c67fa62844545a3404c7fae35742f', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 17:49:56', null);
INSERT INTO `sys_log` VALUES ('550e8e8c8fca4c24a984204a32428dda', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=00ebfaf00aa4476298b0e5e80c1afd55', '127.0.0.1', '/ssm-web/user/query', null, null, '6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 10:58:27', null);
INSERT INTO `sys_log` VALUES ('5558c2a7bed643d4a0b7f214c8281880', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID={&quot;qqq&quot;:&quot;2222&quot;}', '127.0.0.1', '/ssm-web/user/query', null, null, '8302', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 17:49:25', null);
INSERT INTO `sys_log` VALUES ('56db5cff108a4955a01adedd45abbac4', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '365', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 11:34:31', null);
INSERT INTO `sys_log` VALUES ('57026f826ed342a4b4fa2a16a7ad5c20', '', '0', null, '获取用户列表', 'com.absolom.dracarys.user.controller.UserController.list()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/list', null, null, '393', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 14:24:59', null);
INSERT INTO `sys_log` VALUES ('5716bf6f6ae6401bb164d2e51c191bbd', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=', '127.0.0.1', '/ssm-web/user/query', null, null, '620', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 21:56:22', null);
INSERT INTO `sys_log` VALUES ('58084cb12f11437fb00f24c947735da6', '', '0', null, '生成代码', 'com.absolom.dracarys.controller.SysGeneratorController.code()', 'GET', 'tables=sys_dictionary&package=dictionary', '127.0.0.1', '/ssm-web/sys/generator/code', null, null, '35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '2017-12-15 16:39:02', null);
INSERT INTO `sys_log` VALUES ('59a4f47e2f7a48bdb5e9f29314672bac', '', '0', null, '获取用户列表', 'com.absolom.dracarys.user.controller.UserController.list()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/list', null, null, '4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 18:18:41', null);
INSERT INTO `sys_log` VALUES ('59e47aef87a245d98fc6daa8d660bd2c', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456', '127.0.0.1', '/ssm-web/user/select', null, null, '23010', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 16:26:09', null);
INSERT INTO `sys_log` VALUES ('5b0a1625d9bb40ec849b392920bf7ff6', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=11', '127.0.0.1', '/ssm-web/user/query', null, null, '2168', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 18:01:49', null);
INSERT INTO `sys_log` VALUES ('5cee2c19abd44de6a2d28cb6ebe30edb', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '102', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 18:14:38', null);
INSERT INTO `sys_log` VALUES ('5cfa350008b14cd983582047207120da', '', '0', null, '修改用户信息', 'com.absolom.dracarys.user.controller.UserController.update()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/update', null, null, '234', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 13:41:15', null);
INSERT INTO `sys_log` VALUES ('5f39b7996d0149c898f43fe7ddce5e3e', '', '0', null, '分页获取数据表', 'com.absolom.dracarys.controller.SysGeneratorController.list()', 'GET', '', '127.0.0.1', '/ssm-web/sys/generator/list', null, null, '55', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 16:30:52', null);
INSERT INTO `sys_log` VALUES ('62e8cd4f5b7549a29c2dae39e5f5cbf8', '', '1', null, '生成代码', 'com.absolom.dracarys.controller.SysGeneratorController.code()', 'GET', 'tables=[&quot;sys_dictionary&quot;]&package=SysDictionary', '127.0.0.1', '/ssm-web/sys/generator/code', 'com.alibaba.fastjson.JSONException', 'syntax error, pos 2, json : [&quot;sys_dictionary&quot;]', null, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 18:13:13', null);
INSERT INTO `sys_log` VALUES ('664c2914464c40feb9d177e45a7d87a0', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456&ppp=123213', '127.0.0.1', '/ssm-web/user/select', null, null, '8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 16:20:17', null);
INSERT INTO `sys_log` VALUES ('6b83b4a39aca4ef98d35e50f2cdc6b4f', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=', '127.0.0.1', '/ssm-web/user/query', null, null, '2400', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 18:01:36', null);
INSERT INTO `sys_log` VALUES ('6bca5ed9c86f44ec8cb9ae7249345c7c', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=', '127.0.0.1', '/ssm-web/user/query', null, null, '12446', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 17:57:17', null);
INSERT INTO `sys_log` VALUES ('6c3f964285884c4b918b60bf86c5f2be', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456&ppp=123213', '127.0.0.1', '/ssm-web/user/select', null, null, '5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 16:14:50', null);
INSERT INTO `sys_log` VALUES ('6cbd594ceba14b039f0d472ed84d7635', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '75', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 10:28:59', null);
INSERT INTO `sys_log` VALUES ('6d2b8fb308f545c1bea44775c804e96c', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=', '127.0.0.1', '/ssm-web/user/query', null, null, '2771', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 17:52:09', null);
INSERT INTO `sys_log` VALUES ('6ec7923366e843e5853bad39c5ab2e6d', '', '1', null, '生成代码', 'com.absolom.dracarys.controller.SysGeneratorController.code()', 'GET', 'tables=sys_dictionary&package=SysDictionary', '127.0.0.1', '/ssm-web/sys/generator/code', 'com.alibaba.fastjson.JSONException', 'syntax error, expect [, actual error, pos 0', null, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 18:06:53', null);
INSERT INTO `sys_log` VALUES ('733b3983d54a438584bad32e554675ae', '', '1', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'POST', 'userID=123', '127.0.0.1', '/ssm-web/user/query', 'org.springframework.data.redis.RedisConnectionFailureException', 'Cannot get Jedis connection; nested exception is redis.clients.jedis.exceptions.JedisConnectionException: Could not get a resource from the pool', null, 'PostmanRuntime/7.1.1', '2017-12-12 11:08:40', null);
INSERT INTO `sys_log` VALUES ('773d5380a62e48c9bf042d6ebb5c6db2', '', '0', null, '分页获取数据表', 'com.absolom.dracarys.controller.SysGeneratorController.list()', 'GET', '', '127.0.0.1', '/ssm-web/sys/generator/list', null, null, '6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 16:40:46', null);
INSERT INTO `sys_log` VALUES ('791759f8ece347509d73a16ed941485c', '', '0', null, '生成代码', 'com.absolom.dracarys.controller.SysGeneratorController.code()', 'GET', 'tables=sys_dictionary&package=[&quot;[SysDictionary]&quot;]', '127.0.0.1', '/ssm-web/sys/generator/code', null, null, '941', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '2017-12-15 16:07:26', null);
INSERT INTO `sys_log` VALUES ('7aa5e2705770427ba57617c62ebda0ba', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=', '127.0.0.1', '/ssm-web/user/query', null, null, '6446', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 17:50:02', null);
INSERT INTO `sys_log` VALUES ('7bd1603fc8474b5590c3d6e4173da4bf', '', '0', null, '获取用户列表', 'com.absolom.dracarys.user.controller.UserController.list()', 'GET', '', '127.0.0.1', '/ssm-web/user/list', null, null, '59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 09:41:50', null);
INSERT INTO `sys_log` VALUES ('7c8b022ed82f4dcc98384a326709ecf1', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 11:41:59', null);
INSERT INTO `sys_log` VALUES ('7eaf76555e354b9ca567b921ca974d6a', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'Content-Type=&quot;application/json&quot;&userID={&quot;qqq&quot;:&quot;2222&quot;}', '127.0.0.1', '/ssm-web/user/query', null, null, '29283', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 17:52:00', null);
INSERT INTO `sys_log` VALUES ('8227dc16703546b090395d4dd97b8d60', '', '0', null, '生成代码', 'com.absolom.dracarys.controller.SysGeneratorController.code()', 'GET', 'tables=sys_dictionary&package=SysDictionary', '127.0.0.1', '/ssm-web/sys/generator/code', null, null, '38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '2017-12-15 16:09:43', null);
INSERT INTO `sys_log` VALUES ('87179885ec0b499e85d0d84c058228ac', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 10:46:46', null);
INSERT INTO `sys_log` VALUES ('8919eea44d204c0985fc12d3147df82f', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 11:34:57', null);
INSERT INTO `sys_log` VALUES ('89730dbf6aad4b52902f88071ebba383', '', '1', null, '生成代码', 'com.absolom.dracarys.controller.SysGeneratorController.code()', 'GET', 'tables=sys_dictionary&package=[&quot;[SysDictionary]&quot;]', '127.0.0.1', '/ssm-web/sys/generator/code', 'com.alibaba.fastjson.JSONException', 'syntax error, expect [, actual error, pos 0', null, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 18:08:42', null);
INSERT INTO `sys_log` VALUES ('89e74eb0cc9e4a1fa7a6e5f4068cb5c1', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=025dc813df9e4ecd88a9881d607b7735', '127.0.0.1', '/ssm-web/user/query', null, null, '5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 10:58:32', null);
INSERT INTO `sys_log` VALUES ('8c1d44ac95a94a118057299ea4c83e39', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456', '127.0.0.1', '/ssm-web/user/query', null, null, '281', 'mozilla/5.0 (windows nt 10.0 win64 x64) applewebkit/537.36 (khtml, like gecko) chrome/62.0.3202.94 safari/537.36', '2017-12-07 17:45:16', null);
INSERT INTO `sys_log` VALUES ('8f3e326fb5e24d36853d1d9580d2febe', '', '0', null, '修改用户信息', 'com.absolom.dracarys.user.controller.UserController.update()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/update', null, null, '7153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 10:52:45', null);
INSERT INTO `sys_log` VALUES ('8f876a4c91714b60a95c534888fd1f64', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 11:35:05', null);
INSERT INTO `sys_log` VALUES ('9318f846ecdb48e2a33a10b21944c50f', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '335', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 10:55:03', null);
INSERT INTO `sys_log` VALUES ('944bd967906c482cb9f93f6da3b58bc1', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456', '127.0.0.1', '/ssm-web/user/select', null, null, '1944', 'mozilla/5.0 (windows nt 10.0 win64 x64) applewebkit/537.36 (khtml, like gecko) chrome/62.0.3202.94 safari/537.36', '2017-12-07 17:30:48', null);
INSERT INTO `sys_log` VALUES ('945797504dc8432bac1cec73e6e80023', '', '0', null, '获取用户列表', 'com.absolom.dracarys.user.controller.UserController.list()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/list', null, null, '55', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 13:40:56', null);
INSERT INTO `sys_log` VALUES ('94e635a853404a5d91cf9ca1af3dd97f', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456', '127.0.0.1', '/ssm-web/user/select', null, null, '4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 16:24:10', null);
INSERT INTO `sys_log` VALUES ('9594ec9a2d484952b04ad0b86d60c3fc', '', '0', null, '分页获取数据表', 'com.absolom.dracarys.controller.SysGeneratorController.list()', 'GET', '', '127.0.0.1', '/ssm-web/sys/generator/list', null, null, '52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 16:40:25', null);
INSERT INTO `sys_log` VALUES ('960b4cb400f54e74a414f5d857598136', '', '0', null, '生成代码', 'com.absolom.dracarys.controller.SysGeneratorController.code()', 'GET', 'tables=sys_dictionary&package=SysDictionary', '127.0.0.1', '/ssm-web/sys/generator/code', null, null, '50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '2017-12-15 16:07:58', null);
INSERT INTO `sys_log` VALUES ('963e084fe193459eba5d8db42dde7c4c', '', '0', null, '修改用户信息', 'com.absolom.dracarys.user.controller.UserController.update()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/update', null, null, '114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 14:03:21', null);
INSERT INTO `sys_log` VALUES ('975253c3a6dd4554ae3008aa5f48beef', '', '1', null, '生成代码', 'com.absolom.dracarys.controller.SysGeneratorController.code()', 'GET', 'tables=sys_dictionary&package=SysDictionary', '127.0.0.1', '/ssm-web/sys/generator/code', 'java.lang.ArrayIndexOutOfBoundsException', '0', null, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 18:14:43', null);
INSERT INTO `sys_log` VALUES ('97f18913d15e42dbb968944f02af9281', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 17:50:09', null);
INSERT INTO `sys_log` VALUES ('9bc0119c760c4e1eaa85d7e2100999b9', '', '1', null, '修改用户信息', 'com.absolom.dracarys.user.controller.UserController.update()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/update', 'org.mybatis.spring.MyBatisSystemException', 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error committing transaction.  Cause: java.lang.NullPointerException\r\n### Cause: java.lang.NullPointerException', null, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 16:41:28', null);
INSERT INTO `sys_log` VALUES ('9d8f6d5e9b1042698313702c45338a58', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 11:57:53', null);
INSERT INTO `sys_log` VALUES ('9dac926c920c4b5eb6266872b959b59e', '', '0', null, '分页获取数据表', 'com.absolom.dracarys.controller.SysGeneratorController.list()', 'GET', '', '127.0.0.1', '/ssm-web/sys/generator/list', null, null, '8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 14:40:59', null);
INSERT INTO `sys_log` VALUES ('9f6e1bd4f6c04ec4a3ebc449ab5e70c0', '', '0', null, '提取缓存', 'com.absolom.dracarys.user.controller.UserController.getCache()', 'GET', 'key=123', '127.0.0.1', '/ssm-web/user/getCache', null, null, '62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 09:51:40', null);
INSERT INTO `sys_log` VALUES ('a1781dfeee004195b448ccf893021b60', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'templateContent=', '127.0.0.1', '/ssm-web/user/query', null, null, '15495', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 17:58:37', null);
INSERT INTO `sys_log` VALUES ('a19ecd1e10c64b7b925ff0ad6aa5669b', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '661', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 17:48:57', null);
INSERT INTO `sys_log` VALUES ('a1c6d31e032b4b16b59d54b096661d75', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456&ppp=123213', '127.0.0.1', '/ssm-web/user/select', null, null, '255209', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 16:59:50', null);
INSERT INTO `sys_log` VALUES ('a31cb46ae4f449faa549a51966b5b308', '', '0', null, '放入缓存', 'com.absolom.dracarys.user.controller.UserController.getCache()', 'GET', 'key=123&value=456', '127.0.0.1', '/ssm-web/user/setCache', null, null, '2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '2017-12-15 14:46:01', null);
INSERT INTO `sys_log` VALUES ('a3a371a6c63745209a876ed2a900da12', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456&ppp=123213', '127.0.0.1', '/ssm-web/user/select', null, null, '4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 16:19:46', null);
INSERT INTO `sys_log` VALUES ('a3a5d28932ee4d3c84e043938432d19a', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456&ppp=123213', '127.0.0.1', '/ssm-web/user/select', null, null, '3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 16:14:41', null);
INSERT INTO `sys_log` VALUES ('a49a7b9065f94da2973730416e3d21e5', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456', '127.0.0.1', '/ssm-web/user/select', null, null, '301', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 17:02:51', null);
INSERT INTO `sys_log` VALUES ('a59cc31945cf4de986de0eeac38fc175', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 14:02:36', null);
INSERT INTO `sys_log` VALUES ('a6e136b3ce6e4a46a3d5374f6e2aeddc', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456', '127.0.0.1', '/ssm-web/user/query', null, null, '281', 'mozilla/5.0 (windows nt 10.0 win64 x64) applewebkit/537.36 (khtml, like gecko) chrome/62.0.3202.94 safari/537.36', '2017-12-07 17:42:15', null);
INSERT INTO `sys_log` VALUES ('a96bdac877e44890845a8f1c40f34a1e', '', '0', null, '分页获取数据表', 'com.absolom.dracarys.controller.SysGeneratorController.list()', 'GET', '', '127.0.0.1', '/ssm-web/sys/generator/list', null, null, '370', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 14:02:29', null);
INSERT INTO `sys_log` VALUES ('a98209be54de4c7ba3801822d07e89b2', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456', '127.0.0.1', '/ssm-web/user/select', null, null, '23945', 'mozilla/5.0 (windows nt 10.0 win64 x64) applewebkit/537.36 (khtml, like gecko) chrome/62.0.3202.94 safari/537.36', '2017-12-07 17:30:40', null);
INSERT INTO `sys_log` VALUES ('a9ce05feab5f43a28c3bd6bee4f7b3aa', '', '1', null, '修改用户信息', 'com.absolom.dracarys.user.controller.UserController.update()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/update', 'org.mybatis.spring.MyBatisSystemException', 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error committing transaction.  Cause: java.lang.NullPointerException\r\n### Cause: java.lang.NullPointerException', null, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 16:50:19', null);
INSERT INTO `sys_log` VALUES ('aa7d89b8947842c0bd61b5617db85bad', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456', '127.0.0.1', '/ssm-web/user/select', null, null, '5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 16:14:32', null);
INSERT INTO `sys_log` VALUES ('abbd9dbe2784477793ee562478fd4ea3', '', '1', null, '生成代码', 'com.absolom.dracarys.controller.SysGeneratorController.code()', 'GET', 'tables=sys_dictionary&package=SysDictionary', '127.0.0.1', '/ssm-web/sys/generator/code', 'com.alibaba.fastjson.JSONException', 'syntax error, expect [, actual error, pos 0', null, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 17:51:09', null);
INSERT INTO `sys_log` VALUES ('ac071c4696634daf9d529fbb7442de91', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456&ppp=123213', '127.0.0.1', '/ssm-web/user/select', null, null, '21089', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 16:35:26', null);
INSERT INTO `sys_log` VALUES ('ace8690223c04938ad9979f25610b40e', '', '0', null, '分页获取数据表', 'com.absolom.dracarys.controller.SysGeneratorController.list()', 'GET', '', '127.0.0.1', '/ssm-web/sys/generator/list', null, null, '6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 14:40:54', null);
INSERT INTO `sys_log` VALUES ('ad804859e5044fcfbac2b191968bead5', '', '0', null, '修改用户信息', 'com.absolom.dracarys.user.controller.UserController.update()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/update', null, null, '196', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 11:54:50', null);
INSERT INTO `sys_log` VALUES ('af4609c5eb2f49418a39d2e1cc3bbcab', '', '0', null, '修改用户信息', 'com.absolom.dracarys.user.controller.UserController.update()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/update', null, null, '160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 13:42:30', null);
INSERT INTO `sys_log` VALUES ('b0b6bc9f5b40406f97d05de962362875', '', '0', null, '获取用户列表', 'com.absolom.dracarys.user.controller.UserController.list()', 'GET', 'userID=003094690b164d5c869de61298ce9ce3', '127.0.0.1', '/ssm-web/user/list', null, null, '98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 15:59:31', null);
INSERT INTO `sys_log` VALUES ('b18f63296ae546848ccbc176e3e9255f', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=', '127.0.0.1', '/ssm-web/user/query', null, null, '426', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 18:02:25', null);
INSERT INTO `sys_log` VALUES ('b19b6fc786524e6d995796f2868cdc54', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456', '127.0.0.1', '/ssm-web/user/query', null, null, '5', 'mozilla/5.0 (windows nt 10.0 win64 x64) applewebkit/537.36 (khtml, like gecko) chrome/62.0.3202.94 safari/537.36', '2017-12-07 17:44:19', null);
INSERT INTO `sys_log` VALUES ('b2a8972def584798afb83535a503e1cb', '', '1', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', 'org.springframework.data.redis.RedisConnectionFailureException', 'Cannot get Jedis connection; nested exception is redis.clients.jedis.exceptions.JedisConnectionException: Could not get a resource from the pool', null, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 15:58:08', null);
INSERT INTO `sys_log` VALUES ('b4a417e1c52d4d33a25e50d8ea8af87a', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/select', null, null, '18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 09:19:42', null);
INSERT INTO `sys_log` VALUES ('b7aa1ba7ee6f473eac1b9876e8ec8faa', '', '0', null, '获取用户列表', 'com.absolom.dracarys.user.controller.UserController.list()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/list', null, null, '331', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 14:26:13', null);
INSERT INTO `sys_log` VALUES ('babcc5d77979443ab12230569e0ab049', '', '0', null, '修改用户信息', 'com.absolom.dracarys.user.controller.UserController.update()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/update', null, null, '136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 11:57:39', null);
INSERT INTO `sys_log` VALUES ('bdb1e287849c485fb1fff51925335584', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/select', null, null, '254', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 13:29:14', null);
INSERT INTO `sys_log` VALUES ('bf2907f05eb64767b37ab1413c2ecb5c', '', '1', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', 'org.springframework.data.redis.RedisConnectionFailureException', 'Cannot get Jedis connection; nested exception is redis.clients.jedis.exceptions.JedisConnectionException: Could not get a resource from the pool', null, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 11:09:02', null);
INSERT INTO `sys_log` VALUES ('bf6ec023d4374ae68cc14dae0d56b3a6', '', '0', null, '获取用户列表', 'com.absolom.dracarys.user.controller.UserController.list()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/list', null, null, '7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 13:59:51', null);
INSERT INTO `sys_log` VALUES ('c506224925c847778aff6bbbeb2f12e5', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456', '127.0.0.1', '/ssm-web/user/select', null, null, '38058', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 16:23:21', null);
INSERT INTO `sys_log` VALUES ('c53a1205b46b4c0a8bbdd7a7041fba64', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '365', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 11:54:26', null);
INSERT INTO `sys_log` VALUES ('c6ec47d16ac34151970527b72b864086', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456', '127.0.0.1', '/ssm-web/user/select', null, null, '13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 16:05:34', null);
INSERT INTO `sys_log` VALUES ('cb25f64510164ae49cf3647ec5f48287', '', '0', null, '修改用户信息', 'com.absolom.dracarys.user.controller.UserController.update()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/update', null, null, '345', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 16:53:15', null);
INSERT INTO `sys_log` VALUES ('ce2a024cdc5c4076bc2a27ae0c5e925a', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456&ppp=123213', '127.0.0.1', '/ssm-web/user/select', null, null, '377', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 16:34:25', null);
INSERT INTO `sys_log` VALUES ('ce37264ef64a4833b91b6f16467a3fcd', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/select', null, null, '289', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 14:06:34', null);
INSERT INTO `sys_log` VALUES ('ce61f4bb0de54ba6b369dd3cdd79eaf6', '', '1', null, '修改用户信息', 'com.absolom.dracarys.user.controller.UserController.update()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/update', 'org.mybatis.spring.MyBatisSystemException', 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error committing transaction.  Cause: java.lang.NullPointerException\r\n### Cause: java.lang.NullPointerException', null, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 16:33:48', null);
INSERT INTO `sys_log` VALUES ('d1c5dbcc7ea14456bf2701ea3bbea2d3', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 11:58:02', null);
INSERT INTO `sys_log` VALUES ('d36cd70520ef404eb03def343f91ab9b', '', '1', null, '获取用户列表', 'com.absolom.dracarys.user.controller.UserController.list()', 'GET', '', '127.0.0.1', '/ssm-web/user/list', 'org.mybatis.spring.MyBatisSystemException', 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'sidx\' in \'class com.absolom.dracarys.user.model.User\'', null, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 17:50:25', null);
INSERT INTO `sys_log` VALUES ('d5156fca4f4a42838d64316c3bf9eebb', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 11:55:29', null);
INSERT INTO `sys_log` VALUES ('d5d961f8231e4dde9b17fa2b77e84db2', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456', '127.0.0.1', '/ssm-web/user/select', null, null, '6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 16:25:25', null);
INSERT INTO `sys_log` VALUES ('d6bc9987aff7495cb54d1211173fc33b', '', '0', null, '获取用户列表', 'com.absolom.dracarys.user.controller.UserController.list()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/list', null, null, '8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 18:17:01', null);
INSERT INTO `sys_log` VALUES ('dc27ba70302a4b75b1d386f618c912a6', '', '1', null, '生成代码', 'com.absolom.dracarys.controller.SysGeneratorController.code()', 'GET', 'tables=sys_dictionary&package=[&quot;[SysDictionary]&quot;]', '127.0.0.1', '/ssm-web/sys/generator/code', 'com.alibaba.fastjson.JSONException', 'syntax error, expect [, actual error, pos 0', null, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 17:58:30', null);
INSERT INTO `sys_log` VALUES ('de0e7515f11a4007a25aaac4717fac20', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456', '127.0.0.1', '/ssm-web/user/query', null, null, '274', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 17:47:08', null);
INSERT INTO `sys_log` VALUES ('e0f1ffb1c1e44177afb787baf9d3823a', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456', '127.0.0.1', '/ssm-web/user/select', null, null, '3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 16:24:17', null);
INSERT INTO `sys_log` VALUES ('e526c24e71e04799ad856ba8bcd61202', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/select', null, null, '393', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 15:54:24', null);
INSERT INTO `sys_log` VALUES ('e6c7e149653042a8a40c9040cb3d67e1', '', '0', null, '分页获取数据表', 'com.absolom.dracarys.controller.SysGeneratorController.list()', 'GET', '', '127.0.0.1', '/ssm-web/sys/generator/list', null, null, '55', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 14:40:02', null);
INSERT INTO `sys_log` VALUES ('e735f2d023ef48f7a8307ee29bdddb7a', '', '0', null, '获取用户列表', 'com.absolom.dracarys.user.controller.UserController.list()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/list', null, null, '7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-14 13:51:00', null);
INSERT INTO `sys_log` VALUES ('e7ddfba621844f39afe1c8c83ec000cd', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 10:29:12', null);
INSERT INTO `sys_log` VALUES ('ed5fad3d8fbd4cdb946bb2c46aa43e07', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456', '127.0.0.1', '/ssm-web/user/select', null, null, '6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 16:25:37', null);
INSERT INTO `sys_log` VALUES ('ed6dbde969bc4524b6f817da37a460e8', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID={&quot;qqq&quot;:&quot;2222&quot;}', '127.0.0.1', '/ssm-web/user/query', null, null, '17477', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 17:49:12', null);
INSERT INTO `sys_log` VALUES ('eee41c491c6640f59553d4466c1492a1', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 10:48:13', null);
INSERT INTO `sys_log` VALUES ('f265df22ce9b4c67b9760bc1430182f1', '', '1', null, '生成代码', 'com.absolom.dracarys.controller.SysGeneratorController.code()', 'GET', 'tables=sys_dictionary&pakcage=SysDictionary', '127.0.0.1', '/ssm-web/sys/generator/code', 'com.alibaba.fastjson.JSONException', 'syntax error, expect [, actual error, pos 0', null, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 17:47:38', null);
INSERT INTO `sys_log` VALUES ('f41ab51d44c840838aedebb849d77a9e', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 11:44:38', null);
INSERT INTO `sys_log` VALUES ('f427efe3f5f84609a2df3b9e017c1a6f', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123456&ppp=123213', '127.0.0.1', '/ssm-web/user/select', null, null, '7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 16:34:53', null);
INSERT INTO `sys_log` VALUES ('f8497206fe21455dbe032572e4326a60', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '89', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 11:42:26', null);
INSERT INTO `sys_log` VALUES ('f98d39235a4544a593fe2618047d19d3', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'Content-Type=application/json&userID={&quot;qqq&quot;:&quot;2222&quot;}', '127.0.0.1', '/ssm-web/user/query', null, null, '8572', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 17:51:13', null);
INSERT INTO `sys_log` VALUES ('fa3822d1f71a4aa18092e1dfd59b3a11', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/query', null, null, '345', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-12 11:57:19', null);
INSERT INTO `sys_log` VALUES ('fb8b8125660e4e13be6137903018bf11', '', '0', null, '查询用户信息', 'com.absolom.dracarys.user.controller.UserController.select()', 'GET', 'userID=', '127.0.0.1', '/ssm-web/user/query', null, null, '1935', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-07 17:58:17', null);
INSERT INTO `sys_log` VALUES ('fddb63472ff14534bbe5471df102c0f2', '', '0', null, '修改用户信息', 'com.absolom.dracarys.user.controller.UserController.update()', 'GET', 'userID=123', '127.0.0.1', '/ssm-web/user/update', null, null, '122', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 10:55:45', null);
INSERT INTO `sys_log` VALUES ('fe82ba2033804ed983d0dc8488b7eb11', '', '0', null, '放入缓存', 'com.absolom.dracarys.user.controller.UserController.getCache()', 'GET', 'key=123&value=6666', '127.0.0.1', '/ssm-web/user/setCache', null, null, '75', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '2017-12-13 10:17:43', null);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `PermissionID` varchar(32) NOT NULL COMMENT '权限ID',
  `PermissionName` varchar(50) NOT NULL COMMENT '权限名称',
  `PermissionCode` varchar(50) DEFAULT NULL COMMENT '权限编码',
  `Description` varchar(200) DEFAULT NULL COMMENT '权限描述',
  `ParentID` varchar(32) NOT NULL COMMENT '父权限ID',
  `PermissionSN` int(11) DEFAULT NULL COMMENT '排序',
  `Url` varchar(128) DEFAULT NULL COMMENT '地址',
  `PermissionType` varchar(10) NOT NULL COMMENT '权限类型',
  `Memo` varchar(500) DEFAULT NULL COMMENT '备注',
  `EnabledFlag` varchar(1) DEFAULT '0' COMMENT '可用状态',
  `CreateBy` varchar(32) DEFAULT NULL COMMENT '创建者',
  `CreateDate` datetime DEFAULT NULL COMMENT '创建日期',
  `UpdateBy` varchar(32) DEFAULT NULL COMMENT '修改人',
  `UpdateDate` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`PermissionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限配置';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('021b6ecbe6744863a1d645d63112346f', '请假记录', 'LeaveRecordManager', '', '3bc2db07e89c4441b6bfa23d591b0682', '6', '/jsp/synthesize/leaverecord/leaverecord.jsp', '1', '', '0', null, null, '1', '2017-07-26 11:25:32');
INSERT INTO `sys_permission` VALUES ('02b99bf2c8c44b8cb95a3c7ad67a3f3f', '新增', 'NewsContentAdd', 'synthesize:newscontent:save', 'd422bcc454c5482ea7b4cb9b7f78780d', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('02d007872a4d479382c0e31107fa32f9', '修改', 'KnowledgeInfoUpdate', 'synthesize:knowledgeinfo:update', 'e953f9b367d64533a163e57170d6c967', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('080c926d0b8c49d7834053397556e365', '修改', 'VideoContentUpdate', 'synthesize:videocontent:update', '56de4848859f4ddd9793e032e0aa0fc7', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('0ad0c8db5b304b4e84a92dc5d0d62350', '视频审批', 'spsm', '', '3bc2db07e89c4441b6bfa23d591b0682', null, '/jsp/synthesize/videoapprove/videocontent.jsp', '1', '', '0', '1', '2017-07-25 10:49:37', '1', '2017-07-25 11:30:32');
INSERT INTO `sys_permission` VALUES ('1', '系统管理', 'sysConfig', '', '0', '2', '', '0', 'fa fa-cog', '0', null, null, '1', '2017-07-27 15:11:42');
INSERT INTO `sys_permission` VALUES ('10', '删除', 'scheduleDelete', 'sys:schedule:delete', '6', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('11', '暂停', 'schedulePause', 'sys:schedule:pause', '6', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('12', '恢复', 'scheduleResume', 'sys:schedule:resume', '6', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('12f8aad7974d4788a2679d084dd6f422', '重置密码', 'czma', 'terminal:userinfo:updateUserPwd', '829d155442b64d338522c19864ef36ca', null, '', '2', '', '0', '1', '2017-07-18 18:12:47', null, '2017-07-18 18:12:47');
INSERT INTO `sys_permission` VALUES ('13', '立即执行', null, 'sys:schedule:run', '6', '0', '', '2', '', '0', null, null, '1', '2017-07-15 18:18:25');
INSERT INTO `sys_permission` VALUES ('136da41456674ed4b8c194ef055b5094', '删除', 'KnowledgeTypeDelete', 'terminal:knowledgetype:delete', '379efc55f8d94533bc5fbec8c302e509', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('1377228d4fde4208b78507f30193537d', '查看', 'documentTemplateSelect', 'synthesize:documenttemplate:list,synthesize:documenttemplate:info', 'ab64404c19914b199ad76f51115ab03c', '0', '', '2', '', '0', null, null, '1', '2017-08-07 09:44:00');
INSERT INTO `sys_permission` VALUES ('13de128b429b452a898a97cd8d06a9fb', '修改', 'documentTemplateUpdate', 'synthesize:documenttemplate:update', 'ab64404c19914b199ad76f51115ab03c', '0', '', '2', '', '0', null, null, '1', '2017-08-07 09:45:09');
INSERT INTO `sys_permission` VALUES ('15', '查看', 'userSelect', 'sys:user:view,sys:user:info', '2', '6', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('16', '新增', 'useradd', 'sys:user:save,sys:role:select', '2', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('17', '修改', 'userUpdate', 'sys:user:update,sys:role:select', '2', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('17081d8a59034e4183e595348e8862ac', '删除', 'KnowledgeInfoDelete', 'synthesize:knowledgeinfo:delete', 'e953f9b367d64533a163e57170d6c967', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('18', '删除', 'userDelete', 'sys:user:delete', '2', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('19', '查看', 'roleSelect', 'sys:role:list,sys:role:info', '3', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('1948760d714e43238c4399edac4f3601', '新增', 'KnowledgeInfoAdd', 'synthesize:knowledgeinfo:save', 'e953f9b367d64533a163e57170d6c967', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('19ad51e8fbf340888c0c6e6d5d735b86', '新闻类型', 'NewsTypeManager', '', 'df9ee36ffee74a238e7e6379b3bf8db5', '6', '/jsp/terminal/newstype/newstype.jsp', '1', '', '0', null, null, '1', '2017-07-20 11:46:37');
INSERT INTO `sys_permission` VALUES ('1ab02abf2c924d889c132a6d59186f56', '编辑权限', 'bjqx', 'terminal:userposition:updatePositionPermission', '5ab7801b35b445c58df71881be23605f', '4', '', '2', '', '0', '1', '2017-07-19 09:54:16', null, '2017-07-19 09:54:16');
INSERT INTO `sys_permission` VALUES ('1e22c181da314ff3a542ad0227c3e77b', '修改', 'UserPositionUpdate', 'terminal:userposition:update', '5ab7801b35b445c58df71881be23605f', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('2', '管理员列表', 'userManager', null, '1', '1', '/jsp/sys/user/userManager.jsp', '1', 'fa fa-user', '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('20', '新增', 'roleAdd', 'sys:role:save,sys:menu:Description', '3', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('21', '修改', 'roleUpdate', 'sys:role:update,sys:menu:Description', '3', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('210d74bd061a45baa9423bc85f0878d7', '新增', 'DocumentRecordAdd', 'synthesize:documentrecord:save', '4fb41c6d5d7844b5968b7b4e2dd6cbef', '0', null, '2', null, '1', null, null, '1', '2017-08-17 16:52:26');
INSERT INTO `sys_permission` VALUES ('216c1bf527774766b78e88bb3515f0af', '查看', 'UserInfoSelect', 'terminal:userinfo:list,terminal:userinfo:info', '829d155442b64d338522c19864ef36ca', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('22', '删除', 'roleDelete', 'sys:role:delete', '3', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('23', '查看', 'menuSelect', 'sys:menu:list,sys:menu:info', '4', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('23c863987a3741ffbc27f344d4360a64', '版本控制', 'VersionControlManager', '', 'df9ee36ffee74a238e7e6379b3bf8db5', '6', '/jsp/terminal/versioncontrol/versioncontrol.jsp', '1', '', '0', null, null, '1', '2017-07-18 09:41:08');
INSERT INTO `sys_permission` VALUES ('24', '新增', 'menuAdd', 'sys:menu:save,sys:menu:select', '4', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('25', '修改', 'menuUpdate', 'sys:menu:update,sys:menu:select', '4', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('26', '删除', 'menuDelete', 'sys:menu:delete', '4', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('266d6e24bc6c4f2584820a2a965093a5', '查看', 'NewsContentSelect', 'synthesize:newscontent:list,synthesize:newscontent:info', 'd422bcc454c5482ea7b4cb9b7f78780d', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('2681bed9e5304b8c84b1464593e3d775', '新增', 'NewsTypeAdd', 'terminal:newstype:save', '19ad51e8fbf340888c0c6e6d5d735b86', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('277d8490101641af9ccd143f39a5c2fe', '导入用户', 'importUser', 'terminal:userinfo:import', '829d155442b64d338522c19864ef36ca', null, '', '2', '', '0', '1', '2017-09-28 14:39:37', null, '2017-09-28 14:39:37');
INSERT INTO `sys_permission` VALUES ('28', '代码生成器', 'generator', 'sys:generator:list,sys:generator:code', '1', '8', '/jsp/sys/generator/generator.jsp', '1', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('29', '系统日志', 'logManager', 'sys:syslog:list', '1', '7', '/jsp/sys/syslog/syslog.jsp', '1', 'fa fa-file-text-o', '0', null, null, '1', '2017-07-17 13:53:43');
INSERT INTO `sys_permission` VALUES ('3', '角色管理', 'roleManager', null, '1', '2', '/jsp/sys/role/roleManager.jsp', '1', 'fa fa-user-secret', '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('30b5d3af656d465891e6df7d0f69351c', '查看', 'VideoContentSelect', 'synthesize:videocontent:list,synthesize:videocontent:info', '56de4848859f4ddd9793e032e0aa0fc7', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('30d14f69757c40179cebfa816157fd78', '查看', 'VideoTypeSelect', 'terminal:videotype:list,terminal:videotype:info', 'a18424c90d264aa19c5b21832bbdc71d', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('31', '分配角色', 'fpjs', 'sys:user:editRole,sys:user:roleview', '2', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('31558a634bb443f4afafdd407504ce9c', '新闻审批', 'xwsp', 'synthesize:newscontent:approve', 'fc19053a93f649dc85c84034a1baf588', '1', '', '2', '', '0', '1', '2017-07-21 09:41:55', '1', '2017-07-22 17:44:13');
INSERT INTO `sys_permission` VALUES ('316a8c9f26964ceba60a196173b432e5', '删除', 'LeaveRecordDelete', 'synthesize:leaverecord:delete', '021b6ecbe6744863a1d645d63112346f', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('32', '重置密码', 'czma', 'sys:user:updateUserPwd', '2', '0', '', '2', '', '0', '1', '2017-07-11 17:04:31', '1', '2017-07-11 17:04:33');
INSERT INTO `sys_permission` VALUES ('33', '分配角色权限', 'editUserRole', 'sys:role:editUserRole', '3', '0', null, '2', null, '0', null, '2017-07-12 16:06:31', null, '2017-07-12 16:06:34');
INSERT INTO `sys_permission` VALUES ('34', '分配角色权限', 'editRolePermission', 'sys:role:editRolePermission', '3', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('359117c14ea345138d9fa9619dbcbb3e', '字典配置', 'dictionaryManager', '', '1', '6', '/jsp/sys/sysdictionaryheader/sysdictionaryheader.jsp', '1', '', '1', null, null, '1', '2017-09-07 15:46:37');
INSERT INTO `sys_permission` VALUES ('366db7431a7f4ed7b8c9dafa37d2dc55', '查看', 'ck', 'synthesize:videoapprove:list', '0ad0c8db5b304b4e84a92dc5d0d62350', null, '', '2', '', '0', '1', '2017-07-25 10:51:02', null, '2017-07-25 10:51:02');
INSERT INTO `sys_permission` VALUES ('36ec7660c8724d74ab9e416c99c8c5ad', '新闻评论', 'xwpl', 'synthesize:videoComment:list', '56de4848859f4ddd9793e032e0aa0fc7', null, '', '2', '', '0', '1', '2017-08-01 09:31:21', null, '2017-08-01 09:31:21');
INSERT INTO `sys_permission` VALUES ('372a662dbb5c454a85ed4a8f5a7dfb7b', '视频审批', 'sp', 'synthesize:videoapprove:approve', '0ad0c8db5b304b4e84a92dc5d0d62350', null, '', '2', '', '0', '1', '2017-07-25 10:50:27', '1', '2017-07-25 11:35:48');
INSERT INTO `sys_permission` VALUES ('379efc55f8d94533bc5fbec8c302e509', '知识库类型', 'KnowledgeTypeManager', '', 'df9ee36ffee74a238e7e6379b3bf8db5', '6', '/jsp/terminal/knowledgetype/knowledgetype.jsp', '1', '', '0', null, null, '1', '2017-07-19 14:51:26');
INSERT INTO `sys_permission` VALUES ('3a03c678ae0442b681105a2aa8db97ac', '查看', 'LeaveRecordSelect', 'synthesize:leaverecord:list,synthesize:leaverecord:info', '021b6ecbe6744863a1d645d63112346f', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('3bc2db07e89c4441b6bfa23d591b0682', '综合管理', 'planConfig', '', '0', '0', '', '0', '', '0', '1', '2017-07-18 09:50:21', '1', '2017-09-07 15:46:03');
INSERT INTO `sys_permission` VALUES ('3cb7ca8a9c92426baabd420e0537192e', '删除', 'UserInfoDelete', 'terminal:userinfo:delete', '829d155442b64d338522c19864ef36ca', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('3f604090adc344ac825961b4a492f01f', '日志删除', 'logdel', 'sys:syslog:delete', '29', null, '', '2', '', '0', '1', '2017-08-25 10:51:55', null, '2017-08-25 10:51:55');
INSERT INTO `sys_permission` VALUES ('4', '菜单管理', 'permissionManager', '', '1', '4', '/jsp/sys/syspermission/syspermission.jsp', '1', 'fa fa-th-list', '0', null, null, '1', '2017-07-27 15:15:05');
INSERT INTO `sys_permission` VALUES ('4785a29ab01b4122a2a3db69c70d93fa', '新增', 'UserPermissionAdd', 'terminal:userpermission:save', 'fde56b213f6847d2a48793598f732c33', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('47f0f067ad414669b9299c87b8e6aa7c', '新增', 'KnowledgeTypeAdd', 'terminal:knowledgetype:save', '379efc55f8d94533bc5fbec8c302e509', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('4a4a17433e964fe48a84572ad5f867fb', '编辑字典行', 'editDictionaryLine', 'sys:sysdictionaryline:save', '359117c14ea345138d9fa9619dbcbb3e', null, '', '2', '', '0', '1', '2017-07-17 10:24:56', '1', '2017-08-30 16:37:15');
INSERT INTO `sys_permission` VALUES ('4be5a1a034864bbab8601cbb24957077', '修改', 'UserPermissionUpdate', 'terminal:userpermission:update', 'fde56b213f6847d2a48793598f732c33', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('4e0beb89365447b581ad9a48f676d514', '查看', 'KnowledgeTypeSelect', 'terminal:knowledgetype:list,terminal:knowledgetype:info', '379efc55f8d94533bc5fbec8c302e509', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('4f7311897f5c49559f35d6e54d1ca51a', '新增', 'VideoTypeAdd', 'terminal:videotype:save', 'a18424c90d264aa19c5b21832bbdc71d', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('4fb41c6d5d7844b5968b7b4e2dd6cbef', '公文记录', 'DocumentRecordManager', '', '3bc2db07e89c4441b6bfa23d591b0682', '6', '/jsp/synthesize/documentrecord/documentrecord.jsp', '1', '', '0', null, null, '1', '2017-08-17 15:40:24');
INSERT INTO `sys_permission` VALUES ('5', 'SQL监控', 'SQL', null, '1', '5', '/druid/sql.html', '1', 'fa fa-bug', '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('52308ceecd0942d5b34c3056977c03a4', '查看', 'NewsTypeSelect', 'terminal:newstype:list,terminal:newstype:info', '19ad51e8fbf340888c0c6e6d5d735b86', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('54035364dd6e4aeebcbc3a59f7a26275', '查看行配置', 'ckhpz', 'sys:sysdictionaryline:list', '359117c14ea345138d9fa9619dbcbb3e', null, '', '2', '', '0', '1', '2017-08-30 14:01:38', null, '2017-08-30 14:01:38');
INSERT INTO `sys_permission` VALUES ('56de4848859f4ddd9793e032e0aa0fc7', '视频管理', 'VideoContentManager', '', '3bc2db07e89c4441b6bfa23d591b0682', '6', '/jsp/synthesize/videocontent/videocontent.jsp', '1', '', '0', null, null, '1', '2017-07-24 09:17:51');
INSERT INTO `sys_permission` VALUES ('59b6c7391e904bcea57ab465f9797366', '查看', 'UserPositionSelect', 'terminal:userposition:list,terminal:userposition:info', '5ab7801b35b445c58df71881be23605f', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('5ab7801b35b445c58df71881be23605f', '用户角色', 'CSRoleManager', '', 'df9ee36ffee74a238e7e6379b3bf8db5', '2', '/jsp/terminal/userposition/userposition.jsp', '1', '', '0', null, null, '1', '2017-08-22 15:33:29');
INSERT INTO `sys_permission` VALUES ('5c9614dd3b6c4c3e811616e89df9d681', '修改', 'SysDictionaryHeaderUpdate', 'sys:sysdictionaryheader:update', '359117c14ea345138d9fa9619dbcbb3e', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('5f9b652df5ef4362a44cf277475c6e3f', '修改', 'NewsContentUpdate', 'synthesize:newscontent:update', 'd422bcc454c5482ea7b4cb9b7f78780d', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('6', '定时任务', 'scheduleManager', '', '1', '5', '/jsp/sys/schedulejobconfig/schedulejobconfig.jsp', '1', '', '0', null, null, '1', '2017-07-17 14:49:36');
INSERT INTO `sys_permission` VALUES ('65cc45427d0b4ebdafdd4cb3f9e6d32a', '删除', 'documentTemplateDelete', 'synthesize:documenttemplate:delete', 'ab64404c19914b199ad76f51115ab03c', '0', '', '2', '', '0', null, null, '1', '2017-08-07 09:44:40');
INSERT INTO `sys_permission` VALUES ('6801ff7bd6de4571b77e44f2e3bdd721', '新增', 'VideoContentAdd', 'synthesize:videocontent:save', '56de4848859f4ddd9793e032e0aa0fc7', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('69946e46f5d445e38e05622a085dc500', '删除', 'DocumentRecordDelete', 'synthesize:documentrecord:delete', '4fb41c6d5d7844b5968b7b4e2dd6cbef', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('7', '查看', 'scheduleSelect', 'sys:schedule:list,sys:schedule:info', '6', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('701adb56759145e59b576456cb3be660', '新闻评论查询', 'xwplcx', 'synthesize:newsComment:list', 'd422bcc454c5482ea7b4cb9b7f78780d', null, '', '2', '', '0', '1', '2017-07-31 14:35:32', '1', '2017-07-31 14:36:27');
INSERT INTO `sys_permission` VALUES ('707b2ff5d4714d4095a47013d9d4ed36', '删除', 'VersionControlDelete', 'terminal:versioncontrol:delete', '23c863987a3741ffbc27f344d4360a64', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('711efd8248e54d8cb7de0330bc753871', '查看', 'VersionControlSelect', 'terminal:versioncontrol:list,terminal:versioncontrol:info', '23c863987a3741ffbc27f344d4360a64', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('719c479313004009843ec47275c0b601', '修改', 'NewsTypeUpdate', 'terminal:newstype:update', '19ad51e8fbf340888c0c6e6d5d735b86', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('79244df67ac54f39bdd62968b8cc35a1', '评论审批', 'xwplsp', 'synthesize:newsComment:approve', 'd422bcc454c5482ea7b4cb9b7f78780d', null, '', '2', '', '0', '1', '2017-07-31 14:37:18', null, '2017-07-31 14:37:18');
INSERT INTO `sys_permission` VALUES ('7e609ed1f1c142e18eb7ccfe69479e5e', '删除', 'NewsContentDelete', 'synthesize:newscontent:delete', 'd422bcc454c5482ea7b4cb9b7f78780d', '0', '', '2', '', '0', null, null, '1', '2017-07-21 09:44:51');
INSERT INTO `sys_permission` VALUES ('8', '新增', 'scheduleAdd', 'sys:schedule:save', '6', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('829d155442b64d338522c19864ef36ca', '用户信息', 'UserInfoManager', '', 'df9ee36ffee74a238e7e6379b3bf8db5', '1', '/jsp/terminal/userinfo/userinfo.jsp', '1', '', '0', null, null, '1', '2017-07-18 09:44:27');
INSERT INTO `sys_permission` VALUES ('88d439eb791246828d64e15f29c7ef1d', '查看', 'SysDictionaryHeaderSelect', 'sys:sysdictionaryheader:list,sys:sysdictionaryheader:info', '359117c14ea345138d9fa9619dbcbb3e', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('8bc11eae99f3477ca6e8de2e4f4788e7', '修改', 'UserInfoUpdate', 'terminal:userinfo:update', '829d155442b64d338522c19864ef36ca', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('8cb835643c764976ab3931af9c4ca4f7', '修改', 'DocumentRecordUpdate', 'synthesize:documentrecord:update', '4fb41c6d5d7844b5968b7b4e2dd6cbef', '0', null, '2', null, '1', null, null, '1', '2017-08-17 16:52:26');
INSERT INTO `sys_permission` VALUES ('9', '修改', 'scheduleUpdate', 'sys:schedule:update', '6', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('94117f4a314341d988c69388c5be2047', '查看', 'DocumentRecordSelect', 'synthesize:documentrecord:list,synthesize:documentrecord:info', '4fb41c6d5d7844b5968b7b4e2dd6cbef', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('968516d69d9d4900a75a73522f0af6b6', '修改', 'VideoTypeUpdate', 'terminal:videotype:update', 'a18424c90d264aa19c5b21832bbdc71d', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('96a9fa8f993d47c299d7408f887d8264', '新增', 'documentTemplateAdd', 'synthesize:documenttemplate:save', 'ab64404c19914b199ad76f51115ab03c', '0', '', '2', '', '0', null, null, '1', '2017-08-07 09:45:01');
INSERT INTO `sys_permission` VALUES ('a18424c90d264aa19c5b21832bbdc71d', '视频类型', 'VideoTypeManager', '', 'df9ee36ffee74a238e7e6379b3bf8db5', '6', '/jsp/terminal/videotype/videotype.jsp', '1', '', '0', null, null, '1', '2017-07-19 14:50:57');
INSERT INTO `sys_permission` VALUES ('a7cac2376ac4467fb47b1d200a136b22', '新增', 'VersionControlAdd', 'terminal:versioncontrol:save', '23c863987a3741ffbc27f344d4360a64', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('aa3a0cd195ed4961876a9c24ff8255b8', '公文模板', 'gwmb', '', 'df9ee36ffee74a238e7e6379b3bf8db5', '9', '/jsp/terminal/template/template.jsp', '1', '', '1', '1', '2017-08-01 10:47:53', '1', '2017-08-17 09:40:21');
INSERT INTO `sys_permission` VALUES ('ab64404c19914b199ad76f51115ab03c', '公文模板', 'documentTemplateManager', '', '3bc2db07e89c4441b6bfa23d591b0682', '6', '/jsp/synthesize/documenttemplate/documenttemplate.jsp', '1', '', '0', null, null, '1', '2017-08-07 10:53:59');
INSERT INTO `sys_permission` VALUES ('ac5aae1cacb74ac6aa1c93f2930d95b0', '新增', 'UserPositionAdd', 'terminal:userposition:save', '5ab7801b35b445c58df71881be23605f', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('ad576c95c4b74c07b4f785d5b98b0d80', '删除', 'VideoContentDelete', 'synthesize:videocontent:delete', '56de4848859f4ddd9793e032e0aa0fc7', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('b0df9964e7394d8aa1b7b8ec5ff1c248', '查看', 'UserPermissionSelect', 'terminal:userpermission:list,terminal:userpermission:info', 'fde56b213f6847d2a48793598f732c33', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('b544e521a97b4325b43fce85b545591a', '查看', 'spck', 'synthesize:newsapprove:list,ynthesize:newscontent:', 'fc19053a93f649dc85c84034a1baf588', '2', '', '2', '', '0', '1', '2017-07-22 17:45:38', null, '2017-07-22 17:45:38');
INSERT INTO `sys_permission` VALUES ('b55ae81ac0d14ec0bc7c42bf81c0851e', '查看', 'KnowledgeInfoSelect', 'synthesize:knowledgeinfo:list,synthesize:knowledgeinfo:info', 'e953f9b367d64533a163e57170d6c967', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('b724d9e0c40d4ebfbb1e122805cfa308', '删除', 'VideoTypeDelete', 'terminal:videotype:delete', 'a18424c90d264aa19c5b21832bbdc71d', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('b776db7291274922aeecbab7ed6f16af', '日志查看', 'rzck', 'sys:schedulelog:log', 'd62b8d013f974cceb96bd39307d528e5', null, '', '2', '', '0', '1', '2017-07-17 16:36:51', null, '2017-07-17 16:36:51');
INSERT INTO `sys_permission` VALUES ('b8912855517649b5b44b35af69468571', '新增', 'LeaveRecordAdd', 'synthesize:leaverecord:save', '021b6ecbe6744863a1d645d63112346f', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('cfa696b2b081437cb269269a267a1b8d', '删除', 'UserPositionDelete', 'terminal:userposition:delete', '5ab7801b35b445c58df71881be23605f', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('d422bcc454c5482ea7b4cb9b7f78780d', '新闻管理', 'NewsContentManager', '', '3bc2db07e89c4441b6bfa23d591b0682', '5', '/jsp/synthesize/newscontent/newscontent.jsp', '1', '', '0', null, null, '1', '2017-07-20 11:32:55');
INSERT INTO `sys_permission` VALUES ('d4f78f167e094308b1482f722ae7bd4f', '删除', 'SysDictionaryHeaderDelete', 'sys:sysdictionaryheader:delete', '359117c14ea345138d9fa9619dbcbb3e', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('d62b8d013f974cceb96bd39307d528e5', '任务日志', 'ScheduleJobLogManager', '', '1', '6', '/jsp/sys/schedulejoblog/schedulejoblog.jsp', '1', '', '0', null, null, '1', '2017-07-20 11:46:55');
INSERT INTO `sys_permission` VALUES ('d958b646fc1a4626b5a6b63e013efa27', '修改', 'LeaveRecordUpdate', 'synthesize:leaverecord:update', '021b6ecbe6744863a1d645d63112346f', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('dafd2da01ec24e7596c485ea4e10d18a', 'asds', 'asda', 'asd', '3bc2db07e89c4441b6bfa23d591b0682', null, '', '0', '', '1', '1', '2017-09-07 15:46:28', '1', '2017-09-07 15:46:37');
INSERT INTO `sys_permission` VALUES ('df9ee36ffee74a238e7e6379b3bf8db5', '终端配置', 'zdpz', '', '0', '1', '', '0', '', '0', '1', '2017-07-17 18:00:11', '1', '2017-07-27 17:34:41');
INSERT INTO `sys_permission` VALUES ('e17a230e604c481894c1c946046d0513', '导出用户', 'exportUserInfo', 'terminal:userinfo:export', '829d155442b64d338522c19864ef36ca', null, '', '2', '', '0', '1', '2017-09-28 13:43:19', null, '2017-09-28 13:43:19');
INSERT INTO `sys_permission` VALUES ('e7d4bafb17f74bad8dcc0a6b1f9113e0', '新增', 'SysDictionaryHeaderAdd', 'sys:sysdictionaryheader:save', '359117c14ea345138d9fa9619dbcbb3e', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('e953f9b367d64533a163e57170d6c967', '知识库', 'KnowledgeInfoManager', '', '3bc2db07e89c4441b6bfa23d591b0682', '6', '/jsp/synthesize/knowledgeinfo/knowledgeinfo.jsp', '1', '', '0', null, null, '1', '2017-07-20 09:02:41');
INSERT INTO `sys_permission` VALUES ('ee5542f2c6af4fde84485de895102c8e', '接口文档', 'API', null, '1', '9', '/swagger-ui.html#!', '1', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('f07d2351324944eb8444f7ef28be9d59', '修改', 'VersionControlUpdate', 'terminal:versioncontrol:update', '23c863987a3741ffbc27f344d4360a64', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('f607c203fa584a97a3beb31596329770', '删除', 'NewsTypeDelete', 'terminal:newstype:delete', '19ad51e8fbf340888c0c6e6d5d735b86', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('f653d1ccaae34b6f87281ef781c7e9f6', '删除', 'UserPermissionDelete', 'terminal:userpermission:delete', 'fde56b213f6847d2a48793598f732c33', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('f774e6fc094546218862accb1855ca2f', '新增', 'UserInfoAdd', 'terminal:userinfo:save', '829d155442b64d338522c19864ef36ca', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('f8cf62efd66d4afb932e35aaa874ad8a', '日志查看', 'rzck', 'sys:syslog:info', '29', null, '', '2', '', '0', '1', '2017-08-17 15:38:10', '1', '2017-08-25 10:48:51');
INSERT INTO `sys_permission` VALUES ('f915edf816c641338c3158b661da6ab3', '修改', 'KnowledgeTypeUpdate', 'terminal:knowledgetype:update', '379efc55f8d94533bc5fbec8c302e509', '0', null, '2', null, '0', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('fc05336be0b34df98b68e2f842c140a9', '评论审批', 'plsp', 'synthesize:videoComment:approve', '56de4848859f4ddd9793e032e0aa0fc7', null, '', '2', '', '0', '1', '2017-08-01 09:30:47', null, '2017-08-01 09:30:47');
INSERT INTO `sys_permission` VALUES ('fc19053a93f649dc85c84034a1baf588', '新闻审批', 'xwsp', '', '3bc2db07e89c4441b6bfa23d591b0682', '1', '/jsp/synthesize/newsapprove/newscontent.jsp', '1', '', '0', '1', '2017-07-22 17:21:36', '1', '2017-07-22 17:25:23');
INSERT INTO `sys_permission` VALUES ('fde56b213f6847d2a48793598f732c33', '终端权限', 'UserPermissionManager', '', 'df9ee36ffee74a238e7e6379b3bf8db5', '3', '/jsp/terminal/userpermission/userpermission.jsp', '1', '', '0', null, null, '1', '2017-07-18 09:44:48');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `RoleID` varchar(32) NOT NULL COMMENT '角色ID',
  `RoleName` varchar(50) NOT NULL COMMENT '角色名称',
  `Memo` varchar(200) DEFAULT NULL COMMENT '备注',
  `EnabledFlag` varchar(1) DEFAULT '0' COMMENT '可用状态',
  `CreateBy` varchar(32) DEFAULT NULL COMMENT '创建者',
  `CreateDate` datetime DEFAULT NULL COMMENT '创建日期',
  `UpdateBy` varchar(32) DEFAULT NULL COMMENT '修改人',
  `UpdateDate` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色管理';

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `RelationID` varchar(32) NOT NULL COMMENT '关系ID',
  `RoleID` varchar(32) NOT NULL COMMENT '角色ID',
  `PermissionID` varchar(32) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`RelationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限关系表';

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('03f9c22ec7a54510862876bf12ecd107', '36d3fd48ecc94c65ab4bad0e5a840496', 'b724d9e0c40d4ebfbb1e122805cfa308');
INSERT INTO `sys_role_permission` VALUES ('0bcbaddc2fe5447ab85fd98bb72ae986', '36d3fd48ecc94c65ab4bad0e5a840496', 'b544e521a97b4325b43fce85b545591a');
INSERT INTO `sys_role_permission` VALUES ('0fdfc6b7554a47dcb316fba41c5c57e5', '36d3fd48ecc94c65ab4bad0e5a840496', 'fc05336be0b34df98b68e2f842c140a9');
INSERT INTO `sys_role_permission` VALUES ('1bc3eee65a9a4517b4850a50005c13c4', '36d3fd48ecc94c65ab4bad0e5a840496', '30d14f69757c40179cebfa816157fd78');
INSERT INTO `sys_role_permission` VALUES ('1c7d1e58340f446f9c914e3cdf306c65', '36d3fd48ecc94c65ab4bad0e5a840496', '4e0beb89365447b581ad9a48f676d514');
INSERT INTO `sys_role_permission` VALUES ('1f79734dba104a1d8417a2930971273c', '36d3fd48ecc94c65ab4bad0e5a840496', '12f8aad7974d4788a2679d084dd6f422');
INSERT INTO `sys_role_permission` VALUES ('21189ae9cde0460e93a8dc6794dc2df4', '36d3fd48ecc94c65ab4bad0e5a840496', '1e22c181da314ff3a542ad0227c3e77b');
INSERT INTO `sys_role_permission` VALUES ('23191d30e9a54d9a90cad5b600940fca', '36d3fd48ecc94c65ab4bad0e5a840496', 'a7cac2376ac4467fb47b1d200a136b22');
INSERT INTO `sys_role_permission` VALUES ('30038d80adcd49b881ac71e3a379efbc', '36d3fd48ecc94c65ab4bad0e5a840496', '711efd8248e54d8cb7de0330bc753871');
INSERT INTO `sys_role_permission` VALUES ('32ec62bdb61e47058b6976e5cc1cd6b2', '36d3fd48ecc94c65ab4bad0e5a840496', '8bc11eae99f3477ca6e8de2e4f4788e7');
INSERT INTO `sys_role_permission` VALUES ('3415d8bb6148400589b243ad7c6e74e6', '36d3fd48ecc94c65ab4bad0e5a840496', 'f607c203fa584a97a3beb31596329770');
INSERT INTO `sys_role_permission` VALUES ('3708714af33e4314b73712559345f9c4', '36d3fd48ecc94c65ab4bad0e5a840496', '4785a29ab01b4122a2a3db69c70d93fa');
INSERT INTO `sys_role_permission` VALUES ('3875e4904fa845fe9c062a6d6da1bbb3', '36d3fd48ecc94c65ab4bad0e5a840496', '47f0f067ad414669b9299c87b8e6aa7c');
INSERT INTO `sys_role_permission` VALUES ('3dcb5542e7fa45139f34f5cb3d6396da', '36d3fd48ecc94c65ab4bad0e5a840496', 'd422bcc454c5482ea7b4cb9b7f78780d');
INSERT INTO `sys_role_permission` VALUES ('413241cc3fc246c586ee13a5be174d75', '36d3fd48ecc94c65ab4bad0e5a840496', '94117f4a314341d988c69388c5be2047');
INSERT INTO `sys_role_permission` VALUES ('4513e0160b1c4c41b920cbc379856fbe', '36d3fd48ecc94c65ab4bad0e5a840496', '707b2ff5d4714d4095a47013d9d4ed36');
INSERT INTO `sys_role_permission` VALUES ('46a59b2533474b09b5aee428d07bcff2', '36d3fd48ecc94c65ab4bad0e5a840496', '5ab7801b35b445c58df71881be23605f');
INSERT INTO `sys_role_permission` VALUES ('49972a8953f94317b09eb1a0c381db46', '36d3fd48ecc94c65ab4bad0e5a840496', '968516d69d9d4900a75a73522f0af6b6');
INSERT INTO `sys_role_permission` VALUES ('4d158e4292914b5388b074045ce22ca7', '36d3fd48ecc94c65ab4bad0e5a840496', 'fde56b213f6847d2a48793598f732c33');
INSERT INTO `sys_role_permission` VALUES ('4e0782c8973b486b97652147c9c67e98', '36d3fd48ecc94c65ab4bad0e5a840496', '316a8c9f26964ceba60a196173b432e5');
INSERT INTO `sys_role_permission` VALUES ('4ffd07b9834c48d9a2f66b2827800464', '36d3fd48ecc94c65ab4bad0e5a840496', '4f7311897f5c49559f35d6e54d1ca51a');
INSERT INTO `sys_role_permission` VALUES ('5623fbd1fdb247caa7e5ad9ba5b07005', '36d3fd48ecc94c65ab4bad0e5a840496', 'd958b646fc1a4626b5a6b63e013efa27');
INSERT INTO `sys_role_permission` VALUES ('5c103c6aed7d4e92b2d3d1d50d89801e', '36d3fd48ecc94c65ab4bad0e5a840496', '30b5d3af656d465891e6df7d0f69351c');
INSERT INTO `sys_role_permission` VALUES ('5f33a7a65a9d4c9e8fcb720913e7d108', '36d3fd48ecc94c65ab4bad0e5a840496', 'ad576c95c4b74c07b4f785d5b98b0d80');
INSERT INTO `sys_role_permission` VALUES ('6030af6f1dfd44c595f88c3393f48346', '36d3fd48ecc94c65ab4bad0e5a840496', '1ab02abf2c924d889c132a6d59186f56');
INSERT INTO `sys_role_permission` VALUES ('61ed203ea7a34d41b4e8e5167494b9a9', '36d3fd48ecc94c65ab4bad0e5a840496', '7e609ed1f1c142e18eb7ccfe69479e5e');
INSERT INTO `sys_role_permission` VALUES ('62aa1d23108f495986364bfb2b6ca788', '36d3fd48ecc94c65ab4bad0e5a840496', '216c1bf527774766b78e88bb3515f0af');
INSERT INTO `sys_role_permission` VALUES ('64e12e6050744fc18786bfa579202ac3', '36d3fd48ecc94c65ab4bad0e5a840496', 'b8912855517649b5b44b35af69468571');
INSERT INTO `sys_role_permission` VALUES ('68e335b0a613471c9ecf2d1b6405a160', '36d3fd48ecc94c65ab4bad0e5a840496', 'ac5aae1cacb74ac6aa1c93f2930d95b0');
INSERT INTO `sys_role_permission` VALUES ('68f4bca24399405ca14bdc5f152f1e49', '36d3fd48ecc94c65ab4bad0e5a840496', '19ad51e8fbf340888c0c6e6d5d735b86');
INSERT INTO `sys_role_permission` VALUES ('6aaaaf1d87494a75ac03dc34832ae9f7', '36d3fd48ecc94c65ab4bad0e5a840496', '1377228d4fde4208b78507f30193537d');
INSERT INTO `sys_role_permission` VALUES ('6c84ff7ee4f64bc58d2abdab2e264ca1', '36d3fd48ecc94c65ab4bad0e5a840496', '2681bed9e5304b8c84b1464593e3d775');
INSERT INTO `sys_role_permission` VALUES ('71ec8f3796ff4e77b49f245f3a2f5e5f', '36d3fd48ecc94c65ab4bad0e5a840496', '266d6e24bc6c4f2584820a2a965093a5');
INSERT INTO `sys_role_permission` VALUES ('7334ed3b65e34b94820f3e509eaa7b02', '36d3fd48ecc94c65ab4bad0e5a840496', 'a18424c90d264aa19c5b21832bbdc71d');
INSERT INTO `sys_role_permission` VALUES ('74ed67cce991453abe9f969e57336543', '36d3fd48ecc94c65ab4bad0e5a840496', '3bc2db07e89c4441b6bfa23d591b0682');
INSERT INTO `sys_role_permission` VALUES ('74f57b266b014f9581c0fc22140e0bdf', '36d3fd48ecc94c65ab4bad0e5a840496', '4be5a1a034864bbab8601cbb24957077');
INSERT INTO `sys_role_permission` VALUES ('7802af44d85c45c187de8ec2663b6c7a', '36d3fd48ecc94c65ab4bad0e5a840496', '366db7431a7f4ed7b8c9dafa37d2dc55');
INSERT INTO `sys_role_permission` VALUES ('798ef6dce5594892955bc0ccf27915c9', '36d3fd48ecc94c65ab4bad0e5a840496', '719c479313004009843ec47275c0b601');
INSERT INTO `sys_role_permission` VALUES ('7e2a902f72d14bbe996ab664c540a00b', '36d3fd48ecc94c65ab4bad0e5a840496', 'f915edf816c641338c3158b661da6ab3');
INSERT INTO `sys_role_permission` VALUES ('7f4ea154d1764b6886a56b4c89797170', '36d3fd48ecc94c65ab4bad0e5a840496', 'fc19053a93f649dc85c84034a1baf588');
INSERT INTO `sys_role_permission` VALUES ('817608b1602d47628cdbbb888589fba0', '36d3fd48ecc94c65ab4bad0e5a840496', '17081d8a59034e4183e595348e8862ac');
INSERT INTO `sys_role_permission` VALUES ('82b20679a36a4a1ba0fd3c1574068862', '36d3fd48ecc94c65ab4bad0e5a840496', '372a662dbb5c454a85ed4a8f5a7dfb7b');
INSERT INTO `sys_role_permission` VALUES ('885e97947c4f41e8b646c2088cb7cbba', '36d3fd48ecc94c65ab4bad0e5a840496', '3cb7ca8a9c92426baabd420e0537192e');
INSERT INTO `sys_role_permission` VALUES ('8b8e4694073c4bb39a9dbeb5b84aa158', '36d3fd48ecc94c65ab4bad0e5a840496', '4fb41c6d5d7844b5968b7b4e2dd6cbef');
INSERT INTO `sys_role_permission` VALUES ('9097ec73aa3e4e28831ce573ebaa7a3f', '36d3fd48ecc94c65ab4bad0e5a840496', '021b6ecbe6744863a1d645d63112346f');
INSERT INTO `sys_role_permission` VALUES ('9d5bcf4abd8a43c6813f12c998e52d28', '36d3fd48ecc94c65ab4bad0e5a840496', '31558a634bb443f4afafdd407504ce9c');
INSERT INTO `sys_role_permission` VALUES ('a0d05729c93e425c9e6036e1ee823a19', '36d3fd48ecc94c65ab4bad0e5a840496', 'f07d2351324944eb8444f7ef28be9d59');
INSERT INTO `sys_role_permission` VALUES ('aa902445d35147cd970d42dbf680121a', '36d3fd48ecc94c65ab4bad0e5a840496', '65cc45427d0b4ebdafdd4cb3f9e6d32a');
INSERT INTO `sys_role_permission` VALUES ('ab9a398c13ce4a52a7e4916edf9156e8', '36d3fd48ecc94c65ab4bad0e5a840496', 'ab64404c19914b199ad76f51115ab03c');
INSERT INTO `sys_role_permission` VALUES ('abba958344e943be9d2fdb943adfd565', '36d3fd48ecc94c65ab4bad0e5a840496', 'f653d1ccaae34b6f87281ef781c7e9f6');
INSERT INTO `sys_role_permission` VALUES ('ac0093638b2348ca98c36da1dcfb70c5', '36d3fd48ecc94c65ab4bad0e5a840496', '79244df67ac54f39bdd62968b8cc35a1');
INSERT INTO `sys_role_permission` VALUES ('ade6d769bf1146b9ae098fbcda5011e0', '36d3fd48ecc94c65ab4bad0e5a840496', '56de4848859f4ddd9793e032e0aa0fc7');
INSERT INTO `sys_role_permission` VALUES ('b0225d680e3d427f813eb7466934ebc3', '36d3fd48ecc94c65ab4bad0e5a840496', '080c926d0b8c49d7834053397556e365');
INSERT INTO `sys_role_permission` VALUES ('b0a57694736644769623eb826d9635c3', '36d3fd48ecc94c65ab4bad0e5a840496', '02d007872a4d479382c0e31107fa32f9');
INSERT INTO `sys_role_permission` VALUES ('b32901224efa4a7fad2f55e0d61ecf7f', '36d3fd48ecc94c65ab4bad0e5a840496', '23c863987a3741ffbc27f344d4360a64');
INSERT INTO `sys_role_permission` VALUES ('b34224866d7945f1b4a877c0d43e7c70', '36d3fd48ecc94c65ab4bad0e5a840496', '52308ceecd0942d5b34c3056977c03a4');
INSERT INTO `sys_role_permission` VALUES ('b45f923692ca4f0cb00f0d56fc22e56b', '36d3fd48ecc94c65ab4bad0e5a840496', '0ad0c8db5b304b4e84a92dc5d0d62350');
INSERT INTO `sys_role_permission` VALUES ('b82cb0c15542489984173b5471a4d5c7', '36d3fd48ecc94c65ab4bad0e5a840496', 'df9ee36ffee74a238e7e6379b3bf8db5');
INSERT INTO `sys_role_permission` VALUES ('b8ebca08d89c4545bfba1748ab867222', '36d3fd48ecc94c65ab4bad0e5a840496', 'cfa696b2b081437cb269269a267a1b8d');
INSERT INTO `sys_role_permission` VALUES ('b9b04147a3e34c298f0920c9855c870a', '36d3fd48ecc94c65ab4bad0e5a840496', '13de128b429b452a898a97cd8d06a9fb');
INSERT INTO `sys_role_permission` VALUES ('bbb6617401804b3db37a1845cef353a2', '36d3fd48ecc94c65ab4bad0e5a840496', 'f774e6fc094546218862accb1855ca2f');
INSERT INTO `sys_role_permission` VALUES ('bbc87c4ccc9c42918ce8085657532bf0', '36d3fd48ecc94c65ab4bad0e5a840496', '1948760d714e43238c4399edac4f3601');
INSERT INTO `sys_role_permission` VALUES ('bc056004d80648459ecbaf96a1e5cd2c', '36d3fd48ecc94c65ab4bad0e5a840496', '36ec7660c8724d74ab9e416c99c8c5ad');
INSERT INTO `sys_role_permission` VALUES ('bc2d0c8b10644e749ef442e7c7c51bd7', '36d3fd48ecc94c65ab4bad0e5a840496', '379efc55f8d94533bc5fbec8c302e509');
INSERT INTO `sys_role_permission` VALUES ('bf1b0bbb89cf4f72b6a6654a4a073f18', '36d3fd48ecc94c65ab4bad0e5a840496', 'b55ae81ac0d14ec0bc7c42bf81c0851e');
INSERT INTO `sys_role_permission` VALUES ('c3174f5338a5453eb069a95f20e0f23d', '36d3fd48ecc94c65ab4bad0e5a840496', 'b0df9964e7394d8aa1b7b8ec5ff1c248');
INSERT INTO `sys_role_permission` VALUES ('c3361ced538a4d32886ad9fe11a74274', '36d3fd48ecc94c65ab4bad0e5a840496', '69946e46f5d445e38e05622a085dc500');
INSERT INTO `sys_role_permission` VALUES ('d7e64c9902bc40f88dfcee480f60be35', '36d3fd48ecc94c65ab4bad0e5a840496', 'e953f9b367d64533a163e57170d6c967');
INSERT INTO `sys_role_permission` VALUES ('e2f3767d8c6649fb8a65ea0f1f7d5615', '36d3fd48ecc94c65ab4bad0e5a840496', '829d155442b64d338522c19864ef36ca');
INSERT INTO `sys_role_permission` VALUES ('e9d77b72ba5a430a8cc7a7904b53a027', '36d3fd48ecc94c65ab4bad0e5a840496', '59b6c7391e904bcea57ab465f9797366');
INSERT INTO `sys_role_permission` VALUES ('f2692f28ebd84cf2933562c364a91423', '36d3fd48ecc94c65ab4bad0e5a840496', '6801ff7bd6de4571b77e44f2e3bdd721');
INSERT INTO `sys_role_permission` VALUES ('f3376a84813543cda87c59314cdc82ff', '36d3fd48ecc94c65ab4bad0e5a840496', '96a9fa8f993d47c299d7408f887d8264');
INSERT INTO `sys_role_permission` VALUES ('f3fe3275bcf1498592135a670102f323', '36d3fd48ecc94c65ab4bad0e5a840496', '701adb56759145e59b576456cb3be660');
INSERT INTO `sys_role_permission` VALUES ('f6a7cc336d5c49b0baa593e11c6960c0', '36d3fd48ecc94c65ab4bad0e5a840496', '02b99bf2c8c44b8cb95a3c7ad67a3f3f');
INSERT INTO `sys_role_permission` VALUES ('f78373bbd0554429aba90d2f6fac84a6', '36d3fd48ecc94c65ab4bad0e5a840496', '5f9b652df5ef4362a44cf277475c6e3f');
INSERT INTO `sys_role_permission` VALUES ('fc8495559f264c15820d785865578db0', '36d3fd48ecc94c65ab4bad0e5a840496', '3a03c678ae0442b681105a2aa8db97ac');
INSERT INTO `sys_role_permission` VALUES ('fe559abc0c2e410bb08facee05f40ec5', '36d3fd48ecc94c65ab4bad0e5a840496', '136da41456674ed4b8c194ef055b5094');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `UserID` varchar(32) NOT NULL COMMENT '用户ID',
  `LoginName` varchar(80) NOT NULL COMMENT '登录名',
  `OrgCode` varchar(32) DEFAULT NULL COMMENT '机构编码',
  `Password` varchar(80) NOT NULL COMMENT '密码',
  `LoginIP` varchar(18) DEFAULT NULL COMMENT '登陆IP',
  `UserType` varchar(1) DEFAULT NULL COMMENT '用户类型',
  `Memo` varchar(200) DEFAULT NULL COMMENT '备注',
  `UserName` varchar(80) DEFAULT NULL COMMENT '姓名',
  `CreateBy` varchar(32) DEFAULT NULL COMMENT '创建者',
  `CreateDate` datetime DEFAULT NULL COMMENT '创建日期',
  `UpdateBy` varchar(32) DEFAULT NULL COMMENT '修改人',
  `UpdateDate` datetime DEFAULT NULL COMMENT '修改时间',
  `EnabledFlag` varchar(1) CHARACTER SET utf8mb4 DEFAULT '0' COMMENT '可用状态',
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `LoginName` (`LoginName`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户管理';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('003094690b164d5c869de61298ce9ce3', 'liubaoguo001', '1fde36e36b7c48f9821d2a2ab9df4314', '111', null, '2', null, '刘宝果', '1', '2017-07-12 10:56:53', null, '2017-12-14 16:53:14', '0');
INSERT INTO `sys_user` VALUES ('00ebfaf00aa4476298b0e5e80c1afd55', 'liufang001', 'bc9033021e6b48d9a40ec7097aa4bebb', 'ff9c5a4273c75d93139f962803829f5a', null, '2', null, '刘芳', '1', '2017-07-12 10:56:53', null, null, '0');
INSERT INTO `sys_user` VALUES ('025dc813df9e4ecd88a9881d607b7735', 'lsxlkz', '0f29e7b3e4bc421596319f7e133635b6', '88bacd1c435d32d9d54033f27309887c', null, '2', null, '小路口镇收文', '1', '2017-07-12 10:56:53', null, null, '0');
INSERT INTO `sys_user` VALUES ('0440c6ee3951494198c967bbdbd35089', 'lichuanchao', '7f59c7cd6737471fa8868ece220aed0f', 'fa6798b66d15ada26435adc79e467226', '192.168.3.151', '2', null, '李传超', null, null, '1', '2017-09-11 16:49:12', '0');
INSERT INTO `sys_user` VALUES ('0490891ff75942cc88f020ea018cd478', 'lsyyz', '35d6562f43ba4a7f982b59a3e68d3a7f', 'e795ea0e853486f394d4eb698b778a75', null, '2', null, '杨营镇收文', '1', '2017-07-12 10:56:53', null, null, '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `UserroleID` varchar(32) NOT NULL COMMENT '记录ID',
  `RoleID` varchar(32) NOT NULL COMMENT '角色ID',
  `UserID` varchar(32) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`UserroleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关系表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('a138dde9dc184c049d5829f659bf52fb', '36d3fd48ecc94c65ab4bad0e5a840496', 'acf3ae5675914eecab40849731f69c67');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `UserID` varchar(32) NOT NULL COMMENT '用户ID',
  `LoginName` varchar(50) DEFAULT NULL COMMENT '登录名',
  `UserName` varchar(32) DEFAULT NULL COMMENT '用户名',
  `NickName` varchar(50) NOT NULL COMMENT '昵称',
  `HeadIcon` varchar(100) DEFAULT NULL COMMENT '用户头像',
  `Sex` varchar(2) DEFAULT NULL COMMENT '性别',
  `UserType` varchar(1) DEFAULT NULL COMMENT '用户类型',
  `Sig` varchar(300) DEFAULT NULL COMMENT '个性签名',
  `status` varchar(2) DEFAULT NULL COMMENT '用户状态',
  `PositionID` varchar(32) DEFAULT NULL COMMENT '职位',
  `Phone` varchar(32) DEFAULT NULL COMMENT '电话',
  `Address` varchar(200) DEFAULT NULL COMMENT '家庭地址',
  `EmergencyContact` varchar(50) DEFAULT NULL COMMENT '紧急电系人',
  `EmergencyContactPhone` varchar(32) DEFAULT NULL COMMENT '紧急电系人电话',
  `Identity` varchar(32) DEFAULT NULL COMMENT '身份证号',
  `OrgCode` varchar(32) DEFAULT NULL COMMENT '所属组织',
  `Email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `Hiredate` date DEFAULT NULL COMMENT '入职时间',
  `EnabledFlag` varchar(1) DEFAULT '0' COMMENT '可用状态',
  `OtherPhone` varchar(32) DEFAULT NULL COMMENT '其他手机号',
  `Memo` varchar(200) DEFAULT NULL COMMENT '备注',
  `CreateBy` varchar(32) DEFAULT NULL COMMENT '创建者',
  `CreateDate` datetime DEFAULT NULL COMMENT '创建日期',
  `UpdateBy` varchar(32) DEFAULT NULL COMMENT '修改人',
  `UpdateDate` datetime DEFAULT NULL COMMENT '修改时间',
  `memo1` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '所属组织标记字段，用于数据导入',
  `memo2` varchar(50) DEFAULT NULL,
  `memo3` varchar(50) DEFAULT NULL,
  `ElectronicSignature` varchar(100) DEFAULT NULL COMMENT '电子签名',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户信息';

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('003094690b164d5c869de61298ce9ce3', 'liubaoguo001', '刘宝果', '刘宝果', null, '1', '1', null, '0', 'a', '17753714046', null, null, null, null, null, null, null, '0', null, '督查室', '1', '2017-07-12 09:42:31', null, null, '督查室', null, null, null);
INSERT INTO `user_info` VALUES ('00ebfaf00aa4476298b0e5e80c1afd55', 'liufang001', '刘芳', '刘芳', null, '2', '1', null, '0', 'a', '13562705121', null, null, null, null, null, null, null, '0', null, '综合科', '1', '2017-07-12 09:42:31', null, null, '综合科', null, null, null);
INSERT INTO `user_info` VALUES ('025dc813df9e4ecd88a9881d607b7735', 'lsxlkz', '小路口镇收文', '小路口镇收文', null, '2', '1', null, '0', null, '15689792186', null, null, null, null, null, null, null, '0', null, '小路口镇', '1', '2017-07-12 09:42:30', null, null, '小路口镇', null, null, null);
INSERT INTO `user_info` VALUES ('0440c6ee3951494198c967bbdbd35089', 'lichuanchao', '李传超', '李传超', null, '1', '1', null, '0', null, '18678798636', null, null, null, null, null, null, null, '0', null, '办公室领导', '1', '2017-07-12 09:42:28', null, null, '办公室领导', null, null, null);
INSERT INTO `user_info` VALUES ('0490891ff75942cc88f020ea018cd478', 'lsyyz', '杨营镇收文', '杨营镇收文', null, '1', '1', null, '0', null, '15650378179', null, null, null, null, null, null, null, '0', null, '杨营镇', '1', '2017-07-12 09:42:30', null, null, '杨营镇', null, null, null);
