# -PortFolio-ShopMoon
### Moon Shop
- 컨셉 : 음악 관련 제품 판매 및 블로그 (결제 시스템 구현)

- 개발함에 있어서 2가지 조건
1. 라이브러리를 사용 ( 생산성 관점 그리고 라이브러리 내부 동작에 대해 최소한 참조를 통해 기능 구현 할 수 있는 경우만 )
2. 라이브러리를 사용하지 말자 ( 시간을 생각해 노가다 성이 아닌 적당한 기술은 바닐라 구현 )

### 참조할 사이트
- Asus : https://www.asus.com/kr/
- 다를 https://darles.co.kr/
- 뮤직카로마 : https://www.musicaroma.kr/#0


### Front
- HTML, CSS, JS

- 라이브러리
- HTML - 바닐라
- CSS - AOS,
- JS - 바닐라, jQuery, ajax, WebSocket.io

### 기술 아이디어
- localstorage를 통한 브라우저 메모장 유틸
- ajax를 통한 상품 페이지 더보기 구현(비동기 구현을 통한 성능 향상) 
- 메인 페이지 캐러셀(BootStrap 끌어오는건 Plan B)

### 정적 페이지 구성 JSP
- index.jsp : 페이지 메인, include를 통한 3단 구성 (header.jsp, section.jsp, footer.jsp)

- selction.jsp :
 1. section1 : 캐러셀 
 2.  section2 : DB에서 끌어온 일부 상품 목록

- header.jsp : 메뉴 구성 ( 로고, 홈, ... )
  DropDown 기능구현,

- footer.jsp : 
 1. section : 사업자정보, 사이트맵, 고객 참여

### BACK && DB
- Spring, JSP, Oracle DB

- 라이브러리
- WebSocket을 통한 P2P 전체 채팅방
 
### 기술 아이디어
