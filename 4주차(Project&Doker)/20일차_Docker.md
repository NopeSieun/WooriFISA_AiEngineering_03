###  08.02 (20일차)
---
교육 내용: Docker
---
오늘은 커피 대신 플럼애플티를 시켜봤는데 비싸지만 굉장히 맛있다. 이젠 말씀 안 드려도 얼음 두 개 정도 넣어주셔서 좋다. 그리고 하트도 그려주심ㅎㅎ 모니터에 구스를 키우기 시작했다. 자꾸 이상한거 끌고오고 마우스도 끌고간다. ㅋㅋㅋㅋ 어제 오늘 계속 플젝 하고 시험 보고 하느라 깃에 정리한 내용이 많이 없지만 나름 열심히 살았다고 생각한다..엔지니어링 2기 분들께서 오셔서 면접 얘기 해주셨는데, 물론 열심히 노력해야겠지만 확실히 센스는 타고나야 하는 것 같기도 하다. 그래도 아는 게 많아지면 없던 센스도 발휘할 수 있게 될 것이라고 생각한다. 
<p align="center">
<img src="https://github.com/user-attachments/assets/39ecc759-408e-43e8-bb66-4eb32226ffde" width="30%" /><img src="https://github.com/user-attachments/assets/c53d0e63-ba81-40a0-be5a-fe722a52aeb3" width="34%" />
 </p><br>
<br>

- **Docker 특징**
  - 리눅스의 커널을 제어해서 불필요한 요소는 날리고 서비스 운영을 위한 앱과 패키지 운영
  - 지정된 호스트에서 적은 리소스로 여러 컨테이너를 동시에 실행 가능
  - 기본명령어: `docker <command> --help`를 통해 확인 
    <p align="center">
    <img src="https://github.com/user-attachments/assets/324dd6eb-bc7b-4e94-90fd-49163efaacff " width="50%" /> </p><br>

- **Docker 컨테이너 생성**: 이미지 기반 생성 
  ```linux
  docker run --name mytomcat -d -p 80:8080 tomcat:9.0
  ```
  - Docker desktop 에서 확인, 제어 가능
    <p align="center">
    <img src="https://github.com/user-attachments/assets/b49b0e03-58f5-46a8-a998-4d07885c9c5a " width="60%" /> </p><br>
  - 컨테이너 제거: 먼저 동작 멈추고, 삭제(강제삭제도 가능)
    ```linux
    docker stop name
    docker rm name
    ```
    ```linux
    docker rm -f name
    ```
  - 컨테이너 생성 후 MySQL에서 열 수 o
<br>

- Docker **기본 명령어**
  - **docker run**: 컨테이너 실행
    - `d`: 백그라운드에서 컨테이너 실행
    - `it`: 인터랙티브 모드로 컨테이너 실행(터미널 입력)
    - `-name <name>`: 컨테이너에 이름 지정
  - **docker ps**: 실행 중인 컨테이너 확인
    - docker ps `a`/`q`/`f <filter>`: 모든 컨테이너(실행 아니어도)/컨테이너ID/특정조건 나열
  - **docker stop**: 실행 중인 컨테이너 중지
    - `-t <seconds>`: 컨테이너 중지될 때까지 기다리는 시간 지정
  - **docker rm***: 컨테이너 삭제
    - `f`/`v`: 강제 삭제/연결된 볼륨 삭제
  - **docker images**: 로컬에 저장된 모든 이미지 확인
    - `a`/`q`/`-filter`: 모든 이미지/이미지 ID/특정조건 이미지 나열
  - **docker pull/push**: 도커 이미지 다운/업로드
  - **docker exec**: 실행 중인 컨테이너에서 명령 실행
    - `it`: 인터랙티브 모드로 실행, 터미널 입력을 받을 수 있게 함 
    - `-user <user>`: 특정 사용자로 명령어 실행 
<br>

- **Docker UI Manager Tool**: Docker remote API용 웹 interface
  - 순수 client 측 구현 제공해 docker를 연결하고 편하게 관리
    ```linux
    docker run -d -p 9000:9000 --privileged -v /var/run/docker.sock:/var/run/docker.sock uifd/ui-for-docker
    ```
    - `-d`: 백그라운드 옵션, 실행중인 명령창이 보이지 않게 설정하는 것 
    - `-p`: 네트워크 설정, 외부 트래픽을 컨테이너 내부로 전달하기 위해 로컬 호스트 서버와 컨테이너를 매핑하는 트래픽 포워딩 설정 (80:80 -> 호스트 80포트와 컨테이너 80포트 연결)
    <p align="center">
    <img src="https://github.com/user-attachments/assets/6e02673d-e61f-44a7-914d-efcd78f81ad8" width="50%"/></p>
    <p align="center">브라우저에 접속하면 Dashboard 확인 가능</p>
  <br>
***
