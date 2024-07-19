07.19 (10일차)
---
교육 내용: Pandas, matplotlib, seaborn
---
요즘 내 마뱀이 미모 리즈 찍는 중 ㅎㅎ 주머니에 데리고 다니고 싶다. 아침에 헤어질 때 너무 슬펐음.. 간만에 비가 안 와서 일찍 도착할 수 있었다. 그리고 오늘은 지코바 먹어서 행복했다~ 치킨 최고다! 요즘 점점 건물 밖으로 안 나가려고 하는 것 같다. 귀찮기 때문.. 그리고 키링이 귀엽다. 
<p align="center">
<img src="https://github.com/user-attachments/assets/8a337efd-c3d6-434a-95cc-58111092f681" width="30%" /><img src="https://github.com/user-attachments/assets/877b4f2b-4617-4c20-844a-c9d49bc56117" width="30%" /><img src="https://github.com/user-attachments/assets/5e028bc9-9002-4761-bccc-cb3e01706d5b" width="30%" /></p>

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
  - **contains, startswith, endwith**: 일부/처음/끝이 일치하면 결과 출력(문자열에서 정규식 적용 가능)
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
  <br>
- **파생변수**: 이미 가지고 있는 데이터를 특정 방식으로 재가공해서 새로운 변수를 생성<br><br>
- **EDA(Exploratory Data Analysis)**: 원시자료(Raw Data)를 탐색하고, 특징과 구조로부터 얻은 정보를 바탕으로 통계모형을 만드는 분석법
  - 통계적 방법으로 직관적인 관찰<br><br>
- 통계학 vs 머신러닝
  - **통계학**: 수집된 자료에 대한 분석(과거에 대한 설명) -> 과거, 덩어리, 경향성
  - **머신러닝**: 새로 들어올 자료에 대한 추론(inference) -> 미래, 개별적, 특성<br><br>
- CDA vs EDA
  - **확증적 데이터 분석(CDA: Confirmatory Data Analysis)**: 가설 설정->데이터수짐->통계분석->가설검증
  - **탐색적 데이터 분석(EDA: Exploratory Data Analysis)**: 데이터수집->시각화탐색->패턴도출->인사이트발견<br><br>
- **메타데이터**: 데이터의 데이터<br><br>
- **MATPLOTLIB**: 파이썬에서 매트랩과 유사한 그래프 표시를 가능하게 함
<p align="center">
  <img src="https://github.com/user-attachments/assets/be024439-3562-4d9e-a985-5ee3318e3d9d" width="50%" /> </p><br>
  
- **데이터 시각화**: 자료로부터 정보를 습득하는 시간 절감
  - 변수의 개수, 종류에 따라 다양한 시각화 방법 활용
  - 질적 변수 vs 범주형 변수: 둘 다 비율적 의미
    - **질적변수**
      - 명목형 변수변수나 크기가 순서에 대한 의미를 부여할 수 없으면(평균 의미x)
      - 순서형 변수: 부여할 수 있으면(평균 의미 o)
      - 연산 불가 
    - **범주형 변수**: 조사 대상을 범주로 구분하여 측정된 변수 
   - **양적변수**
     - 이산형: 변수가 취할 수 있는 값을 하나하나 셀 수 o
     - 연속형: 변수가 구간 안의 모든 값을 가질 수 o<br><br>



***
<small>(matplotlib 이미지 출처: [링크](https://camo.githubusercontent.com/bc3b143766ed68eb6a851900c317c5d9222eb1471888942afb35137aa5141557/68747470733a2f2f6d6174706c6f746c69622e6f72672f63686561747368656574732f63686561747368656574732d312e706e67))</small><br>
<small>(트리맵 이미지 출처: [링크](https://plotly.com/python/treemaps/))</small><br>
<small>(누적 그래프 이미지 출처: [링크](https://ppss.kr/archives/21653))</small><br>
<small>(산점도 이미지 출처: [링크](https://www.finereport.com/kr/버블-차트/))</small>
