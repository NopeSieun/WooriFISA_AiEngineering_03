###  07.16 (7일차)
---
교육 내용: 판다스(Pandas) 
---
인생은 정말 힘들다. 비가 오면 6시 반에 나와도 9시 넘어서 도착하는 내 인생.. 통근 버스 주세요.. 아침에 장화 신고 왔는데 탁월한 선택이었던 것 같다. 양말이 아주 뽀송뽀송! 
<br><br>
- **판다스(Pandas)**: numpy를 내부적으로 활용하는 데이터 분석 라이브러리(다양한 분석 함수 제공)<br><br>
- **DataFrame**: index, colums, value 로 구성되어 직관적이고 데이터 전처리에 용이
  - Series가 합쳐진 형태(2차원 구조) <br>
    ```python
    df = pd.DataFrame(data) #데이터프레임 형태로 변환
    # df['Name'] #특정 컬럼을 확인하는 방법
    df.colums = ['이름','나이','점수'] #컬럼명 변경(index 변경도 가능)
    ```
    <img src="https://github.com/user-attachments/assets/40fc8c70-f2a1-4ca6-a9c4-8b32c099834f " width="30%" /> 

  - Numpy: 행->열 접근 <-> Pandas: 열->행 접근 `df['나이'][2] #나이 열의 2행`
  - columns: 원본에서 가져올 컬럼 이름, index: 가져올 행에 붙일 별명 
    ```python
    df1 = pd.DataFrame(data, columns = ['Age'], index=['하나','둘', '셋'])
    ```
  - 행이나 열 추가 가능
    ```python
    df.drop('이름', axis=1) #이름 열 제거
    data['name'] = 'name' #새로운 열 추가
    ```
  - **브로드캐스팅** 가능
    ```python
    data['Name'] = df.Name #df의 name열을 data의 열에 붙이기
    ````
    <img src="https://github.com/user-attachments/assets/b0bffb63-0f5b-4f0e-ab55-a1426a3ca634" width="30%" /><br><br> 
- **데이터 프레임 병합**
  -  **concat**: 단순히 겹치거나(inner), 겹치지 않는(outer) '컬럼'단위로 합치는 명령어
      ```python
      pd.concat((data,df),join ='inner', axis=0) #join='inner'이면 교집합(중복x)
      ```
  - **join**:컬럼명 중복인 경우 중복되는 컬럼 다 간직할 때 사용
    ```python
    df5.join(df5, rsuffix='_2') #lsuffix: 컬럼 왼쪽에 붙임
    ```
    <img src="https://github.com/user-attachments/assets/bb526430-ae74-4b72-b5ae-5662616be49e" width="50%" />
   - **merge**: 중복을 알아서 거름(가장 편한 방식)
     ```python
      pd.merge(df5,df5)
      ```
      <img src="https://github.com/user-attachments/assets/2c9f314c-269d-4a3d-afc3-68b195ea5a95" width="50%" />
      <br><br>
- **drop_duplicates**: 중복 행 걸러내고 1개씩만 행을 남김 <br><br>
- **데이터프레임 접근 방법**
  1. `df[[컬럼명][행이름]` - 직접접근 
  2. `df.loc[열, 행]`
  3. `df.iloc` - 넘파이의 접근법으로 (행 열) (index position)
      ```python
      data0[['Age', 'Score']][:2]
      data0.loc[:1, ['Age', 'Score']] #판다스의 방식으로 부르되, 넘파이의 방식으로 접근 가능
      data0.iloc[[0,1],[1,2]] #판다스의 속에서 동작하는 넘파이 방식으로 접근
      data0.iloc[:2,1:3]
      #모두 같은 결과
      ```
  - 컬럼 순서 변경 가능
    ```python
    df5.loc[:,['Name','Sex','Age','Score']]
    ```
  - 원하는 특정 조건의 값 추출하기<br>
    `df_jjang.loc[df_jjang.Age>22] #열에 대한 정보만 적어뒀지만 행을 T/F로 추린 결과 `
    <br><br>
- **데이터 정렬**
  - `data.sort_values(컬럼,inplace=True,ascending=False)`
    - inplace=True: 지금 결과를 원본에 재위치 킴
    - ascending=False: 내림차순 정렬
  - 정렬 우선순위 정하기 가능
    - `data0.sort_values(['Name','Age']) #정렬 우선순위 1차 name, 2차 age`<br><br>
- **Summarizing Data**
  - **describe()**: 수치 데이터의 간단한 통계량 추출
    - 모든 열의 통계값 보고싶으면 `describe(include = 'all')`
  - **info()**: 데이터프레임 정보 
  - **head()/tail()**: 맨 앞에 / 맨 뒤에 5개 출력
  - **unique()/nunique()**: 특정 컬럼의 행 종류 / 개수
  - **duplicated()**: 중복 여부 
    - duplicated를 이용해서 중복 없이 추출 가능
      ```python
      df_jjang[df_jjang.Class.duplicated()==False]
      df_jjang[~df_jjang.Class.duplicated()] #같은 의미
      ```


***
