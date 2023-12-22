show databases;
use test1;

show databases;
use test1;

--test1 데이터베이스 생성
CREATE DATABASE test1;

-- fk값 0으로 변경
set foreign_key_checks=0;

--데이터베이스 삭제
DROP DATABASE IF EXISTS test1;

--테이블 갯수 확인
SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'test1';


--관리자 테이블
DROP TABLE IF EXISTS `kwanri`;

CREATE TABLE `kwanri` (
	`k_id`	varchar(20) PRIMARY KEY	NOT NULL,
	`c_no`	varchar(10)	NOT NULL,
	`u_level`	varchar(10)	NOT NULL,
	`k_pw`	varchar(20)	NOT NULL,
	`k_name`	varchar(10)	NOT NULL,
	`k_sex`	CHAR(1)	NOT NULL	COMMENT 'M:남성 F:여성',
	`k_birth`	varchar(20)	NOT NULL,
	`k_phone`	varchar(20)	NULL,
	`k_postcode`	varchar(10)	NOT NULL,
	`k_addr`	varchar(20)	NOT NULL,
	`k_address`	varchar(30)	NOT NULL,
	`k_email`	varchar(100)	NOT NULL,
	`k_regist`	DATE	NOT NULL	DEFAULT now(),
	`k_retouch`	DATE	NULL	DEFAULT now()
);

INSERT INTO kwanri (k_id, c_no, u_level, k_pw, k_name, k_sex, k_birth, k_phone, k_postcode, k_addr, k_address, k_email, k_regist, k_retouch)
values('totalmanager01', 'GN01', 'G', 'total0123', '강남구', 'F', '19690105', '01012341234', '15741', '서울 강남구 스프링아파트', '101동 101호', 'gntoalmanage@gmail.com', now(), now() );

INSERT INTO kwanri (k_id, c_no, u_level, k_pw, k_name, k_sex, k_birth, k_phone, k_postcode, k_addr, k_address, k_email, k_regist, k_retouch)
values('gnmanager02', 'GN01', 'G', 'gn0213', '문화센', 'M', '19750411', '01023456789', '11111', '서울 강남구 CSS아파트', '201동 201호', 'gnculture@hanmail.com', now(), now() );

INSERT INTO kwanri (k_id, c_no, u_level, k_pw, k_name, k_sex, k_birth, k_phone, k_postcode, k_addr, k_address, k_email, k_regist, k_retouch)
values('gnenrol03', 'NH01', 'G', 'gnenrol0333', '수강신', 'F', '19800821', '01085239632', '11112', '서울 강남구 에미트아파트', '504동 702호', 'gnenro@gmail.com', now(), now() );

select * from kwanri;
-- 회원
DROP TABLE IF EXISTS `user`;

select * from user;

CREATE TABLE `user` (
	`u_id`	varchar(20)  PRIMARY KEY	NOT NULL,
	`u_level`	varchar(10)	NOT NULL,
	`u_pw`	varchar(20)	NOT NULL,
	`u_name`	varchar(10)	NOT NULL,
	`u_sex`	CHAR(1)	NOT NULL	COMMENT 'M:남성 F:여성',
	`u_birth`	varchar(20)	NOT NULL,
	`u_phone`	varchar(20)	NULL,
	`u_postcode`	varchar(10)	NOT NULL,
	`u_addr`	varchar(20)	NOT NULL,
	`u_address`	varchar(30)	NOT NULL,
	`u_email`	varchar(100)	NOT NULL,
	`u_regist`	DATE	NOT NULL	DEFAULT now(),
	`u_retouch`	DATE	NULL	DEFAULT now(),
	`u_cancel`	DATE	NULL	DEFAULT now()
);

insert into user(u_id, u_pw, u_name, u_sex, u_birth, u_phone, u_postcode, u_addr, u_address, u_email, u_regist, u_level)
values('helloworld', 'hw1010', '김자바', 'M', '19970101', '01033334444', '15055', '서울시 강남구 자바아파트', '102동 702호', 'helloworld@gmail.com', '2022.01.01',  'G');
insert into user(u_id, u_pw, u_name, u_sex, u_birth, u_phone, u_postcode, u_addr, u_address, u_email, u_regist, u_level)
values('artisgood',	'at1001',	'이예술',	'F',	'20000901',	'01012122323',	'19820',	'서울시 강남구 리액트아파트',	'109동 802호',	'artisgood@naver.com',	now(),'C');
insert into user(u_id, u_pw, u_name, u_sex, u_birth, u_phone, u_postcode, u_addr, u_address, u_email, u_regist, u_level)
values('angel12',	'alal123',	'박희연',	'F',	'20110617',	'01034344545',	'13702',	'서울시 강남구 강남아파트',	'101동 1980호',	'angel12@daum.com',	'2023.01.01','D');
insert into user(u_id, u_pw, u_name, u_sex, u_birth, u_phone, u_postcode, u_addr, u_address, u_email, u_regist, u_level)
values('dpfkr123', 'fkr112', '최예락', 'M', '20000910', '01078783434', '21678', '서울시 강남구 자이아파트', '109동 298호', 'dpfkr123@gmail.com', '20200101', 'E');
insert into user(u_id, u_pw, u_name, u_sex, u_birth, u_phone, u_postcode, u_addr, u_address, u_email, u_regist, u_level)
values('nara1999',	'na15',	'박나라', 'M', '20100702', '01078563423', '12389',	'서울시 강남구 서초아파트',	'160동 902호',	'nara1999@naver.com', '20230111', 'F');
insert into user(u_id, u_pw, u_name, u_sex, u_birth, u_phone, u_postcode, u_addr, u_address, u_email, u_regist, u_level)
values('youu13',	'yj8989', '김유정', 'F', '19990817', '01056724561', '16842', '서울시 강남구 부자아파트', '270동 682호', 'youu13@naver.com', '20230213', 'C');
insert into user(u_id, u_pw, u_name, u_sex, u_birth, u_phone, u_postcode, u_addr, u_address, u_email, u_regist, u_level)
values('hihi11', 'hello00', '김안녕', 'F',	'20010918',	'01078564534',	'26837',	'서울시 강남구 안녕아파트',	'368동 299호',	'hihi11@naver.com',	'20230219', 'C');
insert into user(u_id, u_pw, u_name, u_sex, u_birth, u_phone, u_postcode, u_addr, u_address, u_email, u_regist, u_level)
values('kim8989',	'kimali0', '김말희', 'F', '19880427', '01057243645', '16782', '서울시 강남구 무슨아파트', '109동 602호', 'kim8989@gmail.com', '20230220', 'C');

