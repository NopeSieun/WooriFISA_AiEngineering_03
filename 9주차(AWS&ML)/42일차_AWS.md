###  09.04 (42일차)
---
교육 내용: AWS
---
슬 아침이 쌀쌀해지고 있어서 버스들이 에어컨을 잘 안 켜고 있는데, 그래서 잠을 너무 깊게 자게 된다. 겨울에 히터 틀면 기절할 듯..
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
    <p align="center">
    <img src="https://github.com/user-attachments/assets/51e87eeb-3b50-4b34-84e4-a50b91ab1f5f" width="50%" /> </p><br>
    
    <br><br>

