# -PortFolio-ShopMoon
### - #Moon -
- 컨셉 : 음악 관련 제품 판매 및 블로그 (결제 시스템 구현)

- 개발함에 있어서 3가지 조건
1. Simple is Best
2. 라이브러리를 사용 ( 생산성 관점 그리고 라이브러리 내부 동작에 대해 최소한 참조를 통해 기능 구현 할 수 있는 경우만 )
3. 라이브러리를 사용하지 말자 ( 시간을 생각해 노가다 성이 아닌 적당한 기술은 바닐라 구현 )

### 참조할 사이트
- Asus : https://www.asus.com/kr/  saction 구조 선택 캐러셀 - 베스트 상품
- 다를 https://darles.co.kr/
- 사운드 기어 : https://www.ssoundgear.com/  메뉴 슬라이드 및 fade, 하단 상품 최신 게시글
- 뮤직카로마 : https://www.musicaroma.kr/#0

### Front-end
- HTML, CSS, JS

### Front 라이브러리
- AOS
- WebSocket.io
- 카카오 맵 API
- jQuery
- ajax

### Front 기술 아이디어
- localstorage를 통한 브라우저 메모장 유틸
- ajax를 통한 상품 페이지 더보기 구현( 성능 향상 ) 
- 메인 페이지 캐러셀( Bootstrap 끌어오기 planB )
- 상품 좋아요 DB에서 lickHeart = 1 반환시 하트 색칠

### 페이지 구성 JSP
- **index.jsp** : 페이지 메인, include를 통한 3단 구성 ( header.jsp, section.jsp, footer.jsp )

- **saction.jsp** :
   1. saction1 : 캐러셀 
   
   2. saction2 : 
     - DB에서 끌어온 베스트 상품 목록
     - 상품 문의 게시판 최근 5개

- **header.jsp** : 메뉴 구성 ( 시간 - 로고 - 메뉴버튼( nav.jsp ) )

- **nav.jsp** : 메뉴 구성 
   1. 로그인 | 회원가입 | 장바구니 | 마이페이지
 
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
     - 오시는길 ( wayToCome.jsp ) | 카카오맵 api

   5. CUSTOMER
     - 번호
     - 상담시간 내용
     

- **footer.jsp** : 
   1. saction : 사업자정보, 사이트맵, 고객 참여



### Back-end
- Spring, JSP, Oracle DB

### Back 라이브러리
- WebSocket을 통한 P2P 전체 채팅방
- 다음주소 API
- 카카오, 구글, 네이버 회원가입 api
 
### Back 기술 아이디어
- P2P 전체 채팅방
- sns 로그인
- 상품 좋아요 로직


### DataBase
** 중요 이슈 **
- 조회 성능 문제 고민 
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


- Member

| No|   FieldName   |  DataType    |   Null    |   Key   | Comment        |  
|:-:|:-------------:|:------------:|:---------:|:-------:|:--------------:|
| 1 |  M_NO           |    NUMBER   | NOT NULL  |   PK    | 회원 고유번호        |
| 2 |  M_ID           | VARCHAR2(20) | NOT NULL  |         | 회원 아이디     |  
| 3 |  M_PWD          | VARCHAR2(40) | NOT NULL  |         | 비밀번호        |
| 4 |  M_NAME         | VARCHAR2(40) | NOT NULL  |         | 이름           |
| 5 |  M_POST_NUM     | VARCHAR2(7)  | NOT NULL  |         | 우편번호        |
| 6 |  M_ADDRESS1     | VARCHAR2(100)| NOT NULL  |         | 주소           |
| 7 |  M_ADDRESS2     | VARCHAR2(100)| NOT NULL  |         | 상세 주소       |
| 8 |  M_PHONE        | VARCHAR2(20) | NOT NULL  |         | 핸드폰 번호     |
| 9 | M_USER_ACTIVE   | VARCHAR2(1)  | NOT NULL  |         | 탈퇴 여부(Y:사용중, N: 탈퇴) |
| 10 |  M_REG_DATE    | DATE         | NOT NULL  |         | 가입일           |
| 11 |  M_AUTHORITY   | NUMBER(1)    | NOT NULL  |         | 관리자 권한(1:사용자, 2:관리자)|


- Product

