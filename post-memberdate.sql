create table tbl_member (
	id varchar(200) primary key,
	pw varchar(200) not null,
	name varchar(200) not null,
	email varchar(200),
	read_addr varchar(1000),
	detail_addr varchar(1000),
	regdate datetime default now()
);
