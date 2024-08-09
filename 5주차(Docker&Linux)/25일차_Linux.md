###  08.09 (25일차)
---
교육 내용: Linux
---
사랑니 뽑았는데 아프기만 하고 거의 안 부었다. 얼음찜질의 효과인 듯? 벌써 기술세미나를 고민해야 한다니 시간이 너무 빠른 것 같다.. 이왕 하는 거 1등 하고 싶은데 욕심이 과한가? ㅎㅎ 간식 먹고 싶은데 가져와놓고 못 먹는 중. 슬프당. 점심 패스하고 단백질 쉐이크 먹었는데 간만에 여유로워서 나름 좋았다. 
<p align="center">
<img src="https://github.com/user-attachments/assets/8c2724b3-ba14-4218-aef4-f229558270b4" width="30%" /> </p><br>

- **쿼팅 문자**: 특수 의미를 가지는 특수문자의 성질을 제거하기 위한 문자
  - ~: home 디렉토리 나타냄
  - "~": 특수 성질 제거 가능 
<br><br>

- **셸 스크립트**: 실행할 명령어가 담긴 파일을 실행 가능
  - C 언어 기반 프로그래밍 가능
  - 재사용 및 공유 가능
  - 보통 `vi <파일이름>.sh` 안에 작성
  <p align="center">
  <img src="https://github.com/user-attachments/assets/663095d4-40cc-4047-92cd-5ff394754b40" width="60%" /> </p><br>

- **셔뱅**: 주석 안에 느낌표는 실행을 위한 기호
  - `#!bin/bash` -> bash에서 실행해줌 
<br><br>

- 리눅스는 디렉터리도 파일 취급
<br><br>

- **리눅스 조건문**
  - `if [조건문] ~ then 실행문 elif ~ else`
  - 조건문 안에서 띄어쓰기 필수 

- **permission**: 파일 접근 권한
  - 권한이 없으면 permission denied 에러 발생
  - 권한 확인: `ls -al`
    <p align="center">
    <img src="https://github.com/user-attachments/assets/c79775cb-6e4f-4ce1-98b8-4c503a5376a1 " width="60%" /> </p>
  - 파일표시 - 소유자 권한- 그룹 권한 - 다른 사용자 권한 순서
  - r:읽기, w:쓰기, x:실행
  - 숫자 표기법 사용 가능: r=4, w=2, x=1 의 합으로 나타냄
  - **chmod**: 권한 변경 -> `chmod [권한][변경파일/디렉토리]`
<br><br>


***
<br> 