INSERT INTO user (u_id, u_pw, u_name, u_sex, u_birth, u_phone, u_postcode, u_addr, u_address, u_email, u_regist, u_level)
values('totalmanager01', 'total0123', '강남구', 'F', '19690105', '01012341234', '15741', '서울 강남구 스프링아파트', '101동 101호', 'gntoalmanage@gmail.com', '20170203', 'A0' );

INSERT INTO user(u_id, u_pw, u_name, u_sex, u_birth, u_phone, u_postcode, u_addr, u_address, u_email, u_regist, u_level)
values('gnmanager02', 'gn0213', '문화센', 'M', '19750411', '01023456789', '11111', '서울 강남구 CSS아파트', '201동 201호', 'gnculture@hanmail.com', '20200113', 'A1' );

INSERT INTO user(u_id, u_pw, u_name, u_sex, u_birth, u_phone, u_postcode, u_addr, u_address, u_email, u_regist, u_level)
values('gnenrol03', 'gnenrol0333', '수강신', 'F', '19800821', '01085239632', '11112', '서울 강남구 에미트아파트', '504동 702호', 'gnenro@gmail.com', '20230601', 'A1' );
select * from user;
-- 수정시 
UPDATE user 
set u_retouch = '2023-10-01'
where u_id = 'helloworld';

UPDATE user 
set u_retouch = '2023-02-14'
where u_id = 'youu13';

-- 실제 코드
UPDATE user 
set u_retouch = now()
where u_id = ? ;

-- 탈퇴시 
UPDATE user 
set u_retouch = '2013-02-01', u_cancel = '2013-02-01', u_level = 'G'
where u_id='nara1999';

-- 실제 코드 
UPDATE user 
set u_retouch = now(), u_cancel = now(), u_level='G'
where u_id= ? ;



-- 회원등급 상세
DROP TABLE IF EXISTS `u_sangse`;

CREATE TABLE `u_sangse` (
	`u_level`	varchar(10)  PRIMARY KEY	NOT NULL,
	`u_levname`	varchar(30)	NOT NULL
);

insert into u_sangse(u_level, u_levname) values('A0', '총괄관리자');
insert into u_sangse(u_level, u_levname) values('A1', '수강관리자');
insert into u_sangse(u_level, u_levname) values('B', '강사');
insert into u_sangse(u_level, u_levname) values('C', '수강회원');
insert into u_sangse(u_level, u_levname) values('D', '블랙리스트회원');
insert into u_sangse(u_level, u_levname) values('E', '탈퇴회원');

select * from u_sangse;
--강사
DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
	`t_id`	varchar(20) PRIMARY KEY	NOT NULL,
	`t_class`	varchar(10)	NOT NULL,
	`u_level`	varchar(10)	NOT NULL,
	`c_no`	varchar(10) NOT NULL,
	`t_pw`	varchar(20)	NOT NULL,
	`t_name`	varchar(10)	NOT NULL,
	`t_sex`	CHAR(1)	NOT NULL	COMMENT 'M:남성 F:여성',
	`t_birth`	varchar(20)	NOT NULL,
	`t_phone`	varchar(20)	NULL,
	`t_postcode`	varchar(10)	NOT NULL,
	`t_addr`	varchar(20)	NOT NULL,
	`t_address`	varchar(30)	NOT NULL,
	`t_email`	varchar(100)	NOT NULL,
	`t_regist`	DATE	NOT NULL	DEFAULT now(),
	`t_retouch`	DATE	NULL	DEFAULT now(),
	`t_career`	varchar(100)	NOT NULL,
	`t_pic`	TEXT	NOT NULL
);

INSERT INTO `teacher` (`t_id`,`t_class`,`u_level`,`t_pw`,`t_name`,`t_sex`,`t_birth`,
                       `t_phone`,`t_postcode`,`t_addr`,`t_address`,`t_email`,`t_regist`,
                       `t_retouch`,`c_no`,`t_career`,`t_pic`
) VALUES ('kim123', 'CUT05','B','korea1111','김민숙','F','19670213','01011112222','12312',
          '서울시 강서구 푸르지오아파트','101동 402호','korea1111@naver.com',now(),NULL,
          'GN01','서울대학교 성악전공','korea.jpg');
          
INSERT INTO `teacher` (`t_id`,`t_class`,`u_level`,`t_pw`,`t_name`,`t_sex`,`t_birth`,
                       `t_phone`,`t_postcode`,`t_addr`,`t_address`,`t_email`,`t_regist`,
                       `t_retouch`,`c_no`,`t_career`,`t_pic`
) VALUES ('jung1010', 'SPT01','B','jungg12312','정철수','M','19781111','01022223333','14242',
          '서울시 관악구 강감찬아파트','123동1009호','jungg123122@gmail.com',now(),NULL,
          'SG01','경희대학교 축구전공','picjung.jpg');
INSERT INTO `teacher` (`t_id`,`t_class`,`u_level`,`t_pw`,`t_name`,`t_sex`,`t_birth`,
                       `t_phone`,`t_postcode`,`t_addr`,`t_address`,`t_email`,`t_regist`,
                       `t_retouch`,`c_no`,`t_career`,`t_pic`
) VALUES ('alal0011', 'SPT03','B','opopop111','김이나','F','19980911','01099991111','78781',
          '서울시 강남구 아이티윌아파트','105동 901호','alal0011@naver.com',now(),NULL,
          'NH01','서울대학교 골프전공','ganksa.jpg');
INSERT INTO `teacher` (`t_id`,`t_class`,`u_level`,`t_pw`,`t_name`,`t_sex`,`t_birth`,
                       `t_phone`,`t_postcode`,`t_addr`,`t_address`,`t_email`,`t_regist`,
                       `t_retouch`,`c_no`,`t_career`,`t_pic`
) VALUES ('park0213', 'CUT02','B','suye0213','박서예','F','19801001','01012345678','45645',
          '서울시 용산구 한남동','301동 101호','park0213@gmail.com',now(),NULL,
          'GN01','홍익대학교 서예전공','suye.png');


