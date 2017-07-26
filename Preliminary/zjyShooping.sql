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
)Engine=InnoDB;

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
)Engine=InnoDB;


insert into goods values(NULL, '�ڰ�ɭ��', '�����չ�����൱ֱ�ӵ������������ڵļ���Ҳ�ǳ�����ȫƬ����û��һ���������׸�������д����������籾��������ʹ��ӰƬ��ͷ��β���ǳ�������ʤ������Ҳ�ŵ�ǡ���ô����ų�������Ӫ�������Ȼ�ķ�Χ���˱����񾭡��������ֵ�����Ҳ��Ϊ�������ǣ���ʱ�ذ����յ����������滺��ǿ�ҽ��š�', 59, 1, '�й����������޹�˾', '01.jpg', '��۵�Ӱ');
insert into goods values(NULL, '��II', '����۽��ڡ����ڡ�����Ϊ2003��ȡ����������ĳ�����õ�ףԸ�������������ܿ��ܳ¿���һ������������ĸ����ƻ���ֻ�ǰ�;�ǵ����Ű�ָ��������µ���У�����ӰƬ��Ż���ַǵ�ʱ�ڵľ����밢��������Թ�ȥ�Ļ���ľ������������', 45, 1, 'Applause Pictures', '02.jpg', '��۵�Ӱ');
insert into goods values(NULL, '��Ů���', '�۵��������������켩����Madam�����죬ȫ�����Ů���������С���Ů��ݡ�֮�ơ���һ����ľ�Ա��ơ��ɳ����һ����ͬ���˵�ɢץ��ͨ����Ϭţ���ж��У�����ʧ�ܱ��ܡ�����Madam�����������ŮCID��æ������������������Ůһ�����������������������ְ���Ѿ���˼������Ů��ݣ��Խӽ���Ů������չ��׷��', 99, 1, '��Ӱ�������޹�˾', '03.jpg', '��۵�Ӱ');
insert into goods values(NULL, '��������', '���ӹ������ʷ���е���Ʒ��ͬ�����𰲵��ⲿ��Ʒ��������ѧ����ѧ�ȴ�ͳ�Ļ�Ԫ�أ�ͻ���������˺����飬Ϊ����С˵ע����һ�����ʵ�ѪҺ��������ܴ����ʵĽǶ������������硣', 40, 1, '��۵��ӹ㲥���޹�˾', '04.jpg', '��۵�Ӱ');
insert into goods values(NULL, '����', '�۾��Ĺ�װ��ʵ�ܲ����ף���Ϊ�������ŵ�������ƣ�û��ʵ�����㣬ֻ����������ҵ���������þ�������Եôֲڡ�', 56, 1, '���ӹ㲥(����)���޹�˾', '05.jpg', '��۵�Ӱ');
insert into goods values(NULL, 'A�ƻ�', '��A�ƻ����ѳ���������ӰƬ��֣�������Ȼ������ĩ���������ȴ�������ˮ���򺣵��Ĵ��棬ӰƬ���ڶг���������ٸ�Ц�ŶΣ�Ȼ�����������������Ԫ�أ�������1980���������Ӱ��ȫ�¾���ģʽ��', 56, 1, '��ۼκ̳�Ʒ', '01.jpg', '��۵�Ӱ');
insert into goods values(NULL, '����', '��������۶�Ƭ��һ���ȳ���ӰƬ�����ݸ߽������󷢽��ݼ����ӵ����쾡�£���ʹ���ǿ���һ���������ٴ���Ϊ���������,��ϲ��ʹ�졣', 55, 1, '��ʢ��Ӱ��˾', '02.jpg', '��۵�Ӱ');
insert into goods values(NULL, 'Ӣ�۱�ɫ', '����ط���������ɭ�ġ�������ѧ�������ֵ��顱����˫ǹ���ȱ�ǩʽ��Ӱ��㣬��ʾ�����ƶ�֮��ڵ�������  ��ӰƬ���Ǹ�̨�����ڰ����Ļ��¶����������ʵ�ķ�ӳ�����ǻ�����Ӣ���񻰵����죬��ȫ�Ǵ����ߵ�����Ը���������Ͷ�䡣', 42, 1, '����������ּ������޹�˾', '04.jpg', '��۵�Ӱ');
insert into goods values(NULL, '��ͳ�', '�򶷳����ν���ʷ׳ʣ����г�������𱦡�Ԫ���������ɵ����֡��޼���������ӡ����̣���Ц��Ϸ�糡�濰�ƾ��䣨����������[6]  ��ȫƬ�ĵ�ˬ�����֣����ϳ�����Ӱһ������ֹ������󣨷��������[1]  ����λ������Ա����ϴ�����ַ׳ʣ�����Ϊ�˴�����⣬���ⱼ��������ȡ�����㣬���ֳ�Ũ�ҵ�������顣', 56, 1, '��ۼκ̳�Ʒ', '05.jpg', '��۵�Ӱ');
insert into goods values(NULL, '�������Ϣ�֮��������', '��һȺ��ͽΪ���������������һ���ľ�Ϊǣ������������ȴ��һ���ֵܶ�Թ��������롶�������ϡ���������֮����ȫƬɫ��Ũ�ң���������ͻ���������𱬶�������������䣬��Ũ�������Ч��������������Ҳ�ܼ�ࡣÿλ��ԱҲ�ݵø�����ɫ����һ���Ϻõ�ӰƬ��', 56, 1, '��ʢ��Ӱ��˾', '01.jpg', '̨���Ӱ');
insert into goods values(NULL, '�޼��III', 'һ����ͨ���־��ʵ�����սʤа��Ĺ��£�����������ϣ��������Լ������󣬹��ճ�һ�������ķ��黭�����ֳ�һ�����ŵġ������˸е�Ӣ�����硣ӰƬ�е�����ΰǿ��졢����������˴������ؾ�ͷ��������˼���ı仯��Ϊ�¼����νӵ㣬ʱ�ս�����ֵ���Ȼ������������˿������ۼ����ܶೡ�����������������ӡ����ʾ����ΰǿ�ȵ��ݹ��˵�����������', 56, 1, '����������ּ������޹�˾', '01.jpg', '��۵�Ӱ');
insert into goods values(NULL, '�¾������', 'û���������������Ķ���ϲ��Ƭ������һ����������Ƭ��һ�����ɷ�񡢴�̸���飬���ི�������ֵ��顢�Լ�����������ݵİ��顣', 39, 1, 'Ӣ��Ӱҵ���޹�˾', '04.jpg', '��۵�Ӱ');
insert into goods values(NULL, 'ȫ��Ŀ��', '���ö�Ƕ����½ṹ��ͨ������Ⱥ�塢��ʦ���С����ٹ����ǡ���������׵��ĸ��ӽ�ȥ����ͬһ�����飬��ͬ�ĽǶ�չ�ֲ�ͬ��ϸ����۵㣬������������ջ�ԭ����������ࡣ', 56, 1, '��㴫ýӰҵ(����)���޹�˾', '05.jpg', '��½��Ӱ');
insert into goods values(NULL, '����', '�е��͵�սƬ���������ƣ��þ籾���ף��ټ������ҿ����Ĳ��������޵��ŵ��������ͣ�Ѥ�������ɵ�ɫ����Ư����Ŀ����Ӱ���ܰ�������ϸ�ڵĺ���Ա���Լ��ɴ�����������ˮ�ļ�������ÿ��ϸ�ڶ������˹���', 56, 1, '�����ֵܴ�ý����', '01.jpg', '��½��Ӱ');
insert into goods values(NULL, '���ν��5:ʤ���Ķ���', '��ӰΪ����չ�ֳ�����������ˣ�����Ļ��ֱ�ļ��䲻�������ⲿ��Ʒ����ж����뵱Ȼ�ģ�û������û���ݱ䣬����û�к�������ת�ϣ����е���У������������Ҳ�ã������Ȼ���򣬶�ֻ����ͬ����ۻ����һ����������Ϊ���ܸ����ϵ�м�����������Ӱ�ֻ���Ҫ��ͼȥ��չ����������', 56, 1, '������֮��(Hasbro)��˾', '01.jpg', 'ŷ����Ӱ');

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
	userId bigint,
	CONSTRAINT  table_ibfk_0 foreign key (userId) references users(userId),
	orderDate timestamp not null default now(),
	payMode varchar(20) default '��������',
	constraint CKC_DOC_CONTENT_VALPSTN check (payMode is null or (payMode in ('��������','֧��������'))),
	isPayed bit check ( isPayed in (0 ,1)),
	totalPrice float not null
)Engine=InnoDB;

drop table orderDetail;
---sql server
create table orderDetail(
	ordersId bigint constraint fk_order_id references orders(ordersId),	--������(����һ�������ָ��orders��)
	goodsId bigint constraint fk_shangpin_id references goods(goodsId), --��Ʒ��(����һ�������ָ��goods��)
	nums int not null --����
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





