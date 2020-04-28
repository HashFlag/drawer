/*
 Navicat MySQL Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : drawer

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 28/04/2020 21:58:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app01_comment
-- ----------------------------
DROP TABLE IF EXISTS `app01_comment`;
CREATE TABLE `app01_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `device` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ctime` datetime(6) NOT NULL,
  `news_id` int(11) NOT NULL,
  `user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentcomment_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app01_commont_news_id_a3ab68f0_fk_app01_news_id`(`news_id`) USING BTREE,
  INDEX `app01_comment_parentcomment_id_f2a9211e_fk_app01_comment_id`(`parentcomment_id`) USING BTREE,
  CONSTRAINT `app01_comment_parentcomment_id_f2a9211e_fk_app01_comment_id` FOREIGN KEY (`parentcomment_id`) REFERENCES `app01_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `app01_commont_news_id_a3ab68f0_fk_app01_news_id` FOREIGN KEY (`news_id`) REFERENCES `app01_news` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_comment
-- ----------------------------
INSERT INTO `app01_comment` VALUES (1, '啊的发生发生法发的', 'iPad', '2020-03-21 07:29:23.717215', 1, 'eric', NULL);
INSERT INTO `app01_comment` VALUES (2, '阿斯顿发大水发顺丰', 'iPad', '2020-03-21 07:32:35.680576', 1, 'eric', NULL);
INSERT INTO `app01_comment` VALUES (10, '撒旦发顺丰大是打发发发', 'Windows NT 10.0', '2020-03-22 02:09:01.138080', 1, 'jack', NULL);
INSERT INTO `app01_comment` VALUES (11, '撒旦发顺丰大萨法沙发沙发', 'Windows NT 10.0', '2020-03-22 02:09:01.814659', 1, 'jack', NULL);
INSERT INTO `app01_comment` VALUES (42, '爱的色放刚刚发挥得更好的', 'Windows NT 10.0', '2020-03-27 11:43:13.795441', 1, 'jack', 10);
INSERT INTO `app01_comment` VALUES (44, '发撒打发阿斯顿发放法国获得丰厚的钢结构', 'Windows NT 10.0', '2020-03-28 06:57:06.105187', 2, 'jack', NULL);
INSERT INTO `app01_comment` VALUES (45, '东方红东方红东方红东方红东方红的风格和', 'Windows NT 10.0', '2020-03-28 06:57:39.985246', 2, 'jack', NULL);
INSERT INTO `app01_comment` VALUES (46, '回家看了更何况寄给客户', 'Windows NT 10.0', '2020-03-28 06:59:18.845379', 2, 'jack', NULL);
INSERT INTO `app01_comment` VALUES (47, '疯狂过后即可观看更何况归还借款归还看', 'Windows NT 10.0', '2020-03-28 07:01:04.568675', 2, 'jack', NULL);

-- ----------------------------
-- Table structure for app01_news
-- ----------------------------
DROP TABLE IF EXISTS `app01_news`;
CREATE TABLE `app01_news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ctime` datetime(6) NOT NULL,
  `nt` int(11) NOT NULL,
  `userSend_id` int(11) NOT NULL,
  `commentcount` int(11) NOT NULL,
  `favorcount` int(11) NOT NULL,
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app01_news_userSend_id_1a547c5f_fk_app01_userinfo_nid`(`userSend_id`) USING BTREE,
  CONSTRAINT `app01_news_userSend_id_1a547c5f_fk_app01_userinfo_nid` FOREIGN KEY (`userSend_id`) REFERENCES `app01_userinfo` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_news
-- ----------------------------
INSERT INTO `app01_news` VALUES (1, '哈工大开发出“电子体毛”：可增加机器人的敏感性', '我们已经见识过许多版本的“触敏电子皮肤”，它可以为机器人或义肢带来“敏感性”上的加成，但多数专注 于“皮肤”本身，而忽略了“触感”。好消息是哈尔滨工业大学科学家们选择了一条不通过的发展道路，打造出一 种突出于弹性的玛法传感器...', NULL, '2020-03-12 19:29:00.000000', 1, 10, 13, 20, 'static\\upload\\鬼刀22.jpg');
INSERT INTO `app01_news` VALUES (2, 'papi酱经纪公司泰洋川禾获字节跳动1.8亿元B轮投资', '天眼查股东信息显示，泰洋川禾CEO杨铭持有该公司48.52%的股份，为该公司最大股东；字节跳动的运营主体北京量子跃动科技有限公司持有该公司8.55%的股份，为该公司第四大股东。此前，2017年4月，泰洋川禾宣布完成A轮融资，由光大金控旗下的文化产业基金领投，真格基金、星图资本和光源资本跟投。这些投资方也都在股东行列之中。', NULL, '2020-03-12 19:35:13.000000', 2, 2, 12, 28, 'static\\upload\\鬼刀2.jpg');
INSERT INTO `app01_news` VALUES (3, '李佳琦为什么要蹭“N姓女明星”的热度？ ', '熟悉李佳琦直播的人应该对这只网红小狗Never不陌生。Never是李佳琦直播间的常客，时常作为特别嘉宾亮相，给粉丝们表演招牌才艺“拜拜”。李佳琦在微博也经常发布有关Never日常生活的照片和视频。今年除夕夜，Never还和李晨、主持人赵姬一起，参与李佳琦助力阿里巴巴抗疫公益项目的直播。', NULL, '2020-03-12 19:37:05.000000', 3, 6, 20, 130, 'static\\upload\\鬼刀6.jpg');
INSERT INTO `app01_news` VALUES (4, 'NBA宣布本赛季暂停，何时复赛将另行通知 ', 'NBA官方声明：“犹他爵士队的一位球员的新冠病毒检测结果为阳性，检测结果在雷霆和爵士开赛前知晓。因此今晚这场比赛被取消，但是受感染的球员今天没有出现在球馆。今天之后的所有比赛将暂时暂停，何时恢复会另行通知。联盟会利用这个间歇期来确定NBA下一步的发展方向。”', NULL, '2020-03-12 19:37:49.000000', 4, 8, 45, 44, 'static\\upload\\鬼刀8.jpg');
INSERT INTO `app01_news` VALUES (5, '业绩亮眼、股价惨淡，36氪的媒体生意怎么了？ ', '北京时间3月11日，科技媒体36氪发布了2019年第四季度及全年业绩报告，交出了一份十分亮眼的成绩单，在长期不受资本市场认可的背景下，这份成绩单让36氪寄予了很大的希望，但是和当天纳斯达克惨绿的大盘一道，36氪股价并没有什么起色，反而下跌了4.8%，报收4.76美元，最新市值为1.78亿美元。', NULL, '2020-03-12 19:38:33.000000', 5, 9, 67, 87, 'static\\upload\\鬼刀9.jpg');
INSERT INTO `app01_news` VALUES (6, '5L装的“全家桶”奶茶，是个好营销吗？ ', '价格对比容量，可以说性价比很高了。大剂量、土豪式海报冲击下，抓眼球的效果也立竿见影。饮品店老板很兴奋：太期望有顾客愿意主动来报复性消费了，疫情受损的营业额还愁赚不回来吗？社交媒体也很兴奋：又是一波热点，恶搞的表情包图片做一波，热度可以持续一段时间\r\n！但消费者有顾虑：看起来很满足，喝起来有压力。医生也有顾虑：这么一大桶下去，血糖瞬间升高。实际上，5L装奶茶的概念倡导的是分享：办公室、家里集体下单，可以分享实用。随桶附赠的喝茶专用杯、珍珠分装杯和吸管，以方便饮用。', NULL, '2020-03-12 19:42:32.000000', 1, 10, 2, 96, 'static\\upload\\鬼刀22.jpg');
INSERT INTO `app01_news` VALUES (7, '日本粉丝经济，中国工厂制造 ', '随着疫情的发展，日本eplus等演出信息网站上，挂出了包括滨崎步、AKB48等上百场演唱会取消的消息，并且这个名单还在不断的增加。据业内人士估计，包括门票、粉丝周边等，“收入损失可能高达30-50亿RMB。”而在整个日本粉丝经济的背后，都是靠中国制造支撑着。', NULL, '2020-03-12 19:42:56.000000', 2, 1, 5, 45, 'static\\upload\\鬼刀2.jpg');
INSERT INTO `app01_news` VALUES (8, '日本粉丝经济，中国工厂制造', '日本粉丝经济，是一个很笼统的概念，包括各类明星、动漫、游戏、杂志，甚至是一个餐厅，他们在本身的业务基础上，基于自己品牌和影响力发行的周边，都可以归纳为粉丝经济。粉丝周边的商品包括手办、日常生活用品、徽章、纺织品等各种物品。而在这其中，最受欢迎的就是人形（figure），即人物模型，俗称手办，后来也包括汽车、建筑物、动植物、虚拟事物等模型。日本的周边产品，也成了一种文化现象，融入到普通人生活中。', NULL, '2020-03-12 19:44:25.000000', 3, 2, 7, 75, 'static\\upload\\鬼刀6.jpg');
INSERT INTO `app01_news` VALUES (9, '海底捞恢复营业的第一天，客人少得有点可怜', '3月11日，海底捞在微博宣布，3月12日起海底捞火锅在15个城市，首批85家门店将恢复营业，提供堂食。其中，首批恢复门店堂食的城市中包括成都、杭州、佛山、海口、南京、厦门等地，北上广深均不在列。根据这份营业门店表，界面新闻走访了杭州市多家海底捞门店，所有门店营业时间从原本的24小时缩短到10小时，即10点营业，22点歇业。', NULL, '2020-03-12 19:47:29.000000', 4, 6, 12, 20, 'static\\upload\\鬼刀8.jpg');
INSERT INTO `app01_news` VALUES (10, '你以为文言编程只是闹着玩？三个月后，人家IDE、教程、包管理器都有了 ', '\r\n之前文言编程不是没有 IDE，我们可以在线使用，并编译。但当时 IDE 并没有开源，它的高亮也有点「神奇」，在输入与编辑过程中了并不能高亮，只有编译后才能修改语句的颜色。而且有些中文会被认为是关键词，并不能直接使用，例如机器之心的「之」，如下是我们 2019 年年会的推文，它采用的就是当时的在线 IDE。', NULL, '2020-03-12 19:49:18.000000', 5, 8, 43, 10, 'static\\upload\\鬼刀9.jpg');
INSERT INTO `app01_news` VALUES (11, '张一鸣全员信宣布组织升级，张利东、张楠担任字节跳动（中国）董事长和CEO', '3月12日起，张利东担任字节跳动（中国）董事长，作为中国职能总负责人，全面协调公司运营，包括字节跳动中国的战略、商业化、战略合作伙伴建设、法务、公共事务、公共关系、财务、人力；抖音CEO张楠将担任字节跳动（中国）CEO，作为中国业务总负责人，全面协调公司中国业务的产品、运营、市场和内容合作，包括今日头条、抖音、西瓜视频、搜索等业务和产品。两人向张一鸣汇报。', NULL, '2020-03-12 19:50:05.000000', 1, 9, 23, 14, 'static\\upload\\鬼刀22.jpg');
INSERT INTO `app01_news` VALUES (12, '《轩辕剑柒》首个预告公开 2020年登陆PC/PS4等平台', '　曾在《轩辕剑肆》中出现的“天书”系统也将会在本作中以新的面貌回归，比如在战斗中玩家可以使用“天书之力”张开一个缓速空间，增加战斗获胜的机会：“收妖”、“炼化”将分别提供收伏妖魔和炼化素材的能力，炼化过程中不仅会产生新的妖魔，更有概率生成御魂，强化太史昭自身能力。此外天书还有武器强化、防具打造、饰品制作、御魂培养等不同功效', NULL, '2020-03-12 19:51:29.000000', 2, 10, 56, 57, 'static\\upload\\鬼刀2.jpg');
INSERT INTO `app01_news` VALUES (13, '你现在可以用花呗在Steam、eShop和PSN买游戏了', '根据我们的测试，现在前往 Steam，港服 PS Store 和 eShop 购买游戏，结账时选择支付宝，在付款方式中可以选择花呗结账。除此之外，Epic 和 GOG 也加入了可以使用花呗的大军。', NULL, '2020-03-12 19:52:21.000000', 3, 1, 10, 25, 'static\\upload\\鬼刀6.jpg');
INSERT INTO `app01_news` VALUES (14, '没有这些脏乱累，哪儿来的“今日头条”', '早上九点，刘吉手下20多个人就坐在各自的台式机前，眼睛一眨不眨盯着屏幕，没有任何交流。要不是手里来回移动的鼠标和屏幕点击声，外人会以为这些人统统陷入了“JPG模式”。他们的屏幕上满是文字，仔细看去，都是用户给电商平台的留言：“我的货还没到”，“什么时候能发货”，“周二可以发货吗”……数据标注员熟练地给这些语句中出现的“语素”打上各种标签，包括情感、词性和用户诉求。而这样的句子，他们一天就要处理2000多条。', NULL, '2020-03-12 19:53:33.000000', 4, 2, 30, 36, 'static\\upload\\鬼刀8.jpg');
INSERT INTO `app01_news` VALUES (15, '抖音与印度的“爱恨纠缠录”要持续到什么时候？', '字节跳动旗下Tik Tok (抖音海外版)在2019年以病毒流行的趋势攻占全球150多个国家，这种趋势到2020年不仅没有降温，还呈现出更加不可逆的爆炸性传播趋势，风头彻底盖过Facebook、instagram等全球成熟的明星产品。根据数据分析机构Sensor Tower的商店情报数据显示，今年2月抖音及其海外版TikTok以将近1.13亿次下载量，蝉联全球移动应用（非游戏）下载榜冠军，较2019年增长96.5%，几乎翻了一番。', NULL, '2020-03-12 19:54:01.000000', 5, 6, 33, 45, 'static\\upload\\鬼刀9.jpg');
INSERT INTO `app01_news` VALUES (16, '英国宣布对Facebook、谷歌、亚马逊征收2%的数字税', '英国称这项税收可能会影响“收入来自向英国用户提供社交媒体服务、搜索引擎或在线市场的大型跨国企业”，其中的关键将是Facebook、谷歌和亚马逊。美国公司经常因为在英国创造的巨额收入只缴纳很少的税而受到批评。腾讯科技讯 3月12日，据外媒报道称，英国政府证实，将开征数字服务税，对Facebook、谷歌和亚马逊等公司在英国的在线收入征收2%的税。', NULL, '2020-03-12 19:54:56.000000', 1, 8, 44, 5, 'static\\upload\\鬼刀22.jpg');
INSERT INTO `app01_news` VALUES (17, '红极一时的AR公司Magic Leap寻求出售 估值超100亿美元', '腾讯科技讯 据外媒报道，消息人士周三透露，已募集超20亿美元用于开发增强现实设备的初创公司Magic Leap，当前正在考虑包括对外出售在内的战略选择。据悉，这家曾红极一时的初创公司正与顾问合作，考虑包括对外出售、建立合作伙伴关系或在在上市前出售大量股份等战略选择。消息人士称，如果Magic Leap坚持对外出售，售价可能超过100亿美元。因为信息是保密的，该消息人士不要求透露姓名。', NULL, '2020-03-12 19:56:40.000000', 2, 9, 21, 7, 'static\\upload\\鬼刀2.jpg');
INSERT INTO `app01_news` VALUES (18, '孙正义三年来再次发推称愿提供病毒检测 被网友狂批', '对于日本国内的疫情，日本首富孙正义日前发推表示愿意提供帮助，自己出钱提供100万分新冠病毒检测试剂帮助对抗疫情，结果被日本喷子狂喷动机不良，2个小时候孙正义就认输了。跟很多传统富豪一样，孙正义及其创办的软银虽然投资了大量互联网公司，但他本人并不是那种在网上很活跃的人，上次发推还是三年前的2017年2月份，这次发推也是想宣布一件大事。', NULL, '2020-03-12 19:57:22.000000', 3, 10, 31, 8, 'static\\upload\\鬼刀6.jpg');
INSERT INTO `app01_news` VALUES (19, 'iPhone 9，新 iPad Pro，还有全新的 Apple TV', '苹果的爆料信息天天见，但能提供「靠谱」内容的人并不多。大家比较熟知的分析师郭明褀大概算一个，而彭博社的 Mark Gurman 则是另一人。前者手握着上游供应链端的信源，而后者则和多位苹果内部员工保持着紧密联系，依靠近水楼台的优势，这使他们往往能第一时间获得较为准确的内幕。最近，9to5Mac 提前获得了一部分尚未发布的 iOS 14 系统代码。和往年一样，这些代码中不仅暗藏着苹果即将推出的软件功能，也可以挖掘出不少有关苹果新品的细节。', NULL, '2020-03-12 19:58:46.000000', 4, 1, 45, 6, 'static\\upload\\鬼刀8.jpg');
INSERT INTO `app01_news` VALUES (20, '拼多多2019年全年营收301.4亿元 同比增长130%', '腾讯科技讯 拼多多（纳斯达克证券代码：PDD）周三盘前发布了该公司截至2019年12月31日的第四季度及全年未经审计财报。2019年全年，平台GMV为人民币10066亿元，较上一年的4716亿元同比增长113%。全年拼多多实现营收301.4亿元，较上一年同期的131.2亿元同比增长130%。全年拼多多经营亏损为85.4亿元，对比上一年同期为108.0亿元；非通用会计准则下，平台经营亏损59.8亿元，对比上一年同期为39.6亿元。全年拼多多归属于普通股股东的净亏损为69.7亿元；非通用会计准则下，归属于普通股股东的净亏损为42.7亿元。', NULL, '2020-03-12 20:00:27.000000', 5, 1, 46, 72, 'static\\upload\\鬼刀9.jpg');
INSERT INTO `app01_news` VALUES (21, '刘作虎：一加三段式按键安卓机唯一 5年付出亿级成本', '在小细节设计上如此执着的，国内手机品牌中，一加算是少数之一。今日，刘作虎发微博称，一加可能是Android机里唯一保留三段式按键设计的品牌。从5年前至今我们付出了机身占用、亿级成本等等很多代价，但极高的好评表明了它的价值。', NULL, '2020-03-12 20:01:02.000000', 1, 2, 47, 31, 'static\\upload\\鬼刀22.jpg');
INSERT INTO `app01_news` VALUES (22, '小象优品：国产手机越来越贵，你会“真香”吗？', '不得不说，作为OPPO 5G旗舰手机，Find X2代表了OPPO的极致追求与探索，展现了OPPO持续深耕高端市场的决心和能力，尤其是从这次的新品价格，可见一斑。这次，OPPO Find X2售价5499元起，Find X2 Pro售价为6999元，让无数网友感慨：现在的国产机是卖的越来越贵了。', NULL, '2020-03-12 20:01:42.000000', 2, 6, 78, 12, 'static\\upload\\鬼刀2.jpg');
INSERT INTO `app01_news` VALUES (23, '潘石屹要“清仓”？在谈，还没定。', '上一次，SOHO中国股价大涨还是半年前的2019年10月30日，盘中涨幅一度高至27.07%，因有报道称SOHO中国正考虑以80亿美元（约627亿港元）出售其在中国的办公大楼。这一次的“异动”又是因为什么？很快，市场传出消息，美国黑石集团提出以6港元/股的价格私有化SOHO中国，交易价值40亿美元。3月10日，刚刚遭遇过“黑色星期一”的股民发现，罕有消息的SOHO中国于当天开盘后突然直线拉升，临时停牌时涨幅达37.58%，报4.1港元/股，创52周新高，并于3月10日上午11时12分起短暂停牌。', NULL, '2020-03-12 20:07:47.000000', 3, 2, 79, 21, 'static\\upload\\鬼刀6.jpg');
INSERT INTO `app01_news` VALUES (24, '人脸搜索，在 AI 的阴暗面肆无忌惮', '2018 年 10 月的一个星期二晚上，Gristedes 便利连锁店的亿万富翁老板 John Catsimatidis 在曼哈顿苏活区附近一家高档意大利餐厅用餐，他的女儿 Andrea 与一名 Catsimatidis 不认识的人一同走了进来。显然，他的女儿没有发现自己的父亲也在这家餐厅里，此时，Catsimatidis 叫服务员走过去拍张照片。', NULL, '2020-03-12 20:09:44.000000', 4, 8, 60, 10, 'static\\upload\\鬼刀8.jpg');
INSERT INTO `app01_news` VALUES (25, '阿斯蒂', '阿斯蒂', '阿斯蒂', '2020-03-15 02:55:23.846400', 5, 9, 78, 8, 'static\\upload\\鬼刀2.jpg');
INSERT INTO `app01_news` VALUES (26, '阿斯蒂', '啊实打实的', '', '2020-03-16 06:18:33.469386', 1, 2, 45, 9, 'static\\upload\\鬼刀6.jpg');
INSERT INTO `app01_news` VALUES (28, '阿斯蒂', '权威人物热情无人区而且', '', '2020-03-16 06:53:47.297399', 2, 10, 71, 30, 'static\\upload\\鬼刀9.jpg');
INSERT INTO `app01_news` VALUES (29, '阿斯蒂', '啊手动阀沙发', '', '2020-03-16 09:36:06.291529', 3, 1, 123, 20, 'static\\upload\\鬼刀22.jpg');

-- ----------------------------
-- Table structure for app01_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `app01_userinfo`;
CREATE TABLE `app01_userinfo`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ctime` datetime(6) NOT NULL,
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_userinfo
-- ----------------------------
INSERT INTO `app01_userinfo` VALUES (1, 'eric', 'eric@love.com', '123456', '2019-12-14 23:28:35.000000', 'static\\upload\\tx.jpg');
INSERT INTO `app01_userinfo` VALUES (2, 'jack', 'jack@love.com', '123456', '2019-12-16 22:47:36.150727', 'static\\upload\\tx03.jpeg');
INSERT INTO `app01_userinfo` VALUES (6, 'root', 'root@love.com', '123456', '2019-12-17 14:41:47.056021', 'static\\upload\\tx07.jpg');
INSERT INTO `app01_userinfo` VALUES (8, 'song', '1293236@qq.com', '123456', '2019-12-25 10:43:07.085778', 'static\\upload\\tx04.jpg');
INSERT INTO `app01_userinfo` VALUES (9, 'luo', '4183038@qq.com', '123456', '2019-12-25 10:44:57.279150', 'static\\upload\\tx05.jpg');
INSERT INTO `app01_userinfo` VALUES (10, 'wang', '28629448@qq.com', '123456', '2019-12-25 10:50:10.624079', 'static\\upload\\tx06.jpg');

-- ----------------------------
-- Table structure for app01_usersend
-- ----------------------------
DROP TABLE IF EXISTS `app01_usersend`;
CREATE TABLE `app01_usersend`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` int(11) NOT NULL,
  `ctime` datetime(6) NOT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `app01_usersend_email_240af973`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_usersend
-- ----------------------------
INSERT INTO `app01_usersend` VALUES (1, '123456', '123@live.com', 1, '2019-12-15 14:08:17.000000');
INSERT INTO `app01_usersend` VALUES (2, 'BULXB2', '456@c.com', 1, '2019-12-15 14:15:13.661968');
INSERT INTO `app01_usersend` VALUES (3, 'YKZW2A', '132@c.com', 1, '2019-12-15 14:19:59.360077');
INSERT INTO `app01_usersend` VALUES (4, 'CEAS4X', '1577184907@qq.com', 7, '2020-01-10 11:39:15.908490');
INSERT INTO `app01_usersend` VALUES (5, 'Y6TQ4T', '1878205509@qq.com', 2, '2020-01-11 10:12:50.337225');
INSERT INTO `app01_usersend` VALUES (6, 'RSHW9T', '18782055092@qq.com', 2, '2020-01-10 11:43:25.634457');
INSERT INTO `app01_usersend` VALUES (7, 'ING3DZ', '1293636@qq.com', 2, '2020-03-17 11:05:01.575658');

-- ----------------------------
-- Table structure for app01_zan
-- ----------------------------
DROP TABLE IF EXISTS `app01_zan`;
CREATE TABLE `app01_zan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bools` tinyint(1) NULL DEFAULT NULL,
  `news_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app01_zan_news_id_50a82e37_fk_app01_news_id`(`news_id`) USING BTREE,
  CONSTRAINT `app01_zan_news_id_50a82e37_fk_app01_news_id` FOREIGN KEY (`news_id`) REFERENCES `app01_news` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_zan
-- ----------------------------
INSERT INTO `app01_zan` VALUES (1, 'eric', 1, 1);
INSERT INTO `app01_zan` VALUES (8, 'eric', 1, 2);
INSERT INTO `app01_zan` VALUES (9, 'eric', 1, 3);
INSERT INTO `app01_zan` VALUES (10, 'eric', 0, 4);
INSERT INTO `app01_zan` VALUES (11, 'eric', 1, 5);
INSERT INTO `app01_zan` VALUES (12, 'eric', 1, 6);
INSERT INTO `app01_zan` VALUES (13, 'eric', 1, 7);
INSERT INTO `app01_zan` VALUES (14, 'eric', 0, 8);
INSERT INTO `app01_zan` VALUES (15, 'eric', 1, 9);
INSERT INTO `app01_zan` VALUES (16, 'eric', 1, 10);
INSERT INTO `app01_zan` VALUES (17, 'eric', 1, 11);
INSERT INTO `app01_zan` VALUES (18, 'eric', 1, 12);
INSERT INTO `app01_zan` VALUES (19, 'eric', 1, 13);
INSERT INTO `app01_zan` VALUES (20, 'eric', 1, 14);
INSERT INTO `app01_zan` VALUES (21, 'eric', 1, 15);
INSERT INTO `app01_zan` VALUES (22, 'eric', 1, 16);
INSERT INTO `app01_zan` VALUES (23, 'eric', 1, 17);
INSERT INTO `app01_zan` VALUES (24, 'jack', 0, 18);
INSERT INTO `app01_zan` VALUES (25, 'jack', 1, 19);
INSERT INTO `app01_zan` VALUES (26, 'eric', 1, 20);
INSERT INTO `app01_zan` VALUES (27, 'eric', 1, 21);
INSERT INTO `app01_zan` VALUES (28, 'jack', 1, 22);
INSERT INTO `app01_zan` VALUES (29, 'eric', 1, 23);
INSERT INTO `app01_zan` VALUES (30, 'eric', 1, 24);
INSERT INTO `app01_zan` VALUES (31, 'eric', 1, 25);
INSERT INTO `app01_zan` VALUES (32, 'jack', 1, 26);
INSERT INTO `app01_zan` VALUES (33, 'eric', 1, 28);
INSERT INTO `app01_zan` VALUES (35, 'eric', 1, 29);
INSERT INTO `app01_zan` VALUES (36, 'jack', 1, 1);
INSERT INTO `app01_zan` VALUES (37, 'jack', 1, 2);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add user info', 7, 'add_userinfo');
INSERT INTO `auth_permission` VALUES (26, 'Can change user info', 7, 'change_userinfo');
INSERT INTO `auth_permission` VALUES (27, 'Can delete user info', 7, 'delete_userinfo');
INSERT INTO `auth_permission` VALUES (28, 'Can view user info', 7, 'view_userinfo');
INSERT INTO `auth_permission` VALUES (29, 'Can add user send', 8, 'add_usersend');
INSERT INTO `auth_permission` VALUES (30, 'Can change user send', 8, 'change_usersend');
INSERT INTO `auth_permission` VALUES (31, 'Can delete user send', 8, 'delete_usersend');
INSERT INTO `auth_permission` VALUES (32, 'Can view user send', 8, 'view_usersend');
INSERT INTO `auth_permission` VALUES (33, 'Can add new type', 9, 'add_newtype');
INSERT INTO `auth_permission` VALUES (34, 'Can change new type', 9, 'change_newtype');
INSERT INTO `auth_permission` VALUES (35, 'Can delete new type', 9, 'delete_newtype');
INSERT INTO `auth_permission` VALUES (36, 'Can view new type', 9, 'view_newtype');
INSERT INTO `auth_permission` VALUES (37, 'Can add news', 10, 'add_news');
INSERT INTO `auth_permission` VALUES (38, 'Can change news', 10, 'change_news');
INSERT INTO `auth_permission` VALUES (39, 'Can delete news', 10, 'delete_news');
INSERT INTO `auth_permission` VALUES (40, 'Can view news', 10, 'view_news');
INSERT INTO `auth_permission` VALUES (41, 'Can add favor', 11, 'add_favor');
INSERT INTO `auth_permission` VALUES (42, 'Can change favor', 11, 'change_favor');
INSERT INTO `auth_permission` VALUES (43, 'Can delete favor', 11, 'delete_favor');
INSERT INTO `auth_permission` VALUES (44, 'Can view favor', 11, 'view_favor');
INSERT INTO `auth_permission` VALUES (45, 'Can add commont', 12, 'add_commont');
INSERT INTO `auth_permission` VALUES (46, 'Can change commont', 12, 'change_commont');
INSERT INTO `auth_permission` VALUES (47, 'Can delete commont', 12, 'delete_commont');
INSERT INTO `auth_permission` VALUES (48, 'Can view commont', 12, 'view_commont');
INSERT INTO `auth_permission` VALUES (49, 'Can add comment', 12, 'add_comment');
INSERT INTO `auth_permission` VALUES (50, 'Can change comment', 12, 'change_comment');
INSERT INTO `auth_permission` VALUES (51, 'Can delete comment', 12, 'delete_comment');
INSERT INTO `auth_permission` VALUES (52, 'Can view comment', 12, 'view_comment');
INSERT INTO `auth_permission` VALUES (53, 'Can add zan', 13, 'add_zan');
INSERT INTO `auth_permission` VALUES (54, 'Can change zan', 13, 'change_zan');
INSERT INTO `auth_permission` VALUES (55, 'Can delete zan', 13, 'delete_zan');
INSERT INTO `auth_permission` VALUES (56, 'Can view zan', 13, 'view_zan');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$180000$c9RHcDaCfsKz$8uHDUVNB3ZBASAdpVI2CRAjfMYTPehN5adUgiE2xLMk=', '2020-04-13 12:21:29.094373', 1, 'admin', '', '', '', 1, 1, '2020-03-29 02:27:17.181826');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (12, 'app01', 'comment');
INSERT INTO `django_content_type` VALUES (11, 'app01', 'favor');
INSERT INTO `django_content_type` VALUES (10, 'app01', 'news');
INSERT INTO `django_content_type` VALUES (9, 'app01', 'newtype');
INSERT INTO `django_content_type` VALUES (7, 'app01', 'userinfo');
INSERT INTO `django_content_type` VALUES (8, 'app01', 'usersend');
INSERT INTO `django_content_type` VALUES (13, 'app01', 'zan');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-12-14 15:02:34.935803');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-12-14 15:02:36.137446');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-12-14 15:02:43.235768');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-12-14 15:02:45.640829');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2019-12-14 15:02:45.810686');
INSERT INTO `django_migrations` VALUES (6, 'app01', '0001_initial', '2019-12-14 15:02:46.396698');
INSERT INTO `django_migrations` VALUES (7, 'contenttypes', '0002_remove_content_type_name', '2019-12-14 15:02:47.650546');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0002_alter_permission_name_max_length', '2019-12-14 15:02:48.642781');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0003_alter_user_email_max_length', '2019-12-14 15:02:49.589887');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0004_alter_user_username_opts', '2019-12-14 15:02:49.700885');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0005_alter_user_last_login_null', '2019-12-14 15:02:50.351180');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0006_require_contenttypes_0002', '2019-12-14 15:02:50.419433');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0007_alter_validators_add_error_messages', '2019-12-14 15:02:50.483389');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0008_alter_user_username_max_length', '2019-12-14 15:02:51.473701');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0009_alter_user_last_name_max_length', '2019-12-14 15:02:52.209623');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0010_alter_group_name_max_length', '2019-12-14 15:02:53.013870');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0011_update_proxy_permissions', '2019-12-14 15:02:53.067477');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2019-12-14 15:02:53.484151');
INSERT INTO `django_migrations` VALUES (19, 'app01', '0002_commont_favor_news_newtype', '2019-12-25 02:33:38.418074');
INSERT INTO `django_migrations` VALUES (20, 'app01', '0003_auto_20191228_1025', '2019-12-28 02:25:53.154593');
INSERT INTO `django_migrations` VALUES (21, 'app01', '0004_auto_20191228_1044', '2019-12-28 02:44:50.358481');
INSERT INTO `django_migrations` VALUES (22, 'app01', '0005_auto_20191228_1127', '2019-12-28 03:27:32.163294');
INSERT INTO `django_migrations` VALUES (23, 'app01', '0006_auto_20200312_1105', '2020-03-12 03:05:21.677180');
INSERT INTO `django_migrations` VALUES (24, 'app01', '0007_news_path', '2020-03-15 10:28:30.810986');
INSERT INTO `django_migrations` VALUES (25, 'app01', '0008_zan', '2020-03-17 11:08:50.626316');
INSERT INTO `django_migrations` VALUES (26, 'app01', '0009_auto_20200318_1122', '2020-03-18 03:22:46.850697');
INSERT INTO `django_migrations` VALUES (27, 'app01', '0010_userinfo_path', '2020-03-18 11:33:04.183203');
INSERT INTO `django_migrations` VALUES (28, 'app01', '0011_auto_20200320_1708', '2020-03-20 09:08:30.708690');
INSERT INTO `django_migrations` VALUES (29, 'app01', '0012_remove_comment_parentcomment', '2020-03-20 09:15:09.220556');
INSERT INTO `django_migrations` VALUES (30, 'app01', '0013_comment_parentcomment', '2020-03-20 09:17:10.059585');
INSERT INTO `django_migrations` VALUES (31, 'app01', '0014_auto_20200323_1420', '2020-03-23 06:22:17.725624');
INSERT INTO `django_migrations` VALUES (32, 'app01', '0015_auto_20200323_1421', '2020-03-23 06:22:17.734695');
INSERT INTO `django_migrations` VALUES (33, 'app01', '0016_auto_20200329_1037', '2020-03-29 02:38:07.228557');
INSERT INTO `django_migrations` VALUES (34, 'app01', '0017_auto_20200329_1357', '2020-03-29 05:57:09.411782');
INSERT INTO `django_migrations` VALUES (35, 'app01', '0018_auto_20200329_1358', '2020-03-29 05:59:02.743584');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0wq753k7lteuwgorvn5b2rkdbboqfy90', 'NjQyYWZiMzc1YWFjYzc0MDUyNjhhNjhkMWFhYjdkMzg4ZTZlMWE1ODp7ImNoZWNrQ29kZSI6IndVYngiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjQxNmJlZDlkMzFhZjE4ODMzYjQyZGIwMzg5M2YzMWU1NWQ0NjRiYSJ9', '2020-04-25 06:46:41.276062');
INSERT INTO `django_session` VALUES ('3fjcrnpfyxqzmfy65qadw2qxefw5apv2', 'MWQxNWE2ZTEzNzNlYjY4MDc2ZmUyMWJlN2RjODYyM2NlODNmZTI2MTp7ImNoZWNrQ29kZSI6IkZuY2EiLCJpc19sb2dpbiI6dHJ1ZSwidXNlcm5hbWUiOiJlcmljIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjY0MTZiZWQ5ZDMxYWYxODgzM2I0MmRiMDM4OTNmMzFlNTVkNDY0YmEifQ==', '2020-04-27 12:24:14.871793');
INSERT INTO `django_session` VALUES ('6vh2tnoo0w1f3l3y4ko2rxggc3g5vb9c', 'NGI3Y2NlOTk3NmVlYmZkM2IxMDhkN2JhMTI1Y2E1NWM3ZmVhOWJlNjp7ImlzX2xvZ2luIjoiZXJpYyIsInVzZXJpbmZvX2RpY3QiOnsibmlkIjo3LCJ1c2VybmFtZSI6IndxZXJvaSIsImVtYWlsIjoiMTg3ODIwNTUwOUBxcS5jb20iLCJwd2QiOiJxd2VydHkifSwiY2hlY2tDb2RlIjoiSEQ0UCJ9', '2020-01-05 02:46:29.357326');
INSERT INTO `django_session` VALUES ('7161abkig9nit1sw6hkc1z5mi9c1muw7', 'MDM1YmU2M2Q5YjZkZjg2ZDJhYTEzNTlmZDE2NjM4Yjg2Yjg0ODQ1Nzp7ImNoZWNrQ29kZSI6InkzVFUiLCJpc19sb2dpbiI6IndhbmciLCJ1c2VyaW5mb19kaWN0Ijp7Im5pZCI6MTAsInVzZXJuYW1lIjoid2FuZyIsImVtYWlsIjoiMjg2Mjk0NDAzOEBxcS5jb20iLCJwd2QiOiIxMjQ1Njc4In19', '2020-01-08 02:51:05.448994');
INSERT INTO `django_session` VALUES ('8nm38qk0ivs7vk2tssj4ppkbumxnvw4g', 'NDhkYTk5Njk5NmU5YWM5MWRmNGUwNzIzMTBkNTU2MjYyNTJlYWU0Njp7ImNoZWNrQ29kZSI6IldmQ20iLCJ1c2VybmFtZSI6ImphY2sifQ==', '2020-04-16 01:08:13.594782');
INSERT INTO `django_session` VALUES ('adphk1wi1wyr8g3r78jrr3ihcp72m1x8', 'YTEzNDlhNzY5MjM5ZTMzOGNkYmJkMjQzMDcyNTBkN2U4ODc5NjI5Nzp7ImNoZWNrQ29kZSI6IkM5a3AifQ==', '2020-02-01 11:56:00.960703');
INSERT INTO `django_session` VALUES ('b5ud0o3pruxywcfjvbz9rjzxvy151410', 'YmNiMWRiNGQ2NTExNzg4OTU5ZmE2Mzk5MjZlZDg1MDYxNGQyMTY4Njp7ImNoZWNrQ29kZSI6IndRRFgifQ==', '2020-01-25 02:12:24.209552');
INSERT INTO `django_session` VALUES ('kly97bfsjfuh62a37x6m4bw66lz4f1t7', 'MmI5MjFlYWUyNDU4ODAyYTYyYzUxZTgyZTBkZjQ3ZTU4MDM4NWM4ODp7ImNoZWNrQ29kZSI6Im42VmQifQ==', '2020-03-29 00:25:03.977347');
INSERT INTO `django_session` VALUES ('rro2h0giwc722fk3o6i9x5wl1ajmk1f6', 'MjAzZWI5ZmViYWFhZTVlNGU2ODgwNDBlYjU0M2U3ZGFhNDRhNTIzOTp7ImNoZWNrQ29kZSI6Im5Gc1gifQ==', '2020-03-26 03:05:36.788976');
INSERT INTO `django_session` VALUES ('s3l8twvhbfj6jummrxfsk2w9jngkd6cl', 'NDcwMzM4ZTlkNDBkMjBlZThjYmRmZmQ1OWY0ZGQzY2Y3NmFiNDQ3Zjp7ImNoZWNrQ29kZSI6InFGYngifQ==', '2020-03-28 09:07:21.571653');
INSERT INTO `django_session` VALUES ('sh9389jfcyaly6znczhrpi9ny81dp9fv', 'OWFkNTM3ZDI0MDllZjIyZDZiMTk3OGY5YWZmZmVlMDJhZjM0ZDZkZjp7ImNoZWNrQ29kZSI6InVYZkQifQ==', '2020-03-28 13:32:38.534662');
INSERT INTO `django_session` VALUES ('tjxyoq5ln81b7ksm2vxzf8php74imx1p', 'NzA4ODQ2NDg2NTFiN2IwNTNmMzgyODg0Y2MwODVhZjYyMDEyNjI2NTp7ImNoZWNrQ29kZSI6IkpHdmcifQ==', '2020-03-29 00:37:18.953391');
INSERT INTO `django_session` VALUES ('upmjwwu6nzm2dnt6connoq8gs32kcl6p', 'ZDExYjUxN2Q5NzUzOTI3MmQxYjNlNTFkNjkyNjg3YTY5ZWM2M2U2YTp7ImNoZWNrQ29kZSI6IkZDeFAifQ==', '2020-02-01 12:32:17.227764');
INSERT INTO `django_session` VALUES ('vfzbxp4r5sikeseuqfmt9eivr5sfh1fi', 'Y2Q5NDFkMTk2YmZlYmI1YzAzNDM4MDU0MmUyNmEzOWU1OWMxMzYxODp7ImNoZWNrQ29kZSI6IlNHN3IifQ==', '2020-03-16 10:35:07.064217');
INSERT INTO `django_session` VALUES ('wxnk69lnme7ktucnijw4eobvu3lrqsws', 'NGQ4MDVmODU3ZWY2NDVjMzFlMDY4ZTVmNWJhYjU5MGFlZGI2YmM4NDp7ImNoZWNrQ29kZSI6IkRTd2EifQ==', '2020-01-16 01:45:53.746685');

SET FOREIGN_KEY_CHECKS = 1;
