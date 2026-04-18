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

 Date: 18/04/2026 10:18:48
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
-- Table structure for isshow_song_table_column
-- ----------------------------
DROP TABLE IF EXISTS `isshow_song_table_column`;
CREATE TABLE `isshow_song_table_column`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID（主键）',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `column` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示列集合',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of isshow_song_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for isshow_song_table_columns
-- ----------------------------
DROP TABLE IF EXISTS `isshow_song_table_columns`;
CREATE TABLE `isshow_song_table_columns`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `columns` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示列集合',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of isshow_song_table_columns
-- ----------------------------
INSERT INTO `isshow_song_table_columns` VALUES (1, 1, 'musicName,singer,language,musicalStyle,pay,songSlice,remark');
INSERT INTO `isshow_song_table_columns` VALUES (2, 3, 'musicName,singer,musicalStyle');

-- ----------------------------
-- Table structure for musical_style
-- ----------------------------
DROP TABLE IF EXISTS `musical_style`;
CREATE TABLE `musical_style`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dict_sort` int NULL DEFAULT NULL COMMENT '排序',
  `dict_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示标签',
  `dict_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '值',
  `dict_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of musical_style
-- ----------------------------
INSERT INTO `musical_style` VALUES (1, 1, '流行', '流行', 'common_category');
INSERT INTO `musical_style` VALUES (2, 2, '古风', '古风', 'common_category');
INSERT INTO `musical_style` VALUES (3, 3, '国风', '国风', 'common_category');
INSERT INTO `musical_style` VALUES (4, 4, 'ACG', 'ACG', 'common_category');
INSERT INTO `musical_style` VALUES (5, 5, 'V家', 'V家', 'common_category');
INSERT INTO `musical_style` VALUES (6, 6, '东方', '东方', 'common_category');
INSERT INTO `musical_style` VALUES (7, 7, '经典', '经典', 'common_category');
INSERT INTO `musical_style` VALUES (8, 8, '怀旧', '怀旧', 'common_category');
INSERT INTO `musical_style` VALUES (9, 9, '民谣', '民谣', 'common_category');
INSERT INTO `musical_style` VALUES (10, 10, '民族', '民族', 'common_category');
INSERT INTO `musical_style` VALUES (11, 11, '美声', '美声', 'common_category');
INSERT INTO `musical_style` VALUES (12, 12, '爵士', '爵士', 'common_category');
INSERT INTO `musical_style` VALUES (13, 13, '摇滚', '摇滚', 'common_category');
INSERT INTO `musical_style` VALUES (14, 14, '电子', '电子', 'common_category');
INSERT INTO `musical_style` VALUES (15, 15, '金属', '金属', 'common_category');
INSERT INTO `musical_style` VALUES (16, 16, '戏腔', '戏腔', 'common_category');
INSERT INTO `musical_style` VALUES (17, 17, 'RAP', 'RAP', 'common_category');
INSERT INTO `musical_style` VALUES (18, 18, '儿歌', '儿歌', 'common_category');
INSERT INTO `musical_style` VALUES (19, 19, '整活', '整活', 'common_category');
INSERT INTO `musical_style` VALUES (20, 20, '可爱', '可爱', 'common_category');
INSERT INTO `musical_style` VALUES (21, 21, '治愈', '治愈', 'common_category');
INSERT INTO `musical_style` VALUES (22, 22, '温柔', '温柔', 'common_category');
INSERT INTO `musical_style` VALUES (23, 23, '活泼', '活泼', 'common_category');
INSERT INTO `musical_style` VALUES (24, 24, '悲伤', '悲伤', 'common_category');
INSERT INTO `musical_style` VALUES (25, 25, '空灵', '空灵', 'common_category');
INSERT INTO `musical_style` VALUES (26, 26, '童年回忆', '童年回忆', 'common_category');
INSERT INTO `musical_style` VALUES (27, 27, 'OST', 'OST', 'common_category');
INSERT INTO `musical_style` VALUES (28, 28, '动漫', '动漫', 'common_category');
INSERT INTO `musical_style` VALUES (29, 29, '影视金曲', '影视金曲', 'common_category');
INSERT INTO `musical_style` VALUES (30, 30, '游戏', '游戏', 'common_category');
INSERT INTO `musical_style` VALUES (31, 31, '原创曲', '原创曲', 'common_category');
INSERT INTO `musical_style` VALUES (32, 32, '弹唱', '弹唱', 'common_category');
INSERT INTO `musical_style` VALUES (33, 33, '合唱', '合唱', 'common_category');
INSERT INTO `musical_style` VALUES (34, 34, '舞曲', '舞曲', 'common_category');
INSERT INTO `musical_style` VALUES (35, 35, '偶像', '偶像', 'common_category');
INSERT INTO `musical_style` VALUES (36, 36, '音乐剧', '音乐剧', 'common_category');
INSERT INTO `musical_style` VALUES (37, 37, '哥特', '哥特', 'common_category');
INSERT INTO `musical_style` VALUES (38, 38, '特摄', '特摄', 'common_category');
INSERT INTO `musical_style` VALUES (39, 39, '说唱', '说唱', 'common_category');
INSERT INTO `musical_style` VALUES (40, 40, '喊麦', '喊麦', 'common_category');
INSERT INTO `musical_style` VALUES (41, 41, '配音', '配音', 'common_category');
INSERT INTO `musical_style` VALUES (42, 42, '方言', '方言', 'common_category');
INSERT INTO `musical_style` VALUES (43, 43, '约德尔', '约德尔', 'common_category');
INSERT INTO `musical_style` VALUES (44, 44, '其他', '其他', 'common_category');
INSERT INTO `musical_style` VALUES (45, 1, '安静', '安静', 'sound_category');
INSERT INTO `musical_style` VALUES (46, 2, '适中', '适中', 'sound_category');
INSERT INTO `musical_style` VALUES (47, 3, '较吵', '较吵', 'sound_category');
INSERT INTO `musical_style` VALUES (48, 1, '高音', '高音', 'pitch_category');
INSERT INTO `musical_style` VALUES (49, 2, '中音', '中音', 'pitch_category');
INSERT INTO `musical_style` VALUES (50, 3, '低音', '低音', 'pitch_category');
INSERT INTO `musical_style` VALUES (51, 1, '小甜歌', '小甜歌', 'niche_category');
INSERT INTO `musical_style` VALUES (52, 2, '苦情歌', '苦情歌', 'niche_category');
INSERT INTO `musical_style` VALUES (53, 3, '推荐', '推荐', 'niche_category');
INSERT INTO `musical_style` VALUES (54, 4, '招牌', '招牌', 'niche_category');
INSERT INTO `musical_style` VALUES (55, 5, '小众', '小众', 'niche_category');
INSERT INTO `musical_style` VALUES (56, 1, 'Pop', 'Pop', 'qq_music_category');
INSERT INTO `musical_style` VALUES (57, 2, 'Classical', 'Classical', 'qq_music_category');
INSERT INTO `musical_style` VALUES (58, 3, 'Other', 'Other', 'qq_music_category');
INSERT INTO `musical_style` VALUES (59, 4, 'Children', 'Children', 'qq_music_category');
INSERT INTO `musical_style` VALUES (60, 5, 'Dance', 'Dance', 'qq_music_category');
INSERT INTO `musical_style` VALUES (61, 6, 'Easy Listening', 'Easy Listening', 'qq_music_category');
INSERT INTO `musical_style` VALUES (62, 7, 'Electronica', 'Electronica', 'qq_music_category');
INSERT INTO `musical_style` VALUES (63, 8, 'Folk', 'Folk', 'qq_music_category');
INSERT INTO `musical_style` VALUES (64, 9, 'R&B', 'R&B', 'qq_music_category');
INSERT INTO `musical_style` VALUES (65, 10, 'Rap/Hip Hop', 'Rap/Hip Hop', 'qq_music_category');
INSERT INTO `musical_style` VALUES (66, 11, 'Reggae', 'Reggae', 'qq_music_category');
INSERT INTO `musical_style` VALUES (67, 12, 'Rock', 'Rock', 'qq_music_category');
INSERT INTO `musical_style` VALUES (68, 13, 'Soundtrack', 'Soundtrack', 'qq_music_category');
INSERT INTO `musical_style` VALUES (69, 14, 'World Music', 'World Music', 'qq_music_category');
INSERT INTO `musical_style` VALUES (70, 15, 'Alternative', 'Alternative', 'qq_music_category');
INSERT INTO `musical_style` VALUES (71, 16, 'Animation', 'Animation', 'qq_music_category');
INSERT INTO `musical_style` VALUES (72, 17, 'Country', 'Country', 'qq_music_category');
INSERT INTO `musical_style` VALUES (73, 1, '请联系', '请联系', 'other_needs');
INSERT INTO `musical_style` VALUES (74, 2, '推送姬', '推送姬', 'other_needs');
INSERT INTO `musical_style` VALUES (75, 3, '添加', '添加', 'other_needs');

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
  `first_letter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '歌名首字母',
  `singer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '歌手',
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语言',
  `musical_style` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '曲风',
  `pay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付费',
  `exclusive_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大航海',
  `gift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '礼物',
  `song_slice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '歌切',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `uploader` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上传人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1946 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '歌单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of song_list
