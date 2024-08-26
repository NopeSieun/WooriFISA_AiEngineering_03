###  08.26 (35일차)
---
교육 내용: Django
---
성심당 빵 사올
<br><br>
- **Django**: 파이썬 기반 웹프레임워크
  - **MVT 패턴**: 모델-뷰-컨트롤러
    - 각 폴더에서 각자 생성
      <p align="center">
      <img src="https://github.com/user-attachments/assets/15584b6a-5ddb-45c8-a01a-35c3f5cd2d94" width="30%" /> </p>
  - **ORM(Object-Relational Mapping)**지원: SQL 쿼리를 직접 쓰지 않아도 DB와 연결 가능
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
  ```python
  $ python manage.py migrate
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
***
