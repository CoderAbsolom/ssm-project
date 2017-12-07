/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50709
Source Host           : 127.0.0.1:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2017-12-08 00:08:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `LogID` varchar(32) NOT NULL COMMENT 'ID',
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
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户管理';

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
