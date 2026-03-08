/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80045 (8.0.45)
 Source Host           : localhost:3306
 Source Schema         : ry

 Target Server Type    : MySQL
 Target Server Version : 80045 (8.0.45)
 File Encoding         : 65001

 Date: 08/03/2026 20:57:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'song_list', '歌单', NULL, NULL, 'SongList', 'crud', 'element-plus', 'com.ruoyi.system', 'system', 'list', '歌单', 'TommyG', '0', '/', '{}', 'admin', '2026-02-26 20:34:38', '', '2026-02-26 20:36:48', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'id', 'ID（序号）', 'int', 'Long', 'id', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2026-02-26 20:34:38', '', '2026-02-26 20:36:48');
INSERT INTO `gen_table_column` VALUES (2, 1, 'music_name', '歌名', 'varchar(255)', 'String', 'musicName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2026-02-26 20:34:38', '', '2026-02-26 20:36:48');
INSERT INTO `gen_table_column` VALUES (3, 1, 'language', '语言', 'varchar(255)', 'String', 'language', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_notice_status', 3, 'admin', '2026-02-26 20:34:38', '', '2026-02-26 20:36:48');
INSERT INTO `gen_table_column` VALUES (4, 1, 'musical_style', '曲风', 'varchar(255)', 'String', 'musicalStyle', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'checkbox', 'sys_job_group', 4, 'admin', '2026-02-26 20:34:38', '', '2026-02-26 20:36:48');
INSERT INTO `gen_table_column` VALUES (5, 1, 'pay', '付费', 'varchar(255)', 'String', 'pay', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2026-02-26 20:34:38', '', '2026-02-26 20:36:48');
INSERT INTO `gen_table_column` VALUES (6, 1, 'exclusive_level', '大航海', 'varchar(255)', 'String', 'exclusiveLevel', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_job_group', 6, 'admin', '2026-02-26 20:34:38', '', '2026-02-26 20:36:48');
INSERT INTO `gen_table_column` VALUES (7, 1, 'song_slice', '歌切', 'varchar(255)', 'String', 'songSlice', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'sys_job_group', 7, 'admin', '2026-02-26 20:34:38', '', '2026-02-26 20:36:48');
INSERT INTO `gen_table_column` VALUES (8, 1, 'remark', '备注', 'text', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 8, 'admin', '2026-02-26 20:34:38', '', '2026-02-26 20:36:48');

-- ----------------------------
-- Table structure for gift_list
-- ----------------------------
DROP TABLE IF EXISTS `gift_list`;
CREATE TABLE `gift_list`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '礼物名称',
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '礼物价值',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gift_list
-- ----------------------------
INSERT INTO `gift_list` VALUES (1, '人气票', '0.1', 'https://s1.hdslb.com/bfs/live/7164c955ec0ed7537491d189b821cc68f1bea20d.png');
INSERT INTO `gift_list` VALUES (2, '粉丝团灯牌', '0.1', 'https://s1.hdslb.com/bfs/live/e051dfd4557678f8edcac4993ed00a0935cbd9cc.png');
INSERT INTO `gift_list` VALUES (3, '牛哇牛哇', '0.1', 'https://s1.hdslb.com/bfs/live/91ac8e35dd93a7196325f1e2052356e71d135afb.png');
INSERT INTO `gift_list` VALUES (4, '这个好诶', '0.1', 'https://s1.hdslb.com/bfs/live/9260c680959428c45b3a2742e42ea7ae75e457ef.png');
INSERT INTO `gift_list` VALUES (5, '小花花', '0.1', 'https://s1.hdslb.com/bfs/live/5126973892625f3a43a8290be6b625b5e54261a5.png');
INSERT INTO `gift_list` VALUES (6, '粉丝团灯牌', '0.1', 'https://s1.hdslb.com/bfs/live/e051dfd4557678f8edcac4993ed00a0935cbd9cc.png');
INSERT INTO `gift_list` VALUES (7, '人气票', '0.1', 'https://s1.hdslb.com/bfs/live/7164c955ec0ed7537491d189b821cc68f1bea20d.png');
INSERT INTO `gift_list` VALUES (8, '心动卡', '0.1', 'https://s1.hdslb.com/bfs/live/b304a1ae04d10c25db87cfd8ec2a83bce1749322.png');
INSERT INTO `gift_list` VALUES (9, '棒棒糖', '0.2', 'https://s1.hdslb.com/bfs/live/15313516b3ec0875d67130f18c0a53c582e76531.png');
INSERT INTO `gift_list` VALUES (10, '你真好看', '1.0', 'https://s1.hdslb.com/bfs/live/24afbb083aa700d7576d60a1189d3505262d160d.png');
INSERT INTO `gift_list` VALUES (11, '友谊的小船', '4.9', 'https://s1.hdslb.com/bfs/live/b33c94c51b669bd88f811ecf5f4e34a1db22a648.png');
INSERT INTO `gift_list` VALUES (12, '幸运盲盒', '5.0', 'https://s1.hdslb.com/bfs/live/d9bf4b2234e854b0badbd509edf59b5bf0361b7f.png');
INSERT INTO `gift_list` VALUES (13, '泡泡机', '5.0', 'https://s1.hdslb.com/bfs/live/03f77460f808e33bf3564b1092e261a00b37b4e2.png');
INSERT INTO `gift_list` VALUES (14, '情书', '5.2', 'https://s1.hdslb.com/bfs/live/14dafbf217618f0931c08897e0b3eefc00d0da22.png');
INSERT INTO `gift_list` VALUES (15, '喜欢你', '9.9', 'https://s1.hdslb.com/bfs/live/5d940270c22a17fa2ff17a0713b4383b6febd945.png');
INSERT INTO `gift_list` VALUES (16, '为你打call', '9.9', 'https://s1.hdslb.com/bfs/live/7629cbd12b0ec0547c9195c19aef33180b7c35da.png');
INSERT INTO `gift_list` VALUES (17, '做我的小猫', '9.9', 'https://s1.hdslb.com/bfs/live/19310044cae39364ce8b0082dc10420ee5c71d6a.png');
INSERT INTO `gift_list` VALUES (18, '捏捏小脸', '9.9', 'https://s1.hdslb.com/bfs/live/4e1425649f69ed4175f66a7a0a5a782ecb3be024.png');
INSERT INTO `gift_list` VALUES (19, '摸摸头', '9.9', 'https://s1.hdslb.com/bfs/live/ff743d8ea62fed68f20e55d33b8a1c0f0d9df05f.png');
INSERT INTO `gift_list` VALUES (20, '干杯之旅', '10.0', 'https://s1.hdslb.com/bfs/live/81d849976cd0333ee71d2d9841d15035a8185500.png');
INSERT INTO `gift_list` VALUES (21, '心动盲盒', '15.0', 'https://s1.hdslb.com/bfs/live/38f645d811537b50873718cecbfd84cd28af50ed.png');
INSERT INTO `gift_list` VALUES (22, '秋日奶茶', '19.9', 'https://s1.hdslb.com/bfs/live/7bdcf0fc55d2a820e92dba589382e8ac05ef57bc.png');
INSERT INTO `gift_list` VALUES (23, '星河入梦', '19.9', 'https://s1.hdslb.com/bfs/live/4f6d2b9f7ba7661b4f1405daebb294a2b06e4b09.png');
INSERT INTO `gift_list` VALUES (24, '告白花束', '19.9', 'https://s1.hdslb.com/bfs/live/a4aa89aaa24534cb77534680eaed1f5f2f9aa71f.png');
INSERT INTO `gift_list` VALUES (25, '重拳出击', '19.9', 'https://s1.hdslb.com/bfs/live/53eca0815f8e628bd619a27628b1acbd57fc82b4.png');
INSERT INTO `gift_list` VALUES (26, '凉凉一夏', '19.9', 'https://s1.hdslb.com/bfs/live/9e81c7f17d061f84e35027fee3415b82cc18dcdc.png');
INSERT INTO `gift_list` VALUES (27, '爱之魔力', '28.0', 'https://s1.hdslb.com/bfs/live/1e2bbd767902cbf57bba83ea91c308b5c17b361e.png');
INSERT INTO `gift_list` VALUES (28, '花式夸夸', '29.9', 'https://s1.hdslb.com/bfs/live/28186596880db45a7b843f17d6ebb70feeac06f9.png');
INSERT INTO `gift_list` VALUES (29, '萌萌喵仙', '29.9', 'https://s1.hdslb.com/bfs/live/4c1d2c0b0373faae42cffa41fa4adc1060d879b.png');
INSERT INTO `gift_list` VALUES (30, '流星雨', '29.9', 'https://s1.hdslb.com/bfs/live/d8c219912d3d4c6037d3644278b63ba4e6ad4907.png');
INSERT INTO `gift_list` VALUES (31, '黄金麦克风', '33.0', 'https://s1.hdslb.com/bfs/live/1cd618250b1fe4925903a36a3b2498fddb258acd.png');
INSERT INTO `gift_list` VALUES (32, '啵啵', '39.9', 'https://s1.hdslb.com/bfs/live/278fdd46d5f6619c3aba6a517bd2b8859a1b0e9c.png');
INSERT INTO `gift_list` VALUES (33, '爱神之箭', '52.0', 'https://s1.hdslb.com/bfs/live/e8697321a41a9768fa6479273b52788ebc0066fa.png');
INSERT INTO `gift_list` VALUES (34, '携手同行', '52.0', 'https://s1.hdslb.com/bfs/live/e208143c983d3f1e0304ea681479e30d2e8e6aca.png');
INSERT INTO `gift_list` VALUES (35, '爱心小熊', '52.0', 'https://s1.hdslb.com/bfs/live/5e4587eda937b7a3f6d708116ea466fb3d6e41f1.png');
INSERT INTO `gift_list` VALUES (36, '新星诞生', '66.6', 'https://s1.hdslb.com/bfs/live/0a031171bfbfb2c64360865a62059f53c3639bf7.png');
INSERT INTO `gift_list` VALUES (37, '扭蛋机', '88.0', 'https://s1.hdslb.com/bfs/live/5ed1a140a08b70c2c27a5bfea47f2e3a05fab4c1.png');
INSERT INTO `gift_list` VALUES (38, '冲浪', '89.9', 'https://s1.hdslb.com/bfs/live/3816eb1d809c7020a5ef6b4deb10ee9a470acdac.png');
INSERT INTO `gift_list` VALUES (39, '人鱼公主', '100.0', 'https://s1.hdslb.com/bfs/live/825722fbd3a27cd6d8f95b0c2c5ddc590c0d0394.png');
INSERT INTO `gift_list` VALUES (40, '风之吟唱', '100.0', 'https://s1.hdslb.com/bfs/live/e8e095ecff8770f8a21ff9af61cfe256c77a83a8.png');
INSERT INTO `gift_list` VALUES (41, '蔷薇恋语', '100.0', 'https://s1.hdslb.com/bfs/live/f1e31cf9d3150c5e46fb0e83c9a517aeab983326.png');
INSERT INTO `gift_list` VALUES (42, '星愿水晶球', '100.0', 'https://s1.hdslb.com/bfs/live/f26242d5dc86bbc695336383e2ac4ba50ec033eb.png');
INSERT INTO `gift_list` VALUES (43, '极速超跑', '100.0', 'https://s1.hdslb.com/bfs/live/27b9734d1a5f77ea6fc94957e3fcbeb55505c6b9.png');
INSERT INTO `gift_list` VALUES (44, '游戏乐园', '100.0', 'https://s1.hdslb.com/bfs/live/0756509515b5ca305c4c5b89e977e4c9a23c2f17.png');
INSERT INTO `gift_list` VALUES (45, '摩天轮', '100.0', 'https://s1.hdslb.com/bfs/live/1d7037457bcfa8fd033ff26d6c452d1667ac6c17.png');
INSERT INTO `gift_list` VALUES (46, '启航之旅', '100.0', 'https://s1.hdslb.com/bfs/live/1f26142b57c03a401f0f622cc0f8e7e48b6f6b65.png');
INSERT INTO `gift_list` VALUES (47, '纯白花嫁', '131.4', 'https://s1.hdslb.com/bfs/live/993114821f67b5b31d897a2d045c78282a2f9196.png');
INSERT INTO `gift_list` VALUES (48, '花的告白', '152.0', 'https://s1.hdslb.com/bfs/live/bcd0ab1366545d348d7b3c5d3f5565b6bc2e6d3b.png');
INSERT INTO `gift_list` VALUES (49, '飞鸟仙梦', '188.8', 'https://s1.hdslb.com/bfs/live/34f8fb5681c716e6d15bdac6e7950abbdf9bcf4f.png');
INSERT INTO `gift_list` VALUES (50, '奇幻梦境', '199.0', 'https://s1.hdslb.com/bfs/live/7dfa50a682b9629fb0cba43e47930a8438ed304d.png');
INSERT INTO `gift_list` VALUES (51, '爱的乐章', '199.0', 'https://s1.hdslb.com/bfs/live/2006d523d3aec2abf2224d792c2b37f9dfc146c3.png');
INSERT INTO `gift_list` VALUES (52, '告白气球', '200.0', 'https://s1.hdslb.com/bfs/live/d4df99e01fe6dc69636742a998bfd2962480522e.png');
INSERT INTO `gift_list` VALUES (53, '圆梦仙影', '300.0', 'https://s1.hdslb.com/bfs/live/a1a65f940a6258ff2dd94c98c60832797814da90.png');
INSERT INTO `gift_list` VALUES (54, '梦游仙境', '300.0', 'https://s1.hdslb.com/bfs/live/88a338dbe644473c800e4cde1306d923be350e94.png');
INSERT INTO `gift_list` VALUES (55, '热气球', '300.0', 'https://s1.hdslb.com/bfs/live/b488e775511a7231e38b7a70d3b00685b2348762.png');
INSERT INTO `gift_list` VALUES (56, '糖果车', '300.0', 'https://s1.hdslb.com/bfs/live/849cb01b2f8d727a90d907e4ffe1cd5cb92614c5.png');
INSERT INTO `gift_list` VALUES (57, '月桂皇冠', '400.0', 'https://s1.hdslb.com/bfs/live/8be43b333053bd7e6fe8ad87e8bf013e4c1b3225.png');
INSERT INTO `gift_list` VALUES (58, '飞屋环游', '500.0', 'https://s1.hdslb.com/bfs/live/0b8f4c8c98a5fd9a6806fc6897224387fe0060d8.png');
INSERT INTO `gift_list` VALUES (59, '为你摘星', '520.0', 'https://s1.hdslb.com/bfs/live/5bd584b6fdfb03d66de56102e775582fb29ceab7.png');
INSERT INTO `gift_list` VALUES (60, '原地求婚', '520.0', 'https://s1.hdslb.com/bfs/live/244f1ed4c1e1e866a705022f3e010f6c7334a108.png');
INSERT INTO `gift_list` VALUES (61, '转运锦鲤', '666.0', 'https://s1.hdslb.com/bfs/live/f21d3ea71b9c6d200d48d948a670cc351fd65f21.png');
INSERT INTO `gift_list` VALUES (62, '星轨列车', '666.6', 'https://s1.hdslb.com/bfs/live/01a82ea9d5fdf62c4efed73d3d34d9c8f2e25ff2.png');
INSERT INTO `gift_list` VALUES (63, '舞台天王', '666.6', 'https://s1.hdslb.com/bfs/live/7636ca1a0ab5ed2d1b639044655164987e8d3510.png');
INSERT INTO `gift_list` VALUES (64, '好活当赏', '666.6', 'https://s1.hdslb.com/bfs/live/1c4d065417a24c439f47cb487ada4725f35a0106.png');
INSERT INTO `gift_list` VALUES (65, '海湾之旅', '799.9', 'https://s1.hdslb.com/bfs/live/00587e5dee12f8b8715c2e470104e15a96be4534.png');
INSERT INTO `gift_list` VALUES (66, '飞天转椅', '1000.0', 'https://s1.hdslb.com/bfs/live/3a1cc7ca50da48670d9f7aa6c8d3cd874228f7b0.png');
INSERT INTO `gift_list` VALUES (67, '鸿运小电视', '1000.0', 'https://s1.hdslb.com/bfs/live/037ff1f5dbf1cb996a39cedc8b67fcdb04b00cdc.png');
INSERT INTO `gift_list` VALUES (68, '次元之城', '1245.0', 'https://s1.hdslb.com/bfs/live/cdae8136b1ee767609aeec688bca8124651d4d01.png');
INSERT INTO `gift_list` VALUES (69, '领航者飞船', '1245.0', 'https://s1.hdslb.com/bfs/live/572c8dfb9ce0e1782b8a8ab88794448819065553.png');
INSERT INTO `gift_list` VALUES (70, '探索者启航', '2233.0', 'https://s1.hdslb.com/bfs/live/f95de770154c6b89e376a16cfae6f5a5bf751d05.png');
INSERT INTO `gift_list` VALUES (71, '小电视飞船', '2999.0', 'https://s1.hdslb.com/bfs/live/48884b1b1d3bf9df185f43ff6651748040faf5de.png');
INSERT INTO `gift_list` VALUES (72, '鎏金小电视', '2999.0', 'https://s1.hdslb.com/bfs/live/60eacff81bd83033112847f191cc7d56605aa030.png');
INSERT INTO `gift_list` VALUES (73, '梦幻游乐园', '3000.0', 'https://s1.hdslb.com/bfs/live/f1ed9d627f75b46fe621558951847e0e4e95d6a2.png');

-- ----------------------------
-- Table structure for isshow_song_table_columns
-- ----------------------------
DROP TABLE IF EXISTS `isshow_song_table_columns`;
CREATE TABLE `isshow_song_table_columns`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `columns` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示列集合',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of isshow_song_table_columns
-- ----------------------------
INSERT INTO `isshow_song_table_columns` VALUES (1, 1, 'musicName,singer,language,musicalStyle,pay,songSlice,remark');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for song_list
-- ----------------------------
DROP TABLE IF EXISTS `song_list`;
CREATE TABLE `song_list`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID（序号）',
  `music_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '歌名',
  `singer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '歌手',
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语言',
  `musical_style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '曲风',
  `pay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付费',
  `exclusive_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大航海',
  `gift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '礼物',
  `song_slice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '歌切',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `uploader` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上传人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 487 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '歌单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of song_list
-- ----------------------------
INSERT INTO `song_list` VALUES (1, 'SLEEPWALK', 'ヒトリエ', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (2, 'フユノ(冬野)', 'ヒトリエ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (3, '日常と地球の額縁 (日常和地球的画框)', 'ヒトリエ', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (4, 'カラノワレモノ (空之碎物)', 'ヒトリエ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (5, 'さらってほしいの (希望你能把我带走)', 'ヒトリエ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (6, 'モノカラー (黑白色彩)', 'ヒトリエ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (7, 'RIVER FOG,CHOCOLATE BUTTERFLY', 'ヒトリエ', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (8, 'NOTOK', 'ヒトリエ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (9, '(W)HERE', 'ヒトリエ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (10, '癖', 'ヒトリエ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (11, '東京フラッシュ (东京闪景)', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (12, 'napori', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (13, '踊り子 (舞女)', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (14, '灯火', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (15, '裸の勇者 (赤裸的勇士)', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (16, '僕は今日も (今天我也)', 'Vaundy', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (17, '不可幸力', 'Vaundy', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (18, '走馬灯', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (19, '恋風邪にのせて (患上恋爱感冒)', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (20, '怪獣の唄', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (21, '宮', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (22, '花占い (花瓣占卜)', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (23, 'mabataki', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (24, 'HERO', 'Vaundy', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (25, '風神 (日剧《狮子的藏身处》主题曲)', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (26, '常熱', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (27, 'トドメの一撃 feat. Cory Wong', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (28, 'GORILLA SHIBAI (猿芝居)', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (29, '逃避行 (逃避之旅)', 'Dios', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (30, '断面 (日剧《教祖之女》主题曲)', 'Dios', '2', '', '', '2', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (31, '王', 'Dios', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (32, 'ダークルーム（暗室）', 'Dios', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (33, '＆疾走', 'Dios', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (34, '呆然', 'Dios', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (35, '愛がすべて (爱即是一切 / All I need is love)', 'Dios', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (36, 'ラブレス (LOVELESS/爱恋失格)', 'Dios', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (37, '天国', 'Dios', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (38, '芝居の終焉 (戏剧的尽头)', 'Dios', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (39, '寄り酔い (倚醉)', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (40, 'ブラウニー (布朗尼 Brownie)', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (41, 'イージーゲーム (Easy Game)', '和ぬか', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (42, 'The Fog', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (43, 'ビーユアセルフ (做你自己 Be Yourself)', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (44, '進め！そっちだ！ (auお正月新CM)', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (45, 'シュガーロス', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (46, '泡沫', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (47, 'まだ浅はか (feat. 和ぬか)', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (48, 'アイオクレ', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (49, 'アミ (日剧《妖怪合租屋》主题曲)', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (50, 'ラブの逃走 (爱意逃亡)', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (51, 'ロックでキス', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (52, '真っ裸', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (53, 'ミカヅキ (新月)', 'さユリ', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (54, 'フラレガイガール (被甩男女)', 'さユリ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (55, '光と闇 (光与暗)', 'さユリ', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (56, '十億年', 'さユリ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (57, 'さよーならあなた', 'カネコアヤノ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (58, 'エメラルド', 'カネコアヤノ', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (59, 'かみつきたい', 'カネコアヤノ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (60, 'アーケード (拱廊)', 'カネコアヤノ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (61, '朝になって夢からさめて', 'カネコアヤノ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (62, '祝日', 'カネコアヤノ', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (63, '湯船', 'カネコアヤノ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (64, 'あなたは煙草 私はシャボン(你是烟草 我是泡沫)', 'ラブリーサマーちゃん', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (65, '水星', 'ラブリーサマーちゃん', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (66, 'サーカスナイト', 'ラブリーサマーちゃん', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (67, '202 (New Mix)', 'ラブリーサマーちゃん', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (68, 'ルミネセンス', 'ラブリーサマーちゃん', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (69, 'はじめまして', 'ラブリーサマーちゃん', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (70, '私の好きなもの (我喜欢的东西)', 'ラブリーサマーちゃん', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (71, 'わたしのうた', 'ラブリーサマーちゃん', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (72, '笑い話', 'ラブリーサマーちゃん', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (73, 'サターン (土星)', 'ずっと真夜中でいいのに', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (74, 'グラスとラムレーズン', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (75, 'Ham', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (76, '君がいて水になる (有你在即可化成水)', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (77, 'またね幻 (再会，幻)', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (78, 'ばかじゃないのに (虚心若愚)', 'ずっと真夜中でいいのに', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (79, 'Dear Mr 「F」 (亲爱的F先生)', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (80, '正義', 'ずっと真夜中でいいのに', '2', '', '', '2', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (81, '秒針を噛む（咬住秒针）', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (82, '消えてしまいそうです', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (83, '残機', 'ずっと真夜中でいいのに', '2', '', '', '2', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (84, 'お勉強しといてよ (得好好学习喔)', 'ずっと真夜中でいいのに', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (85, '雲丹と栗', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (86, '深昏睡', '春野', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (87, 'nuit', '春野', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (88, 'Venus Flytrap feat. 佐藤千亜妃', '春野', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (89, '私怨', '春野', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (90, 'I\'m In Love', '春野', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (91, 'can\'t be waiting anymore?', '春野', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (92, 'Buddha', '春野', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (93, 'スコール (疾风骤雨)', '春野', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (94, 'YOU & IDOL', '相対性理論(やくしまるえつこ)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (95, '地獄先生', '相対性理論(やくしまるえつこ)', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (96, 'わたしは人類 (我是人类)', '相対性理論(やくしまるえつこ)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (97, 'sky riders(vo+pf)', '相対性理論(やくしまるえつこ)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (98, 'バーモント・キス (佛蒙特之吻)', '相対性理論(やくしまるえつこ)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (99, '(恋は) 百年戦争', '相対性理論(やくしまるえつこ)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (100, 'ムーンライト銀河', '相対性理論(やくしまるえつこ)', NULL, '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (101, 'cry', '日向文', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (102, '落下(いっぱつにゅうこんver.)', '日向文', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (103, '波よ、君の頬を', '日向文', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (104, 'リナリア', '日向文', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (105, 'ライバー', '日向文', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (106, '秘密', '日向文', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (107, 'だから僕は音楽を辞めた（所以我放弃了音乐）', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (108, '春泥棒', 'ヨルシカ／n-buna', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (109, '嘘月', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (110, '第一夜', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (111, '夜明けと蛍', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (112, 'アルジャーノン', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (113, 'ヒッチコック', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (114, '晴る', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (115, '忘れてください', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (116, '修羅', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (117, '月に吠える', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (118, '歌舞伎町の女王', '椎名林檎', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (119, '丸ノ内サディスティック', '椎名林檎', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (120, '人生は夢だらけ', '椎名林檎', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (121, '眩暈', '椎名林檎', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (122, '愛妻家の朝食', '椎名林檎', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (123, 'ドリームレス・ドリームス (无梦之梦)', 'はるまきごはん(春卷饭)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (124, '第三の心臓', 'はるまきごはん(春卷饭)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (125, '雨子', 'はるまきごはん(春卷饭)', '2', '', '', '2', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (126, '僕は可憐な少女にはなれない (我无法成为凛然少女)', 'はるまきごはん(春卷饭)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (127, '人間だった (曾生为人)', 'picon', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (128, '水葬', 'おいしくるメロンパン', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (129, '亡き王女のための水域 (悼念公主的水域)', 'おいしくるメロンパン', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (130, '色水 (彩色水)', 'おいしくるメロンパン', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (131, '瞬き', 'back number', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (132, 'クリスマスソング', 'back number', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (133, '笑顔', 'back number', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (134, '花束', 'back number', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (135, '風の強い日', 'back number', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (136, '僕の名前を', 'back number', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (137, 'カワキヲアメク (声嘶力竭)', '美波', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (138, 'アメヲマツ、 (等雨)', '美波', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (139, 'ETERNAL BLUE', '美波', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (140, '花', '藤井風', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (141, '満ちてゆく', '藤井風', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (142, '死ぬのがいいわ (不如死去)', '藤井風', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (143, 'きらり (闪耀)', '藤井風', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (144, 'ガーデン (花园)', '藤井風', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (145, '真っ白', '藤井風', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (146, '怪物 (TV动画《BEASTARS》第二季片头曲)', 'YOASOBI', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (147, '群青', 'YOASOBI', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (148, 'たぶん', 'YOASOBI', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (149, '祝福', 'YOASOBI', '2', '', '', '2', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (150, '好きだから。 (因为喜欢你。)', '『ユイカ』', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (151, '恋音と雨空 (恋歌与沥雨)', 'AAA', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (152, '永遠のあくる日 (永远的翌日)', 'Ado', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (153, '逆光', 'Ado', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (154, 'Value', 'Ado', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (155, '蝸旋(feat. Ado)', 'Ado', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (156, 'カブトムシ', 'aiko', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (157, 'カタオモイ (单相思)', 'Aimer', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (158, 'あの夏で待ってる(在那个夏日等待)', 'cadode', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (159, '青春にして已む(青春已逝)', 'Cö shu Nie', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (160, 'ロングスカートは靡いて', 'Conton Candy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (161, '猫', 'DISH//', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (162, 'モディファイ(修复)', 'Doctrine Doctrine', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (163, '夜に浮かぶ(浮于夜色)', 'Haruna', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (164, '可愛くてごめん', 'HoneyWorks/早見沙織', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (165, '飛行艇 (飞艇)', 'King Gnu', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (166, '白日', 'King Gnu', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (167, 'Prayer X', 'King Gnu', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (168, '呼吸', 'kyooo', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (169, '心做し', 'majiko', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (170, 'Anytime Anywhere (TV动画《葬送的芙莉莲》片尾曲)', 'milet', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (171, '春愁', 'Mrs. GREEN APPLE', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (172, 'Tell Me Baby', 'Mrs. GREEN APPLE', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (173, 'ヒマワリが咲く予定(向日葵将绽放)', 'Nakamura Emi', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (174, 'チクッ', 'Nakamura Emi', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (175, 'l', 'Nakamura Emi', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (176, '愛にできることはまだあるかい', 'RADWIMPS', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (177, 'なんでもないや', 'RADWIMPS', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (178, 'めめしぃ (优柔寡断)', 'RADWIMPS', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (179, 'me me she', 'RADWIMPS', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (180, 'すずめ feat.十明', 'RADWIMPS/十明', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (181, '雨に唄えば(对雨高歌)', 'ReoNa', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (182, 'シンデレラボーイ(灰姑娘男孩)', 'Saucy Dog', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (183, 'いつか', 'Saucy Dog', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (184, 'またおいで(请再来吧)', 'South&/可不', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (185, '化作青烟(さくらひらり)', 'TOMO', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (186, '別の人の彼女になったよ', 'wacci', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (187, 'ルナ', 'waka', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (188, '分かってないよ', 'WurtS', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (189, 'Oz. (TV动画《国王排名》片尾曲)', 'yama', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (190, 'again', 'YUI', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (191, 'Why me', 'YUI', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (192, '10月無口な君を忘れる (忘却十月沈默的你)', 'あたらよ', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (193, '夏霞', 'あたらよ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (194, '8.8', 'あたらよ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (195, 'x分の１', 'ウソツキ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (196, '琥珀色の街、上海蟹の朝', 'くるり', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (197, 'たばこ', 'コレサワ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (198, '新宝島', 'サカナクション', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (199, '愛ゆえに', 'さとうもか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (200, 'ランデヴー', 'シャイトープ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (201, 'ロビンソン', 'スピッツ(spitz)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (202, 'Midnight Call', 'ぜったくん/kojikoji', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (203, 'I wanna kill you', 'たかやん', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (204, '玩具(Toy)', 'たかやん', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (205, '貴方の恋人になりたい(想成为你的恋人)', 'チョーキューメイ', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (206, '君がいればいい', 'つじあやの', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (207, '誰にもなれない私だから (正因为是无法成为他人的我）', 'トゲナシトゲアリ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (208, '空の箱', 'トゲナシトゲアリ', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (209, '紡ぐ(织心)', 'とた', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (210, 'Overdose', 'なとり', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (211, '夜の歯車', 'なとり', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (212, 'ヘビースモーク(heavy smoke)', 'にしな(nishina)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (213, '誰にだって訳がある(人人都有缘由)', 'ハルレオ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (214, '火炎', '女王蜂', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (215, 'さがしもの(寻找的东西)', 'ハンバート ハンバート', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (216, '悪魔の子 (恶魔之子)', 'ヒグチアイ', '2', '', '', '2', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (217, 'なんでもないよ、(没什么大不了)', 'マカロニえんぴつ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (218, 'それを愛と呼ぶだけ', 'まふまふ(mafumafu)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (219, '鏡花水月', 'まふまふ(mafumafu)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (220, 'プリーズ', 'メガテラ・ゼロ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (221, '私じゃなかったんだね (并非是我)', 'りりあ。', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (222, '失恋ソング沢山聴いて 泣いてばかりの私はもう.', 'りりあ。', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (223, 'ロミオとシンデレラ', '初音ミク/doriko', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (224, 'クエスチョン', '初音ミク/john', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (225, '回る空うさぎ', '初音ミク/Orangestar', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (226, 'メルト(melt)', '初音ミク/supercell', '2', '', '', '2', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (227, '福寿草', '初音ミク/ぐにょ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (228, 'パズルガール(拼图女孩)', '初音ミク/とあ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (229, '小夜子', '初音ミク/みきとP', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (230, '僕は依存症feat. みきとP (我是依存症)', '初音ミク/みきとP', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (231, '奈落', '初音ミク/みきとP', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (232, 'さようなら、花泥棒さん(再见了，盗花人)', '初音ミク/メル', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (233, '魔法の絨毯 (魔法毯)', '川崎鷹也', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (234, '君の為のキミノウタ', '川崎鷹也', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (235, 'れぞんでーとる(Raison d\'etre)', '存流', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (236, '味覚', '淡甘', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (237, 'ハルノ寂寞 (春日寂寞)', '稲葉曇', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (238, '落日', '東京事変', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (239, '睡魔', '缶缶/Ayase', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (240, 'ド屑', '歌愛ユキ/なきそ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (241, '強風オールバック', '歌愛ユキ/ゆこぴ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (242, 'そして花になる', '花譜', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (243, 'わたしの線香', '花譜', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (244, 'ギターと孤独と蒼い惑星', '結束バンド', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (245, 'ひとり旅(独自旅行)', '瀬名航/鎖那', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (246, 'ソラゴト(Fake)', '明透', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (247, '夕立', '日食なつこ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (248, 'yellow', '神山羊', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (249, '彼女は旅に出る (她踏上了旅途)', '鎖那', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (250, '紅い呪い(鲜红诅咒)', '吐息/aruma', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (251, 'ビビデバ(星彗闪耀)', '星街すいせい', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (252, '月の明り', '伊田恵美', NULL, '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (253, 'ダーリン', '須田景凪', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (254, 'ダイビング', '岩見拓馬', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (255, '月が綺麗', '岩見拓馬', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (256, '1999', '羊文学', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (257, 'fake face dance music', '音田雅則', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (258, '香水', '瑛人', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (259, 'ドライフラワー', '優里', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (260, '阿吽のビーツ', '羽生迷子/v flower', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (261, '好きな人がいること(有喜欢的人)', '知英', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (262, '糸(线)', '中島みゆき', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (263, 'S.S.S.', '佐藤千亜妃', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (264, 'ハルノユキ', 'リリィ、さよなら。', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (265, '今晩はお月さん', 'ハンバート ハンバート', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (266, '星屑ビーナス', 'Aimer', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (267, '别问很可怕', 'J. Sheon', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (268, 'Melody Remix', '未知', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (269, '大鱼', '周深', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (270, '不要说话', '陈奕迅', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (271, '成全', '林宥嘉', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (272, '梦回还', '呦猫UNEKO', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (273, '谓风', '双笙/流仙', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (274, '四重罪孽', '洛天依/乐正绫/言和/DELA', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (275, '是风动', '银临/河图', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (276, '六重不忠', '洛天依/乐正绫/言和/DELA', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (277, '东京不太热', '洛天依/Z新豪', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (278, '不朽之罪', '双笙/玄觞', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (279, '幹物女(干物女)', '洛天依/Z新豪', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (280, '百鬼阴阳抄-柔情版', '银临/Aki阿杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (281, '权御天下', '洛天依等', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (282, '桃花笑', '洛天依/乐正绫/言和', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (283, '恋人', '刘嘉星', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (284, '这条小鱼在乎', '王OK/洪佩瑜', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (285, '听夜雨', '礼越', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (286, '珠玉', '单依纯', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (287, '爱情讯息', '郭静', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (288, '她说', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (289, '愿与愁', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (290, '床', '草东没有派对', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (291, '喜欢', '张悬', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (292, '爱人错过', '告五人', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (293, 'Time Machine', 'mj apanay ft. aren park', '3', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (294, '有何不可', '许嵩', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (295, '稻香', '周杰伦', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (296, '龙卷风', '周杰伦', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (297, '夏天的风', '温岚', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (298, '晚婚', '李宗盛', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (299, '太聪明', '陈绮贞', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (300, '小半', '陈粒', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (301, '走马', '陈粒', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (302, '奇妙能力歌', '陈粒', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (303, '虚拟', '陈粒', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (304, '易燃易爆炸', '陈粒', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (305, '绝对占有 相对自由', '陈粒', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (306, '可惜没如果', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (307, '背对背拥抱', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (308, '修炼爱情', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (309, '心墙', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (310, '曹操', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (311, '小酒窝', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (312, '关键词', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (313, '黑夜问白天', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (314, '不潮不用花钱', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (315, '新地球', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (316, '花海', '周杰伦', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (317, '唯一', '告五人', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (318, '最长的电影', '周杰伦', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (319, '别找我麻烦', '蔡健雅', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (320, '采茶纪', '双笙', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (321, '第三人称', 'Hush', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (322, '晴天', '周杰伦', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (323, '体面', '于文文', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (324, '笑', '太一', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (325, '至少还有你', '林忆莲', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (326, '啷个哩个啷', '鹏泊', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (327, '偏爱', '张芸京', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (328, '男孩', '梁博', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (329, '童话镇', '暗杠', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (330, '谁', '廖俊涛', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (331, 'Tired', 'vietra', '3', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (332, '孤勇者', '陈奕迅', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (333, '爱如潮水', '张信哲', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (334, '年轮', '汪苏泷', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (335, '东西', '林俊呈', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (336, '白羊', '徐秉龙', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (337, '陷阱', '王北车', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (338, '一笑倾城', '汪苏泷', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (339, '好想爱这个世界啊', '华晨宇', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (340, '童年', '罗大佑', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (341, '下个路口见', '李宇春', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (342, '说爱你', '蔡依林', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (343, '我的歌声里', '曲婉婷', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (344, '素颜', '许嵩', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (345, '故梦', '橙翼', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (346, '鬼', '草东没有派对', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (347, '梦的光点', '王心凌', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (348, '红马', '许蓝心', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (349, '突然好想你', '五月天', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (350, '光年之外', '邓紫棋', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (351, '难生恨', 'DAWN', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (352, '消愁', '毛不易', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (353, '暗号', '周杰伦', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (354, '快乐的扑满', '邵丽棠', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (355, 'FLY ME TO THE MOON', 'OLIVIA ONG', '3', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (356, '第三十八年夏至', '河图', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (357, '当', '动力火车', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (358, '隐形的翅膀', '张韶涵', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (359, '不染', '毛不易', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (360, '彩虹的微笑', '王心凌', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (361, '时间煮雨', '郁可唯', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (362, '静悄悄', '陈泫孝', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (363, '匆匆那年', '王菲', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (364, '空空如也', '任然', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (365, '飞机场', '徐良/小凌', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (366, '如果这就是爱情', '张靓颖', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (367, '欧若拉', '张韶涵', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (368, '想想念念', 'FAFA/雪二', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (369, '天地缓缓', '伦桑', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (370, '喜欢你', '陈洁仪', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (371, '下雨天', '南拳妈妈', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (372, '客官不可以', '徐良/小凌', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (373, '绿色', '陈雪凝', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (374, '世界上的另一个我', '阿肆 / 郭采洁', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (375, '快乐星猫', '牛奶咖啡', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (376, '参商', '不才', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (377, '告白气球', '周杰伦', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (378, '50 Feet', 'SoMo', '3', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (379, '梁山伯与朱丽叶', '曹格/卓文萱', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (380, '菲菲', '沈以诚', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (381, '身骑白马', '徐佳莹', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (382, '吹灭小山河', '国风堂/司南', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (383, '小宇', '蓝心羽', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (384, '自作多情', '本兮', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (385, '凄美地', '郭顶', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (386, '雨爱', '杨丞琳', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (387, '七里香', '周杰伦', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (388, '悬溺', '葛东琪', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (389, '情花', '本兮', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (390, '烟雨行舟', '伦桑', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (391, '小幸运', '田馥甄', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (392, '若把你', 'Kirsty刘瑾睿', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (393, '无语', '本兮', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (394, '战放', '本兮', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (395, '画', '邓紫棋', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (396, '狐言', '河图 / 洛天依', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (397, '赤伶', 'HITA', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (398, '失眠飞行', '沈以诚', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (399, '红色高跟鞋', '蔡健雅', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (400, '烟花易冷', '周杰伦', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (401, '霜雪千年', '洛天依/乐正绫', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (402, '载我回家', '陈珊妮', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (403, '保留', '郭顶', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (404, '有心无意', '本兮', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (405, '出山', '花粥', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (406, '大风吹', '草东没有派对', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (407, '形容', '沈以诚', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (408, '可乐', '赵紫骅', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (409, '左肩', '安苏羽', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (410, '我好想你', '苏打绿', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (411, '水星记', '郭顶', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (412, '年少有为', '李荣浩', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (413, 'R.', '李子豪(HtFR)/大喜', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (414, '爱你', '王心凌', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (415, '九九八十一', '洛天依/乐正绫', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (416, '椿', '沈以诚', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (417, '夜车', '曾轶可', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (418, '红昭愿', '音阙诗听', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (419, '红尘客栈', '周杰伦', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (420, '蒲公英的约定', '周杰伦', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (421, '时间飞行', '白宇/朱一龙', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (422, '醒着醉', '马良', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (423, '九张机', '叶炫清', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (424, '说谎', '林宥嘉', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (425, '浮生未歇', '音频怪物／双笙', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (426, '撒野', '凯瑟喵', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (427, '我的一个道姑朋友', '以冬', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (428, '浪费', '林宥嘉', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (429, '棠梨煎雪', '银临', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (430, '后来的我们', '五月天', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (431, '宝贝', '张悬', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (432, '好想你', '朱主爱', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (433, '倾尽天下', '河图', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (434, '隐', '河图', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (435, '如花', '河图', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (436, '狂野想乡', '西瓜JUN', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (437, '丹青客', 'HITA/小曲儿', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (438, '写给我第一个喜欢的女孩的歌', '洛天依', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (439, '恶魔的爱', '李宏毅/李明霖', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (440, '白石溪', '洛天依/乐正绫', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (441, '锦鲤抄', '银临/云之泣', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (442, '圈圈点点圈圈点点圈圈点点', '洛天依', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (443, '直觉', '赵方婧', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (444, '迷人的危险', 'Dance Flow', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (445, 'The Star', '李佳思', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (446, '恶作剧', '王蓝菌', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (447, '新九九八十一', '泠鸢', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (448, '凉城', '任然', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (449, '那年', '任然', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (450, '杀手', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (451, '孙尚香', '洛天依/乐正绫/空气凝', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (452, '归零', '小曲儿', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (453, '水仙', '王心凌', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (454, '落霞云归', '慕寒', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (455, '你就不要想起我', '田馥甄', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (456, '腐草为萤', '银临', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (457, '越来越不懂', '蔡健雅', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (458, '忆江南', '五音JW', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (459, '失落沙洲', '徐佳莹', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (460, '只要平凡', '张杰/张碧晨', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (461, '暗淡的是你曾温柔的小动作', '太一', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (462, '很久很久', '杨和苏', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (463, '心如止水', 'Ice Paper', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (464, '太久', '刘思鉴/桃德李Todd Li', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (465, '当爱已成往事', '林忆莲/李宗盛', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (466, '勘ぐれい', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (467, '薄れる', 'rinri/裏命', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (468, 'プロポーズ', 'なとり', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (469, 'オノマトペ', '羽生まゐご/りりあ。', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (470, 'Aliens', 'KIRINJI', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (471, 'ヒスイ', 'nonoc', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (472, '月 feat. ヰ世界情緒', 'Guiano/ヰ世界情緒', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (473, '寝言は寝て言え', '月ノ美兎', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (474, '君のヒーロー', '十明', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (475, 'Bunny Girl', 'AKASAKI', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (476, 'マジか！', '梓川', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (477, 'フィナーレ（终曲）', 'eill', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (478, 'JANE DOE', '宇多田光/米津玄师', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (479, '死別', 'シャノン', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (480, '雨き声残響', '初音ミク/Orangestar', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (481, '幻彩国', '双笙', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (482, '食虫植物', NULL, NULL, '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (483, '我怀念的', '孙燕姿', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (484, '下等马', '洛天依Official/ChiliChill', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (485, '普通朋友', '陶喆', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (486, '几分之几', '卢广仲', '1', '', '', NULL, NULL, '', '', '1');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-red\n', 'Y', 'admin', '2026-02-24 20:59:02', 'admin', '2026-02-24 21:20:41', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2026-02-24 20:59:02', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2026-02-24 20:59:02', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2026-02-24 20:59:02', 'admin', '2026-02-24 21:20:26', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2026-02-24 20:59:02', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2026-02-24 20:59:02', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (7, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2026-02-24 20:59:02', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2026-02-24 20:59:02', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', 'Trevor Philips Industry', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-02-24 20:59:01', 'admin', '2026-03-04 14:05:57');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '歌单', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-02-24 20:59:01', 'admin', '2026-03-04 14:06:40');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2026-02-24 20:59:01', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '管理员', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-02-24 20:59:01', 'admin', '2026-03-04 14:07:52');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2026-02-24 20:59:01', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '主播', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-02-24 20:59:01', 'admin', '2026-03-04 14:07:44');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2026-02-24 20:59:01', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2026-02-24 20:59:01', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2026-02-24 20:59:01', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2026-02-24 20:59:01', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 138 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (30, 1, '国语', '1', 'song_language', NULL, 'primary', 'N', '0', 'admin', '2026-02-26 21:33:37', 'admin', '2026-02-26 21:34:32', '国语');
INSERT INTO `sys_dict_data` VALUES (31, 2, '日语', '2', 'song_language', NULL, 'primary', 'N', '0', 'admin', '2026-02-26 21:34:18', 'admin', '2026-02-26 21:34:35', '日语');
INSERT INTO `sys_dict_data` VALUES (32, 3, '英语', '3', 'song_language', NULL, 'primary', 'N', '0', 'admin', '2026-02-26 21:34:57', '', NULL, '英语');
INSERT INTO `sys_dict_data` VALUES (33, 4, '韩语', '4', 'song_language', NULL, 'primary', 'N', '0', 'admin', '2026-02-26 21:35:11', '', NULL, '韩语');
INSERT INTO `sys_dict_data` VALUES (34, 5, '粤语', '5', 'song_language', NULL, 'primary', 'N', '0', 'admin', '2026-02-26 21:35:11', '', NULL, '粤语');
INSERT INTO `sys_dict_data` VALUES (35, 1, '流行', '1', 'song_style', NULL, 'primary', 'N', '0', 'admin', '2026-02-26 21:35:11', '', NULL, '流行');
INSERT INTO `sys_dict_data` VALUES (36, 2, '古风', '2', 'song_style', NULL, 'primary', 'N', '0', 'admin', '2026-02-26 21:35:11', '', NULL, '古风');
INSERT INTO `sys_dict_data` VALUES (37, 3, '日系', '3', 'song_style', NULL, 'primary', 'N', '0', 'admin', '2026-02-26 21:35:11', 'admin', '2026-02-26 22:45:33', '日系');
INSERT INTO `sys_dict_data` VALUES (38, 4, '伤感', '4', 'song_style', NULL, 'primary', 'N', '0', 'admin', '2026-02-26 21:35:11', '', NULL, '伤感');
INSERT INTO `sys_dict_data` VALUES (39, 5, '欢快', '5', 'song_style', NULL, 'primary', 'N', '0', 'admin', '2026-02-26 21:35:11', '', NULL, '欢快');
INSERT INTO `sys_dict_data` VALUES (40, 6, '二次元', '6', 'song_style', NULL, 'primary', 'N', '0', 'admin', '2026-02-26 21:35:11', 'admin', '2026-02-26 22:43:42', '二次元');
INSERT INTO `sys_dict_data` VALUES (41, 7, '民谣', '7', 'song_style', NULL, 'primary', 'N', '0', 'admin', '2026-02-26 21:35:11', '', NULL, '民谣');
INSERT INTO `sys_dict_data` VALUES (42, 8, '戏腔', '8', 'song_style', NULL, 'primary', 'N', '0', 'admin', '2026-02-26 21:35:11', '', NULL, '戏腔');
INSERT INTO `sys_dict_data` VALUES (43, 9, '说唱', '9', 'song_style', NULL, 'primary', 'N', '0', 'admin', '2026-02-26 21:35:11', '', NULL, '说唱');
INSERT INTO `sys_dict_data` VALUES (44, 10, 'R&B', '10', 'song_style', NULL, 'primary', 'N', '0', 'admin', '2026-02-26 21:35:11', '', NULL, 'R&B');
INSERT INTO `sys_dict_data` VALUES (45, 11, '甜歌', '11', 'song_style', NULL, 'primary', 'N', '0', 'admin', '2026-02-26 21:35:11', '', NULL, '甜歌');
INSERT INTO `sys_dict_data` VALUES (46, 12, '节奏', '12', 'song_style', NULL, 'primary', 'N', '0', 'admin', '2026-02-26 21:35:11', '', NULL, '节奏');
INSERT INTO `sys_dict_data` VALUES (47, 13, '民歌', '13', 'song_style', NULL, 'primary', 'N', '0', 'admin', '2026-02-26 21:35:11', '', NULL, '民歌');
INSERT INTO `sys_dict_data` VALUES (48, 2, '舰长专属', '1', 'exclusive_level', NULL, 'primary', 'N', '0', 'admin', '2026-02-26 21:35:11', 'admin', '2026-03-02 21:26:59', '舰长专属');
INSERT INTO `sys_dict_data` VALUES (49, 3, '提督专属', '2', 'exclusive_level', NULL, 'primary', 'N', '0', 'admin', '2026-02-26 21:35:11', 'admin', '2026-03-02 21:26:55', '提督专属');
INSERT INTO `sys_dict_data` VALUES (50, 4, '总督专属', '3', 'exclusive_level', NULL, 'primary', 'N', '0', 'admin', '2026-02-26 21:35:11', 'admin', '2026-03-02 21:26:50', '总督专属');
INSERT INTO `sys_dict_data` VALUES (51, 1, '有歌切', '1', 'song_slice', NULL, 'primary', 'N', '0', 'admin', '2026-02-26 21:35:11', '', NULL, '有歌切');
INSERT INTO `sys_dict_data` VALUES (52, 2, '无歌切', '2', 'song_slice', NULL, 'primary', 'N', '0', 'admin', '2026-02-26 21:35:11', '', NULL, '无歌切');
INSERT INTO `sys_dict_data` VALUES (53, 1, '无需大航海', '0', 'exclusive_level', NULL, 'primary', 'N', '0', 'admin', '2026-03-02 14:08:04', 'admin', '2026-03-02 14:09:25', '无需大航海');
INSERT INTO `sys_dict_data` VALUES (54, 1, '人气票', '1', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '人气票');
INSERT INTO `sys_dict_data` VALUES (55, 2, '粉丝团灯牌', '2', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '粉丝团灯牌');
INSERT INTO `sys_dict_data` VALUES (56, 3, '牛哇牛哇', '3', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '牛哇牛哇');
INSERT INTO `sys_dict_data` VALUES (57, 4, '这个好诶', '4', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '这个好诶');
INSERT INTO `sys_dict_data` VALUES (58, 5, '小花花', '5', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '小花花');
INSERT INTO `sys_dict_data` VALUES (59, 6, '粉丝团灯牌', '6', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '粉丝团灯牌');
INSERT INTO `sys_dict_data` VALUES (60, 7, '人气票', '7', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '人气票');
INSERT INTO `sys_dict_data` VALUES (61, 8, '心动卡', '8', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '心动卡');
INSERT INTO `sys_dict_data` VALUES (62, 9, '棒棒糖', '9', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '棒棒糖');
INSERT INTO `sys_dict_data` VALUES (63, 10, '你真好看', '10', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '你真好看');
INSERT INTO `sys_dict_data` VALUES (64, 11, '友谊的小船', '11', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '友谊的小船');
INSERT INTO `sys_dict_data` VALUES (65, 12, '幸运盲盒', '12', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '幸运盲盒');
INSERT INTO `sys_dict_data` VALUES (66, 13, '泡泡机', '13', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '泡泡机');
INSERT INTO `sys_dict_data` VALUES (67, 14, '情书', '14', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '情书');
INSERT INTO `sys_dict_data` VALUES (68, 15, '喜欢你', '15', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '喜欢你');
INSERT INTO `sys_dict_data` VALUES (69, 16, '为你打call', '16', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '为你打call');
INSERT INTO `sys_dict_data` VALUES (70, 17, '做我的小猫', '17', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '做我的小猫');
INSERT INTO `sys_dict_data` VALUES (71, 18, '捏捏小脸', '18', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '捏捏小脸');
INSERT INTO `sys_dict_data` VALUES (72, 19, '摸摸头', '19', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '摸摸头');
INSERT INTO `sys_dict_data` VALUES (73, 20, '干杯之旅', '20', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '干杯之旅');
INSERT INTO `sys_dict_data` VALUES (74, 21, '心动盲盒', '21', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '心动盲盒');
INSERT INTO `sys_dict_data` VALUES (75, 22, '秋日奶茶', '22', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '秋日奶茶');
INSERT INTO `sys_dict_data` VALUES (76, 23, '星河入梦', '23', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '星河入梦');
INSERT INTO `sys_dict_data` VALUES (77, 24, '告白花束', '24', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '告白花束');
INSERT INTO `sys_dict_data` VALUES (78, 25, '重拳出击', '25', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '重拳出击');
INSERT INTO `sys_dict_data` VALUES (79, 26, '凉凉一夏', '26', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '凉凉一夏');
INSERT INTO `sys_dict_data` VALUES (80, 27, '爱之魔力', '27', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '爱之魔力');
INSERT INTO `sys_dict_data` VALUES (81, 28, '花式夸夸', '28', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '花式夸夸');
INSERT INTO `sys_dict_data` VALUES (82, 29, '萌萌喵仙', '29', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '萌萌喵仙');
INSERT INTO `sys_dict_data` VALUES (83, 30, '流星雨', '30', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '流星雨');
INSERT INTO `sys_dict_data` VALUES (84, 31, '黄金麦克风', '31', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '黄金麦克风');
INSERT INTO `sys_dict_data` VALUES (85, 32, '啵啵', '32', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '啵啵');
INSERT INTO `sys_dict_data` VALUES (86, 33, '爱神之箭', '33', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '爱神之箭');
INSERT INTO `sys_dict_data` VALUES (87, 34, '携手同行', '34', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '携手同行');
INSERT INTO `sys_dict_data` VALUES (88, 35, '爱心小熊', '35', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '爱心小熊');
INSERT INTO `sys_dict_data` VALUES (89, 36, '新星诞生', '36', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '新星诞生');
INSERT INTO `sys_dict_data` VALUES (90, 37, '扭蛋机', '37', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '扭蛋机');
INSERT INTO `sys_dict_data` VALUES (91, 38, '冲浪', '38', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '冲浪');
INSERT INTO `sys_dict_data` VALUES (92, 39, '人鱼公主', '39', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '人鱼公主');
INSERT INTO `sys_dict_data` VALUES (93, 40, '风之吟唱', '40', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '风之吟唱');
INSERT INTO `sys_dict_data` VALUES (94, 41, '蔷薇恋语', '41', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '蔷薇恋语');
INSERT INTO `sys_dict_data` VALUES (95, 42, '星愿水晶球', '42', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '星愿水晶球');
INSERT INTO `sys_dict_data` VALUES (96, 43, '极速超跑', '43', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '极速超跑');
INSERT INTO `sys_dict_data` VALUES (97, 44, '游戏乐园', '44', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '游戏乐园');
INSERT INTO `sys_dict_data` VALUES (98, 45, '摩天轮', '45', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '摩天轮');
INSERT INTO `sys_dict_data` VALUES (99, 46, '启航之旅', '46', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '启航之旅');
INSERT INTO `sys_dict_data` VALUES (100, 47, '纯白花嫁', '47', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '纯白花嫁');
INSERT INTO `sys_dict_data` VALUES (101, 48, '花的告白', '48', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '花的告白');
INSERT INTO `sys_dict_data` VALUES (102, 49, '飞鸟仙梦', '49', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '飞鸟仙梦');
INSERT INTO `sys_dict_data` VALUES (103, 50, '奇幻梦境', '50', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '奇幻梦境');
INSERT INTO `sys_dict_data` VALUES (104, 51, '爱的乐章', '51', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '爱的乐章');
INSERT INTO `sys_dict_data` VALUES (105, 52, '告白气球', '52', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '告白气球');
INSERT INTO `sys_dict_data` VALUES (106, 53, '圆梦仙影', '53', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '圆梦仙影');
INSERT INTO `sys_dict_data` VALUES (107, 54, '梦游仙境', '54', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '梦游仙境');
INSERT INTO `sys_dict_data` VALUES (108, 55, '热气球', '55', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '热气球');
INSERT INTO `sys_dict_data` VALUES (109, 56, '糖果车', '56', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '糖果车');
INSERT INTO `sys_dict_data` VALUES (110, 57, '月桂皇冠', '57', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '月桂皇冠');
INSERT INTO `sys_dict_data` VALUES (111, 58, '飞屋环游', '58', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '飞屋环游');
INSERT INTO `sys_dict_data` VALUES (112, 59, '为你摘星', '59', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '为你摘星');
INSERT INTO `sys_dict_data` VALUES (113, 60, '原地求婚', '60', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '原地求婚');
INSERT INTO `sys_dict_data` VALUES (114, 61, '转运锦鲤', '61', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '转运锦鲤');
INSERT INTO `sys_dict_data` VALUES (115, 62, '星轨列车', '62', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '星轨列车');
INSERT INTO `sys_dict_data` VALUES (116, 63, '舞台天王', '63', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '舞台天王');
INSERT INTO `sys_dict_data` VALUES (117, 64, '好活当赏', '64', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '好活当赏');
INSERT INTO `sys_dict_data` VALUES (118, 65, '海湾之旅', '65', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '海湾之旅');
INSERT INTO `sys_dict_data` VALUES (119, 66, '飞天转椅', '66', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '飞天转椅');
INSERT INTO `sys_dict_data` VALUES (120, 67, '鸿运小电视', '67', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '鸿运小电视');
INSERT INTO `sys_dict_data` VALUES (121, 68, '次元之城', '68', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '次元之城');
INSERT INTO `sys_dict_data` VALUES (122, 69, '领航者飞船', '69', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '领航者飞船');
INSERT INTO `sys_dict_data` VALUES (123, 70, '探索者启航', '70', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '探索者启航');
INSERT INTO `sys_dict_data` VALUES (124, 71, '小电视飞船', '71', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '小电视飞船');
INSERT INTO `sys_dict_data` VALUES (125, 72, '鎏金小电视', '72', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '鎏金小电视');
INSERT INTO `sys_dict_data` VALUES (126, 73, '梦幻游乐园', '73', 'gift_list', '', 'primary', 'N', '0', 'admin', '2026-03-02 14:50:54', NULL, NULL, '梦幻游乐园');
INSERT INTO `sys_dict_data` VALUES (127, 6, '法语', '6', 'song_language', NULL, 'primary', 'N', '0', 'admin', '2026-03-08 20:09:52', '', NULL, '法语');
INSERT INTO `sys_dict_data` VALUES (128, 7, '德语', '7', 'song_language', NULL, 'primary', 'N', '0', 'admin', '2026-03-08 20:09:52', '', NULL, '德语');
INSERT INTO `sys_dict_data` VALUES (129, 8, '西班牙语', '8', 'song_language', NULL, 'primary', 'N', '0', 'admin', '2026-03-08 20:09:52', '', NULL, '西班牙语');
INSERT INTO `sys_dict_data` VALUES (130, 9, '葡萄牙语', '9', 'song_language', NULL, 'primary', 'N', '0', 'admin', '2026-03-08 20:09:52', '', NULL, '葡萄牙语');
INSERT INTO `sys_dict_data` VALUES (131, 10, '意大利语', '10', 'song_language', NULL, 'primary', 'N', '0', 'admin', '2026-03-08 20:09:52', '', NULL, '意大利语');
INSERT INTO `sys_dict_data` VALUES (132, 11, '闽南语', '11', 'song_language', NULL, 'primary', 'N', '0', 'admin', '2026-03-08 20:09:52', '', NULL, '闽南语');
INSERT INTO `sys_dict_data` VALUES (133, 12, '吴语', '12', 'song_language', NULL, 'primary', 'N', '0', 'admin', '2026-03-08 20:09:52', '', NULL, '吴语');
INSERT INTO `sys_dict_data` VALUES (134, 13, '潮语', '13', 'song_language', NULL, 'primary', 'N', '0', 'admin', '2026-03-08 20:09:52', '', NULL, '潮语');
INSERT INTO `sys_dict_data` VALUES (135, 14, '泰语', '14', 'song_language', NULL, 'primary', 'N', '0', 'admin', '2026-03-08 20:09:52', '', NULL, '泰语');
INSERT INTO `sys_dict_data` VALUES (136, 15, '纯音乐', '15', 'song_language', NULL, 'primary', 'N', '0', 'admin', '2026-03-08 20:09:52', '', NULL, '纯音乐');
INSERT INTO `sys_dict_data` VALUES (137, 16, '其他', '16', 'song_language', NULL, 'primary', 'N', '0', 'admin', '2026-03-08 20:09:52', '', NULL, '其他');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '歌单语种', 'song_language', '0', 'admin', '2026-02-26 21:31:01', '', NULL, '歌单语种列表');
INSERT INTO `sys_dict_type` VALUES (12, '曲风', 'song_style', '0', 'admin', '2026-02-26 21:36:59', '', NULL, '曲风类型（标签）');
INSERT INTO `sys_dict_type` VALUES (13, '大航海', 'exclusive_level', '0', 'admin', '2026-02-26 21:36:59', '', NULL, '大航海');
INSERT INTO `sys_dict_type` VALUES (14, '歌切', 'song_slice', '0', 'admin', '2026-02-26 21:36:59', '', NULL, '歌切');
INSERT INTO `sys_dict_type` VALUES (15, '礼物', 'gift_list', '0', 'admin', '2026-03-02 14:10:11', 'admin', '2026-03-02 14:10:44', '礼物列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2026-02-24 20:59:02', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2026-02-24 20:59:02', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2026-02-24 20:59:02', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-02-24 21:16:23');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-02-24 21:20:03');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-02-24 22:54:24');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-02-25 19:23:56');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-02-25 21:29:04');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-02-25 22:01:37');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-02-25 22:31:49');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-02-26 19:53:48');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-02-26 20:32:16');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-02 20:09:47');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-04 09:45:05');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-04 10:49:54');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-04 13:07:54');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-04 14:08:40');
INSERT INTO `sys_logininfor` VALUES (114, 'ry', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-04 14:08:43');
INSERT INTO `sys_logininfor` VALUES (115, 'ry', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-04 14:09:35');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-04 14:09:39');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-05 20:03:49');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-05 20:03:52');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-05 20:07:17');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-05 20:09:42');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-05 20:11:11');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-05 20:13:39');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-05 20:15:24');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-05 21:21:34');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-07 20:44:09');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-07 21:59:10');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-08 19:36:32');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-08 20:06:34');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-08 20:38:08');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2009 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2026-02-24 20:59:01', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2026-02-24 20:59:01', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2026-02-24 20:59:01', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', '', 1, 0, 'M', '0', '1', '', 'guide', 'admin', '2026-02-24 20:59:01', 'admin', '2026-02-26 20:33:05', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2026-02-24 20:59:01', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2026-02-24 20:59:01', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2026-02-24 20:59:01', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2026-02-24 20:59:01', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2026-02-24 20:59:01', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2026-02-24 20:59:01', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2026-02-24 20:59:01', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2026-02-24 20:59:01', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2026-02-24 20:59:01', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2026-02-24 20:59:01', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2026-02-24 20:59:01', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2026-02-24 20:59:01', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2026-02-24 20:59:01', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2026-02-24 20:59:01', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2026-02-24 20:59:01', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2026-02-24 20:59:01', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2026-02-24 20:59:01', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2026-02-24 20:59:01', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2026-02-24 20:59:01', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2026-02-24 20:59:01', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '歌单1', 0, 6, 'songListOne', 'songList/songList_one', NULL, '', 1, 0, 'M', '0', '0', '', '404', 'admin', '2026-02-24 21:24:11', 'admin', '2026-02-26 21:29:35', '');
INSERT INTO `sys_menu` VALUES (2001, '歌单2', 0, 7, 'songListTwo', 'songList/songList_two', NULL, '', 1, 0, 'M', '0', '0', '', 'bug', 'admin', '2026-02-25 21:29:42', 'admin', '2026-02-26 21:29:38', '');
INSERT INTO `sys_menu` VALUES (2002, '歌单管理', 0, 5, 'songListInfo', 'songList/info/index', NULL, 'songListInfo', 1, 0, 'C', '0', '0', 'songList:info:list', 'dashboard', 'admin', '2026-02-26 20:37:53', 'admin', '2026-02-26 20:55:41', '歌单菜单');
INSERT INTO `sys_menu` VALUES (2003, '歌单查询', 2002, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'songList:info:query', '#', 'admin', '2026-02-26 20:37:53', 'admin', '2026-02-26 20:56:55', '');
INSERT INTO `sys_menu` VALUES (2004, '歌单新增', 2002, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'songList:info:add', '#', 'admin', '2026-02-26 20:37:53', 'admin', '2026-02-26 20:58:01', '');
INSERT INTO `sys_menu` VALUES (2005, '歌单修改', 2002, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'songList:info:edit', '#', 'admin', '2026-02-26 20:37:53', 'admin', '2026-02-26 20:58:13', '');
INSERT INTO `sys_menu` VALUES (2006, '歌单删除', 2002, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'songList:info:remove', '#', 'admin', '2026-02-26 20:37:53', 'admin', '2026-02-26 20:58:56', '');
INSERT INTO `sys_menu` VALUES (2007, '歌单导出', 2002, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'songList:info:export', '#', 'admin', '2026-02-26 20:37:53', 'admin', '2026-02-26 20:59:08', '');
INSERT INTO `sys_menu` VALUES (2008, '歌单导入', 2002, 6, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'songList:info:import', '#', 'admin', '2026-03-04 15:12:53', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2026-02-24 20:59:02', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2026-02-24 20:59:02', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 176 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2026-02-24 20:59:02\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-24 21:20:26', 67);
INSERT INTO `sys_oper_log` VALUES (101, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":1,\"configKey\":\"sys.index.skinName\",\"configName\":\"主框架页-默认皮肤样式名称\",\"configType\":\"Y\",\"configValue\":\"skin-red\\n\",\"createBy\":\"admin\",\"createTime\":\"2026-02-24 20:59:02\",\"params\":{},\"remark\":\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-24 21:20:41', 22);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"歌单1\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"demo\",\"routeName\":\"SingList1\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-24 21:24:11', 27);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-02-24 21:24:11\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"歌单1\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"demo\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-24 21:24:31', 20);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"singList/singList_one\",\"createTime\":\"2026-02-24 21:24:11\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"歌单1\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"singListOne\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-24 21:39:06', 20);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"singList/singList_one\",\"createTime\":\"2026-02-24 21:24:11\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"歌单1\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"singListOne\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-24 21:40:07', 19);
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"歌单2\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"singList/singList_two\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-25 21:29:42', 42);
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"singList/singList_two\",\"createTime\":\"2026-02-25 21:29:42\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"歌单2\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"singListTwo\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-25 21:30:26', 24);
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"singList/singList_two\",\"createTime\":\"2026-02-25 21:29:42\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"歌单2\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"singListTwo\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-25 21:30:31', 16);
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4 ', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2026-02-26 20:32:28', 27);
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-02-24 20:59:01\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 20:32:37', 32);
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4 ', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2026-02-26 20:32:39', 12);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4 ', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2026-02-26 20:32:50', 8);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-02-24 20:59:01\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 20:33:05', 19);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4 ', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2026-02-26 20:33:07', 8);
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"song_list\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 20:34:38', 137);
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"list\",\"className\":\"SongList\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID（序号）\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-26 20:34:38\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MusicName\",\"columnComment\":\"歌名\",\"columnId\":2,\"columnName\":\"music_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-26 20:34:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"musicName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Language\",\"columnComment\":\"语言\",\"columnId\":3,\"columnName\":\"language\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-26 20:34:38\",\"dictType\":\"sys_notice_status\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"language\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MusicalStyle\",\"columnComment\":\"曲风\",\"columnId\":4,\"columnName\":\"musical_style\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-26 20:34:38\",\"dictType\":\"sys_job_group\",\"edit\":true,\"htmlType\":\"checkbox\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 20:36:48', 30);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"song_list\"}', NULL, 0, NULL, '2026-02-26 20:36:50', 329);
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"songList/songList_one\",\"createTime\":\"2026-02-24 21:24:11\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"歌单1\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"songListOne\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 20:52:43', 44);
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"songList/songList_two\",\"createTime\":\"2026-02-25 21:29:42\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"歌单2\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"songListTwo\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 20:52:59', 24);
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"songList/info/index\",\"createTime\":\"2026-02-26 20:37:53\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"歌单\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"songListInfo\",\"perms\":\"songList:info:list\",\"routeName\":\"songListInfo\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 20:54:01', 21);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"songList/info/index\",\"createTime\":\"2026-02-26 20:37:53\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"歌单管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"songListInfo\",\"perms\":\"songList:info:list\",\"routeName\":\"songListInfo\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 20:54:23', 19);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"songList/info/index\",\"createTime\":\"2026-02-26 20:37:53\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"歌单管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"songListInfo\",\"perms\":\"songList:info:list\",\"routeName\":\"songListInfo\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 20:54:34', 20);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"songList/info/index\",\"createTime\":\"2026-02-26 20:37:53\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"歌单管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"songListInfo\",\"perms\":\"songList:info:list\",\"routeName\":\"songListInfo\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 20:55:41', 21);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2026-02-26 20:37:53\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"歌单查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"#\",\"perms\":\"songList:info:query\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 20:56:55', 17);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2026-02-26 20:37:53\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"歌单新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2002,\"path\":\"#\",\"perms\":\"songList:info:add\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 20:58:01', 19);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2026-02-26 20:37:53\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"歌单修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2002,\"path\":\"#\",\"perms\":\"songList:info:edit\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 20:58:13', 19);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2026-02-26 20:37:53\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"歌单删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2002,\"path\":\"#\",\"perms\":\"songList:info:remove\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 20:58:56', 36);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2026-02-26 20:37:53\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"歌单导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2002,\"path\":\"#\",\"perms\":\"songList:info:export\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 20:59:08', 17);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"songList/songList_one\",\"createTime\":\"2026-02-24 21:24:11\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"歌单1\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"songListOne\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 21:29:35', 58);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"songList/songList_two\",\"createTime\":\"2026-02-25 21:29:42\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"歌单2\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"songListTwo\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 21:29:38', 24);
INSERT INTO `sys_oper_log` VALUES (131, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"歌单语种\",\"dictType\":\"song_language\",\"params\":{},\"remark\":\"歌单语种列表\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 21:31:01', 25);
INSERT INTO `sys_oper_log` VALUES (132, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"国语\",\"dictSort\":1,\"dictType\":\"song_language\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"remark\":\"正常状态\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 21:33:37', 22);
INSERT INTO `sys_oper_log` VALUES (133, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"日语\",\"dictSort\":2,\"dictType\":\"song_language\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"remark\":\"正常状态\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 21:34:18', 22);
INSERT INTO `sys_oper_log` VALUES (134, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-02-26 21:33:37\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"国语\",\"dictSort\":1,\"dictType\":\"song_language\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"remark\":\"国语\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 21:34:32', 19);
INSERT INTO `sys_oper_log` VALUES (135, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-02-26 21:34:18\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"日语\",\"dictSort\":2,\"dictType\":\"song_language\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"remark\":\"日语\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 21:34:35', 15);
INSERT INTO `sys_oper_log` VALUES (136, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"英语\",\"dictSort\":3,\"dictType\":\"song_language\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"remark\":\"英语\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 21:34:57', 18);
INSERT INTO `sys_oper_log` VALUES (137, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"韩语\",\"dictSort\":4,\"dictType\":\"song_language\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"remark\":\"韩语\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 21:35:11', 18);
INSERT INTO `sys_oper_log` VALUES (138, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"曲风\",\"dictType\":\"song_style\",\"params\":{},\"remark\":\"曲风类型（标签）\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 21:36:59', 14);
INSERT INTO `sys_oper_log` VALUES (139, '歌单', 1, 'com.ruoyi.songList.controller.SongListController.add()', 'POST', 1, 'admin', '研发部门', '/songList/info', '127.0.0.1', '内网IP', '{\"exclusiveLevel\":\"1\",\"language\":\"2\",\"musicName\":\"SLEEPWALK\",\"musicalStyle\":\"3,6,5\",\"params\":{},\"pay\":\"130\",\"remark\":\"测试\",\"singer\":\"ヒトリエ\",\"songSlice\":\"2\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 22:37:49', 229);
INSERT INTO `sys_oper_log` VALUES (140, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-02-26 21:35:11\",\"default\":false,\"dictCode\":40,\"dictLabel\":\"二次元\",\"dictSort\":6,\"dictType\":\"song_style\",\"dictValue\":\"6\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"remark\":\"二次元\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 22:43:42', 18);
INSERT INTO `sys_oper_log` VALUES (141, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-02-26 21:35:11\",\"default\":false,\"dictCode\":37,\"dictLabel\":\"日系\",\"dictSort\":3,\"dictType\":\"song_style\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"remark\":\"日系\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 22:45:33', 42);
INSERT INTO `sys_oper_log` VALUES (142, '歌单', 2, 'com.ruoyi.songList.controller.SongListController.edit()', 'PUT', 1, 'admin', '研发部门', '/songList/info', '127.0.0.1', '内网IP', '{\"exclusiveLevel\":\"1\",\"id\":1,\"language\":\"2\",\"musicName\":\"SLEEPWALK\",\"musicalStyle\":\"3,6,5\",\"params\":{},\"pay\":\"131\",\"remark\":\"测试\",\"singer\":\"ヒトリエ\",\"songSlice\":\"2\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-26 22:45:52', 8);
INSERT INTO `sys_oper_log` VALUES (143, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-02-26 21:35:11\",\"default\":false,\"dictCode\":50,\"dictLabel\":\"总督专属\",\"dictSort\":4,\"dictType\":\"exclusive_level\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"remark\":\"总督专属\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-02 21:26:51', 41);
INSERT INTO `sys_oper_log` VALUES (144, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-02-26 21:35:11\",\"default\":false,\"dictCode\":49,\"dictLabel\":\"提督专属\",\"dictSort\":3,\"dictType\":\"exclusive_level\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"remark\":\"提督专属\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-02 21:26:56', 17);
INSERT INTO `sys_oper_log` VALUES (145, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-02-26 21:35:11\",\"default\":false,\"dictCode\":48,\"dictLabel\":\"舰长专属\",\"dictSort\":2,\"dictType\":\"exclusive_level\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"remark\":\"舰长专属\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-02 21:26:59', 15);
INSERT INTO `sys_oper_log` VALUES (146, '歌单', 1, 'com.ruoyi.songList.controller.SongListController.add()', 'POST', 1, 'admin', '研发部门', '/songList/info', '127.0.0.1', '内网IP', '{\"exclusiveLevel\":\"2\",\"gift\":\"{\\\"createBy\\\":null,\\\"createTime\\\":null,\\\"updateBy\\\":null,\\\"updateTime\\\":null,\\\"remark\\\":null,\\\"name\\\":\\\"告白花束\\\",\\\"price\\\":\\\"19.9\\\",\\\"icon\\\":\\\"https://s1.hdslb.com/bfs/live/a4aa89aaa24534cb77534680eaed1f5f2f9aa71f.png\\\",\\\"value\\\":24}\",\"language\":\"2\",\"musicName\":\"フユノ(冬野)\",\"musicalStyle\":\"1,3,4,5,6\",\"params\":{},\"pay\":\"30\",\"remark\":\"フユノ(冬野)\",\"singer\":\"ヒトリエ\",\"songSlice\":\"2\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-02 23:27:55', 247);
INSERT INTO `sys_oper_log` VALUES (147, '歌单', 1, 'com.ruoyi.songList.controller.SongListController.add()', 'POST', 1, 'admin', '研发部门', '/songList/info', '127.0.0.1', '内网IP', '{\"exclusiveLevel\":\"3\",\"gift\":\"{\\\"name\\\":\\\"舞台天王\\\",\\\"price\\\":\\\"666.6\\\",\\\"icon\\\":\\\"https://s1.hdslb.com/bfs/live/7636ca1a0ab5ed2d1b639044655164987e8d3510.png\\\",\\\"value\\\":63}\",\"language\":\"2\",\"musicName\":\"日常と地球の額縁 (日常和地球的画框)\",\"musicalStyle\":\"3,6\",\"params\":{},\"pay\":\"500\",\"remark\":\"日常と地球の額縁 (日常和地球的画框)\",\"singer\":\"ヒトリエ\",\"songSlice\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-02 23:39:04', 239);
INSERT INTO `sys_oper_log` VALUES (148, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/102', '127.0.0.1', '内网IP', '102 ', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2026-03-04 14:04:05', 19);
INSERT INTO `sys_oper_log` VALUES (149, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/109', '127.0.0.1', '内网IP', '109 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-04 14:04:09', 11);
INSERT INTO `sys_oper_log` VALUES (150, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/108', '127.0.0.1', '内网IP', '108 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-04 14:04:11', 20);
INSERT INTO `sys_oper_log` VALUES (151, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/102', '127.0.0.1', '内网IP', '102 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-04 14:04:13', 9);
INSERT INTO `sys_oper_log` VALUES (152, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/107', '127.0.0.1', '内网IP', '107 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-04 14:04:15', 22);
INSERT INTO `sys_oper_log` VALUES (153, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/106', '127.0.0.1', '内网IP', '106 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-04 14:04:16', 11);
INSERT INTO `sys_oper_log` VALUES (154, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"Trevor Philips Industry\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-04 14:05:57', 19);
INSERT INTO `sys_oper_log` VALUES (155, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"歌单\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"Trevor Philips Industry\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-04 14:06:40', 26);
INSERT INTO `sys_oper_log` VALUES (156, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/105', '127.0.0.1', '内网IP', '105 ', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2026-03-04 14:06:55', 6);
INSERT INTO `sys_oper_log` VALUES (157, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/104', '127.0.0.1', '内网IP', '104 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-04 14:06:59', 15);
INSERT INTO `sys_oper_log` VALUES (158, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/103', '127.0.0.1', '内网IP', '103 ', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2026-03-04 14:07:01', 6);
INSERT INTO `sys_oper_log` VALUES (159, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"主播\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"歌单\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-04 14:07:44', 26);
INSERT INTO `sys_oper_log` VALUES (160, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"管理员\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"歌单\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-04 14:07:52', 29);
INSERT INTO `sys_oper_log` VALUES (161, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2026-02-24 20:59:01\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2002,2003,2004,2005,2006,2007,2000,2001],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-04 14:08:21', 34);
INSERT INTO `sys_oper_log` VALUES (162, '歌单', 1, 'com.ruoyi.songList.controller.SongListController.add()', 'POST', 1, 'ry', '主播', '/songList/info', '127.0.0.1', '内网IP', '{\"exclusiveLevel\":\"1\",\"gift\":\"{\\\"name\\\":\\\"梦幻游乐园\\\",\\\"price\\\":\\\"3000.0\\\",\\\"icon\\\":\\\"https://s1.hdslb.com/bfs/live/f1ed9d627f75b46fe621558951847e0e4e95d6a2.png\\\",\\\"value\\\":73}\",\"language\":\"1\",\"musicName\":\"普通用户测试-歌名\",\"musicalStyle\":\"1,2,4,6\",\"params\":{},\"pay\":\"257\",\"remark\":\"普通用户测试-备注\",\"singer\":\"普通用户测试-歌手\",\"songSlice\":\"1\",\"uploader\":\"2\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-04 14:09:29', 19);
INSERT INTO `sys_oper_log` VALUES (163, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '管理员', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1, 'D:\\ruoyi\\uploadPath\\avatar\\2026\\03\\04\\183db60ea8184a8ea90c5abcd4b142ff.png', '2026-03-04 15:02:48', 89);
INSERT INTO `sys_oper_log` VALUES (164, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '管理员', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/03/04/febd20c35da54d7dad736e3aeb3377a6.png\",\"code\":200}', 0, NULL, '2026-03-04 15:03:55', 122);
INSERT INTO `sys_oper_log` VALUES (165, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '管理员', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"18888888888@163.com\",\"nickName\":\"超级管理员\",\"params\":{},\"phonenumber\":\"18888888888\",\"sex\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-04 15:04:30', 22);
INSERT INTO `sys_oper_log` VALUES (166, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '管理员', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"歌单导入\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2002,\"perms\":\"songList:info:import\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-04 15:12:53', 21);
INSERT INTO `sys_oper_log` VALUES (167, '歌单', 5, 'com.ruoyi.songList.controller.SongListController.export()', 'POST', 1, 'admin', '管理员', '/songList/info/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2026-03-04 15:19:49', 659);
INSERT INTO `sys_oper_log` VALUES (168, '歌单管理', 6, 'com.ruoyi.songList.controller.SongListController.importData()', 'POST', 1, 'admin', '管理员', '/songList/info/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', NULL, 1, '很抱歉，导入失败！共 490 条数据格式不正确，错误如下：<br/>1、歌曲 SLEEPWALK 导入失败：\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'del_flag\' in \'where clause\'\r\n### The error may exist in file [C:\\Proj\\RuoYi\\RuoYi-Api\\ruoyi-songList\\target\\classes\\mapper\\songList\\SongListMapper.xml]\r\n### The error may involve com.ruoyi.songList.mapper.SongListMapper.selectSongListByMusicName-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select id, music_name, singer, language, musical_style, pay, exclusive_level, gift, song_slice, remark from song_list               where music_name = ? and del_flag = \'0\'\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'del_flag\' in \'where clause\'\n; bad SQL grammar []<br/>2、歌曲 フユノ(冬野) 导入失败：\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'del_flag\' in \'where clause\'\r\n### The error may exist in file [C:\\Proj\\RuoYi\\RuoYi-Api\\ruoyi-songList\\target\\classes\\mapper\\songList\\SongListMapper.xml]\r\n### The error may involve com.ruoyi.songList.mapper.SongListMapper.selectSongListByMusicName-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select id, music_name, singer, language, musical_style, pay, exclusive_level, gift, song_slice, remark from song_list               where music_name = ? and del_flag = \'0\'\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'del_flag\' in \'where clause\'\n; bad SQL grammar []<br/>3、歌曲 日常と地球の額縁 (日常和地球的画框) 导入失败：\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'del_flag\' in \'where clause\'\r\n### The error may exist in file [C:\\Proj\\RuoYi\\RuoYi-Api\\ruoyi-songList\\target\\classes\\mapper\\songList\\SongListMapper.xml]\r\n### The error may involve com.ruoyi.songList.mapper.SongListMapper.selectSongListByMusicName-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select id, music_name, singer, language, musical_style, pay, exclusive_level, gift, song_slice, remark from song_list    ', '2026-03-05 21:21:46', 5033);
INSERT INTO `sys_oper_log` VALUES (169, '歌单管理', 6, 'com.ruoyi.songList.controller.SongListController.importData()', 'POST', 1, 'admin', '管理员', '/songList/info/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 7 条数据格式不正确，错误如下：<br/>1、歌曲 SLEEPWALK 已存在<br/>2、歌曲 フユノ(冬野) 已存在<br/>3、歌曲 日常と地球の額縁 (日常和地球的画框) 已存在<br/>4、歌曲 sleepwalk 已存在<br/>5、歌曲 东京不太热 已存在<br/>6、歌曲 喜欢 已存在<br/>7、歌曲 Tell Me Baby 已存在', '2026-03-05 21:23:43', 6594);
INSERT INTO `sys_oper_log` VALUES (170, '歌单管理', 6, 'com.ruoyi.songList.controller.SongListController.importData()', 'POST', 1, 'admin', '管理员', '/songList/info/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 490 条，数据如下：<br/>1、歌曲 SLEEPWALK 更新成功<br/>2、歌曲 フユノ(冬野) 更新成功<br/>3、歌曲 日常と地球の額縁 (日常和地球的画框) 更新成功<br/>4、歌曲 カラノワレモノ (空之碎物) 更新成功<br/>5、歌曲 さらってほしいの (希望你能把我带走) 更新成功<br/>6、歌曲 モノカラー (黑白色彩) 更新成功<br/>7、歌曲 RIVER FOG,CHOCOLATE BUTTERFLY 更新成功<br/>8、歌曲 NOTOK 更新成功<br/>9、歌曲 (W)HERE 更新成功<br/>10、歌曲 癖 更新成功<br/>11、歌曲 東京フラッシュ (东京闪景) 更新成功<br/>12、歌曲 napori 更新成功<br/>13、歌曲 踊り子 (舞女) 更新成功<br/>14、歌曲 灯火 更新成功<br/>15、歌曲 裸の勇者 (赤裸的勇士) 更新成功<br/>16、歌曲 僕は今日も (今天我也) 更新成功<br/>17、歌曲 不可幸力 更新成功<br/>18、歌曲 走馬灯 更新成功<br/>19、歌曲 恋風邪にのせて (患上恋爱感冒) 更新成功<br/>20、歌曲 怪獣の唄 更新成功<br/>21、歌曲 宮 更新成功<br/>22、歌曲 花占い (花瓣占卜) 更新成功<br/>23、歌曲 mabataki 更新成功<br/>24、歌曲 HERO 更新成功<br/>25、歌曲 風神 (日剧《狮子的藏身处》主题曲) 更新成功<br/>26、歌曲 常熱 更新成功<br/>27、歌曲 トドメの一撃 feat. Cory Wong 更新成功<br/>28、歌曲 GORILLA SHIBAI (猿芝居) 更新成功<br/>29、歌曲 逃避行 (逃避之旅) 更新成功<br/>30、歌曲 断面 (日剧《教祖之女》主题曲) 更新成功<br/>31、歌曲 王 更新成功<br/>32、歌曲 ダークルーム（暗室） 更新成功<br/>33、歌曲 ＆疾走 更新成功<br/>34、歌曲 呆然 更新成功<br/>35、歌曲 愛がすべて (爱即是一切 / All I need is love) 更新成功<br/>36、歌曲 ラブレス (LOVELESS/爱恋失格) 更新成功<br/>37、歌曲 天国 更新成功<br/>38、歌曲 芝居の終焉 (戏剧的尽头) 更新成功<br/>39、歌曲 寄り酔い (倚醉) 更新成功<br/>40、歌曲 ブラウニー (布朗尼 Brownie) 更新成功<br/>41、歌曲 イージーゲーム (Easy Game) 更新成功<br/>42、歌曲 The Fog 更新成功<br/>43、歌曲 ビーユアセルフ (做你自己 Be Yourself) 更新成功<br/>44、歌曲 進め！そっちだ！ (auお正月新CM) 更新成功<br/>45、歌曲 シュガーロス 更新成功<br/>46、歌曲 泡沫 更新成功<br/>47、歌曲 まだ浅はか (feat. 和ぬか) 更新成功<br/>48、歌曲 アイオクレ 更新成功<br/>49、歌曲 アミ (日剧《妖怪合租屋》主题曲) 更新成功<br/>50、歌曲 ラブの逃走 (爱意逃亡) 更新成功<br/>51、歌曲 ロックでキス 更新成功<br/>52、歌曲 真っ裸 更新成功<br/>53、歌曲 ミカヅキ (新月) 更新成功<br/>54、歌曲 フラレガイガール (被甩男女) 更新成功<br/>55、歌曲 光と闇 (光与暗) 更新成功<br/>56、歌曲 十億年 更新成功<br/>57、歌曲 さよーならあなた 更新成功<br/>58、歌曲 エメラルド 更新成功<br/>59、歌曲 かみつきたい 更新成功<br/>60、歌曲 アーケード (拱廊) 更新成功<br/>61、歌曲 朝になって夢からさめて 更新成功<br/>62、歌曲 祝日 更新成功<br/>63、歌曲 湯船 更新成功<br/>64、歌曲 あなたは煙草 私はシャボン(你是烟草 我是泡沫) 更新成功<br/>65、歌曲 水星 更新成功<br/>66、歌曲 サーカスナイト 更新成功<br/>67、歌曲 202 (New Mix) 更新成功<br/>68、歌曲 ルミネセンス 更新成功<br/>69、歌曲 はじめまして 更新成功<br/>70、歌曲 私の好きなもの (我喜欢的东西) 更新成功<br/>71、歌曲 わたしのうた 更新成功<br/>72、歌曲 笑い話 更新成功<br/>73、歌曲 サターン (土星) 更新成功<br/>74、歌曲 グラスとラムレーズン 更新成功<br/>75、歌曲 Ham 更新成功<br/>76、歌曲 君がいて水になる (有你', 0, NULL, '2026-03-05 21:28:44', 4734);
INSERT INTO `sys_oper_log` VALUES (171, '歌单管理', 6, 'com.ruoyi.songList.controller.SongListController.importData()', 'POST', 1, 'admin', '管理员', '/songList/info/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 490 条，数据如下：<br/>1、歌曲 SLEEPWALK 更新成功<br/>2、歌曲 フユノ(冬野) 更新成功<br/>3、歌曲 日常と地球の額縁 (日常和地球的画框) 更新成功<br/>4、歌曲 カラノワレモノ (空之碎物) 更新成功<br/>5、歌曲 さらってほしいの (希望你能把我带走) 更新成功<br/>6、歌曲 モノカラー (黑白色彩) 更新成功<br/>7、歌曲 RIVER FOG,CHOCOLATE BUTTERFLY 更新成功<br/>8、歌曲 NOTOK 更新成功<br/>9、歌曲 (W)HERE 更新成功<br/>10、歌曲 癖 更新成功<br/>11、歌曲 東京フラッシュ (东京闪景) 更新成功<br/>12、歌曲 napori 更新成功<br/>13、歌曲 踊り子 (舞女) 更新成功<br/>14、歌曲 灯火 更新成功<br/>15、歌曲 裸の勇者 (赤裸的勇士) 更新成功<br/>16、歌曲 僕は今日も (今天我也) 更新成功<br/>17、歌曲 不可幸力 更新成功<br/>18、歌曲 走馬灯 更新成功<br/>19、歌曲 恋風邪にのせて (患上恋爱感冒) 更新成功<br/>20、歌曲 怪獣の唄 更新成功<br/>21、歌曲 宮 更新成功<br/>22、歌曲 花占い (花瓣占卜) 更新成功<br/>23、歌曲 mabataki 更新成功<br/>24、歌曲 HERO 更新成功<br/>25、歌曲 風神 (日剧《狮子的藏身处》主题曲) 更新成功<br/>26、歌曲 常熱 更新成功<br/>27、歌曲 トドメの一撃 feat. Cory Wong 更新成功<br/>28、歌曲 GORILLA SHIBAI (猿芝居) 更新成功<br/>29、歌曲 逃避行 (逃避之旅) 更新成功<br/>30、歌曲 断面 (日剧《教祖之女》主题曲) 更新成功<br/>31、歌曲 王 更新成功<br/>32、歌曲 ダークルーム（暗室） 更新成功<br/>33、歌曲 ＆疾走 更新成功<br/>34、歌曲 呆然 更新成功<br/>35、歌曲 愛がすべて (爱即是一切 / All I need is love) 更新成功<br/>36、歌曲 ラブレス (LOVELESS/爱恋失格) 更新成功<br/>37、歌曲 天国 更新成功<br/>38、歌曲 芝居の終焉 (戏剧的尽头) 更新成功<br/>39、歌曲 寄り酔い (倚醉) 更新成功<br/>40、歌曲 ブラウニー (布朗尼 Brownie) 更新成功<br/>41、歌曲 イージーゲーム (Easy Game) 更新成功<br/>42、歌曲 The Fog 更新成功<br/>43、歌曲 ビーユアセルフ (做你自己 Be Yourself) 更新成功<br/>44、歌曲 進め！そっちだ！ (auお正月新CM) 更新成功<br/>45、歌曲 シュガーロス 更新成功<br/>46、歌曲 泡沫 更新成功<br/>47、歌曲 まだ浅はか (feat. 和ぬか) 更新成功<br/>48、歌曲 アイオクレ 更新成功<br/>49、歌曲 アミ (日剧《妖怪合租屋》主题曲) 更新成功<br/>50、歌曲 ラブの逃走 (爱意逃亡) 更新成功<br/>51、歌曲 ロックでキス 更新成功<br/>52、歌曲 真っ裸 更新成功<br/>53、歌曲 ミカヅキ (新月) 更新成功<br/>54、歌曲 フラレガイガール (被甩男女) 更新成功<br/>55、歌曲 光と闇 (光与暗) 更新成功<br/>56、歌曲 十億年 更新成功<br/>57、歌曲 さよーならあなた 更新成功<br/>58、歌曲 エメラルド 更新成功<br/>59、歌曲 かみつきたい 更新成功<br/>60、歌曲 アーケード (拱廊) 更新成功<br/>61、歌曲 朝になって夢からさめて 更新成功<br/>62、歌曲 祝日 更新成功<br/>63、歌曲 湯船 更新成功<br/>64、歌曲 あなたは煙草 私はシャボン(你是烟草 我是泡沫) 更新成功<br/>65、歌曲 水星 更新成功<br/>66、歌曲 サーカスナイト 更新成功<br/>67、歌曲 202 (New Mix) 更新成功<br/>68、歌曲 ルミネセンス 更新成功<br/>69、歌曲 はじめまして 更新成功<br/>70、歌曲 私の好きなもの (我喜欢的东西) 更新成功<br/>71、歌曲 わたしのうた 更新成功<br/>72、歌曲 笑い話 更新成功<br/>73、歌曲 サターン (土星) 更新成功<br/>74、歌曲 グラスとラムレーズン 更新成功<br/>75、歌曲 Ham 更新成功<br/>76、歌曲 君がいて水になる (有你', 0, NULL, '2026-03-05 21:32:10', 101856);
INSERT INTO `sys_oper_log` VALUES (172, '歌单管理', 6, 'com.ruoyi.songList.controller.SongListController.importData()', 'POST', 1, 'admin', '管理员', '/songList/info/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 490 条，数据如下：<br/>1、歌曲 SLEEPWALK 导入成功<br/>2、歌曲 フユノ(冬野) 导入成功<br/>3、歌曲 日常と地球の額縁 (日常和地球的画框) 导入成功<br/>4、歌曲 カラノワレモノ (空之碎物) 导入成功<br/>5、歌曲 さらってほしいの (希望你能把我带走) 导入成功<br/>6、歌曲 モノカラー (黑白色彩) 导入成功<br/>7、歌曲 RIVER FOG,CHOCOLATE BUTTERFLY 导入成功<br/>8、歌曲 NOTOK 导入成功<br/>9、歌曲 (W)HERE 导入成功<br/>10、歌曲 癖 导入成功<br/>11、歌曲 東京フラッシュ (东京闪景) 导入成功<br/>12、歌曲 napori 导入成功<br/>13、歌曲 踊り子 (舞女) 导入成功<br/>14、歌曲 灯火 导入成功<br/>15、歌曲 裸の勇者 (赤裸的勇士) 导入成功<br/>16、歌曲 僕は今日も (今天我也) 导入成功<br/>17、歌曲 不可幸力 导入成功<br/>18、歌曲 走馬灯 导入成功<br/>19、歌曲 恋風邪にのせて (患上恋爱感冒) 导入成功<br/>20、歌曲 怪獣の唄 导入成功<br/>21、歌曲 宮 导入成功<br/>22、歌曲 花占い (花瓣占卜) 导入成功<br/>23、歌曲 mabataki 导入成功<br/>24、歌曲 HERO 导入成功<br/>25、歌曲 風神 (日剧《狮子的藏身处》主题曲) 导入成功<br/>26、歌曲 常熱 导入成功<br/>27、歌曲 トドメの一撃 feat. Cory Wong 导入成功<br/>28、歌曲 GORILLA SHIBAI (猿芝居) 导入成功<br/>29、歌曲 逃避行 (逃避之旅) 导入成功<br/>30、歌曲 断面 (日剧《教祖之女》主题曲) 导入成功<br/>31、歌曲 王 导入成功<br/>32、歌曲 ダークルーム（暗室） 导入成功<br/>33、歌曲 ＆疾走 导入成功<br/>34、歌曲 呆然 导入成功<br/>35、歌曲 愛がすべて (爱即是一切 / All I need is love) 导入成功<br/>36、歌曲 ラブレス (LOVELESS/爱恋失格) 导入成功<br/>37、歌曲 天国 导入成功<br/>38、歌曲 芝居の終焉 (戏剧的尽头) 导入成功<br/>39、歌曲 寄り酔い (倚醉) 导入成功<br/>40、歌曲 ブラウニー (布朗尼 Brownie) 导入成功<br/>41、歌曲 イージーゲーム (Easy Game) 导入成功<br/>42、歌曲 The Fog 导入成功<br/>43、歌曲 ビーユアセルフ (做你自己 Be Yourself) 导入成功<br/>44、歌曲 進め！そっちだ！ (auお正月新CM) 导入成功<br/>45、歌曲 シュガーロス 导入成功<br/>46、歌曲 泡沫 导入成功<br/>47、歌曲 まだ浅はか (feat. 和ぬか) 导入成功<br/>48、歌曲 アイオクレ 导入成功<br/>49、歌曲 アミ (日剧《妖怪合租屋》主题曲) 导入成功<br/>50、歌曲 ラブの逃走 (爱意逃亡) 导入成功<br/>51、歌曲 ロックでキス 导入成功<br/>52、歌曲 真っ裸 导入成功<br/>53、歌曲 ミカヅキ (新月) 导入成功<br/>54、歌曲 フラレガイガール (被甩男女) 导入成功<br/>55、歌曲 光と闇 (光与暗) 导入成功<br/>56、歌曲 十億年 导入成功<br/>57、歌曲 さよーならあなた 导入成功<br/>58、歌曲 エメラルド 导入成功<br/>59、歌曲 かみつきたい 导入成功<br/>60、歌曲 アーケード (拱廊) 导入成功<br/>61、歌曲 朝になって夢からさめて 导入成功<br/>62、歌曲 祝日 导入成功<br/>63、歌曲 湯船 导入成功<br/>64、歌曲 あなたは煙草 私はシャボン(你是烟草 我是泡沫) 导入成功<br/>65、歌曲 水星 导入成功<br/>66、歌曲 サーカスナイト 导入成功<br/>67、歌曲 202 (New Mix) 导入成功<br/>68、歌曲 ルミネセンス 导入成功<br/>69、歌曲 はじめまして 导入成功<br/>70、歌曲 私の好きなもの (我喜欢的东西) 导入成功<br/>71、歌曲 わたしのうた 导入成功<br/>72、歌曲 笑い話 导入成功<br/>73、歌曲 サターン (土星) 导入成功<br/>74、歌曲 グラスとラムレーズン 导入成功<br/>75、歌曲 Ham 导入成功<br/>76、歌曲 君がいて水になる (有你', 0, NULL, '2026-03-05 21:33:11', 4729);
INSERT INTO `sys_oper_log` VALUES (173, '歌单显示列配置', 2, 'com.ruoyi.songList.controller.SongListController.saveShowColumns()', 'POST', 1, 'admin', '管理员', '/songList/info/saveShowColumns', '127.0.0.1', '内网IP', '[\"musicName\",\"singer\",\"language\",\"musicalStyle\"] ', '{\"msg\":\"显示列配置保存成功\",\"code\":200}', 0, NULL, '2026-03-07 22:04:27', 3529);
INSERT INTO `sys_oper_log` VALUES (174, '歌单显示列配置', 2, 'com.ruoyi.songList.controller.SongListController.saveShowColumns()', 'POST', 1, 'admin', '管理员', '/songList/info/saveShowColumns', '127.0.0.1', '内网IP', '[\"musicName\",\"singer\",\"language\",\"musicalStyle\",\"pay\",\"songSlice\",\"remark\"] ', '{\"msg\":\"显示列配置保存成功\",\"code\":200}', 0, NULL, '2026-03-08 19:37:17', 2737);
INSERT INTO `sys_oper_log` VALUES (175, '歌单显示列配置', 2, 'com.ruoyi.songList.controller.SongListController.saveShowColumns()', 'POST', 1, 'admin', '管理员', '/songList/info/saveShowColumns', '127.0.0.1', '内网IP', '[\"musicName\",\"singer\",\"language\",\"musicalStyle\",\"pay\",\"songSlice\",\"remark\"] ', '{\"msg\":\"显示列配置保存成功\",\"code\":200}', 0, NULL, '2026-03-08 19:43:43', 25);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2026-02-24 20:59:01', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2026-02-24 20:59:01', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2026-02-24 20:59:01', 'admin', '2026-03-04 14:08:21', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '超级管理员', '00', '18888888888@163.com', '18888888888', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-03-08 20:38:08', '2026-02-24 20:59:01', 'admin', '2026-02-24 20:59:01', '', '2026-03-04 15:04:30', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-03-04 14:08:43', '2026-02-24 20:59:01', 'admin', '2026-02-24 20:59:01', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
