/*
 Navicat Premium Data Transfer

 Source Server         : 172.28.40.21_hrmhn
 Source Server Type    : MySQL
 Source Server Version : 100414 (10.4.14-MariaDB-log)
 Source Host           : 172.28.40.21:3306
 Source Schema         : cmm

 Target Server Type    : MySQL
 Target Server Version : 100414 (10.4.14-MariaDB-log)
 File Encoding         : 65001

 Date: 05/01/2026 15:48:19
*/

CREATE DATABASE IF NOT EXISTS cmm;
USE cmm;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alarm_system
-- ----------------------------
DROP TABLE IF EXISTS `alarm_system`;
CREATE TABLE `alarm_system`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `alarm_module` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `alarm_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `alarm_time` datetime NULL DEFAULT current_timestamp,
  `alarm_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of alarm_system
-- ----------------------------

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority`  (
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('ROLE_ADMIN');
INSERT INTO `authority` VALUES ('ROLE_USER');

-- ----------------------------
-- Table structure for call_command
-- ----------------------------
DROP TABLE IF EXISTS `call_command`;
CREATE TABLE `call_command`  (
  `meeting_detail_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meeting_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `layout` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `speaking` bit(1) NULL DEFAULT b'0',
  `mute_audio` bit(1) NULL DEFAULT b'0',
  `mute_video` bit(1) NULL DEFAULT b'0',
  `important` int NULL DEFAULT 0,
  `display_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `enable_video` bit(1) NULL DEFAULT b'1',
  `pin` int NULL DEFAULT NULL,
  PRIMARY KEY (`meeting_detail_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for call_event
