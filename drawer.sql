-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2020-01-18 13:40:42
-- 服务器版本： 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `drawer`
--
CREATE DATABASE IF NOT EXISTS `drawer` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `drawer`;

-- --------------------------------------------------------

--
-- 表的结构 `app01_comment`
--

CREATE TABLE `app01_comment` (
  `id` int(11) NOT NULL,
  `content` varchar(164) NOT NULL,
  `device` varchar(32) DEFAULT NULL,
  `ctime` datetime(6) NOT NULL,
  `news_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parentcomment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `app01_news`
--

CREATE TABLE `app01_news` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `message` varchar(128) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  `ctime` datetime(6) NOT NULL,
  `nt` int(11) NOT NULL,
  `userSend_id` int(11) NOT NULL,
  `commentcount` int(11) NOT NULL,
  `favorcount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `app01_userinfo`
--

CREATE TABLE `app01_userinfo` (
  `nid` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `pwd` varchar(64) NOT NULL,
  `ctime` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `app01_userinfo`
--

INSERT INTO `app01_userinfo` (`nid`, `username`, `email`, `pwd`, `ctime`) VALUES
(1, 'eric', '123@live.com', '123456', '2019-12-14 23:28:35.000000'),
(2, 'ssdd', '1234@qq.com', '123456', '2019-12-16 22:47:36.150727'),
(6, 'wqer', '557@qq.com', 'qwerty', '2019-12-17 14:41:47.056021'),
(8, 'song', '1293143636@qq.com', '12345678', '2019-12-25 10:43:07.085778'),
(9, 'a', '418303618@qq.com', '1234567', '2019-12-25 10:44:57.279150'),
(10, 'wang', '2862944038@qq.com', '1245678', '2019-12-25 10:50:10.624079');

-- --------------------------------------------------------

--
-- 表的结构 `app01_usersend`
--

CREATE TABLE `app01_usersend` (
  `nid` int(11) NOT NULL,
  `code` varchar(6) NOT NULL,
  `email` varchar(32) NOT NULL,
  `time` int(11) NOT NULL,
  `ctime` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `app01_usersend`
--

INSERT INTO `app01_usersend` (`nid`, `code`, `email`, `time`, `ctime`) VALUES
(1, '123456', '123@live.com', 1, '2019-12-15 14:08:17.000000'),
(2, 'BULXB2', '456@c.com', 1, '2019-12-15 14:15:13.661968'),
(3, 'YKZW2A', '132@c.com', 1, '2019-12-15 14:19:59.360077'),
(4, 'CEAS4X', '1577184907@qq.com', 7, '2020-01-10 11:39:15.908490'),
(5, 'Y6TQ4T', '1878205509@qq.com', 2, '2020-01-11 10:12:50.337225'),
(6, 'RSHW9T', '18782055092@qq.com', 2, '2020-01-10 11:43:25.634457');

-- --------------------------------------------------------

--
-- 表的结构 `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user info', 7, 'add_userinfo'),
(26, 'Can change user info', 7, 'change_userinfo'),
(27, 'Can delete user info', 7, 'delete_userinfo'),
(28, 'Can view user info', 7, 'view_userinfo'),
(29, 'Can add user send', 8, 'add_usersend'),
(30, 'Can change user send', 8, 'change_usersend'),
(31, 'Can delete user send', 8, 'delete_usersend'),
(32, 'Can view user send', 8, 'view_usersend'),
(33, 'Can add new type', 9, 'add_newtype'),
(34, 'Can change new type', 9, 'change_newtype'),
(35, 'Can delete new type', 9, 'delete_newtype'),
(36, 'Can view new type', 9, 'view_newtype'),
(37, 'Can add news', 10, 'add_news'),
(38, 'Can change news', 10, 'change_news'),
(39, 'Can delete news', 10, 'delete_news'),
(40, 'Can view news', 10, 'view_news'),
(41, 'Can add favor', 11, 'add_favor'),
(42, 'Can change favor', 11, 'change_favor'),
(43, 'Can delete favor', 11, 'delete_favor'),
(44, 'Can view favor', 11, 'view_favor'),
(45, 'Can add commont', 12, 'add_commont'),
(46, 'Can change commont', 12, 'change_commont'),
(47, 'Can delete commont', 12, 'delete_commont'),
(48, 'Can view commont', 12, 'view_commont'),
(49, 'Can add comment', 12, 'add_comment'),
(50, 'Can change comment', 12, 'change_comment'),
(51, 'Can delete comment', 12, 'delete_comment'),
(52, 'Can view comment', 12, 'view_comment');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(12, 'app01', 'comment'),
(11, 'app01', 'favor'),
(10, 'app01', 'news'),
(9, 'app01', 'newtype'),
(7, 'app01', 'userinfo'),
(8, 'app01', 'usersend'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- 表的结构 `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-12-14 15:02:34.935803'),
(2, 'auth', '0001_initial', '2019-12-14 15:02:36.137446'),
(3, 'admin', '0001_initial', '2019-12-14 15:02:43.235768'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-12-14 15:02:45.640829'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-12-14 15:02:45.810686'),
(6, 'app01', '0001_initial', '2019-12-14 15:02:46.396698'),
(7, 'contenttypes', '0002_remove_content_type_name', '2019-12-14 15:02:47.650546'),
(8, 'auth', '0002_alter_permission_name_max_length', '2019-12-14 15:02:48.642781'),
(9, 'auth', '0003_alter_user_email_max_length', '2019-12-14 15:02:49.589887'),
(10, 'auth', '0004_alter_user_username_opts', '2019-12-14 15:02:49.700885'),
(11, 'auth', '0005_alter_user_last_login_null', '2019-12-14 15:02:50.351180'),
(12, 'auth', '0006_require_contenttypes_0002', '2019-12-14 15:02:50.419433'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2019-12-14 15:02:50.483389'),
(14, 'auth', '0008_alter_user_username_max_length', '2019-12-14 15:02:51.473701'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2019-12-14 15:02:52.209623'),
(16, 'auth', '0010_alter_group_name_max_length', '2019-12-14 15:02:53.013870'),
(17, 'auth', '0011_update_proxy_permissions', '2019-12-14 15:02:53.067477'),
(18, 'sessions', '0001_initial', '2019-12-14 15:02:53.484151'),
(19, 'app01', '0002_commont_favor_news_newtype', '2019-12-25 02:33:38.418074'),
(20, 'app01', '0003_auto_20191228_1025', '2019-12-28 02:25:53.154593'),
(21, 'app01', '0004_auto_20191228_1044', '2019-12-28 02:44:50.358481'),
(22, 'app01', '0005_auto_20191228_1127', '2019-12-28 03:27:32.163294');

-- --------------------------------------------------------

--
-- 表的结构 `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('6vh2tnoo0w1f3l3y4ko2rxggc3g5vb9c', 'NGI3Y2NlOTk3NmVlYmZkM2IxMDhkN2JhMTI1Y2E1NWM3ZmVhOWJlNjp7ImlzX2xvZ2luIjoiZXJpYyIsInVzZXJpbmZvX2RpY3QiOnsibmlkIjo3LCJ1c2VybmFtZSI6IndxZXJvaSIsImVtYWlsIjoiMTg3ODIwNTUwOUBxcS5jb20iLCJwd2QiOiJxd2VydHkifSwiY2hlY2tDb2RlIjoiSEQ0UCJ9', '2020-01-05 02:46:29.357326'),
('7161abkig9nit1sw6hkc1z5mi9c1muw7', 'MDM1YmU2M2Q5YjZkZjg2ZDJhYTEzNTlmZDE2NjM4Yjg2Yjg0ODQ1Nzp7ImNoZWNrQ29kZSI6InkzVFUiLCJpc19sb2dpbiI6IndhbmciLCJ1c2VyaW5mb19kaWN0Ijp7Im5pZCI6MTAsInVzZXJuYW1lIjoid2FuZyIsImVtYWlsIjoiMjg2Mjk0NDAzOEBxcS5jb20iLCJwd2QiOiIxMjQ1Njc4In19', '2020-01-08 02:51:05.448994'),
('adphk1wi1wyr8g3r78jrr3ihcp72m1x8', 'YTEzNDlhNzY5MjM5ZTMzOGNkYmJkMjQzMDcyNTBkN2U4ODc5NjI5Nzp7ImNoZWNrQ29kZSI6IkM5a3AifQ==', '2020-02-01 11:56:00.960703'),
('b5ud0o3pruxywcfjvbz9rjzxvy151410', 'YmNiMWRiNGQ2NTExNzg4OTU5ZmE2Mzk5MjZlZDg1MDYxNGQyMTY4Njp7ImNoZWNrQ29kZSI6IndRRFgifQ==', '2020-01-25 02:12:24.209552'),
('upmjwwu6nzm2dnt6connoq8gs32kcl6p', 'ZDExYjUxN2Q5NzUzOTI3MmQxYjNlNTFkNjkyNjg3YTY5ZWM2M2U2YTp7ImNoZWNrQ29kZSI6IkZDeFAifQ==', '2020-02-01 12:32:17.227764'),
('wxnk69lnme7ktucnijw4eobvu3lrqsws', 'NGQ4MDVmODU3ZWY2NDVjMzFlMDY4ZTVmNWJhYjU5MGFlZGI2YmM4NDp7ImNoZWNrQ29kZSI6IkRTd2EifQ==', '2020-01-16 01:45:53.746685');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app01_comment`
--
ALTER TABLE `app01_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app01_commont_news_id_a3ab68f0_fk_app01_news_id` (`news_id`),
  ADD KEY `app01_commont_user_id_d5bd86b8_fk_app01_userinfo_nid` (`user_id`),
  ADD KEY `app01_comment_parentcomment_id_f2a9211e_fk_app01_comment_id` (`parentcomment_id`);

--
-- Indexes for table `app01_news`
--
ALTER TABLE `app01_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app01_news_userSend_id_1a547c5f_fk_app01_userinfo_nid` (`userSend_id`);

--
-- Indexes for table `app01_userinfo`
--
ALTER TABLE `app01_userinfo`
  ADD PRIMARY KEY (`nid`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `app01_usersend`
--
ALTER TABLE `app01_usersend`
  ADD PRIMARY KEY (`nid`),
  ADD KEY `app01_usersend_email_240af973` (`email`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `app01_comment`
--
ALTER TABLE `app01_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `app01_news`
--
ALTER TABLE `app01_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `app01_userinfo`
--
ALTER TABLE `app01_userinfo`
  MODIFY `nid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `app01_usersend`
--
ALTER TABLE `app01_usersend`
  MODIFY `nid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- 使用表AUTO_INCREMENT `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- 限制导出的表
--

--
-- 限制表 `app01_comment`
--
ALTER TABLE `app01_comment`
  ADD CONSTRAINT `app01_comment_parentcomment_id_f2a9211e_fk_app01_comment_id` FOREIGN KEY (`parentcomment_id`) REFERENCES `app01_comment` (`id`),
  ADD CONSTRAINT `app01_commont_news_id_a3ab68f0_fk_app01_news_id` FOREIGN KEY (`news_id`) REFERENCES `app01_news` (`id`),
  ADD CONSTRAINT `app01_commont_user_id_d5bd86b8_fk_app01_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `app01_userinfo` (`nid`);

--
-- 限制表 `app01_news`
--
ALTER TABLE `app01_news`
  ADD CONSTRAINT `app01_news_userSend_id_1a547c5f_fk_app01_userinfo_nid` FOREIGN KEY (`userSend_id`) REFERENCES `app01_userinfo` (`nid`);

--
-- 限制表 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- 限制表 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 限制表 `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- 表的结构 `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- 表的结构 `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- 表的结构 `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- 表的结构 `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- 表的结构 `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- 表的结构 `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- 表的结构 `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- 表的结构 `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- 表的结构 `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- 表的结构 `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

-- --------------------------------------------------------

--
-- 表的结构 `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- 表的结构 `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- 表的结构 `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- 表的结构 `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- 转存表中的数据 `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('boot_crm', 'customer', 'cust_name');

-- --------------------------------------------------------

--
-- 表的结构 `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- 转存表中的数据 `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'boot_crm', 'customer', '[]', '2019-06-26 12:18:19'),
('root', 'crm', 'customer_return', '[]', '2019-06-15 12:08:44'),
('root', 'crm', 'relation_service', '{\"sorted_col\":\"`relation_service`.`serviceid`  ASC\"}', '2019-06-16 05:02:32'),
('root', 'crm', 'service_people', '[]', '2019-06-16 05:04:10'),
('root', 'shop', 'article', '{\"sorted_col\":\"`article`.`SUPPLIER` ASC\"}', '2019-06-14 01:19:47'),
('root', 'stucourse', 'student', '{\"sorted_col\":\"`student`.`stuBirth`  ASC\"}', '2019-05-28 12:27:30');

-- --------------------------------------------------------

--
-- 表的结构 `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- 表的结构 `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- 转存表中的数据 `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2020-01-18 12:39:38', '{\"lang\":\"zh_CN\",\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- 表的结构 `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- 表的结构 `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `shop`
--
CREATE DATABASE IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `shop`;

-- --------------------------------------------------------

--
-- 表的结构 `article`
--

CREATE TABLE `article` (
  `ID` int(11) NOT NULL,
  `TYPE_CODE` varchar(100) DEFAULT NULL,
  `TITLE` varchar(200) DEFAULT NULL,
  `SUPPLIER` varchar(20) DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  `DISCOUNT` double DEFAULT NULL,
  `LOCALITY` varchar(300) DEFAULT NULL,
  `PUTAWAY_DATE` datetime DEFAULT NULL,
  `STORAGE` int(11) DEFAULT '100',
  `IMAGE` varchar(200) DEFAULT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `DISABLED` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `article`
--

INSERT INTO `article` (`ID`, `TYPE_CODE`, `TITLE`, `SUPPLIER`, `PRICE`, `DISCOUNT`, `LOCALITY`, `PUTAWAY_DATE`, `STORAGE`, `IMAGE`, `DESCRIPTION`, `CREATE_DATE`, `DISABLED`) VALUES
(1, '00010001', 'Cetaphil丝塔芙洗面奶(法国) 200ml 极其温和的配方 卓越的保湿功效 严谨的生产方式 ', ' Cetaphil丝塔芙洗面奶', 108, 0.7, ' 法国', '2013-03-31 00:00:00', 100, '20130331_1_1.jpg', 'Cetaphil丝塔芙洗面奶(法国) 200ml 极其温和的配方 卓越的保湿功效 严谨的生产方式 ', '2013-03-31 00:00:00', 0),
(2, '00010001', 'Cetaphil丝塔芙洁面乳 118ml 全美皮肤科及儿科医师推荐品牌 极其温和的配方，卓越的保湿功效 严谨的生产方式，众多明星推荐 ', 'Cetaphil丝塔芙洁面乳 118ml', 58, 0.7, 'Cetaphil丝塔芙洁面乳', '2013-03-31 00:00:00', 100, '20130331_1_2.jpg', 'Cetaphil丝塔芙洁面乳 118ml 全美皮肤科及儿科医师推荐品牌 极其温和的配方，卓越的保湿功效 严谨的生产方式，众多明星推荐 ', '2013-03-31 00:00:00', 0),
(3, '00010001', 'Cetaphil丝塔芙洁面乳 237ml 名副其实的洁面冠军 无与伦比的温和洁面新体验 所有肤质全部适用 ', 'Cetaphil丝塔芙洁面乳 237ml', 118, 0.7, '丝塔芙洁面乳 ', '2013-03-31 00:00:00', 100, '20130331_1_3.jpg', 'Cetaphil丝塔芙洁面乳 237ml 名副其实的洁面冠军 无与伦比的温和洁面新体验 所有肤质全部适用 ', '2013-03-31 00:00:00', 0),
(4, '00010001', '洗颜专科柔澈泡沫洁面乳 120g(资生堂授权特供)(多款包装,随机发货) 屈臣氏畅销硬货之一，在网络上也拥有无数的好评 洁面产品中首次推出的超细腻超丰富泡沫 适合各种肌肤的洁面产品 ', '洗颜专科 柔澈泡沫洁面乳 120g', 45, 0.7, '资生堂授权特供', '2013-03-31 00:00:00', 100, '20130331_1_4.jpg', '洗颜专科柔澈泡沫洁面乳 120g(资生堂授权特供)(多款包装,随机发货) 屈臣氏畅销硬货之一，在网络上也拥有无数的好评 洁面产品中首次推出的超细腻超丰富泡沫 适合各种肌肤的洁面产品 ', '2013-03-31 00:00:00', 0),
(5, '00010001', 'Cetaphil丝塔芙洁面乳 591ml 极其温和的配方 卓越的保湿功效 严谨的生产方式 ', 'Cetaphil丝塔芙洁面乳 591ml', 198, 0.7, 'Cetaphil丝塔芙洁面乳', '2013-03-31 00:00:00', 100, '20130331_1_5.jpg', 'Cetaphil丝塔芙洁面乳 591ml 极其温和的配方 卓越的保湿功效 严谨的生产方式 ', '2013-03-31 00:00:00', 0),
(6, '00010001', '欧莱雅 (L\'Oreal)清润 泡沫洁面膏 125ml 深层清洁 滋养肌肤 保持清新 ', ' 欧莱雅清润 泡沫洁面膏', 88, 0.7, '泡沫洁面膏', '2013-03-31 00:00:00', 100, '20130331_1_6.jpg', '欧莱雅 (L\'Oreal)清润 泡沫洁面膏 125ml 深层清洁 滋养肌肤 保持清新 ', '2013-03-31 00:00:00', 0),
(7, '00010001', '比度克 (BeDook)抗痘控油洁面膏 60g(两款包装随机发货) 祛痘第一步 痘肌必备清洁法宝 抑痘防感染洁面 解除油光危“肌” 洁面控油 杀菌抑痘 ', '比度克 抗痘控油洁面膏 ', 38.9, 0.7, '比度克 (BeDook)抗痘控油洁面膏 60g', '2013-03-31 00:00:00', 100, '20130331_1_7.jpg', '比度克 (BeDook)抗痘控油洁面膏 60g(两款包装随机发货) 祛痘第一步 痘肌必备清洁法宝 抑痘防感染洁面 解除油光危“肌” 洁面控油 杀菌抑痘 ', '2013-03-31 00:00:00', 0),
(8, '00010001', 'Mentholatum曼秀雷敦男士冰爽活炭洁面乳150ml 冰凉薄荷，深层洁净 保持皮肤滋润清爽，让脸部恢复光滑 早晚使用，倍感肌肤清爽柔润 ', '曼秀雷敦男士冰爽活炭洁面乳', 39.9, 0.7, '曼秀雷敦男士冰爽活炭洁面乳 150ml', '2013-03-31 00:00:00', 100, '20130331_1_8.jpg', 'Mentholatum曼秀雷敦男士冰爽活炭洁面乳150ml 冰凉薄荷，深层洁净 保持皮肤滋润清爽，让脸部恢复光滑 早晚使用，倍感肌肤清爽柔润 ', '2013-03-31 00:00:00', 0),
(9, '00010001', '凡茜仙人掌无s洗面奶 126ml两款包装随机发货! 无S配方 蕴含温和谷氨酸清洁因子 有效清洁皮肤表面及毛孔内油脂污垢 不刺激肌肤 ', '凡茜仙人掌无s洗面奶', 90, 0.7, '凡茜仙人掌无s洗面奶 126ml', '2013-03-31 00:00:00', 100, '20130331_1_9.jpg', '凡茜仙人掌无s洗面奶 126ml两款包装随机发货! 无S配方 蕴含温和谷氨酸清洁因子 有效清洁皮肤表面及毛孔内油脂污垢 不刺激肌肤 ', '2013-03-31 00:00:00', 0),
(10, '00010001', '倩碧 (Clinique) 温和液体洁面皂 200ml 深层清洁，软化角质，丰富泡沫，清洗容易 温和无刺激，敏感肌肤也适用 滋润肌肤，去除干燥紧绷感 ', '倩碧温和液体洁面皂', 200, 0.7, '倩碧 (Clinique) 温和液体洁面皂 200ml', '2013-03-31 00:00:00', 100, '20130331_1_10.jpg', '倩碧 (Clinique) 温和液体洁面皂 200ml 深层清洁，软化角质，丰富泡沫，清洗容易 温和无刺激，敏感肌肤也适用 滋润肌肤，去除干燥紧绷感 ', '2013-03-31 00:00:00', 0),
(11, '00010001', '欧莱雅 (L\'Oreal)雪颜美白洁面膏 新包装 125ml 温和亲肤 深层清洁 通透无暇 宛若新生 ', ' 欧莱雅雪颜美白洁面膏', 112, 0.7, ' 欧莱雅 (L\'Oreal)雪颜美白洁面膏 新包装 125ml', '2013-03-31 00:00:00', 100, '20130331_1_11.jpg', '欧莱雅 (L\'Oreal)雪颜美白洁面膏 新包装 125ml 温和亲肤 深层清洁 通透无暇 宛若新生 ', '2013-03-31 00:00:00', 0),
(12, '00010001', '巴黎欧莱雅L\'OREAL PARIS男士劲能深层净化洁面膏 100ml 即刻净化皮肤，平滑皮肤，展现神采 含维生素C衍生物 + 抗氧化复合成分 即刻净化并深层清洁皮肤 增强皮肤自身防护能力 ', '巴黎欧莱雅', 39, 0.7, '巴黎欧莱雅L\'OREAL PARIS男士劲能深层净化洁面膏 100ml', '2013-03-31 00:00:00', 100, '20130331_1_12.jpg', '巴黎欧莱雅L\'OREAL PARIS男士劲能深层净化洁面膏 100ml 即刻净化皮肤，平滑皮肤，展现神采 含维生素C衍生物 + 抗氧化复合成分 即刻净化并深层清洁皮肤 增强皮肤自身防护能力 ', '2013-03-31 00:00:00', 0),
(13, '00010001', '欧莱雅 (L\'Oreal)复颜洁面乳125ml', '欧莱雅', 125, 0.7, '欧莱雅 (L\'Oreal)复颜洁面乳125ml ', '2013-03-31 00:00:00', 100, '20130331_1_13.jpg', '欧莱雅 (L\'Oreal)复颜洁面乳125ml', '2013-03-31 00:00:00', 0),
(14, '00010001', '露得清深层净化洗面乳100g（两支）（多款包装随机发货）', '露得清深层净化洗面乳', 48, 0.7, '露得清深层净化洗面乳100g（两支）', '2013-03-31 00:00:00', 100, '20130331_1_14.jpg', '露得清深层净化洗面乳100g（两支）（多款包装随机发货）', '2013-03-31 00:00:00', 0),
(15, '00010001', 'ZA姬芮洁面膏100g 蕴含维生素E按摩颗粒，洗脸同时达到按摩的效果 有效提升肌肤光彩、活力肌肤 深层清洁毛孔污垢，去除老化角质 ', 'Za姬芮洁面膏', 39, 0.7, 'Za姬芮洁面膏 100g', '2013-03-31 00:00:00', 100, '20130331_1_15.jpg', 'ZA姬芮洁面膏100g 蕴含维生素E按摩颗粒，洗脸同时达到按摩的效果 有效提升肌肤光彩、活力肌肤 深层清洁毛孔污垢，去除老化角质 ', '2013-03-31 00:00:00', 0),
(16, '00010001', '肌御坊竹炭皂?新汉方七白皂 125gx2 出黑头克星洗脸手工皂套组 竹炭吸黑头+新七白紧致美白 纳米级竹炭清洁因子，深入毛孔，吸出黑头 中药古方的七白提取，收敛毛孔，紧致美白 ', ' 肌御坊竹炭皂', 169, 0.7, ' 肌御坊竹炭皂?新汉方七白皂 125gx2 ', '2013-03-31 00:00:00', 100, '20130331_1_16.jpg', '肌御坊竹炭皂?新汉方七白皂 125gx2 出黑头克星洗脸手工皂套组 竹炭吸黑头+新七白紧致美白 纳米级竹炭清洁因子，深入毛孔，吸出黑头 中药古方的七白提取，收敛毛孔，紧致美白 ', '2013-03-31 00:00:00', 0),
(17, '00010001', '佰草集平衡洁面乳 100ml 萃取中草药精华，从根本上改善肌肤干燥、过敏不适等症状 令干燥部位变得滋润，油腻部位变得爽适 性质温和，泡沫细腻，清洁保湿且使用后水嫩不紧绷 ', '佰草集平衡洁面乳', 60, 0.7, '佰草集平衡洁面乳 100ml', '2013-03-31 00:00:00', 100, '20130331_1_17.jpg', '佰草集平衡洁面乳 100ml 萃取中草药精华，从根本上改善肌肤干燥、过敏不适等症状 令干燥部位变得滋润，油腻部位变得爽适 性质温和，泡沫细腻，清洁保湿且使用后水嫩不紧绷 ', '2013-03-31 00:00:00', 0),
(18, '00010001', '欧珀莱AUPRES柔润洁面膏 125g 洁面膏泡沫细腻 清除肌肤污垢和老旧角质 并有助于调节肌肤的水油平衡 ', ' 欧珀莱', 90, 0.7, ' 欧珀莱AUPRES柔润洁面膏 125g', '2013-03-31 00:00:00', 100, '20130331_1_18.jpg', '欧珀莱AUPRES柔润洁面膏 125g 洁面膏泡沫细腻 清除肌肤污垢和老旧角质 并有助于调节肌肤的水油平衡 ', '2013-03-31 00:00:00', 0),
(19, '00010001', '相宜本草金缕梅控油净白洗颜泥100g', '相宜本', 35, 0.7, '相宜本草金缕梅控油净白洗颜泥 100g', '2013-03-31 00:00:00', 100, '20130331_1_19.jpg', '相宜本草金缕梅控油净白洗颜泥100g', '2013-03-31 00:00:00', 0),
(20, '00010001', '欧莱雅男士控油炭爽抗黑头洁面膏100ml 两款包装随机发货.', ' 欧莱雅', 39, 0.7, ' 欧莱雅男士控油炭爽抗黑头洁面膏100ml', '2013-03-31 00:00:00', 100, '20130331_1_20.jpg', '欧莱雅男士控油炭爽抗黑头洁面膏100ml 两款包装随机发货.', '2013-03-31 00:00:00', 0),
(21, '00010002', '巨型一号丝瓜水320ML 被誉为“传说中的不老神仙水” 能改善各种肌肤问题 美容教主“伊能静”都用的丝瓜水 ', '巨型一号丝瓜水', 120, 0.7, '巨型一号丝瓜水320ML', '2013-03-31 00:00:00', 100, '20130331_2_1.jpg', '巨型一号丝瓜水320ML 被誉为“传说中的不老神仙水” 能改善各种肌肤问题 美容教主“伊能静”都用的丝瓜水 ', '2013-03-31 00:00:00', 0),
(22, '00010002', '欧莱雅 (L\'Oreal)清润全日保湿柔肤水175ml 清爽化水?喱，独特的柔肤水 温泉矿物精华，提高肌肤储水力 独特锁水配方，沛润超呼想像 清凉镇定，迅速渗入，不含油脂 ', ' 欧莱雅 ', 120, 0.7, ' 欧莱雅 (L\'Oreal)清润全日保湿柔肤水175ml', '2013-03-31 00:00:00', 100, '20130331_2_2.jpg', '欧莱雅 (L\'Oreal)清润全日保湿柔肤水175ml 清爽化水?喱，独特的柔肤水 温泉矿物精华，提高肌肤储水力 独特锁水配方，沛润超呼想像 清凉镇定，迅速渗入，不含油脂 ', '2013-03-31 00:00:00', 0),
(23, '00010002', '雪肌精化妆水200ml KOSE排行榜第一名明星产品 让你的肌肤如雪般晶莹剔透 充分润泽，修复粗糙无光泽的肌肤纹理 ', ' 雪肌精化妆水', 380, 0.7, ' 雪肌精化妆水200ml', '2013-03-31 00:00:00', 100, '20130331_2_3.jpg', '雪肌精化妆水200ml KOSE排行榜第一名明星产品 让你的肌肤如雪般晶莹剔透 充分润泽，修复粗糙无光泽的肌肤纹理 ', '2013-03-31 00:00:00', 0),
(24, '00010002', '欧莱雅 (L\'Oreal)清润葡萄籽精华膜力水175ml 隔离外界污染抗氧化抗衰老 使肌肤更鲜活水润 健康亮泽透出好气色 ', '欧莱雅 ', 135, 0.7, '欧莱雅 (L\'Oreal)清润葡萄籽精华膜力水175ml ', '2013-03-31 00:00:00', 100, '20130331_2_4.jpg', '欧莱雅 (L\'Oreal)清润葡萄籽精华膜力水175ml 隔离外界污染抗氧化抗衰老 使肌肤更鲜活水润 健康亮泽透出好气色 ', '2013-03-31 00:00:00', 0),
(25, '00010002', '膜法世家1908(Mask_Family_1908)绿豆小黄瓜蜜汁 150ml（新版） 两款包装随机发货 一步解决干燥、油腻、敏感、暗沉等多种肌肤问题 补水美白，控油清痘、舒缓排毒、镇静舒缓晒后肌肤 天然植物萃取让黑色素无处藏身 ', '膜法世家1908', 156, 0.7, '膜法世家1908(Mask_Family_1908)绿豆小黄瓜蜜汁 150ml（新版）', '2013-03-31 00:00:00', 100, '20130331_2_5.jpg', '膜法世家1908(Mask_Family_1908)绿豆小黄瓜蜜汁 150ml（新版） 两款包装随机发货 一步解决干燥、油腻、敏感、暗沉等多种肌肤问题 补水美白，控油清痘、舒缓排毒、镇静舒缓晒后肌肤 天然植物萃取让黑色素无处藏身 ', '2013-03-31 00:00:00', 0),
(26, '00010002', '欧莱雅复颜清乳柔肤水175ml 有效抗皱 增强表皮防御能力 带给肌肤丝般光滑愉悦的感受 ', '欧莱雅', 160, 0.7, '欧莱雅复颜清乳柔肤水 175ml', '2013-03-31 00:00:00', 100, '20130331_2_6.jpg', '欧莱雅复颜清乳柔肤水175ml 有效抗皱 增强表皮防御能力 带给肌肤丝般光滑愉悦的感受 ', '2013-03-31 00:00:00', 0),
(27, '00010002', '欧珀莱AUPRES均衡柔润水(滋润型) 150ml 丰润柔滑的均衡柔肤水，能迅速与肌肤融和 具有滋润和软化角质的功效 由内部产生滋润活力，缔造完美的肌肤 ', '欧珀莱 ', 100, 0.7, '欧珀莱 (AUPRES)均衡保湿系列柔润水(滋润型) 150ml ', '2013-03-31 00:00:00', 100, '20130331_2_7.jpg', '欧珀莱AUPRES均衡柔润水(滋润型) 150ml 丰润柔滑的均衡柔肤水，能迅速与肌肤融和 具有滋润和软化角质的功效 由内部产生滋润活力，缔造完美的肌肤 ', '2013-03-31 00:00:00', 0),
(28, '00010002', '伊丽莎白雅顿 (Elizabeth Arden)保湿调理露 200ml(两款包装随机发货) 超赞的保湿力度 不含酒精，却含有丰富的保湿成分 补充胶原蛋白，皮肤紧致的保证 补充水份，提升肌肤自身的保湿能力 ', '伊丽莎白雅顿', 200, 0.7, '伊丽莎白雅顿 (Elizabeth Arden)保湿调理露 200ml', '2013-03-31 00:00:00', 100, '20130331_2_8.jpg', '伊丽莎白雅顿 (Elizabeth Arden)保湿调理露 200ml(两款包装随机发货) 超赞的保湿力度 不含酒精，却含有丰富的保湿成分 补充胶原蛋白，皮肤紧致的保证 补充水份，提升肌肤自身的保湿能力 ', '2013-03-31 00:00:00', 0),
(29, '00010002', '欧莱雅(L\'Oreal)复颜清漾柔肤水175ml', '欧莱雅', 155, 0.7, '欧莱雅(L\'Oreal)复颜清漾柔肤水175ml', '2013-03-31 00:00:00', 100, '20130331_2_9.jpg', '欧莱雅(L\'Oreal)复颜清漾柔肤水175ml', '2013-03-31 00:00:00', 0),
(30, '00010002', '雅漾活泉水喷雾300ml 保湿圣品，世界上最好的喷雾 肌肤享受活泉水SPA，轻松抗敏 适用范围广泛，各类人群均可使用 网上最受欢迎的喷雾，超多好评 ', '雅漾 (Avene)', 180, 0.7, '雅漾 (Avene)舒护活泉水 300ml', '2013-03-31 00:00:00', 100, '20130331_2_10.jpg', '雅漾活泉水喷雾300ml 保湿圣品，世界上最好的喷雾 肌肤享受活泉水SPA，轻松抗敏 适用范围广泛，各类人群均可使用 网上最受欢迎的喷雾，超多好评 ', '2013-03-31 00:00:00', 0),
(31, '00010002', '倩碧 (Clinique)保湿洁肤水2号 200ml 全天然萃取精华，肌肤零负担。 温和清理皮层，促进肌肤自我更新。 长久保湿、二次清洁 ', '倩碧 (Clinique)', 190, 0.7, '倩碧 (Clinique)保湿洁肤水2号 200ml', '2013-03-31 00:00:00', 100, '20130331_2_11.jpg', '倩碧 (Clinique)保湿洁肤水2号 200ml 全天然萃取精华，肌肤零负担。 温和清理皮层，促进肌肤自我更新。 长久保湿、二次清洁 ', '2013-03-31 00:00:00', 0),
(32, '00010002', '欧珀莱 (AUPRES)时光锁紧实弹润系列醒活柔润水（滋润型）136ml答谢品 调整角质层至丰盈状态 缔造充满润泽的健美肌肤 提升弹力效果和丰盈的滋润效果 预防弹力阻碍因子的活动 怡人馨香，让护理倍感舒适 ', ' 欧珀莱', 160, 0.7, ' 欧珀莱 (AUPRES)时光锁紧实弹润系列醒活柔润水（滋润型）136ml答谢品', '2013-03-31 00:00:00', 100, '20130331_2_12.jpg', '欧珀莱 (AUPRES)时光锁紧实弹润系列醒活柔润水（滋润型）136ml答谢品 调整角质层至丰盈状态 缔造充满润泽的健美肌肤 提升弹力效果和丰盈的滋润效果 预防弹力阻碍因子的活动 怡人馨香，让护理倍感舒适 ', '2013-03-31 00:00:00', 0),
(33, '00020001', '谜尚(MISSHA)魅力嫩白 柔护霜SPF30+/PA+++ 21# 50ml 两款包装随机发货 同时代替防晒、隔离、遮瑕和粉底 完美遮瑕，带给肌肤清爽柔滑的使用感受 多种功效齐集一身，各种问题一瓶搞定 ', '谜尚魅力嫩白柔护霜', 168, 0.7, '谜尚魅力嫩白柔护霜SPF30+/PA+++ 50ml', '2013-04-01 00:00:00', 100, '20130331_111_1.jpg', '谜尚(MISSHA)魅力嫩白 柔护霜SPF30+/PA+++ 21# 50ml 两款包装随机发货 同时代替防晒、隔离、遮瑕和粉底 完美遮瑕，带给肌肤清爽柔滑的使用感受 多种功效齐集一身，各种问题一瓶搞定 ', '2013-04-01 00:00:00', 0),
(34, '00030002', '伊丽莎白雅顿第五大道香水 30ml(多款包装随机发货) 婉约、柔和、温暖，是对第五大道永远都不会变得印象 独特瓶身设计, 显示现代都市生活精神 顶级香氛选材， 传达现代都会女性摩登时尚、自信活跃的风采 ', ' 伊丽莎白雅顿', 298, 0.7, ' 伊丽莎白雅顿 (Elizabeth Arden)第五大道香水 30ml', '2013-04-01 00:00:00', 100, '20130331_333_1.jpg', '伊丽莎白雅顿第五大道香水 30ml(多款包装随机发货) 婉约、柔和、温暖，是对第五大道永远都不会变得印象 独特瓶身设计, 显示现代都市生活精神 顶级香氛选材， 传达现代都会女性摩登时尚、自信活跃的风采 ', '2013-04-01 00:00:00', 0),
(35, '00030002', '菲拉格慕 (Ferragamo)梦中彩虹香水 30ml，两款包装，随机发货。 仿佛阳光的照耀，唤起肌肤被温暖阳光包围所散发的香氛 外盒包装如此的引人入胜，犹如置身天堂般的光彩夺目 清新花果香调，优雅怡人 ', '菲拉格慕', 430, 0.7, '菲拉格慕 (Ferragamo)梦中彩虹香水 30ml', '2013-04-01 00:00:00', 100, '20130331_333_2.jpg', '菲拉格慕 (Ferragamo)梦中彩虹香水 30ml，两款包装，随机发货。 仿佛阳光的照耀，唤起肌肤被温暖阳光包围所散发的香氛 外盒包装如此的引人入胜，犹如置身天堂般的光彩夺目 清新花果香调，优雅怡人 ', '2013-04-01 00:00:00', 0),
(36, '00030002', '兰蔻 (Lancome)奇迹香氛 30ml（两款包装随机发货) 味道甜美却不香腻 绝美灵感打造完美香氛 女人就是要展现个性 ', '兰蔻 (Lancome)', 500, 0.7, '兰蔻 (Lancome)奇迹香氛 30ml', '2013-04-01 00:00:00', 100, '20130331_333_3.jpg', '兰蔻 (Lancome)奇迹香氛 30ml（两款包装随机发货) 味道甜美却不香腻 绝美灵感打造完美香氛 女人就是要展现个性 ', '2013-04-01 00:00:00', 0),
(37, '00030002', '范思哲 versace晶钻女用香水 30ml两款包装随机发货 瓶身设计恒久典雅，散发着清新优雅，如花芬芳的气息 精致典雅却又不失生动有趣的石榴香氛 澄澈透净的时尚水晶瓶衬托之下展现优雅妩媚的女性魅力 ', '范思哲', 430, 0.7, '范思哲 versace晶钻女用香水 30ml', '2013-04-01 00:00:00', 100, '20130331_333_4.jpg', '范思哲 versace晶钻女用香水 30ml两款包装随机发货 瓶身设计恒久典雅，散发着清新优雅，如花芬芳的气息 精致典雅却又不失生动有趣的石榴香氛 澄澈透净的时尚水晶瓶衬托之下展现优雅妩媚的女性魅力 ', '2013-04-01 00:00:00', 0),
(38, '00030002', '伊丽莎白雅顿 (Elizabeth Arden)绿茶香水 30ml 香味清新雅淡而脱俗 撷取了了绿茶的治疗精华 提升了凉爽指数和清凉气味 ', '伊丽莎白雅顿', 210, 0.7, '伊丽莎白雅顿 (Elizabeth Arden)绿茶香水 30ml', '2013-04-01 00:00:00', 100, '20130331_333_5.jpg', '伊丽莎白雅顿 (Elizabeth Arden)绿茶香水 30ml 香味清新雅淡而脱俗 撷取了了绿茶的治疗精华 提升了凉爽指数和清凉气味 ', '2013-04-01 00:00:00', 0),
(39, '00030002', '大卫杜夫冷水(女款)30ml，多款包装，随机发货。 即是Davidoff的得意之作，在欧美市场，它已成为香水线的主流产品 凝聚大自然中最重要的元素－水、清新空气及植物的芳香 冷水的造型十分简洁，柔婉的勾画了冷水美人的线条 ', ' 大卫杜夫', 320, 0.7, ' 大卫杜夫 (Davidoff)女士淡香水 30ml', '2013-04-01 00:00:00', 100, '20130331_333_6.jpg', '大卫杜夫冷水(女款)30ml，多款包装，随机发货。 即是Davidoff的得意之作，在欧美市场，它已成为香水线的主流产品 凝聚大自然中最重要的元素－水、清新空气及植物的芳香 冷水的造型十分简洁，柔婉的勾画了冷水美人的线条 ', '2013-04-01 00:00:00', 0),
(40, '00030002', '玛亚科布(MarcJacobs)雏菊女士香水 100ml 极致奢华，赋予体验者无尽年轻、神秘感受 唯美的经典香调 设计灵感独一无二 ', ' 玛亚科布', 880, 0.7, ' 玛亚科布(MarcJacobs)雏菊女士香水 100ml', '2013-04-01 00:00:00', 100, '20130331_333_7.jpg', '玛亚科布(MarcJacobs)雏菊女士香水 100ml 极致奢华，赋予体验者无尽年轻、神秘感受 唯美的经典香调 设计灵感独一无二 ', '2013-04-01 00:00:00', 0),
(41, '00030002', '克丽丝汀迪奥 (DIOR)真我香水 50ml 浓淡有致的花果香调 极其女性气质的表达 触及灵魂深处的馥郁 奢华金色瓶身 ', '克丽丝汀迪奥', 1040, 0.7, '克丽丝汀迪奥(DIOR)真我香水 50ml ', '2013-04-01 00:00:00', 100, '20130331_333_8.jpg', '克丽丝汀迪奥 (DIOR)真我香水 50ml 浓淡有致的花果香调 极其女性气质的表达 触及灵魂深处的馥郁 奢华金色瓶身 ', '2013-04-01 00:00:00', 0),
(42, '00030002', '菲拉格慕蝶忆绽放女士香水 30ml，两款包装，随机发货。 清新的香调，掀起了新一波诱惑 震撼这个挑剔且要求品味与完美的时代 香味独特，香水瓶身的唯美设计 ', '菲拉格慕', 228, 0.7, '菲拉格慕 (Ferragamo)蝶忆绽放女士香水 30ml', '2013-04-01 00:00:00', 100, '20130331_333_9.jpg', '菲拉格慕蝶忆绽放女士香水 30ml，两款包装，随机发货。 清新的香调，掀起了新一波诱惑 震撼这个挑剔且要求品味与完美的时代 香味独特，香水瓶身的唯美设计 ', '2013-04-01 00:00:00', 0),
(43, '00030002', '安娜苏 (Annasui)幻境绮缘淡香水 50ml 永远的紫色绮缘 让甜美的绮丽爱恋不断重现 迷蒙之间诠释着爱的呼唤 持续ANNA SUI香氛设计的浪漫理念 引领女孩们开启魔幻浪漫的绮丽童话 ', '安娜苏', 540, 0.7, '安娜苏 (Annasui)幻境绮缘淡香水 50ml', '2013-04-01 00:00:00', 100, '20130331_333_10.jpg', '安娜苏 (Annasui)幻境绮缘淡香水 50ml 永远的紫色绮缘 让甜美的绮丽爱恋不断重现 迷蒙之间诠释着爱的呼唤 持续ANNA SUI香氛设计的浪漫理念 引领女孩们开启魔幻浪漫的绮丽童话 ', '2013-04-01 00:00:00', 0),
(44, '00030002', '克丽丝汀迪奥花漾甜心淡香水 50ml两款包装随机发货！ 气息温柔甜美 专为亚洲女性推出 低调奢华 ', '克丽丝汀', 830, 0.7, '克丽丝汀迪奥迪奥小姐花漾淡香水 50ml', '2013-04-01 00:00:00', 100, '20130331_333_11.jpg', '克丽丝汀迪奥花漾甜心淡香水 50ml两款包装随机发货！ 气息温柔甜美 专为亚洲女性推出 低调奢华 ', '2013-04-01 00:00:00', 0),
(45, '00030002', '浪凡Lanvin Eclat D\'Arpege光韵女士香水 30ml（两款包装随机发货） 若隐若现芳香诱惑，散发十足女人味 一首悦耳的旋律，引领你进入光韵的世界 呈现新世代女性柔美、愉悦、优雅而性感的个性 ', '浪凡', 428, 0.7, '浪凡Lanvin Eclat D\'Arpege光韵女士香水 30ml', '2013-04-01 00:00:00', 100, '20130331_333_12.jpg', '浪凡Lanvin Eclat D\'Arpege光韵女士香水 30ml（两款包装随机发货） 若隐若现芳香诱惑，散发十足女人味 一首悦耳的旋律，引领你进入光韵的世界 呈现新世代女性柔美、愉悦、优雅而性感的个性 ', '2013-04-01 00:00:00', 0);

-- --------------------------------------------------------

--
-- 表的结构 `article_type`
--

CREATE TABLE `article_type` (
  `CODE` varchar(100) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `REMARK` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `article_type`
--

INSERT INTO `article_type` (`CODE`, `NAME`, `REMARK`) VALUES
('0001', '护肤', '护肤'),
('00010001', '----洁面', '洁面'),
('00010002', '----化妆水', '化妆水'),
('00010003', '----喷雾', '喷雾'),
('00010004', '----美容液', '美容液'),
('00010005', '----眼霜', '眼霜'),
('00010006', '----面膜', '面膜'),
('00010007', '----精华', '精华'),
('00010008', '----精油', '精油'),
('0002', '彩妆', '彩妆'),
('00020001', '----缷妆', '缷妆'),
('00020002', '----隔离', '隔离'),
('00020003', '----BB霜', 'BB霜'),
('0003', '香氛', '香氛'),
('00030001', '----男士香水', '男士香水'),
('00030002', '----女士香水', '女士香水'),
('00030003', '----中性香水', '中性香水'),
('0004', '身体护理', '身体护理'),
('00040001', '----洗发', '洗发'),
('00040002', '----护发', '护发'),
('00040003', '----沐浴', '沐浴'),
('00040004', '----身体乳', '身体乳'),
('00040005', '----护手霜', '护手霜'),
('0005', '礼盒套装', '礼盒套装'),
('00050001', '----护肤', '护肤'),
('00050002', '----成功', '成功'),
('00050003', '----彩妆', '彩妆'),
('00050004', '----旅行装', '旅行装'),
('0006', '母婴专区', '母婴专区'),
('00060001', '----奶粉', '奶粉'),
('00060002', '----纸尿裤', '纸尿裤'),
('00060003', '----7-10', '7-10岁'),
('00060004', '----11-14', '11-14岁'),
('00060005', '----科学', '科学'),
('00060006', '----图画书', '图画书'),
('0007', '男士专区', '男士专区'),
('00070001', '----两性', '两性'),
('00070002', '----爽肤水', '爽肤水'),
('00070003', '----面霜', '面霜'),
('00070004', '----啫喱', '啫喱'),
('00070005', '----男香', '男香'),
('00070006', '----运动', '运动'),
('00070007', '----凝胶', '凝胶'),
('0008', '粉底', '粉底'),
('00080001', '----经济', '经济'),
('00080002', '----会计', '会计'),
('00080003', '----人力资源', '人力资源'),
('00080004', '----创业', '创业'),
('0009', '粉饼', '粉饼'),
('00090001', '----教材', '教材'),
('00090002', '----外语', '外语'),
('00090003', '----考试', '考试'),
('00090004', '----中小学教辅', '中小学教辅'),
('0010', '睫毛膏', '睫毛膏'),
('0011', '唇彩', '唇彩'),
('0012', '腮红', '腮红'),
('0013', '食品保健', '食品保健'),
('0014', '瘦身类', '瘦身类'),
('0015', '美容类', '美容类');

-- --------------------------------------------------------

--
-- 表的结构 `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$150000$tDMQ0EHSPqyg$R9nX2m6BR3/gLvzM+aVvDLmuF4tLWPxzk+GjuzpwZps=', '2019-09-02 11:49:47.124553', 1, 'admin', '', '', '', 1, 1, '2019-09-02 11:48:42.124791');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cart`
--

CREATE TABLE `cart` (
  `cid` int(11) NOT NULL,
  `aname` varchar(200) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cart`
--

INSERT INTO `cart` (`cid`, `aname`, `quantity`, `uid`) VALUES
(61, '1', 2, 3),
(79, 'Cetaphil丝塔芙洁面乳 118ml 全美皮肤科及儿科医师推荐品牌 极其温和的配方，卓越的保湿功效 严谨的生产方式，众多明星推荐 ', 1, 10),
(80, 'Mentholatum曼秀雷敦男士冰爽活炭洁面乳150ml 冰凉薄荷，深层洁净 保持皮肤滋润清爽，让脸部恢复光滑 早晚使用，倍感肌肤清爽柔润 ', 1, 10),
(81, '比度克 (BeDook)抗痘控油洁面膏 60g(两款包装随机发货) 祛痘第一步 痘肌必备清洁法宝 抑痘防感染洁面 解除油光危“肌” 洁面控油 杀菌抑痘 ', 1, 10),
(82, '洗颜专科柔澈泡沫洁面乳 120g(资生堂授权特供)(多款包装,随机发货) 屈臣氏畅销硬货之一，在网络上也拥有无数的好评 洁面产品中首次推出的超细腻超丰富泡沫 适合各种肌肤的洁面产品 ', 1, 10),
(83, '谜尚(MISSHA)魅力嫩白 柔护霜SPF30+/PA+++ 21# 50ml 两款包装随机发货 同时代替防晒、隔离、遮瑕和粉底 完美遮瑕，带给肌肤清爽柔滑的使用感受 多种功效齐集一身，各种问题一瓶搞定 ', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- 表的结构 `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-09-02 11:46:05.709937'),
(2, 'auth', '0001_initial', '2019-09-02 11:46:07.056071'),
(3, 'admin', '0001_initial', '2019-09-02 11:46:14.365960'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-09-02 11:46:16.979252'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-09-02 11:46:17.099752'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-09-02 11:46:18.174007'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-09-02 11:46:19.075394'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-09-02 11:46:19.967449'),
(9, 'auth', '0004_alter_user_username_opts', '2019-09-02 11:46:20.019955'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-09-02 11:46:20.547562'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-09-02 11:46:20.604772'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-09-02 11:46:20.658719'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-09-02 11:46:21.768775'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-09-02 11:46:22.472667'),
(15, 'auth', '0010_alter_group_name_max_length', '2019-09-02 11:46:23.458949'),
(16, 'auth', '0011_update_proxy_permissions', '2019-09-02 11:46:23.512506'),
(17, 'sessions', '0001_initial', '2019-09-02 11:46:23.748371');

-- --------------------------------------------------------

--
-- 表的结构 `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('3gsg2lqdg1vkvgcupbw55i4zvqnuki4i', 'YTI1MTE1N2U2YThhNDNhYzJlNDJjYjU3YTUyMmEwYjU3NWRlYTFkOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMDJjODljOWZlZjYyMWUwOTc5NDY1ODdiMTU1ZDFhMzEyMTMxNjA1In0=', '2019-09-16 11:49:47.218758');

-- --------------------------------------------------------

--
-- 表的结构 `order`
--

CREATE TABLE `order` (
  `oid` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `uname` varchar(20) DEFAULT NULL,
  `ocreattime` varchar(50) DEFAULT NULL,
  `ocost` double(20,0) DEFAULT NULL,
  `ostatus` int(11) DEFAULT NULL,
  `sendtime` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `order`
--

INSERT INTO `order` (`oid`, `uid`, `uname`, `ocreattime`, `ocost`, `ostatus`, `sendtime`, `amount`) VALUES
(1, 1, '管理员', '2011-11-11 12:11:10', 2288, 1, '2011-11-11 12:43:07', 1),
(16, 1, 'admin', '2018-08-14 04:24:27', 126, 0, '', 4),
(17, 1, 'admin', '2018-08-14 06:45:40', 41, 0, NULL, 1),
(18, 1, 'admin', '2018-08-14 06:47:25', 227, 0, NULL, 3),
(19, 1, 'admin', '2018-08-14 06:49:25', 82, 0, NULL, 3);

-- --------------------------------------------------------

--
-- 表的结构 `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `oid` int(11) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `aname` varchar(200) DEFAULT NULL,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `order_details`
--

INSERT INTO `order_details` (`id`, `oid`, `aid`, `quantity`, `aname`, `price`) VALUES
(1, 8, 45, 3, 'Cetaphil丝塔芙洁面乳 237ml 名副其实的洁面冠军 无与伦比的温和洁面新体验 所有肤质全部适用 ', 898.8),
(2, 8, 45, 2, 'Cetaphil丝塔芙洁面乳 237ml 名副其实的洁面冠军 无与伦比的温和洁面新体验 所有肤质全部适用 ', 599.1999999999999),
(3, 8, 45, 2, 'Cetaphil丝塔芙洁面乳 237ml 名副其实的洁面冠军 无与伦比的温和洁面新体验 所有肤质全部适用 ', 599.1999999999999),
(4, 9, 45, 3, 'Cetaphil丝塔芙洁面乳 237ml 名副其实的洁面冠军 无与伦比的温和洁面新体验 所有肤质全部适用 ', 898.8),
(5, 9, 45, 2, 'Cetaphil丝塔芙洁面乳 237ml 名副其实的洁面冠军 无与伦比的温和洁面新体验 所有肤质全部适用 ', 599.1999999999999),
(6, 9, 45, 2, 'Cetaphil丝塔芙洁面乳 237ml 名副其实的洁面冠军 无与伦比的温和洁面新体验 所有肤质全部适用 ', 599.1999999999999),
(7, 10, 45, 3, 'Cetaphil丝塔芙洁面乳 237ml 名副其实的洁面冠军 无与伦比的温和洁面新体验 所有肤质全部适用 ', 898.8),
(8, 10, 45, 2, 'Cetaphil丝塔芙洁面乳 237ml 名副其实的洁面冠军 无与伦比的温和洁面新体验 所有肤质全部适用 ', 599.1999999999999),
(9, 10, 45, 2, 'Cetaphil丝塔芙洁面乳 237ml 名副其实的洁面冠军 无与伦比的温和洁面新体验 所有肤质全部适用 ', 599.1999999999999),
(10, 11, 45, 3, 'Cetaphil丝塔芙洁面乳 237ml 名副其实的洁面冠军 无与伦比的温和洁面新体验 所有肤质全部适用 ', 898.8),
(11, 11, 45, 2, 'Cetaphil丝塔芙洁面乳 237ml 名副其实的洁面冠军 无与伦比的温和洁面新体验 所有肤质全部适用 ', 599.1999999999999),
(12, 11, 45, 2, 'Cetaphil丝塔芙洁面乳 237ml 名副其实的洁面冠军 无与伦比的温和洁面新体验 所有肤质全部适用 ', 599.1999999999999),
(13, 12, 45, 3, 'Cetaphil丝塔芙洁面乳 237ml 名副其实的洁面冠军 无与伦比的温和洁面新体验 所有肤质全部适用 ', 898.8),
(14, 12, 45, 2, 'Cetaphil丝塔芙洁面乳 237ml 名副其实的洁面冠军 无与伦比的温和洁面新体验 所有肤质全部适用 ', 599.1999999999999),
(15, 12, 45, 2, 'Cetaphil丝塔芙洁面乳 237ml 名副其实的洁面冠军 无与伦比的温和洁面新体验 所有肤质全部适用 ', 599.1999999999999),
(16, 13, 45, 1, 'Cetaphil丝塔芙洁面乳 118ml 全美皮肤科及儿科医师推荐品牌 极其温和的配方，卓越的保湿功效 严谨的生产方式，众多明星推荐 ', 299.59999999999997),
(17, 13, 45, 1, 'Cetaphil丝塔芙洁面乳 237ml 名副其实的洁面冠军 无与伦比的温和洁面新体验 所有肤质全部适用 ', 299.59999999999997),
(18, 13, 45, 1, 'Cetaphil丝塔芙洁面乳 237ml 名副其实的洁面冠军 无与伦比的温和洁面新体验 所有肤质全部适用 ', 299.59999999999997),
(19, 14, 45, 3, '比度克 (BeDook)抗痘控油洁面膏 60g(两款包装随机发货) 祛痘第一步 痘肌必备清洁法宝 抑痘防感染洁面 解除油光危“肌” 洁面控油 杀菌抑痘 ', 898.8),
(20, 15, 45, 7, '巴黎欧莱雅L\'OREAL PARIS男士劲能深层净化洁面膏 100ml 即刻净化皮肤，平滑皮肤，展现神采 含维生素C衍生物 + 抗氧化复合成分 即刻净化并深层清洁皮肤 增强皮肤自身防护能力 ', 2097.2),
(21, 16, 4, 4, '洗颜专科柔澈泡沫洁面乳 120g(资生堂授权特供)(多款包装,随机发货) 屈臣氏畅销硬货之一，在网络上也拥有无数的好评 洁面产品中首次推出的超细腻超丰富泡沫 适合各种肌肤的洁面产品 ', 125.99999999999999),
(22, 17, 2, 1, 'Cetaphil丝塔芙洁面乳 118ml 全美皮肤科及儿科医师推荐品牌 极其温和的配方，卓越的保湿功效 严谨的生产方式，众多明星推荐 ', 40.599999999999994),
(23, 18, 1, 3, 'Cetaphil丝塔芙洗面奶(法国) 200ml 极其温和的配方 卓越的保湿功效 严谨的生产方式 ', 226.79999999999998),
(24, 19, 7, 3, '比度克 (BeDook)抗痘控油洁面膏 60g(两款包装随机发货) 祛痘第一步 痘肌必备清洁法宝 抑痘防感染洁面 解除油光危“肌” 洁面控油 杀菌抑痘 ', 81.68999999999998);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `uname` varchar(20) DEFAULT NULL,
  `upassword` varchar(50) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`uid`, `uname`, `upassword`, `realname`, `sex`, `phone`, `address`, `email`) VALUES
(1, 'admin', 'admin', '管理员', '男', '12345678909', '湖北武汉', 'admin'),
(2, 'xiaoye', 'xiaoye', 'xiaoye', '男', '13512412414', '湖北武汉', '1234567@qq.com'),
(3, 'admmss', 'xiaoye', 'hongx', 'on', '13512312312', '湖北武汉', 'tony@163.com'),
(4, 'xiaoxiao', 'xiaoxiao', '杨鸿翔', '男', '13512312312', '湖北武汉', '312345566@qq.com'),
(5, 'zhangsan', 'zhangsan', '张三', '男', '13311111111', '湖北武汉', '23455666@qq.com'),
(8, NULL, '123456', 'tony', NULL, '湖北武汉洪山', '15525555555', '1222@qq.com'),
(9, 'admins@163.com', '789456', '789456', '321', '1', '321', '18765432112');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_ARTICLE_TYPE` (`TYPE_CODE`) USING BTREE;

--
-- Indexes for table `article_type`
--
ALTER TABLE `article_type`
  ADD PRIMARY KEY (`CODE`),
  ADD UNIQUE KEY `NAME` (`NAME`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`oid`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `article`
--
ALTER TABLE `article`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- 使用表AUTO_INCREMENT `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- 使用表AUTO_INCREMENT `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cart`
--
ALTER TABLE `cart`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- 使用表AUTO_INCREMENT `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `order`
--
ALTER TABLE `order`
  MODIFY `oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- 使用表AUTO_INCREMENT `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 限制导出的表
--

--
-- 限制表 `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_ARTICLE_TYPE` FOREIGN KEY (`TYPE_CODE`) REFERENCES `article_type` (`CODE`);

--
-- 限制表 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- 限制表 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 限制表 `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
