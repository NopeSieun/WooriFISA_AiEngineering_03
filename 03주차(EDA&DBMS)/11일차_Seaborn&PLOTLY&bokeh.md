###  07.22 (11일차)
---
교육 내용: Seaborn, PLOTLY
---
지하철로 오려면 3번 갈아타고 버스까지 총 4번 갈아타야 하는 공포의 상암.. 거기에 이제 지하철 무조건 반대로 타는 길치가 혼자 찾아와야하는.. 마라탕 먹자고 금요일부터 다같이 약속해놓고 다같이 김치도가 가서 밥 말아먹었다. 비 오면 김찌에 밥 땡기는 한국인들 ㅎ <br>
<p align="center">
<img src="https://github.com/user-attachments/assets/1b396d38-71d7-42f6-93f3-ef6f772c6793" width="50%" /> </p><br>

<br><br>
- **판다스의 categories**: 컴퓨터가 012 ABC 순서로만 데이터를 인식하므로 원하는 방식으로 특정 데이터를 재정렬해서 간직하는 자료형 존재
  - 많은 파일을 관리할 때 활용되는 자료형
<p align="center">
<img src="https://github.com/user-attachments/assets/d2d0f63a-14ab-4643-ac63-6edc1da7b078" width="50%" /> </p><br>

- **Seaborn**: Matplotlib 기반 시각화 패키지 -> 함수가 쉽고 결과가 직관적
<p align="center">
<img src="https://github.com/user-attachments/assets/a4a1cbbe-f4ba-45e7-ad7f-a968ce860871" width="50%" /> </p><br>
<br>

- **Line Plot**: 연속적이므로 시계열 데이터에 주로 사용 -> 트렌드 파악/추적
  - 분절형 vs 연속형 시간데이터: 분절형은 특정 시점/시간으로 구간 설정
    ```python
    sns.lineplot(data=tips, x='day', y='total_bill', estimator='sum', ci=None)
    #연속형 변수를 x축으로 놓고 트렌드 파악
    #ci: 신뢰구간 무시
    ```

<p align="center">
<img src="https://github.com/user-attachments/assets/8548d6b1-1666-49ee-8dae-2eb894df89f8" width="50%" /> </p><br>

- **Scatter Plot(산점도)**: 연속형 x에 대한 연속형 y값의 지표 시각화(ex.지도(위도,경도))
  - 회귀분석, 상관분석, 정규성 검정에 확인
    ```python
    sns.scatterplot(data=tips, x='total_bill', y='tip', hue='smoker') 
    #흡연과는 유의미한 연관성이 없음 
    ```
<p align="center">
<img src="https://github.com/user-attachments/assets/d790a553-e70a-471a-b62f-a5aaa8629d06" width="50%" /> </p><br>

  - 색을 나눠 표현 시 카테고리가 여러개거나 연속형 변수면 표현하지 않는 것이 나음<br><br>
- **Count Plot vs distplot**
  - count plot: 카테고리 값별로 데이터가 얼마나 있는지 표시(데이터프레임에만 사용), 질적변수
    ```pythom
    sns.countplot(tips, x='day') #질적변수
    ```
<p align="center">
<img src="https://github.com/user-attachments/assets/cb60f2df-b0e2-4612-abd8-04652cbc521e" width="50%" /> </p><br>

  - dist plot: 양적변수를 임의의 구간으로 나눠 구간 안의 개수 카운트(히스토그램)
  - 전체 데이터의 합을 1로 여기고 구간에 따른 분포 계산해서 출력(확률밀도함수)
    - histplot과는 차이가 있음 
    ```python
    sns.distplot(tips['total_bill'], bins=10)
    #sns.distplot(tips['total_bill'], bins= 10, kde=False): 히스토그램과 동일한 결과
    #rug=True: 구간별 밀도 상세히 확인하고 싶을 때 
    ```
    <p align="center">
    <img src="https://github.com/user-attachments/assets/5ad43e0d-a4f5-482e-9ef1-554737972403" width="50%" /> </p><br>
  
- **kdeplot**: kernel density, 커널 함수 겹쳐서 히스토그램보다 부드러운 분포 곡선 보여줌 <br><br>
- **boxplot**: 5가지 주요 통계량 시각적 표현(여러 그룹 간 데이터 비교)
  - 데이터의 신뢰구간과 이상치, 분포 빠르게 파악 가능
  - 카테고리(질적) 변수 - 연속형(양적) 변수 사이의 관계를 확인