select * from teacher;
--강사등급 상세
DROP TABLE IF EXISTS `t_sangse`;

CREATE TABLE `t_sangse` (
	`t_class`	varchar(10) PRIMARY KEY	NOT NULL,
	`t_levname`	varchar(30)	NOT NULL
);

INSERT INTO `t_sangse` (`t_class`, `t_levname`) VALUES ('W01', '웹개발');
INSERT INTO `t_sangse` (`t_class`, `t_levname`) VALUES ('W02', '웹디자인');
INSERT INTO `t_sangse` (`t_class`, `t_levname`) VALUES ('B01', '빅데이터');
INSERT INTO `t_sangse` (`t_class`, `t_levname`) VALUES ('M01', '머신러닝');
INSERT INTO `t_sangse` (`t_class`, `t_levname`) VALUES ('I01', 'AI');
INSERT INTO `t_sangse` (`t_class`, `t_levname`) VALUES ('A01', '앱개발');
INSERT INTO `t_sangse` (`t_class`, `t_levname`) VALUES ('A02', '앱디자인');
INSERT INTO `t_sangse` (`t_class`, `t_levname`) VALUES ('S01', '정보보안');
INSERT INTO `t_sangse` (`t_class`, `t_levname`) VALUES ('C01', '클라우드');

select * from t_sangse;

--센터
DROP TABLE IF EXISTS `Center`;

CREATE TABLE `Center` (
	`c_no`	varchar(10) PRIMARY KEY	NOT NULL,
	`c_name`	varchar(20)	NOT NULL,
	`c_address`	varchar(50)	NOT NULL,
	`c_phone`	varchar(20)	NOT NULL,
	`c_time`	varchar(20)	NOT NULL,
	`c_date`	varchar(20)	NOT NULL,
	`c_contents`	text(10000)	NULL,
	`c_img`	text	NULL,
	`c_images`	text(10000)	NULL
);


select * from center;

INSERT INTO Center(c_no, c_name, c_address, c_phone, c_time, c_date, c_contents, c_img, c_images) 
VALUES('GN01', '강남스포츠문화센터', '서울 강남구 밤고개로1길 52 강남스포츠문화센터', '02-1111-1111', '09:00-18:00', '화~금 (공휴일 제외)', '저희 센터는 수영, 테니스등을 운영하는 스포츠문화센터입니다','GN01.jpg', 'GN02.jpg');

INSERT INTO Center(c_no, c_name, c_address, c_phone, c_time, c_date, c_contents, c_img, c_images) 
VALUES('NH01', '논현1동 문화센터', '서울시 강남구 논현1동', '02-2222-1111', '09:00-18:00', '월~금 (공휴일 제외)', '일어, 요리등등 수강 가능한 문화센터입니다.', 'NH01.jpg', 'GN02.jpg');

INSERT INTO Center(c_no, c_name, c_address, c_phone, c_time, c_date, c_contents, c_img, c_images) 
VALUES('NH02', '논현2동 문화센터', '서울시 강남구 논현2동', '02-2222-1112', '09:00-18:00', '월~금 (공휴일 제외)', '축구등 팀 체육활동이 가능한 체육센터입니다.', 'NH02.jpg', 'NH01.jpg');

INSERT INTO Center(c_no, c_name, c_address, c_phone, c_time, c_date, c_contents, c_img, c_images) 
VALUES('GN02', '강남구민 체육센터', '서울시 강남구 역삼1동', '02-1111-1112', '08:00-21:30', '월~금 (공휴일 제외)', '즐거운 여가생활, 취미생활을 위한 다양한 프로그램을 운영하고 있습니다', 'GN02.jpg', 'GN01.jpg');

INSERT INTO Center(c_no, c_name, c_address, c_phone, c_time, c_date, c_contents, c_img, c_images) 
VALUES('SG01', '세곡1동 스포츠문화센터', '서울시 강남구 세곡1동', '02-3333-4444', '09:00-18:00', '월~금 (공휴일 제외)', '수양과 테라피를 체험할 수 있는 문화센터입니다.', 'SG01.jpg', 'SG02.jpg');


--강의장
DROP TABLE IF EXISTS `facility`;

CREATE TABLE `facility` (
	`f_no`	INT   UNSIGNED  AUTO_INCREMENT PRIMARY KEY	NOT NULL,
	`c_no`	varchar(10)	NOT NULL,
	`f_name`	varchar(20)	NOT NULL,
	`f_start`	varchar(10)	NOT NULL,
	`f_end`	varchar(10)	NOT NULL,
	`f_personnel`	varchar(5)	NULL,
	`f_contents`	text(5000)	NULL
);

INSERT INTO facility(f_no, c_no, f_name, f_start, f_end, f_personnel, f_contents) 
VALUES(1, 'GN01', '대강당1', '06:00', '21:00', '100명', '홀입니다.' );

INSERT INTO facility(f_no, c_no, f_name, f_start, f_end, f_personnel, f_contents) 
VALUES(2, 'GN01','대강당2', '06:00', '21:00', '100명', '대강당입니다.' );

INSERT INTO facility(f_no, c_no, f_name, f_start, f_end, f_personnel, f_contents) 
VALUES(3, 'GN01', '헬스장', '06:00', '22:00', '80명', '헬스장입니다.' );

-- 수강 개설
DROP TABLE IF EXISTS `sugang`;

CREATE TABLE `sugang` (
	`su_no`	INT   UNSIGNED  AUTO_INCREMENT PRIMARY KEY	NOT NULL,
	`f_no`	INT   UNSIGNED	NOT NULL,
	`t_id`	varchar(20)	NOT NULL,
	`su_name`	VARCHAR(30)	NOT NULL,
	`su_intro`	text(6000)	NOT NULL,
	`su_time_start`	VARCHAR(4)	NOT NULL,
	`su_time_end`	VARCHAR(4)	NOT NULL,
	`su_date_start`	VARCHAR(8)	NOT NULL,
	`su_date_end`	VARCHAR(8)	NOT NULL,
	`su_fee`	INT(8)	NOT NULL	DEFAULT 0,
	`su_many`	INT(4)	NOT NULL	DEFAULT 0,
	`su_mo_status`	VARCHAR(10)	NOT NULL	COMMENT '모집전, 모집중, 모집완료',
	`su_mo_start`	VARCHAR(12)	NOT NULL,
	`su_mo_end`	VARCHAR(12)	NOT NULL,
	`su_info`	VARCHAR(20)	NOT NULL,
	`su_status`	VARCHAR(10)	NOT NULL	COMMENT '개강전, 강의중, 강의취소, 수료완료'
);