| No|   FieldName   |  DataType    |   Null    |   Key   | Comment        |  
|:-:|:-------------:|:------------:|:---------:|:-------:|:--------------:|
| 1 |  P_NO         |    NUMBER    | NOT NULL  |   PK    | 상품 고유번호    |
| 2 |  P_NAME       | VARCHAR2(100)| NOT NULL  |         | 회원 아이디     |  
| 3 |  P_CATEGORY   | CHAR(1)      | NOT NULL  |         | 상품 종류 (1: 기타, 2: 베이스, 3: 미디, 4: 앨범)  |
| 4 |  P_PRICE      | NUMBER(7)    | NOT NULL  |         | 가격            |
| 5 |  P_CONTENTS   | CLOB         | NOT NULL  |         | 상품 설명        |
| 6 |  P_IMAGE      | VARCHAR(50)  | NOT NULL  |         | 상품 사진        |
| 7 |  P_ACTIVE     | CHAR(1)      | NOT NULL  |         | 제품 활성 여부(Y: 판매중,  N: 미판매)      |
| 8 |  P_BEST       | CHAR(1)      | NOT NULL  |         | 베스트 상품 여부Y: 베스트, N: 일반)     |
| 9 |  p_REG_DATE   | DATE         | NOT NULL  |         | 상품 등록일 |


- Contact

| No|   FieldName   |  DataType      |   Null    |   Key   | Comment        |  
|:-:|:-------------:|:--------------:|:---------:|:-------:|:--------------:|
| 1 |  CON_NO         |    NUMBER    | NOT NULL  |   PK    | 문의 고유번호    |
| 2 |  CON_TITLE      | VARCHAR2(100)| NOT NULL  |         | 제목 |  
| 3 |  CON_CONTENTS   | CLOB         | NOT NULL  |         | 문의 내용 |
| 4 |  M_ID           | NUMBER       | NOT NULL  |   FK    | 문의자 아이디     |
| 5 |  CON_REPLY      | CLOB         |     NULL  |         | 답변  |
| 6 |  CON_ANSWER     | CHAR(1)      |     NULL  |         | 답변 여부(Y: 완료, N:미완료) |
| 7 |  CON_REG_DATE   | DATE         | NOT NULL  |         | 문의 등록일 |


- Cart

| No|   FieldName   |  DataType    |   Null    |   Key   | Comment        |  
|:-:|:-------------:|:------------:|:---------:|:-------:|:--------------:|
| 1 |  CART_NO      |    NUMBER    | NOT NULL  |   PK    | 장바구니 고유번호    |
| 4 |  M_ID         |    NUMBER    | NOT NULL  |   FK    | 문의자 아이디     |
| 3 |  P_NO         |    NUMBER    | NOT NULL  |   FK    | 상품 고유번호    |
| 4 |  CART_QUANTITY|    NUMBER(5) | NOT NULL  |         | 상품 개수         |
| 5 |  CART_RESULT  | VARCHAR2(7)  | NOT NULL  |         | 주문 우편번호      |
| 6 |  CART_REG_DATE| DATE         | NOT NULL  |         | 장바구니 등록 날짜   |


- Orders

| No|   FieldName   |  DataType    |   Null    |   Key   | Comment        |  
|:-:|:-------------:|:------------:|:---------:|:-------:|:--------------:|
| 1 |  O_NO         |    NUMBER    | NOT NULL  |   PK    | 주문 고유번호    |
| 2 |  M_ID         |    NUMBER    | NOT NULL  |   FK    | 주문자 아이디 |  
| 3 |  O_REG_DATE   | DATE         | NOT NULL  |         | 주문 일 |


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


- Comments

| No|   FieldName   |  DataType    |   Null    |   Key   | Comment        |  
|:-:|:-------------:|:------------:|:---------:|:-------:|:--------------:|
| 1 |  COMM_NO      |    NUMBER    | NOT NULL  |   PK    |  고유번호    |
| 2 |  P_NO         |    NUMBER    | NOT NULL  |   FK    | 상품평을 남길 상품 고유번호    |
| 3 |  M_NO         |    NUMBER    | NOT NULL  |   PK    | 회원 고유번호        |
| 4 |  COMM_CONTENTS|    NUMBER    | NOT NULL  |         | 댓글 내용        |
| 5 |  COMM_REG_DATE|    DATE      | NOT NULL  |         |  댓글 작성일        |
| 6 |  COMM_REG_DATE|    DATE      | NOT NULL  |         |  댓글 수정일        |





