-- 회원 테이블 생성
CREATE TABLE 회원 (
c_ID INTEGER NOT NULL,
c_name VARCHAR(50) NOT NULL,
c_email VARCHAR(50) NOT NULL,
c_phone VARCHAR(50),
c_birth DATE,
PRIMARY KEY (c_ID)
);


-- 자전거대여소 테이블 생성
CREATE TABLE 자전거대여소 (
rs_ID INTEGER NOT NULL,
rs_latitude DECIMAL(9, 6) NOT NULL,
rs_longitude DECIMAL(9, 6) NOT NULL,
rs_name VARCHAR(50),
rs_address VARCHAR(50),
rs_bi_number INTEGER,
PRIMARY KEY (rs_ID)
);
-- 공급회사 테이블 생성
CREATE TABLE 공급회사 (
sc_ID INTEGER NOT NULL,
sc_name VARCHAR(50),
sc_phone VARCHAR(50),
sc_email VARCHAR(50),
sc_address VARCHAR(50),
PRIMARY KEY (sc_ID)
);


-- 자전거 테이블 생성
CREATE TABLE 자전거 (
bi_ID INTEGER NOT NULL,
bi_model VARCHAR(50),
bi_manufacturer VARCHAR(50),
bi_manufacturer_year DATE,
bi_availability VARCHAR(50),
sc_ID INTEGER,
PRIMARY KEY (bi_ID),
FOREIGN KEY (sc_ID) REFERENCES 공급회사 (sc_ID)
);

-- 대여 테이블 생성
CREATE TABLE 대여 (
r_ID INTEGER NOT NULL,
r_start_time DATETIME,
r_end_time DATETIME,
c_ID INTEGER,
bi_ID INTEGER,
rs_ID INTEGER,
PRIMARY KEY (r_ID),
FOREIGN KEY (c_ID) REFERENCES 회원 (c_ID),
FOREIGN KEY (bi_ID) REFERENCES 자전거 (bi_ID),
FOREIGN KEY (rs_ID) REFERENCES 자전거대여소 (rs_ID)
);

-- 결제 테이블 생성
CREATE TABLE 결제  (
p_ID INTEGER NOT NULL,
p_method VARCHAR(50),
p_amount INTEGER,
p_time DATETIME,
r_ID INTEGER,
PRIMARY KEY(p_ID),
FOREIGN KEY (r_ID) REFERENCES 대여 (r_ID)
);

-- 반납 테이블 생성
CREATE TABLE 반납 (
re_ID INTEGER NOT NULL,
re_time DATETIME,
ad_fee INTEGER,
r_ID INTEGER,
PRIMARY KEY(re_ID),
FOREIGN KEY (r_ID) REFERENCES 대여 (r_ID)
);

-- 고장신고 테이블 생성
CREATE TABLE 고장신고 (
fa_ID INTEGER NOT NULL,
fa_content VARCHAR(500),
fa_date DATETIME,
c_ID INTEGER,
bi_ID INTEGER,
PRIMARY KEY(fa_ID),
FOREIGN KEY (c_ID) REFERENCES 회원 (c_ID),
FOREIGN KEY (bi_ID) REFERENCES 자전거 (bi_ID)
);

-- 정비이력 테이블 생성
CREATE TABLE 정비이력 (
ma_ID INTEGER NOT NULL,
ma_cotent VARCHAR(500),
ma_data DATE,
bi_ID INTEGER,
sc_ID INTEGER,
PRIMARY KEY(ma_ID),
FOREIGN KEY (bi_ID) REFERENCES 자전거 (bi_ID),
FOREIGN KEY (sc_ID) REFERENCES 공급회사 (sc_ID)
);

-- GPS 테이블 생성
CREATE TABLE GPS (
g_ID INTEGER NOT NULL,
g_latitude DECIMAL(9, 6),
g_longitude DECIMAL(9, 6),
g_recording_time DATETIME,
bi_ID INTEGER,
PRIMARY KEY(g_ID),
FOREIGN KEY (bi_ID) REFERENCES 자전거 (bi_ID)
);


