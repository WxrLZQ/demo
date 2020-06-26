/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : cartoon

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 26/06/2020 16:14:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cartoonbook
-- ----------------------------
DROP TABLE IF EXISTS `cartoonbook`;
CREATE TABLE `cartoonbook`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `author` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `text` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `theme` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `choice` int(11) DEFAULT NULL,
  `img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `c_t_id`(`theme`) USING BTREE,
  INDEX `c_c_id`(`category`) USING BTREE,
  INDEX `c_s_id`(`choice`) USING BTREE,
  CONSTRAINT `c_c_id` FOREIGN KEY (`category`) REFERENCES `category` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `c_s_id` FOREIGN KEY (`choice`) REFERENCES `choice` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `c_t_id` FOREIGN KEY (`theme`) REFERENCES `theme` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cartoonbook
-- ----------------------------
INSERT INTO `cartoonbook` VALUES (1, '我独自升级', 'DUBU(主笔)', '完结话 我将继续前行', '10年前，世界与其他次元连接的“门”被打开，各种魔物不断出现，于是乎能力各异的猎魔者也随之出现，被成为“猎人”。程肖宇是一名实力最弱的E级猎人，在一次挑战任务中，遇到了可怕的隐藏挑战。生死存亡之际，他居然获得了升级系统！在系统的利用下，他能成为最强猎人吗 ', 5, 2, 6, 'http://localhost:8080/img/cartoon_1.jpg');
INSERT INTO `cartoonbook` VALUES (2, '步天歌', '夏达', '第33话  爷爷', '异象天光中，帝王家诞生一对特殊的双生龙凤胎，男婴额带朱砂痣，女婴长有六指。然而，这对血脉相连的兄妹却被命运残忍分开！一个被蓬莱仙长携走，踏上漫漫修仙路，一个被弃于芦苇荡，跟随老剑客在红尘中跋涉……天劫将至，二人将如何与天命相争？又会以何种方式重逢？【条漫首发/每月1日、15日更新 责编：33', 7, 1, 2, 'http://localhost:8080/img/cartoon_2.jpg');
INSERT INTO `cartoonbook` VALUES (3, '谷围南亭', '墨飞', '太岁篇完结篇 鼓鸣人聚', '一心只想去广美上大学的话痨少年高影，误入南亭村大清王朝酒店，却不知自己已卷入了一场百年浩劫的神秘纷争。千古罪人清朝镇南王胤霆，独守三百年，终于等到了这位天选之人，将”太岁“彻底封印……是意外，还是命运早已安排他们相遇？2019快看年度漫画TOP1！金龙奖双料大奖作品！不容错过！【独家/每周六更新】', 5, 2, 4, 'http://localhost:8080/img/cartoon_3.jpg');
INSERT INTO `cartoonbook` VALUES (4, '刀鞘的孩子', 'Kyungil Yang（主笔）', '第24话 神思', '九年前，为祸人间的大魔头被消灭，九年后身世成谜的少年走出深山。 他看见了杀戮，也看见了阴谋，背负命运枷锁的他拨动风起云涌。 一切由他而起，也将由他终结。 【独家/周六周日更新；责编：吴半石】', 7, 1, 1, 'http://localhost:8080/img/cartoon_4.jpg');
INSERT INTO `cartoonbook` VALUES (5, 'DOLO命运胶囊', '兔街子（主笔）', '完结篇 冬之结2', '不够漂亮也不够聪明，真的只能做最底端的人吗？如果有一种胶囊，能让你逆袭命运，你愿意付出最珍贵的东西去交换它吗？【独家/连载中，每周四更新 责编：林早上】', 2, 2, 5, 'http://localhost:8080/img/cartoon_5.jpg');
INSERT INTO `cartoonbook` VALUES (6, '鬼灭之刃', '吾峠呼世晴', '第202话 一起回去吧', '时值日本大正时期。 传说太阳下山后，有恶鬼出没吃人。亦有猎鬼人斩杀恶鬼、保护人们。 卖炭少年炭治郎，在家人惨遭恶鬼袭击。母亲与四个弟妹惨遭杀害，而与他一起生还的妹妹祢豆子亦异变成凶暴的鬼。 在猎鬼人的指引下，立志成为猎鬼人的炭治郎与变成鬼却尚存理智的祢豆子踏上了旅程。血风剑戟冒险谭，开幕！', 4, 1, 3, 'http://localhost:8080/img/cartoon_6.jpg');
INSERT INTO `cartoonbook` VALUES (7, '学霸的星辰大海', '眉语目笑（原著）', '第12话 先学带动后学', '“你把打游戏的心思用在学习上就好了。”当这句全世界家长都用来教训过孩子的金句变成现实，一个无比渴望知识来变强的超级学霸就诞生了。 不爱美人，爱学习。 不玩游戏，只刷题！ 我爱学习，学习使我快乐！【独家/每周四更新、责编：宇煊】', 1, 1, 4, 'http://localhost:8080/img/cartoon_7.jpg');
INSERT INTO `cartoonbook` VALUES (8, '八十一道超纲题', '条纹花瓶（原著）', '第38话 深寒', '2030年，世界末日来临，无数人神秘死亡，剩下的幸存者被一款叫做“八十一道送命题”的app所支配。 回答问题，通关副本，获得奖励，和死亡赛跑。只有最后的赢家才能获得生的机会。 自带霉运debuff的学霸女主角带着她的后宫们踏上了旅程 她能一战到底，获得最后的生机吗？【独家/每周五；责编：吴半石】', 5, 1, 3, 'http://localhost:8080/img/cartoon_8.jpg');
INSERT INTO `cartoonbook` VALUES (9, '超能立方', '水落声声', '第166话 你会习惯的 ', '平凡男生偶得女神垂青，却惹上黑道大佬，机缘巧合之下获得了神秘立方体，开启超能之路，从此，行侠仗义，快意恩仇，踏上属于自己的强者之旅。【独家/每周二更新 责编：三石兄】', 5, 1, 3, 'http://localhost:8080/img/cartoon_9.jpg');
INSERT INTO `cartoonbook` VALUES (10, '哑舍', '玄色（原著）+晓泊', '完结篇 涅罗盘下（2）', '哑舍里的古物，每一件都有着自己的故事，承载了许多年，无人倾听，默然等待千年，只为再次相遇。古物背后的历史，历史背后的人生。它们在岁月中浸染了成百上千年，每一件，都凝聚着工匠的心血，倾注了使用者的感情。每一件，都属于不同的主人，都拥有自己的故事。每一件，都那么与众不同，甚至每一道裂痕和缺口都有着独特的历史。谁还能说，古董都只是器物，都是没有生命的死物呢？【独家/每周二更新 责编：漠漠】', 7, 2, 5, 'http://localhost:8080/img/cartoon_10.jpg');
INSERT INTO `cartoonbook` VALUES (11, '镖人', '许先哲', '第101话 老把戏', '“镖”，指的是受雇的武夫，其保护的目标，亦指官府悬赏通缉的目标。隋末民乱前夕，江湖上掀起了一阵腥风血雨，各路人马的恩怨情仇逐渐展开。【新漫画授权/作者：许先哲 责编：春雨】', 7, 1, 1, 'http://localhost:8080/img/cartoon_11.jpg');
INSERT INTO `cartoonbook` VALUES (12, '高等灵魂', '千亮', '第72话 转学生竟然是？', '一个无神论少年蒋乘风因为一次意外获得一种神奇的力量，凭借这种力量，他可以轻松化解世间最恐怖，最令的人畏惧的事件。这次的任务是拯救一个失踪的少年，地点则是令人闻风丧胆的 昆噬岩！ 看他如何一路过关斩将！勇斗邪灵！ 不要在我面前装神弄鬼！否则统统打爆！【每周六更新/责编：半月】', 5, 1, 3, 'http://localhost:8080/img/cartoon_12.jpg');
INSERT INTO `cartoonbook` VALUES (13, '吾皇巴扎黑', '吾皇的白茶', '第209话 登山', '高冷的喵星人原则：看心情。 家里的狗和主人，都是喵主子的玩物！ 【授权/每周二更新 责编：柱子】', 8, 1, 4, 'http://localhost:8080/img/cartoon_13.jpg');
INSERT INTO `cartoonbook` VALUES (14, '帮主！帮主！', '魁子', '帮主你不知道的那些事！', '无厘头武侠世界！为了成为盖世大侠，沙雕男主带着两个逗比上路了！又彪又傻的男主，贤妻属性爆棚的酷哥，多重人格的少女，为了做大侠，积极备考的故事！蛤？为啥是备考？哈哈哈，都9102年了，谁还打打杀杀，当然是靠正大光明考试啦！【独家/每周三更新 责编：水原】', 1, 1, 6, 'http://localhost:8080/img/cartoon_14.jpg');
INSERT INTO `cartoonbook` VALUES (15, '天珠变', '唐家三少（原著)', '第31话 相认（下）', '天生没有本命珠而被当成笑话的周维清，在一次偶然机遇中吞掉了从异界穿越过来的暗魔邪神虎本命珠，从此走上逆天之路，与一位位红颜知己相知相爱，最终成为天珠十二变的绝世高手！【独家/每周二更新 责编：春雨】', 7, 1, 1, 'http://localhost:8080/img/cartoon_15.jpg');
INSERT INTO `cartoonbook` VALUES (16, '斗魂大陆', '天天吃窝头/鲸鱼阅读', '第11话 莫的感情？', '废物？无法觉醒斗魂的废柴？罗家的耻辱？武陵郡最大的笑话？他笑了！ 族人的唾弃，父亲厌恶，外人的嘲讽，世家悔亲，家族遗弃，他悟了！ 斗魂大陆，强者为尊！ 当昔日的天赋归来，他人眼中的天才，在他看来不过是一个笑话罢了，妖孽？呵呵，我罗尘最喜欢虐的，便是妖孽！ 【独家/每周四更新 责编：998】', 3, 1, 5, 'http://localhost:8080/img/cartoon_16.jpg');
INSERT INTO `cartoonbook` VALUES (17, '全球高武', '阅文漫画/鲜漫文化', '第11话 系统升级！', '重生只是走向巅峰的开始。 地窟入侵，武道崛起。', 6, 1, 6, 'http://localhost:8080/img/cartoon_17.jpg');
INSERT INTO `cartoonbook` VALUES (18, '斗破苍穹', '天蚕土豆', ' 第842话 修罗（下）', '斗破苍穹漫画是根据著名作家天蚕土豆作品斗破苍穹改编的漫画，这是一个属于斗气的世界，没有花俏艳丽的魔法，有的，仅仅是繁衍到巅峰的斗气！在斗气大陆上，真正的强者都是用实力说话的！', 3, 1, 3, 'http://localhost:8080/img/cartoon_18.jpg');
INSERT INTO `cartoonbook` VALUES (19, '绝世唐门', '唐家三少', ' 第532话 跑路1', '唐门创立万年之后的斗罗大陆上，唐门式微，一代天骄霍雨浩横空出世，在霍雨浩与自己的伙伴不断努力，使得唐门重新发扬光大的故事。', 3, 1, 2, 'http://localhost:8080/img/cartoon_19.jpg');
INSERT INTO `cartoonbook` VALUES (20, '斗罗大陆', '唐家三少', ' 第693话 圣王的考验1', '偷学一身绝世功夫，最后却选择了跳崖明志，造化弄人，转世后却依然是令人艳羡的正太一枚；两世生涯中，唐三经历了怎样的人生？第二世中，他天生双武魂，先天满魂力，却一度被人认为是废武魂……在诺丁学院，遇到了野', 3, 1, 5, 'http://localhost:8080/img/cartoon_20.jpg');
INSERT INTO `cartoonbook` VALUES (21, '\r\n神印王座', '杨浩', '第495话 吞噬（上）', '魔族强势，在人类即将被灭绝之时，六大圣殿崛起，带领着人类守住最后的领土。一名少年，为救母加入骑士圣殿，奇迹、诡计，不断在他身上上演。在这人类6大圣殿与魔族72柱魔神相互倾轧的世界，他能否登上象征着骑士最高荣耀的神印王座？', 9, 1, 2, 'http://localhost:8080/img/cartoon_21.jpg');
INSERT INTO `cartoonbook` VALUES (22, '元尊', 'Dr.大 吉', '第208话下 化虚隐藏', '主人公周元，为周朝皇子天生圣龙气运。因一道预言，气运被夺身中剧毒，经脉被锁无法修炼。背负国仇家恨，周元没有被这种困境摧毁，而是靠着坚强意志重开八脉，在家族存亡的危机时刻强势崛', 3, 1, 2, 'http://localhost:8080/img/cartoon_22.jpg');
INSERT INTO `cartoonbook` VALUES (23, '网游之近战法师', '百泉', '第275话 又是你2', '最新全息网游----平行世界开始试运行。', 2, 1, 3, 'http://localhost:8080/img/cartoon_23.jpg');
INSERT INTO `cartoonbook` VALUES (24, '偷星九月天', '任 翔', '番外2 偷星九月天少年版', '一场爱与梦想的奇妙冒险…… 　　是男仆还是热血的少年侦探？江洋大盗竟是如花美眷？！ 迷雾一层接一层，悬念一环紧接一环，喘不过气了? 黑月铁骑魅影闪现，是兄妹的情谊还是死敌的较量？', 5, 2, 4, 'http://localhost:8080/img/cartoon_24.jpg');
INSERT INTO `cartoonbook` VALUES (25, '龙族3黑月之潮', '颜开', '第202话 邦达列夫的故事3', '谁也不知道，在人类主宰的这个世界里，有一种叫做龙族的存在，同时也有一种神秘的混血种存在，混血种天生的使命就是——屠龙。', 5, 1, 5, 'http://localhost:8080/img/cartoon_25.jpg');
INSERT INTO `cartoonbook` VALUES (26, '九九八十一', '米二', '你愿意为梦想付费吗', '为追女孩，触动千年机关！ 不良少年AND校花一姐！古代三国兵器传奇，现代校园浪漫演绎！', 2, 1, 6, 'http://localhost:8080/img/cartoon_26.jpg');
INSERT INTO `cartoonbook` VALUES (27, '妖神记', '发飙的蜗牛', '第271话2 凌霜剑', '妖神一出，谁与争锋？ 这是一个妖灵的世界，融合了妖灵，就可以成为强大的妖灵师。 因为一本时空妖灵之书，时空发生了扭转，当一切重新开始之时，命运之轮缓缓转动。', 3, 1, 1, 'http://localhost:8080/img/cartoon_27.jpg');
INSERT INTO `cartoonbook` VALUES (28, '星海镖师', '颜开', '第226话1 异形之前', '作品讲述了D.B星河纪元3000年左右的人类进入第二次大开发时代，以唐小镖为代表的英雄式职业“星海镖师”（又称“星守师”“守护者”）们至情至性，热血绚烂的冒险成长故事……', 4, 1, 1, 'http://localhost:8080/img/cartoon_28.jpg');
INSERT INTO `cartoonbook` VALUES (29, '五万一千次旋转', '旋转乒乓', '最终话 曾经的国手', '【独家/每周六更新】拥有极佳运动天赋的学霸江杉不顾家人劝阻放弃入读重点中学，义无反顾的选择加入省乒乓球队走职业球员的道路。没想到一场突如其来的意外打碎了他的体育梦。', 2, 2, 2, 'http://localhost:8080/img/cartoon_29.jpg');
INSERT INTO `cartoonbook` VALUES (30, '百炼成神', '燃哉工作室', '第513话', '从云端跌落成为一名卑微家奴的罗征，无意中把自己炼成了一件兵器、家族败落，妹妹被强大势力囚禁，罗征的命运究竟是上天安排好的，还是所谓的无命者？人族，妖夜族，魔族的对抗要持续到什么时候？隐藏在这一切背后的神秘力量到底是什么？一道抗争的序幕，就此轰然拉开。', 3, 1, 3, 'http://localhost:8080/img/cartoon_30.jpg');
INSERT INTO `cartoonbook` VALUES (31, '\r\n天行轶事', '知音动漫', '番外6', '妖魔横行的世界，人类只是隐遁历史的传说种族，试图揭开妖族面纱的少年，误入山神迷雾！我是不是唯一幸存的天行者？', 5, 1, 4, 'http://localhost:8080/img/cartoon_31.jpg');
INSERT INTO `cartoonbook` VALUES (32, '伏魔天师', '二次元动漫', '第一季最终话', '【独家/每周五更新】钟馗和他的徒弟秦霜通过一次次的降妖除魔渐渐发现这些妖物的古怪联系和他们的一些奇怪布置，最后查出有人想在京城布置这样的法阵。', 6, 2, 5, 'http://localhost:8080/img/cartoon_32.jpg');
INSERT INTO `cartoonbook` VALUES (33, '武动乾坤', '神漫', '第265话 皇普影3', '主要讲述了大炎王朝天都郡炎城青阳镇，一个落魄的林氏子弟林动在山洞间偶然捡到一块神秘的石符而走上的逆袭之路。', 2, 1, 3, 'http://localhost:8080/img/cartoon_33.jpg');
INSERT INTO `cartoonbook` VALUES (34, '地府我开的', '飞花工作室', '第439话 弑神', '叶凡机缘巧合下成为了阎罗王，获得可升级的神秘地府系统，随着光怪陆离百态丛生的离奇事件逐一被解决，叶凡越来越像一个真正的阎王，将地府的重塑，当做了自己的使命。而就在一切顺风风水之际，叶凡忽然发现似乎地府系统还藏着不可告人的天大秘密，一个关于天下苍生的大秘密…', 5, 1, 5, 'http://localhost:8080/img/cartoon_34.jpg');
INSERT INTO `cartoonbook` VALUES (35, 'X龙时代', '神漫', ' 停更公告', '讲述的是一个普通的人一一辛云，在一次机会下穿越到未知世界，却因为沉迷女色而使自己失去成为最强者的机会，在一次九大强者的力量碰撞下，竟然发生了一件不可思议，或者说是奇迹的事情一一辛云重生回到当年他穿越到未知世界的时候！！！', 3, 1, 1, 'http://localhost:8080/img/cartoon_35.jpg');
INSERT INTO `cartoonbook` VALUES (36, '完美世界', '神漫', '第290话 通灵神迹3', '一粒尘可填海，一根草斩尽日月星辰，弹指间天翻地覆。 群雄并起，万族林立，诸圣争霸，乱天动地。问苍茫大地，谁主沉浮？！ 一个少年从大荒中走出，一切从这里开始……', 9, 1, 1, 'http://localhost:8080/img/cartoon_36.jpg');
INSERT INTO `cartoonbook` VALUES (37, '星武神诀', '踏雪动漫', '第337话', '一个逆天强者的撼世之路，红颜在侧，修星武传承，掌八方权柄，成就至高神王！温柔可爱的天才少女，火辣奔放的郡主.神秘的妖族美女还有传说中的至高女武神，一个不一样的悟道之路，一段不一样的传奇！', 7, 1, 2, 'http://localhost:8080/img/cartoon_37.jpg');
INSERT INTO `cartoonbook` VALUES (38, '解离妖圣', '极漫文化', '第174话', '数千年前，“仙族”与“妖族”开战，仙族创造的“妖圣”齐天重创妖族，却不知为何与仙族反目，遭到仙族与妖族的围剿，生命垂危之际，“妖圣”自爆肉身，将灵魂解离成数份散落于各处，而陆小天就是其中一份灵魂的宿主……', 3, 1, 2, 'http://localhost:8080/img/cartoon_38.jpg');
INSERT INTO `cartoonbook` VALUES (39, '我的守护女友', '阅文漫画', '第107话', '末世来临，凌默的异能觉醒，他发现自己居然可以控制丧尸。 凌默利用自己的异能穿过尸潮，终于找到了心爱的女友—叶恋。却发现她已经成为了变异丧尸。 为了帮助叶恋恢复神智，凌默踏上了末世求生之旅……', 8, 1, 2, 'http://localhost:8080/img/cartoon_39.jpg');
INSERT INTO `cartoonbook` VALUES (40, '修真四万年', '三福动漫', '第306话', '倘若这宇宙，真是一片残酷血腥的黑暗森林，我们修真者，也会燃烧自己的生命，绽放出微弱的火花！” “最终，小小的火花，会在这片黑暗森林中，掀起燎原天火，照亮整个世界！” 修真40000年代，一个普普通通的边境少年，咆哮星辰，主宰银河的热血传奇！', 4, 1, 4, 'http://localhost:8080/img/cartoon_40.jpg');
INSERT INTO `cartoonbook` VALUES (41, '璇玑辞', '飒漫画', '第165话 第一次见面2', '这是一个绝对让你想不到的故事！漫画的女主角袁欣是一个喜欢沉浸在幻想世界里的超级宅女，喜欢看帅哥的她在两名校园人气帅哥面前出糗后决心报复回去，不料关键时刻发生的一个意外让他们一起穿越到了手游中的世界！', 6, 1, 4, 'http://localhost:8080/img/cartoon_41.jpg');
INSERT INTO `cartoonbook` VALUES (42, '最强妖孽', '博易动漫', '第168话 打完了？', '笨蛋学生叶凡高考前见义勇为受了重伤，在课堂上死去。 异世大仙叶凡，渡劫失败转投人间重新修炼，附身在这位笨蛋叶凡身上。 所有人都感觉-重生后的叶凡变得跟以前不一样了……', 7, 1, 4, 'http://localhost:8080/img/cartoon_42.jpg');
INSERT INTO `cartoonbook` VALUES (43, '遮天', '神漫', '第293话 对我无效3', '以九龙拉棺为引子，带出一个庞大的洪荒世界，登天路，踏歌行，看叶凡如何弹指遮天。', 1, 1, 5, 'http://localhost:8080/img/cartoon_43.jpg');
INSERT INTO `cartoonbook` VALUES (44, '唐寅在异界', '云端漫画', '第135话2 速战速决', '他有一身出类拔萃的功夫，但在现实世界中却没有用武之地，只能做个见不得光的杀手。 而去到了混乱不堪的异界，在你死我活的战场上他的实力却得到最大程度的发挥。 在这里，他可以肆无忌惮地挥舞手中的武器；在这里，为了生存，他别无选择走上那条属于他自己的王者之路。 他的名字叫唐寅，他的一切，只是存在于传说...', 5, 1, 1, 'http://localhost:8080/img/cartoon_44.jpg');
INSERT INTO `cartoonbook` VALUES (45, '万界仙踪', '踏雪动漫', '第273话', '一花一世界，所谓凡世，不过仙魔掌中一粒沙尘。 仙魔一念，人世千载。万里河山，不过镜花水月，人死之后， 魂归万界星空。', 4, 1, 6, 'http://localhost:8080/img/cartoon_45.jpg');
INSERT INTO `cartoonbook` VALUES (46, '仙逆', '魅丽漫画馆', '第140话3 本尊', '道在人为！少年王林几经转折，以平庸的资质踏入仙途，历经坎坷，凭着其聪睿的心智，艰难的迈向崎岖仙路。 顺为凡，逆则仙，只在心中一念间……修真，到底是修的什么？ 不如相忘于江湖修道，修仙，修真。神通，道法，仙法。', 1, 1, 6, 'http://localhost:8080/img/cartoon_46.jpg');
INSERT INTO `cartoonbook` VALUES (47, '骑士幻想夜', '飒漫画', '你愿意为梦想付费吗', '一张神秘的游戏光盘，将胆小怕事的高一学生林零带入了——亚瑟王和他的圆桌骑士的世界！现实和虚幻轮流交替，构筑成了一个对她来说完全陌生的世界。', 2, 2, 6, 'http://localhost:8080/img/cartoon_47.jpg');
INSERT INTO `cartoonbook` VALUES (48, '龙符之王道天下', '神居动漫', '联动宣传活动', '苍茫大地，未来变革，混乱之中，龙蛇并起，谁是真龙，谁又是蟒蛇？或是天地众生，皆可成龙？ 朝廷，江湖门派，世外仙道，千年世家，蛮族，魔神，妖族，上古巫道，千百势力，相互纠缠...', 6, 1, 6, 'http://localhost:8080/img/cartoon_48.jpg');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '连载中');
INSERT INTO `category` VALUES (2, '已完结');

-- ----------------------------
-- Table structure for chapter
-- ----------------------------
DROP TABLE IF EXISTS `chapter`;
CREATE TABLE `chapter`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cartoon` int(255) NOT NULL,
  `img` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `ch_c_id`(`cartoon`) USING BTREE,
  CONSTRAINT `ch_c_id` FOREIGN KEY (`cartoon`) REFERENCES `cartoonbook` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chapter
