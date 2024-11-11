create table tbl_member (
	id varchar(200) primary key,
	pw varchar(200) not null,
	name varchar(200) not null,
	email varchar(200),
	road_addr varchar(1000),
	detail_addr varchar(1000),
	regdate datetime default now()
);



SELECT  * FROM  tbl_member tm;
INSERT INTO tbl_member (id, pw, name) values ('ddasdaddd', '1234', '새똥이');


-- CREATE database post character set utf8mb4 COLLATE utf8mb4_unicode_ci;

-- SELECT default_character_set_name, DEFAULT_COLLATION_NAME 
-- FROM information_schema.SCHEMATA 
-- WHERE schema_name = "[post]";

-- alter database [post] default character set = utf8;

-- tbl_like


-- tbl_post
-- pno,title,writer,content,view_count,updatedate,regdate
-- 대문자는 널값까지사용 
DROP table tbl_member;
drop table tbl_post;

create table tbl_post (
  pno bigint primary key auto_increment 
  , title varchar(1000) not null
  , writer varchar(200) references tbl_member(id)
  , content text not null
  , view_count bigint default 0 
  , regdate datetime default now()
  , updatedate datetime default now()
);

SELECT  * FROM  tbl_post tp;

CREATE table tbl_post_category(
	cno int primary key,
	cname varchar(300) not null,
	regdate datetime default now()
);

INSERT INTO tbl_post_category (cno,cname) values (1,'공지사항');
INSERT INTO tbl_post_category (cno,cname) values (2,'자유게시판');
INSERT INTO tbl_post_category (cno,cname) values (3,'자료실');

ALTER TABLE post.tbl_post ADD cno INT DEFAULT 2 NOT NULL;

ALTER TABLE post.tbl_post ADD CONSTRAINT tbl_post_tbl_post_category_FK FOREIGN KEY (cno) REFERENCES post.tbl_post_category(cno);


select pno ,title,writer,view_count,regdate,cno 
from tbl_post tp2
WHERE  cno =2
and(
	title like CONCAT('%','3 ','%') or
	content like '%3%'
)
order by 1 desc
limit 10 offset 0;

-- 1: 0
-- 2: 10
-- 3: 20


select count(*) as cnt 
from tbl_post 
WHERE  cno =2;


INSERT INTO tbl_post (title,writer,content )
SELECT title,writer,content 
FROM tbl_post;