-- 회원 테이블 데이터 입력
INSERT INTO 회원 VALUES (1, '김미나', 'qpqp@scnu.ac.kr', '010-3465-9870', '000618');
INSERT INTO 회원 VALUES (2, '정민규', 'abab@scnu.ac.kr', '010-8191-1654', '011223');
INSERT INTO 회원 VALUES (3, '박사랑', 'cece@scnu.ac.kr', '010-2318-7798', '020708');
INSERT INTO 회원 VALUES (4, '조하나', 'dvdv@scnu.ac.kr', '010-2558-0350', '030301');
INSERT INTO 회원 VALUES (5, '서태민', 'qoweu12@scnu.ac.kr', '010-2347-9632', '040914');
INSERT INTO 회원 VALUES (6, '이민호', 'abkkk@scnu.ac.kr', '010-2249-8812', '000101');
INSERT INTO 회원 VALUES (7, '안서영', 'dkssud@scnu.ac.kr', '010-7300-6745', '020828');
INSERT INTO 회원 VALUES (8, '김지우', 'rksk1@scnu.ac.kr', '010-7834-4235', '930405');
INSERT INTO 회원 VALUES (9, '이민준', 'ejfj2@scnu.ac.kr', '010-5451-2377', '010708');
INSERT INTO 회원 VALUES (10, '박서연', 'akqk12@scnu.ac.kr', '010-6485-5317', '021029');
INSERT INTO 회원 VALUES (11, '최한결', 'tkdk4@scnu.ac.kr', '010-9967-8410', '030625');
INSERT INTO 회원 VALUES (12, '윤서준', 'wkck12@scnu.ac.kr', '010-0245-8130', '930717');
INSERT INTO 회원 VALUES (13, '정지훈', 'azkxk@scnu.ac.kr', '010-3669-5236', '980818');
INSERT INTO 회원 VALUES (14, '강다현', 'dvkkh@scnu.ac.kr', '010-7548-1391', '020102');
INSERT INTO 회원 VALUES (15, '한승우', 'rysyad@scnu.ac.kr', '010-3461-9476', '000222');
INSERT INTO 회원 VALUES (16, '오예준', 'eyfh@scnu.ac.kr', '010-0809-4512', '010624');
INSERT INTO 회원 VALUES (17, '신유진', 'aptpw@scnu.ac.kr', '010-3364-1084', '021214');
INSERT INTO 회원 VALUES (18, '임도윤', 'dpfjzh@scnu.ac.kr', '010-6549-5170', '031108');
INSERT INTO 회원 VALUES (19, '장민서', 'zhekrwl12@scnu.ac.kr', '010-0170-8465', '990320');
INSERT INTO 회원 VALUES (20, '유하윤', 'djfrnf@scnu.ac.kr', '010-2366-9705', '980402');
INSERT INTO 회원 VALUES (21, '문지원', 'jiwon@scnu.ac.kr', '010-37202-413', '030225');
INSERT INTO 회원 VALUES (22, '손채원', 'rlacodnjs@scnu.ac.kr', '010-8845-0320', '050728');
INSERT INTO 회원 VALUES (23, '배준혁', 'gkak@scnu.ac.kr', '010-7946-1817', '010906');
INSERT INTO 회원 VALUES (24, '양은서', 'cdjffnrakf@scnu.ac.kr', '010-1895-4103', '000715');
INSERT INTO 회원 VALUES (25, '허수현', 'dzhrlfl@scnu.ac.kr', '010-1304-8895', '030806');
INSERT INTO 회원 VALUES (26, '고은수', 'tkqkgk@scnu.ac.kr', '010-6697-0456', '040110');
INSERT INTO 회원 VALUES (27, '남현우', 'skssjtlfg@scnu.ac.kr', '010-7510-4328', '960102');
INSERT INTO 회원 VALUES (28, '진서영', 'dkdkdjdj@scnu.ac.kr', '010-9680-3431', '030626');
INSERT INTO 회원 VALUES (29, '안기문', 'dksrlah@scnu.ac.kr', '010-1234-4321', '030108');
INSERT INTO 회원 VALUES (30, '하준서', 'dlrpanjdi@scnu.ac.kr', '010-0191-2307', '020128');
INSERT INTO 회원 VALUES (31, '마우스', 'wnlfmf@scnu.ac.kr', '010-0513-1036', '010609');

-- 자전거대여소 테이블 데이터 입력
INSERT INTO 자전거대여소 VALUES (1, '37.569706', '126.976585', '따릉이 광화문역', '서울특별시 광화문역 6번출구', '3');
INSERT INTO 자전거대여소 VALUES (2, '36.348488', '127.382858', '타슈 오페라웨딩홀', '대전광역시 둔산초등학교 버스 정류장', '2');
INSERT INTO 자전거대여소 VALUES (3, '34.760694', '127.663137', '여수랑 여수시청', '전라남도 여수시 시청로1', '7');
INSERT INTO 자전거대여소 VALUES (4, '35.149686', '126.915959', '타랑께 금남로', '광주광역시 동구 금남로3가 20-2', '4');
INSERT INTO 자전거대여소 VALUES (5, '34.968359', '127.479343', '온누리자전거 순천대', '전라남도 순천시 중앙로 222', '5');
INSERT INTO 자전거대여소 VALUES (6, '35.811611', '127.157133', '꽃싱이 한옥마을(향교)', '전라북도 전주시 완산구 전주천동로 30-1', '22');

-- 공급회사 테이블 데이터 입력
INSERT INTO 공급회사 VALUES (1, '튼튼 자전거 공급회사', '010-3598-6001', 'xmsxms@scnu.ac.kr', '서울특별시 중구 세종대로 110');
INSERT INTO 공급회사 VALUES (2, '강한 자전거 공급회사', '010-4849-5337', 'rkdgks@scnu.ac.kr', '전라북도 전주시 완산구 노송광장로 10');
INSERT INTO 공급회사 VALUES (3, '자연 자전거 공급회사', '010-0906-5110', 'wkduss@scnu.ac.kr', '광주광역시 서구 상무대로 1147-16');
INSERT INTO 공급회사 VALUES (4, '이름 자전거 공급회사', '010-7884-0624', 'dlfmad@scnu.ac.kr', '부산광역시 연제구 중앙대로 1001');
INSERT INTO 공급회사 VALUES (5, '막 자전거 공급회사', '010-6249-6064', 'akrar@scnu.ac.kr', '강원특별자치도 강릉시 강릉대로 33');
INSERT INTO 공급회사 VALUES (6, '생활 자전거 공급회사', '010-9687-1714', 'todghkfwk@scnu.ac.kr', '서울 용산구 한강대로23길 55');