insert into sugang(f_no, t_id, su_name, su_intro, su_time_start, su_time_end, su_date_start, su_date_end, su_fee, su_many, su_mo_status, su_mo_start, su_mo_end, su_info, su_status)
values(1, 'kim123', '컴활고수반',	'컴퓨터활용능력1급', '1000',	'1130',	 '20230720', '20230920', 30000,	20,	'마감', '20230610','20230715','하단의 신청하기를 눌러주세요', 'KKJ');  
insert into sugang(f_no, t_id, su_name, su_intro, su_time_start, su_time_end, su_date_start, su_date_end, su_fee, su_many, su_mo_status, su_mo_start, su_mo_end, su_info, su_status)
values(1, 	'jung1010',	'축구기초반',	'축구기초반입니다 아침마다 건강한 활동을 도와드립니다',  '0900',  '1200',	'20230801',	'20230911',	10000, 30, '마감', '20230701',  '20230730', '정보를 입력한뒤 신청하세요',   'KKCS');  
INSERT INTO sugang(f_no, t_id, su_name, su_intro, su_time_start, su_time_end, su_date_start, su_date_end, su_fee, su_many, su_mo_status, su_mo_start, su_mo_end, su_info, su_status)
VALUES(1, 'alal0011', '골프체험반', '골프체험하고 싶으신분들을 도와드립니다', '1200', '1400', '20230723', '20230830', 20000, 10, '마감', '20230622', '20230722', '신청기간에 맞게 신청하세요', 'KKJK'); 
insert into sugang(f_no, t_id, su_name, su_intro, su_time_start, su_time_end, su_date_start, su_date_end, su_fee, su_many, su_mo_status, su_mo_start, su_mo_end, su_info, su_status)
values(1, 'park0213',		'서예기초반',	'어린이 대상 서예기초반입니다~', '0900',	 '1100',  '20230810', '20230913', 20000, 15, '마감',   '20230709',	 '20230809', '정보를 입력한뒤 신청하세요',	 'KKJ');  
insert into sugang(f_no, t_id, su_name, su_intro, su_time_start, su_time_end, su_date_start, su_date_end, su_fee, su_many, su_mo_status, su_mo_start, su_mo_end, su_info, su_status)
values(1, 	'jung1010',		'축구기초반',	'축구기초반입니다. 아침마다 건강한 활동을 도와드립니다', '0900',  '1200',	'20230820',	'20230920',	10000, 30, '진행중', '20230719',   '20230819', '정보를 입력한뒤 신청하세요',   'KKJ');



--출결 
DROP TABLE IF EXISTS `attend`;

CREATE TABLE `attend` (
	`a_no`	INT   UNSIGNED  AUTO_INCREMENT PRIMARY KEY	NOT NULL,
	`u_id`	varchar(20)	NOT NULL,
	`su_no`	INT   UNSIGNED	NOT NULL,
	`a_gtime`	TIME	NULL,
	`a_otime`	TIME	NULL,
	`a_date`	DATE	NULL,
	`a_state`	CHAR(1)	NULL	COMMENT '0: 출석, 1: 결석, 2: 지각, 3: 조퇴'
);


insert into attend(u_id, su_no, a_gtime, a_otime, a_date, a_state)
values('helloworld', 1, CURTIME(), CURTIME(), NOW(), 0 );

insert into attend(u_id, su_no, a_gtime, a_otime, a_date, a_state)
values('artisgood', 2, CURTIME(), CURTIME(), NOW(), 1 );

insert into attend(u_id, su_no, a_gtime, a_otime, a_date, a_state)
values('helloworld', 3, CURTIME(), CURTIME(), NOW(), 2 );

insert into attend(u_id, su_no, a_gtime, a_otime, a_date, a_state)
values('kim8989', 4, CURTIME(), CURTIME(), NOW(), 3 );

insert into attend(u_id, su_no, a_gtime, a_otime, a_date, a_state)
values('angel12', 5, CURTIME(), CURTIME(), NOW(), 0 );


--수강신청 장바구니
DROP TABLE IF EXISTS `su_cart`;

CREATE TABLE `su_cart` (
	`sin_code`	INT   UNSIGNED  AUTO_INCREMENT PRIMARY KEY	NOT NULL,
	`su_no`	INT  UNSIGNED	NOT NULL,
	`u_id`	VARCHAR(10)	NOT NULL,
	`sin_regdate`	DATE	NOT NULL	DEFAULT now(),
	`sin_status`	VARCHAR(5)	NOT NULL	COMMENT 'Y:완료,N: 완료x, I: 서류확인중'
);

insert into su_cart(su_no, u_id, sin_regdate, sin_status)
values (10, 'helloworld', now(), 'I');
insert into su_cart(  su_no, u_id, sin_regdate, sin_status)
values (11, 'kim8989', now(), 'y');
insert into su_cart(  su_no, u_id, sin_regdate, sin_status)
values (12, 'artisgood', now(), 'N');
insert into su_cart(  su_no, u_id, sin_regdate, sin_status)
values (13, 'angel12', now(), 'Y');
insert into su_cart(  su_no, u_id, sin_regdate, sin_status)
values (14, 'hihi11', now(), 'Y');


--수업자료
DROP TABLE IF EXISTS `matrial`;

CREATE TABLE `matrial` (
	`m_no`	INT   UNSIGNED  AUTO_INCREMENT PRIMARY KEY	NOT NULL,
	`su_no`	INT  UNSIGNED	NOT NULL,
	`m_title`	VARCHAR(50)	NOT NULL,
	`m_content`	TEXT(1000)	NOT NULL,
	`m_date`	DATE	NOT NULL	DEFAULT now(),
	`m_file`	text(60000)	NULL
);

insert into matrial(su_no, m_title, m_content, m_date, m_file)
values('1', '성악과제입니다.', 'pdf를 확인해주세요',  NOW(), 'project.pdf' );

