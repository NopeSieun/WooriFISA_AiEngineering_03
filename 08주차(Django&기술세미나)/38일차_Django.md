###  08.29 (38일차)
---
교육 내용: Django 
---
지난 주 아침에 박살난 섀도우를 오늘 열심히 모아서 꾹꾹 눌러서 복구시키고 나왔는데 좀 뿌듯하다. 내가 아끼는 색이었기 때문에 포기할 수 없었음. 오늘 아침은 엄청 추웠다. 요즘 매미소리가 안 나고 귀뚜라미 소리가 나는 걸 보니까 확실히 가을이 왔나보다. 요즘 우리집 도마뱀이 밥을 잘 먹어서 밥 먹이는 보람이 있다. 손바닥 동굴 만들어주면 꼭 낑겨 들어가는데 꽤 귀여움. 인간을 대충 밥 나오는 사물 쯤으로 인식한다. (이제 거의 FISA 일지 아니고 마뱀일지인..)
<p align="center">
<img src="https://github.com/user-attachments/assets/17f5a28d-6b0d-4bef-9f9e-746eb42a2f18" width="30%" /> </p><br>

- HTTP의 **무상태 특성**: 서버가 응답 후 접속 끊음(비연결지향) -> 접속이 끊기명 클라이언트-서버 간 통신이 끝나기 때문에 상태를 저장하지 않음
<br><br>

- **쿠키**: 사용자의 정보를 저장하고 꺼내서 보여주거나 내부적인 로직에 사용
  - 장고에서는 주로 쿠키를 사용해 세션 ID를 클라이언트에 저장함(사용자 식별을 위한 고유값 형태)
  - 클라이언트가 서버에 요청 -> 브라우저가 쿠키 전송 -> 서버가 클라이언트 식별
  - 민감 정보는 저장 x
  - 세션관리, 개인화, 트래킹 목적
    ```python
    response.set_cookie('user', user)
    ```
<br>

- 쿠키 유효시간
  - **Cookie Lifetime**: 일반적으로 브라우저 종료 시 함께 삭제
  - **Persistent Coookie**: 지정된 기간에 따라 삭제
    - 브라우저 종료/ 컴퓨터 재시작 상관 x
  - settings.py 에서 설정
<br><br>

- **Session**: 사이트와 특정 브라우저 사이의 상태 유지
  - 사용자 관련 데이터를 서버에 저장
  - 고유 세션 ID -> 쿠키에 저장
  - 로그인 상태, 장바구니 정보 등의 상태 관리, 필요 정보 제공
    ```python
    request.session['testSession'] = 'value session'
    ```
<br>

- **로그인/로그아웃 기능 - allauth**: `pip install django-allauth`
  - 로그인/ 로그아웃 기능 구현을 도와줌 - settings.py에 추가할 것들 추가해주기
  - <small>[공식 문서를 보고 추가해주자](https://docs.allauth.org/en/latest/installation/quickstart.html)</small>
    <p align="center">
    <img src="https://github.com/user-attachments/assets/fd4a2e68-9483-4793-9eb1-127195f3dee3" width="50%" /> </p><br>
  - 템플릿 오버라이드: app_name/templates/account 폴더 안에 넣어주면됨 (allauth가 제공하는 템플릿 내용과 동일해야 함)
  - `from django.contrib.auth import authenticate, login` - authenticate : 인가, login : 인증 담당
  - post-list에 유저 로그인 상태면 글쓰기
    ```html
    {% if user.is_authenticated %}   
             <a class="btn btn-secondary" href="{% url 'blog_app:create' %}" role="button">글쓰기</a>&nbsp;&nbsp;          
    {% endif %}
    ```
***
