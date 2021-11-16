# -PortFolio-ShopMoon
### - #Moon -
- 컨셉 : 음악 관련 제품 판매 및 블로그 (결제 시스템 구현)

- 개발함에 있어서 매번 놓치는 2가지
1. Simple is Best ( 가독성 좋은 폰트선택, 유효성 검사 잘하자 ( 비회원 게시글, 댓글, 채팅방 참여제한 등 ) )
2. 라이브러리 사용 기준 ( 생산성, 내부 동작 방식 이해하는 선에서 사용하자 )

### 참조할 사이트
- Asus : https://www.asus.com/kr/  saction 구조 선택 캐러셀 - 베스트 상품, 결제
- 다를 https://darles.co.kr/  상품 상세내용 레이아웃
- 사운드 기어 : https://www.ssoundgear.com/  메뉴 슬라이드 및 fade, 하단 상품 최신 게시글
- 뮤직카로마 : https://www.musicaroma.kr/#0  태그 요소 애니메이션


### Front-end
- HTML, CSS, JS


### Front 라이브러리
- AOS ( 태그 요소 애니메이션 )
- 구글 맵 API ( 회사 위치 표시 )
- jQuery ( 바닐라와 섞어 사용 )
- ajax ( 더보기 페이징 전략 )
- FontAwesome ( 여러 아이콘 )
- bxSlider( 캐러셀 


### Front 기술 아이디어
- localstorage를 통한 브라우저 메모장 유틸
- ajax를 이용한 회원가입 유효성 
- 메인 페이지 캐러셀( bxSlider 사용 )

### 페이지 구성 JSP

- *Root **index.jsp** : 페이지 메인, include를 통한 3단 구성 ( header.jsp, section.jsp, footer.jsp )


- **mainSection.jsp** :
   1. section1 : 캐러셀 
   
   2. section2 : 
     - 베스트 상품 목록
     - 상품 문의 게시판 
     - 오른쪽 fixed 채팅창 슬라이드  


- *재사용 **header.jsp** : 메뉴 구성 ( 시간 - 로고 - 메뉴버튼( nav.jsp ) )  

 
- *재사용 **nav.jsp** : 메뉴 구성                                         
   1. 로그인 | 회원가입 | 장바구니 | 마이페이지
     - 로그인시 로그인, 회원가입 hide -> 회원 아이디 표시
     - 관리자 로그인시 관리자 페이지 ( adminMain.jsp )  


   2. ABOUT
     - ABOUT #Moon ( about.jsp )
     - All Brand ( allBrand.jsp )  

    
   3. SHOP
     - GUITAR ( shopGuitar.jsp )
     - BASS ( shopBass.jsp )
     - MIDI ( shopMidi.jsp )
     - ALBUM ( shopAlbum.jsp )    


   4. COMMUNITY
     - 상품문의 ( contact.jsp ) | all상품문의 뿌리기
     - 오시는길 ( wayToCome.jsp ) | 다음맵 api  


   5. CUSTOMER
     - 번호
     - 상담시간 내용  


- *재사용 **footer.jsp** : 
   1. section : 회사소개 | 이용약관 | 개인정보터리방침 | 이용안내 | 제휴문의
   2. section : CUSTOMER CENTER | ACCOUNT INFO | FAVORITE MENU | RETURN / EXCHANGE
   3. section : copyright


### Back-end
- Spring, JSP, Oracle DB


### Back 라이브러리
- WebSocket.io ( P2P 전체 채팅방 )
- 다음주소 API ( 우편번호 조회 )
- 카카오, 구글, 네이버 회원가입 api
- ImageIO (상품 이미지 썸네일)


### Back 기술 아이디어
- P2P 전체 채팅방
- sns 로그인
- 상품 좋아요 로직


### DataBase
** 설계 이슈 **
- 조인 성능과 개인정보 관리 문제 Meber PK 값을 회원 ID? or MEMEBER_NO 따로 만들기?
- 장바구니 쿠키? DB? 선택 고민
- 비회원 로그인 없이 주문 기능 고민


### DB 테이블 구성
- MEMBER 회원테이블
- PRODUCT 상품 테이블
- CONTACT 문의 테이블
- CART 장바구니 테이블
- ORDERS 주문 테이블
- OTDER_DETAIL 주문 정보 테이블
- COMMENTS 상품 댓글 테이블


### 테이블 명세표
- Member

| No|   FieldName   |  DataType    |   Null    |   Key   | Comment        |  
|:-:|:-------------:|:------------:|:---------:|:-------:|:--------------:|
| 1 |  M_ID           | VARCHAR2(20) | NOT NULL  |   PK    | 회원 아이디     |  
| 2 |  M_PW           | VARCHAR2(100) | NOT NULL |         | 비밀번호        |
| 3 |  M_NAME         | VARCHAR2(40) | NOT NULL  |         | 이름           |
| 4 |  M_EMAIL        | VARCHAR2(50) | NULL      |         | 이메일           |
| 5 |  M_POST_NUM     | VARCHAR2(7)  | NOT NULL  |         | 우편번호        |
| 6 |  M_ADDRESS1     | VARCHAR2(100)| NOT NULL  |         | 주소       |
| 7 |  M_ADDRESS2     | VARCHAR2(100)| NOT NULL  |         | 상세 주소       |
| 8 |  M_PHONE        | VARCHAR2(20) |  NULL  |         | 핸드폰 번호     |
| 9 | M_USER_ACTIVE   | VARCHAR2(1)  | NOT NULL  |         | 탈퇴 여부(Y:사용중, N: 탈퇴) |
| 10 |  M_REG_DATE    | DATE         | NOT NULL  |         | 가입일           |
| 11 |  M_AUTHORITY   | NUMBER       | NOT NULL  |         | 관리자 권한(0:사용자, 1:관리자)|
*M_ID 중복검사를 통해 PK처럼 활용
*M_PW 암호화를 위해 데이터 크기 100지정

- Product

| No|   FieldName   |  DataType    |   Null    |   Key   | Comment        |  
|:-:|:-------------:|:------------:|:---------:|:-------:|:--------------:|
| 1 |  P_NO         |    NUMBER    | NOT NULL  |   PK    | 상품 고유번호    |
| 2 |  P_NAME       | VARCHAR2(100)| NOT NULL  |         | 상품 이름     |  
| 3 |  P_CATEGORY   | CHAR(1)      | NOT NULL  |         | 상품 종류 (1: 기타, 2: 베이스, 3: 미디, 4: 앨범)  |
| 4 |  P_PRICE      | NUMBER(7)    | NOT NULL  |         | 가격            |
| 5 |  P_CONTENTS   | CLOB         | NOT NULL  |         | 상품 설명        |
| 6 |  P_ACTIVE     | CHAR(1)      | NOT NULL  |         | 제품 활성 여부(Y: 판매중,  N: 미판매)      |
| 7 |  P_BEST       | CHAR(1)      | NOT NULL  |         | 베스트 상품 여부Y: 베스트, N: 일반)     |
| 8 |  p_REG_DATE   | DATE         | NOT NULL  |         | 상품 등록일 |
*SEQ_PRODUCT