insert into matrial(su_no, m_title, m_content, m_date, m_file)
values('2', '축구활동 사진공유.', '오늘 활동사진입니다.',  NOW(), 'pic.png' );

insert into matrial(su_no, m_title, m_content, m_date, m_file)
values('3', '골프자세 사진공유', '올바른 골프자세를 익히세요',  NOW(), 'pic1.png' );



--결제
DROP TABLE IF EXISTS `su_pay`;

CREATE TABLE `su_pay` (
	`p_no`	VARCHAR(30)  PRIMARY KEY	NOT NULL,
	`sin_code`	INT  UNSIGNED	NOT NULL,
	`p_method`	VARCHAR(10)	NOT NULL	COMMENT '0: 신용카드, 1: 무통장입금',
	`p_regdate`	DATE	NOT NULL	DEFAULT now(),
	`p_total`	INT(10)	NOT NULL	DEFAULT 0
);


INSERT INTO su_pay(p_no, sin_code, p_method, p_regdate, p_total) 
VALUES('20230910-132628', '1', '무통장입금', now(), 50000);
INSERT INTO su_pay(p_no, sin_code, p_method, p_regdate, p_total) 
VALUES('20230819-185612', '2', '신용카드', now(), 70000);
INSERT INTO su_pay(p_no, sin_code, p_method, p_regdate, p_total) 
VALUES('20230819-185612-1', '3', '무통장입금', now(), 40000);
INSERT INTO su_pay(p_no, sin_code, p_method, p_regdate, p_total) 
VALUES('20230819-185613', '4', '무통장입금', now(), 20000);
INSERT INTO su_pay(p_no, sin_code, p_method, p_regdate, p_total) 
VALUES('20230819-185614', '5', '신용카드', now(), 10000);

--환불
DROP TABLE IF EXISTS `refund`;

CREATE TABLE `refund` (
	`r_no`	INT   UNSIGNED  AUTO_INCREMENT PRIMARY KEY	NOT NULL,
	`p_no`	VARCHAR(30)	NOT NULL,
	`r_method`	VARCHAR(20)	NOT NULL	COMMENT '0: 신용카드, 1:무통장입금',
	`r_reason`	VARCHAR(20)	NOT NULL,
	`r_amount`	INT	NOT NULL	DEFAULT 0,
	`r_status`	VARCHAR(20)	NOT NULL	COMMENT '0: 환불신청, 1:환불중, 2: 환불완료'
);


INSERT INTO refund(r_no, p_no, r_method, r_reason, r_amount, r_status) 
VALUES('1', '20230910-132628', '통장입금', '가격', 50000, 'R');

INSERT INTO refund(r_no, p_no, r_method, r_reason, r_amount, r_status) 
VALUES('2', '20230819-185614', '신용카드결제취소', '변심', 10000, 'I');

--결제 상세내역
DROP TABLE IF EXISTS `su_pay_detail`;

CREATE TABLE `su_pay_detail` (
	`p_no`	VARCHAR(30)	NOT NULL,
	`su_fee`	INT	NOT NULL	DEFAULT 0
);


INSERT INTO su_pay_detail(p_no, su_fee) 
VALUES('20230910-132628',  30000);
INSERT INTO su_pay_detail(p_no, su_fee) 
VALUES('20230910-132628',  20000);
INSERT INTO su_pay_detail(p_no,  su_fee) 
VALUES('20230819-185612', 30000);
INSERT INTO su_pay_detail(p_no, su_fee) 
VALUES('20230819-185612', 30000);
INSERT INTO su_pay_detail(p_no, su_fee) 
VALUES('20230819-185612', 20000);
INSERT INTO su_pay_detail(p_no, su_fee) 
VALUES('20230819-185612-1',  30000);
INSERT INTO su_pay_detail(p_no, su_fee) 
VALUES('20230819-185612-1', 20000);
INSERT INTO su_pay_detail(p_no, su_fee) 
VALUES('20230819-185613', 10000);
INSERT INTO su_pay_detail(p_no, su_fee) 
VALUES('20230819-185613', 10000);
INSERT INTO su_pay_detail(p_no, su_fee) 
VALUES('20230819-185614', 10000);

--객관식 답안지
DROP TABLE IF EXISTS `m_answer`;

CREATE TABLE `m_answer` (
	`u_id`	varchar(20)	NOT NULL,
	`q_no`	INT  UNSIGNED	NOT NULL,
	`ma_answer`	CHAR(1)	NULL
);

INSERT INTO m_answer(u_id, q_no, ma_answer) 
VALUES('helloworld', '1', '1');

INSERT INTO m_answer(u_id, q_no, ma_answer) 
VALUES('kim8989', '1', '2');

INSERT INTO m_answer(u_id, q_no, ma_answer) 
VALUES('helloworld', '2', '2');

INSERT INTO m_answer(u_id, q_no, ma_answer) 
VALUES('helloworld', '3', '4');

INSERT INTO m_answer(u_id, q_no, ma_answer) 
VALUES('helloworld', '4', '4');

--문제 등록
DROP TABLE IF EXISTS `q_register`;

CREATE TABLE `q_register` (
	`q_no`	INT   UNSIGNED  AUTO_INCREMENT PRIMARY KEY	NOT NULL,
	`t_class`	varchar(10)	NOT NULL,
	`q_question`	TEXT(500)	NOT NULL,
	`q_image`	TEXT(60000)	NULL,
	`q_answer`	CHAR(1)	NOT NULL	DEFAULT '-'	COMMENT '- : 주관식',
	`q_type`	CHAR(1)	NOT NULL	COMMENT '4: 사지선다 2: ox퀴즈 0: 주관식'
);


INSERT INTO q_register(q_no, t_class, q_question, q_image, q_answer, q_type) 
VALUES(1, 'W01', '다음 중 컴퓨터 및 정보기기에서 사용하는 펌웨어(Firmware)에 관한 설명으로 옳은 것은?', '', '1',  '4');

INSERT INTO q_register(q_no, t_class, q_question, q_image, q_answer, q_type) 
VALUES(2, 'W01', '다음 중 수의 표현에 있어 진법에 대한 설명으로 옳지 않은 것은?', '', '2', '2');

INSERT INTO q_register(q_no, t_class, q_question, q_image, q_answer, q_type) 
VALUES(3, 'W01', '다음 중 정보 보안을 위한 비밀키 암호화 기법의 설명으로 옳지 않은 것은?', '', '4', '4');

