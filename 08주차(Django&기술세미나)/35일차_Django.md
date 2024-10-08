###  08.26 (35일차)
---
교육 내용: Django
---
성심당 빵 왕창 선물받아서 아침에 가져와서 먹을랬는데 까먹어버려서 너무 슬픈 월요일.. 그래서 육회덮밥을 시켰다(?) 이번 주는 기술세미나가 있어서 바쁠 것 같다. 그리고 공채가 우르르르 나오고 있어서 두 배로 바쁘다. 바쁜 보람이 있으면 좋을텐데..
<br><br>
- **Django**: 파이썬 기반 웹프레임워크
  - **MVT 패턴**: 모델-뷰-컨트롤러
    - 각 폴더에서 각자 생성
      <p align="center">
      <img src="https://github.com/user-attachments/assets/15584b6a-5ddb-45c8-a01a-35c3f5cd2d94" width="30%" /> </p>
  - **ORM(Object-Relational Mapping)**지원: SQL 쿼리를 직접 쓰지 않아도 DB와 연결 가능
<br><br>

- django 구조
  <p align="center">
  <img src="https://github.com/user-attachments/assets/c66ff327-9989-43da-a1e8-a34cc43e8005" width="50%" />출처: MDN 웹문서 Django 소개글 </p>

 <br><br>
 
- conda 말고 파이썬 가상환경 만들기
  ```linux
  virtualenv -–python=python3.11 myproject
  ```
<br>

- 새 프로젝트 생성: 가상환경 진입 후 생성
  ```linux
  &where python #파이썬 경로 복사
  &파이썬 경로 -m pip install virtualenv
  &파이썬 경로 -m virtualenv myproject
  #scripts 들어가서 activate
  &python.exe -m pip install --upgrade pip
  &pip install django
  &python -m django --version
  &django-admin startproject 프로젝트명 .
  ```
  ```
  &python manage.py runserver
  ```
  <p align="center">
  <img src="https://github.com/user-attachments/assets/2b582dbe-a8c3-4157-8e80-43f84f7cd502" width="50%" /> </p><br>

- **migration**: DB에 변화 적용시킬 때 마이그레이션 해줘야 함
  ```linux
  (myproject) C:\ITStudy\07_Django\django_project\fisa_django>python manage.py makemigrations
  ```
<br>

- **superuser** 생성: 관리자 계정 생성
  ```linux
  $python manage.py createsuperuser
  ```
  <p align="center">
  <img src="https://github.com/user-attachments/assets/d0d9351b-e886-43f1-b36f-8e1ed286f766" width="50%" /> </p><br>

- app 생성
  ```linux
  $python manage.py startapp blog
  ```
<br>

- **urls.py**: app이랑 연결하기 위한 통로를 설정해줘야 함 
  ```python
  from django.contrib import admin
  from django.urls import path, include
  
  urlpatterns = [
      path("admin/", admin.site.urls),
      path("blog/", include('blog.urls')), #localhost:8000/blog/실제blog/urls.py에 적힌 경로 
  ]
  ```

- settings.py 안에 app을 등록해야 사용 가능 
  ```python
  INSTALLED_APPS = [
      "django.contrib.admin",
      "django.contrib.auth",
      "django.contrib.contenttypes",
      "django.contrib.sessions",
      "django.contrib.messages",
      "django.contrib.staticfiles",
      "blog",
      "board",
  ]
  ```
  <br>

- 가져온 데이터 -> **templates**로 보내야 함
  ```python
  from django.shortcuts import render
  from .models import Post 

  def index(request):
    posts = Post.objects.all() # 쿼리로 데이터 가져오기 
    return render(
        request,
        'blog/index.html',
        {
            'posts':posts,
        }
    )
  ```
<br>

- 업로드 하고싶지 않은 파일 -> **gitignore**
  <p align="center">
  <img src="https://github.com/user-attachments/assets/fc6f1606-0e55-4532-9e87-f58bfc5dc4b7" width="30%" /> </p>
  
***