- Image

| No|   FieldName   |  DataType    |   Null    |   Key   | Comment        |  
|:-:|:-------------:|:------------:|:---------:|:-------:|:--------------:|
| 1 |  P_NO         |    NUMBER    |    NULL   |   FK    | 상품 고유번호    |
| 2 |  I_FILENAME   | VARCHAR2(100)| NOT NULL  |         | 이미지 이름     |  
| 3 |  I_UPLOADPATH | VARCHAR2(200)| NOT NULL  |         | 이미지 경로    |
| 4 |  I_UUID       | VARCHAR2(100)| NOT NULL  |   PK    | 이미지 식별 번호   |


- Contact

| No|   FieldName   |  DataType      |   Null    |   Key   | Comment        |  
|:-:|:-------------:|:--------------:|:---------:|:-------:|:--------------:|
| 1 |  CON_NO         |    NUMBER    | NOT NULL  |   PK    | 문의 고유번호    |
| 2 |  M_ID           | VARCHAR(20)  | NOT NULL  |   FK    | 작성자 / 회원 아이디     |
| 3 |  CON_CATEGORY   | VARCHAR2(20) | NOT NULL  |         | 카테고리 | 
| 4 |  CON_TITLE      | VARCHAR2(100)| NOT NULL  |         | 제목 |  
| 5 |  CON_CONTENTS   | CLOB         | NOT NULL  |         | 문의 내용 |
| 6 |  CON_REPLY      | CLOB         |     NULL  |         | 답변  |
| 7 |  CON_ANSWER     | CHAR(1)      |     NULL  |         | 답변 여부(Y: 완료, N:미완료) |
| 8 |  CON_REG_DATE   | DATE         | NOT NULL  |         | 문의 등록일 |
*SEQ_CONTACT