INSERT INTO q_register(q_no, t_class, q_question, q_image, q_answer,q_type) 
VALUES(4, 'W01', '다음 중 시스템 보안을 위해 사용하는 방화벽(Firewall)에 대한 설명으로 적절하지 않은 것은?', '../exam/4.png', '3', '4');

INSERT INTO q_register(q_no, t_class, q_question, q_image, q_answer, q_type) 
VALUES(11, 'W01', '권한을 취소하는 명령어는?', '', '-',  '0');

--선택지 등록
DROP TABLE IF EXISTS `s_register`;

CREATE TABLE `s_register` (
	`sr_no`	INT   UNSIGNED  AUTO_INCREMENT PRIMARY KEY	NOT NULL,
	`q_no`	INT  UNSIGNED	NOT NULL,
	`sr_content`	VARCHAR(200)	NULL	COMMENT '적어도 둘 중하나는 NOT NULL',
	`sr_image`	TEXT(60000)	NULL	COMMENT '적어도 둘 중하나는 NOT NULL'
);

INSERT INTO s_register(sr_no, q_no, sr_content, sr_image) 
VALUES(1, 1, '주로 하드디스크의 부트 레코드 부분에 저장된다', '');

INSERT INTO s_register(sr_no, q_no, sr_content, sr_image) 
VALUES(2, 1, '인터프리터 방식으로 번역되어 실행된다.', '');

INSERT INTO s_register(sr_no, q_no, sr_content, sr_image) 
VALUES(3, 1, '운영체제의 일부로 입출력을 전담한다.', '');

INSERT INTO s_register(sr_no, q_no, sr_content, sr_image) 
VALUES(4, 1, '소프트웨어의 업그레이드만으로도 기능을 향상시킬 수있다.', '');

INSERT INTO s_register(sr_no, q_no, sr_content, sr_image) 
VALUES(5, 2, '16진수(Hexadecimal)는 0∼9까지의 숫자와 A∼F까지 문자로 표현하는 진법으로 한 자리수를 표현하는데 4개의 비트가 필요하다.', '');

INSERT INTO s_register(sr_no, q_no, sr_content, sr_image) 
VALUES(6, 2, '2진수, 8진수, 16진수를 10진수 실수(float)로 변환하려면 정수 부분과 소수 부분을 나누어서 변환하려는 각 진수의 자리값과 자리의 지수승을 곱한 결과값을 모두 더하여 계산한다.', '');

--주관식 답안지
DROP TABLE IF EXISTS `s_answer`;

CREATE TABLE `s_answer` (
	`u_id`	varchar(20)	NOT NULL,
	`q_no`	INT  UNSIGNED	NOT NULL,
	`sa_nswer`	VARCHAR(100)	NULL,
	`t_score`	INT	NOT NULL	DEFAULT 0
);

INSERT INTO s_answer(u_id, q_no, sa_nswer, t_score) 
VALUES('kim8989', '6', 'Revoke', '3');

INSERT INTO s_answer(u_id, q_no, sa_nswer, t_score) 
VALUES('helloworld', '6', 'COMMIT', '2');

--공지사항
DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
	`n_no`	INT   UNSIGNED  AUTO_INCREMENT PRIMARY KEY	NOT NULL,
	`c_no`	varchar(10)	NOT NULL,
	`n_cno`	varchar(20)	NOT NULL,
	`n_subject`	varchar(30)	NOT NULL,
	`n_content`	text(10000)	NOT NULL,
	`n_date`	date	NOT NULL	DEFAULT now(),
	`u_id`	varchar(20)	NOT NULL,
	`n_readcnt`	int	NOT NULL	DEFAULT 0,
	`n_file`	text(60000)	NULL,
	`n_notice`	char(1)	NOT NULL	COMMENT 'Y, N'
);

select * from notice;

INSERT INTO notice(c_no, n_cno, n_subject, n_content, n_date, u_id, n_readcnt, n_file, n_notice) 
VALUES('GN01', 'notice', '구립체육시설 운영시간 안내사항', '구립체육시설 운영시간 안내사항', now(), 'totalmanager01', 0, 'GN01CHALL01.jpg', 'Y');

INSERT INTO notice(c_no, n_cno, n_subject, n_content, n_date, u_id, n_readcnt, n_file, n_notice) 
VALUES('NH01', 'notice', '논현1동 문화센터 노년층 인터넷 이용 수업 시간표', '논현1동 문화센터 노년층 인터넷 이용 수업 시간표', now(), 'gnmanager02', 10, 'notifile02.jpg', 'Y');

INSERT INTO notice(c_no, n_cno, n_subject, n_content, n_date, u_id, n_readcnt, n_file, n_notice) 
VALUES('NH02', 'notice', '논현2동 문화센터 대관 장소 및 시설 안내', '논현2동 문화센터 대관 장소 및 시설 안내', now(), 'gnenrol03', 5, 'notifile02.jpg', 'N');

INSERT INTO notice(c_no, n_cno, n_subject, n_content, n_date, u_id, n_readcnt, n_file, n_notice) 
VALUES('SG01', 'notice_CLASS101', '2024년도 체육시설 대관 접수 안내', '2024년도 체육시설 대관 접수 안내', now(), 'totalmanager01', 0, 'notifile04.jpg', 'N');

INSERT INTO notice(c_no, n_cno, n_subject, n_content, n_date, u_id, n_readcnt, n_file, n_notice) 
VALUES('NH01', 'notice_CLASS102', '논현 1동 평생 학습관 휴무일 안내', '논현 1동 평생 학습관 휴무일 안내', now(), 'gnmanager02', 15, 'notifile05.jpg', 'Y');

INSERT INTO notice(c_no, n_cno, n_subject, n_content, n_date, u_id, n_readcnt, n_file, n_notice) 
VALUES('NH02', 'notice_CLASS103', '구립체육시설 운영시간 안내(2/19 ~ 별도 안내)', '구립체육시설 운영시간 안내(2/19 ~ 별도 안내)', now(), 'gnenrol03', 22, 'notifile06.jpg', 'Y');


