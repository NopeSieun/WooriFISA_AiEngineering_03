###  09.00 (43일차)
---
교육 내용: AWS 서버 배포 
---
왜 자꾸 잘 때 입을 벌리고 자는지 알 수가 없다. 
<br><br>

- **TroubleShooting**: AWS에서 DB 연결이 안 되어 있으면 django가 안 돌아감
  <p align="center">
  <img src="https://github.com/user-attachments/assets/054476ea-6f7e-42d2-bb77-46b39ac51b5a" width="60%" /> </p><br>

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
***
