###  08.07 (23일차)
---
교육 내용: Docker 컨테이너, Linux
---
오늘 진짜 대박적으로 피곤한 날.. 눈앞이 빙글빙글 도는데 아무래도 한 달 딱 넘기니까 한계가 온 것 같은 그런 느낌이다. 근데 도커로 고통 받다가 리눅스 하니까 너무 행복하다 ㅎㅎ 그치만 허리가 너무 아프다. 잠깐 외출해서 한의원 가고 싶은데 너무 귀찮다. 덜 아팠나
<p align="center">
<img src="https://github.com/user-attachments/assets/1ee18f6e-8ce5-4fc0-a44a-71c58f3128b9" width="30%" /> </p>
<p align="center">같은 반 행님이 주신 렌즈 클리너 so good<br>

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
  <img src="https://github.com/user-attachments/assets/ccd3e9e0-e213-4eb8-a0a3-b1655817bcd1" width="60%" /> </p><br>

- **커널, 쉘, 터미널**
  - **kernel**: 앱에게 인터페이스를 제공, 프로그램 연결해주는 역할(모든 os가 가지고 있음)
  - **shell**: 종류 따라 문법 조금씩 다름, 명령어 입력하면 커널이 읽을 수 있는 코드로 해석
    - 커널의 인터페이스
  - **terminal**: 텍스트 기반 명령 입력/실행하는 인터페이스
    - 컴퓨터 입출력만 담당 (키보드 + 모니터)
 <br><br>

- **command line**
  - ```ctrl+r```: 사용했던 코드 중 일부만 기억났을 때 탐색 가능
    <p align="center">
    <img src="https://github.com/user-attachments/assets/0f0d756a-73fb-45bc-b398-1cb9ac8783b7" width="50%" /> </p>
  - ```ctrl+c```: 강제 종료 후 새 커맨드라인 생성
<br><br>

- useradd VS adduser
  - **useradd**: user id만 설정
    <p align="center">
    <img src="https://github.com/user-attachments/assets/79727441-e9cd-4942-a7c6-91216914d799" width="50%" /> </p>
  - **adduser**: 기본적인 information을 담을 수 있음
    <p align="center">
    <img src="https://github.com/user-attachments/assets/6170b5db-1695-4506-8431-9c874f00ee9b" width="50%" /> </p>
<br>

- 리눅스는 파일로 구성 -> 파일을 관리하는 디렉토리들이 따로 존재
  - `cd /`: 최상위 디렉토리(root)로 이동
  - 각 디렉토리 역할이 다 다름
    - **/bin**: 명령어 실행 파일 관리 폴더
      - **/sbin**: super bin(관리자용 명령어) 
    - **/dev**: 디바이스 파일(하드웨어 조작용) 관리 폴더
    - **/home**: 홈디렉터리(개인 할당 디렉토리)
    - **/usr**: 설치된 앱의 실행 파일, 문서 등(root 디렉토리와 유사한 버전)
    - **/var**: variable 데이터 저장용
  <br><br>
  
    - *
***