-- 자전거 테이블 데이터 입력
INSERT INTO 자전거 VALUES (1, '튼튼자전거', '튼튼', '2019-04-07', '가능', '1');
INSERT INTO 자전거 VALUES (2, '강한자전거', '강한', '2020-08-20', '가능', '2');
INSERT INTO 자전거 VALUES (3, '짱짱자전거', '튼튼', '2021-03-14', '가능', '1');
INSERT INTO 자전거 VALUES (4, '스트롱자전거', '강한', '2018-05-24', '가능', '2');
INSERT INTO 자전거 VALUES (5, '안태자전거', '이름', '2019-05-06', '가능', '4');
INSERT INTO 자전거 VALUES (6, '송정자전거', '이름', '2020-01-19', '가능', '4');
INSERT INTO 자전거 VALUES (7, '헬스자전거', '튼튼', '2017-03-17', '가능', '1');
INSERT INTO 자전거 VALUES (8, '영영자전거', '이름', '2018-06-12', '가능', '4');
INSERT INTO 자전거 VALUES (9, '스마트자전거', '생활', '2020-05-08', '가능', '6');
INSERT INTO 자전거 VALUES (10, '운동자전거', '강한', '2021-04-22', '가능', '6');
INSERT INTO 자전거 VALUES (11, '콜라자전거', '막', '2021-08-14', '가능', '5');
INSERT INTO 자전거 VALUES (12, '바다자전거', '자연', '2018-08-29', '가능', '3');
INSERT INTO 자전거 VALUES (13, '산자전거', '자연', '2021-06-23', '가능', '3');
INSERT INTO 자전거 VALUES (14, '이송자전거', '이름', '2019-04-18', '가능', '4');
INSERT INTO 자전거 VALUES (15, '강철자전거', '튼튼', '2020-08-04', '가능', '1');
INSERT INTO 자전거 VALUES (16, '안이자전거', '이름', '2021-03-09', '가능', '4');
INSERT INTO 자전거 VALUES (17, '소라자전거', '자연', '2020-08-11', '가능', '3');
INSERT INTO 자전거 VALUES (18, '푸른자전거', '막', '2021-03-23', '가능', '5');
INSERT INTO 자전거 VALUES (19, '초록자전거', '막', '2018-05-04', '가능', '5');
INSERT INTO 자전거 VALUES (20, '세모자전거', '막', '2021-03-07', '가능', '5');
INSERT INTO 자전거 VALUES (21, '장송자전거', '이름', '2020-11-21', '가능', '4');
INSERT INTO 자전거 VALUES (22, '세모자전거', '막', '2020-12-26', '가능', '5');
INSERT INTO 자전거 VALUES (23, '네모자전거', '막', '2019-08-29', '가능', '5');
INSERT INTO 자전거 VALUES (24, '장주자전거', '이름', '2018-05-12', '가능', '4');
INSERT INTO 자전거 VALUES (25, '이커자전거', '이름', '2017-09-10', '가능', '4');
INSERT INTO 자전거 VALUES (26, '연필자전거', '생활', '2021-03-31', '가능', '6');
INSERT INTO 자전거 VALUES (27, '워치자전거', '생활', '2018-07-15', '가능', '6');
INSERT INTO 자전거 VALUES (28, '놀이자전거', '막', '2020-07-27', '가능', '5');
INSERT INTO 자전거 VALUES (29, '이오자전거','막' , '2019-12-08', '가능', '5');
INSERT INTO 자전거 VALUES (30, '노트자전거', '생활', '2019-011-11', '가능', '6');


