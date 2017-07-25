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
insert into users values(NULL, 'admin', '����Ա', 'admin', 'admin@tsinghua.org.cn', '010-88888888', '����С��1��Ԫ1208��', '733555', 1);
insert into users values(NULL, 'wangxiaoming', 'С��', '123456', 'wxming@tsinghua.org.cn', '010-88888888', '���С��13��Ԫ407��', '733555', 3);
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
---sql server
create table orders(
	ordersId bigint primary key identity(1,1),	--������
	userId bigint constraint fk_client_id references users(userid), --�ĸ��û�����
	orderDate datetime default getdate(), --�¶�����ʱ��
	payMode varchar(20) check(payMode in('��������', '֧��������')) default '��������', --����ķ�ʽ
	isPayed bit check (isPayed in (0,1)),  --0��ʾδ���1��ʾ�Ѿ�����
	totalPrice float not null --�ܼ۸�
)

---mysql
create table orders(
	ordersId bigint not null auto_increment primary key,
	userId   bigint,
	index par_id (userId),
	foreign key (userId) references users(userId),
	orderDate timestamp not null default now(),
	payMode varchar(20) default '��������',
	constraint CKC_DOC_CONTENT_VALPSTN check (payMode is null or (payMode in ('��������','֧��������'))),
	isPayed bit check ( isPayed in (0 ,1)),
	totalPrice float not null
);


drop table orderDetail;
---sql server
create table orders(
	ordersId bigint constraint fk_order_id references orders(ordersId),	--������(����һ�������ָ��orders��)
	goodsId bigint constraint fk_shangpin_id references goods(goodsId), --��Ʒ��(����һ�������ָ��goods��)
	nums int not null --����
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
