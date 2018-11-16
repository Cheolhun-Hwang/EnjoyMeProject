create table movie_type(
mt_id		int(20)			NOT NULL AUTO_INCREMENT,
mt_type		varchar(5)		NOT NULL,
mt_name		varchar(20)		NOT NULL,
PRIMARY KEY (mt_id)
)ENGINE = InnoDB DEFAULT CHARSET=utf8;

INSERT INTO movie_type (mt_type, mt_name) 
VALUES ('ads', '광고');

INSERT INTO movie_type (mt_type, mt_name) 
VALUES ('yt', '유튜브');

INSERT INTO movie_type (mt_type, mt_name) 
VALUES ('g', '일반');

SELECT *
  FROM movie_type;

create table questions(
q_id		int(20) 		NOT NULL AUTO_INCREMENT,
mt_id		int(20)			NOT NULL,
q_cg		varchar(20)		NOT NULL,
q_text		varchar(500)	NOT NULL,
q_ylink		varchar(100)	NOT NULL,
q_length	int(10)			NOT NULL,
q_rate		varchar(10)		NOT NULL,
PRIMARY KEY (q_id),
FOREIGN KEY (mt_id) REFERENCES movie_type (mt_id)
)ENGINE = InnoDB DEFAULT CHARSET=utf8;

INSERT INTO questions (q_cg, mt_id, q_text, q_ylink, q_length, q_rate) 
VALUES ('여행', 2, '하나투어 테마여행 CF_시네마 편', 'BiOH_s5kIQ8', 15, 'B');

INSERT INTO questions (q_cg, mt_id, q_text, q_ylink, q_length, q_rate) 
VALUES ('게임', 2, '버닝 매지컬소드 메이트 런칭 광고 16초', 'Em2I_tad-Q8', 15, 'B');

INSERT INTO questions (q_cg, mt_id, q_text, q_ylink, q_length, q_rate) 
VALUES ('쇼핑', 2, '쿠차 싸다구 신동엽 쿠차 TV광고 30초', 'miSL86dtqis', 30, 'C');

SELECT *
  FROM questions;
  
create table question_list(
ql_id		int(20) 		NOT NULL AUTO_INCREMENT,
q_id		int(20)			NOT NULL,
ql_type		varchar(20)		NOT NULL,
ql_text		varchar(500)	NOT NULL,
ql_one		varchar(100)	NOT NULL,
ql_two		varchar(100)	NOT NULL,
ql_three	varchar(100)	NOT NULL,
ql_four		varchar(100)	NOT NULL,
ql_answer	int(1)			NOT NULL,
PRIMARY KEY (ql_id),
FOREIGN KEY (q_id) REFERENCES questions (q_id)

)ENGINE = InnoDB DEFAULT CHARSET=utf8;

INSERT INTO question_list (q_id, ql_type, ql_text, ql_one, ql_two, ql_three, ql_four, ql_answer) 
VALUES (1, '단어 회상', '다음 광고 멘트 중 빈칸에 들어갈 내용은 무엇인가요?\n "영화와 영화 속 주인공과 [  ?  ] 여행"', '동화되는', '하나되는', '함께하는', '공감하는', 2);

INSERT INTO question_list (q_id, ql_type, ql_text, ql_one, ql_two, ql_three, ql_four, ql_answer) 
VALUES (1, '단어 회상', '다음은 영상 속에 출력된 내용입니다. 빈칸에 들어갈 단어의 묶음으로 올바른 것은 무엇인가요?\n "[  ?  ]가 좋다 [  ?  ]면 된다"', '테마, 하나', '영화, 하나', '테마, 하나투어', '영화, 하나 투어', 1);

INSERT INTO question_list (q_id, ql_type, ql_text, ql_one, ql_two, ql_three, ql_four, ql_answer) 
VALUES (1, '단어 회상', '하나투어가 제시한 테마여행의 키워드가 아닌 것은 무엇인가요?', '식도락', '드라마', '시네마', '레포츠', 2);

INSERT INTO question_list (q_id, ql_type, ql_text, ql_one, ql_two, ql_three, ql_four, ql_answer) 
VALUES (2, '시공간 회상', '광고에서 남자모델이 비춰진 물건이 아닌것은 무엇일까요??\n 버닝버닝!~!~', '거울', '시계', '젤리', '식탁',4);

INSERT INTO question_list (q_id, ql_type, ql_text, ql_one, ql_two, ql_three, ql_four, ql_answer) 
VALUES (2, '단어 회상', '다양한 메이트와 함께 즐기는 버닝!\n 전투 욕구 상승시키는 버닝의 메이트는 누구일까요?  ', '소울 메이트', '룸 메이트', '러닝 메이트', '버닝 메이트',3);

INSERT INTO question_list (q_id, ql_type, ql_text, ql_one, ql_two, ql_three, ql_four, ql_answer) 
VALUES (2, '물건 회상', '버닝 지금 다운로드 하세요!!\n이 멘트는 어디서 나왔을까요? ', '티비', '스마트 워치', '스마트폰', '태블릿',3);

INSERT INTO question_list (q_id, ql_type, ql_text, ql_one, ql_two, ql_three, ql_four, ql_answer) 
VALUES (3, '단어 회상', '쿠차의 싸다구!\n 쿠차의 싸다구는 [ ] , [ ], [ ]이 모두 모인 핫딜쇼핑포털이다 ', ' 플리마켓, 홈쇼핑, 공동구매', '소셜미디어, 플리마켓, 홈쇼핑', '소셜커머스, 오픈마켓, 홈쇼핑','소셜미디어, 오픈마켓, 아이쇼핑', 3);
INSERT INTO question_list (q_id, ql_type, ql_text, ql_one, ql_two, ql_three, ql_four, ql_answer) 
VALUES (3, '수계산 회상', '쿠차의 싸다구!\n 영상이 종료될 때 까지 신동엽이 맞은 싸다구 횟수는? ', '5회 미만', '5회 이상 10회 미만', '10회 이상 15회 미만', '20회 이상', 3);
INSERT INTO question_list (q_id, ql_type, ql_text, ql_one, ql_two, ql_three, ql_four, ql_answer) 
VALUES (3, '단어 회상', '쿠차의 싸다구!\n 영상에 등장하는 외국인 모델의 싸다구 대사는? ', 'Very 싸다구', 'Really 싸다구', 'Im 싸다구','Hey 싸다구', 3);

select *
  from question_list
 where question_list.q_id = 1;
 
 drop table question_list;
 