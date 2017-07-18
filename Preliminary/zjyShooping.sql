drop database testdb3;

create database testdb3;

use testdb3;


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


drop table orders;

create table orders(
    ordersId bigint not null auto_increment primary key,
	userId bigint not null,
	orderDate varchar(12),
	payMode varchar(40),
	isPayed tinyint,
	totalPrice float(7,4) DEFAULT NULL
);


drop table orderDetail;

create table orderDetail(
	ordesIid bigint not null auto_increment primary key,
	goodsId bigint,
	nums int
);





