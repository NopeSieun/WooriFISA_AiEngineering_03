###  07.22 (11일차)
---
교육 내용: Seaborn
---
지하철로 오려면 3번 갈아타고 버스까지 총 4번 갈아타야 하는 공포의 상암.. 거기에 이제 지하철 무조건 반대로 타는 길치가 찾아와야하는.. 
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
<img src="https://github.com/user-attachments/assets/897c0873-c27c-48e6-a024-5b4dd97575d6" width="30%" /> </p><br>

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

    ```python 
    q1 = tips.tip.quantile(0.25)
    q3 = tips.tip.quantile(0.75)
    iqr = q3 - q1 #tips의 tip에 대한 이상치: IQR(MAX-MIN) * 1.5가 되는 값
    ```
<br>
- 
***

<small>(seaborn 이미지 출처: [링크](https://wikidocs.net/86290))</small>