-- 대여 테이블 데이터 입력
INSERT INTO 대여 VALUES (1, '2024-06-02 12:01', '2024-06-02 14:01', '2', '1', '1');
INSERT INTO 대여 VALUES (2, '2024-05-16 14:21', '2024-05-16 17:21', '7', '3', '3');
INSERT INTO 대여 VALUES (3, '2024-05-24 18:30', '2024-05-24 21:30', '4', '2', '4');
INSERT INTO 대여 VALUES (4, '2024-02-11 10:48', '2024-02-11 11:48', '1', '4', '2');
INSERT INTO 대여 VALUES (5, '2024-03-01 19:12', '2024-03-01 21:12', '5', '7', '6');
INSERT INTO 대여 VALUES (6, '2024-04-25 11:57', '2024-04-25 12:57', '3', '11', '5');
INSERT INTO 대여 VALUES (7, '2024-01-29 09:16', '2024-01-29 13:16', '6', '21', '2');
INSERT INTO 대여 VALUES (8, '2023-08-15 12:00', '2024-06-04 13:00', '30', '6', '2');
INSERT INTO 대여 VALUES (9, '2024-04-17 15:18', '2024-04-17 17:18', '21', '25', '3');
INSERT INTO 대여 VALUES (10, '2023-08-24 14:27', '2023-08-24 17:27', '29', '15', '4');
INSERT INTO 대여 VALUES (11, '2024-01-21 18:12', '2024-01-21 19:12', '28', '29', '6');
INSERT INTO 대여 VALUES (12, '2023-10-02 16:35', '2024-10-02 17:35', '17', '19', '1');
INSERT INTO 대여 VALUES (13, '2023-11-25 17:54', '2024-11-25 19:54', '13', '20', '1');
INSERT INTO 대여 VALUES (14, '2023-12-22 07:41', '2023-12-22 09:41', '16', '10', '3');
INSERT INTO 대여 VALUES (15, '2023-10-29 20:16', '2023-10-29 21:16', '12', '9', '5');
INSERT INTO 대여 VALUES (16, '2023-12-01 15:21', '2023-12-01 20:21', '8', '5', '3');
INSERT INTO 대여 VALUES (17, '2023-09-08 12:32', '2024-09-08 14:32', '10', '8', '3');
INSERT INTO 대여 VALUES (18, '2023-08-21 20:23', '2023-08-21 21:23', '14', '12', '4');
INSERT INTO 대여 VALUES (19, '2023-09-30 19:12', '2023-09-30 20:12', '9', '14', '6');
INSERT INTO 대여 VALUES (20, '2024-06-07 11:53', '2024-06-07 12:53', '15', '22', '6');
INSERT INTO 대여 VALUES (21, '2023-11-29 17:36', '2023-11-29 19:36', '24', '27', '2');
INSERT INTO 대여 VALUES (22, '2024-06-06 15:04', '2024-06-06 18:04', '26', '30', '1');
INSERT INTO 대여 VALUES (23, '2024-01-05 14:40', '2024-01-05 16:40', '18', '28', '3');
INSERT INTO 대여 VALUES (24, '2023-07-30 15:30', '2023-07-30 16:30', '22', '16', '1');
INSERT INTO 대여 VALUES (25, '2024-02-12 07:38', '2024-02-12 10:38', '19', '17', '5');
INSERT INTO 대여 VALUES (26, '2024-03-01 19:12', '2024-03-01 21:12', '25', '23', '6');
INSERT INTO 대여 VALUES (27, '2024-04-25 13:03', '2024-04-25 14:03', '11', '26', '5');
INSERT INTO 대여 VALUES (28, '2023-10-11 09:21', '2023-10-11 10:21', '20', '24', '3');
INSERT INTO 대여 VALUES (29, '2024-03-17 13:59', '2024-03-17 18:59', '23', '13', '3');
INSERT INTO 대여 VALUES (30, '2023-08-20 10:11', '2023-08-20 11:11', '27', '18', '2');

-- 결제 테이블 데이터 입력
INSERT INTO 결제 VALUES (1, '모바일 결제 서비스', '2000', '2024-06-02 12:01', '1');
INSERT INTO 결제 VALUES (2, '모바일 결제 서비스', '3000', '2024-05-16 14:21', '2');
INSERT INTO 결제 VALUES (3, '모바일 결제 서비스', '3000', '2024-05-24 18:30', '3');
INSERT INTO 결제 VALUES (4, '모바일 결제 서비스', '1000', '2024-02-11 10:48', '4');
INSERT INTO 결제 VALUES (5, '모바일 결제 서비스', '2000', '2024-03-01 19:12', '5');
INSERT INTO 결제 VALUES (6, '모바일 결제 서비스', '1000', '2024-04-25 11:57', '6');
INSERT INTO 결제 VALUES (7, '모바일 결제 서비스', '4000', '2024-01-29 09:16', '7');
INSERT INTO 결제 VALUES (8, '모바일 결제 서비스', '1000', '2023-08-15 12:00', '8');
INSERT INTO 결제 VALUES (9, '모바일 결제 서비스', '2000', '2024-04-17 15:18', '9');
INSERT INTO 결제 VALUES (10, '모바일 결제 서비스', '3000', '2023-08-24 14:27', '10');
INSERT INTO 결제 VALUES (11, '모바일 결제 서비스', '1000', '2024-01-21 18:12', '11');
INSERT INTO 결제 VALUES (12, '모바일 결제 서비스', '1000', '2023-10-02 16:35', '12');
INSERT INTO 결제 VALUES (13, '모바일 결제 서비스', '2000', '2023-11-25 17:54', '13');
INSERT INTO 결제 VALUES (14, '모바일 결제 서비스', '2000', '2023-12-22 07:41', '14');
INSERT INTO 결제 VALUES (15, '모바일 결제 서비스', '1000', '2023-10-29 20:16', '15');
INSERT INTO 결제 VALUES (16, '모바일 결제 서비스', '5000', '2023-12-01 15:21', '16');
INSERT INTO 결제 VALUES (17, '모바일 결제 서비스', '2000', '2023-09-08 12:32', '17');
INSERT INTO 결제 VALUES (18, '모바일 결제 서비스', '1000', '2023-08-21 20:23', '18');
INSERT INTO 결제 VALUES (19, '모바일 결제 서비스', '1000', '2023-09-30 19:12', '19');
INSERT INTO 결제 VALUES (20, '모바일 결제 서비스', '1000', '2024-06-07 11:53', '20');
INSERT INTO 결제 VALUES (21, '모바일 결제 서비스', '2000', '2023-11-29 17:36', '21');
INSERT INTO 결제 VALUES (22, '모바일 결제 서비스', '3000', '2024-06-06 15:04', '22');
INSERT INTO 결제 VALUES (23, '모바일 결제 서비스', '2000', '2024-01-05 14:40', '23');
INSERT INTO 결제 VALUES (24, '모바일 결제 서비스', '3000', '2023-07-30 15:30', '24');
INSERT INTO 결제 VALUES (25, '모바일 결제 서비스', '3000', '2024-02-12 07:38', '25');
INSERT INTO 결제 VALUES (26, '모바일 결제 서비스', '2000', '2024-03-01 19:12', '26');
INSERT INTO 결제 VALUES (27, '모바일 결제 서비스', '1000', '2024-04-25 13:03', '27');
INSERT INTO 결제 VALUES (28, '모바일 결제 서비스', '1000', '2023-10-11 09:21', '28');
INSERT INTO 결제 VALUES (29, '모바일 결제 서비스', '5000', '2024-04-25 11:57', '29');
INSERT INTO 결제 VALUES (30, '모바일 결제 서비스', '1000', '2023-08-20 10:11', '30');

