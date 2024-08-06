###  08.06 (22일차)
---
교육 내용: Docker
---
아침부터 머리가 멍하다. 몸이 마치 like 해파리☠ 얼음물 먹으려고 했는데 오늘도 따뜻한 물 먹어야겠다. 비가 와서 그런지는 모르겠는데 날씨 좋다가 내리기 직전부터 갑자기 비 와서 어이 없었음. 

<p align="center">
<img src="https://github.com/user-attachments/assets/cdb75b47-4ae0-4636-8321-9c95bc3c26db" width="30%" />   <img src="https://github.com/user-attachments/assets/2b743ff6-f113-4e51-afa8-98700cc19bea" width="30%" />
 </p>
<p align="center">
마롱이 케잌ㅋㅋㅋ 마롱이 잘 지내고 있니..부럽다..</p><br><br>

- Docker desktop 프로그램을 열어두지 않으면 터미널에서 조작 불가(까먹기 쉬움) <br><br>
- **image 삭제**: `docker images` 확인 후 `docker rmi <컨테이너 id>` 삭제 <br>
- **commit**: 절취선 역할 -> 현재 상태의 컨테이너를 기반으로 새로운 이미지를 생성
  1. 컨테이너 실행 및 변경
     ```linux
     docker run -it ubuntu /bin/bash
     ```
  2. 컨테이너 커밋
     ```linux
     docker commit container_id new_image_name
     ```
  3. 이미지 확인
     ```linux
     docker images
     ```
  4. tag 적용 -> 별명 짓기
     ```linux
     docker tag <image_name> <경로>:버전
     ```
  5. Docker hub에 이미지 업로드
     ```linux
     docker push <경로>:버전
     ```
  <br>

- **Dockerfile**: 위의 과정들이 너무 길어서 번거로울 때 text로 정의해두기 가능
  - Dockfile을 먼저 생성 후 빌드 
  <p align="center">
  <img src="https://github.com/user-attachments/assets/fc4d9003-7f31-4048-86bf-f79eaee0be15" width="70%" /> </p><br>


<br>

***
<br> 
