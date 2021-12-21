/*
 Navicat MySQL Data Transfer

 Source Server         : localhost8.0
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 20/12/2021 22:24:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_blog
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户',
  `blog_type` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '博文类型：1：军事；2：科技；3：体育；4：娱乐\r\n5：教育',
  `blog_title` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '博文标题',
  `blog_pic` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '博文图片',
  `blog_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '博文内容',
  `create_time` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_time` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `is_del` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否删除：0：正常；1：删除',
  `is_top` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否置顶：0：正常；1：置顶',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_blog
-- ----------------------------
INSERT INTO `t_blog` VALUES (1, '文章作者', '2', '美国将派近300人参加北京冬(残)奥会 外交部：欢迎', NULL, '赵立坚表示，随着北京冬奥会日益临近，全世界冰雪运动健儿都在热切期盼奥运盛会开幕，中方欢迎包括美国在内的各国运动员来华参加北京冬奥会，将保证所有运动员的安全便利，帮助每一位奥运健儿成就奥运梦想。我们也祝愿他们能够超越自我，取得好成绩。\r\n\r\n　　赵立坚指出，近期国际社会支持北京冬奥会，反对体育政治化的声音，一浪高过一浪。12月2日，第76届联大协商一致，通过北京冬奥会奥林匹克休战决议，有173个会员国共提该决议。12月11日，国际奥委会第10届奥林匹克峰会宣言再次发出了国际体育界支持北京冬奥会，反对体育政治化的共同呼声。二十国集团中非合作论坛、中国拉共体论坛、上海合作组织等多边机制，也发出支持北京冬奥会的强音。联合国秘书长古特雷斯，俄罗斯总统普京等政要已确认来华出席北京冬奥会，法国总统马克龙，奥地利总理内哈默明确表示将反对体育运动政治化。韩国、越南、老挝、柬埔寨、巴基斯坦、斯里兰卡等国政府官员也指出，奥运会不是搞意识形态对抗的地方，而是帮助国与国之间建立更紧密友谊与合作的平台。相信北京冬奥会将为世界各地体育爱好者献上一场壮观而多彩的盛会。韩国、法国、芬兰、保加利亚、希腊、意大利、荷兰、西班牙和俄罗斯、阿根廷、委内瑞拉、古巴等许多国家奥委会官员都表示，期待北京冬奥会取得圆满成功。', '2021-12-20 21:42:08.379152', '2021-12-20 21:42:08.379152', NULL, NULL);
INSERT INTO `t_blog` VALUES (2, 'admin', '3', '詹姆斯31+14湖人惨遭双杀 德罗赞38分公牛险胜', NULL, '北京时间12月20日，湖人在客场失利，以110-115败给了公牛。\r\n\r\n　　公牛完成对湖人的双杀。德玛尔-德罗赞得了38分6次，尼科拉-乌切维奇19分13个篮板，朗佐-鲍尔19分，阿莱克斯-卡鲁索17分9个篮板。\r\n\r\n　　“浓眉哥”安东尼-戴维斯缺阵，勒布朗-詹姆斯拿下了31分、14个篮板和6次助攻，拉塞尔-威斯布鲁克20分、9个篮板和8次助攻，伊塞亚-托马斯13分，德安德烈-乔丹9分7个篮板。\r\n\r\n　　替补出场的卡梅罗-安东尼得了21分，三分球12投5中。\r\n\r\n　　双方都受到新冠疫情影响，多人缺阵。公牛少了扎克-拉文，但德罗赞今天复出。\r\n\r\n　　湖人仍少了德怀特-霍华德和马里克-蒙克等人，但特雷沃-阿里扎复出。\r\n\r\n　　上一次交锋，湖人遭到德罗赞痛击，主场惨败。\r\n\r\n　　今天德罗赞刚复出，前三节状态一般，两队一直打得难解难分。\r\n\r\n　　第二节双方大举对攻，湖人单节以37-33胜出，上半场以仍以59-61略处下风。\r\n\r\n　　湖人旧将卡鲁索第三节独得11分，但公牛整体命中率下降，还是被超出，以83-84落后。\r\n\r\n　　最后一节双方几度交替领先。比赛还有15.6秒时，德罗赞两罚两中，公牛以113-110领先，将湖人逼入绝境。\r\n\r\n　　安东尼关键时刻三分不中，鲍尔两罚两中，公牛锁定胜局。（吴哥）', '2021-12-20 21:42:50.619466', '2021-12-20 21:42:50.619466', NULL, NULL);
INSERT INTO `t_blog` VALUES (3, 'admin', '4', '王力宏再发文回应 称准备暂时退出工作', NULL, '新浪娱乐讯 12月20日，王力宏再发文回应，向爸爸妈妈李靓蕾孩子们郑重道歉，宣布准备暂时退出工作，留出时间陪伴父母和孩子。\r\n\r\n　　全文内容：\r\n\r\n　　左思右想，男人还是应该承担起所有的责任。我不再做任何解释和辩解，没经营好婚姻，给家人带来困扰，没给大众做好偶像该有的形象，都是我的错。在这里，给爸爸妈妈靓蕾孩子们郑重道歉。既已离婚，争论过去种种已经无意义了。从今往后，我会注意自己的言行举止，会承担起一个父亲和儿子的责任，经济上生活上尽可能的照顾靓蕾和孩子们，我准备暂时退出工作，留出时间陪伴父母和孩子，弥补这次风波带来的伤害。靓蕾，我们还是要共同照顾抚养三个孩子的，此事肯定主要是我处理不当。再次向大家道歉。', '2021-12-20 21:45:26.634548', '2021-12-20 21:45:26.634548', NULL, NULL);
INSERT INTO `t_blog` VALUES (4, 'admin', '1', '美国万吨隐身驱逐舰至今不能作战 舰体却已锈迹斑斑', NULL, '在高技术武器方面，美国人总是领先全球，但又往往把自己“带进坑”。在这其中，最经典的案例莫过于美国海军的“朱姆沃尔特”级万吨级隐形导弹驱逐舰，而最近，“三姐妹”中的“大姐”在美国加州圣迭戈军港外的舰容，让各国网友大跌眼镜。\r\n\r\n　　美国Thedrive网站“战区”专栏近来发布了一组美国网友的独家照片。照片显示舷号DDG-1000的“朱姆沃尔特”号驱逐舰进出美国西海岸最大军港——圣迭戈的场景，不过，这艘驱逐舰的船体上出现了大面积的腐蚀，可以说是锈迹斑斑，和服役之初的科幻、整洁外形有着天壤之别。', '2021-12-20 22:05:55.315069', '2021-12-20 22:05:55.315069', NULL, NULL);
INSERT INTO `t_blog` VALUES (7, 'admin', '5', '添加测试', NULL, '123456', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_level
-- ----------------------------
DROP TABLE IF EXISTS `t_level`;
CREATE TABLE `t_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `level` int(11) NULL DEFAULT NULL COMMENT '等级',
  `level_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '等级说明',
  `is_banned` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否禁用：0：正常；1：禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_level
-- ----------------------------
INSERT INTO `t_level` VALUES (1, 1, '金牌博主', '0');
INSERT INTO `t_level` VALUES (2, 2, '铂金博主', '0');
INSERT INTO `t_level` VALUES (3, 3, '砖石博主', '0');
INSERT INTO `t_level` VALUES (4, 4, '王者博主', '0');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号：登录账号',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` int(11) NULL DEFAULT NULL COMMENT '用户昵称',
  `head_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像地址',
  `personal_sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '个性签名',
  `level_id` int(11) NULL DEFAULT 1 COMMENT '用户等级',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_del` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否删除：0：正常；1：删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, '19923756596', 'ea028b583106fe5abac2cb7bf257e859', NULL, NULL, NULL, 1, NULL, NULL, '0');
INSERT INTO `t_user` VALUES (2, '13452657654', 'afce2848d162963183c522bcddad972b', NULL, NULL, NULL, 1, NULL, NULL, '0');

-- ----------------------------
-- Table structure for t_user_info
-- ----------------------------
DROP TABLE IF EXISTS `t_user_info`;
CREATE TABLE `t_user_info`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `original_count` int(11) NULL DEFAULT 0 COMMENT '原创统计',
  `week_count` int(11) NULL DEFAULT 0 COMMENT '周排名',
  `total_count` int(11) NULL DEFAULT 0 COMMENT '总排名',
  `access_count` int(11) NULL DEFAULT 0 COMMENT '访问量',
  `history_count` int(11) NULL DEFAULT 0 COMMENT '历史',
  `integral_count` int(11) NULL DEFAULT 0 COMMENT '积分',
  `fans_count` int(11) NULL DEFAULT 0 COMMENT '粉丝',
  `praised_count` int(11) NULL DEFAULT 0 COMMENT '点赞数',
  `comment_count` int(11) NULL DEFAULT 0 COMMENT '评论数',
  `favorite_count` int(11) NULL DEFAULT 0 COMMENT '收藏',
  `attention_count` int(11) NULL DEFAULT 0 COMMENT '关注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_info
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