<p align="center">
<img src="https://github.com/user-attachments/assets/897c0873-c27c-48e6-a024-5b4dd97575d6" width="20%" /> </p><br>

  ```python
  sns.boxplot(data=tips, x='sex', y='total_bill', hue='sex')
  ```

  <p align="center">
  <img src="https://github.com/user-attachments/assets/696f37e7-4c5d-4f17-9b03-257b212e3154" width="50%" /> </p><br>

  ```python
  sns.violinplot(tips, x='sex', y='total_bill', hue='sex', inner='quart',  linewidth=1, split=True)
  sns.despine(offset=10, trim=True)   
  ```
    
  <p align="center">
    <img src="https://github.com/user-attachments/assets/2fe5a27e-48da-4d89-8800-8865ec614644" width="50%" /> </p><br>

- **violin plot**: 박스플롯처럼 일변량, 연속형 데이터 분포 설명을 위한 그래프
  - kernel density curve + box plot
    ```python
    sns.violinplot(data=tips, x='tip', y='day', hue='day')
    ```
      <p align="center">
      <img src="https://github.com/user-attachments/assets/aeffa6c5-a11a-44f7-856d-62f1a1dd384b" width="50%" /> </p><br> 

- **Heatmap**: 열과 지도의 합친 말, 데이터를 색상으로 표현 -> 상관관계 분석
  ```python
  sns.set_theme()
  
  # Load the example flights dataset and convert to long-form
  flights_long = sns.load_dataset("flights")
  flights = (
      flights_long
      .pivot(index="month", columns="year", values="passengers")
  )
  
  # Draw a heatmap with the numeric values in each cell
  f, ax = plt.subplots(figsize=(9, 6))
  sns.heatmap(flights, fmt="d", linewidths=.5, ax=ax) # annotation
  ```
  <p align="center">
    <img src="https://github.com/user-attachments/assets/f5c7e50e-9911-4315-a28b-08a33dc81dd4" width="50%" /> </p><br>

- **pair plot**: 3차원 이상의 데이터일 때 grid 형태로 데이터 열의 조합에 대한 스캐터 플롯을 그려주는 함수
  ```python
  sns.pairplot(tips, hue='day')
  ```
  <p align="center">
    <img src="https://github.com/user-attachments/assets/5ff8577f-3d65-4448-b2d7-541533ca3476" width="50%" /> </p><br>

- **PLOTLY**: 인터랙티브 그래프 생성
  - dict 형태로 명령어 작성 후 JSON 형식으로 저장
  - 다양한 function
    ```python
    import plotly.io as pio # Plotly input output
    import plotly.express as px # 빠르게 그리는 방법
    import plotly.graph_objects as go # 디테일한 설정
    import plotly.figure_factory as ff # 템플릿 불러오기
    from plotly.subplots import make_subplots # subplot 만들기
    from plotly.validators.scatter.marker import SymbolValidator # Symbol 꾸미기에 사용됨
    ```
    ```python
    import numpy as np
    import pandas as pd
    from urllib.request import urlopen
    import json #필요 모듈 import
    ```
  - fig 객체 - 기본적으로 JSON 형태로 데이터를 그림
  - plotly로 그림 그리는 방법
    1) **dict** 형식으로 그리기 (복잡해서 잘 안 씀)
      ```python
      fig = dict({
          "data": [{"type": "bar",
                    'x': [1, 2, 3],
                    'y': [1, 3, 2]}],
          "layout": {"title": {"text": "딕셔너리로 그린 그래프"}} # 제목을 제시하려면?
      })
      
      # 한글 관련 설정 지원
      ```
    <p align="center">
      <img src="https://github.com/user-attachments/assets/034ca443-e809-4a21-86a3-a5517c6500a0" width="50%" /> </p><br>

    2) **Express** 사용 - px를 통해 빠르게 그리기 가능
       ```python
        tips = px.data.tips()
        
        fig1 = px.scatter(tips, # 데이터명(데이터프레임 형식)
                         x='tip', # x축에 들어갈 컬럼
                         y='total_bill', # y축에 들어갈 컬럼
                         color='sex', # 색상 구분 기준이 될 컬럼명 (seaborn의 hue와 같은 역할)
                         marginal_x = 'box', # scatterplot의 옵션 중 하나인 인접 그래프의 스타일 지정 (히스토그램)
                         marginal_y = 'histogram',# scatterplot의 옵션 중 하나인 인접 그래프의 스타일 지정 (히스토그램)
                         trendline="ols",  # x축과 y축으로 지정된 데이터에 대해서 회귀분석(ols로)
                         trendline_color_override="grey",  # trendline 색상 지정
                         hover_name='day', # 팝업 데이터 최상단에 데이터프레임 컬럼명
                         hover_data=['day', 'size'], # 참고할 데이터 추가 - tips.columns로 설정하면 다 보여줌
                         title='Tips by Total Bill - Scatter Plot', # 그래프 타이틀 지정
                         width=800,  # 그래프의 크기 조절
                         height=600)
        fig1.show()
       ```
       <p align="center">
        <img src="https://github.com/user-attachments/assets/07cd13b5-8d59-4bf2-bfbc-487601b0b78e" width="50%" /> </p><br>

    3) **Graph_objects**를 통해서 그리는 방법: 섬세한 커스터마이징 가능 (겹쳐그리기 가능)
       ```python
       fig2 = go.Figure(

          # data 파트는 데이터에 관한 정보를 지정
          data=[go.Histogram(name ='Tips per Size',  # 데이터 제목
                       x=tips['size'],  # x축 값 해당 컬럼명
                       y=tips['tip'],  # y축 값 해당 컬럼명
                       hoverlabel = dict(bgcolor = 'white'),  # 마우스를 올렸을 때 뜨는 정보창의 배경 설정
                      ),
               ],
      
          # layout 파트에서 그래프의 축, 범례 등 부가정보 기입.
          layout=go.Layout(
              title='Tips 데이터 분석',  # 메인 타이틀 입력
              xaxis=dict(  # x축 설정
                  title = '팁금액과 방문인원수',
                  titlefont_size=20,
                  tickfont_size=10),
              yaxis=dict(  # y축 설정
                  title= '전체 금액',
                  titlefont_size=15,
                  tickfont_size=10),
              bargroupgap=0.3, # 그래프 간의 거리 조절
              autosize=True))
       fig2.show()
        ```
        <p align="center">
          <img src="https://github.com/user-attachments/assets/b1e420d0-3029-48cf-af38-cf07a996aa8d" width="50%" /> </p><br>

