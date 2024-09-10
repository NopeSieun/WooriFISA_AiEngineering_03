###  09.00 (43일차)
---
교육 내용: AWS 서버 배포 
---
왜 자꾸 잘 때 입을 벌리고 자는지 알 수가 없다. 심지어 점점 크게 벌리고 자는 것 같음 -> 😪 
<br><br>

- **TroubleShooting**: AWS에서 DB 연결이 안 되어 있으면 django가 안 돌아감
  <p align="center">
  <img src="https://github.com/user-attachments/assets/054476ea-6f7e-42d2-bb77-46b39ac51b5a" width="60%" /> </p><br>

- **TroubleShooting - docker hub** - 버킷에 이미지 업로드
  - 도커 login부터
    ```linux
    docker login
    ```
  1. docker image로 만들어서 nopesieun/django-project:v1
     ```linux
     docker build -t nopesieun/django-project:v1 .
     docker push nopesieun/django-project:v1  
     ```
  2. run해보기 - env 파일을 `dockerignore`에 숨겨놔서 hub에 안 올라감
     - .env 파일을 Docker 이미지에 포함하는 대신, 컨테이너 실행 시 .env 파일을 직접 컨테이너에 전달
       ```linux
       docker run -d -p 8000:8000 --env-file .env nopesieun/django-project:v1
       ```
  3. 8000번에서 접속 되는지 확인
- 보안그룹을 편집해야 접속 가능
  <p align="center">
  <img src="https://github.com/user-attachments/assets/6762c0e7-d930-4816-8130-c77bfd9cf644" width="80%" /> </p><br>


- **RDS**: AWS에서 제공하는 클라우드 기반 DB
  - A, B, C, D 각각 접근 가능한 서브 네트워크 구성
<br><br>

- **EC2**: 텅 빈 상태의 컴퓨터를 주는 방식
  - 하나의 리눅스 환경을 나눠 사용하는 도커와는 다른 개념
  - **키 페어**: 외부에서 접근하기 위한 파일
  - 필요 패키지 설치 필요 (Docker..)
    - `sudo apt-get update`로 설치 가능한 패키지 리스트 불러온 후 설치
<br><br>

- **탄력적 IP**: 고정 ip를 할당할 수 있는 방법 
  - 안 쓰는데 가지고 있으면 안 쓰는 동안 돈을 부과
<br><br>

- **S3(simple storage service) Bucket**: 로컬 환경에서 지금껏 갖고 있었던 static 파일을 한 데 모아서 migration
  <br><br>

- **Nginx**: ‘가볍고 강력한’ 웹 서버 프로그램이 모토
  - 비동기적으로 연결을 진행하며 동시 커넥션의 부하를 분산 -> Apache 단점 보완
    - **Aphache**: 연결이 많아지면 많은 리소스를 필요로 함
  - 자원 낭비가 적음
<br><br>


- **로드밸런싱**: 서버가 부담하는 부하를 분산해줌
  - 많은 트래픽 대처 가능
  - 무중단 서비스 & 배포 가능

  - Docker 연결
    - vs에 dockerfile, docker-compose.yml(dockerignore) 생성 후 docker desktop 실행
    - `Docker compose up`
    - `nginx.conf`작성
      - 한 대 연결
      ```python
      events {
          worker_connections 1024; # events 섹션은 Nginx의 이벤트 처리와 관련된 설정 작성. 
      }
      ```
      - 서버 성능 최적화 및 과부하 방지
      ```python
          http {
          server {
              listen 80;
      
              location / {
                  proxy_pass http://web1:8000;
                  proxy_set_header Host $host;
                  proxy_set_header X-Real-IP $remote_addr;
                  proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                  proxy_set_header X-Forwarded-Proto $scheme;
              }
          }
      }
      ```
      - localhost로 접속 가능해짐
      <p align="center">
      <img src="https://github.com/user-attachments/assets/af301314-6893-44fd-8348-9336a84d4736" width="30%" /> </p>
    - 세 대 연결
      ```python
      http {
          upstream backend {
              ip_hash; # sticky session을 위해 ip_hash 사용
              server web1:8000;
              server web2:8001;
              server web3:8002;
          }
      
          server {
              listen 80;
      
              location / {
                  proxy_pass http://backend;
                  proxy_set_header Host $host;
                  proxy_set_header X-Real-IP $remote_addr;
                  proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                  proxy_set_header X-Forwarded-Proto $scheme;
                  proxy_set_header Cookie $http_cookie; # 로그인 세션을 유지하기 위해 쿠키 전달
              }
          }
      }
      ```
  - **ip_hash**: 요청이 클라이언트 IP주소로 해싱
    - 한번 요청 받은 서버가 있을 때 해당 서버에만 요청 분배
  <br><br>


     
***