--수강생 작품
DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
	`s_no`	INT   UNSIGNED  AUTO_INCREMENT PRIMARY KEY	NOT NULL,
	`u_id`	varchar(20)	NOT NULL,
	`s_subject`	varchar(30)	NOT NULL,
	`s_content`	text(10000)	NOT NULL,
	`s_readcnt`	int	NULL	DEFAULT 0,
	`s_push`	int	NULL	DEFAULT 0,
	`s_date`	date	NOT NULL	DEFAULT now(),
	`s_file`	text(60000)	NULL
);

INSERT INTO student(u_id, s_subject, s_content, s_readcnt, s_push, s_date, s_file) 
VALUES('helloworld', '자바강좌 문의', '자바 강좌는 안여시나요?', 0, 0, now(), '-');

INSERT INTO student(u_id, s_subject, s_content, s_readcnt, s_push, s_date, s_file) 
VALUES('artisgood', '저는 예술강좌 하고싶은데', '하실분 없나요?', 1, 2, now(), 'art.png');

INSERT INTO student(u_id, s_subject, s_content, s_readcnt, s_push, s_date, s_file) 
VALUES('angel12', '질문', '내일 강좌 쉬나요?', 14, 8, now(), '-');

--댓글
DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
	`cm_no`	INT   UNSIGNED  AUTO_INCREMENT PRIMARY KEY	NOT NULL,
	`id`	varchar(20)	NOT NULL,
	`i_no`	INT  UNSIGNED	NOT NULL	COMMENT '부모글 번호',
	`cm_subject`	varchar(30)	NOT NULL,
	`cm_date`	date	NOT NULL	DEFAULT now(),
	`cm_content`	text(10000)	NOT NULL
);

INSERT INTO comment(i_no, id, cm_subject, cm_content, cm_date) 
VALUES('1', 'totalmanager01', '자바강좌 문의', '추후에 열겠습니다.', now() );

INSERT INTO comment(i_no, id, cm_subject, cm_content, cm_date) 
VALUES('2', 'totalmanager01', '예술관련강좌', '생각중입니다.', now() );

INSERT INTO comment(i_no, id, cm_subject, cm_content, cm_date) 
VALUES('3', 'totalmanager01', '내일 강좌 쉬나요?', '안쉽니다.', now() );

INSERT INTO comment(i_no, id, cm_subject, cm_content, cm_date) 
VALUES('4', 'totalmanager01', '나이제한 문의', '없어요', now() );

--문의사항
DROP TABLE IF EXISTS `inquiry`;

CREATE TABLE `inquiry` (
	`i_no`	INT   UNSIGNED  AUTO_INCREMENT PRIMARY KEY	NOT NULL,
	`u_id`	varchar(20)	NOT NULL,
	`i_cno`	varchar(20)	NOT NULL,
	`i_subject`	varchar(30)	NOT NULL,
	`i_content`	text(60000)	NOT NULL,
	`i_date`	date	NOT NULL	DEFAULT now()
);

INSERT INTO inquiry(u_id, i_cno, i_subject, i_content, i_date) 
VALUES('helloworld', 'qna', '자바강좌 문의', '자바 강좌는 안여시나요?', now() );

INSERT INTO inquiry(u_id, i_cno, i_subject, i_content, i_date) 
VALUES('artisgood', 'qna_CLASS102', '예술관련강좌', '더 많이 열어주세요', now() );

INSERT INTO inquiry(u_id, i_cno, i_subject, i_content, i_date) 
VALUES('angel12', 'qna_CLASS103', '나이제한 문의', '나이제한 범위 확대해주세요', now() );


--시험지
DROP TABLE IF EXISTS `example`;

CREATE TABLE `example` (
	`e_no`	INT   UNSIGNED  AUTO_INCREMENT PRIMARY KEY	NOT NULL,
	`q_no`	INT  UNSIGNED	NOT NULL,
	`e_name`	VARCHAR(100)	NOT NULL
);

INSERT INTO example(e_no, q_no, e_name) 
VALUES(1, 5, '20231214-kim123');

INSERT INTO example(e_no, q_no, e_name) 
VALUES(2, 3, '20231214-kim123');

INSERT INTO example(e_no, q_no, e_name) 
VALUES(3, 7, '20231214-kim123');

INSERT INTO example(e_no, q_no, e_name) 
VALUES(4, 11, '20231214-kim123');

INSERT INTO example(e_no, q_no, e_name) 
VALUES(5, 23, '20231214-kim123');

--점수
DROP TABLE IF EXISTS `points`;

CREATE TABLE `points` (
	`p_no`	INT   UNSIGNED  AUTO_INCREMENT PRIMARY KEY	NOT NULL,
	`e_no`	INT  UNSIGNED	NOT NULL,
	`u_id`	varchar(20)	NOT NULL,
	`p_date`	date	NOT NULL	DEFAULT now(),
	`point`	int	NOT NULL	DEFAULT 0
);

INSERT INTO points(p_no, e_no, u_id, p_date, point) 
VALUES(1, 1, 'helloworld', NOW(), 60);

INSERT INTO points(p_no, e_no, u_id, p_date, point) 
VALUES(2, 7, 'kim8989', NOW(), 30);

INSERT INTO points(p_no, e_no, u_id, p_date, point) 
VALUES(3, 8, 'youu13', NOW(), 50);

INSERT INTO points(p_no, e_no, u_id, p_date, point) 
VALUES(4, 10, 'hihi11', NOW(), 80);

INSERT INTO points(p_no, e_no, u_id, p_date, point) 
VALUES(5, 5, 'angel12', NOW(), 95);


ALTER TABLE `facility` ADD CONSTRAINT `FK_Center_TO_facility_1` FOREIGN KEY (
	`c_no`
)
REFERENCES `Center` (
	`c_no`
);