- PLOTLY - **Scatter Plot**
  ```python
  # 연속형변수 - 연속형변수
  # 특정 변수를 color 파라미터로 구분하려면 int/float이 아닌 object 타입을 걸어주기
  px.scatter(gap2007, 'gdpPercap', 'lifeExp', color='continent', hover_data='country', \
             log_x=True, trendline='ols')
  
  #주식, 지진강도 등 변화율이 급격한 데이터에서 변곡점을 표현하기 위해 로그스케일 사용 
  #큰 숫자, 작은 숫자를 모두 볼 수 있고, 변화의 폭(비율) 잘 살펴볼 수 있음 
  ```
  <p align="center">
    <img src="https://github.com/user-attachments/assets/b69c0f2b-07fc-4d8d-85d8-1340693600eb" width="50%" /> </p><br>

  - **Scatter Matrix**
    ```python
    px.scatter_matrix(gap2007, dimensions=['gdpPercap', 'lifeExp', 'pop'], color='continent')
    ```
    <p align="center">
      <img src="https://github.com/user-attachments/assets/616fd393-5ecb-4b9c-a458-3b5514ab5931" width="50%" /> </p><br>
      
- **PLOTLY - Line Chart**
  ```python
  # 연속형변수, 시간의 흐름에 따라 그릴 때
  px.line(gapAsia, x='year', y ='lifeExp', color='country')
  ```
  <p align="center">
    <img src="https://github.com/user-attachments/assets/5b299335-9b57-4ec3-8faa-97d2d7d6d284" width="50%" /> </p><br>

- **카테고리형 데이터**: 데이터 관리에 용이(특정 구간 데이터가 반복되는 경우)
  - 출력 순서 고정 및 메모리 절약 가능
    <br><br>
- PLOTLY - **Bar Chart**
  ```python
  canada = gapminder[gapminder['country']=='Canada']

  fig = px.bar(canada,
                x="year",
                y="pop",
                title='Life expectancy in Canada', hover_data=['gdpPercap', 'lifeExp']
                ) #hover_data:위의 그래프 각 부분에 마우스를 갖다댔을 때 'gdpPercap', 'lifeExp'의 정보가 함께 보여질 수 있게 함
  fig.show()
  ```
  <p align="center">
  <img src="https://github.com/user-attachments/assets/bde50169-5178-44a1-968e-c5b8ad945054" width="50%" /> </p><br>

***

<small>(seaborn 이미지 출처: [링크](https://wikidocs.net/86290))</small>
