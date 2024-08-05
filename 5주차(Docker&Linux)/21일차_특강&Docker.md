###  08.05 (21일차)
---
교육 내용: IT 실무자들과 함께 하는 토크콘서트 - AWS 
---
월요일은 역시 힘들다. 아침에는 현직자 분께서 오셔서 강의 해주셨는데 진짜 열심히 살아야 저런 사람이 될 수 있구나를 느낄 수 있었다.. 슬 채용 공고가 올라오기 시작하는 시즌이라 마음이 싱숭생숭 하다. 올해 안에 꼭 취뽀 하고 싶은데 할 수 있을까? 이왕이면 두 달 안으로.. ㅠㅠ 
<br><br>

- **IT 실무자들과 함께 하는 토크콘서트 - AWS**
  - cloud architecture: 클라우드 기반 다양한 서비스 및 기술을 활용할 수 있도록 설계, 제공
  - 요즘 유행 기술: RAG(검색증강생성): 고객 요구사항에 알맞은 대처 방안을 빠르게 파악할 수 있음
  - 취업 꿀팁
    - 회사, 직무, 공고에 대해 깊이 알아보자: DART 분기보고서의 사업 내용 파악
    - 나의 이야기를 캡슐화: STAR 정리(Situation/Task/Action/Result) - 특히 기술/프로젝트 내용
    - 소통에 대한 히스토리(ex. 기획자들을 위한 세션을 준비)
    - 면접 족보 확인 - Linkdin
<br><br>

- Docker는 이미지를 기반으로 컨테이너를 생성하고 관리하는 방식 -> **Docker hub**에서 받아옴
  - 이미지 자체로 사용하진 못하고 컨테이너에 추가해서 사용하는 식(이미지 없으면 컨테이너 안 돌아감)
  - 이미지 형식 표기: **latest** - default 표기
  - 압충해온 이미지 확인
    ```linux
    (base) PS C:\Users\tldms> docker images
    REPOSITORY              TAG       IMAGE ID       CREATED        SIZE
    mysql                   latest    7ce93a845a8a   13 days ago    586MB
    ```
  - 삭제 시 중첩된 컨테이너 모두 삭제됨
    <p align="center">
    <img src="https://github.com/user-attachments/assets/098a1aa7-7e67-4349-8ab5-bd225b874087" width="70%" /> </p><br>

- **마운트**: 컨테이너 <-> 호스트로 파일 복사
  1. 컨테이너 -> 호스트
  - 데이터 유지용으로 도커에서 잘 사용함
  1. 호스트 컴퓨터에 docker 작업을 위한 폴더 만들기 -> 실행중인 경로 안에 복사
  2. docker 파일을 linking 해주기 -> 바로 업데이트 됨 
***
<br> 
