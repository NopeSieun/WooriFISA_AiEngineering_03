###  08.07 (23일차)
---
교육 내용: Docker 컨테이너, Linux
---
오늘 진짜 대박적으로 피곤한 날.. 눈앞이 빙글빙글 도는데 아무래도 한 달 딱 넘기니까 한계가 온 것 같은 그런 느낌이다. 그치만 도커로 고통 받다가 리눅스 하니까 너무 행복하다 ㅎㅎ 그치만 허리가 너무 아프다.
<p align="center">
<img src="https://github.com/user-attachments/assets/1ee18f6e-8ce5-4fc0-a44a-71c58f3128b9" width="30%" /> </p>
<p align="center">같은 반 행님이 주신 렌즈 클리너가 큰 도움이 되었다.<br>

- Dockerfile에서 없는 버전을 사용하려고 하면 에러 발생
  <br><br>

- **Docker compose**: docker-compose.yml 파일로 작성 -> 시스템 구축에 필요한 명령어들의 묶음
  - 파일 작성 후 `docker-compose up` 명령 실행
  - Dockerfile과의 차이점: Dockerfile은 이미지를 만드는데 사용하는 것, compose는 컨테이너, 네트워크, 볼륨 등을 만드는데 사용
  - version, services, networks, volumns 작성 
<br><br>

- **Linux**: 오픈소스 운영체제 중 하나, 컴퓨터 하드웨어 및 소프트웨어 리소스 관리
  - 다른 운영체제보다 안전한 편
<p align="center">
<img src="https://github.com/user-attachments/assets/a69b530a-aaed-44fb-b8ff-5ba29f3076ea" width="30%" /> </p><br>

- **외부 접속용 비밀번호 생성**
  - `passwd root`
  - 서비스 재시작 필요 `service ssh start`
  <p align="center">
  <img src="https://github.com/user-attachments/assets/ccd3e9e0-e213-4eb8-a0a3-b1655817bcd1" width="70%" /> </p><br>

- **커널, 쉘, 터미널**
  - **kernel**: 앱에게 인터페이스를 제공, 프로그램 연결해주는 역할(모든 os가 가지고 있음)
  - **shell**: 종류 따라 문법 조금씩 다름, 명령어 입력하면 커널이 읽을 수 있는 코드로 해석
    - 커널의 인터페이스
  - **terminal**: 텍스트 기반 명령 입력/실행하는 인터페이스
    - 컴퓨터 입출력만 담당 (키보드 + 모니터)
 <br><br>  
  
***