ALTER TABLE `user` ADD CONSTRAINT `FK_u_sangse_TO_user_1` FOREIGN KEY (
	`u_level`
)
REFERENCES `u_sangse` (
	`u_level`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_user_TO_comment_1` FOREIGN KEY (
	`id`
)
REFERENCES `user` (
	`u_id`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_inquiry_TO_comment_1` FOREIGN KEY (
	`i_no`
)
REFERENCES `inquiry` (
	`i_no`
);

ALTER TABLE `notice` ADD CONSTRAINT `FK_Center_TO_notice_1` FOREIGN KEY (
	`c_no`
)
REFERENCES `Center` (
	`c_no`
);

ALTER TABLE `attend` ADD CONSTRAINT `FK_user_TO_attend_1` FOREIGN KEY (
	`u_id`
)
REFERENCES `user` (
	`u_id`
);

ALTER TABLE `attend` ADD CONSTRAINT `FK_sugang_TO_attend_1` FOREIGN KEY (
	`su_no`
)
REFERENCES `sugang` (
	`su_no`
);

ALTER TABLE `sugang` ADD CONSTRAINT `FK_facility_TO_sugang_1` FOREIGN KEY (
	`f_no`
)
REFERENCES `facility` (
	`f_no`
);

ALTER TABLE `sugang` ADD CONSTRAINT `FK_teacher_TO_sugang_1` FOREIGN KEY (
	`t_id`
)
REFERENCES `teacher` (
	`t_id`
);

ALTER TABLE `q_register` ADD CONSTRAINT `FK_t_sangse_TO_q_register_1` FOREIGN KEY (
	`t_class`
)
REFERENCES `t_sangse` (
	`t_class`
);

ALTER TABLE `s_register` ADD CONSTRAINT `FK_q_register_TO_s_register_1` FOREIGN KEY (
	`q_no`
)
REFERENCES `q_register` (
	`q_no`
);

ALTER TABLE `kwanri` ADD CONSTRAINT `FK_Center_TO_kwanri_1` FOREIGN KEY (
	`c_no`
)
REFERENCES `Center` (
	`c_no`
);

ALTER TABLE `kwanri` ADD CONSTRAINT `FK_u_sangse_TO_kwanri_1` FOREIGN KEY (
	`u_level`
)
REFERENCES `u_sangse` (
	`u_level`
);

ALTER TABLE `m_answer` ADD CONSTRAINT `FK_user_TO_m_answer_1` FOREIGN KEY (
	`u_id`
)
REFERENCES `user` (
	`u_id`
);

ALTER TABLE `m_answer` ADD CONSTRAINT `FK_q_register_TO_m_answer_1` FOREIGN KEY (
	`q_no`
)
REFERENCES `q_register` (
	`q_no`
);

ALTER TABLE `s_answer` ADD CONSTRAINT `FK_user_TO_s_answer_1` FOREIGN KEY (
	`u_id`
)
REFERENCES `user` (
	`u_id`
);

ALTER TABLE `s_answer` ADD CONSTRAINT `FK_q_register_TO_s_answer_1` FOREIGN KEY (
	`q_no`
)
REFERENCES `q_register` (
	`q_no`
);

ALTER TABLE `teacher` ADD CONSTRAINT `FK_t_sangse_TO_teacher_1` FOREIGN KEY (
	`t_class`
)
REFERENCES `t_sangse` (
	`t_class`
);

ALTER TABLE `teacher` ADD CONSTRAINT `FK_u_sangse_TO_teacher_1` FOREIGN KEY (
	`u_level`
)
REFERENCES `u_sangse` (
	`u_level`
);

ALTER TABLE `teacher` ADD CONSTRAINT `FK_Center_TO_teacher_1` FOREIGN KEY (
	`c_no`
)
REFERENCES `Center` (
	`c_no`
);

ALTER TABLE `matrial` ADD CONSTRAINT `FK_sugang_TO_matrial_1` FOREIGN KEY (
	`su_no`
)
REFERENCES `sugang` (
	`su_no`
);

ALTER TABLE `su_cart` ADD CONSTRAINT `FK_sugang_TO_su_cart_1` FOREIGN KEY (
	`su_no`
)
REFERENCES `sugang` (
	`su_no`
);

ALTER TABLE `su_cart` ADD CONSTRAINT `FK_user_TO_su_cart_1` FOREIGN KEY (
	`u_id`
)
REFERENCES `user` (
	`u_id`
);

ALTER TABLE `su_pay` ADD CONSTRAINT `FK_su_cart_TO_su_pay_1` FOREIGN KEY (
	`sin_code`
)
REFERENCES `su_cart` (
	`sin_code`
);

ALTER TABLE `su_pay_detail` ADD CONSTRAINT `FK_su_pay_TO_su_pay_detail_1` FOREIGN KEY (
	`p_no`
)
REFERENCES `su_pay` (
	`p_no`
);

ALTER TABLE `refund` ADD CONSTRAINT `FK_su_pay_TO_refund_1` FOREIGN KEY (
	`p_no`
)
REFERENCES `su_pay` (
	`p_no`
);

ALTER TABLE `student` ADD CONSTRAINT `FK_user_TO_student_1` FOREIGN KEY (
	`u_id`
)
REFERENCES `user` (
	`u_id`
);

ALTER TABLE `inquiry` ADD CONSTRAINT `FK_user_TO_inquiry_1` FOREIGN KEY (
	`u_id`
)
REFERENCES `user` (
	`u_id`
);

ALTER TABLE `example` ADD CONSTRAINT `FK_q_register_TO_example_1` FOREIGN KEY (
	`q_no`
)
REFERENCES `q_register` (
	`q_no`
);

ALTER TABLE `points` ADD CONSTRAINT `FK_example_TO_points_1` FOREIGN KEY (
	`e_no`
)
REFERENCES `example` (
	`e_no`
);

ALTER TABLE `points` ADD CONSTRAINT `FK_user_TO_points_1` FOREIGN KEY (
	`u_id`
)
REFERENCES `user` (
	`u_id`
);

create table admin (
    tname varchar(30) primary key,
    numPerPage int default 5,
    pagePerBlock int default 5
);

insert into admin (tname)
values("noticelist");

select * from admin;
select * from inquiry;
select numPerPage, pagePerBlock
from admin
where tname = 'userlist';

select u_id, u_name
from user
where u_id like '%a%' or u_name like '%a%'
order by u_name desc;

select COUNT(*)
from user
where u_id like '%a%' or u_name like '%a%'
order by u_name desc;


SELECT I.i_no, I.i_subject, U.u_name, I.i_date
FROM inquiry I
JOIN user U
ON I.u_id = U.u_id;

SELECT N.n_no, N.n_subject, N.n_content, U.u_id, U.u_level, N.n_readcnt, N.n_date
FROM notice N
JOIN user U
ON N.u_id = U.u_id;



show databases;
use test1;
