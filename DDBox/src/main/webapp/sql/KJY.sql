--스토어 메인
create table store(
	store_num number not null,
	store_title varchar2(150) not null,
	store_content clob not null,
	store_reg_date date default sysdate not null,
	store_modify_date date,
	store_status number(1) default 0 not null,		--판매상태(0:판매중, 1:판매완료)
	constraint store_pk primary key (store_num),
	constraint store_detail_fk foreign key (store_num) references store_detail (store_num)
);
create sequence store_seq;

create table store_detail(
	store_num number not null,
	item_price number(12) not null,
	item_photo varchar2(200),
	item_name varchar2(150) not null,
	constraint store_detail_pk primary key (store_num)
);

create table item_fav(
	store_num number not null,
	mem_num number not null,
	constraint item_fav_fk1 foreign key (store_num) references store (store_num),
	constraint item_fav_fk2 foreign key (mem_num) references member (mem_num)
);

create table pcart(
	cart_num number not null,
	store_num number not null,
	order_quantity number(5) not null,
	reg_date date default sysdate not null,
	mem_num number not null,
	constraint pcart_pk primary key (cart_num),
	constraint pcart_fk1 foreign key (store_num) references store (store_num),
	constraint pcart_fk2 foreign key (mem_num) references member (mem_num)
);
create sequence pcart_seq;

create table pay(
	pay_id number not null,
	pay_status number(1) not null,		--결제 상태(0:결제진행중, 1:결제완료,2: 결제취소)
	pay_uid varchar2(150) not null,
	item_price number(12) not null,
	mem_num number not null,
	constraint pay_pk primary key (pay_id),
	constraint pay_fk foreign key (mem_num) references member (mem_num)
);
create sequence pay_seq;

create table porder(
	porder_id number not null,
	porder_uid varchar2(150) not null,
	item_name varchar2(150) not null,
	item_price number(12) not null,
	mem_num number not null,
	pay_id number not null,
	constraint porder_pk primary key (porder_id),
	constraint porder_fk1 foreign key (mem_num) references member (mem_num),
	constraint porder_fk2 foreign key (pay_id) references pay (pay_id)
);
create sequence porder_seq;

create table porder_detail(
	porder_id number not null,
	porder_uid varchar2(150) not null,
	item_name varchar2(150) not null,
	item_price number(12) not null,
	mem_num number not null,
	constraint porder_detail_pk primary key (porder_id),
	constraint porder_detail_fk foreign key (mem_num) references member (mem_num)
);
create sequence porder_detail_seq;