-- 반납 테이블 데이터 입력
INSERT INTO 반납 VALUES (1, '2024-06-02 14:31', '500', '1');
INSERT INTO 반납 VALUES (2, '2024-05-16 16:24', '0', '2');
INSERT INTO 반납 VALUES (3, '2024-05-24 21:11', '0', '3');
INSERT INTO 반납 VALUES (4, '2024-02-11 12:48', '1000', '4');
INSERT INTO 반납 VALUES (5, '2024-03-01 19:54', '0', '5');
INSERT INTO 반납 VALUES (6, '2024-04-25 13:27', '500', '6');
INSERT INTO 반납 VALUES (7, '2024-01-29 12:52', '0', '7');
INSERT INTO 반납 VALUES (8, '2024-06-04 14:31', '500', '8');
INSERT INTO 반납 VALUES (9, '2024-04-17 16:30', '0', '9');
INSERT INTO 반납 VALUES (10, '2023-08-24 17:12', '0', '10');
INSERT INTO 반납 VALUES (11, '2024-01-11 21:12', '2000', '11');
INSERT INTO 반납 VALUES (12, '2024-10-02 17:34', '0', '12');
INSERT INTO 반납 VALUES (13, '2024-11-25 20:54', '1000', '13');
INSERT INTO 반납 VALUES (14, '2023-12-22 10:12', '500', '14');
INSERT INTO 반납 VALUES (15, '2023-10-29 21:01', '0', '15');
INSERT INTO 반납 VALUES (16, '2023-12-01 20:19', '0', '16');
INSERT INTO 반납 VALUES (17, '2023-09-08 17:32', '3000', '17');
INSERT INTO 반납 VALUES (18, '2023-08-21 22:23', '1000', '18');
INSERT INTO 반납 VALUES (19, '2023-09-30 19:54', '0', '19');
INSERT INTO 반납 VALUES (20, '2024-06-07 11:21', '0', '20');
INSERT INTO 반납 VALUES (21, '2023-11-29 21:36', '2000', '21');
INSERT INTO 반납 VALUES (22, '2024-06-06 18:34', '500', '22');
INSERT INTO 반납 VALUES (23, '2024-01-05 17:10', '500', '23');
INSERT INTO 반납 VALUES (24, '2023-07-30 16:17', '0', '24');
INSERT INTO 반납 VALUES (25, '2024-02-12 11:38', '1000', '25');
INSERT INTO 반납 VALUES (26, '2024-03-01 22:12', '1000', '26');
INSERT INTO 반납 VALUES (27, '2024-04-25 14:33', '500', '27');
INSERT INTO 반납 VALUES (28, '2023-10-11 10:10', '0', '28');
INSERT INTO 반납 VALUES (29, '2024-03-17 18:14', '0', '29');
INSERT INTO 반납 VALUES (30, '2023-08-20 11:08', '0', '30');

 
-- 고장신고 테이블 데이터 입력
INSERT INTO 고장신고 VALUES (1, '브레이크 한 쪽 작동 고장','2024-06-02 13:34', '2', '1');
INSERT INTO 고장신고 VALUES (2, '타이어 바퀴에 조그만한 구멍 발견','2024-05-16 16:30', '5', '2');
INSERT INTO 고장신고 VALUES (3, '체인이 풀림','2024-02-11 12:00', '1', '4');
INSERT INTO 고장신고 VALUES (4, '휠이 비틀어져 진동이나 소음 발생','2024-01-15 18:07', '30', '10');
INSERT INTO 고장신고 VALUES (5, '허브가 마모되거나 손상되어 휠 회전이 부드럽지 않음','2024-03-21 12:03', '16', '9');
INSERT INTO 고장신고 VALUES (6, '페달이 헐거워지거나 손상됨','2024-04-20 12:30', '7', '8');
INSERT INTO 고장신고 VALUES (7, '크랭크셋이 헐거워짐','2024-04-07 10:28', '8', '12');
INSERT INTO 고장신고 VALUES (8, '프레임에 금이 가거나 균열이 발생','2024-05-11 08:03', '12', '13');
INSERT INTO 고장신고 VALUES (9, '안장이 헐거워지거나 손상됨','2024-04-16 18:01', '17', '21');
INSERT INTO 고장신고 VALUES (10, '핸들바가 느슨해짐','2024-01-05 15:38', '21', '26');
INSERT INTO 고장신고 VALUES (11, '스포크가 끊어짐','2024-02-20 16:30', '24', '29');
INSERT INTO 고장신고 VALUES (12, '기어 카세트가 닳아 기어 변속이 어려움','2024-03-09 14:59', '25', '30');
INSERT INTO 고장신고 VALUES (13, '헤드셋이 헐거워짐','2024-02-01 09:10', '10', '7');
INSERT INTO 고장신고 VALUES (14, '체인링이 닳아 체인이 맞지 않음','2024-02-06 18:40', '9', '11');
INSERT INTO 고장신고 VALUES (15, '바텀 브래킷이 헐거워지거나 손상됨','2024-03-02 14:31', '4', '28');
INSERT INTO 고장신고 VALUES (16, '디레일러가 정렬되지 않아 기어 변속이 어려움','2024-06-01 13:53', '22', '14');
INSERT INTO 고장신고 VALUES (17, '휠 베어링이 닳아 회전이 부드럽지 않음','2024-04-03 12:21', '3', '15');
INSERT INTO 고장신고 VALUES (18, '타이어가 닳아 접지력이 떨어짐','2024-02-25 10:48', '6', '3');
INSERT INTO 고장신고 VALUES (19, '리어 디레일러 행거가 손상됨','2024-05-04 11:08', '11', '17');
INSERT INTO 고장신고 VALUES (20, '체인 텐션이 맞지 않아 체인이 자주 벗어짐','2024-03-22 15:41', '14', '23');
INSERT INTO 고장신고 VALUES (21, '체인 결합','2024-05-31 11:12', '29', '27');
INSERT INTO 고장신고 VALUES (22, '시트 포스트가 헐거워짐','2024-05-15 10:07', '28', '25');
INSERT INTO 고장신고 VALUES (23, '림이 손상되어 타이어가 제대로 장착되지 않음','2024-05-27 16:57', '20', '19');
INSERT INTO 고장신고 VALUES (24, '펌프가 작동하지 않아 타이어 공기압 조절이 어려움','2024-03-22 14:36', '15', '16');
INSERT INTO 고장신고 VALUES (25, '플라이휠이 손상되거나 마모됨','2023-12-10 13:26', '19', '20');
INSERT INTO 고장신고 VALUES (26, '뒷 브레이크가 제대로 작동하지 않음','2023-11-21 18:50', '23', '5');
INSERT INTO 고장신고 VALUES (27, '디스크 브레이크가 닳거나 손상됨','2023-12-17 17:49', '27', '6');
INSERT INTO 고장신고 VALUES (28, '반사경, 라이트 등의 안전 장치가 손상됨','2023-10-17 16:42', '18', '22');
INSERT INTO 고장신고 VALUES (29, '체인이 기어에서 벗어남','2023-10-20 15:08', '26', '18');
INSERT INTO 고장신고 VALUES (30, '체인 결합','2023-12-01 09:07', '13', '24');

