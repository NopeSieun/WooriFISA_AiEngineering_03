###  07.15 (6일차)
---
교육 내용: 모듈
---
6시 반에 나와야 하는데 일어난 사람.. 저요.. 월요일은 평소보다 30분 넘게 걸리는 날이라서 일찍 나왔어야 했는데 대실패 했고요. 그치만 5분만에 나왔다.. 나 멋지다. 그치만 지각 직전에 출근해서 커피 못 마시고 죽어가고 있는 중..
<br><br>
- 코드를 어느 상황에서 쓰는지 궁금할 땐 깃에 검색해보자 
- **모듈**: 이미 만들어진 파이썬 소스파일(라이브러리)
  - 파이썬 소스파일은 모듈로 사용할 수 ㅇ (재사용성을 위함) 
  - 위치를 미리 지정해놓고 항상 그 위치에서 가져오도록 만들어 놓음
  모듈 생성
  ```python
  %%writefile /content/drive/MyDrive/ITStudy/math1.py
  
  #파이썬 코드, 텍스트 파일에 들어갈 내용 
  
  def add(x, y):
      return x+y
  
  def minus(x, y):
      return x-y
  
  PI = 3.14
  ```
  모듈 사용 첫번째 방법(전체 경로로 불러오기) 
  ```python
  #. 으로 파일 혹은 폴더를 구분합니다. 
  import drive.MyDrive.ITStudy.math1
  
  drive.MyDrive.ITStudy.math1.add(2,4)
  ```
  모듈 사용 두번째 방법(별칭을 만들어서 짧게 만들기)
  ```python
  import drive.MyDrive.ITStudy.math1 as m1
  
  m1.add(2,3)
  ```
  모듈 사용 세번째 방법(쓰려는 특정 함수명만/모든 함수 불러오기) 
  ```python
  from drive.MyDrive.ITStudy.math1 import add
  
  add(3,4)
  ```
  ```python
  from drive.MyDrive.ITStudy import math1

  math1.add(3,4)
  ```
  - 이미 모듈을 불러와놓고 원본을 재수정 -> 기본적으로는 다시 불러도 덮어쓸 수 x
  - 파일명은 되도록 많이 사용하는 패키지, 모듈 이름과 겹치지 않도록 작성<br>
  <img src="https://github.com/user-attachments/assets/cf881f16-ca99-463e-9c58-f260bfbe72cc" width="50%" /><br>
  - My Drive에서 마운트 해서 저장하면 새로고침 시 날아가지 x





***
<br> 

