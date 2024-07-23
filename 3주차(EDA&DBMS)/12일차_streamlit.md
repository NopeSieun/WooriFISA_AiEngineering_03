###  07.00 (0일차)
---
교육 내용: 가상환경, streamlit
---
오늘은 지하철은 잘 탔는데 버스를 잘못 내렸다. 근데 다른 언니도 잘못 내려서 같이 걸어왔다..ㅎㅎ 요즘 수업 속도가 우주선 급이라서 정신 차리기 쉽지 않다. 밥을 든든하게 많이 먹어야 할 듯 
<br><br>

- **가상환경(Virtual Environments)**: 자신이 원하는 python 환경 구축을 위한 모듈만 담을 수 o
  - 각 가상환경이 독립적으로 관리됨 -> 충돌 조심
  - 반격리된 파이썬 환경
  <p align="center">
  <img src="https://github.com/user-attachments/assets/eb4b1bb3-4c1e-4312-a4b6-ac9c07e2f040" width="50%" /> </p>
  
  - 가상환경 설정을 위한 아나콘다 설치 후 가상환경 설정, 진입, 탈출
    ```sh
    C:\ITStudy\02_streamlit>conda create --n test
    C:\ITStudy\02_streamlit>conda activate test
    
    (test) C:\ITStudy\02_streamlit>

    (test) C:\ITStudy\02_streamlit>conda deactivate
    C:\ITStudy\02_streamlit>
    ```
<br><br>
- **Streamlit**: 데이터 어플리케이션을 빠르고 쉽게 만들 수 있는 오픈소스 앱 프레임워크
  - 가상환경 안에 설치
    ```sh
    (st)C:\ITStudy\02_streamlit>conda install streamlit
    ```
  - 예제 페이지 실행해보기(강제종료: Ctrl+c)
    ```sh
    (st) C:\ITStudy\02_streamlit>streamlit hello
    ```
    <p align="center">
    <img src="https://github.com/user-attachments/assets/90a6287f-af50-426d-96e9-7db32b4a8d3c" width="46%"/> <img src="https://github.com/user-attachments/assets/6fbedd33-ba8f-4eea-b6fc-62fd6bf584c1" width="40%" /></p><br>

- **streamlit의 다양한 기능**: 입/출력만 담당, 실제 로직은 나머지 파이썬 코드로 구현됨 
  - **button, checkbox**
    ```python
    data = pd.DataFrame(
        [
           {"command": "st.selectbox", "rating": 4, "is_widget": True},
           {"command": "st.balloons", "rating": 5, "is_widget": False},
           {"command": "st.time_input", "rating": 3, "is_widget": True},
       ]
    )
    ```
    ```python
    button_result = st.button('Hit me')
    # 버튼을 누르면 데이터프레임이 등장하도록 로직을 만들어주세요
    if button_result == True:
        st.write(button_result)
        st.data_editor(data) #hit me 버튼 누르면 데이터 프레임 출력
    
    check_result = st.checkbox('Check me out')
    if check_result == True: #체크박스 선택 시 출력 
        st.data_editor(data)
    ```
    <p align="center">
    <img src="https://github.com/user-attachments/assets/9355760c-026a-447b-95c5-adfb40af82aa" width="43%" /><img src="https://github.com/user-attachments/assets/fda4d606-c8e8-4e92-8c77-335dfae55bff" width="55%" /> </p><br>

  - **radio, selectbox, multiselect, slider**
    ```python
    st.radio('Pick one:', ['nose','ear'])
    st.selectbox('Select', [1,2,3])
    st.multiselect('Multiselect', [1,2,3])
    st.slider('Slide me', min_value=0, max_value=10)
    ```
    <p align="center">
      <img src="https://github.com/user-attachments/assets/6dbbb227-4e85-49c5-82b6-13c25e503d38" width="50%" /> </p><br>

  - **input, text area, file uploader, download**
    ```python
    st.number_input('Enter a number')
    st.text_area('Area for textual entry')
    st.date_input('Date input')
    st.time_input('Time entry')
    st.file_uploader('File uploader')
    st.download_button(
        label="Download data as CSV",
        data=data.to_csv(),
        file_name='app_df.csv',
        mime='text/csv'
    )
    ```
    <p align="center">
    <img src="https://github.com/user-attachments/assets/24d61ab2-0263-4728-ba9c-7daee71f77d2" width="50%" /> </p>

  - 사진 촬영, 인터랙티브한 화면 크기 변경 등 다양한 기능 보유 <br><br>

- 특정 서비스마다 약속처럼 사용하는 포트 존재
  - 3300: DB
  - 22: 외부에서 내 컴퓨터 명령줄에 접속할 때
  - 8000: 현재 실행중인 서버에 접속할 때
  - 특정 경로 이하에서만 / 내 컴퓨터에 있는 전체 파일 중 일부만 접속하도록 허용
<br><br>

- 파일 관리: 하나의 파일에 모든 내용을 담을 수는 x -> **pages** 폴더
  <p align="center">
  <img src="https://github.com/user-attachments/assets/d71205f6-dfbf-4520-b6c8-f79d797849ce " width="30%" /> </p>

  - 하나의 홈페이지 처럼 사용 가능
  - columns가 입구, pages 폴더 속 파일들이 서브 (streamlit run columns.py)
    <p align="center">
    <img src="https://github.com/user-attachments/assets/cba5372e-be06-49cb-93df-4689b9d2b580" width="60%" /> </p><br>




- **디버그 테스트 - REPL**
  ```python
  def count_words(words):
      count = 0
      for word in words:
          if "kim" in word.lower():
              count += 1
      return count

  words=["Kim","kimchi","gim"]
  ```
  - ctrl + shift + p -> python: start terminal REPL
  - print문을 덧붙이지 않아도 디버그 찾기가 가능해짐
    <p align="center">
    <img src="https://github.com/user-attachments/assets/670bca28-0e50-4a5f-8d25-f1beccdfe956" width="58%" /> </p><br>
 





***
<small>(이미지 출처: [링크](https://django-easy-tutorial.blogspot.kr/2015/08/python-virtual-environment-setup-in-ubuntu.html))</small>