-- ----------------------------
INSERT INTO `chapter` VALUES (1, '第二十三话', 2, 'http://localhost:8080/img/cartoon_main_5.jpg', '99万+', '2020-1-1', '步天歌');
INSERT INTO `chapter` VALUES (2, '第二十四话', 2, 'http://localhost:8080/img/cartoon_main_25.jpg', '99万+', '2020-1-5', '步天歌');
INSERT INTO `chapter` VALUES (3, '第二十五话', 2, 'http://localhost:8080/img/cartoon_main_45.jpg', '99万+', '2020-1-10', '步天歌');

-- ----------------------------
-- Table structure for choice
-- ----------------------------
DROP TABLE IF EXISTS `choice`;
CREATE TABLE `choice`  (
  `sid` int(11) NOT NULL,
  `sname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of choice
-- ----------------------------
INSERT INTO `choice` VALUES (1, '首页推荐');
INSERT INTO `choice` VALUES (2, '最近更新');
INSERT INTO `choice` VALUES (3, '猜你喜欢');
INSERT INTO `choice` VALUES (4, '综合榜单');
INSERT INTO `choice` VALUES (5, '口碑榜');
INSERT INTO `choice` VALUES (6, '畅销榜');

-- ----------------------------
-- Table structure for ct_user
-- ----------------------------
DROP TABLE IF EXISTS `ct_user`;
CREATE TABLE `ct_user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ct_user
-- ----------------------------
INSERT INTO `ct_user` VALUES (7, '1454054667@qq.com', '123456qwe', '大佬鱼哥');

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `chapter` int(255) NOT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `p_c_id`(`chapter`) USING BTREE,
  CONSTRAINT `p_c_id` FOREIGN KEY (`chapter`) REFERENCES `chapter` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES (1, 'http://localhost:8080/img/cartoon_main_1.jpg', 1);
INSERT INTO `picture` VALUES (2, 'http://localhost:8080/img/cartoon_main_2.jpg', 1);
INSERT INTO `picture` VALUES (3, 'http://localhost:8080/img/cartoon_main_3.jpg', 1);
INSERT INTO `picture` VALUES (4, 'http://localhost:8080/img/cartoon_main_4.jpg', 1);
INSERT INTO `picture` VALUES (5, 'http://localhost:8080/img/cartoon_main_5.jpg', 1);
INSERT INTO `picture` VALUES (6, 'http://localhost:8080/img/cartoon_main_6.jpg', 1);
INSERT INTO `picture` VALUES (7, 'http://localhost:8080/img/cartoon_main_7.jpg', 1);
INSERT INTO `picture` VALUES (8, 'http://localhost:8080/img/cartoon_main_8.jpg', 1);
INSERT INTO `picture` VALUES (9, 'http://localhost:8080/img/cartoon_main_9.jpg', 1);
INSERT INTO `picture` VALUES (10, 'http://localhost:8080/img/cartoon_main_10.jpg', 1);
INSERT INTO `picture` VALUES (11, 'http://localhost:8080/img/cartoon_main_11.jpg', 1);
INSERT INTO `picture` VALUES (12, 'http://localhost:8080/img/cartoon_main_12.jpg', 1);
INSERT INTO `picture` VALUES (13, 'http://localhost:8080/img/cartoon_main_13.jpg', 1);
INSERT INTO `picture` VALUES (14, 'http://localhost:8080/img/cartoon_main_14.jpg', 1);
INSERT INTO `picture` VALUES (15, 'http://localhost:8080/img/cartoon_main_15.jpg', 1);
INSERT INTO `picture` VALUES (16, 'http://localhost:8080/img/cartoon_main_16.jpg', 1);
INSERT INTO `picture` VALUES (17, 'http://localhost:8080/img/cartoon_main_17.jpg', 1);
INSERT INTO `picture` VALUES (18, 'http://localhost:8080/img/cartoon_main_18.jpg', 1);
INSERT INTO `picture` VALUES (19, 'http://localhost:8080/img/cartoon_main_19.jpg', 1);
INSERT INTO `picture` VALUES (20, 'http://localhost:8080/img/cartoon_main_20.jpg', 1);
INSERT INTO `picture` VALUES (21, 'http://localhost:8080/img/cartoon_main_21.jpg', 2);
INSERT INTO `picture` VALUES (22, 'http://localhost:8080/img/cartoon_main_22.jpg', 2);
INSERT INTO `picture` VALUES (23, 'http://localhost:8080/img/cartoon_main_23.jpg', 2);
INSERT INTO `picture` VALUES (24, 'http://localhost:8080/img/cartoon_main_24.jpg', 2);
INSERT INTO `picture` VALUES (25, 'http://localhost:8080/img/cartoon_main_25.jpg', 2);
INSERT INTO `picture` VALUES (26, 'http://localhost:8080/img/cartoon_main_26.jpg', 2);
INSERT INTO `picture` VALUES (27, 'http://localhost:8080/img/cartoon_main_27.jpg', 2);
INSERT INTO `picture` VALUES (28, 'http://localhost:8080/img/cartoon_main_28.jpg', 2);
INSERT INTO `picture` VALUES (29, 'http://localhost:8080/img/cartoon_main_29.jpg', 2);
INSERT INTO `picture` VALUES (30, 'http://localhost:8080/img/cartoon_main_30.jpg', 2);
INSERT INTO `picture` VALUES (31, 'http://localhost:8080/img/cartoon_main_31.jpg', 2);
INSERT INTO `picture` VALUES (32, 'http://localhost:8080/img/cartoon_main_32.jpg', 2);
INSERT INTO `picture` VALUES (33, 'http://localhost:8080/img/cartoon_main_33.jpg', 2);
INSERT INTO `picture` VALUES (34, 'http://localhost:8080/img/cartoon_main_34.jpg', 2);
INSERT INTO `picture` VALUES (35, 'http://localhost:8080/img/cartoon_main_35.jpg', 2);
INSERT INTO `picture` VALUES (36, 'http://localhost:8080/img/cartoon_main_36.jpg', 2);
INSERT INTO `picture` VALUES (37, 'http://localhost:8080/img/cartoon_main_37.jpg', 2);
INSERT INTO `picture` VALUES (38, 'http://localhost:8080/img/cartoon_main_38.jpg', 2);
INSERT INTO `picture` VALUES (39, 'http://localhost:8080/img/cartoon_main_39.jpg', 2);
INSERT INTO `picture` VALUES (40, 'http://localhost:8080/img/cartoon_main_40.jpg', 3);
INSERT INTO `picture` VALUES (41, 'http://localhost:8080/img/cartoon_main_41.jpg', 3);
INSERT INTO `picture` VALUES (42, 'http://localhost:8080/img/cartoon_main_42.jpg', 3);
INSERT INTO `picture` VALUES (43, 'http://localhost:8080/img/cartoon_main_43.jpg', 3);
INSERT INTO `picture` VALUES (44, 'http://localhost:8080/img/cartoon_main_44.jpg', 3);
INSERT INTO `picture` VALUES (45, 'http://localhost:8080/img/cartoon_main_45.jpg', 3);
INSERT INTO `picture` VALUES (46, 'http://localhost:8080/img/cartoon_main_46.jpg', 3);
INSERT INTO `picture` VALUES (47, 'http://localhost:8080/img/cartoon_main_47.jpg', 3);
INSERT INTO `picture` VALUES (48, 'http://localhost:8080/img/cartoon_main_48.jpg', 3);
INSERT INTO `picture` VALUES (49, 'http://localhost:8080/img/cartoon_main_49.jpg', 3);
INSERT INTO `picture` VALUES (50, 'http://localhost:8080/img/cartoon_main_50.jpg', 3);
INSERT INTO `picture` VALUES (51, 'http://localhost:8080/img/cartoon_main_51.jpg', 3);
INSERT INTO `picture` VALUES (52, 'http://localhost:8080/img/cartoon_main_53.jpg', 3);
INSERT INTO `picture` VALUES (53, 'http://localhost:8080/img/cartoon_main_54.jpg', 3);
INSERT INTO `picture` VALUES (54, 'http://localhost:8080/img/cartoon_main_55.jpg', 3);
INSERT INTO `picture` VALUES (55, 'http://localhost:8080/img/cartoon_main_56.jpg', 3);
INSERT INTO `picture` VALUES (56, 'http://localhost:8080/img/cartoon_main_57.jpg', 3);
INSERT INTO `picture` VALUES (57, 'http://localhost:8080/img/cartoon_main_58.jpg', 3);
INSERT INTO `picture` VALUES (58, 'http://localhost:8080/img/cartoon_main_59.jpg', 3);
INSERT INTO `picture` VALUES (59, 'http://localhost:8080/img/cartoon_main_60.jpg', 3);

-- ----------------------------
-- Table structure for theme
-- ----------------------------
DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme`  (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of theme
-- ----------------------------
INSERT INTO `theme` VALUES (1, '正能量');
INSERT INTO `theme` VALUES (2, '校园');
INSERT INTO `theme` VALUES (3, '玄幻');
INSERT INTO `theme` VALUES (4, '日漫');
INSERT INTO `theme` VALUES (5, '灵异');
INSERT INTO `theme` VALUES (6, '都市');
INSERT INTO `theme` VALUES (7, '古风');
INSERT INTO `theme` VALUES (8, '治愈');
INSERT INTO `theme` VALUES (9, '萌系');

SET FOREIGN_KEY_CHECKS = 1;
