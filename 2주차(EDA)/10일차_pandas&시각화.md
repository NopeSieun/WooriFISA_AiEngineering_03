###  07.19 (10일차)
---
교육 내용: Pandas, matplotlib, seaborn
---
요즘 내 마뱀이 미모 리즈 찍는 중 ㅎㅎ 주머니에 데리고 다니고 싶다. 간만에 비가 안 와서 일찍 도착할 수 있었다. 근데 조금 감기 걸린 것 같기도 하다. 왜냐면 코가 맹맹쓰.. 오늘은 지코바 먹는 날이라 행복하다~ 치킨 최고 
<p align="center">
<img src="https://github.com/user-attachments/assets/8a337efd-c3d6-434a-95cc-58111092f681" width="30%" /><img src="https://github.com/user-attachments/assets/877b4f2b-4617-4c20-844a-c9d49bc56117" width="30%" />
 </p>

<br><br>
- **Function apply**:필요 부분만 가지고 와서 동일 함수를 반복 사용하기 위한 메소드
  - 모든 행, 열에 대해 같은 함수 반복 적용
    ```python
    jjangu_list.apply(func) #열 단위
    jjangu_list.apply(func, axis=1) #행 단위
    ```
  - 함수를 만들고 broadcasting 활용하는 방식
    ```python
    def add_one(x):
      retrurn x+1
    list_.테스트점수.apply(add_one)
    ```
    <br>
- **Regular Expression**: 원하는 문자열을 찿아야 하는 경우(값 자체에서 or 컬럼/인덱스에서)
  - **filter**: 컬럼명에서 원하는 문자/문자열 쉽게 검색
    ```python
    jjangu_list.filter(items=['반']) #반 컬럼 추출
    jjangu_list.filter(regex = '담.') #담으로 시작하는 컬럼 추출(정규식)
    jjangu_list.filter(like='스트') #중간단어
    jjangu_list.filter(items=[2,10], axis=0) #인덱스로 찾기
    ```
  - **isin**: 데이터에서 원하는 문자/문자열을 쉽게 검색 가능
    - 딱 일치하는 문자열만 검색 가능 
    ```python
    jjangu_list[jjangu_list.이름.isin(['짱구','훈이'])]
    ```
  - **contains, startswith, endwith** - 일부/처음/끝이 일치하면 결과 출력(문자열에서 정규식 적용 가능)
    ```python
    contains = jjangu_list[jjangu_list.이름.str.contains('구')]
    jjangu_list[jjangu_list.이름.str.contains('^짱.$', regex=True)]
    #regex = True: 정규식으로 해석하겠다는 뜻
    contries[contries.capital.str.contains('ams',case=False)]
    #case = False 대소문자 가리지 x
    ```
  - *정규식 정리
    ```python
    # ^ : ~ 시작하는, $ : ~끝나는
    # . : 임의의 한 문자
    # * : 0개 이상의 문자 (직전 문자가 0번 이상 반복)
    # + : 1개 이상의 문자 (직전 문자가 1번 이상 반복)
    # ? : 0개 또는 1개의 문자 (직전 문자가 0번 또는 1번 반복)
    # {n} : 정확히 n개의 문자 (직전 문자가 n번 반복)
    # {n,} : n개 이상의 문자 (직전 문자가 n번 이상 반복)
    # {n,m} : n개에서 m개의 문자 (직전 문자가 n번 이상 m번 이하 반복)
    ```
    <br>
- **str.replace**: replace는 정규식 지원 x -> str 붙이면 일부 포함해도 변경 가능
  ```python
  jjangu_list2.이름 = jjangu_list2.이름.str.replace('짱','장') #짱이 들어간 모든 글자 변경
  ```
- **파생변수**: 이미 가지고 있는 데이터를 특정 방식으로 재가공해서 새로운 변수를 생성


***
<br> 
