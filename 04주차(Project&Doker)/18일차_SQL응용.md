    ###  07.31 (18일차)
---
교육 내용: jupyter notebook
---
어제 아침에 뜨거운 아메리카노를 샀는데 뜨거운 거 시키신 거 맞냐고 여쭤보셨다. 얼음 조금만 넣어달라 했더니 3개 넣어주셨다. 오늘 또 갔는데 오늘 나를 기억하시고 얼음 세 개 맞으시죠? 하셔서 부끄러웠다. 요즘 강의실이 추워서 뜨거운 커피 마시는 게 좀 좋은 것 같다. 근데 이제 너무 추워서 한 시간이면 뜨아 아니고 아아 되어버림.. 아침에 잘 자다가 버스기사님이 카트라이더 처럼 급커브 하셔서 놀라서 깼다. 무려 8시 20분에 도착해버림. 
<p align="center">
<img src="https://github.com/user-attachments/assets/72dc11f8-f0ba-4a7d-9847-327477f143b8" width="30%" /> </p><br>


<br><br>

- 터미널에서 jupyter notebook 실행: conda activate 후 접속 가능함
  - jupyter notebook보다 jupyter lab이 작업하기 편리할 수 있음 
    <p align="center">
    <img src="https://github.com/user-attachments/assets/a4ed0ae3-1a0c-4d1a-ac04-ea4a970833e7" width="60%" /> </p><br>

- **pymysql**: mysql을 python에서 사용할 수 있게 해주는 라이브러리 중 하나
  ```python
  # 작동방식
  
  # 1. 모듈 불러옴
  import pymysql
  
  # 2. pymysql한테 3306 포트번호와 접속할 ID, PW
  connection = pymysql.connect(host='localhost',
                               user='root',
                               password='0000',
                               database='fisa')
  
  # 3. 대신 일하게 만들 커서 만듦
  cursor = connection.cursor()
  
  # 4. 실행할 SQL문을 넘김 - 한 번에 한 문장 넘김 
  cursor.execute("INSERT INTO students (name, gender, birth, english, math, korean) VALUES ('wage2', 'woman', '1982-1-13', 76, 30, 80);")
  cursor.execute("INSERT INTO students (name, gender, birth, english, math, korean) VALUES ('tina2', 'woman', '1982-12-3', 87, 62, 71);")
  
  # 5. DB에 현재 상태를 COMMIT 
  connection.commit()
  
  # 6. DB와 연결을 닫음
  connection.close()
  ```
<br>

- **fetch**: 행을 가져오는 함수
  ```python
  cursor.execute('SELECT * FROM box_office') 
  cursor.fetchall() # 다 가져옴
  cursor.fetchone() #한 행씩 가져옴 (계속 돌리면 다음 행 보여주는 방식)
  ```
<br>

- pandas를 이용해서 SQL문을 dataframe으로 가져오기
  ```python
  import pandas as pd
  
  SQL = "select * from box_office where year(release_date) = 2019 order by sale_amt limit 5"
  data1 = pd.read_sql(SQL, connection)
  connection.close()
  ```
<br>

- **read_csv**: csv 파일을 불러오듯이 sql함수 불러오고 df 형태로 확인 가능 
  ```python
  df = pd.read_sql("select * from emp",connection)
  ```
<br>

- **SQLAlchemy**: python에서 사용하는 대표적인 ORM
  - ORM: 객체와 DB의 테이블을 매핑 -> SQL 직접 작성 안 해도 테이블 조작 가능
  - Dataframe은 항상 index가 있기 때문에, 테이블 구조와 안맞을 수 있음, 그래서 index=False 로 작성
    ```python
    import pymysql
    from sqlalchemy import create_engine  # InnoDB
    import pandas as pd
    
    ## 접속할DB종류+접속에사용할패키지명 + :// + userid:password @ 주소:포트번호/db?인코딩방법 의 형태를 띔
    engine = create_engine(f"mysql+pymysql://{db_info['USER']}:{db_info['PASSWD']}@{db_info['HOST']}:3306/fisa")
    
    conn = pymysql.connect(
        user = USER,
        passwd = PASSWD,
        host = HOST,
        port = PORT
        # autocommit = True # default : False # 오토커밋 기능 설정
    )
    
    conn
    
    conn.select_db("fisa") # use DB명;
    
    cursor = conn.cursor(pymysql.cursors.DictCursor)  # 딕셔너리 형식으로 데이터를 받아오는 옵션.
    
    cursor.execute('select * from emp;')
    result = cursor.fetchall()
    
    result[0]   # 행번호대로 / 컬럼으로 값을 받아서 사용할 수 있겠구나 
    
    result_df = pd.DataFrame(result)
    result_df  
    ```
<br>

- **OpenAI와 대화하기**: client.chat.completions.create 메서드 사용
  - 주요 파라미터
    - model (str): 사용할 모델의 이름을 지정
    - messages (list of dict): 모델에게 보낼 대화 메시지의 리스트
    - content (str): 각 role에 따른 메시지의 내용
    - temperature (float, optional): 생성되는 텍스트의 창의성을 조절
    - max_tokens (int, optional): 생성될 응답의 최대 토큰 수
    - top_p (float, optional): 생성된 텍스트의 다양성을 조절
    - n (int, optional): 한 번의 호출로 생성할 응답의 수
    - stop (str or list of str, optional): 응답 생성을 중지할 문자열을 지정
    - frequency_penalty: 생성된 토큰의 빈도에 따라 페널티를 적용하여 반복 줄임
    - presence_penalty: 텍스트에 새로운 토큰이 나타날 경우 페널티를 적용
***
<br> 