- Reply

| No|   FieldName   |  DataType      |   Null    |   Key   | Comment        |  
|:-:|:-------------:|:--------------:|:---------:|:-------:|:--------------:|
| 1 |  R_NO           |    NUMBER    | NOT NULL  |   PK    | 댓글 고유번호    |
| 2 |  M_ID           | VARCHAR(20)  | NOT NULL  |   FK    | 작성자 / 회원 아이디     |
| 3 |  CON_NO         | VARCHAR2(20) | NOT NULL  |   FK    | 카테고리 | 
| 4 |  R_CONTENTS     | VARCHAR2(100)| NOT NULL  |         | 댓글 |  
| 5 |  R_REG_DATE     | DATE         | NOT NULL  |         | 작성 날짜 |
| 6 |  R_UPDATE_DATE  | DATE         |     NULL  |         | 수정 날짜  |
*SEQ_Reply

- Cart

| No|   FieldName   |  DataType    |   Null    |   Key   | Comment        |  
|:-:|:-------------:|:------------:|:---------:|:-------:|:--------------:|
| 1 |  CART_NO      |    NUMBER    | NOT NULL  |   PK    | 장바구니 고유번호    |
| 2 |  M_ID         | VARCHAR(20)  | NOT NULL  |   FK    | 주문자 / 회원 아이디   |
| 3 |  P_NO         |    NUMBER    | NOT NULL  |   FK    | 상품 고유번호    |
| 4 |  CART_QUANTITY|    NUMBER(5) | NOT NULL  |         | 상품 개수         |
| 5 |  CART_REG_DATE| DATE         | NOT NULL  |         | 장바구니 등록 날짜   |
*SEQ_CART

- Orders

| No|   FieldName   |  DataType    |   Null    |   Key   | Comment        |  
|:-:|:-------------:|:------------:|:---------:|:-------:|:--------------:|
| 1 |  O_NO         |    NUMBER    | NOT NULL  |   PK    | 주문 고유번호    |
| 2 |  M_ID         | VARCHAR(20)  | NOT NULL  |   FK    | 주문자 / 회원 아이디  |
| 3 |  O_REG_DATE   | DATE         | NOT NULL  |         | 주문 일 |
*SEQ_ORDER

- Order_Detail

| No|   FieldName   |  DataType    |   Null    |   Key   | Comment        |  
|:-:|:-------------:|:------------:|:---------:|:-------:|:--------------:|
| 1 |  OD_NO        |    NUMBER    | NOT NULL  |   PK    | 주문상세 고유번호    |
| 2 |  O_NO         |    NUMBER    | NOT NULL  |   FK    | 주문 고유번호    |
| 3 |  P_NO         |    NUMBER    | NOT NULL  |   FK    | 상품 고유번호    |
| 4 |  OD_QUANTITY  |    NUMBER(5) | NOT NULL  |         | 상품 개수         |
| 5 |  POST_NUM     | VARCHAR2(7)  | NOT NULL  |         | 주문 우편번호      |
| 6 |  OD_ADDRESS1  |VARCHAR2(100) | NOT NULL  |         | 주문 주소         |
| 7 |  OD_ADDRESS2  |VARCHAR2(100) | NOT NULL  |         | 주문 상세주소    |
| 8 |  OD_RESULT    | CHAR(1)      | NOT NULL  |         | 주문 처리 여부(Y: 처리완료, N: 미처리)  |
*SEQ_ORDER_DETAIL