-- ----------------------------
DROP TABLE IF EXISTS `call_event`;
CREATE TABLE `call_event`  (
  `participants` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `callid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `participant` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `update_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `display_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `direction` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `audio_muted` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `video_muted` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `importance` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `layout` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `active_speaker` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `presenter` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `event_time` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of call_event
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `categoryID` bigint NOT NULL,
  `categoryName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `categoryDescription` varchar(2048) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `parentCategoryID` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`categoryID`) USING BTREE,
  INDEX `categories_parentCategoryID_idx`(`parentCategoryID` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (0, 'Database Storage', NULL, NULL);

-- ----------------------------
-- Table structure for cdr_call
-- ----------------------------
DROP TABLE IF EXISTS `cdr_call`;
CREATE TABLE `cdr_call`  (
  `autoid` bigint NOT NULL AUTO_INCREMENT,
  `call_correlator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `call_legs_completed` int NULL DEFAULT NULL,
  `call_legs_max_active` int NULL DEFAULT NULL,
  `call_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `co_space` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `duration_seconds` int NULL DEFAULT NULL,
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `owner_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `session` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT b'0',
  `call_bridge` int NULL DEFAULT NULL,
  `meeting_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`autoid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 246 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cdr_call_leg
-- ----------------------------
DROP TABLE IF EXISTS `cdr_call_leg`;
CREATE TABLE `cdr_call_leg`  (
  `auto_id` int NOT NULL AUTO_INCREMENT,
  `activated_duration` int NULL DEFAULT NULL,
  `call_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `can_move` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `cdr_tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `direction` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `display_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `duration_seconds` int NULL DEFAULT NULL,
  `encrypted_media` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `guest_connection` bit(1) NULL DEFAULT NULL,
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `local_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `lync_sub_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `moved_call_leg` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `moved_call_leg_call_bridge` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `owner_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `recording` bit(1) NULL DEFAULT NULL,
  `remote_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `remote_party` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `remote_teardown` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `replaces_sip_call_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `sip_call_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `streaming` bit(1) NULL DEFAULT NULL,
  `sub_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `deactivated` bit(1) NULL DEFAULT NULL,
  `session` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT b'0',
  `call_bridge` int NULL DEFAULT NULL,
  PRIMARY KEY (`auto_id`) USING BTREE,
  FULLTEXT INDEX `call_leg_id_idx`(`id`),
  FULLTEXT INDEX `call_leg_type_idx`(`type`)
) ENGINE = InnoDB AUTO_INCREMENT = 946 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cdr_call_leg
-- ----------------------------
-- ----------------------------
-- Table structure for cluster
-- ----------------------------
DROP TABLE IF EXISTS `cluster`;
CREATE TABLE `cluster`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `cluster_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `callbridge_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `display_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `server_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `port` int NOT NULL,
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `is_verify` tinyint(1) NULL DEFAULT NULL,
  `last_update` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cluster
-- ----------------------------
INSERT INTO `cluster` VALUES (22, 'mcu-406473f6-300b-4c13-a4b1-a6c4d9cddd28', '9767d113-ee8c-4852-bae7-d45b97b88c74', 'mcuhcm', 'cms.sbdlab.net', 445, 'admin', 'C1sco123', 1, '2020-07-26 19:36:54');

-- ----------------------------
-- Table structure for config_system
-- ----------------------------
DROP TABLE IF EXISTS `config_system`;
CREATE TABLE `config_system`  (
  `key_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `descript` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `config_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`key_value`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_system
-- ----------------------------
INSERT INTO `config_system` VALUES ('CMM_CDR_RECEIVER', 'http://10.168.112.128:8282/api/v1/cdr_receiver', '', '', 'string', '1990-01-01 00:00:00', '2025-12-29 23:30:45');
INSERT INTO `config_system` VALUES ('ROUND-ROBIN-CYCLE', 60, '', '', 'number', '1990-01-01 00:00:00', '2025-12-29 23:30:45');

-- ----------------------------
-- Table structure for even_call_info
-- ----------------------------
DROP TABLE IF EXISTS `even_call_info`;
CREATE TABLE `even_call_info`  (
  `call_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `participants` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `joinAudioMuteOverride` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `lockState` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `streaming` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `recording` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `endpointRecording` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `callType` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `coSpace` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `callCorrelator` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `distributedInstances` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- Table structure for group_participant
-- ----------------------------
DROP TABLE IF EXISTS `group_participant`;
CREATE TABLE `group_participant`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `last_modified_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of group_participant
-- ----------------------------
INSERT INTO `group_participant` VALUES (17, 'Test', NULL, '2026-01-04 17:12:53', NULL, '2026-01-04 17:12:53');

-- ----------------------------
-- Table structure for hphls_nhom_nsd
-- ----------------------------
DROP TABLE IF EXISTS `hphls_nhom_nsd`;
CREATE TABLE `hphls_nhom_nsd`  (
  `ma_nhom_nsd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ten_nhom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mo_ta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `danh_sach_quyen` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `ngay_tao` date NULL DEFAULT NULL,
  `ngay_cap_nhat` date NULL DEFAULT NULL,
  PRIMARY KEY (`ma_nhom_nsd`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hphls_nhom_nsd
-- ----------------------------
INSERT INTO `hphls_nhom_nsd` VALUES ('8851365f-2501-46e1-89f2-c05f37b91491', 'ADMIN', 'Nhóm quản trị viên có đầy đủ quyền', '[\"ROLE_ADMIN\"]', '2025-10-22', '2025-10-23');

-- ----------------------------
-- Table structure for hphls_nsd
-- ----------------------------
DROP TABLE IF EXISTS `hphls_nsd`;
CREATE TABLE `hphls_nsd`  (
  `ma_nsd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ten_dang_nhap` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mat_khau` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ho_ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `trang_thai` tinyint(1) NULL DEFAULT NULL,
  `ngay_hl_tu` date NULL DEFAULT NULL,
  `ngay_hl_den` date NULL DEFAULT NULL,
  `ma_nhom_nsd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ma_don_vi_sd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sdt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ma_nsd`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hphls_nsd
-- ----------------------------
INSERT INTO `hphls_nsd` VALUES ('7664e668-929f-4955-a5ec-30e0231fdefa', 'admin@system.local', '$2a$10$VgBJJ4hRyMpuqVZSLWItQ.brEJZU2BuPrUon9T52sysuUZcWyFWwO', 'Administrator', 1, NULL, NULL, '8851365f-2501-46e1-89f2-c05f37b91491', '1', 'admin@system.local', '');

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `log_time` datetime NULL DEFAULT NULL,
  `log_msg` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `log_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34000 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for meeting
-- ----------------------------
DROP TABLE IF EXISTS `meeting`;
CREATE TABLE `meeting`  (
  `meeting_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `meeting_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `owner_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `participants` decimal(22, 0) NULL DEFAULT NULL,
  `Activity` int NOT NULL,
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `durations` time NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `co_space` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `recording` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `lock_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `streaming` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `mute_entry` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `last_update` datetime NULL DEFAULT NULL,
  `placement` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of meeting
-- ----------------------------

-- ----------------------------
-- Table structure for participants
-- ----------------------------
DROP TABLE IF EXISTS `participants`;
CREATE TABLE `participants`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `destination` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT '1990-01-01 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of participants
-- ----------------------------
INSERT INTO `participants` VALUES (28, 'Test', 'Test', NULL, '1990-01-01 00:00:00', '2026-01-05 00:11:50');

-- ----------------------------
-- Table structure for rx_audio
-- ----------------------------
DROP TABLE IF EXISTS `rx_audio`;
CREATE TABLE `rx_audio`  (
  `codec` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `packet_loss_percentage` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `jitter` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `bitRate` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `round_trip_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `call_leg_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rx_audio
-- ----------------------------

-- ----------------------------
-- Table structure for rx_video
-- ----------------------------
DROP TABLE IF EXISTS `rx_video`;
CREATE TABLE `rx_video`  (
  `codec` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `packet_loss_percentage` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `jitter` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `bitRate` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `round_trip_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `call_leg_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rx_video
-- ----------------------------

-- ----------------------------
-- Table structure for tx_audio
-- ----------------------------
DROP TABLE IF EXISTS `tx_audio`;
CREATE TABLE `tx_audio`  (
  `codec` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `packet_loss_percentage` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `jitter` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `bitRate` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `round_trip_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `call_leg_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tx_audio
-- ----------------------------

-- ----------------------------
-- Table structure for tx_video
-- ----------------------------
DROP TABLE IF EXISTS `tx_video`;
CREATE TABLE `tx_video`  (
  `codec` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `packet_loss_percentage` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `jitter` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `bitRate` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `round_trip_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `call_leg_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `width` int NULL DEFAULT NULL,
  `height` int NULL DEFAULT NULL,
  `frame_rate` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `bit_rate` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tx_video
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `login` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `image_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `activated` bit(1) NOT NULL,
  `lang_key` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `activation_key` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `reset_key` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `reset_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_user_login`(`login` ASC) USING BTREE,
  UNIQUE INDEX `ux_user_email`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'system', '$2a$10$mE.qmcV0mFU5NcKh73TZx.z4ueI/.bDWbj0T1BYyqP481kGGarKLG', 'System', 'System', 'system@localhost', '', b'1', 'en', NULL, NULL, 'system', NULL, NULL, 'admin', '2020-04-17 00:56:37');
INSERT INTO `user` VALUES (2, 'anonymoususer', '$2a$10$j8S5d7Sr7.8VTOYNviDPOeWX8KcYILUVJBsYV83Y5NtECayypx9lO', 'Anonymous', 'User', 'anonymous@localhost', '', b'1', 'vi', NULL, NULL, 'system', NULL, NULL, 'system', NULL);
INSERT INTO `user` VALUES (3, 'admin', '$2a$10$gSAhZrxMllrbgj/kkK9UceBPpChGWJA7SYIb1Mqo.n5aNLq1/oRrC', 'Administrator', 'Administrator', 'admin@localhost', '', b'1', 'vi', NULL, NULL, 'system', NULL, NULL, 'admin', '2020-04-17 01:15:10');
INSERT INTO `user` VALUES (6, 'user', '$2a$10$VEjxo0jq2YG9Rbk2HmX9S.k1uZBGYUHdUcid3g/vfiEl7lwWgOH/K', 'User', 'User', 'user@localhost', '', b'1', 'en', NULL, NULL, 'system', NULL, NULL, 'system', NULL);
INSERT INTO `user` VALUES (14, 'dont', '$2a$10$XU8FF.045TJ64P2lAm2lf.cOt0tGgStwEUH1Hg1QCduii9A0bzKim', 'Nguyễn 121212', 'Tiến Độ', 'dont@saobacdau.vn', NULL, b'1', 'en', NULL, '4zxS33AOCNUsQc11nBQw', 'admin', '2020-04-21 11:33:07', '2020-04-21 11:33:07', 'admin', '2020-04-22 16:00:51');
INSERT INTO `user` VALUES (15, 'dont123', '$2a$10$nHt5Pv8gFHVl923pSCqcmuc6KTqGaIuhwmlk7M/zcD/Cv.TjVxyHu', 'dont', 'dont', 'dont@gmail.com', NULL, b'1', 'en', NULL, 'MtJWKeFEMPj0bsTwpFRI', 'admin', '2020-04-23 10:04:18', '2020-04-23 10:04:18', 'admin', '2020-04-23 10:04:18');
INSERT INTO `user` VALUES (16, 'dont1234', '$2a$10$i8p2z7vnPjP4X0GRoClaOuOg.tf.CyAqWvX7yQqxBhKbd1HA/aE3u', 'NGuyenx ', 'Tien Do', 'dont12345@saobacdau.vn', NULL, b'1', 'en', NULL, 'woxn3TFp98P4wcrT8yyU', 'admin', '2020-04-23 10:12:25', '2020-04-23 10:12:25', 'admin', '2020-04-23 10:12:25');

-- ----------------------------
-- Table structure for user_authority
-- ----------------------------
DROP TABLE IF EXISTS `user_authority`;
CREATE TABLE `user_authority`  (
  `user_id` bigint NOT NULL,
  `authority_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`, `authority_name`) USING BTREE,
  INDEX `fk_authority_name`(`authority_name` ASC) USING BTREE,
  CONSTRAINT `fk_authority_name` FOREIGN KEY (`authority_name`) REFERENCES `authority` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_authority
-- ----------------------------
INSERT INTO `user_authority` VALUES (1, 'ROLE_ADMIN');
INSERT INTO `user_authority` VALUES (1, 'ROLE_USER');
INSERT INTO `user_authority` VALUES (3, 'ROLE_ADMIN');
INSERT INTO `user_authority` VALUES (3, 'ROLE_USER');
INSERT INTO `user_authority` VALUES (6, 'ROLE_USER');
INSERT INTO `user_authority` VALUES (14, 'ROLE_USER');
INSERT INTO `user_authority` VALUES (15, 'ROLE_USER');
INSERT INTO `user_authority` VALUES (16, 'ROLE_USER');

-- View structure for v_call_leg_start_recall
-- ----------------------------
DROP VIEW IF EXISTS `v_call_leg_start_recall`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_call_leg_start_recall` AS select `a`.`call_id` AS `call_id`,`a`.`remote_address` AS `remote_address`,`a`.`time` AS `time`,`a`.`v_cnt` AS `v_cnt` from (select `cmm`.`cdr_call_leg`.`call_id` AS `call_id`,`cmm`.`cdr_call_leg`.`remote_address` AS `remote_address`,max(`cmm`.`cdr_call_leg`.`time`) AS `time`,count(1) AS `v_cnt` from `cmm`.`cdr_call_leg` where `cmm`.`cdr_call_leg`.`direction` = 'outgoing' and `cmm`.`cdr_call_leg`.`type` = 'callLegStart' group by `cmm`.`cdr_call_leg`.`call_id`,`cmm`.`cdr_call_leg`.`remote_address`) `a` where `a`.`v_cnt` > 1;

-- ----------------------------
-- View structure for v_call_leg_start
-- ----------------------------
DROP VIEW IF EXISTS `v_call_leg_start`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_call_leg_start` AS with callLegStart as (select `cl`.`auto_id` AS `auto_id`,`cl`.`activated_duration` AS `activated_duration`,`cl`.`call_id` AS `call_id`,`cl`.`can_move` AS `can_move`,`cl`.`cdr_tag` AS `cdr_tag`,`cl`.`direction` AS `direction`,`cl`.`display_name` AS `display_name`,`cl`.`duration_seconds` AS `duration_seconds`,`cl`.`encrypted_media` AS `encrypted_media`,`cl`.`group_id` AS `group_id`,`cl`.`guest_connection` AS `guest_connection`,`cl`.`id` AS `id`,`cl`.`local_address` AS `local_address`,`cl`.`lync_sub_type` AS `lync_sub_type`,`cl`.`moved_call_leg` AS `moved_call_leg`,`cl`.`moved_call_leg_call_bridge` AS `moved_call_leg_call_bridge`,`cl`.`owner_id` AS `owner_id`,`cl`.`reason` AS `reason`,`cl`.`recording` AS `recording`,`cl`.`remote_address` AS `remote_address`,`cl`.`remote_party` AS `remote_party`,`cl`.`remote_teardown` AS `remote_teardown`,`cl`.`replaces_sip_call_id` AS `replaces_sip_call_id`,`cl`.`sip_call_id` AS `sip_call_id`,`cl`.`streaming` AS `streaming`,`cl`.`sub_type` AS `sub_type`,`cl`.`time` AS `time`,`cl`.`type` AS `type`,`cl`.`state` AS `state`,`cl`.`deactivated` AS `deactivated`,`cl`.`session` AS `session`,`cl`.`deleted` AS `deleted`,`cl`.`call_bridge` AS `call_bridge`,`b`.`server_address` AS `server_address`,`b`.`port` AS `port`,`b`.`user_name` AS `user_name`,`b`.`password` AS `password` from (`cmm`.`cdr_call_leg` `cl` left join `cmm`.`cluster` `b` on(`cl`.`call_bridge` = `b`.`id`)) where `cl`.`type` = 'callLegStart' and (!(coalesce(`cl`.`call_id`,'') in (select `v_call_leg_start_recall`.`call_id` from `cmm`.`v_call_leg_start_recall`)) or coalesce(`cl`.`call_id`,'') in (select `v_call_leg_start_recall`.`call_id` from `cmm`.`v_call_leg_start_recall`) and !(coalesce(`cl`.`remote_address`,'') in (select `v_call_leg_start_recall`.`remote_address` from `cmm`.`v_call_leg_start_recall`)) or coalesce(`cl`.`call_id`,'') in (select `v_call_leg_start_recall`.`call_id` from `cmm`.`v_call_leg_start_recall`) and (coalesce(`cl`.`remote_address`,''),`cl`.`time`) in (select `v_call_leg_start_recall`.`remote_address`,`v_call_leg_start_recall`.`time` from `cmm`.`v_call_leg_start_recall`)))select `a`.`auto_id` AS `auto_id`,`a`.`activated_duration` AS `activated_duration`,coalesce(`a`.`call_id`,`b`.`call_id`) AS `call_id`,`a`.`can_move` AS `can_move`,`a`.`cdr_tag` AS `cdr_tag`,`a`.`direction` AS `direction`,`a`.`display_name` AS `display_name`,`a`.`duration_seconds` AS `duration_seconds`,`a`.`encrypted_media` AS `encrypted_media`,`a`.`group_id` AS `group_id`,`a`.`guest_connection` AS `guest_connection`,`a`.`id` AS `id`,`a`.`local_address` AS `local_address`,`a`.`lync_sub_type` AS `lync_sub_type`,`a`.`moved_call_leg` AS `moved_call_leg`,`a`.`moved_call_leg_call_bridge` AS `moved_call_leg_call_bridge`,`a`.`owner_id` AS `owner_id`,`a`.`reason` AS `reason`,`a`.`recording` AS `recording`,`a`.`remote_address` AS `remote_address`,`a`.`remote_party` AS `remote_party`,`a`.`remote_teardown` AS `remote_teardown`,`a`.`replaces_sip_call_id` AS `replaces_sip_call_id`,`a`.`sip_call_id` AS `sip_call_id`,`a`.`streaming` AS `streaming`,`a`.`sub_type` AS `sub_type`,`a`.`time` AS `time`,`a`.`type` AS `type`,`a`.`state` AS `state`,`a`.`deactivated` AS `deactivated`,`a`.`session` AS `session`,`a`.`deleted` AS `deleted`,case when (`a`.`remote_party` like '%@%' and `a`.`remote_party`  not like '%x-cisco-number%') then substr(`a`.`remote_party`,1,locate('@',`a`.`remote_party`) - 1) when `a`.`remote_party` like '%x-cisco-number%' then substr(`a`.`remote_party`,locate('x-cisco-number=',`a`.`remote_party`) + 15) else `a`.`remote_party` end AS `participant_dest`,`a`.`server_address` AS `server_address`,`a`.`port` AS `server_port`,`a`.`user_name` AS `server_username`,`a`.`password` AS `server_password` from (`callLegStart` `a` left join (select `cmm`.`cdr_call_leg`.`auto_id` AS `auto_id`,`cmm`.`cdr_call_leg`.`activated_duration` AS `activated_duration`,`cmm`.`cdr_call_leg`.`call_id` AS `call_id`,`cmm`.`cdr_call_leg`.`can_move` AS `can_move`,`cmm`.`cdr_call_leg`.`cdr_tag` AS `cdr_tag`,`cmm`.`cdr_call_leg`.`direction` AS `direction`,`cmm`.`cdr_call_leg`.`display_name` AS `display_name`,`cmm`.`cdr_call_leg`.`duration_seconds` AS `duration_seconds`,`cmm`.`cdr_call_leg`.`encrypted_media` AS `encrypted_media`,`cmm`.`cdr_call_leg`.`group_id` AS `group_id`,`cmm`.`cdr_call_leg`.`guest_connection` AS `guest_connection`,`cmm`.`cdr_call_leg`.`id` AS `id`,`cmm`.`cdr_call_leg`.`local_address` AS `local_address`,`cmm`.`cdr_call_leg`.`lync_sub_type` AS `lync_sub_type`,`cmm`.`cdr_call_leg`.`moved_call_leg` AS `moved_call_leg`,`cmm`.`cdr_call_leg`.`moved_call_leg_call_bridge` AS `moved_call_leg_call_bridge`,`cmm`.`cdr_call_leg`.`owner_id` AS `owner_id`,`cmm`.`cdr_call_leg`.`reason` AS `reason`,`cmm`.`cdr_call_leg`.`recording` AS `recording`,`cmm`.`cdr_call_leg`.`remote_address` AS `remote_address`,`cmm`.`cdr_call_leg`.`remote_party` AS `remote_party`,`cmm`.`cdr_call_leg`.`remote_teardown` AS `remote_teardown`,`cmm`.`cdr_call_leg`.`replaces_sip_call_id` AS `replaces_sip_call_id`,`cmm`.`cdr_call_leg`.`sip_call_id` AS `sip_call_id`,`cmm`.`cdr_call_leg`.`streaming` AS `streaming`,`cmm`.`cdr_call_leg`.`sub_type` AS `sub_type`,`cmm`.`cdr_call_leg`.`time` AS `time`,`cmm`.`cdr_call_leg`.`type` AS `type`,`cmm`.`cdr_call_leg`.`state` AS `state`,`cmm`.`cdr_call_leg`.`deactivated` AS `deactivated`,`cmm`.`cdr_call_leg`.`session` AS `session`,`cmm`.`cdr_call_leg`.`deleted` AS `deleted`,`cmm`.`cdr_call_leg`.`call_bridge` AS `call_bridge` from `cmm`.`cdr_call_leg` where `cmm`.`cdr_call_leg`.`type` = 'callLegUpdate' and `cmm`.`cdr_call_leg`.`state` = 'connected' and `cmm`.`cdr_call_leg`.`sip_call_id` is not null) `b` on(`a`.`id` = `b`.`id`));

-- ----------------------------

-- ----------------------------
-- View structure for v_meeting_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_meeting_detail`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_meeting_detail` AS with meeting_calls as (select distinct `cmm`.`cdr_call`.`id` AS `call_id`,`cmm`.`cdr_call`.`meeting_id` AS `meeting_id` from `cmm`.`cdr_call`), callLegEnd as (select `cmm`.`cdr_call_leg`.`auto_id` AS `auto_id`,`cmm`.`cdr_call_leg`.`activated_duration` AS `activated_duration`,`cmm`.`cdr_call_leg`.`call_id` AS `call_id`,`cmm`.`cdr_call_leg`.`can_move` AS `can_move`,`cmm`.`cdr_call_leg`.`cdr_tag` AS `cdr_tag`,`cmm`.`cdr_call_leg`.`direction` AS `direction`,`cmm`.`cdr_call_leg`.`display_name` AS `display_name`,`cmm`.`cdr_call_leg`.`duration_seconds` AS `duration_seconds`,`cmm`.`cdr_call_leg`.`encrypted_media` AS `encrypted_media`,`cmm`.`cdr_call_leg`.`group_id` AS `group_id`,`cmm`.`cdr_call_leg`.`guest_connection` AS `guest_connection`,`cmm`.`cdr_call_leg`.`id` AS `id`,`cmm`.`cdr_call_leg`.`local_address` AS `local_address`,`cmm`.`cdr_call_leg`.`lync_sub_type` AS `lync_sub_type`,`cmm`.`cdr_call_leg`.`moved_call_leg` AS `moved_call_leg`,`cmm`.`cdr_call_leg`.`moved_call_leg_call_bridge` AS `moved_call_leg_call_bridge`,`cmm`.`cdr_call_leg`.`owner_id` AS `owner_id`,`cmm`.`cdr_call_leg`.`reason` AS `reason`,`cmm`.`cdr_call_leg`.`recording` AS `recording`,`cmm`.`cdr_call_leg`.`remote_address` AS `remote_address`,`cmm`.`cdr_call_leg`.`remote_party` AS `remote_party`,`cmm`.`cdr_call_leg`.`remote_teardown` AS `remote_teardown`,`cmm`.`cdr_call_leg`.`replaces_sip_call_id` AS `replaces_sip_call_id`,`cmm`.`cdr_call_leg`.`sip_call_id` AS `sip_call_id`,`cmm`.`cdr_call_leg`.`streaming` AS `streaming`,`cmm`.`cdr_call_leg`.`sub_type` AS `sub_type`,`cmm`.`cdr_call_leg`.`time` AS `time`,`cmm`.`cdr_call_leg`.`type` AS `type`,`cmm`.`cdr_call_leg`.`state` AS `state`,`cmm`.`cdr_call_leg`.`deactivated` AS `deactivated`,`cmm`.`cdr_call_leg`.`session` AS `session`,`cmm`.`cdr_call_leg`.`deleted` AS `deleted`,`cmm`.`cdr_call_leg`.`call_bridge` AS `call_bridge` from `cmm`.`cdr_call_leg` where `cmm`.`cdr_call_leg`.`type` = 'callLegEnd'), callLegUpdate_connected as (select distinct `cmm`.`cdr_call_leg`.`id` AS `id`,`cmm`.`cdr_call_leg`.`state` AS `state`,`cmm`.`cdr_call_leg`.`deactivated` AS `deactivated` from `cmm`.`cdr_call_leg` where `cmm`.`cdr_call_leg`.`type` = 'callLegUpdate' and `cmm`.`cdr_call_leg`.`state` = 'connected')select coalesce(`s`.`id`,`s`.`group_id`) AS `id`,case when `s`.`group_id` = `s`.`id` then `s`.`id` else `s`.`group_id` end AS `participan_id`,coalesce(`s`.`call_id`) AS `call_id`,`m`.`meeting_id` AS `meeting_id`,coalesce(concat(`p`.`name`,'-',`p`.`destination`),`s`.`display_name`,`s`.`remote_address`,`s`.`remote_party`) AS `display_name`,`s`.`direction` AS `direction`,'CMU' AS `CMS`,'' AS `call_type`,`s`.`time` AS `start_time`,`s`.`remote_address` AS `remote_address`,ifnull(`u`.`deactivated`,0) AS `deactivated`,case when `s`.`remote_party` like '%x-cisco-number=%' then substr(`s`.`remote_party`,locate('x-cisco-number=',`s`.`remote_party`) + 15) else `s`.`remote_party` end AS `remote_party`,`e`.`time` AS `end_time`,`e`.`activated_duration` AS `activated_duration`,case when (`e`.`time` is null and `u`.`state` is null and `s`.`deleted` = 0) then 'Upcomming' when (`e`.`time` is null and `u`.`state` = 'connected' and `s`.`deleted` = 0) then 'Connected' else 'Disconnected' end AS `status`,ifnull(`c`.`mute_audio`,0) AS `mute_audio`,ifnull(`c`.`mute_video`,0) AS `mute_video`,ifnull(`c`.`important`,0) AS `important`,ifnull(`c`.`layout`,'') AS `layout`,ifnull(`c`.`pin`,0) AS `pin`,ifnull(`c`.`speaking`,0) AS `speaking`,ifnull(`c`.`enable_video`,0) AS `enable_video`,`s`.`server_address` AS `server_address`,ifnull(`s`.`server_port`,0) AS `server_port`,`s`.`server_username` AS `server_username`,`s`.`server_password` AS `server_password`,`s`.`id` AS `call_leg_id` from (((((`cmm`.`v_call_leg_start` `s` left join `meeting_calls` `m` on(`s`.`call_id` = `m`.`call_id`)) left join `callLegEnd` `e` on(`s`.`id` = `e`.`id`)) left join `callLegUpdate_connected` `u` on(`s`.`id` = `u`.`id`)) left join `cmm`.`participants` `p` on(`s`.`participant_dest` = `p`.`destination`)) left join `cmm`.`call_command` `c` on((case when `s`.`group_id` = `s`.`id` then `s`.`id` else `s`.`group_id` end) = `c`.`meeting_detail_id`)) order by case when (`e`.`time` is null and `u`.`state` is null and `s`.`deleted` = 0) then 'Upcomming' when (`e`.`time` is null and `u`.`state` = 'connected' and `s`.`deleted` = 0) then 'Connected' else 'Disconnected' end,ifnull(`c`.`pin`,0) desc;


-- ----------------------------
-- View structure for v_meeting
-- ----------------------------
DROP VIEW IF EXISTS `v_meeting`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_meeting` AS with participant as (select sum(case when `a`.`end_time` is null then 1 else 0 end) AS `connected`,sum(case when `a`.`end_time` is null then 0 else 1 end) AS `disconnected`,`a`.`meeting_id` AS `meeting_id` from `cmm`.`v_meeting_detail` `a` group by `a`.`meeting_id`)select `s`.`meeting_id` AS `meeting_id`,`s`.`meeting_title` AS `meeting_title`,`s`.`owner_name` AS `owner_name`,`p`.`connected` AS `participants`,`s`.`Activity` AS `Activity`,`s`.`start_time` AS `start_time`,`s`.`end_time` AS `end_time`,`s`.`durations` AS `durations`,`s`.`placement` AS `placement`,NULL AS `type`,`s`.`status` AS `status`,ifnull(`s`.`recording`,0) AS `recording`,ifnull(`s`.`lock_state`,0) AS `lock_state`,ifnull(`s`.`streaming`,0) AS `streaming`,ifnull(`s`.`mute_entry`,0) AS `mute_entry` from (`cmm`.`meeting` `s` left join `participant` `p` on(`s`.`meeting_id` = `p`.`meeting_id`)) order by `s`.`start_time` desc;


-- ----------------------------
-- Procedure structure for event_update_notuse
-- ----------------------------
DROP PROCEDURE IF EXISTS `event_update_notuse`;
delimiter ;;
CREATE PROCEDURE `event_update_notuse`(IN p_participants int,
IN p_call         varchar(255),
IN p_participant  varchar(255),
IN p_updateType   varchar(255),
IN p_name         varchar(255),
IN p_state        varchar(255),
IN p_direction    varchar(255),
IN p_audioMuted   int,
IN p_videoMuted   int,
IN p_importance   varchar(255),
IN p_layout       varchar(255),
IN p_activeSpeaker varchar(255),
IN p_presenter    varchar(255) ,
IN p_reason       varchar(255))
BEGIN
	
Insert into call_events(
		participants ,
		callid       ,
		participant  ,
		updateType   ,
		display_name ,
		state        ,
		direction    ,
		audioMuted   ,
		videoMuted   ,
		importance   ,
		layout       ,
		activeSpeaker,
		presenter    ,
		reason       )
values(
		p_participants,
		p_call        ,
		p_participant ,
		p_updateType  ,
		p_name        ,
		p_state       ,
		p_direction   ,
		p_audioMuted  ,
		p_videoMuted  ,
		p_importance  ,
		p_layout      ,
		p_activeSpeake,
		p_presenter    ,
		p_reason);
END
;;
delimiter ;

-- ----------------------------
-- Function structure for find_meetingdetailid_for_sip
-- ----------------------------
DROP FUNCTION IF EXISTS `find_meetingdetailid_for_sip`;
delimiter ;;
CREATE FUNCTION `find_meetingdetailid_for_sip`(`p_participant` varchar(255))
 RETURNS varchar(255) CHARSET utf8 COLLATE utf8_unicode_ci
BEGIN
	declare v_meetting_detail_id varchar(255);
	
	select distinct id into v_meetting_detail_id from v_meeting_detail where participan_id=p_participant;
	
	RETURN v_meetting_detail_id;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for find_meetingid
-- ----------------------------
DROP FUNCTION IF EXISTS `find_meetingid`;
delimiter ;;
CREATE FUNCTION `find_meetingid`(`p_participant` varchar(255))
 RETURNS varchar(255) CHARSET utf8 COLLATE utf8_unicode_ci
BEGIN
	declare v_meetting_id varchar(255);
	
	select distinct meeting_id into v_meetting_id from v_meeting_detail where participan_id=p_participant;
	
	RETURN v_meetting_id;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for find_meetingid_for_sip
-- ----------------------------
DROP FUNCTION IF EXISTS `find_meetingid_for_sip`;
delimiter ;;
CREATE FUNCTION `find_meetingid_for_sip`(`p_participant` varchar(255))
 RETURNS varchar(255) CHARSET utf8 COLLATE utf8_unicode_ci
BEGIN
	declare v_meetting_id varchar(255);
	
	select distinct meeting_id into v_meetting_id from v_meeting_detail where participan_id=p_participant;
	
	RETURN v_meetting_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for init_system
-- ----------------------------
DROP PROCEDURE IF EXISTS `init_system`;
delimiter ;;
CREATE PROCEDURE `init_system`()
BEGIN
	-- Thu tuc goi khi module receiver khoi dong 
	-- Cac cuoc hop dang hi nhân dở dang trong DB sẽ bị loại bỏ chi ghi nhân nhưng cuộc họp mới từ thời điểm nay	
	update cdr_call_leg set deleted=true where id in (select participan_id from v_meeting_detail where call_id in (select meeting_id from v_meeting where status!='Ended'));
	update cdr_call set deleted = true where id in (select meeting_id from v_meeting where status!='Ended');	
	update meeting set status='Ended' where status='Active' and last_update<=ADDDATE(CURRENT_TIMESTAMP,interval 60 MINUTE);
	commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for log_debug
-- ----------------------------
DROP PROCEDURE IF EXISTS `log_debug`;
delimiter ;;
CREATE PROCEDURE `log_debug`(msg text)
BEGIN
	#Routine body goes here...
	#insert into logs(log_time,log_msg,log_level) values(CURRENT_TIMESTAMP,msg,'DEBUG');
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for receiveCdrCall
-- ----------------------------
DROP PROCEDURE IF EXISTS `receiveCdrCall`;
delimiter ;;
CREATE PROCEDURE `receiveCdrCall`(pid varchar(255),
	pname								varchar(255),
	pownerName	varchar(255),
	pcallType	varchar(255),
	pcoSpace	varchar(255),
	pcallCorrelator	varchar(255),
	pcallLegsCompleted int,
	pcallLegsMaxActive int,
	pdurationSeconds		int,
	ptype		varchar(255),
	ptime		DateTime,
	psession	varchar(255),
	pcallBridge	varchar(255))
BEGIN
	declare v_meeting_id varchar(255);
	#callStart = Active	
	#callEnd	 = Ended
	#insert into logs (log_time,log_msg,log_level) values (CURRENT_TIMESTAMP,concat('receiveCdrCall:',ptype,'pcoSpace',pcoSpace),'DEBUG');
	
	-- neu phong hop (co_space) chua start ==> tao 1 cuoc hop moi
	if(ptype='callStart' and NOT EXISTS(select * from meeting where co_space=pcoSpace and status='Active')) 
	then
		set v_meeting_id:=UUID();
		
		insert into meeting (
						 meeting_id
						,meeting_title
						,owner_name
						,participants
						,Activity
						,start_time
						,end_time
						,durations
						,type
						,status
						,co_space
					) values (
							v_meeting_id,
							pname,
							pownerName,
							0,
							pcallLegsMaxActive,							
							ptime,
							null,
							pdurationSeconds,
							ptype,
							'Active',
							pcoSpace
					);
	elseif (ptype='callStart' and EXISTS(select * from meeting where co_space=pcoSpace and status='Active'))
	then
	-- neu phong hop (co_space) da start ma chua end ==> no cung 1 cuoc hop, chi update thong tin neu can
			select meeting_id into v_meeting_id from meeting where co_space=pcoSpace and  status='Active';					
	end if;
	
	if(ptype='callEnd')
	then			
		select meeting_id into v_meeting_id from cdr_call where id=pid and type='callStart';		
		
		if(NOT EXISTS(select * from v_meeting_detail where meeting_id=v_meeting_id and `status`<> 'Disconnected')) 
		then -- meeting ended
			update meeting set end_time=ptime, status='Ended', durations=timediff(start_time,ptime)
			where meeting_id=v_meeting_id;
		-- else -- meeting not ended
			-- update meeting set 
			-- where meeting_id=v_meeting_id;
		end if;
		
	end if;
		
	update cdr_call set meeting_id= v_meeting_id where id=pid; 	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for receiveCdrCallLeg
-- ----------------------------
DROP PROCEDURE IF EXISTS `receiveCdrCallLeg`;
delimiter ;;
CREATE PROCEDURE `receiveCdrCallLeg`(pid						varchar(255)	,
pdisplayName				varchar(255)		,
plocalAddress			varchar(255)			,
premoteAddress			varchar(255)			,
premoteParty				varchar(255)		,
pcdrTag					varchar(255)	,
pguestConnection			boolean			,
precording				boolean		,
pstreaming				boolean		,
ptype						varchar(255)	,
psubType						varchar(255)	,
plyncSubType				varchar(255)		,
pdirection					varchar(255)		,
pcallId							varchar(255)	,
pownerId						varchar(255)	,
psipCallId					varchar(255)		,
pgroupId						varchar(255)	,
preplacesSipCallId	varchar(255)				,
pcanMove						varchar(255)	,
pmovedCallLeg				varchar(255)			,
pmovedCallLegCallBridge	varchar(255)					,	
preason						  varchar(255)	,	
premoteTeardown			varchar(255)			,	
pencryptedMedia			varchar(255)			,	
pdurationSeconds		int				,	
pactivatedDuration	int					,	
pstate							varchar(255)	,	
pdeactivated				bit,
ptime								Date,
psession						varchar(255) 	,
pcallBridge					varchar(255))
BEGIN
	declare v_meeting_id varchar(255);
	declare v_i int;
	#callLegStart 
	#callLegUpdate	
	#callLegEnd	 
	-- neu phong hop (co_space) chua start ==> tao 1 cuoc hop moi
		
	if(ptype='callLegStart') 
	then		
	  update meeting set participants=participants where meeting_id=v_meeting_id; 
	elseif (ptype='callLegUpdate')
	then
		if(pstate='connected') then
			
			update meeting set participants=participants+1 where meeting_id in (select meeting_id from cdr_call where id=pcallId); 
			
			-- Update cdr_call_leg deactived
			update cdr_call_leg set deactivated=pdeactivated where id=pid;
			
		end if;
	elseif (ptype='callLegEnd')
	then		
		select meeting_id  into v_meeting_id from v_meeting_detail where id=pid limit 1;
		
		call log_debug(concat('callLegEnd:',ifnull(pid,''),'-',ifnull(v_meeting_id,'')));
	
		update meeting set participants=participants-1 where meeting_id=v_meeting_id; 
				
		if(NOT EXISTS(select * from v_meeting_detail where meeting_id=v_meeting_id and `status`<> 'Disconnected')) 
		then -- meeting ended
			
			call log_debug(concat('update meeting:',ifnull(pid,''),'-',ifnull(v_meeting_id,'')));
			update meeting set end_time=ptime, `status`='Ended', durations=timediff(start_time,ptime)
			where meeting_id=v_meeting_id;
		-- else -- meeting not ended
			-- update meeting set 
			-- where meeting_id=v_meeting_id;
		end if;
	end if;	
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for updateEvent
-- ----------------------------
DROP PROCEDURE IF EXISTS `updateEvent`;
delimiter ;;
CREATE PROCEDURE `updateEvent`(IN p_participants varchar(255),
IN p_call         varchar(255),
IN p_participant  varchar(255),
IN p_updateType   varchar(255),
IN p_name         varchar(255),
IN p_state        varchar(255),
IN p_direction    varchar(255),
IN p_audioMuted   varchar(255),
IN p_videoMuted   varchar(255),
IN p_importance   varchar(255),
IN p_layout       varchar(255),
IN p_activeSpeaker varchar(255),
IN p_presenter    varchar(255) ,
IN p_reason       varchar(255))
BEGIN

declare v_audioMuted bit;
declare v_videoMuted bit;
declare v_enable_video bit;
declare v_activeSpeaker bit;
declare v_layout varchar(255);
declare v_important INT;
declare v_name varchar(255);

declare v_meeting_id varchar(255);
declare v_meeting_detail_id varchar(255);


 #insert into logs(log_time,log_msg,log_level) values (CURRENT_TIMESTAMP,p_importance,'DEBUG');
 commit;
if(
   p_participant is not null  and (
	 p_audioMuted is not null or
   p_videoMuted is not null or 
	 p_importance is not null or 
	 p_state is not null or
	 p_layout is not null or
	 p_name is not null or
	 p_activeSpeaker is not null))
then	
set v_audioMuted:=case when p_audioMuted is null 
											then null 
											else 
												case when p_audioMuted='true' 
														 then true else false end 
									 end;
set v_videoMuted:=case when p_videoMuted is null 
											 then null 
											 else 
											   case when p_videoMuted='true' 
															then true else false end 
									end;
						
-- set v_important:=case when p_importance ='-1'  
--                       then null
-- 											else 
-- 											  case when p_importance='0'
-- 												     then true else false end 
-- 									end;

set v_important := case when p_importance is null then -1 else cast(p_importance as INT) end;

set v_activeSpeaker:=case when p_activeSpeaker is null 
                      then null 
											else 
											  case when p_activeSpeaker='true'
												     then true else false end 
									end;
									

set v_layout:=p_layout;
set v_name:=p_name;

set v_meeting_detail_id:=p_participant;
set v_meeting_id:=find_meetingid(COALESCE(p_participant,'ko lam gi'));

if(v_meeting_id is not null or v_meeting_id<>'') 
then
		set v_enable_video:=true;

		-- case call by ipphone - sip_call 
		if(v_meeting_id is null) then
			set v_enable_video:=false;
			set v_meeting_id:=find_meetingid_for_sip(p_participant);
			set v_meeting_detail_id:=find_meetingdetailid_for_sip(p_participant);
		end if;

#insert into logs(log_time,log_msg,log_level) values (CURRENT_TIMESTAMP,'updateEvent insert call_command','DEBUG');

		INSERT INTO call_command  (meeting_detail_id,meeting_id,layout,mute_audio,mute_video,important, enable_video) 
		VALUES (v_meeting_detail_id,v_meeting_id,v_layout,v_audioMuted,v_videoMuted,v_important,v_enable_video)
		ON DUPLICATE KEY UPDATE
		meeting_id=v_meeting_id,
		layout=COALESCE(v_layout,layout),
		mute_audio = COALESCE(v_audioMuted,mute_audio),
		mute_video = COALESCE(v_videoMuted,mute_video),
		important =  COALESCE(v_important,important),
		display_name = COALESCE(v_name,display_name),
		speaking=COALESCE(v_activeSpeaker,speaking);
		end if;

	update meeting set last_update = CURRENT_TIMESTAMP where meeting_id=v_meeting_id;
commit;
		/*
		Insert into call_event(
				participants ,
				callid       ,
				participant  ,
				update_type   ,
				display_name ,
				state        ,
				direction    ,
				audio_muted   ,
				video_muted   ,
				importance   ,
				layout       ,
				active_speaker,
				presenter    ,
				reason       )
		values(
				p_participants,
				p_call        ,
				p_participant ,
				p_updateType  ,
				p_name        ,
				p_state       ,
				p_direction   ,
				p_audioMuted  ,
				p_videoMuted  ,
				p_importance  ,
				p_layout      ,
				p_activeSpeaker,
				p_presenter    ,
				p_reason);*/
		
end if;
		
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for updateEvent_callInfo
-- ----------------------------
DROP PROCEDURE IF EXISTS `updateEvent_callInfo`;
delimiter ;;
CREATE PROCEDURE `updateEvent_callInfo`(IN p_call_id varchar(200),
	IN p_participants varchar(200),
	IN p_joinAudioMuteOverride varchar(200),
	IN p_lockState varchar(200),
	IN p_streaming varchar(200),
	IN p_recording varchar(200),
	IN p_endpointRecording varchar(200),
	IN p_callType varchar(200),
	IN p_coSpace varchar(200),
	IN p_callCorrelator varchar(200),
	IN p_distributedInstances varchar(200))
BEGIN

update meeting set 
	lock_state=case when p_lockState='' then lock_state else p_lockState='locked' end,
	recording=case when p_recording='' then recording else p_recording='active' end,
	streaming=case when p_streaming='' then streaming else  p_streaming='active' end,
	mute_entry=case when p_joinAudioMuteOverride=''  then mute_entry else  ifnull(p_joinAudioMuteOverride,false)='true' end,
	last_update=CURRENT_TIMESTAMP
where meeting_id in (select meeting_id from cdr_call where id=p_call_id);

insert into even_call_info values(
	p_call_id ,
	p_participants ,
	p_joinAudioMuteOverride ,
	p_lockState ,
	p_streaming ,
	p_recording ,
	p_endpointRecording ,
	p_callType ,
	p_coSpace ,
	p_callCorrelator ,
	p_distributedInstances);
commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_pin
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_pin`;
delimiter ;;
CREATE PROCEDURE `update_pin`(IN `pMeetingDetailId` CHAR(50),IN `pMeetingId` CHAR(50))
BEGIN
declare v_pin int;
select max(COALESCE(pin,0)) into v_pin from call_command where meeting_id=pMeetingId;

set v_pin:=v_pin+1;

update call_command set pin=case when pin>0 then 0 else v_pin end 
where meeting_detail_id=pMeetingDetailId;
commit;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
