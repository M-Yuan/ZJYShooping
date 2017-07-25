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
);

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
);


insert into goods values(NULL, '黑白森林', '这是一部好片', 59, 1, '香港嘉禾出品', '01.jpg', '香港电影');
insert into goods values(NULL, '金鸡II', '这是一部好片', 45, 1, '香港嘉禾出品', '02.jpg', '香港电影');
insert into goods values(NULL, '靓女菜馆', '这是一部好片', 99, 1, '香港嘉禾出品', '03.jpg', '香港电影');
insert into goods values(NULL, '布衣神相', '这是一部好片', 10, 1, '香港嘉禾出品', '04.jpg', '香港电影');
insert into goods values(NULL, '洛神', '这是一部好片', 56, 1, '香港嘉禾出品', '05.jpg', '香港电影');
insert into goods values(NULL, 'A计划', '这是一部好片', 56, 1, '香港嘉禾出品', '01.jpg', '香港电影');
insert into goods values(NULL, '赌神', '这是一部好片', 55, 1, '香港嘉禾出品', '02.jpg', '香港电影');
insert into goods values(NULL, '英雄本色', '这是一部好片', 10, 1, '香港嘉禾出品', '04.jpg', '香港电影');
insert into goods values(NULL, '快餐车', '这是一部好片', 56, 1, '香港嘉禾出品', '05.jpg', '香港电影');
insert into goods values(NULL, '至尊无上', '这是一部好片', 56, 1, '香港嘉禾出品', '01.jpg', '香港电影');
insert into goods values(NULL, '无间道', '这是一部好片', 56, 1, '香港嘉禾出品', '01.jpg', '香港电影');
insert into goods values(NULL, '警察故事', '这是一部好片', 10, 1, '香港嘉禾出品', '04.jpg', '香港电影');
insert into goods values(NULL, '全名目击', '这是一部好片', 56, 1, '大陆某公司出品', '05.jpg', '香港电影');
insert into goods values(NULL, '风声', '这是一部好片', 56, 1, '大陆某公司出品', '01.jpg', '香港电影');
insert into goods values(NULL, '变形金刚', '这是一部好片', 56, 1, '欧美某公司出品', '01.jpg', '香港电影');

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
	userId   bigint,
	index par_id (userId),
	foreign key (userId) references users(userId),
	orderDate timestamp not null default now(),
	payMode varchar(20) default '货到付款',
	constraint CKC_DOC_CONTENT_VALPSTN check (payMode is null or (payMode in ('货到付款','支付宝付款'))),
	isPayed bit check ( isPayed in (0 ,1)),
	totalPrice float not null
);


drop table orderDetail;
---sql server
create table orders(
	ordersId bigint constraint fk_order_id references orders(ordersId),	--订单号(并是一个外键，指向orders表)
	goodsId bigint constraint fk_shangpin_id references goods(goodsId), --商品号(并是一个外键，指向goods表)
	nums int not null --数量
)

---mysql
create table orderDetail(
	ordersId bigint,
	index par_id (ordersId),
	foreign key (ordersId) references orders(ordersId),
	goodsId  bigint,
	index order_id (goodsId),
	foreign key (goodsId) references users(userid),
	nums int not null
); 


insert into orders (userId, isPayed, totalPrice) value(1, 0, 99);