-- 정비이력 테이블 데이터 입력
INSERT INTO 정비이력 VALUES (1, '브레이크 한 쪽 작동 고장 고침','2024-06-02', '2', '1');
INSERT INTO 정비이력 VALUES (2, '타이어 교체','2024-05-16', '5', '2');
INSERT INTO 정비이력 VALUES (3, '체인 교체','2024-02-11', '1', '4');
INSERT INTO 정비이력 VALUES (4, '휠이 비틀어져 진동이나 소음 문제 해결','2024-01-17', '1', '1');
INSERT INTO 정비이력 VALUES (5, '허브 교체, 휠 교체','2024-03-23', '2', '2');
INSERT INTO 정비이력 VALUES (6, '페달 교체','2024-04-12', '4', '2');
INSERT INTO 정비이력 VALUES (7, '크랭크셋 교체','2024-04-08', '1', '1');
INSERT INTO 정비이력 VALUES (8, '프레임 교체','2024-05-01', '2', '2');
INSERT INTO 정비이력 VALUES (9, '안장 교체','2024-04-20', '4', '2');
INSERT INTO 정비이력 VALUES (10, '핸들바 교체','2024-01-08', '1', '1');
INSERT INTO 정비이력 VALUES (11, '스포크 교체','2024-02-21', '2', '2');
INSERT INTO 정비이력 VALUES (12, '기어 카세트 교체','2024-03-02', '4', '2');
INSERT INTO 정비이력 VALUES (13, '헤드셋 교체','2024-01-30', '1', '1');
INSERT INTO 정비이력 VALUES (14, '체인 교체','2024-02-10', '2', '2');
INSERT INTO 정비이력 VALUES (15, '바텀 브래킷 교체','2024-03-05', '4', '2');
INSERT INTO 정비이력 VALUES (16, '디레일러 정렬','2024-06-05', '1', '1');
INSERT INTO 정비이력 VALUES (17, '휠 베어링 교체','2024-04-15', '2', '2');
INSERT INTO 정비이력 VALUES (18, '타이어가 교체','2024-02-25', '4', '2');
INSERT INTO 정비이력 VALUES (19, '리어 디레일러 행거 교체','2024-05-05', '1', '1');
INSERT INTO 정비이력 VALUES (20, '체인 텐션 교체','2024-03-24', '2', '2');
INSERT INTO 정비이력 VALUES (21, '체인 교체','2024-06-03', '4', '2');
INSERT INTO 정비이력 VALUES (22, '시트 포스트 교체','2024-05-17', '1', '1');
INSERT INTO 정비이력 VALUES (23, '림 교체','2024-05-29', '2', '2');
INSERT INTO 정비이력 VALUES (24, '펌프 교체','2024-03-30', '4', '2');
INSERT INTO 정비이력 VALUES (25, '플라이휠 교체','2023-12-13', '1', '1');
INSERT INTO 정비이력 VALUES (26, '뒷 브레이크 교체','2023-11-23', '2', '2');
INSERT INTO 정비이력 VALUES (27, '디스크 브레이크 교체','2023-12-24', '4', '2');
INSERT INTO 정비이력 VALUES (28, '반사경, 라이트 교체','2023-10-27', '1', '1');
INSERT INTO 정비이력 VALUES (29, '체인 교체','2023-10-30', '2', '2');
INSERT INTO 정비이력 VALUES (30, '체인 교체','2023-12-02', '4', '2');


