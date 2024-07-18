###  07.16 (7일차)
---
교육 내용: 판다스(Pandas) 
---
인생은 정말 힘들다. 비가 오면 6시 반에 나와도 9시 넘어서 도착하는 내 인생.. 아침에 장화 신고 왔는데 탁월한 선택이었던 것 같다. 양말이 아주 뽀송뽀송하다! 언니들이 내 가방이랑 장화를 탐내서 좀 뿌듯했다.
<p align="center">
<img src="https://github.com/user-attachments/assets/4614c80a-8a97-495d-8191-ec82ffca8cbd" width="30%" /> </p>
<br><br>
- **판다스(Pandas)**: numpy를 내부적으로 활용하는 데이터 분석 라이브러리(다양한 분석 함수 제공)<br><br>
- **DataFrame**: index, colums, value 로 구성되어 직관적이고 데이터 전처리에 용이
  - Series가 합쳐진 형태(2차원 구조) <br>
    ```python
    df = pd.DataFrame(data) #데이터프레임 형태로 변환
    # df['Name'] #특정 컬럼을 확인하는 방법
    df.colums = ['이름','나이','점수'] #컬럼명 변경(index 변경도 가능)
    ```
    <p align="center">
    <img src="https://github.com/user-attachments/assets/40fc8c70-f2a1-4ca6-a9c4-8b32c099834f " width="30%" /> </p>

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
    <p align="center">
    <img src="https://github.com/user-attachments/assets/b0bffb63-0f5b-4f0e-ab55-a1426a3ca634" width="30%" /></p><br><br> 
- **데이터 프레임 병합**
  -  **concat**: 단순히 겹치거나(inner), 겹치지 않는(outer) '컬럼'단위로 합치는 명령어
      ```python
      pd.concat((data,df),join ='inner', axis=0) #join='inner'이면 교집합(중복x)
      ```
  - **join**:컬럼명 중복인 경우 중복되는 컬럼 다 간직할 때 사용
    ```python
    df5.join(df5, rsuffix='_2') #lsuffix: 컬럼 왼쪽에 붙임
    ```
    <p align="center">
    <img src="https://github.com/user-attachments/assets/bb526430-ae74-4b72-b5ae-5662616be49e" width="50%" /></p>
   - **merge**: 중복을 알아서 거름(가장 편한 방식)
     ```python
      pd.merge(df5,df5)
      ```
     <p align="center">
      <img src="https://github.com/user-attachments/assets/2c9f314c-269d-4a3d-afc3-68b195ea5a95" width="30%" /></p>
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
- **엑셀 파일로 저장**
  1. 애초에 export 할 때 index를 생략해서 보내주는 방법
     `df.to_excel('jjangu.xlsx', index=False)`<br>
     <p align="center">
      <img src="https://github.com/user-attachments/assets/90745bf3-ebf6-4060-8601-2531f0387cb8" width="30%" /></p> <br>
    - 불러오기: `new_jjanggu = pd.read_excel('jjangu.xlsx')`
  2. import 할 때 애초에 index는 빼고 불러오는 방법<br>
    `new_jjanggu = pd.read_excel('/content/jjangu.xlsx',index_col=0)`<br><br>
- 보통 csv 파일로 많이 저장함 `jjangu_list = pd.read_csv('/content/jjangu_list2.csv')`<br><br>
- **Grouping Analysis**: 원하는 컬럼 묶어보기<br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/57819155-b1b6-405f-a576-a38aff3c565f" width="30%" /> </p><br>
  
  - `df.groupby("묶음의 기준이 되는 컬럼명")["적용받는 컬럼"].적용받는 연산()`
  - 자료형을 고려해서 묶어야 함
    ```python
    jjangu_list_og.groupby('반')[['담당','테스트점수']].mean() #숫자 자료형에 적용되는 연산
    # error 발생
    ```
    ```python
    jjangu_list_og.groupby(['반','담당'])[['테스트점수']].mean() #반->이름 기준으로 묶임
    ```
<p align="center">
  <img src="https://github.com/user-attachments/assets/df8e88a0-e8a6-43fd-b6d9-3ca5ecc04e6f" width="20%" />
</p><br>

- **datetime**: pandas df에서 시간을 관리하는 단위<br>
  - `jjangu_list.등록일자 = pd.to_datetime(jjangu_list.등록일자)`
  - 날짜 처리 시 datetime으로 자료형 변환이 필요할 수 o -> 시리즈.to_datetime으로 형 변환
  - + timedelta() 함수 안에 변하는 시간을 적어서 연산 가능
    - `jjangu_list1.등록일자 - timedelta(weeks=52)`<br><br>
- **astype**: 브로드캐스팅으로 각 원소에 동일한 자료형 적용 
  - `jjangu_list1.등록일자.astype(str)`<br><br>
- **Melt**
 <p align="center">
  <img src="https://github.com/user-attachments/assets/dbafa94e-5815-4638-9f6d-c8750ce9ccc1" width="30%" /> </p>    
  <small>(이미지 출처: [링크](https://pandas.pydata.org/pandas-docs/stable/_images/reshaping_melt.png))</small>

    
***
