###  07.15 (6일차)
---
교육 내용: 모듈, 예외처리
---
6시 반에 나와야 하는데 일어난 사람.. 저요.. 월요일은 평소보다 30분 넘게 걸리는 날이라서 일찍 나왔어야 했는데 대실패 했고요. 그치만 5분만에 나왔다.. 나 멋지다. 그치만 지각 직전에 출근해서 커피 못 마시고 죽어가고 있는 중..<br>
<img src="https://github.com/user-attachments/assets/9401e796-0f56-4f5e-ba11-912d61860ba9" width="50%" /> <br>
하루종일 지내려면 폭신폭신 슬리퍼 필수

<br><br>
- 코드를 어느 상황에서 쓰는지 궁금할 땐 깃에 검색해보자 <br><br>
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
  #. 으로 파일 혹은 폴더를 구분
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
    <br><br>
- **예외처리**<br>
  <img src="https://github.com/user-attachments/assets/fb1ae3c0-df69-409c-8b05-fcb26574b2c5" width="50%"/><br>
  1. LBYL(Look Before You Leap): 에러가 나기 전에 잘 처리해라
     - 완벽하게 에러를 예측하고 전부 처리하는 것은 불가능 
  3. EAFP(It's Easier Ask Forgiveness Than Permission): 일단 실행하고 에러가 발생하면 처리해라
     - 파이썬 표준에서는 EAFP 방법을 권장<br><br>
  - try ~ except: 에러 방지 코드
    ```python
      try: # 에러가 나는지 감시
          num = input('0 이상의 정수 입력:')
          if int(num) >= 0:
              print('참')
          else:
              print('다시 입력하세요')
      # 예외를 여러가지 경우로 나누어서 처리할 때는 하위 예외 > 상위 예외 순으로 처리
      # 상위예외를 먼저 작성하면 영영 하위 예외는 동작하지 않기 때문
      # 예외가 달라도 같은 방식으로 처리하려면 같은 except 구문 내에 ( , )로 구분
      except (ValueError, TypeError) as e:
          print('에러 발생 - ValueError or TypeError', e)
      except Exception as e:
           print('에러 발생 - BaseException', e)
      except BaseException as e:
           print('에러 발생 - BaseException', e)
      else:
          print('try 구문이 성공적으로 에러 없이 완료됐습니다.')
      finally:
          print('try 구문이 성공하든 실패하든 동작합니다.')
     ```
  - 여러 군데에서 인자 등을 바꿔가며 함수를 재사용한다면 실행하는 부분에 예외처리 하는 것이 좋음
  - **EOF**: 예외를 응용하는 사례
    - 파이썬은 EOF를 처리하지 못하므로 언어 끝을 예외처리
      ```python
      while True:
        try:
            read = input('c:\>')
            print(read)
        except KeyboardInterrupt:
            print('실행이 강제종료1 되었습니다.')
            break
        except EOFError: 
            print('실행이 강제종료 되었습니다.') #ctrl+d
            break
      ```
    - **raise**로 강제 예외 발생
      ```python
      while True:
        read = input('c:\>')
        if read != 'x':
            print(read)
        else:
            raise EOFError #raise 명령어로 강제로 에러를 발생시킬 수 o
      ```
      <br>
- **표준출력**
  - print(): 파이썬의 표준 출력 함수
  - 텍스트 데이터: w-쓰기모드, r-읽기모드, a-추가모드
  - 바이너리 데이터: wb-쓰기모드, rb-읽기모드, ab-추가모드



***
<br> 

