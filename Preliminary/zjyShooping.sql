drop database ZJYShooping;

create database ZJYShooping;

use ZJYShooping;


--普通用户表
create table users{
	userid bigint primary key identity,
	username varchar(30) not null unique,
	truename varchar(30) not null,
	passwd varchar(30) not null,
	email varchar(40) not null,
	phone varchar(20) not null,
	address varchar(30) not null,
	postcode char(6) not null,
	grade int default 5
}

--mysql version
create table users(
    userId bigint not null auto_increment primary key,
	username varchar(30) not null unique,
	truename varchar(30) not null,
	passwd varchar(30) not null,
	email varchar(40) not null,
	phone varchar(20) not null,
	address varchar(30) not null,
	postcode char(6) not null,
	grade int default 5
)Engine=InnoDB;

--向用户表中，添加初始化用户
insert into users values(NULL, 'shunping', '韩顺平', 'shunping', 'hanshunping@tsinghua.org.cn', '010-88888888', '星星小区2单元203室', '733555', 1);
insert into users values(NULL, 'admin', '管理员', 'admin', 'admin@tsinghua.org.cn', '010-88888888', '华润小区1单元1208室', '733555', 1);
insert into users values(NULL, 'wangxiaoming', '小明', '123456', 'wxming@tsinghua.org.cn', '010-88888888', '恒大小区13单元407室', '733555', 3);
--管理员表admin --暂时不建


--货物表
create table goods(
	goodsId bigint primary key identity,
	goodsName varchar(40),
	goodsIntro varchar(500),
	goodsPrice float,
	goodsNum int,
	publisher varchar(40),
	photo varchar(40),
	type varchar(10)
)

--mysql version
create table goods(
    goodsId bigint not null auto_increment primary key,
	goodsName varchar(40),
	goodsIntro varchar(500),
	goodsPrice float,
	goodsNum int,
	publisher varchar(40),
	photo varchar(40),
	type varchar(10)
)Engine=InnoDB;