-- GPS 테이블 데이터 입력
INSERT INTO GPS VALUES (1, '37.555963', '126.972349', '2024-06-02 12:10', '1');
INSERT INTO GPS VALUES (2, '34.749316','127.678586', '2024-05-16 14:37', '3');
INSERT INTO GPS VALUES (3, '35.817380','127.142842', '2024-05-24 19:23', '2');
INSERT INTO GPS VALUES (4, '36.340341','127.390296','2024-02-11 10:55', '4'); 
INSERT INTO GPS VALUES (5, '35.849657','127.161639','2024-04-25 12:17', '7');
INSERT INTO GPS VALUES (6, '34.883390','127.511723','2024-04-25 12:05', '11');
INSERT INTO GPS VALUES (7, '36.370657','127.384821','2024-02-01 20:20', '21');
INSERT INTO GPS VALUES (8, '36.366480', '127.381322', '2024-01-11 18:27', '6');
INSERT INTO GPS VALUES (9, '34.749316','127.678586', '2024-05-16 14:37', '25');
INSERT INTO GPS VALUES (10, '35.165798','126.878631', '2023-08-24 16:59', '15');
INSERT INTO GPS VALUES (11, '35.851528','127.129334','2024-01-21 18:46', '29'); 
INSERT INTO GPS VALUES (12, '36.370657','127.384821','2023-10-02 12:32', '19');
INSERT INTO GPS VALUES (13, '36.366480','127.381322','2023-11-25 18:01', '20');
INSERT INTO GPS VALUES (14, '34.760492','127.662376','2023-12-22 08:00', '10');
INSERT INTO GPS VALUES (15, '34.954133', '127.311110', '2023-10-29 20:21', '9');
INSERT INTO GPS VALUES (16, '34.742931','127.760446', '2023-12-01 18:07', '5');
INSERT INTO GPS VALUES (17, '34.739467','127.746978', '2023-09-08 13:11', '8');
INSERT INTO GPS VALUES (18, '35.146601','126.919932','2023-08-21 20:46', '12'); 
INSERT INTO GPS VALUES (19, '35.814251','127.150621','2023-09-30 19:30', '14');
INSERT INTO GPS VALUES (20, '35.815912','127.152652','2024-06-07 11:10', '22');
INSERT INTO GPS VALUES (21, '36.374897','127.396959','2023-11-29 18:01', '27');
INSERT INTO GPS VALUES (22, '36.374897', '127.396959', '2024-06-06 16:07', '30');
INSERT INTO GPS VALUES (23, '34.617299','127.759315', '2024-01-08 16:12', '28');
INSERT INTO GPS VALUES (24, '36.301917','127.386621', '2023-07-30 15:42', '16');
INSERT INTO GPS VALUES (25, '34.972831','127.421223','2024-02-12 08:08', '17'); 
INSERT INTO GPS VALUES (26, '35.806512','127.148394','2024-03-01 20:40', '23');
INSERT INTO GPS VALUES (27, '34.976048','127.491649','2024-04-25 13:33', '26');
INSERT INTO GPS VALUES (28, '34.739882','127.727868','2023-10-11 09:57', '24');
INSERT INTO GPS VALUES (29, '34.739304','127.734953','2024-03-17 16:41', '13');
INSERT INTO GPS VALUES (30 , '35.137439','126.791349','2023-08-20 10:41', '18');

 -- 모든 회원의 정보를 검색하라
