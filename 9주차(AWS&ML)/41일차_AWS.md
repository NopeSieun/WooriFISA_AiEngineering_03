###  09.03 (41일차)
---
교육 내용: AWS
---
컴퓨터 맛감 이슈로 오늘의 깃이 싹 ~~ 날아가버렸고.. 
<br><br>

- 오늘 실습 중 발생 문제: MySQL 워크벤치에 DB 연결이 안 되는 문제 발생
  - 해결: 퍼블릭 엑세스 -> 예
    <p align="center">
    <img src="https://github.com/user-attachments/assets/f04eab21-4602-4bfb-b2e8-b4ee18e2733a" width="30%" /> </p><br>
  - RDS는 데이터베이스에 퍼블릭 IP 주소를 할당
  - VPC 외부의 Amazon EC2 인스턴스 및 다른 리소스가 데이터베이스에 연결 가능(VPC 내부의 리소스도 데이터베이스에 연결 가능)
    
- **AWS**: 아마존(Amazon)에서 제공하는 클라우드 서비스
  - **클라우드**: 인터넷에서 접근할 수 있는 가상화된 서버와, 서버에서 작동하는 프로그램과 데이터베이스를 제공하는 IT 환경
  - 매우 많은 기능 有 -> 자주 쓰는 기능에 즐겨찾기 해두면 편함 
<br><br>

- **RDS**: AWS에서 제공하는 클라우드 기반의 관계형 데이터베이스 서비스
  - 서버 컴퓨터에 직접 MySQL이나 MariaDB같은 관계형 데이터베이스를 설치하지 않고 데이터베이스 사용 가능
    <p align="center">
    <img src="https://github.com/user-attachments/assets/82452e51-c9c2-4c91-b8d1-c950c06c5d61" width="50%" /> </p><br>
  - DB 생성하기 -> 엔진 옵션, 템플릿, 스토리지 등 직접 설정
    <p align="center">
    <img src="https://github.com/user-attachments/assets/995d180d-3e95-43c3-8216-70d305cdbe52" width="50%" /> </p><br>
  - DB 인스턴스 식별자: 사용해줄 이름
<br><br>

- MySQL 워크벤치에 DB 연결
  <p align="center">
  <img src="https://github.com/user-attachments/assets/31a54c69-39d3-4c65-829b-4292db415142" width="50%" /> </p><br>
  
- MySQL 5 버전은 대,소문자 안 가림 (8버전은 x)
<br><br>

- **VPC**: 퍼블릭 클라우드 환경에서 사용할 수 있는 고객 전용 사설 네트워크
  - 데이터 센터 내부에 우리만의 규칙을 설정하기 위한 방법 
<br><br>
  


***