insert into goods values(NULL, '黑白森林', '剧情的展开都相当直接但又颇有悬念，情节的驾御也非常棒，全片几乎没有一处多余的累赘的情节描写。加上优秀剧本的力量，使得影片从头到尾都非常引人入胜，节奏也放得恰倒好处，张弛有力，营造出较自然的氛围叫人绷紧神经。而对配乐的运用也极为动人心魄，适时地把气氛调动起来由舒缓到强烈紧张。', 59, 1, '中国星娱乐有限公司', '01.jpg', '香港电影');
insert into goods values(NULL, '金鸡II', '剧情聚焦在‘现在’，亦为2003年度。借此来传达某种良好的祝愿。现在想来，很可能陈可辛一早就有拍续集的腹案计划，只是半途非典的肆虐又给予了其新的灵感，所以影片里才会出现非典时期的剧情与阿金再陷入对过去的回忆的剧情格格不入的现象。', 45, 1, 'Applause Pictures', '02.jpg', '香港电影');
insert into goods values(NULL, '靓女差馆', '港岛西区警署刑事侦缉组由Madam雷率领，全组皆是女警，所以有“靓女差馆”之称。另一警署的警员生啤和沙爹在一次连同线人旦散抓捕通缉犯犀牛的行动中，不幸失败被擒。得由Madam雷率领的众靓女CID帮忙而保存性命，对众美女一见难忘，两人遂主动申请调职，费尽心思调到靓女差馆，以接近众女警，并展开追求。', 99, 1, '电影动力有限公司', '03.jpg', '香港电影');
insert into goods values(NULL, '布衣神相', '与金庸充满历史浑厚感的作品不同，温瑞安的这部作品加入了相学、术学等传统文化元素，突出个人命运和友情，为武侠小说注入了一股新鲜的血液，令观众能从新鲜的角度来看武侠世界。', 40, 1, '香港电视广播有限公司', '04.jpg', '香港电影');
insert into goods values(NULL, '洛神', '港剧拍古装其实很不容易，因为他们有着地域的限制，没有实景拍摄，只能在棚内作业，这难免让剧的质量显得粗糙。', 56, 1, '电视广播(国际)有限公司', '05.jpg', '香港电影');
insert into goods values(NULL, 'A计划', '《A计划》脱出成龙以往影片格局，背景虽然仍是清末民初，剧情却讲述香港水警打海盗的传奇，影片风格诙谐，堆砌不少搞笑桥段，然故事完整、兼具正剧元素，开辟了1980年代成龙电影的全新剧情模式。', 56, 1, '香港嘉禾出品', '01.jpg', '香港电影');
insert into goods values(NULL, '赌神', '掀起了香港赌片的一个热潮。影片中饰演高进的周润发将演技发挥地淋漓尽致，他使我们看到一个由神到人再次升为神的那种震撼,惊喜与痛快。', 55, 1, '永盛电影公司', '02.jpg', '香港电影');
insert into goods values(NULL, '英雄本色', '尽情地发挥了吴宇森的“暴力美学”、“兄弟情”、“双枪”等标签式电影语汇，揭示了在善恶之间摆荡的人性  。影片并非港台江湖黑帮的内幕暴露，亦非社会现实的反映，而是活脱脱英雄神话的再造，完全是创作者的主观愿望，感情的投射。', 42, 1, '寰亚综艺娱乐集团有限公司', '04.jpg', '香港电影');
insert into goods values(NULL, '快餐车', '打斗场面可谓精彩纷呈，其中成龙、洪金宝、元彪三人灵巧的身手、无间的配合让人印象深刻，搞笑的戏剧场面堪称经典（华商网评）[6]  。全片拍得爽朗热闹，符合成龙电影一贯的娱乐观众需求（凤凰网评）[1]  。三位动作演员的配合打得热闹纷呈，但是为了打出新意，特意奔赴西班牙取景拍摄，呈现出浓烈的异域风情。', 56, 1, '香港嘉禾出品', '05.jpg', '香港电影');
insert into goods values(NULL, '至尊无上Ⅱ之永霸天下', '以一群赌徒为中心人物，剧情亦以一场赌局为牵引；但描述的却是一段兄弟恩怨情仇，内容与《至尊无上》并无相连之处。全片色彩浓烈，人物鲜明突出，大量火爆动作场面快速俐落，有浓厚的浪漫效果。而故事内容也很简洁。每位演员也演得各有特色，是一部较好的影片。', 56, 1, '永盛电影公司', '01.jpg', '台湾电影');
insert into goods values(NULL, '无间道III', '一个普通而又精彩的正义战胜邪恶的故事，在这个背景上，编剧根据自己的想象，勾勒出一幅生动的风情画，表现出一个消逝的、令人伤感的英雄世界。影片中导演刘伟强娴熟、巧妙地运用了大量闪回境头，以人物思绪的变化作为事件的衔接点，时空交错表现得自然、流畅，不显丝毫斧凿痕迹，很多场面给人留下了难忘的印象，显示出刘伟强等导演过人的艺术功力。', 56, 1, '寰亚综艺娱乐集团有限公司', '01.jpg', '香港电影');
insert into goods values(NULL, '新警察故事', '没有延续成龙以往的动作喜剧片，而是一部动作剧情片，一改轻松风格、大谈感情，更多讲述的是兄弟情、以及成龙与杨采妮的爱情。', 39, 1, '英皇影业有限公司', '04.jpg', '香港电影');
insert into goods values(NULL, '全名目击', '采用多角度叙事结构，通过大众群体、律师余男、检察官郭富城、富豪孙红雷的四个视角去讲述同一件事情，不同的角度展现不同的细节与观点，制造层层悬念，最终还原出事情的真相。', 56, 1, '电广传媒影业(北京)有限公司', '05.jpg', '大陆电影');
insert into goods values(NULL, '风声', '有典型谍战片的先天优势，好剧本做底，再加上奢靡考究的布景，香艳典雅的人物造型，绚丽而怀旧的色调，漂亮炫目的摄影，能把握心理细节的好演员，以及干脆利落行云流水的剪辑——每个细节都做足了功夫', 56, 1, '华谊兄弟传媒集团', '01.jpg', '大陆电影');
insert into goods values(NULL, '变形金刚5:胜利的堕落', '电影为了能展现出更多的汽车人，剧情的划分变的极其不合理，在这部作品中情感都是想当然的，没有酝酿，没有演变，甚至没有合理的起承转合，所有的情感，不管是友谊羁绊也好，还是幡然醒悟，都只是如同走马观花般的一带而过，而为了能给这个系列继续续命，电影又还想要力图去扩展更大的世界观', 56, 1, '美国孩之宝(Hasbro)公司', '01.jpg', '欧美电影');

drop table orders;
---sql server
create table orders(
	ordersId bigint primary key identity(1,1),	--订单号
	userId bigint constraint fk_client_id references users(userid), --哪个用户订的
	orderDate datetime default getdate(), --下订单的时间
	payMode varchar(20) check(payMode in('货到付款', '支付宝付款')) default '货到付款', --付款的方式
	isPayed bit check (isPayed in (0,1)),  --0表示未付款，1表示已经付款
	totalPrice float not null --总价格
)

---mysql
create table orders(
	ordersId bigint not null auto_increment primary key,
	userId bigint,
	CONSTRAINT  table_ibfk_0 foreign key (userId) references users(userId),
	orderDate timestamp not null default now(),
	payMode varchar(20) default '货到付款',
	constraint CKC_DOC_CONTENT_VALPSTN check (payMode is null or (payMode in ('货到付款','支付宝付款'))),
	isPayed bit check ( isPayed in (0 ,1)),
	totalPrice float not null
)Engine=InnoDB;

drop table orderDetail;
---sql server
create table orderDetail(
	ordersId bigint constraint fk_order_id references orders(ordersId),	--订单号(并是一个外键，指向orders表)
	goodsId bigint constraint fk_shangpin_id references goods(goodsId), --商品号(并是一个外键，指向goods表)
	nums int not null --数量
)

---mysql
create table orderDetail(
	ordersId bigint,
	CONSTRAINT  table_ibfk_1 foreign key (ordersId) references orders(ordersId),
	goodsId  bigint,
	CONSTRAINT  table_ibfk_2 foreign key (goodsId) references goods(goodsId),
	goodNums int not null
)Engine=InnoDB;


insert into orders (userId, isPayed, totalPrice) value(1, 0, 99);





