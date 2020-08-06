![logo](https://user-images.githubusercontent.com/54253400/89410550-e0678600-d75e-11ea-9ea6-9def69d4fd9d.png)
## MOFLEX
 ▶ MOFLEX는 지금까지 공부하며 배운 것을 총 활용해서 만든 프로젝트 입니다. 
 <br><br>
 ▶ MOFLEX는 여러 사람들과 영화에 대해 커뮤니티를 할 수 있는 사이트 입니다. MOFLEX는 자료공유 , 소통을 원활하게 사용 가능합니다.
 <br><br>
▶ MOFLEX는 게임에 대해 커뮤니티 하는 사이트를 보고 넷플릭스와 커뮤니티 사이트를 합쳐서 해보자는 생각으로 만들어진 사이트 입니다.
 <br><br>
▶ MOFLEX는 영화추가, 자료공유,쿠폰 ,추천인 등이 있습니다.
 <br><br>
## 주제선정이유
▶ 평소에 영화를 좋아해서 영화 다운로드와 자료공유 , 커뮤니티를 할 수 있는 사이트가 있으면 좋을꺼 같아서 만들어 보았습니다.

## 실행방법
▶ root-context.xml 파일의 데이터베이스 username , password 변경 후 DDL.sql 파일에 있는 DDL문을 전부다 실행 시키시면 됩니다.

## 주요기능 <br><br>
# 1.영화추가
![movieadd](https://user-images.githubusercontent.com/54253400/89506826-a5b92880-d806-11ea-84f5-fab358c2639d.PNG)
▶ 영화 포스터와 , 이름 , 가격 , 나라 등을 선택 가능합니다. <br><br>

# 2.찜하기
![jjim](https://user-images.githubusercontent.com/54253400/89506831-a6ea5580-d806-11ea-9d4a-225aefca4c3b.PNG)
▶ 영화 목록에 있는 하트를 누루시면 자신만의 찜 리스트에 추가가 됩니다. <br><br>

# 3.글 추천하기
![likeup](https://user-images.githubusercontent.com/54253400/89506834-a8b41900-d806-11ea-9434-08cdbfc7b9a7.PNG)<br>
▶ 글 상세보기에 글을 추천을 할 수 있습니다. <br><br>
![like](https://user-images.githubusercontent.com/54253400/89506836-a9e54600-d806-11ea-81b6-04781461c321.PNG)<br>
▶ 한 사람당 추천은 한번씩만 가능합니다. <br><br>

# 4.영화 다운로드
![mdown](https://user-images.githubusercontent.com/54253400/89506838-ab167300-d806-11ea-87dc-9b75346e644c.PNG)
▶ 다운로드 클릭시 다운로드를 할 수 있습니다. <br><br>
![mdowns](https://user-images.githubusercontent.com/54253400/89506842-ac47a000-d806-11ea-8340-29a8b5e0f752.PNG)
▶ 한번 다운로드 한 파일은 포인트 감소 없이 계속 다운로드 받으실 수 있습니다. <br><br>

# 5.계정 비활성화
![ban](https://user-images.githubusercontent.com/54253400/89508721-44468900-d809-11ea-96c8-b6176c88830d.PNG)
▶ 사용자를 정지사유를 선택 후 비활성화 할 수 있습니다. <br><br>
![mdowns](https://user-images.githubusercontent.com/54253400/89508574-0d707300-d809-11ea-81dc-b6d2b83086d9.PNG)
▶ 비활성화인 계정을 로그인 하시면 관리자에게 메일로 문의 후 관리자를 통해 계정을 다시 활성화 할 수 있습니다.

## DB모델링 
![1](https://user-images.githubusercontent.com/54253400/89509326-2594c200-d80a-11ea-8a24-f1080832bf31.PNG)
<br><br>

## Trigger
![1](https://user-images.githubusercontent.com/54253400/89509815-bbc8e800-d80a-11ea-9c91-5215f2102789.PNG)<br>
▶ INSERT_TRI_ROLE : 회원가입 할 시 유저에게 일반유저 권한을 부여함. <br><br>

## 클래스 다이어그램(Class Diagram)
# 회원가입 / 로그인
![1](https://user-images.githubusercontent.com/54253400/89510344-66d9a180-d80b-11ea-9e3f-5d7583f703c6.PNG)

# 영화 추가 / 글작성
![2](https://user-images.githubusercontent.com/54253400/89510624-c46dee00-d80b-11ea-9050-ead4f2bd250c.png)

## 사용한 기술들
# Front 
▶ EL , JSTL <br>
▶ SweetAlert , Iconify , FontAwesome<br>
▶ CSS , JavaScript , HTML <br>
▶ Ajax , Bootstrap , JQUERY<br>
# Back
▶ JAVA <br>
▶ Velocity, JavaMailSender<br>
▶ Mybatis, Spring Locale , SpringFramework , Spring Security <br>
# Server 
▶ Apache Tomcat <br>
# Tool
▶ Eclipse <br>
▶ SourceTree , eXERD 
# DB 
▶ Oracle 11g
# 형상관리
▶ Github : SourceTree 
![source](https://user-images.githubusercontent.com/54253400/89511436-e320b480-d80c-11ea-8ed3-f6d9162e45a8.PNG)