-- ----------------------------
INSERT INTO `song_list` VALUES (973, 'SLEEPWALK', 'S', 'ヒトリエ', '2', '', '30', '1', '{\"name\":\"重拳出击\",\"price\":\"19.9\",\"icon\":\"https://s1.hdslb.com/bfs/live/53eca0815f8e628bd619a27628b1acbd57fc82b4.png\",\"value\":25}', '1', '', '1');
INSERT INTO `song_list` VALUES (974, 'フユノ(冬野)', '#', 'ヒトリエ', '2', '', '', NULL, '{\"name\":\"重拳出击\",\"price\":\"19.9\",\"icon\":\"https://s1.hdslb.com/bfs/live/53eca0815f8e628bd619a27628b1acbd57fc82b4.png\",\"value\":25}', '', '', '1');
INSERT INTO `song_list` VALUES (975, '日常と地球の額縁 (日常和地球的画框)', 'R', 'ヒトリエ', '2', '', '30', '1', '{\"name\":\"重拳出击\",\"price\":\"19.9\",\"icon\":\"https://s1.hdslb.com/bfs/live/53eca0815f8e628bd619a27628b1acbd57fc82b4.png\",\"value\":25}', '', '', '1');
INSERT INTO `song_list` VALUES (976, 'カラノワレモノ (空之碎物)', '#', 'ヒトリエ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (977, 'さらってほしいの (希望你能把我带走)', '#', 'ヒトリエ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (978, 'モノカラー (黑白色彩)', '#', 'ヒトリエ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (979, 'RIVER FOG,CHOCOLATE BUTTERFLY', 'R', 'ヒトリエ', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (980, 'NOTOK', 'N', 'ヒトリエ', '2', '', '', '3', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (981, '(W)HERE', '#', 'ヒトリエ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (982, '癖', 'P', 'ヒトリエ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (983, '東京フラッシュ (东京闪景)', 'D', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (984, 'napori', 'N', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (985, '踊り子 (舞女)', 'Y', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (986, '灯火', 'D', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (987, '裸の勇者 (赤裸的勇士)', 'L', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (988, '僕は今日も (今天我也)', 'P', 'Vaundy', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (989, '不可幸力', 'B', 'Vaundy', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (990, '走馬灯', 'Z', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (991, '恋風邪にのせて (患上恋爱感冒)', 'L', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (992, '怪獣の唄', 'G', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (993, '宮', 'G', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (994, '花占い (花瓣占卜)', 'H', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (995, 'mabataki', 'M', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (996, 'HERO', 'H', 'Vaundy', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (997, '風神 (日剧《狮子的藏身处》主题曲)', 'F', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (998, '常熱', 'C', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (999, 'トドメの一撃 feat. Cory Wong', '#', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1000, 'GORILLA SHIBAI (猿芝居)', 'G', 'Vaundy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1001, '逃避行 (逃避之旅)', 'T', 'Dios', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1002, '断面 (日剧《教祖之女》主题曲)', 'D', 'Dios', '2', '', '', '2', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1003, '王', 'W', 'Dios', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1004, 'ダークルーム（暗室）', '#', 'Dios', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1005, '＆疾走', '#', 'Dios', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1006, '呆然', 'D', 'Dios', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1007, '愛がすべて (爱即是一切 / All I need is love)', 'A', 'Dios', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1008, 'ラブレス (LOVELESS/爱恋失格)', '#', 'Dios', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1009, '天国', 'T', 'Dios', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1010, '芝居の終焉 (戏剧的尽头)', 'Z', 'Dios', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1011, '寄り酔い (倚醉)', 'J', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1012, 'ブラウニー (布朗尼 Brownie)', '#', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1013, 'イージーゲーム (Easy Game)', '#', '和ぬか', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1014, 'The Fog', 'T', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1015, 'ビーユアセルフ (做你自己 Be Yourself)', '#', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1016, '進め！そっちだ！ (auお正月新CM)', 'J', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1017, 'シュガーロス', '#', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1018, '泡沫', 'P', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1019, 'まだ浅はか (feat. 和ぬか)', '#', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1020, 'アイオクレ', '#', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1021, 'アミ (日剧《妖怪合租屋》主题曲)', '#', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1022, 'ラブの逃走 (爱意逃亡)', '#', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1023, 'ロックでキス', '#', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1024, '真っ裸', 'Z', '和ぬか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1025, 'ミカヅキ (新月)', '#', 'さユリ', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1026, 'フラレガイガール (被甩男女)', '#', 'さユリ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1027, '光と闇 (光与暗)', 'G', 'さユリ', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1028, '十億年', 'S', 'さユリ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1029, 'さよーならあなた', '#', 'カネコアヤノ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1030, 'エメラルド', '#', 'カネコアヤノ', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1031, 'かみつきたい', '#', 'カネコアヤノ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1032, 'アーケード (拱廊)', '#', 'カネコアヤノ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1033, '朝になって夢からさめて', 'C', 'カネコアヤノ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1034, '祝日', 'Z', 'カネコアヤノ', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1035, '湯船', 'T', 'カネコアヤノ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1036, 'あなたは煙草 私はシャボン(你是烟草 我是泡沫)', '#', 'ラブリーサマーちゃん', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1037, '水星', 'S', 'ラブリーサマーちゃん', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1038, 'サーカスナイト', '#', 'ラブリーサマーちゃん', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1039, '202 (New Mix)', '#', 'ラブリーサマーちゃん', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1040, 'ルミネセンス', '#', 'ラブリーサマーちゃん', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1041, 'はじめまして', '#', 'ラブリーサマーちゃん', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1042, '私の好きなもの (我喜欢的东西)', 'S', 'ラブリーサマーちゃん', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1043, 'わたしのうた', '#', 'ラブリーサマーちゃん', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1044, '笑い話', 'X', 'ラブリーサマーちゃん', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1045, 'サターン (土星)', '#', 'ずっと真夜中でいいのに', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1046, 'グラスとラムレーズン', '#', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1047, 'Ham', 'H', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1048, '君がいて水になる (有你在即可化成水)', 'J', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1049, 'またね幻 (再会，幻)', '#', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1050, 'ばかじゃないのに (虚心若愚)', '#', 'ずっと真夜中でいいのに', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1051, 'Dear Mr 「F」 (亲爱的F先生)', 'D', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1052, '正義', 'Z', 'ずっと真夜中でいいのに', '2', '', '', '2', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1053, '秒針を噛む（咬住秒针）', 'M', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1054, '消えてしまいそうです', 'X', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1055, '残機', 'C', 'ずっと真夜中でいいのに', '2', '', '', '2', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1056, 'お勉強しといてよ (得好好学习喔)', '#', 'ずっと真夜中でいいのに', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1057, '雲丹と栗', 'Y', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1058, '深昏睡', 'S', '春野', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1059, 'nuit', 'N', '春野', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1060, 'Venus Flytrap feat. 佐藤千亜妃', 'V', '春野', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1061, '私怨', 'S', '春野', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1062, 'I\'m In Love', 'I', '春野', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1063, 'can\'t be waiting anymore?', 'C', '春野', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1064, 'Buddha', 'B', '春野', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1065, 'スコール (疾风骤雨)', '#', '春野', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1066, 'YOU & IDOL', 'Y', '相対性理論(やくしまるえつこ)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1067, '地獄先生', 'D', '相対性理論(やくしまるえつこ)', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1068, 'わたしは人類 (我是人类)', '#', '相対性理論(やくしまるえつこ)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1069, 'sky riders(vo+pf)', 'S', '相対性理論(やくしまるえつこ)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1070, 'バーモント・キス (佛蒙特之吻)', '#', '相対性理論(やくしまるえつこ)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1071, '(恋は) 百年戦争', '#', '相対性理論(やくしまるえつこ)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1072, 'ムーンライト銀河', '#', '相対性理論(やくしまるえつこ)', NULL, '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1073, 'cry', 'C', '日向文', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1074, '落下(いっぱつにゅうこんver.)', 'L', '日向文', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1075, '波よ、君の頬を', 'B', '日向文', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1076, 'リナリア', '#', '日向文', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1077, 'ライバー', '#', '日向文', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1078, '秘密', 'M', '日向文', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1079, 'だから僕は音楽を辞めた（所以我放弃了音乐）', '#', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1080, '春泥棒', 'C', 'ヨルシカ／n-buna', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1081, '嘘月', 'X', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1082, '第一夜', 'D', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1083, '夜明けと蛍', 'Y', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1084, 'アルジャーノン', '#', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1085, 'ヒッチコック', '#', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1086, '晴る', 'Q', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1087, '忘れてください', 'W', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1088, '修羅', 'X', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1089, '月に吠える', 'Y', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1090, '歌舞伎町の女王', 'G', '椎名林檎', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1091, '丸ノ内サディスティック', 'W', '椎名林檎', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1092, '人生は夢だらけ', 'R', '椎名林檎', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1093, '眩暈', 'X', '椎名林檎', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1094, '愛妻家の朝食', 'A', '椎名林檎', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1095, 'ドリームレス・ドリームス (无梦之梦)', '#', 'はるまきごはん(春卷饭)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1096, '第三の心臓', 'D', 'はるまきごはん(春卷饭)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1097, '雨子', 'Y', 'はるまきごはん(春卷饭)', '2', '', '', '2', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1098, '僕は可憐な少女にはなれない (我无法成为凛然少女)', 'P', 'はるまきごはん(春卷饭)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1099, '人間だった (曾生为人)', 'R', 'picon', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1100, '水葬', 'S', 'おいしくるメロンパン', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1101, '亡き王女のための水域 (悼念公主的水域)', 'W', 'おいしくるメロンパン', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1102, '色水 (彩色水)', 'S', 'おいしくるメロンパン', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1103, '瞬き', 'S', 'back number', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1104, 'クリスマスソング', '#', 'back number', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1105, '笑顔', 'X', 'back number', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1106, '花束', 'H', 'back number', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1107, '風の強い日', 'F', 'back number', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1108, '僕の名前を', 'P', 'back number', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1109, 'カワキヲアメク (声嘶力竭)', '#', '美波', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1110, 'アメヲマツ、 (等雨)', '#', '美波', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1111, 'ETERNAL BLUE', 'E', '美波', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1112, '花', 'H', '藤井風', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1113, '満ちてゆく', 'M', '藤井風', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1114, '死ぬのがいいわ (不如死去)', 'S', '藤井風', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1115, 'きらり (闪耀)', '#', '藤井風', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1116, 'ガーデン (花园)', '#', '藤井風', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1117, '真っ白', 'Z', '藤井風', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1118, '怪物 (TV动画《BEASTARS》第二季片头曲)', 'G', 'YOASOBI', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1119, '群青', 'Q', 'YOASOBI', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1120, 'たぶん', '#', 'YOASOBI', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1121, '祝福', 'Z', 'YOASOBI', '2', '', '', '2', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1122, '好きだから。 (因为喜欢你。)', 'H', '『ユイカ』', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1123, '恋音と雨空 (恋歌与沥雨)', 'L', 'AAA', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1124, '永遠のあくる日 (永远的翌日)', 'Y', 'Ado', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1125, '逆光', 'N', 'Ado', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1126, 'Value', 'V', 'Ado', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1127, '蝸旋(feat. Ado)', 'G', 'Ado', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1128, 'カブトムシ', '#', 'aiko', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1129, 'カタオモイ (单相思)', '#', 'Aimer', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1130, 'あの夏で待ってる(在那个夏日等待)', '#', 'cadode', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1131, '青春にして已む(青春已逝)', 'Q', 'Cö shu Nie', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1132, 'ロングスカートは靡いて', '#', 'Conton Candy', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1133, '猫', 'M', 'DISH//', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1134, 'モディファイ(修复)', '#', 'Doctrine Doctrine', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1135, '夜に浮かぶ(浮于夜色)', 'Y', 'Haruna', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1136, '可愛くてごめん', 'K', 'HoneyWorks/早見沙織', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1137, '飛行艇 (飞艇)', 'F', 'King Gnu', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1138, '白日', 'B', 'King Gnu', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1139, 'Prayer X', 'P', 'King Gnu', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1140, '呼吸', 'H', 'kyooo', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1141, '心做し', 'X', 'majiko', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1142, 'Anytime Anywhere (TV动画《葬送的芙莉莲》片尾曲)', 'A', 'milet', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1143, '春愁', 'C', 'Mrs. GREEN APPLE', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1144, 'Tell Me Baby', 'T', 'Mrs. GREEN APPLE', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1145, 'ヒマワリが咲く予定(向日葵将绽放)', '#', 'Nakamura Emi', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1146, 'チクッ', '#', 'Nakamura Emi', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1147, 'l', 'L', 'Nakamura Emi', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1148, '愛にできることはまだあるかい', 'A', 'RADWIMPS', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1149, 'なんでもないや', '#', 'RADWIMPS', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1150, 'めめしぃ (优柔寡断)', '#', 'RADWIMPS', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1151, 'me me she', 'M', 'RADWIMPS', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1152, 'すずめ feat.十明', '#', 'RADWIMPS/十明', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1153, '雨に唄えば(对雨高歌)', 'Y', 'ReoNa', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1154, 'シンデレラボーイ(灰姑娘男孩)', '#', 'Saucy Dog', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1155, 'いつか', '#', 'Saucy Dog', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1156, 'またおいで(请再来吧)', '#', 'South&/可不', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1157, '化作青烟(さくらひらり)', 'H', 'TOMO', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1158, '別の人の彼女になったよ', 'B', 'wacci', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1159, 'ルナ', '#', 'waka', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1160, '分かってないよ', 'F', 'WurtS', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1161, 'Oz. (TV动画《国王排名》片尾曲)', 'O', 'yama', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1162, 'again', 'A', 'YUI', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1163, 'Why me', 'W', 'YUI', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1164, '10月無口な君を忘れる (忘却十月沈默的你)', '#', 'あたらよ', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1165, '夏霞', 'X', 'あたらよ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1166, '8.8', '#', 'あたらよ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1167, 'x分の１', 'X', 'ウソツキ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1168, '琥珀色の街、上海蟹の朝', 'H', 'くるり', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1169, 'たばこ', '#', 'コレサワ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1170, '新宝島', 'X', 'サカナクション', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1171, '愛ゆえに', 'A', 'さとうもか', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1172, 'ランデヴー', '#', 'シャイトープ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1173, 'ロビンソン', '#', 'スピッツ(spitz)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1174, 'Midnight Call', 'M', 'ぜったくん/kojikoji', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1175, 'I wanna kill you', 'I', 'たかやん', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1176, '玩具(Toy)', 'W', 'たかやん', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1177, '貴方の恋人になりたい(想成为你的恋人)', 'G', 'チョーキューメイ', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1178, '君がいればいい', 'J', 'つじあやの', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1179, '誰にもなれない私だから (正因为是无法成为他人的我）', 'S', 'トゲナシトゲアリ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1180, '空の箱', 'K', 'トゲナシトゲアリ', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1181, '紡ぐ(织心)', 'F', 'とた', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1182, 'Overdose', 'O', 'なとり', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1183, '夜の歯車', 'Y', 'なとり', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1184, 'ヘビースモーク(heavy smoke)', '#', 'にしな(nishina)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1185, '誰にだって訳がある(人人都有缘由)', 'S', 'ハルレオ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1186, '火炎', 'H', '女王蜂', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1187, 'さがしもの(寻找的东西)', '#', 'ハンバート ハンバート', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1188, '悪魔の子 (恶魔之子)', 'E', 'ヒグチアイ', '2', '', '', '2', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1189, 'なんでもないよ、(没什么大不了)', '#', 'マカロニえんぴつ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1190, 'それを愛と呼ぶだけ', '#', 'まふまふ(mafumafu)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1191, '鏡花水月', 'J', 'まふまふ(mafumafu)', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1192, 'プリーズ', '#', 'メガテラ・ゼロ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1193, '私じゃなかったんだね (并非是我)', 'S', 'りりあ。', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1194, '失恋ソング沢山聴いて 泣いてばかりの私はもう.', 'S', 'りりあ。', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1195, 'ロミオとシンデレラ', '#', '初音ミク/doriko', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1196, 'クエスチョン', '#', '初音ミク/john', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1197, '回る空うさぎ', 'H', '初音ミク/Orangestar', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1198, 'メルト(melt)', '#', '初音ミク/supercell', '2', '', '', '2', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1199, '福寿草', 'F', '初音ミク/ぐにょ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1200, 'パズルガール(拼图女孩)', '#', '初音ミク/とあ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1201, '小夜子', 'X', '初音ミク/みきとP', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1202, '僕は依存症feat. みきとP (我是依存症)', 'P', '初音ミク/みきとP', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1203, '奈落', 'N', '初音ミク/みきとP', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1204, 'さようなら、花泥棒さん(再见了，盗花人)', '#', '初音ミク/メル', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1205, '魔法の絨毯 (魔法毯)', 'M', '川崎鷹也', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1206, '君の為のキミノウタ', 'J', '川崎鷹也', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1207, 'れぞんでーとる(Raison d\'etre)', '#', '存流', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1208, '味覚', 'W', '淡甘', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1209, 'ハルノ寂寞 (春日寂寞)', '#', '稲葉曇', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1210, '落日', 'L', '東京事変', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1211, '睡魔', 'S', '缶缶/Ayase', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1212, 'ド屑', '#', '歌愛ユキ/なきそ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1213, '強風オールバック', 'Q', '歌愛ユキ/ゆこぴ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1214, 'そして花になる', '#', '花譜', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1215, 'わたしの線香', '#', '花譜', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1216, 'ギターと孤独と蒼い惑星', '#', '結束バンド', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1217, 'ひとり旅(独自旅行)', '#', '瀬名航/鎖那', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1218, 'ソラゴト(Fake)', '#', '明透', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1219, '夕立', 'X', '日食なつこ', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1220, 'yellow', 'Y', '神山羊', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1221, '彼女は旅に出る (她踏上了旅途)', 'B', '鎖那', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1222, '紅い呪い(鲜红诅咒)', 'H', '吐息/aruma', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1223, 'ビビデバ(星彗闪耀)', '#', '星街すいせい', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1224, '月の明り', 'Y', '伊田恵美', NULL, '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1225, 'ダーリン', '#', '須田景凪', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1226, 'ダイビング', '#', '岩見拓馬', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1227, '月が綺麗', 'Y', '岩見拓馬', '2', '', '', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1228, '1999', '#', '羊文学', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1229, 'fake face dance music', 'F', '音田雅則', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1230, '香水', 'X', '瑛人', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1231, 'ドライフラワー', '#', '優里', '2', '', '30', '1', NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1232, '阿吽のビーツ', 'A', '羽生迷子/v flower', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1233, '好きな人がいること(有喜欢的人)', 'H', '知英', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1234, '糸(线)', 'M', '中島みゆき', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1235, 'S.S.S.', 'S', '佐藤千亜妃', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1236, 'ハルノユキ', '#', 'リリィ、さよなら。', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1237, '今晩はお月さん', 'J', 'ハンバート ハンバート', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1238, '星屑ビーナス', 'X', 'Aimer', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1239, '别问很可怕', 'B', 'J. Sheon', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1240, 'Melody Remix', 'M', '未知', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1241, '大鱼', 'D', '周深', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1242, '不要说话', 'B', '陈奕迅', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1243, '成全', 'C', '林宥嘉', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1244, '梦回还', 'M', '呦猫UNEKO', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1245, '谓风', 'W', '双笙/流仙', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1246, '四重罪孽', 'S', '洛天依/乐正绫/言和/DELA', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1247, '是风动', 'S', '银临/河图', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1248, '六重不忠', 'L', '洛天依/乐正绫/言和/DELA', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1249, '东京不太热', 'D', '洛天依/Z新豪', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1250, '不朽之罪', 'B', '双笙/玄觞', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1251, '幹物女(干物女)', 'G', '洛天依/Z新豪', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1252, '百鬼阴阳抄-柔情版', 'B', '银临/Aki阿杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1253, '权御天下', 'Q', '洛天依等', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1254, '桃花笑', 'T', '洛天依/乐正绫/言和', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1255, '恋人', 'L', '刘嘉星', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1256, '这条小鱼在乎', 'Z', '王OK/洪佩瑜', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1257, '听夜雨', 'T', '礼越', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1258, '珠玉', 'Z', '单依纯', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1259, '爱情讯息', 'A', '郭静', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1260, '她说', 'T', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1261, '愿与愁', 'Y', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1262, '床', 'C', '草东没有派对', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1263, '喜欢', 'X', '张悬', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1264, '爱人错过', 'A', '告五人', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1265, 'Time Machine', 'T', 'mj apanay ft. aren park', '3', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1266, '有何不可', 'Y', '许嵩', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1267, '稻香', 'D', '周杰伦', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1268, '龙卷风', 'L', '周杰伦', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1269, '夏天的风', 'X', '温岚', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1270, '晚婚', 'W', '李宗盛', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1271, '太聪明', 'T', '陈绮贞', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1272, '小半', 'X', '陈粒', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1273, '走马', 'Z', '陈粒', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1274, '奇妙能力歌', 'Q', '陈粒', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1275, '虚拟', 'X', '陈粒', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1276, '易燃易爆炸', 'Y', '陈粒', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1277, '绝对占有 相对自由', 'J', '陈粒', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1278, '可惜没如果', 'K', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1279, '背对背拥抱', 'B', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1280, '修炼爱情', 'X', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1281, '心墙', 'X', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1282, '曹操', 'C', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1283, '小酒窝', 'X', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1284, '关键词', 'G', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1285, '黑夜问白天', 'H', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1286, '不潮不用花钱', 'B', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1287, '新地球', 'X', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1288, '花海', 'H', '周杰伦', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1289, '唯一', 'W', '告五人', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1290, '最长的电影', 'Z', '周杰伦', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1291, '别找我麻烦', 'B', '蔡健雅', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1292, '采茶纪', 'C', '双笙', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1293, '第三人称', 'D', 'Hush', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1294, '晴天', 'Q', '周杰伦', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1295, '体面', 'T', '于文文', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1296, '笑', 'X', '太一', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1297, '至少还有你', 'Z', '林忆莲', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1298, '啷个哩个啷', 'L', '鹏泊', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1299, '偏爱', 'P', '张芸京', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1300, '男孩', 'N', '梁博', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1301, '童话镇', 'T', '暗杠', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1302, '谁', 'S', '廖俊涛', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1303, 'Tired', 'T', 'vietra', '3', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1304, '孤勇者', 'G', '陈奕迅', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1305, '爱如潮水', 'A', '张信哲', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1306, '年轮', 'N', '汪苏泷', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1307, '东西', 'D', '林俊呈', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1308, '白羊', 'B', '徐秉龙', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1309, '陷阱', 'X', '王北车', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1310, '一笑倾城', 'Y', '汪苏泷', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1311, '好想爱这个世界啊', 'H', '华晨宇', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1312, '童年', 'T', '罗大佑', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1313, '下个路口见', 'X', '李宇春', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1314, '说爱你', 'S', '蔡依林', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1315, '我的歌声里', 'W', '曲婉婷', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1316, '素颜', 'S', '许嵩', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1317, '故梦', 'G', '橙翼', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1318, '鬼', 'G', '草东没有派对', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1319, '梦的光点', 'M', '王心凌', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1320, '红马', 'H', '许蓝心', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1321, '突然好想你', 'T', '五月天', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1322, '光年之外', 'G', '邓紫棋', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1323, '难生恨', 'N', 'DAWN', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1324, '消愁', 'X', '毛不易', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1325, '暗号', 'A', '周杰伦', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1326, '快乐的扑满', 'K', '邵丽棠', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1327, 'FLY ME TO THE MOON', 'F', 'OLIVIA ONG', '3', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1328, '第三十八年夏至', 'D', '河图', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1329, '当', 'D', '动力火车', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1330, '隐形的翅膀', 'Y', '张韶涵', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1331, '不染', 'B', '毛不易', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1332, '彩虹的微笑', 'C', '王心凌', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1333, '时间煮雨', 'S', '郁可唯', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1334, '静悄悄', 'J', '陈泫孝', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1335, '匆匆那年', 'C', '王菲', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1336, '空空如也', 'K', '任然', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1337, '飞机场', 'F', '徐良/小凌', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1338, '如果这就是爱情', 'R', '张靓颖', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1339, '欧若拉', 'O', '张韶涵', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1340, '想想念念', 'X', 'FAFA/雪二', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1341, '天地缓缓', 'T', '伦桑', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1342, '喜欢你', 'X', '陈洁仪', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1343, '下雨天', 'X', '南拳妈妈', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1344, '客官不可以', 'K', '徐良/小凌', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1345, '绿色', 'L', '陈雪凝', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1346, '世界上的另一个我', 'S', '阿肆 / 郭采洁', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1347, '快乐星猫', 'K', '牛奶咖啡', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1348, '参商', 'C', '不才', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1349, '告白气球', 'G', '周杰伦', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1350, '50 Feet', '#', 'SoMo', '3', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1351, '梁山伯与朱丽叶', 'L', '曹格/卓文萱', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1352, '菲菲', 'F', '沈以诚', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1353, '身骑白马', 'S', '徐佳莹', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1354, '吹灭小山河', 'C', '国风堂/司南', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1355, '小宇', 'X', '蓝心羽', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1356, '自作多情', 'Z', '本兮', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1357, '凄美地', 'Q', '郭顶', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1358, '雨爱', 'Y', '杨丞琳', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1359, '七里香', 'Q', '周杰伦', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1360, '悬溺', 'X', '葛东琪', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1361, '情花', 'Q', '本兮', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1362, '烟雨行舟', 'Y', '伦桑', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1363, '小幸运', 'X', '田馥甄', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1364, '若把你', 'R', 'Kirsty刘瑾睿', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1365, '无语', 'W', '本兮', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1366, '战放', 'Z', '本兮', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1367, '画', 'H', '邓紫棋', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1368, '狐言', 'H', '河图 / 洛天依', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1369, '赤伶', 'C', 'HITA', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1370, '失眠飞行', 'S', '沈以诚', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1371, '红色高跟鞋', 'H', '蔡健雅', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1372, '烟花易冷', 'Y', '周杰伦', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1373, '霜雪千年', 'S', '洛天依/乐正绫', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1374, '载我回家', 'Z', '陈珊妮', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1375, '保留', 'B', '郭顶', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1376, '有心无意', 'Y', '本兮', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1377, '出山', 'C', '花粥', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1378, '大风吹', 'D', '草东没有派对', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1379, '形容', 'X', '沈以诚', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1380, '可乐', 'K', '赵紫骅', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1381, '左肩', 'Z', '安苏羽', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1382, '我好想你', 'W', '苏打绿', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1383, '水星记', 'S', '郭顶', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1384, '年少有为', 'N', '李荣浩', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1385, 'R.', 'R', '李子豪(HtFR)/大喜', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1386, '爱你', 'A', '王心凌', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1387, '九九八十一', 'J', '洛天依/乐正绫', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1388, '椿', 'C', '沈以诚', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1389, '夜车', 'Y', '曾轶可', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1390, '红昭愿', 'H', '音阙诗听', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1391, '红尘客栈', 'H', '周杰伦', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1392, '蒲公英的约定', 'P', '周杰伦', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1393, '时间飞行', 'S', '白宇/朱一龙', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1394, '醒着醉', 'X', '马良', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1395, '九张机', 'J', '叶炫清', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1396, '说谎', 'S', '林宥嘉', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1397, '浮生未歇', 'F', '音频怪物／双笙', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1398, '撒野', 'S', '凯瑟喵', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1399, '我的一个道姑朋友', 'W', '以冬', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1400, '浪费', 'L', '林宥嘉', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1401, '棠梨煎雪', 'T', '银临', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1402, '后来的我们', 'H', '五月天', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1403, '宝贝', 'B', '张悬', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1404, '好想你', 'H', '朱主爱', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1405, '倾尽天下', 'Q', '河图', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1406, '隐', 'Y', '河图', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1407, '如花', 'R', '河图', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1408, '狂野想乡', 'K', '西瓜JUN', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1409, '丹青客', 'D', 'HITA/小曲儿', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1410, '写给我第一个喜欢的女孩的歌', 'X', '洛天依', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1411, '恶魔的爱', 'E', '李宏毅/李明霖', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1412, '白石溪', 'B', '洛天依/乐正绫', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1413, '锦鲤抄', 'J', '银临/云之泣', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1414, '圈圈点点圈圈点点圈圈点点', 'Q', '洛天依', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1415, '直觉', 'Z', '赵方婧', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1416, '迷人的危险', 'M', 'Dance Flow', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1417, 'The Star', 'T', '李佳思', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1418, '恶作剧', 'E', '王蓝菌', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1419, '新九九八十一', 'X', '泠鸢', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1420, '凉城', 'L', '任然', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1421, '那年', 'N', '任然', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1422, '杀手', 'S', '林俊杰', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1423, '孙尚香', 'S', '洛天依/乐正绫/空气凝', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1424, '归零', 'G', '小曲儿', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1425, '水仙', 'S', '王心凌', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1426, '落霞云归', 'L', '慕寒', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1427, '你就不要想起我', 'N', '田馥甄', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1428, '腐草为萤', 'F', '银临', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1429, '越来越不懂', 'Y', '蔡健雅', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1430, '忆江南', 'Y', '五音JW', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1431, '失落沙洲', 'S', '徐佳莹', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1432, '只要平凡', 'Z', '张杰/张碧晨', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1433, '暗淡的是你曾温柔的小动作', 'A', '太一', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1434, '很久很久', 'H', '杨和苏', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1435, '心如止水', 'X', 'Ice Paper', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1436, '太久', 'T', '刘思鉴/桃德李Todd Li', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1437, '当爱已成往事', 'D', '林忆莲/李宗盛', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1438, '勘ぐれい', 'K', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1439, '薄れる', 'B', 'rinri/裏命', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1440, 'プロポーズ', '#', 'なとり', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1441, 'オノマトペ', '#', '羽生まゐご/りりあ。', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1442, 'Aliens', 'A', 'KIRINJI', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1443, 'ヒスイ', '#', 'nonoc', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1444, '月 feat. ヰ世界情緒', 'Y', 'Guiano/ヰ世界情緒', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1445, '寝言は寝て言え', 'Q', '月ノ美兎', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1446, '君のヒーロー', 'J', '十明', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1447, 'Bunny Girl', 'B', 'AKASAKI', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1448, 'マジか！', '#', '梓川', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1449, 'フィナーレ（终曲）', '#', 'eill', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1450, 'JANE DOE', 'J', '宇多田光/米津玄师', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1451, '死別', 'S', 'シャノン', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1452, '雨き声残響', 'Y', '初音ミク/Orangestar', '2', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1453, '幻彩国', 'H', '双笙', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1454, '食虫植物', 'S', NULL, NULL, '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1455, '我怀念的', 'W', '孙燕姿', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1456, '下等马', 'X', '洛天依Official/ChiliChill', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1457, '普通朋友', 'P', '陶喆', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1458, '几分之几', 'J', '卢广仲', '1', '', '', NULL, NULL, '', '', '1');
INSERT INTO `song_list` VALUES (1459, 'SLEEPWALK', 'S', 'ヒトリエ', '2', '[[\"common_category\",\"流行\"],[\"common_category\",\"古风\"],[\"common_category\",\"国风\"],[\"common_category\",\"ACG\"],[\"common_category\",\"V家\"],[\"common_category\",\"东方\"],[\"common_category\",\"经典\"],[\"common_category\",\"怀旧\"],[\"common_category\",\"民谣\"],[\"common_category\",\"民族\"],[\"common_category\",\"美声\"],[\"common_category\",\"爵士\"],[\"common_category\",\"摇滚\"],[\"common_category\",\"电子\"],[\"common_category\",\"金属\"],[\"common_category\",\"戏腔\"],[\"common_category\",\"RAP\"],[\"common_category\",\"儿歌\"],[\"common_category\",\"整活\"],[\"common_category\",\"可爱\"],[\"common_category\",\"治愈\"],[\"common_category\",\"温柔\"],[\"common_category\",\"活泼\"],[\"common_category\",\"悲伤\"],[\"common_category\",\"空灵\"],[\"common_category\",\"童年回忆\"],[\"common_category\",\"OST\"],[\"common_category\",\"动漫\"],[\"common_category\",\"影视金曲\"],[\"common_category\",\"游戏\"],[\"common_category\",\"原创曲\"],[\"common_category\",\"弹唱\"],[\"common_category\",\"合唱\"],[\"common_category\",\"舞曲\"],[\"common_category\",\"偶像\"],[\"common_category\",\"音乐剧\"],[\"common_category\",\"哥特\"],[\"common_category\",\"特摄\"],[\"common_category\",\"说唱\"],[\"common_category\",\"喊麦\"],[\"common_category\",\"配音\"],[\"common_category\",\"方言\"],[\"common_category\",\"约德尔\"],[\"common_category\",\"其他\"]]', '30', '1', '{\"name\":\"重拳出击\",\"price\":\"19.9\",\"icon\":\"https://s1.hdslb.com/bfs/live/53eca0815f8e628bd619a27628b1acbd57fc82b4.png\"}', '1', '', '3');
INSERT INTO `song_list` VALUES (1460, 'フユノ(冬野)', '#', 'ヒトリエ', '2', '', '', NULL, '{\"id\":25,\"name\":\"重拳出击\",\"price\":\"19.9\",\"icon\":\"https://s1.hdslb.com/bfs/live/53eca0815f8e628bd619a27628b1acbd57fc82b4.png\"}', '', '', '3');
INSERT INTO `song_list` VALUES (1461, '日常と地球の額縁 (日常和地球的画框)', 'R', 'ヒトリエ', '2', '', '30', '1', '{\"id\":25,\"name\":\"重拳出击\",\"price\":\"19.9\",\"icon\":\"https://s1.hdslb.com/bfs/live/53eca0815f8e628bd619a27628b1acbd57fc82b4.png\"}', '', '', '3');
INSERT INTO `song_list` VALUES (1462, 'カラノワレモノ (空之碎物)', '#', 'ヒトリエ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1463, 'さらってほしいの (希望你能把我带走)', '#', 'ヒトリエ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1464, 'モノカラー (黑白色彩)', '#', 'ヒトリエ', '2', '[[\"pitch_category\",\"高音\"],[\"pitch_category\",\"中音\"],[\"pitch_category\",\"低音\"]]', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1465, 'RIVER FOG,CHOCOLATE BUTTERFLY', 'R', 'ヒトリエ', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1466, 'NOTOK', 'N', 'ヒトリエ', '2', '', '', '3', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1467, '(W)HERE', '#', 'ヒトリエ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1468, '癖', 'P', 'ヒトリエ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1469, '東京フラッシュ (东京闪景)', 'D', 'Vaundy', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1470, 'napori', 'N', 'Vaundy', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1471, '踊り子 (舞女)', 'Y', 'Vaundy', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1472, '灯火', 'D', 'Vaundy', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1473, '裸の勇者 (赤裸的勇士)', 'L', 'Vaundy', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1474, '僕は今日も (今天我也)', 'P', 'Vaundy', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1475, '不可幸力', 'B', 'Vaundy', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1476, '走馬灯', 'Z', 'Vaundy', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1477, '恋風邪にのせて (患上恋爱感冒)', 'L', 'Vaundy', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1478, '怪獣の唄', 'G', 'Vaundy', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1479, '宮', 'G', 'Vaundy', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1480, '花占い (花瓣占卜)', 'H', 'Vaundy', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1481, 'mabataki', 'M', 'Vaundy', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1482, 'HERO', 'H', 'Vaundy', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1483, '風神 (日剧《狮子的藏身处》主题曲)', 'F', 'Vaundy', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1484, '常熱', 'C', 'Vaundy', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1485, 'トドメの一撃 feat. Cory Wong', '#', 'Vaundy', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1486, 'GORILLA SHIBAI (猿芝居)', 'G', 'Vaundy', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1487, '逃避行 (逃避之旅)', 'T', 'Dios', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1488, '断面 (日剧《教祖之女》主题曲)', 'D', 'Dios', '2', '', '', '2', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1489, '王', 'W', 'Dios', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1490, 'ダークルーム（暗室）', '#', 'Dios', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1491, '＆疾走', '#', 'Dios', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1492, '呆然', 'D', 'Dios', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1493, '愛がすべて (爱即是一切 / All I need is love)', 'A', 'Dios', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1494, 'ラブレス (LOVELESS/爱恋失格)', '#', 'Dios', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1495, '天国', 'T', 'Dios', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1496, '芝居の終焉 (戏剧的尽头)', 'Z', 'Dios', '2', '', '', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1497, '寄り酔い (倚醉)', 'J', '和ぬか', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1498, 'ブラウニー (布朗尼 Brownie)', '#', '和ぬか', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1499, 'イージーゲーム (Easy Game)', '#', '和ぬか', '2', '', '', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1500, 'The Fog', 'T', '和ぬか', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1501, 'ビーユアセルフ (做你自己 Be Yourself)', '#', '和ぬか', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1502, '進め！そっちだ！ (auお正月新CM)', 'J', '和ぬか', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1503, 'シュガーロス', '#', '和ぬか', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1504, '泡沫', 'P', '和ぬか', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1505, 'まだ浅はか (feat. 和ぬか)', '#', '和ぬか', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1506, 'アイオクレ', '#', '和ぬか', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1507, 'アミ (日剧《妖怪合租屋》主题曲)', '#', '和ぬか', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1508, 'ラブの逃走 (爱意逃亡)', '#', '和ぬか', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1509, 'ロックでキス', '#', '和ぬか', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1510, '真っ裸', 'Z', '和ぬか', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1511, 'ミカヅキ (新月)', '#', 'さユリ', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1512, 'フラレガイガール (被甩男女)', '#', 'さユリ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1513, '光と闇 (光与暗)', 'G', 'さユリ', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1514, '十億年', 'S', 'さユリ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1515, 'さよーならあなた', '#', 'カネコアヤノ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1516, 'エメラルド', '#', 'カネコアヤノ', '2', '', '', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1517, 'かみつきたい', '#', 'カネコアヤノ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1518, 'アーケード (拱廊)', '#', 'カネコアヤノ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1519, '朝になって夢からさめて', 'C', 'カネコアヤノ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1520, '祝日', 'Z', 'カネコアヤノ', '2', '', '', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1521, '湯船', 'T', 'カネコアヤノ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1522, 'あなたは煙草 私はシャボン(你是烟草 我是泡沫)', '#', 'ラブリーサマーちゃん', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1523, '水星', 'S', 'ラブリーサマーちゃん', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1524, 'サーカスナイト', '#', 'ラブリーサマーちゃん', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1525, '202 (New Mix)', '#', 'ラブリーサマーちゃん', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1526, 'ルミネセンス', '#', 'ラブリーサマーちゃん', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1527, 'はじめまして', '#', 'ラブリーサマーちゃん', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1528, '私の好きなもの (我喜欢的东西)', 'S', 'ラブリーサマーちゃん', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1529, 'わたしのうた', '#', 'ラブリーサマーちゃん', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1530, '笑い話', 'X', 'ラブリーサマーちゃん', '2', '', '', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1531, 'サターン (土星)', '#', 'ずっと真夜中でいいのに', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1532, 'グラスとラムレーズン', '#', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1533, 'Ham', 'H', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1534, '君がいて水になる (有你在即可化成水)', 'J', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1535, 'またね幻 (再会，幻)', '#', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1536, 'ばかじゃないのに (虚心若愚)', '#', 'ずっと真夜中でいいのに', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1537, 'Dear Mr 「F」 (亲爱的F先生)', 'D', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1538, '正義', 'Z', 'ずっと真夜中でいいのに', '2', '', '', '2', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1539, '秒針を噛む（咬住秒针）', 'M', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1540, '消えてしまいそうです', 'X', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1541, '残機', 'C', 'ずっと真夜中でいいのに', '2', '', '', '2', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1542, 'お勉強しといてよ (得好好学习喔)', '#', 'ずっと真夜中でいいのに', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1543, '雲丹と栗', 'Y', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1544, '深昏睡', 'S', '春野', '2', '', '', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1545, 'nuit', 'N', '春野', '2', '', '', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1546, 'Venus Flytrap feat. 佐藤千亜妃', 'V', '春野', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1547, '私怨', 'S', '春野', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1548, 'I\'m In Love', 'I', '春野', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1549, 'can\'t be waiting anymore?', 'C', '春野', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1550, 'Buddha', 'B', '春野', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1551, 'スコール (疾风骤雨)', '#', '春野', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1552, 'YOU & IDOL', 'Y', '相対性理論(やくしまるえつこ)', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1553, '地獄先生', 'D', '相対性理論(やくしまるえつこ)', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1554, 'わたしは人類 (我是人类)', '#', '相対性理論(やくしまるえつこ)', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1555, 'sky riders(vo+pf)', 'S', '相対性理論(やくしまるえつこ)', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1556, 'バーモント・キス (佛蒙特之吻)', '#', '相対性理論(やくしまるえつこ)', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1557, '(恋は) 百年戦争', '#', '相対性理論(やくしまるえつこ)', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1558, 'ムーンライト銀河', '#', '相対性理論(やくしまるえつこ)', NULL, '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1559, 'cry', 'C', '日向文', '2', '', '', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1560, '落下(いっぱつにゅうこんver.)', 'L', '日向文', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1561, '波よ、君の頬を', 'B', '日向文', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1562, 'リナリア', '#', '日向文', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1563, 'ライバー', '#', '日向文', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1564, '秘密', 'M', '日向文', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1565, 'だから僕は音楽を辞めた（所以我放弃了音乐）', '#', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1566, '春泥棒', 'C', 'ヨルシカ／n-buna', '2', '', '', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1567, '嘘月', 'X', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1568, '第一夜', 'D', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1569, '夜明けと蛍', 'Y', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1570, 'アルジャーノン', '#', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1571, 'ヒッチコック', '#', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1572, '晴る', 'Q', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1573, '忘れてください', 'W', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1574, '修羅', 'X', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1575, '月に吠える', 'Y', 'ヨルシカ／n-buna', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1576, '歌舞伎町の女王', 'G', '椎名林檎', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1577, '丸ノ内サディスティック', 'W', '椎名林檎', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1578, '人生は夢だらけ', 'R', '椎名林檎', '2', '', '', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1579, '眩暈', 'X', '椎名林檎', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1580, '愛妻家の朝食', 'A', '椎名林檎', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1581, 'ドリームレス・ドリームス (无梦之梦)', '#', 'はるまきごはん(春卷饭)', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1582, '第三の心臓', 'D', 'はるまきごはん(春卷饭)', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1583, '雨子', 'Y', 'はるまきごはん(春卷饭)', '2', '', '', '2', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1584, '僕は可憐な少女にはなれない (我无法成为凛然少女)', 'P', 'はるまきごはん(春卷饭)', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1585, '人間だった (曾生为人)', 'R', 'picon', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1586, '水葬', 'S', 'おいしくるメロンパン', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1587, '亡き王女のための水域 (悼念公主的水域)', 'W', 'おいしくるメロンパン', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1588, '色水 (彩色水)', 'S', 'おいしくるメロンパン', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1589, '瞬き', 'S', 'back number', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1590, 'クリスマスソング', '#', 'back number', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1591, '笑顔', 'X', 'back number', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1592, '花束', 'H', 'back number', '2', '', '', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1593, '風の強い日', 'F', 'back number', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1594, '僕の名前を', 'P', 'back number', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1595, 'カワキヲアメク (声嘶力竭)', '#', '美波', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1596, 'アメヲマツ、 (等雨)', '#', '美波', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1597, 'ETERNAL BLUE', 'E', '美波', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1598, '花', 'H', '藤井風', '2', '', '', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1599, '満ちてゆく', 'M', '藤井風', '2', '', '', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1600, '死ぬのがいいわ (不如死去)', 'S', '藤井風', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1601, 'きらり (闪耀)', '#', '藤井風', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1602, 'ガーデン (花园)', '#', '藤井風', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1603, '真っ白', 'Z', '藤井風', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1604, '怪物 (TV动画《BEASTARS》第二季片头曲)', 'G', 'YOASOBI', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1605, '群青', 'Q', 'YOASOBI', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1606, 'たぶん', '#', 'YOASOBI', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1607, '祝福', 'Z', 'YOASOBI', '2', '', '', '2', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1608, '好きだから。 (因为喜欢你。)', 'H', '『ユイカ』', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1609, '恋音と雨空 (恋歌与沥雨)', 'L', 'AAA', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1610, '永遠のあくる日 (永远的翌日)', 'Y', 'Ado', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1611, '逆光', 'N', 'Ado', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1612, 'Value', 'V', 'Ado', '2', '', '', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1613, '蝸旋(feat. Ado)', 'G', 'Ado', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1614, 'カブトムシ', '#', 'aiko', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1615, 'カタオモイ (单相思)', '#', 'Aimer', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1616, 'あの夏で待ってる(在那个夏日等待)', '#', 'cadode', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1617, '青春にして已む(青春已逝)', 'Q', 'Cö shu Nie', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1618, 'ロングスカートは靡いて', '#', 'Conton Candy', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1619, '猫', 'M', 'DISH//', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1620, 'モディファイ(修复)', '#', 'Doctrine Doctrine', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1621, '夜に浮かぶ(浮于夜色)', 'Y', 'Haruna', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1622, '可愛くてごめん', 'K', 'HoneyWorks/早見沙織', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1623, '飛行艇 (飞艇)', 'F', 'King Gnu', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1624, '白日', 'B', 'King Gnu', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1625, 'Prayer X', 'P', 'King Gnu', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1626, '呼吸', 'H', 'kyooo', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1627, '心做し', 'X', 'majiko', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1628, 'Anytime Anywhere (TV动画《葬送的芙莉莲》片尾曲)', 'A', 'milet', '2', '', '', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1629, '春愁', 'C', 'Mrs. GREEN APPLE', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1630, 'Tell Me Baby', 'T', 'Mrs. GREEN APPLE', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1631, 'ヒマワリが咲く予定(向日葵将绽放)', '#', 'Nakamura Emi', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1632, 'チクッ', '#', 'Nakamura Emi', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1633, 'l', 'L', 'Nakamura Emi', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1634, '愛にできることはまだあるかい', 'A', 'RADWIMPS', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1635, 'なんでもないや', '#', 'RADWIMPS', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1636, 'めめしぃ (优柔寡断)', '#', 'RADWIMPS', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1637, 'me me she', 'M', 'RADWIMPS', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1638, 'すずめ feat.十明', '#', 'RADWIMPS/十明', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1639, '雨に唄えば(对雨高歌)', 'Y', 'ReoNa', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1640, 'シンデレラボーイ(灰姑娘男孩)', '#', 'Saucy Dog', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1641, 'いつか', '#', 'Saucy Dog', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1642, 'またおいで(请再来吧)', '#', 'South&/可不', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1643, '化作青烟(さくらひらり)', 'H', 'TOMO', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1644, '別の人の彼女になったよ', 'B', 'wacci', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1645, 'ルナ', '#', 'waka', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1646, '分かってないよ', 'F', 'WurtS', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1647, 'Oz. (TV动画《国王排名》片尾曲)', 'O', 'yama', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1648, 'again', 'A', 'YUI', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1649, 'Why me', 'W', 'YUI', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1650, '10月無口な君を忘れる (忘却十月沈默的你)', '#', 'あたらよ', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1651, '夏霞', 'X', 'あたらよ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1652, '8.8', '#', 'あたらよ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1653, 'x分の１', 'X', 'ウソツキ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1654, '琥珀色の街、上海蟹の朝', 'H', 'くるり', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1655, 'たばこ', '#', 'コレサワ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1656, '新宝島', 'X', 'サカナクション', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1657, '愛ゆえに', 'A', 'さとうもか', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1658, 'ランデヴー', '#', 'シャイトープ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1659, 'ロビンソン', '#', 'スピッツ(spitz)', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1660, 'Midnight Call', 'M', 'ぜったくん/kojikoji', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1661, 'I wanna kill you', 'I', 'たかやん', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1662, '玩具(Toy)', 'W', 'たかやん', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1663, '貴方の恋人になりたい(想成为你的恋人)', 'G', 'チョーキューメイ', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1664, '君がいればいい', 'J', 'つじあやの', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1665, '誰にもなれない私だから (正因为是无法成为他人的我）', 'S', 'トゲナシトゲアリ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1666, '空の箱', 'K', 'トゲナシトゲアリ', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1667, '紡ぐ(织心)', 'F', 'とた', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1668, 'Overdose', 'O', 'なとり', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1669, '夜の歯車', 'Y', 'なとり', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1670, 'ヘビースモーク(heavy smoke)', '#', 'にしな(nishina)', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1671, '誰にだって訳がある(人人都有缘由)', 'S', 'ハルレオ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1672, '火炎', 'H', '女王蜂', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1673, 'さがしもの(寻找的东西)', '#', 'ハンバート ハンバート', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1674, '悪魔の子 (恶魔之子)', 'E', 'ヒグチアイ', '2', '', '', '2', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1675, 'なんでもないよ、(没什么大不了)', '#', 'マカロニえんぴつ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1676, 'それを愛と呼ぶだけ', '#', 'まふまふ(mafumafu)', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1677, '鏡花水月', 'J', 'まふまふ(mafumafu)', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1678, 'プリーズ', '#', 'メガテラ・ゼロ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1679, '私じゃなかったんだね (并非是我)', 'S', 'りりあ。', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1680, '失恋ソング沢山聴いて 泣いてばかりの私はもう.', 'S', 'りりあ。', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1681, 'ロミオとシンデレラ', '#', '初音ミク/doriko', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1682, 'クエスチョン', '#', '初音ミク/john', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1683, '回る空うさぎ', 'H', '初音ミク/Orangestar', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1684, 'メルト(melt)', '#', '初音ミク/supercell', '2', '', '', '2', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1685, '福寿草', 'F', '初音ミク/ぐにょ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1686, 'パズルガール(拼图女孩)', '#', '初音ミク/とあ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1687, '小夜子', 'X', '初音ミク/みきとP', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1688, '僕は依存症feat. みきとP (我是依存症)', 'P', '初音ミク/みきとP', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1689, '奈落', 'N', '初音ミク/みきとP', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1690, 'さようなら、花泥棒さん(再见了，盗花人)', '#', '初音ミク/メル', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1691, '魔法の絨毯 (魔法毯)', 'M', '川崎鷹也', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1692, '君の為のキミノウタ', 'J', '川崎鷹也', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1693, 'れぞんでーとる(Raison d\'etre)', '#', '存流', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1694, '味覚', 'W', '淡甘', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1695, 'ハルノ寂寞 (春日寂寞)', '#', '稲葉曇', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1696, '落日', 'L', '東京事変', '2', '', '', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1697, '睡魔', 'S', '缶缶/Ayase', '2', '', '', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1698, 'ド屑', '#', '歌愛ユキ/なきそ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1699, '強風オールバック', 'Q', '歌愛ユキ/ゆこぴ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1700, 'そして花になる', '#', '花譜', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1701, 'わたしの線香', '#', '花譜', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1702, 'ギターと孤独と蒼い惑星', '#', '結束バンド', '2', '', '', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1703, 'ひとり旅(独自旅行)', '#', '瀬名航/鎖那', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1704, 'ソラゴト(Fake)', '#', '明透', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1705, '夕立', 'X', '日食なつこ', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1706, 'yellow', 'Y', '神山羊', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1707, '彼女は旅に出る (她踏上了旅途)', 'B', '鎖那', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1708, '紅い呪い(鲜红诅咒)', 'H', '吐息/aruma', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1709, 'ビビデバ(星彗闪耀)', '#', '星街すいせい', '2', '', '', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1710, '月の明り', 'Y', '伊田恵美', NULL, '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1711, 'ダーリン', '#', '須田景凪', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1712, 'ダイビング', '#', '岩見拓馬', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1713, '月が綺麗', 'Y', '岩見拓馬', '2', '', '', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1714, '1999', '#', '羊文学', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1715, 'fake face dance music', 'F', '音田雅則', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1716, '香水', 'X', '瑛人', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1717, 'ドライフラワー', '#', '優里', '2', '', '30', '1', NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1718, '阿吽のビーツ', 'A', '羽生迷子/v flower', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1719, '好きな人がいること(有喜欢的人)', 'H', '知英', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1720, '糸(线)', 'M', '中島みゆき', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1721, 'S.S.S.', 'S', '佐藤千亜妃', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1722, 'ハルノユキ', '#', 'リリィ、さよなら。', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1723, '今晩はお月さん', 'J', 'ハンバート ハンバート', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1724, '星屑ビーナス', 'X', 'Aimer', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1725, '别问很可怕', 'B', 'J. Sheon', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1726, 'Melody Remix', 'M', '未知', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1727, '大鱼', 'D', '周深', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1728, '不要说话', 'B', '陈奕迅', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1729, '成全', 'C', '林宥嘉', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1730, '梦回还', 'M', '呦猫UNEKO', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1731, '谓风', 'W', '双笙/流仙', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1732, '四重罪孽', 'S', '洛天依/乐正绫/言和/DELA', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1733, '是风动', 'S', '银临/河图', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1734, '六重不忠', 'L', '洛天依/乐正绫/言和/DELA', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1735, '东京不太热', 'D', '洛天依/Z新豪', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1736, '不朽之罪', 'B', '双笙/玄觞', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1737, '幹物女(干物女)', 'G', '洛天依/Z新豪', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1738, '百鬼阴阳抄-柔情版', 'B', '银临/Aki阿杰', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1739, '权御天下', 'Q', '洛天依等', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1740, '桃花笑', 'T', '洛天依/乐正绫/言和', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1741, '恋人', 'L', '刘嘉星', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1742, '这条小鱼在乎', 'Z', '王OK/洪佩瑜', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1743, '听夜雨', 'T', '礼越', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1744, '珠玉', 'Z', '单依纯', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1745, '爱情讯息', 'A', '郭静', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1746, '她说', 'T', '林俊杰', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1747, '愿与愁', 'Y', '林俊杰', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1748, '床', 'C', '草东没有派对', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1749, '喜欢', 'X', '张悬', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1750, '爱人错过', 'A', '告五人', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1751, 'Time Machine', 'T', 'mj apanay ft. aren park', '3', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1752, '有何不可', 'Y', '许嵩', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1753, '稻香', 'D', '周杰伦', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1754, '龙卷风', 'L', '周杰伦', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1755, '夏天的风', 'X', '温岚', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1756, '晚婚', 'W', '李宗盛', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1757, '太聪明', 'T', '陈绮贞', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1758, '小半', 'X', '陈粒', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1759, '走马', 'Z', '陈粒', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1760, '奇妙能力歌', 'Q', '陈粒', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1761, '虚拟', 'X', '陈粒', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1762, '易燃易爆炸', 'Y', '陈粒', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1763, '绝对占有 相对自由', 'J', '陈粒', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1764, '可惜没如果', 'K', '林俊杰', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1765, '背对背拥抱', 'B', '林俊杰', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1766, '修炼爱情', 'X', '林俊杰', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1767, '心墙', 'X', '林俊杰', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1768, '曹操', 'C', '林俊杰', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1769, '小酒窝', 'X', '林俊杰', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1770, '关键词', 'G', '林俊杰', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1771, '黑夜问白天', 'H', '林俊杰', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1772, '不潮不用花钱', 'B', '林俊杰', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1773, '新地球', 'X', '林俊杰', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1774, '花海', 'H', '周杰伦', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1775, '唯一', 'W', '告五人', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1776, '最长的电影', 'Z', '周杰伦', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1777, '别找我麻烦', 'B', '蔡健雅', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1778, '采茶纪', 'C', '双笙', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1779, '第三人称', 'D', 'Hush', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1780, '晴天', 'Q', '周杰伦', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1781, '体面', 'T', '于文文', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1782, '笑', 'X', '太一', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1783, '至少还有你', 'Z', '林忆莲', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1784, '啷个哩个啷', 'L', '鹏泊', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1785, '偏爱', 'P', '张芸京', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1786, '男孩', 'N', '梁博', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1787, '童话镇', 'T', '暗杠', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1788, '谁', 'S', '廖俊涛', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1789, 'Tired', 'T', 'vietra', '3', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1790, '孤勇者', 'G', '陈奕迅', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1791, '爱如潮水', 'A', '张信哲', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1792, '年轮', 'N', '汪苏泷', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1793, '东西', 'D', '林俊呈', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1794, '白羊', 'B', '徐秉龙', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1795, '陷阱', 'X', '王北车', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1796, '一笑倾城', 'Y', '汪苏泷', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1797, '好想爱这个世界啊', 'H', '华晨宇', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1798, '童年', 'T', '罗大佑', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1799, '下个路口见', 'X', '李宇春', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1800, '说爱你', 'S', '蔡依林', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1801, '我的歌声里', 'W', '曲婉婷', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1802, '素颜', 'S', '许嵩', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1803, '故梦', 'G', '橙翼', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1804, '鬼', 'G', '草东没有派对', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1805, '梦的光点', 'M', '王心凌', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1806, '红马', 'H', '许蓝心', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1807, '突然好想你', 'T', '五月天', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1808, '光年之外', 'G', '邓紫棋', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1809, '难生恨', 'N', 'DAWN', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1810, '消愁', 'X', '毛不易', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1811, '暗号', 'A', '周杰伦', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1812, '快乐的扑满', 'K', '邵丽棠', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1813, 'FLY ME TO THE MOON', 'F', 'OLIVIA ONG', '3', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1814, '第三十八年夏至', 'D', '河图', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1815, '当', 'D', '动力火车', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1816, '隐形的翅膀', 'Y', '张韶涵', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1817, '不染', 'B', '毛不易', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1818, '彩虹的微笑', 'C', '王心凌', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1819, '时间煮雨', 'S', '郁可唯', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1820, '静悄悄', 'J', '陈泫孝', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1821, '匆匆那年', 'C', '王菲', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1822, '空空如也', 'K', '任然', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1823, '飞机场', 'F', '徐良/小凌', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1824, '如果这就是爱情', 'R', '张靓颖', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1825, '欧若拉', 'O', '张韶涵', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1826, '想想念念', 'X', 'FAFA/雪二', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1827, '天地缓缓', 'T', '伦桑', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1828, '喜欢你', 'X', '陈洁仪', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1829, '下雨天', 'X', '南拳妈妈', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1830, '客官不可以', 'K', '徐良/小凌', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1831, '绿色', 'L', '陈雪凝', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1832, '世界上的另一个我', 'S', '阿肆 / 郭采洁', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1833, '快乐星猫', 'K', '牛奶咖啡', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1834, '参商', 'C', '不才', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1835, '告白气球', 'G', '周杰伦', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1836, '50 Feet', '#', 'SoMo', '3', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1837, '梁山伯与朱丽叶', 'L', '曹格/卓文萱', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1838, '菲菲', 'F', '沈以诚', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1839, '身骑白马', 'S', '徐佳莹', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1840, '吹灭小山河', 'C', '国风堂/司南', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1841, '小宇', 'X', '蓝心羽', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1842, '自作多情', 'Z', '本兮', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1843, '凄美地', 'Q', '郭顶', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1844, '雨爱', 'Y', '杨丞琳', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1845, '七里香', 'Q', '周杰伦', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1846, '悬溺', 'X', '葛东琪', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1847, '情花', 'Q', '本兮', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1848, '烟雨行舟', 'Y', '伦桑', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1849, '小幸运', 'X', '田馥甄', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1850, '若把你', 'R', 'Kirsty刘瑾睿', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1851, '无语', 'W', '本兮', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1852, '战放', 'Z', '本兮', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1853, '画', 'H', '邓紫棋', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1854, '狐言', 'H', '河图 / 洛天依', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1855, '赤伶', 'C', 'HITA', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1856, '失眠飞行', 'S', '沈以诚', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1857, '红色高跟鞋', 'H', '蔡健雅', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1858, '烟花易冷', 'Y', '周杰伦', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1859, '霜雪千年', 'S', '洛天依/乐正绫', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1860, '载我回家', 'Z', '陈珊妮', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1861, '保留', 'B', '郭顶', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1862, '有心无意', 'Y', '本兮', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1863, '出山', 'C', '花粥', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1864, '大风吹', 'D', '草东没有派对', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1865, '形容', 'X', '沈以诚', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1866, '可乐', 'K', '赵紫骅', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1867, '左肩', 'Z', '安苏羽', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1868, '我好想你', 'W', '苏打绿', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1869, '水星记', 'S', '郭顶', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1870, '年少有为', 'N', '李荣浩', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1871, 'R.', 'R', '李子豪(HtFR)/大喜', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1872, '爱你', 'A', '王心凌', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1873, '九九八十一', 'J', '洛天依/乐正绫', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1874, '椿', 'C', '沈以诚', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1875, '夜车', 'Y', '曾轶可', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1876, '红昭愿', 'H', '音阙诗听', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1877, '红尘客栈', 'H', '周杰伦', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1878, '蒲公英的约定', 'P', '周杰伦', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1879, '时间飞行', 'S', '白宇/朱一龙', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1880, '醒着醉', 'X', '马良', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1881, '九张机', 'J', '叶炫清', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1882, '说谎', 'S', '林宥嘉', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1883, '浮生未歇', 'F', '音频怪物／双笙', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1884, '撒野', 'S', '凯瑟喵', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1885, '我的一个道姑朋友', 'W', '以冬', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1886, '浪费', 'L', '林宥嘉', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1887, '棠梨煎雪', 'T', '银临', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1888, '后来的我们', 'H', '五月天', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1889, '宝贝', 'B', '张悬', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1890, '好想你', 'H', '朱主爱', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1891, '倾尽天下', 'Q', '河图', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1892, '隐', 'Y', '河图', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1893, '如花', 'R', '河图', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1894, '狂野想乡', 'K', '西瓜JUN', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1895, '丹青客', 'D', 'HITA/小曲儿', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1896, '写给我第一个喜欢的女孩的歌', 'X', '洛天依', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1897, '恶魔的爱', 'E', '李宏毅/李明霖', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1898, '白石溪', 'B', '洛天依/乐正绫', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1899, '锦鲤抄', 'J', '银临/云之泣', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1900, '圈圈点点圈圈点点圈圈点点', 'Q', '洛天依', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1901, '直觉', 'Z', '赵方婧', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1902, '迷人的危险', 'M', 'Dance Flow', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1903, 'The Star', 'T', '李佳思', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1904, '恶作剧', 'E', '王蓝菌', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1905, '新九九八十一', 'X', '泠鸢', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1906, '凉城', 'L', '任然', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1907, '那年', 'N', '任然', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1908, '杀手', 'S', '林俊杰', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1909, '孙尚香', 'S', '洛天依/乐正绫/空气凝', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1910, '归零', 'G', '小曲儿', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1911, '水仙', 'S', '王心凌', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1912, '落霞云归', 'L', '慕寒', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1913, '你就不要想起我', 'N', '田馥甄', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1914, '腐草为萤', 'F', '银临', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1915, '越来越不懂', 'Y', '蔡健雅', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1916, '忆江南', 'Y', '五音JW', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1917, '失落沙洲', 'S', '徐佳莹', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1918, '只要平凡', 'Z', '张杰/张碧晨', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1919, '暗淡的是你曾温柔的小动作', 'A', '太一', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1920, '很久很久', 'H', '杨和苏', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1921, '心如止水', 'X', 'Ice Paper', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1922, '太久', 'T', '刘思鉴/桃德李Todd Li', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1923, '当爱已成往事', 'D', '林忆莲/李宗盛', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1924, '勘ぐれい', 'K', 'ずっと真夜中でいいのに', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1925, '薄れる', 'B', 'rinri/裏命', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1926, 'プロポーズ', '#', 'なとり', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1927, 'オノマトペ', '#', '羽生まゐご/りりあ。', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1928, 'Aliens', 'A', 'KIRINJI', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1929, 'ヒスイ', '#', 'nonoc', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1930, '月 feat. ヰ世界情緒', 'Y', 'Guiano/ヰ世界情緒', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1931, '寝言は寝て言え', 'Q', '月ノ美兎', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1932, '君のヒーロー', 'J', '十明', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1933, 'Bunny Girl', 'B', 'AKASAKI', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1934, 'マジか！', '#', '梓川', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1935, 'フィナーレ（终曲）', '#', 'eill', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1936, 'JANE DOE', 'J', '宇多田光/米津玄师', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1937, '死別', 'S', 'シャノン', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1938, '雨き声残響', 'Y', '初音ミク/Orangestar', '2', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1939, '幻彩国', 'H', '双笙', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1940, '食虫植物', 'S', NULL, NULL, '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1941, '我怀念的', 'W', '孙燕姿', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1942, '下等马', 'X', '洛天依Official/ChiliChill', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1943, '普通朋友', 'P', '陶喆', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1944, '几分之几', 'J', '卢广仲', '1', '', '', NULL, NULL, '', '', '3');
INSERT INTO `song_list` VALUES (1945, NULL, NULL, NULL, '1', '[[\"common_category\",\"流行\"],[\"common_category\",\"古风\"],[\"common_category\",\"国风\"],[\"common_category\",\"ACG\"],[\"common_category\",\"V家\"],[\"common_category\",\"东方\"],[\"common_category\",\"经典\"],[\"common_category\",\"怀旧\"],[\"common_category\",\"民谣\"],[\"common_category\",\"民族\"],[\"common_category\",\"美声\"],[\"common_category\",\"爵士\"],[\"common_category\",\"摇滚\"],[\"common_category\",\"电子\"],[\"common_category\",\"金属\"],[\"common_category\",\"戏腔\"],[\"common_category\",\"RAP\"],[\"common_category\",\"儿歌\"],[\"common_category\",\"整活\"],[\"common_category\",\"可爱\"],[\"common_category\",\"治愈\"],[\"common_category\",\"温柔\"],[\"common_category\",\"活泼\"],[\"common_category\",\"悲伤\"],[\"common_category\",\"空灵\"],[\"common_category\",\"童年回忆\"],[\"common_category\",\"OST\"],[\"common_category\",\"动漫\"],[\"common_category\",\"影视金曲\"],[\"common_category\",\"游戏\"],[\"common_category\",\"原创曲\"],[\"common_category\",\"弹唱\"],[\"common_category\",\"合唱\"],[\"common_category\",\"舞曲\"],[\"common_category\",\"偶像\"],[\"common_category\",\"音乐剧\"],[\"common_category\",\"哥特\"],[\"common_category\",\"特摄\"],[\"common_category\",\"说唱\"],[\"common_category\",\"喊麦\"],[\"common_category\",\"配音\"],[\"common_category\",\"方言\"],[\"common_category\",\"约德尔\"],[\"common_category\",\"其他\"],[\"sound_category\",\"安静\"],[\"sound_category\",\"适中\"],[\"sound_category\",\"较吵\"],[\"pitch_category\",\"高音\"],[\"pitch_category\",\"中音\"],[\"pitch_category\",\"低音\"]]', '0', '0', NULL, '1', NULL, '1');

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-red\n', 'Y', 'admin', '2026-02-24 20:59:02', 'admin', '2026-02-24 21:20:41', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2026-02-24 20:59:02', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2026-02-24 20:59:02', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2026-02-24 20:59:02', 'admin', '2026-02-24 21:20:26', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2026-02-24 20:59:02', 'admin', '2026-03-19 20:00:56', '是否开启注册用户功能（true开启，false关闭）');
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
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 144 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_dict_data` VALUES (138, 1, '常用分类', 'common_category', 'music_style', NULL, 'primary', 'N', '0', 'admin', '2026-03-09 09:40:17', 'admin', '2026-03-09 09:40:23', '常用分类');
INSERT INTO `sys_dict_data` VALUES (139, 2, '声音分类', 'sound_category', 'music_style', NULL, 'primary', 'N', '0', 'admin', '2026-03-09 09:40:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (140, 3, '音高分类', 'pitch_category', 'music_style', NULL, 'primary', 'N', '0', 'admin', '2026-03-09 09:41:16', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (141, 4, '小众分类', 'niche_category', 'music_style', NULL, 'primary', 'N', '0', 'admin', '2026-03-09 09:41:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (142, 5, 'QQ音乐分类', 'qq_music_category', 'music_style', NULL, 'primary', 'N', '0', 'admin', '2026-03-09 09:42:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (143, 6, '如有其他需要', 'other_needs', 'music_style', NULL, 'primary', 'N', '0', 'admin', '2026-03-09 09:42:24', '', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_dict_type` VALUES (16, '新曲风', 'music_style', '0', 'admin', '2026-03-09 09:28:21', '', NULL, '新曲风');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 207 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-09 09:10:10');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-09 10:52:43');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-09 13:58:13');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-09 14:45:20');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-11 21:32:46');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-13 14:15:29');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-14 21:27:33');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-15 12:37:29');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-15 13:32:59');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-15 14:07:32');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-15 14:10:43');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-15 15:50:06');
INSERT INTO `sys_logininfor` VALUES (142, 'ry', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-15 17:16:48');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-15 17:16:48');
INSERT INTO `sys_logininfor` VALUES (144, 'ry', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-15 17:20:36');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-15 17:20:40');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-15 18:09:58');
INSERT INTO `sys_logininfor` VALUES (147, 'ry', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-15 18:10:02');
INSERT INTO `sys_logininfor` VALUES (148, 'ry', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-15 18:10:15');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-15 18:10:19');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-15 18:13:55');
INSERT INTO `sys_logininfor` VALUES (151, 'ry', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-15 18:13:59');
INSERT INTO `sys_logininfor` VALUES (152, 'ry', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-15 18:15:17');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-15 18:15:21');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-15 18:15:39');
INSERT INTO `sys_logininfor` VALUES (155, 'ry', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-15 18:15:42');
INSERT INTO `sys_logininfor` VALUES (156, 'ry', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-19 19:31:25');
INSERT INTO `sys_logininfor` VALUES (157, 'ry', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-19 19:31:57');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-19 19:32:01');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-19 19:32:46');
INSERT INTO `sys_logininfor` VALUES (160, 'ry', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-19 19:32:50');
INSERT INTO `sys_logininfor` VALUES (161, 'ry', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-19 20:00:18');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-19 20:00:41');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-19 20:01:00');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-19 20:01:08');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-19 20:02:26');
INSERT INTO `sys_logininfor` VALUES (166, 'test', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '注册成功', '2026-03-19 20:02:43');
INSERT INTO `sys_logininfor` VALUES (167, 'test', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-19 20:02:49');
INSERT INTO `sys_logininfor` VALUES (168, 'test', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-19 20:02:53');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-19 20:03:00');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-19 20:03:19');
INSERT INTO `sys_logininfor` VALUES (171, 'test', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-19 20:03:23');
INSERT INTO `sys_logininfor` VALUES (172, 'test', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-19 20:09:53');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-19 20:09:57');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-19 20:10:15');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-19 20:15:53');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-19 20:15:58');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-19 20:16:44');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-19 20:16:46');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-19 20:17:35');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-19 20:17:36');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-19 20:17:42');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '退出成功', '2026-03-19 20:17:44');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 145', 'Windows10', '0', '登录成功', '2026-03-19 20:17:45');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 146', 'Windows10', '0', '登录成功', '2026-03-21 20:16:46');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 146', 'Windows10', '0', '退出成功', '2026-03-21 20:50:26');
INSERT INTO `sys_logininfor` VALUES (186, 'test', '127.0.0.1', '内网IP', 'Chrome 146', 'Windows10', '0', '登录成功', '2026-03-21 20:50:29');
INSERT INTO `sys_logininfor` VALUES (187, 'test', '127.0.0.1', '内网IP', 'Chrome 146', 'Windows10', '0', '登录成功', '2026-03-21 21:49:59');
INSERT INTO `sys_logininfor` VALUES (188, 'test', '127.0.0.1', '内网IP', 'Chrome 146', 'Windows10', '0', '退出成功', '2026-03-22 00:09:50');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 146', 'Windows10', '0', '登录成功', '2026-03-22 00:09:50');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 146', 'Windows10', '0', '退出成功', '2026-03-22 00:38:21');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 146', 'Windows10', '1', '用户不存在/密码错误', '2026-03-24 20:33:33');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 146', 'Windows10', '1', '用户不存在/密码错误', '2026-03-24 20:33:33');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 146', 'Windows10', '0', '登录成功', '2026-03-24 20:33:36');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 146', 'Windows10', '1', '用户不存在/密码错误', '2026-03-30 19:48:38');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 146', 'Windows10', '0', '登录成功', '2026-03-30 19:48:40');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 146', 'Windows10', '0', '退出成功', '2026-03-30 20:15:39');
INSERT INTO `sys_logininfor` VALUES (197, 'test1', '127.0.0.1', '内网IP', 'Chrome 146', 'Windows10', '0', '注册成功', '2026-03-30 20:16:08');
INSERT INTO `sys_logininfor` VALUES (198, 'test1', '127.0.0.1', '内网IP', 'Chrome 146', 'Windows10', '0', '登录成功', '2026-03-30 20:16:33');
INSERT INTO `sys_logininfor` VALUES (199, 'test123', '127.0.0.1', '内网IP', 'Chrome 146', 'Windows10', '0', '注册成功', '2026-03-30 21:43:00');
INSERT INTO `sys_logininfor` VALUES (200, 'test123', '127.0.0.1', '内网IP', 'Chrome 146', 'Windows10', '0', '登录成功', '2026-03-30 21:43:09');
INSERT INTO `sys_logininfor` VALUES (201, 'test123', '127.0.0.1', '内网IP', 'Chrome 146', 'Windows10', '0', '退出成功', '2026-03-30 21:44:41');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 146', 'Windows10', '0', '登录成功', '2026-03-30 21:44:46');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 146', 'Windows10', '0', '退出成功', '2026-03-30 21:45:55');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 146', 'Windows10', '0', '登录成功', '2026-03-30 21:46:34');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 146', 'Windows10', '0', '退出成功', '2026-03-30 21:47:49');
INSERT INTO `sys_logininfor` VALUES (206, 'test123', '127.0.0.1', '内网IP', 'Chrome 146', 'Windows10', '0', '登录成功', '2026-03-30 21:47:59');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2011 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_menu` VALUES (2002, '歌单管理', 0, 5, 'songListInfo', 'songList/info/index', NULL, 'songListInfo', 1, 0, 'C', '1', '0', 'songList:info:list', 'dashboard', 'admin', '2026-02-26 20:37:53', 'admin', '2026-03-15 17:24:01', '歌单菜单');
INSERT INTO `sys_menu` VALUES (2003, '歌单查询', 2002, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'songList:info:query', '#', 'admin', '2026-02-26 20:37:53', 'admin', '2026-02-26 20:56:55', '');
INSERT INTO `sys_menu` VALUES (2004, '歌单新增', 2002, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'songList:info:add', '#', 'admin', '2026-02-26 20:37:53', 'admin', '2026-02-26 20:58:01', '');
INSERT INTO `sys_menu` VALUES (2005, '歌单修改', 2002, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'songList:info:edit', '#', 'admin', '2026-02-26 20:37:53', 'admin', '2026-02-26 20:58:13', '');
INSERT INTO `sys_menu` VALUES (2006, '歌单删除', 2002, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'songList:info:remove', '#', 'admin', '2026-02-26 20:37:53', 'admin', '2026-02-26 20:58:56', '');
INSERT INTO `sys_menu` VALUES (2007, '歌单导出', 2002, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'songList:info:export', '#', 'admin', '2026-02-26 20:37:53', 'admin', '2026-02-26 20:59:08', '');
INSERT INTO `sys_menu` VALUES (2008, '歌单导入', 2002, 6, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'songList:info:import', '#', 'admin', '2026-03-04 15:12:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '网页歌单', 0, 5, 'songList/edit', 'songList/edit/index', NULL, 'songlistEdit', 1, 0, 'C', '0', '0', 'songList:edit:list', 'button', 'admin', '2026-03-14 22:18:34', 'admin', '2026-03-14 22:28:02', '');
INSERT INTO `sys_menu` VALUES (2010, '外部访问歌单', 0, 8, 'songlist', 'songList/index', NULL, 'songlist', 1, 0, 'M', '1', '0', '', '#', 'admin', '2026-03-19 21:17:50', 'admin', '2026-03-19 21:18:01', '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 252 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_oper_log` VALUES (176, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '管理员', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"新曲风\",\"dictType\":\"music_style\",\"params\":{},\"remark\":\"新曲风\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 09:28:21', 20);
INSERT INTO `sys_oper_log` VALUES (177, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '管理员', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"常用分类\",\"dictSort\":1,\"dictType\":\"music_style\",\"dictValue\":\"common_category\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 09:40:17', 9);
INSERT INTO `sys_oper_log` VALUES (178, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '管理员', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-03-09 09:40:17\",\"default\":false,\"dictCode\":138,\"dictLabel\":\"常用分类\",\"dictSort\":1,\"dictType\":\"music_style\",\"dictValue\":\"common_category\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"remark\":\"常用分类\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 09:40:23', 11);
INSERT INTO `sys_oper_log` VALUES (179, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '管理员', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"声音分类\",\"dictSort\":2,\"dictType\":\"music_style\",\"dictValue\":\"sound_category\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 09:40:56', 18);
INSERT INTO `sys_oper_log` VALUES (180, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '管理员', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"音高分类\",\"dictSort\":3,\"dictType\":\"music_style\",\"dictValue\":\"pitch_category\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 09:41:16', 7);
INSERT INTO `sys_oper_log` VALUES (181, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '管理员', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"小众分类\",\"dictSort\":4,\"dictType\":\"music_style\",\"dictValue\":\"niche_category\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 09:41:35', 10);
INSERT INTO `sys_oper_log` VALUES (182, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '管理员', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"QQ音乐分类\",\"dictSort\":5,\"dictType\":\"music_style\",\"dictValue\":\"qq_music_category\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 09:42:03', 18);
INSERT INTO `sys_oper_log` VALUES (183, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '管理员', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"如有其他需要\",\"dictSort\":6,\"dictType\":\"music_style\",\"dictValue\":\"other_needs\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 09:42:24', 19);
INSERT INTO `sys_oper_log` VALUES (184, '歌单管理', 6, 'com.ruoyi.songList.controller.SongListController.importData()', 'POST', 1, 'admin', '管理员', '/songList/info/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', NULL, 1, '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、歌曲 日常と地球の額縁 (日常和地球的画框) 导入失败：曲风 \'节奏，民歌\' 不存在于字典中', '2026-03-11 21:35:16', 7751);
INSERT INTO `sys_oper_log` VALUES (185, '歌单', 1, 'com.ruoyi.songList.controller.SongListController.add()', 'POST', 1, 'admin', '管理员', '/songList/info', '127.0.0.1', '内网IP', '{\"exclusiveLevel\":\"3\",\"firstLetter\":\"#\",\"gift\":\"{\\\"name\\\":\\\"小花花\\\",\\\"price\\\":\\\"0.1\\\",\\\"icon\\\":\\\"https://s1.hdslb.com/bfs/live/5126973892625f3a43a8290be6b625b5e54261a5.png\\\",\\\"value\\\":5}\",\"language\":\"1\",\"musicName\":\"123\",\"musicalStyle\":\"6,4,5\",\"pay\":\"988\",\"singer\":\"123\",\"songSlice\":\"1\",\"uploader\":\"1\"} ', '{\"msg\":\"歌曲 \'123\' 新增成功\",\"code\":200}', 0, NULL, '2026-03-11 21:38:47', 14);
INSERT INTO `sys_oper_log` VALUES (186, '歌单管理', 6, 'com.ruoyi.songList.controller.SongListController.importData()', 'POST', 1, 'admin', '管理员', '/songList/info/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', NULL, 1, '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、歌曲 日常と地球の額縁 (日常和地球的画框) 导入失败：曲风 \'节奏，民歌\' 不存在于字典中', '2026-03-11 21:48:23', 4829);
INSERT INTO `sys_oper_log` VALUES (187, '歌单管理', 6, 'com.ruoyi.songList.controller.SongListController.importData()', 'POST', 1, 'admin', '管理员', '/songList/info/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 490 条，数据如下：<br/>1、歌曲 SLEEPWALK 更新成功<br/>2、歌曲 フユノ(冬野) 更新成功<br/>3、歌曲 日常と地球の額縁 (日常和地球的画框) 导入成功<br/>4、歌曲 カラノワレモノ (空之碎物) 更新成功<br/>5、歌曲 さらってほしいの (希望你能把我带走) 更新成功<br/>6、歌曲 モノカラー (黑白色彩) 更新成功<br/>7、歌曲 RIVER FOG,CHOCOLATE BUTTERFLY 更新成功<br/>8、歌曲 NOTOK 更新成功<br/>9、歌曲 (W)HERE 更新成功<br/>10、歌曲 癖 更新成功<br/>11、歌曲 東京フラッシュ (东京闪景) 更新成功<br/>12、歌曲 napori 更新成功<br/>13、歌曲 踊り子 (舞女) 更新成功<br/>14、歌曲 灯火 更新成功<br/>15、歌曲 裸の勇者 (赤裸的勇士) 更新成功<br/>16、歌曲 僕は今日も (今天我也) 更新成功<br/>17、歌曲 不可幸力 更新成功<br/>18、歌曲 走馬灯 更新成功<br/>19、歌曲 恋風邪にのせて (患上恋爱感冒) 更新成功<br/>20、歌曲 怪獣の唄 更新成功<br/>21、歌曲 宮 更新成功<br/>22、歌曲 花占い (花瓣占卜) 更新成功<br/>23、歌曲 mabataki 更新成功<br/>24、歌曲 HERO 更新成功<br/>25、歌曲 風神 (日剧《狮子的藏身处》主题曲) 更新成功<br/>26、歌曲 常熱 更新成功<br/>27、歌曲 トドメの一撃 feat. Cory Wong 更新成功<br/>28、歌曲 GORILLA SHIBAI (猿芝居) 更新成功<br/>29、歌曲 逃避行 (逃避之旅) 更新成功<br/>30、歌曲 断面 (日剧《教祖之女》主题曲) 更新成功<br/>31、歌曲 王 更新成功<br/>32、歌曲 ダークルーム（暗室） 更新成功<br/>33、歌曲 ＆疾走 更新成功<br/>34、歌曲 呆然 更新成功<br/>35、歌曲 愛がすべて (爱即是一切 / All I need is love) 更新成功<br/>36、歌曲 ラブレス (LOVELESS/爱恋失格) 更新成功<br/>37、歌曲 天国 更新成功<br/>38、歌曲 芝居の終焉 (戏剧的尽头) 更新成功<br/>39、歌曲 寄り酔い (倚醉) 更新成功<br/>40、歌曲 ブラウニー (布朗尼 Brownie) 更新成功<br/>41、歌曲 イージーゲーム (Easy Game) 更新成功<br/>42、歌曲 The Fog 更新成功<br/>43、歌曲 ビーユアセルフ (做你自己 Be Yourself) 更新成功<br/>44、歌曲 進め！そっちだ！ (auお正月新CM) 更新成功<br/>45、歌曲 シュガーロス 更新成功<br/>46、歌曲 泡沫 更新成功<br/>47、歌曲 まだ浅はか (feat. 和ぬか) 更新成功<br/>48、歌曲 アイオクレ 更新成功<br/>49、歌曲 アミ (日剧《妖怪合租屋》主题曲) 更新成功<br/>50、歌曲 ラブの逃走 (爱意逃亡) 更新成功<br/>51、歌曲 ロックでキス 更新成功<br/>52、歌曲 真っ裸 更新成功<br/>53、歌曲 ミカヅキ (新月) 更新成功<br/>54、歌曲 フラレガイガール (被甩男女) 更新成功<br/>55、歌曲 光と闇 (光与暗) 更新成功<br/>56、歌曲 十億年 更新成功<br/>57、歌曲 さよーならあなた 更新成功<br/>58、歌曲 エメラルド 更新成功<br/>59、歌曲 かみつきたい 更新成功<br/>60、歌曲 アーケード (拱廊) 更新成功<br/>61、歌曲 朝になって夢からさめて 更新成功<br/>62、歌曲 祝日 更新成功<br/>63、歌曲 湯船 更新成功<br/>64、歌曲 あなたは煙草 私はシャボン(你是烟草 我是泡沫) 更新成功<br/>65、歌曲 水星 更新成功<br/>66、歌曲 サーカスナイト 更新成功<br/>67、歌曲 202 (New Mix) 更新成功<br/>68、歌曲 ルミネセンス 更新成功<br/>69、歌曲 はじめまして 更新成功<br/>70、歌曲 私の好きなもの (我喜欢的东西) 更新成功<br/>71、歌曲 わたしのうた 更新成功<br/>72、歌曲 笑い話 更新成功<br/>73、歌曲 サターン (土星) 更新成功<br/>74、歌曲 グラスとラムレーズン 更新成功<br/>75、歌曲 Ham 更新成功<br/>76、歌曲 君がいて水になる (有你', 0, NULL, '2026-03-11 21:48:51', 1975);
INSERT INTO `sys_oper_log` VALUES (188, '歌单管理', 6, 'com.ruoyi.songList.controller.SongListController.importData()', 'POST', 1, 'admin', '管理员', '/songList/info/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 4 条数据格式不正确，错误如下：<br/>1、歌曲 sleepwalk 已存在<br/>2、歌曲 东京不太热 已存在<br/>3、歌曲 喜欢 已存在<br/>4、歌曲 Tell Me Baby 已存在', '2026-03-11 21:51:31', 4061);
INSERT INTO `sys_oper_log` VALUES (189, '歌单管理', 6, 'com.ruoyi.songList.controller.SongListController.importData()', 'POST', 1, 'admin', '管理员', '/songList/info/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 4 条数据格式不正确，错误如下：<br/>1、歌曲 sleepwalk 已存在<br/>2、歌曲 东京不太热 已存在<br/>3、歌曲 喜欢 已存在<br/>4、歌曲 Tell Me Baby 已存在', '2026-03-11 21:59:35', 4952);
INSERT INTO `sys_oper_log` VALUES (190, '歌单', 5, 'com.ruoyi.songList.controller.SongListController.export()', 'POST', 1, 'admin', '管理员', '/songList/info/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2026-03-13 14:16:46', 641);
INSERT INTO `sys_oper_log` VALUES (191, '歌单', 5, 'com.ruoyi.songList.controller.SongListController.export()', 'POST', 1, 'admin', '管理员', '/songList/info/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2026-03-13 14:31:00', 654);
INSERT INTO `sys_oper_log` VALUES (192, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '管理员', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"网页歌单\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"songList/edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-14 22:18:34', 273);
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '管理员', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"songList/edit/index\",\"createTime\":\"2026-03-14 22:18:34\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"网页歌单\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"songList/edit\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-14 22:19:15', 20);
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '管理员', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"songList/edit/index\",\"createTime\":\"2026-03-14 22:18:34\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"网页歌单\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"songList/edit\",\"perms\":\"songList:edit:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-14 22:19:29', 20);
INSERT INTO `sys_oper_log` VALUES (195, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '管理员', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"songList/edit/index\",\"createTime\":\"2026-03-14 22:18:34\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"网页歌单\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"songList/edit\",\"perms\":\"songList:edit:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-14 22:19:37', 21);
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '管理员', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"songList/edit/index\",\"createTime\":\"2026-03-14 22:18:34\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"网页歌单\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"songList/edit\",\"perms\":\"songList:edit:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-14 22:22:25', 18);
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '管理员', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"songList/edit/index\",\"createTime\":\"2026-03-14 22:18:34\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"网页歌单\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"songList/edit\",\"perms\":\"songList:edit:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-14 22:22:40', 19);
INSERT INTO `sys_oper_log` VALUES (198, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '管理员', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"songList/edit/index\",\"createTime\":\"2026-03-14 22:18:34\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"网页歌单\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"songList/edit\",\"perms\":\"songList:edit:list\",\"routeName\":\"songlistEdit\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-14 22:28:02', 20);
INSERT INTO `sys_oper_log` VALUES (199, '歌单', 5, 'com.ruoyi.songList.controller.SongListController.export()', 'POST', 1, 'admin', '管理员', '/songList/info/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2026-03-14 22:46:41', 1510);
INSERT INTO `sys_oper_log` VALUES (200, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '管理员', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/03/15/847276882d154bd4b81b31274f8ab67e.png\",\"code\":200}', 0, NULL, '2026-03-15 12:49:41', 164);
INSERT INTO `sys_oper_log` VALUES (201, '歌单背景图片', 2, 'com.ruoyi.songList.controller.SongListController.uploadBackground()', 'POST', 1, 'admin', '管理员', '/songList/info/uploadBackground', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile//2026/03/15/6d859221a47b4efe9af95dd894ad63a1.png\",\"code\":200}', 0, NULL, '2026-03-15 14:24:13', 101);
INSERT INTO `sys_oper_log` VALUES (202, '歌单背景图片', 2, 'com.ruoyi.songList.controller.SongListController.uploadBackground()', 'POST', 1, 'admin', '管理员', '/songList/info/uploadBackground', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile//2026/03/15/562ce46732aa42fc8196fc09e20db8d4.png\",\"code\":200}', 0, NULL, '2026-03-15 15:05:04', 161);
INSERT INTO `sys_oper_log` VALUES (203, '歌单背景颜色', 2, 'com.ruoyi.songList.controller.SongListController.uploadBackgroundColor()', 'POST', 1, 'admin', '管理员', '/songList/info/uploadBackgroundColor', '127.0.0.1', '内网IP', '{\"color\":\"rgb(61, 28, 28)\"}', '{\"msg\":\"操作成功\",\"code\":200,\"color\":\"rgb(61, 28, 28)\"}', 0, NULL, '2026-03-15 15:12:41', 25);
INSERT INTO `sys_oper_log` VALUES (204, '歌单页面标题和提示信息', 2, 'com.ruoyi.songList.controller.SongListController.updatePrompts()', 'POST', 1, 'admin', '管理员', '/songList/info/updatePrompts', '127.0.0.1', '内网IP', '', '{\"msg\":\"至少需要提供一个有效的参数值\",\"code\":500}', 0, NULL, '2026-03-15 15:50:11', 2);
INSERT INTO `sys_oper_log` VALUES (205, '歌单页面标题和提示信息', 2, 'com.ruoyi.songList.controller.SongListController.updatePrompts()', 'POST', 1, 'admin', '管理员', '/songList/info/updatePrompts', '127.0.0.1', '内网IP', '', '{\"msg\":\"至少需要提供一个有效的参数值\",\"code\":500}', 0, NULL, '2026-03-15 15:50:50', 3);
INSERT INTO `sys_oper_log` VALUES (206, '歌单页面标题和提示信息', 2, 'com.ruoyi.songList.controller.SongListController.updatePrompts()', 'POST', 1, 'admin', '管理员', '/songList/info/updatePrompts', '127.0.0.1', '内网IP', '', '{\"msg\":\"至少需要提供一个有效的参数值\",\"code\":500}', 0, NULL, '2026-03-15 15:51:53', 0);
INSERT INTO `sys_oper_log` VALUES (207, '歌单页面标题和提示信息', 2, 'com.ruoyi.songList.controller.SongListController.updatePrompts()', 'POST', 1, 'admin', '管理员', '/songList/info/updatePrompts', '127.0.0.1', '内网IP', '', '{\"msg\":\"至少需要提供一个有效的参数值\",\"code\":500}', 0, NULL, '2026-03-15 15:54:23', 0);
INSERT INTO `sys_oper_log` VALUES (208, '歌单页面标题和提示信息', 2, 'com.ruoyi.songList.controller.SongListController.updatePrompts()', 'POST', 1, 'admin', '管理员', '/songList/info/updatePrompts', '127.0.0.1', '内网IP', '', '{\"msg\":\"至少需要提供一个有效的参数值\",\"code\":500}', 0, NULL, '2026-03-15 15:54:53', 0);
INSERT INTO `sys_oper_log` VALUES (209, '歌单页面标题和提示信息', 2, 'com.ruoyi.songList.controller.SongListController.updatePrompts()', 'POST', 1, 'admin', '管理员', '/songList/info/updatePrompts', '127.0.0.1', '内网IP', '', '{\"msg\":\"至少需要提供一个有效的参数值\",\"code\":500}', 0, NULL, '2026-03-15 15:56:44', 13043);
INSERT INTO `sys_oper_log` VALUES (210, '歌单页面标题和提示信息', 2, 'com.ruoyi.songList.controller.SongListController.updatePrompts()', 'POST', 1, 'admin', '管理员', '/songList/info/updatePrompts', '127.0.0.1', '内网IP', '{\"mainPrompt\":\"123\",\"pageTitle\":\"123\",\"subPrompt\":\"123\"} ', '{\"msg\":\"操作成功\",\"code\":200,\"pageTitle\":\"123\",\"mainPrompt\":\"123\",\"subPrompt\":\"123\"}', 0, NULL, '2026-03-15 16:02:12', 29);
INSERT INTO `sys_oper_log` VALUES (211, '歌单页面标题和提示信息', 2, 'com.ruoyi.songList.controller.SongListController.updatePrompts()', 'POST', 1, 'admin', '管理员', '/songList/info/updatePrompts', '127.0.0.1', '内网IP', '{\"mainPrompt\":\"12313\",\"pageTitle\":\"312\",\"subPrompt\":\"1231321\"} ', '{\"msg\":\"操作成功\",\"code\":200,\"pageTitle\":\"312\",\"mainPrompt\":\"12313\",\"subPrompt\":\"1231321\"}', 0, NULL, '2026-03-15 16:02:18', 13);
INSERT INTO `sys_oper_log` VALUES (212, '歌单背景颜色', 2, 'com.ruoyi.songList.controller.SongListController.uploadBackgroundColor()', 'POST', 1, 'admin', '管理员', '/songList/info/uploadBackgroundColor', '127.0.0.1', '内网IP', '{\"color\":\"rgb(255, 215, 0)\"}', '{\"msg\":\"操作成功\",\"code\":200,\"color\":\"rgb(255, 215, 0)\"}', 0, NULL, '2026-03-15 16:42:40', 20);
INSERT INTO `sys_oper_log` VALUES (213, '歌单背景图片', 2, 'com.ruoyi.songList.controller.SongListController.uploadBackground()', 'POST', 1, 'admin', '管理员', '/songList/info/uploadBackground', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile//2026/03/15/cd31dc7ede54472899840db189b817ae.jpg\",\"code\":200}', 0, NULL, '2026-03-15 16:44:59', 145);
INSERT INTO `sys_oper_log` VALUES (214, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '管理员', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"songList/info/index\",\"createTime\":\"2026-02-26 20:37:53\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"歌单管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"songListInfo\",\"perms\":\"songList:info:list\",\"routeName\":\"songListInfo\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-15 17:24:01', 30);
INSERT INTO `sys_oper_log` VALUES (215, '歌单背景图片', 2, 'com.ruoyi.songList.controller.SongListController.uploadBackground()', 'POST', 1, 'admin', '管理员', '/songList/info/uploadBackground', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile//2026/03/15/30e7390d20e7495a9d15daa9d1f5687d.png\",\"code\":200}', 0, NULL, '2026-03-15 17:28:42', 19);
INSERT INTO `sys_oper_log` VALUES (216, '歌单', 5, 'com.ruoyi.songList.controller.SongListController.export()', 'POST', 1, 'admin', '管理员', '/songList/info/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2026-03-15 17:33:51', 1201);
INSERT INTO `sys_oper_log` VALUES (217, '歌单显示列配置', 2, 'com.ruoyi.songList.controller.SongListController.saveShowColumns()', 'POST', 1, 'admin', '管理员', '/songList/info/saveShowColumns', '127.0.0.1', '内网IP', '[\"musicName\",\"singer\",\"language\",\"musicalStyle\"] ', '{\"msg\":\"显示列配置保存成功\",\"code\":200}', 0, NULL, '2026-03-15 17:35:51', 11);
INSERT INTO `sys_oper_log` VALUES (218, '歌单显示列配置', 2, 'com.ruoyi.songList.controller.SongListController.saveShowColumns()', 'POST', 1, 'admin', '管理员', '/songList/info/saveShowColumns', '127.0.0.1', '内网IP', '[\"musicName\",\"singer\",\"language\",\"musicalStyle\",\"pay\",\"songSlice\",\"remark\"] ', '{\"msg\":\"显示列配置保存成功\",\"code\":200}', 0, NULL, '2026-03-15 17:37:16', 13);
INSERT INTO `sys_oper_log` VALUES (219, '歌单', 5, 'com.ruoyi.songList.controller.SongListController.export()', 'POST', 1, 'admin', '管理员', '/songList/info/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2026-03-15 17:48:17', 242);
INSERT INTO `sys_oper_log` VALUES (220, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '管理员', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2026-02-24 20:59:01\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2009,2000,2001],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-15 18:13:50', 55);
INSERT INTO `sys_oper_log` VALUES (221, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', '管理员', '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2026-02-24 20:59:01\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[100,101,103,105],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-15 18:15:37', 18);
INSERT INTO `sys_oper_log` VALUES (222, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '管理员', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2026-02-24 20:59:01\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2009,2002,2003,2004,2005,2006,2007,2008,2000,2001],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-19 19:32:35', 51);
INSERT INTO `sys_oper_log` VALUES (223, '歌单管理', 6, 'com.ruoyi.songList.controller.SongListController.importData()', 'POST', 1, 'ry', '主播', '/songList/info/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 490 条数据格式不正确，错误如下：<br/>1、歌曲 SLEEPWALK 已存在<br/>2、歌曲 フユノ(冬野) 已存在<br/>3、歌曲 日常と地球の額縁 (日常和地球的画框) 已存在<br/>4、歌曲 カラノワレモノ (空之碎物) 已存在<br/>5、歌曲 さらってほしいの (希望你能把我带走) 已存在<br/>6、歌曲 モノカラー (黑白色彩) 已存在<br/>7、歌曲 RIVER FOG,CHOCOLATE BUTTERFLY 已存在<br/>8、歌曲 NOTOK 已存在<br/>9、歌曲 (W)HERE 已存在<br/>10、歌曲 癖 已存在<br/>11、歌曲 東京フラッシュ (东京闪景) 已存在<br/>12、歌曲 napori 已存在<br/>13、歌曲 踊り子 (舞女) 已存在<br/>14、歌曲 灯火 已存在<br/>15、歌曲 裸の勇者 (赤裸的勇士) 已存在<br/>16、歌曲 僕は今日も (今天我也) 已存在<br/>17、歌曲 不可幸力 已存在<br/>18、歌曲 走馬灯 已存在<br/>19、歌曲 恋風邪にのせて (患上恋爱感冒) 已存在<br/>20、歌曲 怪獣の唄 已存在<br/>21、歌曲 宮 已存在<br/>22、歌曲 花占い (花瓣占卜) 已存在<br/>23、歌曲 mabataki 已存在<br/>24、歌曲 HERO 已存在<br/>25、歌曲 風神 (日剧《狮子的藏身处》主题曲) 已存在<br/>26、歌曲 常熱 已存在<br/>27、歌曲 トドメの一撃 feat. Cory Wong 已存在<br/>28、歌曲 GORILLA SHIBAI (猿芝居) 已存在<br/>29、歌曲 逃避行 (逃避之旅) 已存在<br/>30、歌曲 断面 (日剧《教祖之女》主题曲) 已存在<br/>31、歌曲 王 已存在<br/>32、歌曲 ダークルーム（暗室） 已存在<br/>33、歌曲 ＆疾走 已存在<br/>34、歌曲 呆然 已存在<br/>35、歌曲 愛がすべて (爱即是一切 / All I need is love) 已存在<br/>36、歌曲 ラブレス (LOVELESS/爱恋失格) 已存在<br/>37、歌曲 天国 已存在<br/>38、歌曲 芝居の終焉 (戏剧的尽头) 已存在<br/>39、歌曲 寄り酔い (倚醉) 已存在<br/>40、歌曲 ブラウニー (布朗尼 Brownie) 已存在<br/>41、歌曲 イージーゲーム (Easy Game) 已存在<br/>42、歌曲 The Fog 已存在<br/>43、歌曲 ビーユアセルフ (做你自己 Be Yourself) 已存在<br/>44、歌曲 進め！そっちだ！ (auお正月新CM) 已存在<br/>45、歌曲 シュガーロス 已存在<br/>46、歌曲 泡沫 已存在<br/>47、歌曲 まだ浅はか (feat. 和ぬか) 已存在<br/>48、歌曲 アイオクレ 已存在<br/>49、歌曲 アミ (日剧《妖怪合租屋》主题曲) 已存在<br/>50、歌曲 ラブの逃走 (爱意逃亡) 已存在<br/>51、歌曲 ロックでキス 已存在<br/>52、歌曲 真っ裸 已存在<br/>53、歌曲 ミカヅキ (新月) 已存在<br/>54、歌曲 フラレガイガール (被甩男女) 已存在<br/>55、歌曲 光と闇 (光与暗) 已存在<br/>56、歌曲 十億年 已存在<br/>57、歌曲 さよーならあなた 已存在<br/>58、歌曲 エメラルド 已存在<br/>59、歌曲 かみつきたい 已存在<br/>60、歌曲 アーケード (拱廊) 已存在<br/>61、歌曲 朝になって夢からさめて 已存在<br/>62、歌曲 祝日 已存在<br/>63、歌曲 湯船 已存在<br/>64、歌曲 あなたは煙草 私はシャボン(你是烟草 我是泡沫) 已存在<br/>65、歌曲 水星 已存在<br/>66、歌曲 サーカスナイト 已存在<br/>67、歌曲 202 (New Mix) 已存在<br/>68、歌曲 ルミネセンス 已存在<br/>69、歌曲 はじめまして 已存在<br/>70、歌曲 私の好きなもの (我喜欢的东西) 已存在<br/>71、歌曲 わたしのうた 已存在<br/>72、歌曲 笑い話 已存在<br/>73、歌曲 サターン (土星) 已存在<br/>74、歌曲 グラスとラムレーズン 已存在<br/>75、歌曲 Ham 已存在<br/>76、歌曲 君がいて水になる (有你在即可化成水) 已存在<br/>77、歌曲 またね幻 (再会，幻) 已存在<br/>78、歌曲 ばかじゃないのに (虚心若愚) 已存在<br/>79、歌曲 Dea', '2026-03-19 19:35:29', 2943);
INSERT INTO `sys_oper_log` VALUES (224, '歌单管理', 6, 'com.ruoyi.songList.controller.SongListController.importData()', 'POST', 1, 'ry', '主播', '/songList/info/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 490 条数据格式不正确，错误如下：<br/>1、歌曲 SLEEPWALK 已存在<br/>2、歌曲 フユノ(冬野) 已存在<br/>3、歌曲 日常と地球の額縁 (日常和地球的画框) 已存在<br/>4、歌曲 カラノワレモノ (空之碎物) 已存在<br/>5、歌曲 さらってほしいの (希望你能把我带走) 已存在<br/>6、歌曲 モノカラー (黑白色彩) 已存在<br/>7、歌曲 RIVER FOG,CHOCOLATE BUTTERFLY 已存在<br/>8、歌曲 NOTOK 已存在<br/>9、歌曲 (W)HERE 已存在<br/>10、歌曲 癖 已存在<br/>11、歌曲 東京フラッシュ (东京闪景) 已存在<br/>12、歌曲 napori 已存在<br/>13、歌曲 踊り子 (舞女) 已存在<br/>14、歌曲 灯火 已存在<br/>15、歌曲 裸の勇者 (赤裸的勇士) 已存在<br/>16、歌曲 僕は今日も (今天我也) 已存在<br/>17、歌曲 不可幸力 已存在<br/>18、歌曲 走馬灯 已存在<br/>19、歌曲 恋風邪にのせて (患上恋爱感冒) 已存在<br/>20、歌曲 怪獣の唄 已存在<br/>21、歌曲 宮 已存在<br/>22、歌曲 花占い (花瓣占卜) 已存在<br/>23、歌曲 mabataki 已存在<br/>24、歌曲 HERO 已存在<br/>25、歌曲 風神 (日剧《狮子的藏身处》主题曲) 已存在<br/>26、歌曲 常熱 已存在<br/>27、歌曲 トドメの一撃 feat. Cory Wong 已存在<br/>28、歌曲 GORILLA SHIBAI (猿芝居) 已存在<br/>29、歌曲 逃避行 (逃避之旅) 已存在<br/>30、歌曲 断面 (日剧《教祖之女》主题曲) 已存在<br/>31、歌曲 王 已存在<br/>32、歌曲 ダークルーム（暗室） 已存在<br/>33、歌曲 ＆疾走 已存在<br/>34、歌曲 呆然 已存在<br/>35、歌曲 愛がすべて (爱即是一切 / All I need is love) 已存在<br/>36、歌曲 ラブレス (LOVELESS/爱恋失格) 已存在<br/>37、歌曲 天国 已存在<br/>38、歌曲 芝居の終焉 (戏剧的尽头) 已存在<br/>39、歌曲 寄り酔い (倚醉) 已存在<br/>40、歌曲 ブラウニー (布朗尼 Brownie) 已存在<br/>41、歌曲 イージーゲーム (Easy Game) 已存在<br/>42、歌曲 The Fog 已存在<br/>43、歌曲 ビーユアセルフ (做你自己 Be Yourself) 已存在<br/>44、歌曲 進め！そっちだ！ (auお正月新CM) 已存在<br/>45、歌曲 シュガーロス 已存在<br/>46、歌曲 泡沫 已存在<br/>47、歌曲 まだ浅はか (feat. 和ぬか) 已存在<br/>48、歌曲 アイオクレ 已存在<br/>49、歌曲 アミ (日剧《妖怪合租屋》主题曲) 已存在<br/>50、歌曲 ラブの逃走 (爱意逃亡) 已存在<br/>51、歌曲 ロックでキス 已存在<br/>52、歌曲 真っ裸 已存在<br/>53、歌曲 ミカヅキ (新月) 已存在<br/>54、歌曲 フラレガイガール (被甩男女) 已存在<br/>55、歌曲 光と闇 (光与暗) 已存在<br/>56、歌曲 十億年 已存在<br/>57、歌曲 さよーならあなた 已存在<br/>58、歌曲 エメラルド 已存在<br/>59、歌曲 かみつきたい 已存在<br/>60、歌曲 アーケード (拱廊) 已存在<br/>61、歌曲 朝になって夢からさめて 已存在<br/>62、歌曲 祝日 已存在<br/>63、歌曲 湯船 已存在<br/>64、歌曲 あなたは煙草 私はシャボン(你是烟草 我是泡沫) 已存在<br/>65、歌曲 水星 已存在<br/>66、歌曲 サーカスナイト 已存在<br/>67、歌曲 202 (New Mix) 已存在<br/>68、歌曲 ルミネセンス 已存在<br/>69、歌曲 はじめまして 已存在<br/>70、歌曲 私の好きなもの (我喜欢的东西) 已存在<br/>71、歌曲 わたしのうた 已存在<br/>72、歌曲 笑い話 已存在<br/>73、歌曲 サターン (土星) 已存在<br/>74、歌曲 グラスとラムレーズン 已存在<br/>75、歌曲 Ham 已存在<br/>76、歌曲 君がいて水になる (有你在即可化成水) 已存在<br/>77、歌曲 またね幻 (再会，幻) 已存在<br/>78、歌曲 ばかじゃないのに (虚心若愚) 已存在<br/>79、歌曲 Dea', '2026-03-19 19:42:36', 67423);
INSERT INTO `sys_oper_log` VALUES (225, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '管理员', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2026-02-24 20:59:02\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-19 20:00:56', 34);
INSERT INTO `sys_oper_log` VALUES (226, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '管理员', '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"2\",\"userId\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-19 20:03:14', 30);
INSERT INTO `sys_oper_log` VALUES (227, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '管理员', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"songList/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"外部访问歌单\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"songlist\",\"routeName\":\"songlist\",\"status\":\"0\",\"visible\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-19 21:17:50', 29);
INSERT INTO `sys_oper_log` VALUES (228, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '管理员', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"songList/index\",\"createTime\":\"2026-03-19 21:17:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"外部访问歌单\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"songlist\",\"perms\":\"\",\"routeName\":\"songlist\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-19 21:18:01', 17);
INSERT INTO `sys_oper_log` VALUES (229, '歌单管理', 6, 'com.ruoyi.songList.controller.SongListController.importData()', 'POST', 1, 'admin', '管理员', '/songList/info/importData', '127.0.0.1', '内网IP', '', '{\"msg\":\"恭喜您，数据已全部导入成功！共新增 0 条，更新 486 条，数据如下：<br/>1、歌曲 SLEEPWALK 更新成功<br/>2、歌曲 フユノ(冬野) 更新成功<br/>3、歌曲 日常と地球の額縁 (日常和地球的画框) 更新成功<br/>4、歌曲 カラノワレモノ (空之碎物) 更新成功<br/>5、歌曲 さらってほしいの (希望你能把我带走) 更新成功<br/>6、歌曲 モノカラー (黑白色彩) 更新成功<br/>7、歌曲 RIVER FOG,CHOCOLATE BUTTERFLY 更新成功<br/>8、歌曲 NOTOK 更新成功<br/>9、歌曲 (W)HERE 更新成功<br/>10、歌曲 癖 更新成功<br/>11、歌曲 東京フラッシュ (东京闪景) 更新成功<br/>12、歌曲 napori 更新成功<br/>13、歌曲 踊り子 (舞女) 更新成功<br/>14、歌曲 灯火 更新成功<br/>15、歌曲 裸の勇者 (赤裸的勇士) 更新成功<br/>16、歌曲 僕は今日も (今天我也) 更新成功<br/>17、歌曲 不可幸力 更新成功<br/>18、歌曲 走馬灯 更新成功<br/>19、歌曲 恋風邪にのせて (患上恋爱感冒) 更新成功<br/>20、歌曲 怪獣の唄 更新成功<br/>21、歌曲 宮 更新成功<br/>22、歌曲 花占い (花瓣占卜) 更新成功<br/>23、歌曲 mabataki 更新成功<br/>24、歌曲 HERO 更新成功<br/>25、歌曲 風神 (日剧《狮子的藏身处》主题曲) 更新成功<br/>26、歌曲 常熱 更新成功<br/>27、歌曲 トドメの一撃 feat. Cory Wong 更新成功<br/>28、歌曲 GORILLA SHIBAI (猿芝居) 更新成功<br/>29、歌曲 逃避行 (逃避之旅) 更新成功<br/>30、歌曲 断面 (日剧《教祖之女》主题曲) 更新成功<br/>31、歌曲 王 更新成功<br/>32、歌曲 ダークルーム（暗室） 更新成功<br/>33、歌曲 ＆疾走 更新成功<br/>34、歌曲 呆然 更新成功<br/>35、歌曲 愛がすべて (爱即是一切 / All I need is love) 更新成功<br/>36、歌曲 ラブレス (LOVELESS/爱恋失格) 更新成功<br/>37、歌曲 天国 更新成功<br/>38、歌曲 芝居の終焉 (戏剧的尽头) 更新成功<br/>39、歌曲 寄り酔い (倚醉) 更新成功<br/>40、歌曲 ブラウニー (布朗尼 Brownie) 更新成功<br/>41、歌曲 イージーゲーム (Easy Game) 更新成功<br/>42、歌曲 The Fog 更新成功<br/>43、歌曲 ビーユアセルフ (做你自己 Be Yourself) 更新成功<br/>44、歌曲 進め！そっちだ！ (auお正月新CM) 更新成功<br/>45、歌曲 シュガーロス 更新成功<br/>46、歌曲 泡沫 更新成功<br/>47、歌曲 まだ浅はか (feat. 和ぬか) 更新成功<br/>48、歌曲 アイオクレ 更新成功<br/>49、歌曲 アミ (日剧《妖怪合租屋》主题曲) 更新成功<br/>50、歌曲 ラブの逃走 (爱意逃亡) 更新成功<br/>51、歌曲 ロックでキス 更新成功<br/>52、歌曲 真っ裸 更新成功<br/>53、歌曲 ミカヅキ (新月) 更新成功<br/>54、歌曲 フラレガイガール (被甩男女) 更新成功<br/>55、歌曲 光と闇 (光与暗) 更新成功<br/>56、歌曲 十億年 更新成功<br/>57、歌曲 さよーならあなた 更新成功<br/>58、歌曲 エメラルド 更新成功<br/>59、歌曲 かみつきたい 更新成功<br/>60、歌曲 アーケード (拱廊) 更新成功<br/>61、歌曲 朝になって夢からさめて 更新成功<br/>62、歌曲 祝日 更新成功<br/>63、歌曲 湯船 更新成功<br/>64、歌曲 あなたは煙草 私はシャボン(你是烟草 我是泡沫) 更新成功<br/>65、歌曲 水星 更新成功<br/>66、歌曲 サーカスナイト 更新成功<br/>67、歌曲 202 (New Mix) 更新成功<br/>68、歌曲 ルミネセンス 更新成功<br/>69、歌曲 はじめまして 更新成功<br/>70、歌曲 私の好きなもの (我喜欢的东西) 更新成功<br/>71、歌曲 わたしのうた 更新成功<br/>72、歌曲 笑い話 更新成功<br/>73、歌曲 サターン (土星) 更新成功<br/>74、歌曲 グラスとラムレーズン 更新成功<br/>75、歌曲 Ham 更新成功<br/>76、歌曲 君がい', 0, NULL, '2026-03-21 20:50:09', 3647);
INSERT INTO `sys_oper_log` VALUES (230, '歌单管理', 6, 'com.ruoyi.songList.controller.SongListController.importData()', 'POST', 1, 'test', NULL, '/songList/info/importData', '127.0.0.1', '内网IP', '', '{\"msg\":\"恭喜您，数据已全部导入成功！共新增 486 条，更新 0 条，数据如下：<br/>1、歌曲 SLEEPWALK 导入成功<br/>2、歌曲 フユノ(冬野) 导入成功<br/>3、歌曲 日常と地球の額縁 (日常和地球的画框) 导入成功<br/>4、歌曲 カラノワレモノ (空之碎物) 导入成功<br/>5、歌曲 さらってほしいの (希望你能把我带走) 导入成功<br/>6、歌曲 モノカラー (黑白色彩) 导入成功<br/>7、歌曲 RIVER FOG,CHOCOLATE BUTTERFLY 导入成功<br/>8、歌曲 NOTOK 导入成功<br/>9、歌曲 (W)HERE 导入成功<br/>10、歌曲 癖 导入成功<br/>11、歌曲 東京フラッシュ (东京闪景) 导入成功<br/>12、歌曲 napori 导入成功<br/>13、歌曲 踊り子 (舞女) 导入成功<br/>14、歌曲 灯火 导入成功<br/>15、歌曲 裸の勇者 (赤裸的勇士) 导入成功<br/>16、歌曲 僕は今日も (今天我也) 导入成功<br/>17、歌曲 不可幸力 导入成功<br/>18、歌曲 走馬灯 导入成功<br/>19、歌曲 恋風邪にのせて (患上恋爱感冒) 导入成功<br/>20、歌曲 怪獣の唄 导入成功<br/>21、歌曲 宮 导入成功<br/>22、歌曲 花占い (花瓣占卜) 导入成功<br/>23、歌曲 mabataki 导入成功<br/>24、歌曲 HERO 导入成功<br/>25、歌曲 風神 (日剧《狮子的藏身处》主题曲) 导入成功<br/>26、歌曲 常熱 导入成功<br/>27、歌曲 トドメの一撃 feat. Cory Wong 导入成功<br/>28、歌曲 GORILLA SHIBAI (猿芝居) 导入成功<br/>29、歌曲 逃避行 (逃避之旅) 导入成功<br/>30、歌曲 断面 (日剧《教祖之女》主题曲) 导入成功<br/>31、歌曲 王 导入成功<br/>32、歌曲 ダークルーム（暗室） 导入成功<br/>33、歌曲 ＆疾走 导入成功<br/>34、歌曲 呆然 导入成功<br/>35、歌曲 愛がすべて (爱即是一切 / All I need is love) 导入成功<br/>36、歌曲 ラブレス (LOVELESS/爱恋失格) 导入成功<br/>37、歌曲 天国 导入成功<br/>38、歌曲 芝居の終焉 (戏剧的尽头) 导入成功<br/>39、歌曲 寄り酔い (倚醉) 导入成功<br/>40、歌曲 ブラウニー (布朗尼 Brownie) 导入成功<br/>41、歌曲 イージーゲーム (Easy Game) 导入成功<br/>42、歌曲 The Fog 导入成功<br/>43、歌曲 ビーユアセルフ (做你自己 Be Yourself) 导入成功<br/>44、歌曲 進め！そっちだ！ (auお正月新CM) 导入成功<br/>45、歌曲 シュガーロス 导入成功<br/>46、歌曲 泡沫 导入成功<br/>47、歌曲 まだ浅はか (feat. 和ぬか) 导入成功<br/>48、歌曲 アイオクレ 导入成功<br/>49、歌曲 アミ (日剧《妖怪合租屋》主题曲) 导入成功<br/>50、歌曲 ラブの逃走 (爱意逃亡) 导入成功<br/>51、歌曲 ロックでキス 导入成功<br/>52、歌曲 真っ裸 导入成功<br/>53、歌曲 ミカヅキ (新月) 导入成功<br/>54、歌曲 フラレガイガール (被甩男女) 导入成功<br/>55、歌曲 光と闇 (光与暗) 导入成功<br/>56、歌曲 十億年 导入成功<br/>57、歌曲 さよーならあなた 导入成功<br/>58、歌曲 エメラルド 导入成功<br/>59、歌曲 かみつきたい 导入成功<br/>60、歌曲 アーケード (拱廊) 导入成功<br/>61、歌曲 朝になって夢からさめて 导入成功<br/>62、歌曲 祝日 导入成功<br/>63、歌曲 湯船 导入成功<br/>64、歌曲 あなたは煙草 私はシャボン(你是烟草 我是泡沫) 导入成功<br/>65、歌曲 水星 导入成功<br/>66、歌曲 サーカスナイト 导入成功<br/>67、歌曲 202 (New Mix) 导入成功<br/>68、歌曲 ルミネセンス 导入成功<br/>69、歌曲 はじめまして 导入成功<br/>70、歌曲 私の好きなもの (我喜欢的东西) 导入成功<br/>71、歌曲 わたしのうた 导入成功<br/>72、歌曲 笑い話 导入成功<br/>73、歌曲 サターン (土星) 导入成功<br/>74、歌曲 グラスとラムレーズン 导入成功<br/>75、歌曲 Ham 导入成功<br/>76、歌曲 君がい', 0, NULL, '2026-03-21 21:02:51', 4796);
INSERT INTO `sys_oper_log` VALUES (231, '歌单显示列配置', 2, 'com.ruoyi.songList.controller.SongListController.saveShowColumns()', 'POST', 1, 'test', NULL, '/songList/info/saveShowColumns', '127.0.0.1', '内网IP', '[\"musicName\",\"singer\"] ', '{\"msg\":\"显示列配置保存成功\",\"code\":200}', 0, NULL, '2026-03-21 21:06:43', 18);
INSERT INTO `sys_oper_log` VALUES (232, '歌单显示列配置', 2, 'com.ruoyi.songList.controller.SongListController.saveShowColumns()', 'POST', 1, 'test', NULL, '/songList/info/saveShowColumns', '127.0.0.1', '内网IP', '[\"musicName\",\"singer\",\"language\"] ', '{\"msg\":\"显示列配置保存成功\",\"code\":200}', 0, NULL, '2026-03-21 21:06:53', 8);
INSERT INTO `sys_oper_log` VALUES (233, '歌单显示列配置', 2, 'com.ruoyi.songList.controller.SongListController.saveShowColumns()', 'POST', 1, 'test', NULL, '/songList/info/saveShowColumns', '127.0.0.1', '内网IP', '[\"musicName\"] ', '{\"msg\":\"显示列配置保存成功\",\"code\":200}', 0, NULL, '2026-03-21 21:09:56', 8);
INSERT INTO `sys_oper_log` VALUES (234, '歌单显示列配置', 2, 'com.ruoyi.songList.controller.SongListController.saveShowColumns()', 'POST', 1, 'test', NULL, '/songList/info/saveShowColumns', '127.0.0.1', '内网IP', '[\"musicName\",\"singer\",\"language\"] ', '{\"msg\":\"显示列配置保存成功\",\"code\":200}', 0, NULL, '2026-03-21 21:10:30', 8);
INSERT INTO `sys_oper_log` VALUES (235, '歌单显示列配置', 2, 'com.ruoyi.songList.controller.SongListController.saveShowColumns()', 'POST', 1, 'test', NULL, '/songList/info/saveShowColumns', '127.0.0.1', '内网IP', '[\"musicName\",\"singer\",\"language\",\"musicalStyle\",\"pay\",\"songSlice\",\"remark\"] ', '{\"msg\":\"显示列配置保存成功\",\"code\":200}', 0, NULL, '2026-03-21 21:13:56', 11);
INSERT INTO `sys_oper_log` VALUES (236, '歌单显示列配置', 2, 'com.ruoyi.songList.controller.SongListController.saveShowColumns()', 'POST', 1, 'test', NULL, '/songList/info/saveShowColumns', '127.0.0.1', '内网IP', '[\"musicName\",\"singer\"] ', '{\"msg\":\"显示列配置保存成功\",\"code\":200}', 0, NULL, '2026-03-21 21:14:18', 9);
INSERT INTO `sys_oper_log` VALUES (237, '歌单', 2, 'com.ruoyi.songList.controller.SongListController.edit()', 'PUT', 1, 'test', NULL, '/songList/info', '127.0.0.1', '内网IP', '{\"exclusiveLevel\":\"1\",\"firstLetter\":\"S\",\"gift\":\"{\\\"id\\\":25,\\\"name\\\":\\\"重拳出击\\\",\\\"price\\\":\\\"19.9\\\"}\",\"id\":1459,\"language\":\"2\",\"musicName\":\"SLEEPWALK\",\"musicalStyle\":\"11\",\"pay\":\"30\",\"remark\":\"\",\"singer\":\"ヒトリエ\",\"songSlice\":\"1\",\"uploader\":\"3\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-21 22:56:52', 21);
INSERT INTO `sys_oper_log` VALUES (238, '歌单', 2, 'com.ruoyi.songList.controller.SongListController.edit()', 'PUT', 1, 'test', NULL, '/songList/info', '127.0.0.1', '内网IP', '{\"firstLetter\":\"#\",\"gift\":\"{\\\"id\\\":25,\\\"name\\\":\\\"重拳出击\\\",\\\"price\\\":\\\"19.9\\\"}\",\"id\":1460,\"language\":\"2\",\"musicName\":\"フユノ(冬野)\",\"musicalStyle\":\"10\",\"remark\":\"\",\"singer\":\"ヒトリエ\",\"songSlice\":\"\",\"uploader\":\"3\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-21 22:57:12', 11);
INSERT INTO `sys_oper_log` VALUES (239, '歌单', 2, 'com.ruoyi.songList.controller.SongListController.edit()', 'PUT', 1, 'test', NULL, '/songList/info', '127.0.0.1', '内网IP', '{\"exclusiveLevel\":\"1\",\"firstLetter\":\"S\",\"gift\":\"{\\\"name\\\":\\\"重拳出击\\\",\\\"price\\\":\\\"19.9\\\"}\",\"id\":1459,\"language\":\"2\",\"musicName\":\"SLEEPWALK\",\"musicalStyle\":\"11\",\"pay\":\"30\",\"remark\":\"\",\"singer\":\"ヒトリエ\",\"songSlice\":\"1\",\"uploader\":\"3\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-21 23:00:07', 13);
INSERT INTO `sys_oper_log` VALUES (240, '歌单', 2, 'com.ruoyi.songList.controller.SongListController.edit()', 'PUT', 1, 'test', NULL, '/songList/info', '127.0.0.1', '内网IP', '{\"exclusiveLevel\":\"1\",\"firstLetter\":\"R\",\"gift\":\"{\\\"id\\\":25,\\\"name\\\":\\\"重拳出击\\\",\\\"price\\\":\\\"19.9\\\",\\\"icon\\\":\\\"https://s1.hdslb.com/bfs/live/53eca0815f8e628bd619a27628b1acbd57fc82b4.png\\\"}\",\"id\":1461,\"language\":\"2\",\"musicName\":\"日常と地球の額縁 (日常和地球的画框)\",\"musicalStyle\":\"12,13\",\"pay\":\"30\",\"remark\":\"\",\"singer\":\"ヒトリエ\",\"songSlice\":\"\",\"uploader\":\"3\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-21 23:00:12', 11);
INSERT INTO `sys_oper_log` VALUES (241, '歌单', 2, 'com.ruoyi.songList.controller.SongListController.edit()', 'PUT', 1, 'test', NULL, '/songList/info', '127.0.0.1', '内网IP', '{\"firstLetter\":\"#\",\"gift\":\"{\\\"id\\\":25,\\\"name\\\":\\\"重拳出击\\\",\\\"price\\\":\\\"19.9\\\",\\\"icon\\\":\\\"https://s1.hdslb.com/bfs/live/53eca0815f8e628bd619a27628b1acbd57fc82b4.png\\\"}\",\"id\":1460,\"language\":\"2\",\"musicName\":\"フユノ(冬野)\",\"musicalStyle\":\"10\",\"remark\":\"\",\"singer\":\"ヒトリエ\",\"songSlice\":\"\",\"uploader\":\"3\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-21 23:00:19', 9);
INSERT INTO `sys_oper_log` VALUES (242, '歌单', 2, 'com.ruoyi.songList.controller.SongListController.edit()', 'PUT', 1, 'test', NULL, '/songList/info', '127.0.0.1', '内网IP', '{\"exclusiveLevel\":\"1\",\"firstLetter\":\"S\",\"gift\":\"{\\\"id\\\":25,\\\"name\\\":\\\"重拳出击\\\",\\\"price\\\":\\\"19.9\\\",\\\"icon\\\":\\\"https://s1.hdslb.com/bfs/live/53eca0815f8e628bd619a27628b1acbd57fc82b4.png\\\"}\",\"id\":1459,\"language\":\"2\",\"musicName\":\"SLEEPWALK\",\"musicalStyle\":\"11\",\"pay\":\"30\",\"remark\":\"\",\"singer\":\"ヒトリエ\",\"songSlice\":\"1\",\"uploader\":\"3\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-21 23:00:24', 13);
INSERT INTO `sys_oper_log` VALUES (243, '歌单', 2, 'com.ruoyi.songList.controller.SongListController.edit()', 'PUT', 1, 'test', NULL, '/songList/info', '127.0.0.1', '内网IP', '{\"firstLetter\":\"#\",\"id\":1464,\"language\":\"2\",\"musicName\":\"モノカラー (黑白色彩)\",\"musicalStyle\":\"\",\"remark\":\"\",\"singer\":\"ヒトリエ\",\"songSlice\":\"\",\"uploader\":\"3\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-21 23:01:09', 7);
INSERT INTO `sys_oper_log` VALUES (244, '歌单', 2, 'com.ruoyi.songList.controller.SongListController.edit()', 'PUT', 1, 'test', NULL, '/songList/info', '127.0.0.1', '内网IP', '{\"firstLetter\":\"#\",\"id\":1464,\"language\":\"2\",\"musicName\":\"モノカラー (黑白色彩)\",\"musicalStyle\":\"[[\\\"pitch_category\\\",\\\"高音\\\"],[\\\"pitch_category\\\",\\\"中音\\\"],[\\\"pitch_category\\\",\\\"低音\\\"]]\",\"newMusicalStyle\":\"[[\\\"pitch_category\\\",\\\"高音\\\"],[\\\"pitch_category\\\",\\\"中音\\\"],[\\\"pitch_category\\\",\\\"低音\\\"]]\",\"remark\":\"\",\"singer\":\"ヒトリエ\",\"songSlice\":\"\",\"uploader\":\"3\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-21 23:01:59', 61);
INSERT INTO `sys_oper_log` VALUES (245, '歌单', 2, 'com.ruoyi.songList.controller.SongListController.edit()', 'PUT', 1, 'test', NULL, '/songList/info', '127.0.0.1', '内网IP', '{\"firstLetter\":\"#\",\"id\":1464,\"language\":\"2\",\"musicName\":\"モノカラー (黑白色彩)\",\"musicalStyle\":\"[[\\\"pitch_category\\\",\\\"高音\\\"],[\\\"pitch_category\\\",\\\"中音\\\"],[\\\"pitch_category\\\",\\\"低音\\\"]]\",\"newMusicalStyle\":\"[[\\\"pitch_category\\\",\\\"高音\\\"],[\\\"pitch_category\\\",\\\"中音\\\"],[\\\"pitch_category\\\",\\\"低音\\\"]]\",\"remark\":\"\",\"singer\":\"ヒトリエ\",\"songSlice\":\"\",\"uploader\":\"3\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-21 23:05:23', 33649);
INSERT INTO `sys_oper_log` VALUES (246, '歌单', 2, 'com.ruoyi.songList.controller.SongListController.edit()', 'PUT', 1, 'test', NULL, '/songList/info', '127.0.0.1', '内网IP', '{\"firstLetter\":\"#\",\"id\":1464,\"language\":\"2\",\"musicName\":\"モノカラー (黑白色彩)\",\"musicalStyle\":\"[[\\\"pitch_category\\\",\\\"高音\\\"],[\\\"pitch_category\\\",\\\"中音\\\"],[\\\"pitch_category\\\",\\\"低音\\\"]]\",\"newMusicalStyle\":\"[[\\\"pitch_category\\\",\\\"高音\\\"],[\\\"pitch_category\\\",\\\"中音\\\"],[\\\"pitch_category\\\",\\\"低音\\\"]]\",\"remark\":\"\",\"singer\":\"ヒトリエ\",\"songSlice\":\"\",\"uploader\":\"3\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-21 23:08:01', 52578);
INSERT INTO `sys_oper_log` VALUES (247, '歌单显示列配置', 2, 'com.ruoyi.songList.controller.SongListController.saveShowColumns()', 'POST', 1, 'test', NULL, '/songList/info/saveShowColumns', '127.0.0.1', '内网IP', '[\"musicName\",\"singer\",\"musicalStyle\"] ', '{\"msg\":\"显示列配置保存成功\",\"code\":200}', 0, NULL, '2026-03-21 23:41:49', 11);
INSERT INTO `sys_oper_log` VALUES (248, '歌单', 2, 'com.ruoyi.songList.controller.SongListController.edit()', 'PUT', 1, 'test', NULL, '/songList/info', '127.0.0.1', '内网IP', '{\"exclusiveLevel\":\"1\",\"firstLetter\":\"S\",\"gift\":\"{\\\"name\\\":\\\"重拳出击\\\",\\\"price\\\":\\\"19.9\\\",\\\"icon\\\":\\\"https://s1.hdslb.com/bfs/live/53eca0815f8e628bd619a27628b1acbd57fc82b4.png\\\"}\",\"id\":1459,\"language\":\"2\",\"musicName\":\"SLEEPWALK\",\"musicalStyle\":\"[[\\\"common_category\\\",\\\"流行\\\"],[\\\"common_category\\\",\\\"古风\\\"],[\\\"common_category\\\",\\\"国风\\\"],[\\\"common_category\\\",\\\"ACG\\\"],[\\\"common_category\\\",\\\"V家\\\"],[\\\"common_category\\\",\\\"东方\\\"],[\\\"common_category\\\",\\\"经典\\\"],[\\\"common_category\\\",\\\"怀旧\\\"],[\\\"common_category\\\",\\\"民谣\\\"],[\\\"common_category\\\",\\\"民族\\\"],[\\\"common_category\\\",\\\"美声\\\"],[\\\"common_category\\\",\\\"爵士\\\"],[\\\"common_category\\\",\\\"摇滚\\\"],[\\\"common_category\\\",\\\"电子\\\"],[\\\"common_category\\\",\\\"金属\\\"],[\\\"common_category\\\",\\\"戏腔\\\"],[\\\"common_category\\\",\\\"RAP\\\"],[\\\"common_category\\\",\\\"儿歌\\\"],[\\\"common_category\\\",\\\"整活\\\"],[\\\"common_category\\\",\\\"可爱\\\"],[\\\"common_category\\\",\\\"治愈\\\"],[\\\"common_category\\\",\\\"温柔\\\"],[\\\"common_category\\\",\\\"活泼\\\"],[\\\"common_category\\\",\\\"悲伤\\\"],[\\\"common_category\\\",\\\"空灵\\\"],[\\\"common_category\\\",\\\"童年回忆\\\"],[\\\"common_category\\\",\\\"OST\\\"],[\\\"common_category\\\",\\\"动漫\\\"],[\\\"common_category\\\",\\\"影视金曲\\\"],[\\\"common_category\\\",\\\"游戏\\\"],[\\\"common_category\\\",\\\"原创曲\\\"],[\\\"common_category\\\",\\\"弹唱\\\"],[\\\"common_category\\\",\\\"合唱\\\"],[\\\"common_category\\\",\\\"舞曲\\\"],[\\\"common_category\\\",\\\"偶像\\\"],[\\\"common_category\\\",\\\"音乐剧\\\"],[\\\"common_category\\\",\\\"哥特\\\"],[\\\"common_category\\\",\\\"特摄\\\"],[\\\"common_category\\\",\\\"说唱\\\"],[\\\"common_category\\\",\\\"喊麦\\\"],[\\\"common_category\\\",\\\"配音\\\"],[\\\"common_category\\\",\\\"方言\\\"],[\\\"common_category\\\",\\\"约德尔\\\"],[\\\"common_category\\\",\\\"其他\\\"]]\",\"newMusicalStyle\":\"[[\\\"common_category\\\",\\\"流行\\\"],[\\\"common_category\\\",\\\"古风\\\"],[\\\"common_category\\\",\\\"国风\\\"],[\\\"common_category\\\",\\\"ACG\\\"],[\\\"common_category\\\",\\\"V家\\\"],[\\\"common_category\\\",\\\"东方\\\"],[\\\"common_category\\\",\\\"经典\\\"],[\\\"common_category\\\",\\\"怀旧\\\"],[\\\"common_category\\\",\\\"民谣\\\"],[\\\"common_category\\\",\\\"民族\\\"],[\\\"common_category\\\",\\\"美声\\\"],[\\\"common_category\\\",\\\"爵士\\\"],[\\\"common_category\\\",\\\"摇滚\\\"],[\\\"common_category\\\",\\\"电子\\\"],[\\\"common_category\\\",\\\"金属\\\"],[\\\"common_cate', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'musical_style\' at row 1\r\n### The error may exist in file [C:\\Proj\\RuoYi\\RuoYi-Api\\ruoyi-songList\\target\\classes\\mapper\\songList\\SongListMapper.xml]\r\n### The error may involve com.ruoyi.songList.mapper.SongListMapper.updateSongList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update song_list          SET music_name = ?,             singer = ?,             language = ?,             musical_style = ?,             pay = ?,             exclusive_level = ?,             gift = ?,             song_slice = ?,             remark = ?,             uploader = ?,             first_letter = ?          where id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'musical_style\' at row 1\n; Data truncation: Data too long for column \'musical_style\' at row 1', '2026-03-21 23:50:32', 189);
INSERT INTO `sys_oper_log` VALUES (249, '歌单', 2, 'com.ruoyi.songList.controller.SongListController.edit()', 'PUT', 1, 'test', NULL, '/songList/info', '127.0.0.1', '内网IP', '{\"exclusiveLevel\":\"1\",\"firstLetter\":\"S\",\"gift\":\"{\\\"name\\\":\\\"重拳出击\\\",\\\"price\\\":\\\"19.9\\\",\\\"icon\\\":\\\"https://s1.hdslb.com/bfs/live/53eca0815f8e628bd619a27628b1acbd57fc82b4.png\\\"}\",\"id\":1459,\"language\":\"2\",\"musicName\":\"SLEEPWALK\",\"musicalStyle\":\"[[\\\"common_category\\\",\\\"流行\\\"],[\\\"common_category\\\",\\\"古风\\\"],[\\\"common_category\\\",\\\"国风\\\"],[\\\"common_category\\\",\\\"ACG\\\"],[\\\"common_category\\\",\\\"V家\\\"],[\\\"common_category\\\",\\\"东方\\\"],[\\\"common_category\\\",\\\"经典\\\"],[\\\"common_category\\\",\\\"怀旧\\\"],[\\\"common_category\\\",\\\"民谣\\\"],[\\\"common_category\\\",\\\"民族\\\"],[\\\"common_category\\\",\\\"美声\\\"],[\\\"common_category\\\",\\\"爵士\\\"],[\\\"common_category\\\",\\\"摇滚\\\"],[\\\"common_category\\\",\\\"电子\\\"],[\\\"common_category\\\",\\\"金属\\\"],[\\\"common_category\\\",\\\"戏腔\\\"],[\\\"common_category\\\",\\\"RAP\\\"],[\\\"common_category\\\",\\\"儿歌\\\"],[\\\"common_category\\\",\\\"整活\\\"],[\\\"common_category\\\",\\\"可爱\\\"],[\\\"common_category\\\",\\\"治愈\\\"],[\\\"common_category\\\",\\\"温柔\\\"],[\\\"common_category\\\",\\\"活泼\\\"],[\\\"common_category\\\",\\\"悲伤\\\"],[\\\"common_category\\\",\\\"空灵\\\"],[\\\"common_category\\\",\\\"童年回忆\\\"],[\\\"common_category\\\",\\\"OST\\\"],[\\\"common_category\\\",\\\"动漫\\\"],[\\\"common_category\\\",\\\"影视金曲\\\"],[\\\"common_category\\\",\\\"游戏\\\"],[\\\"common_category\\\",\\\"原创曲\\\"],[\\\"common_category\\\",\\\"弹唱\\\"],[\\\"common_category\\\",\\\"合唱\\\"],[\\\"common_category\\\",\\\"舞曲\\\"],[\\\"common_category\\\",\\\"偶像\\\"],[\\\"common_category\\\",\\\"音乐剧\\\"],[\\\"common_category\\\",\\\"哥特\\\"],[\\\"common_category\\\",\\\"特摄\\\"],[\\\"common_category\\\",\\\"说唱\\\"],[\\\"common_category\\\",\\\"喊麦\\\"],[\\\"common_category\\\",\\\"配音\\\"],[\\\"common_category\\\",\\\"方言\\\"],[\\\"common_category\\\",\\\"约德尔\\\"],[\\\"common_category\\\",\\\"其他\\\"]]\",\"newMusicalStyle\":\"[[\\\"common_category\\\",\\\"流行\\\"],[\\\"common_category\\\",\\\"古风\\\"],[\\\"common_category\\\",\\\"国风\\\"],[\\\"common_category\\\",\\\"ACG\\\"],[\\\"common_category\\\",\\\"V家\\\"],[\\\"common_category\\\",\\\"东方\\\"],[\\\"common_category\\\",\\\"经典\\\"],[\\\"common_category\\\",\\\"怀旧\\\"],[\\\"common_category\\\",\\\"民谣\\\"],[\\\"common_category\\\",\\\"民族\\\"],[\\\"common_category\\\",\\\"美声\\\"],[\\\"common_category\\\",\\\"爵士\\\"],[\\\"common_category\\\",\\\"摇滚\\\"],[\\\"common_category\\\",\\\"电子\\\"],[\\\"common_category\\\",\\\"金属\\\"],[\\\"common_cate', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-21 23:51:11', 19);
INSERT INTO `sys_oper_log` VALUES (250, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '管理员', '/system/user/3', '127.0.0.1', '内网IP', '[3] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-30 20:15:33', 28);
INSERT INTO `sys_oper_log` VALUES (251, '歌单', 1, 'com.ruoyi.songList.controller.SongListController.add()', 'POST', 1, 'admin', '管理员', '/songList/info', '127.0.0.1', '内网IP', '{\"exclusiveLevel\":\"0\",\"language\":\"1\",\"musicalStyle\":\"[[\\\"common_category\\\",\\\"流行\\\"],[\\\"common_category\\\",\\\"古风\\\"],[\\\"common_category\\\",\\\"国风\\\"],[\\\"common_category\\\",\\\"ACG\\\"],[\\\"common_category\\\",\\\"V家\\\"],[\\\"common_category\\\",\\\"东方\\\"],[\\\"common_category\\\",\\\"经典\\\"],[\\\"common_category\\\",\\\"怀旧\\\"],[\\\"common_category\\\",\\\"民谣\\\"],[\\\"common_category\\\",\\\"民族\\\"],[\\\"common_category\\\",\\\"美声\\\"],[\\\"common_category\\\",\\\"爵士\\\"],[\\\"common_category\\\",\\\"摇滚\\\"],[\\\"common_category\\\",\\\"电子\\\"],[\\\"common_category\\\",\\\"金属\\\"],[\\\"common_category\\\",\\\"戏腔\\\"],[\\\"common_category\\\",\\\"RAP\\\"],[\\\"common_category\\\",\\\"儿歌\\\"],[\\\"common_category\\\",\\\"整活\\\"],[\\\"common_category\\\",\\\"可爱\\\"],[\\\"common_category\\\",\\\"治愈\\\"],[\\\"common_category\\\",\\\"温柔\\\"],[\\\"common_category\\\",\\\"活泼\\\"],[\\\"common_category\\\",\\\"悲伤\\\"],[\\\"common_category\\\",\\\"空灵\\\"],[\\\"common_category\\\",\\\"童年回忆\\\"],[\\\"common_category\\\",\\\"OST\\\"],[\\\"common_category\\\",\\\"动漫\\\"],[\\\"common_category\\\",\\\"影视金曲\\\"],[\\\"common_category\\\",\\\"游戏\\\"],[\\\"common_category\\\",\\\"原创曲\\\"],[\\\"common_category\\\",\\\"弹唱\\\"],[\\\"common_category\\\",\\\"合唱\\\"],[\\\"common_category\\\",\\\"舞曲\\\"],[\\\"common_category\\\",\\\"偶像\\\"],[\\\"common_category\\\",\\\"音乐剧\\\"],[\\\"common_category\\\",\\\"哥特\\\"],[\\\"common_category\\\",\\\"特摄\\\"],[\\\"common_category\\\",\\\"说唱\\\"],[\\\"common_category\\\",\\\"喊麦\\\"],[\\\"common_category\\\",\\\"配音\\\"],[\\\"common_category\\\",\\\"方言\\\"],[\\\"common_category\\\",\\\"约德尔\\\"],[\\\"common_category\\\",\\\"其他\\\"],[\\\"sound_category\\\",\\\"安静\\\"],[\\\"sound_category\\\",\\\"适中\\\"],[\\\"sound_category\\\",\\\"较吵\\\"],[\\\"pitch_category\\\",\\\"高音\\\"],[\\\"pitch_category\\\",\\\"中音\\\"],[\\\"pitch_category\\\",\\\"低音\\\"]]\",\"newMusicalStyle\":\"[[\\\"common_category\\\",\\\"流行\\\"],[\\\"common_category\\\",\\\"古风\\\"],[\\\"common_category\\\",\\\"国风\\\"],[\\\"common_category\\\",\\\"ACG\\\"],[\\\"common_category\\\",\\\"V家\\\"],[\\\"common_category\\\",\\\"东方\\\"],[\\\"common_category\\\",\\\"经典\\\"],[\\\"common_category\\\",\\\"怀旧\\\"],[\\\"common_category\\\",\\\"民谣\\\"],[\\\"common_category\\\",\\\"民族\\\"],[\\\"common_category\\\",\\\"美声\\\"],[\\\"common_category\\\",\\\"爵士\\\"],[\\\"common_category\\\",\\\"摇滚\\\"],[\\\"common_category\\\",\\\"电子\\\"],[\\\"common_category\\\",\\\"金属\\\"],[\\\"common_category\\\",\\\"戏腔\\\"],[\\\"co', '{\"msg\":\"歌曲 \'null\' 新增成功\",\"code\":200}', 0, NULL, '2026-03-30 21:47:01', 32);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2026-02-24 20:59:01', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2026-02-24 20:59:01', 'admin', '2026-03-19 19:32:35', '普通角色');

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
INSERT INTO `sys_role_dept` VALUES (2, 103);
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
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '超级管理员', '00', '18888888888@163.com', '18888888888', '0', '/profile/avatar/2026/03/15/847276882d154bd4b81b31274f8ab67e.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-03-30 21:46:34', '2026-02-24 20:59:01', 'admin', '2026-02-24 20:59:01', '', '2026-03-15 12:49:41', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-03-19 19:32:51', '2026-02-24 20:59:01', 'admin', '2026-02-24 20:59:01', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (3, NULL, 'test', 'test', '00', '', '', '0', '', '$2a$10$CaNBqJW7hMXuNx6Pdw2rpe0EY59wpAuBzJOeK4lRck9N3pe5u/VSa', '0', '2', '127.0.0.1', '2026-03-21 21:50:00', '2026-03-19 20:02:44', '', '2026-03-19 20:02:43', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (4, NULL, 'test1', 'test1', '00', '', '', '0', '', '$2a$10$ynXcFALLj4Ul4vlMLzKikOO1SGcAWsCOJaCD5PuSU7RWSehAJJyrK', '0', '0', '127.0.0.1', '2026-03-30 20:16:33', '2026-03-30 20:16:09', '', '2026-03-30 20:16:08', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (5, NULL, 'test123', 'test123', '00', '', '', '0', '', '$2a$10$z0k2efh46PTRNvmw8wyhEe6hQSnb8IASxRxjM3ZDPVK.4uCOAaGVC', '0', '0', '127.0.0.1', '2026-03-30 21:47:59', '2026-03-30 21:42:57', '', '2026-03-30 21:42:57', '', NULL, NULL);

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
INSERT INTO `sys_user_role` VALUES (4, 2);
INSERT INTO `sys_user_role` VALUES (5, 2);

-- ----------------------------
-- Table structure for user_extend_info
-- ----------------------------
DROP TABLE IF EXISTS `user_extend_info`;
CREATE TABLE `user_extend_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `uid` int NULL DEFAULT NULL COMMENT 'UID',
  `live_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '直播地址',
  `homepage_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人主页地址',
  `background_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '背景图选择',
  `background_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '背景主体色',
  `page_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网页标签标题',
  `main_prompt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主标题',
  `sub_prompt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '副标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_extend_info
-- ----------------------------
INSERT INTO `user_extend_info` VALUES (1, 1, 123, 'https://live.bilibili.com/24999?broadcast_type=0&is_room_feed=1&spm_id_from=333.1387.to_liveroom.0.click&live_from=86002', 'https://space.bilibili.com/31244832?spm_id_from=333.1007.0.0', '/profile//2026/03/15/30e7390d20e7495a9d15daa9d1f5687d.png', 'rgb(255, 215, 0)', '网页标签标题', '主标题', '副标题');
INSERT INTO `user_extend_info` VALUES (2, 5, 123, '123', '123', NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
