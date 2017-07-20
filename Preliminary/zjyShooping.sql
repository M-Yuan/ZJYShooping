drop database ZJYShooping;

create database ZJYShooping;

use ZJYShooping;


--��ͨ�û���
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

--���û����У���ӳ�ʼ���û�
insert into users values(NULL, 'shunping', '��˳ƽ', 'shunping', 'hanshunping@tsinghua.org.cn', '010-88888888', '����С��2��Ԫ203��', '733555', 1);

--����Ա��admin --��ʱ����


--�����
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


insert into goods values(NULL, '�ڰ�ɭ��', '����һ����Ƭ', 59, 1, '��ۼκ̳�Ʒ', '01.jpg', '��۵�Ӱ');
insert into goods values(NULL, '��II', '����һ����Ƭ', 45, 1, '��ۼκ̳�Ʒ', '02.jpg', '��۵�Ӱ');
insert into goods values(NULL, '��Ů�˹�', '����һ����Ƭ', 99, 1, '��ۼκ̳�Ʒ', '03.jpg', '��۵�Ӱ');
insert into goods values(NULL, '��������', '����һ����Ƭ', 10, 1, '��ۼκ̳�Ʒ', '04.jpg', '��۵�Ӱ');
insert into goods values(NULL, '����', '����һ����Ƭ', 56, 1, '��ۼκ̳�Ʒ', '05.jpg', '��۵�Ӱ');
insert into goods values(NULL, 'A�ƻ�', '����һ����Ƭ', 56, 1, '��ۼκ̳�Ʒ', '01.jpg', '��۵�Ӱ');
insert into goods values(NULL, '����', '����һ����Ƭ', 55, 1, '��ۼκ̳�Ʒ', '02.jpg', '��۵�Ӱ');
insert into goods values(NULL, 'Ӣ�۱�ɫ', '����һ����Ƭ', 10, 1, '��ۼκ̳�Ʒ', '04.jpg', '��۵�Ӱ');
insert into goods values(NULL, '��ͳ�', '����һ����Ƭ', 56, 1, '��ۼκ̳�Ʒ', '05.jpg', '��۵�Ӱ');
insert into goods values(NULL, '��������', '����һ����Ƭ', 56, 1, '��ۼκ̳�Ʒ', '01.jpg', '��۵�Ӱ');
insert into goods values(NULL, '�޼��', '����һ����Ƭ', 56, 1, '��ۼκ̳�Ʒ', '01.jpg', '��۵�Ӱ');
insert into goods values(NULL, '�������', '����һ����Ƭ', 10, 1, '��ۼκ̳�Ʒ', '04.jpg', '��۵�Ӱ');
insert into goods values(NULL, 'ȫ��Ŀ��', '����һ����Ƭ', 56, 1, '��½ĳ��˾��Ʒ', '05.jpg', '��۵�Ӱ');
insert into goods values(NULL, '����', '����һ����Ƭ', 56, 1, '��½ĳ��˾��Ʒ', '01.jpg', '��۵�Ӱ');
insert into goods values(NULL, '���ν��', '����һ����Ƭ', 56, 1, 'ŷ��ĳ��˾��Ʒ', '01.jpg', '��۵�Ӱ');

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





