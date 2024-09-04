###  09.04 (42일차)
---
교육 내용: AWS
---
슬 아침이 쌀쌀해지고 있어서 버스들이 에어컨을 잘 안 켜고 있는데, 그래서 잠을 너무 깊게 자게 된다. 겨울에 히터 틀면 기절할 듯..
<p align="center">
<img src="https://github.com/user-attachments/assets/878431b5-c6a6-4719-bbd5-5f24e8fd4d95" width="30%" /> </p><br>
<p align="center">AWS 하다가 폭주하고 말랑이 장난감 터뜨리고 있는 언니 </p>


<br><br>

- **TroubleShooting**
  - 인스턴스 생성 시 내 VPC를 선택하지 않으면 내가 만들어둔 보안 그룹에 접근할 수 x
<br><br>

- VPC 안에 설정하는 것
  - **VPC**: 가상 네트워크
  - **서브넷**: VPC 내 IP 주소 블롱(퍼블릭/프라이빗)
  - **라우팅 테이블**: 네트워크 트래픽 전달 경로 지정
  - **인터넷 게이트웨이**: 퍼블릭 서브넷의 인스턴스가 인터넷에 접근할 수 있도록 함
  - **NAT 게이트웨이**: 프라이빗 서브넷의 인스턴스가 인터넷에 접근할 수 있도록 함 (인터넷->프라이빗 차단)
  - **보안그룹**: 인스턴스 레벨의 가상 방화벽 
<br><br>

- 인스턴스가 중지되면 도커도 같이 중지
  - 다시 실행
    ```linux
    sudo docker start ID
    ```
  - sudo 없이 docker 사용하는 방법
    ```linux
    sudo groupadd docker
    sudo usermod -aG docker ${USER} #권한 변경
    sudo service docker restart
    ```
<br>

- **S3**: 파일을 객체 단위로 관리
  - **bucket**: 디렉터리와 객체를 저장하는 컨테이너 (최상위 디렉토리) -> 유일해야 함
  - **object**: 파일+메타데이터
  - **key**: 객체 찾기 위한 고유 식별자
  - **region**: 버킷 위치 지정으로 지연 시간/비용 최소화
<br><br>

- **버킷 생성**
  - 엑세스 차단 시 버킷에 업로드해둔 이미지 등을 외부에서 확인할 수 x
    <p align="center">
    <img src="https://github.com/user-attachments/assets/4d0f5604-e0d9-481c-b3f0-d215e9fb2337" width="40%" /> </p>
  - 이미지 업로드 -> ACL 설정에서 퍼블릭 설정
    <p align="center">
    <img src="https://github.com/user-attachments/assets/6930311e-ad3a-4301-b15a-24b6030180bf" width="40%" /> </p>
<br><br>

- 보안 자격 증명
  - VS 코드에서 사용하기 위해서 자격 증명이 필요함 
    <p align="center">
    <img src="https://github.com/user-attachments/assets/1a82df58-6173-4b20-8aab-c6005461f6d1" width="20%" /> </p>
  - 엑세스 키 생성 
    <p align="center">
    <img src="https://github.com/user-attachments/assets/131243e7-3cf4-4ddd-9fb3-32590b26d08c" width="50%" /> </p>
  - 버킷 정책 설정
    <p align="center">
    <img src="https://github.com/user-attachments/assets/c452946c-d041-4106-8359-7331af90be8e" width="40%" /> </p>




