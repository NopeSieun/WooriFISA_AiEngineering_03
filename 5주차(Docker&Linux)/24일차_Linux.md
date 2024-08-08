###  08.00 (0일차)
---
교육 내용: linux
---
오늘은 치과를 가야해서 조퇴를 해야한다. 비가 갑자기 엄청 쏟아져서 놀랐는데 다행히 버스 갈아타고 내릴 때 딱 멈춰서 안 젖을 수 있었다. 요즘 체력이 떨어졌다고 생각하는 제일 큰 이유는 버스 안내음이 머리에 잘 안 들어온다는 것.. 그리고 자다 정신 차리기가 힘들어진 것.. 보약 대신 페레로로쉐 먹었다. 고급 초콜릿이기 때문에.. 그래서 내 목표는 3달 안으로 취업 성공해서 입사 전까지 푹 쉬기다. 운동도 좀 하고.. 여행도 가고.. 자고.. 자고.. 또 자고.. 계속 자고..
<br><br>

- 리눅스는 한 번에 하나만 처리해야 함
  - 강제로 한 번에 처리 가능 (ex. `rm -r`)
<br><br>

- 우분투 root 접속방법
  1. docker desktop에서 먼저 접속
  2. Exec에서 명령 작성
     ```linux
     service ssh
     service ssh start
     ```
  3. ubuntu 접속 후 연결
  <p align="center">
  <img src="https://github.com/user-attachments/assets/f3391f48-4c7b-4ba5-8173-b1e1bb8f3e14" width="50%" /> </p><br>

- **zombie process**: 실행은 종료되었으나 삭제는 안 된 프로세스
  - 부모 프로세스는 없는데 자식 프로세스가 남아있는 경우
    <p align="center">
    <img src="https://github.com/user-attachments/assets/8a260608-9d37-4566-b03e-1d8bdd4d20e3" width="60%" /> </p>
  - `kill`로 죽일 수 있음
 <br><br>

- **하드링크**: 한 파일에 이름을 여러 개 부여(원본과 동일 위치를 가리키는 새 디렉토리 항목 생성)
  - 디렉토리에 대해서는 생성할 수 x(파일만 가능)
  - 원본이 삭제되어도 사본이 남아있게 됨
    <p align="center">
    <img src="https://github.com/user-attachments/assets/e1eba6e1-8b1f-49d4-95ee-140e883fe2b6" width="50%" /> </p><br>


- **소프트링크**: 파일이나 디렉토리 경로를 가리키는 파일
  - 파일, 디렉토리 모두 생성 가능
  - 원본 삭제되면 깨짐(`cat softlink.txt` -> 찾을 수 없음 error 발생) 
    <p align="center">
    <img src="https://github.com/user-attachments/assets/03c35c46-1d5a-40b1-b01f-a6924da68c07" width="60%"/> </p><br>

- **vi 편집기**
  - `vi 1.txt`: txt 파일 생성 및 편집 가능
  - `:wq`: 저장 & 나가기
  - `cat 1.txt`: 작성 내용 확인
  - `awk`: 원하는 열만 출력 가능
    <p align="center">
    <img src="https://github.com/user-attachments/assets/e16046ea-360e-4a78-ad9e-bd23e9908f4a" width="50%" /> </p>
  - **nano**: vi 이전의 편집기(vi보다 쉽게 사용 가능)

***
<br> 
