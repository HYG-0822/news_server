-- news 스키마 생성
create database news;

-- news 스키마 사용하도록 선언
use news;

-- category, source, article 테이블 생성
-- category 테이블 : id(자동 증가), name(문자열), memo(문자열), created_at, updated_at
CREATE TABLE category (
  id bigint not null AUTO_INCREMENT primary key,
  `name` varchar(30) not null unique,
  `memo` varchar(500),
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP on update current_timestamp
);

drop table if exists `source`;

CREATE TABLE `source` (
id bigint not null AUTO_INCREMENT primary key,
`sid` varchar(100),
`name` varchar(100) unique,
`description` varchar(500),
`url` varchar(500),
`category` varchar(45),
`language` varchar(45),
`country` varchar(45),
`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP on update current_timestamp
);

-- 데이터가 없어서 테이블을 삭제할수 없는 경우
-- alter table `source`
-- add constraint uq_source_name unique(`name`); -- name 컬럼에 unique 속성 추가

drop table if exists article;

select * from category;

CREATE TABLE article (
id bigint not null auto_increment primary key,
`source_id` bigint not null,
`category_id` bigint not null,
`author` varchar(150),
`title` varchar(500),
`description` text,
`url` varchar(500) unique,
`url_to_image` varchar(500),
`published_at` varchar(100),
`content` text,
`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP on update current_timestamp
);

-- alter table : table의 속성을 수정, 보안하는 명령
alter table article
add constraint foreign key(`source_id`) references `source`(id);

alter table article
add constraint foreign key(`category_id`) references `category`(id);

show create table article;

-- 테이블 이름 변경
-- alter table 테이블명 rename to 테이블명;

show tables;

select *
from source
where name like '%York%';

select * from `source`;
select * from category;
select * from article;

-- 입력 insert into
-- insert into 테이블명(컬럼명1, 컬럼명2 ... ) values(데이터1, 데이터2 ...)[(데이터1, 데이터2 ... ];
insert into `category`(`name`, `memo`) values
('business', '경제뉴스'),
('entertainment', '연예뉴스'),
('sports', '스포츠'),
('health', '생활/건강'),
('technology', '기술'),
('science', '기초과학'),
('general', '뉴스일반');

-- 조회 selsect
/*
select 컬럼명1, 컬럼명2, ... [*(모든 컬럼)]
from 테이블명
[where 조건절] -- 필터링
[join 조인조건] -- 다른 테이블과 조인하여 데이터를 조회
[group by 그룹 조건] -- 컬럼별 통계 조회시
[order by 컬럼명, 컬럼명2 ... [desc]] -- 컬렴별 정렬하기
*/

select `name`, `memo`
from `category`
where `name` like '%en%'; -- name 필드에 'en'이라는 글자가 포함된 row(행, 레코드)를 필터링한다

-- 삭제
-- delete from
delete from `category`
where `name`='general';

-- 수정
/*
update `테이블명` set 컬럼명 = '변경할 값'
where 조건절;
*/
-- category 테이블에서 name컬럼의 값이 science인 행의 memo 컬럼의 값을 '과학'으로 수정함
update `category`
set `memo` = '과학'
where `name` = 'science';

-- desc 테이블명 : 해당 테이블에 대한 정보를 보여준다
desc `source`;