SELECT * FROM 회원;
-- 모든 자전거 대여소의 정보를 검색하라
SELECT * FROM 자전거대여소;
-- 모든 공급회사의 정보를 검색하라
SELECT * FROM 공급회사;
-- 모든 자전거의 정보를 검색하라
SELECT * FROM 자전거;
-- 모든 대여의 정보를 검색하라
SELECT * FROM 대여;
-- 모든 결제의 정보를 검색하라
SELECT * FROM 결제;
-- 모든 반납의 정보를 검색하라
SELECT * FROM 반납;
-- 모든 고장신고의 정보를 검색하라
SELECT * FROM 고장신고;
-- 모든 정비이력의 정보를 검색하라
SELECT * FROM 정비이력;
-- 모든 GPS의 정보를 검색하라
SELECT * FROM GPS;

-- 자전거 테이블에 있는 모든 제조회사를 검색하라
SELECT bi_manufacturer
FROM 자전거;

-- 자전거 테이블에 있는 모든 제조회사 중복없이 검색하라
SELECT DISTINCT bi_manufacturer
FROM 자전거;

-- 결제 테이블에서 초과요금이 1000원 이하인 대여 ID를 검색하시오
SELECT r_ID
FROM 결제
WHERE p_amount <= 1000;

-- 결제 테이블에서 초과요금이 0원 이상 1000원 이하인 대여 ID를 검색하시오
SELECT r_ID
FROM 결제
WHERE p_amount BETWEEN 0 AND 1000;

-- 결제 테이블에서 초과요금이 0원 이상 1000원 이하인 대여 ID를 검색하시오
SELECT r_ID
FROM 결제
WHERE p_amount >= 0 AND p_amount <= 1000;

-- 제조회사가 '튼튼' 혹은 '막'인 자전거의 모든 정보를 검색하시오
SELECT *
FROM 자전거
WHERE bi_manufacturer IN ('튼튼', '막');

-- 제조 회사가 '튼튼' 혹은 '막'인 자전거의 정보를 검색하시오
SELECT *
FROM 자전거
WHERE bi_manufacturer = '튼튼' OR bi_manufacturer = '막';

-- 회원 테이블에서 회원 이름의 성이 '정'인 사람을 검색하라
SELECT *
FROM 회원
WHERE c_name LIKE '정%';

-- 회원 테이블에서 회원 이름의 성이 정인 사람을 검색하라
SELECT *
FROM 회원
WHERE c_name LIKE '[^정이박]%';

-- 대여 일자가 왼쪽에서 세 번째, 네 번째 위치에 '2','4'라는 문자열은 갖는 자전거를 검색하시오
SELECT *
FROM 대여
WHERE r_start_time LIKE '__24%';

-- 자전거 제조회사에 '튼'으로 시작하고 공급회사 번호가 5인 자전거를 검색하시오
SELECT *
FROM 회원
WHERE c_name LIKE '정%' AND c_ID <= 15;

-- 회원 이름을 이름순으로 검색하시오
SELECT *
FROM 회원
ORDER BY c_name;

-- 결제 금액을 내림차순으로 검색하시오. 만약 금액이 같다면 결제 금액 ID를 내림차순으로 검색하시오
SELECT *
FROM 결제
ORDER BY p_amount DESC, p_ID DESC;

-- 고객별로 고장신고한 횟수를 검색하시오
SELECT c_ID, COUNT(*) AS 신고
FROM 회원
GROUP BY c_ID;

-- 회원과 고장신고에 관한 데이터를 모두 검색하라
SELECT *
FROM 회원 INNER JOIN 고장신고
ON 회원.c_ID = 고장신고.c_ID;

-- 회원의 이름과 회원이 대여한 대여소 명을 검색하라
SELECT 회원.c_name, 자전거대여소.rs_name
FROM 회원 INNER JOIN 대여
On 회원.c_ID = 대여.c_ID 
INNER JOIN 자전거대여소
ON 대여.rs_ID = 자전거대여소.rs_ID;

-- 대여를 한 적이 있는 고객의 이름과 이메일을 검색하시오
SELECT 회원.c_name, 회원.c_email
FROM 회원 LEFT OUTER JOIN 대여
ON 회원.c_ID = 대여.c_ID;

-- 대여를 한 번이라도 했으면 결제 금액과 결제 시간을 구하시오
SELECT 결제.p_amount, 결제.p_method
FROM 결제 RIGHT OUTER JOIN 대여
ON 대여.r_ID = 결제.r_ID;

-- 자전거 테이블에서 안태자전거와 제조회사가 같은 모든 자전거를 검색하라
SELECT *
FROM 자전거
WHERE bi_manufacturer = (SELECT bi_manufacturer
						 FROM 자전거
						 WHERE bi_model = '안태자전거');

-- 회원 번호가 4번인 회원의 이름을 장태영으로 수정하라
UPDATE 회원
SET c_name = '장태영'
WHERE c_id = 4;

-- 회원 번호가 6번인 회원의 이름을 안호영으로 수정하라
UPDATE 회원
SET c_name = '안호영'
WHERE c_id = 6;

-- 회원 테이블에서 회원 번호가 31번인 회원을 삭제하라
DELETE FROM 회원
WHERE c_id = 31;

-- 회원 번호가 5인 회원이 자전거를 대여한 시간을 TIME이라는 별명으로 변경하여 구하시오
SELECT r_start_time AS TIME
FROM 대여
WHERE c_ID = 5;

