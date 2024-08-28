###  08.28 (37일차)
---
교육 내용: 월말평가, Django
---
아침에 피곤해서 고양이 자세 스트레칭 하다가 그 자세 그대로 15분 더 잤다는 사실.. 오늘따라 잠이 안 깨서 버스에서도 두 번이나 못 내릴 뻔 했다. 오늘은 뭔가 너무 추워서 뜨거운 알탕을 점심으로 먹었더니 더워져서 시원한 버블티를 마셨다. 단짠단짠 아니고 뜨차뜨차 🥵🥶🥵🥶 
<p align="center">
<img src="https://github.com/user-attachments/assets/ee0dc316-5ab4-4c19-a23f-1b830c6f423a" width="25%" /> </p><br>

- **시험 회고**
  - 시험 범위: 리눅스, ELK
  - 난이도: 필기 - 오픈북이라 무난했음 / 실기 - 술술 풀리는 정도는 아님..
  - 총평: 문제를 언급할 순 없지만, 전반적으로 공부가 확실히 부족했다는 사실을 체감할 수 있었음. 특히 리눅스보다도 ELK를 너무 모른다는 생각이 들었음. (그치만 리눅스에서 바보실수 함ㅎ) 공부하자 ^^ 
<br><br>

- python 가상환경 activate: Script의 activate 실행하면 됨
  ```linux
  C:\ITStudy\07_Django\django_project>conda.bat activate myproject
  ```
<br>

- **template**: 장고는 앞에서 작성한 질문 목록, 질문 상세 템플릿을 표준 HTML 구조가 되도록 수정하기 위한 템플릿 상속(extends) 기능이 제공됨 
  - **extend**: 장고 템플릿 분리
    - 1차 분리: extends 경로명만 사용
      ```html
      {% extends '확장할 파일 경로' %}
      {% load static %}
      {% block page_area %}             
         바뀌는 내용
      {% endblock %}
      ```
    - 2차 분리: include로 각각 모듈화
  <br><br>

- python은 계속 켜져있을 수 x -> django 프레임워크 서버 이용해서 틀어놓는 것
  <br><br>

- 새로운 앱 생성 후 만들어가는 과정 (로그인 페이지)
  ```linux
  django-admin startapp account
  ```
  - app 생성 시 settings.py에 바로 업데이트 해주기
    ```python
    INSTALLED_APPS = [
        "django.contrib.admin",
        "django.contrib.auth",
        "django.contrib.contenttypes",
        "django.contrib.sessions",
        "django.contrib.messages",
        "django.contrib.staticfiles",
        "account"
    ]
    ```
  - urls.py에 경로도 업데이트 해주기
    ```python
    urlpatterns = [
        path("account/", include('account.urls')),
    ]
    ```
  - account 내에도 urls.py 생성 후 view와 연결
    ```python
    from django.urls import path
    from . import views
    from django.views.generic import ListView, DetailView
    
    urlpatterns = [
        path('login/', views.login), #localhost:8000/account/login
    ]
    ```
  - view.py 안에 def 함수 작성
  - forms.py 작성 후 view에서 연결 (form에서 데이터 받아옴) 
    ```python
    from .forms import LoginForm
    ```
  - 두 가지 기능 필요
    - id, password 받는 과정
    - session에 처음 접속 id를 저장하고 계속 확인할 수 있게 토큰 부여하는 과정
    - **authenticate**: DB에서 실제로 유저 존재하는지 확인 -> 토큰 발급
      ```python
      user = authenticate(request, username=cd['username'], password=cd['password'])
      ```
  - templates/account/ 안에 login.html 파일 작성 (폼)
    - csrf_token 꼭 form 안에 넣어야 함
      ```python
          <form method="POST">
            {% csrf_token %}
            {{ form }}
            <input type="submit" value="로그인">
        </form>
      ```
  - password 가리기
    ```python
    password = forms.CharField(widget = forms.PasswordInput)
    ```
***
