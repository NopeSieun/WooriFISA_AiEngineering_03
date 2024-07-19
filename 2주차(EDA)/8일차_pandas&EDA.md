07.19 (10일차)
---
교육 내용: Pandas, matplotlib, seaborn
---
요즘 내 마뱀이 미모 리즈 찍는 중 ㅎㅎ 주머니에 데리고 다니고 싶다. 아침에 헤어질 때 너무 슬펐음.. 간만에 비가 안 와서 일찍 도착할 수 있었다. 그리고 오늘은 지코바 먹어서 행복했다~ 치킨 최고다! 요즘 점점 건물 밖으로 안 나가려고 하는 것 같다. 귀찮기 때문.. 그리고 키링이 귀엽다. 
<p align="center">
<img src="https://github.com/user-attachments/assets/8a337efd-c3d6-434a-95cc-58111092f681" width="30%" /><img src="https://github.com/user-attachments/assets/877b4f2b-4617-4c20-844a-c9d49bc56117" width="30%" /><img src="https://github.com/user-attachments/assets/5e028bc9-9002-4761-bccc-cb3e01706d5b" width="30%" /></p>

 </p>

<br><br>
- **Function apply**: 필요 부분만 가지고 와서 동일 함수를 반복 사용하기 위한 메소드
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
- **MATPLOTLIB**: 파이썬에서 매트랩과 유사한 그래프 표시 가능(판다스에 연계된 시각화 도구)
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
- matplotlib 사용법
  1) 도화지 그리기
  2) 축 얹기
  3) x,y 출력
  ```python
  plt.figure() #도화지
  plt.axes() #축
  x = [0, 2, 4, 6, 8]
  y = [1, 2, 3, 4, 5] #값 설정
  plt.plot(x,y); # ; - 메모리 출력 제거
  plt.plot(x,y,marker='x',linestyle='--', color='red') #스타일 설정 가능
  plt.axis([-5,50,-5,5]) #좌, 우, 하, 상 - 축의 범위 고정할 때 
  plt.show() #그래프의 단위 설정(위 내용까지만 하나의 도화지를 공유)
  ```
<p align="center">
<img src="https://github.com/user-attachments/assets/1e1c0e0e-ed4b-4cb7-9de3-dd0681f282c4" width="50%" /> </p><br>

- **축(axis) & 레이블(label)**: 축의 범위 고정, 정렬 및 범위 설정 가능
  ```python
  plt.plot(np.random.randn(30).cumsum(), 'g-.x', label='2022년')
  plt.plot(np.random.randn(30).cumsum(), 'b--^', label='2023년')
  plt.plot(np.random.randn(30).cumsum(), 'b--^', label='2023년')
  plt.plot(np.random.randn(30).cumsum(), 'b--^', label='2023년')
  plt.plot(np.random.randn(30).cumsum(), 'b--^', label='2023년')
  plt.title('연도별 분기별 매출 차이') # 제목
  plt.xlabel('분기') # x축 제목
  plt.ylabel('매출(단위: 억원)') # y축 제목
  plt.axis('equal') # 시각화된 그래프를 중앙에 그릴 때
  plt.legend(loc='upper right', frameon=False) # 범례 loc=범례 위치 고정, frameon=False 범례 뒤 음영 제거
  ```
<p align="center">
<img src="https://github.com/user-attachments/assets/91ae2537-8e56-48e0-b3e6-b46e4af20787" width="50%" /> </p><br>

- **폰트**: 폰트관리자를 통해 외부에서 지정 후 사용 가능
  ```python
  font1 = {'family': 'NanumSquareRound', 'size':20, 'color':'red'} # 계속 쓰고 싶은 폰트 규격이 있을 때
  ```
  <br>
  
- **Bar Plots**: 범주형 데이터 - 개수(전체 중의 비율
  ```python
  plt.bar(x1, y1, label="Blue Bar", color='b')
  plt.bar(x2, y2, label="Green Bar", color='g')
  plt.plot()
  
  plt.xlabel("bar number")
  plt.ylabel("bar height")
  plt.title("Bar Chart Example")
  plt.legend()
  plt.show()
  ```
<p align="center">
<img src="https://github.com/user-attachments/assets/93ec4844-579e-428a-b370-6bfed0c31fbc" width="50%" /> </p><br>

- **히스토그램(Histograms)**: 연속형 데이터를 특정 구간으로 나눠서 그 범위에 해당하는 데이터 빈도수를 막대형태로 표시
  - bins: 구간의 개수 설정
  - 양적 변수 - 데이터의 중심 경향 / 변동성 / 이상치 등을 쉽게 시각적으로 판단할 수 o
  ```python
  plt.hist(n, bins=20) # bins 히스토그램의 구간
  plt.title("Histogram")
  plt.show()

  plt.hist(n, cumulative=True, bins=20) # cumulative - 누적그래프
  plt.title("Cumulative Histogram")
  plt.show()
  ```
<p align="center">
<img src="https://github.com/user-attachments/assets/792ec7d2-c7eb-4ee3-8811-ced292d6c2b1" width="39.7%" /><img src="https://github.com/user-attachments/assets/16b7840c-59c0-46ae-a08b-d60aeab28c12" width="40%" />
 </p><br>

- **Scatter Plots**: 연속형 변수와 연속형 변수의 관계성 파악하기 위해 사용
  ```python
  plt.scatter(x1, y1)
  plt.scatter(x2, y2, marker='v', color='r')
  plt.scatter(x2, y3, marker='^', color='m')
  plt.title('Scatter Plot Example')
  plt.show()
  ```
<p align="center">
<img src="https://github.com/user-attachments/assets/cc0a6cbb-1815-421f-8e8a-e639f06273dc" width="50%" /> </p><br>

- **Subplot**: 여러 개를 하나의 배경에 모두 나타낼 때 사용 -> subplot2grid 사용
  - 그리드: 웹 서비스에서 하나의 화면을 나누는 박스의 단위 <br><br>
- **Seaborn**: Matplotlib 기반으로 다양한 테마와 차트 기능을 추가한 시각화 패키지
  ```python
  import seaborn as sns

  sns.set_theme(style="ticks")
  plt.figure(figsize=(20, 20))   # 그래프 크기
  sns.lmplot(x="x", y="y", col="dataset", hue="dataset", data=df,  # hue : 컬럼명 기준으로 데이터 색깔 구분해줌
             col_wrap=2, ci=None, palette="muted", height=4, # col_wrap : 한 줄에 몇개의 그래프를 그릴지, palette: 색상 컨셉 지정
             scatter_kws={"s": 100, "alpha": 0.7}); # scatter_kws : 점의 색깔, 투명도 등 속성 지정
  
  plt.savefig('lm.png') # 파일로 저장
  plt.show() # close()
  ```
<p align="center">
<img src="https://github.com/user-attachments/assets/70b50a13-881f-4d5e-b9cf-e57ac9afbb9c" width="50%" /> </p><br>



***
<small>(matplotlib 이미지 출처: [링크](https://camo.githubusercontent.com/bc3b143766ed68eb6a851900c317c5d9222eb1471888942afb35137aa5141557/68747470733a2f2f6d6174706c6f746c69622e6f72672f63686561747368656574732f63686561747368656574732d312e706e67))</small><br>
<small>(seaborn 이미지 출처: [링크](https://wikidocs.net/86290))</small>
