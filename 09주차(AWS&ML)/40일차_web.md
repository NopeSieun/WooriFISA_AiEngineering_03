###  09.02 (40일차)
---
교육 내용: Django 기반 web
---
아침에 갑자기 비가 많이 와서 그냥 맞고 버스 줄 서있었는데 앞에 아주머니가 우산 같이 씌워주셔서 쌀과자 하나 드렸다. 
<br>

- **ORM**: 호환되지 않는 유형의 시스템 간에 데이터를 변환
  - 객체 지향 프로그래밍 언어 사용
<br><br>

- 같은 tag를 가진 글끼리 게시판에 보여주기
  ```python
  path('tag/<str:slug>', views.tag_posts, name="tag"), # <자료형:필드명>
  ```
<br>

- update/delete와 create의 차이 
  - update는 이미 있는 글을 수정 - 글번호 필요
  - create는 생성하는 개념 - 글번호 필요 x
    ```python
    urlpatterns = [
        path('edit-post/<int:pk>', views.PostUpdate.as_view(), name = 'update'),
        path('delete-post/<int:pk>', views.PostUpdate.as_view(), name = 'delete'),
    ]
    ```
    <br>
    
- **redirect**: 서버가 클라이언트한테 request와 response를 통해 두 번 요청이 일어나는 형태 (direction)
  - request: 한 번 요청 
<br><br>

- **pagenation**: 한 페이지 안에 보이는 글 개수 지정하는 방법
  ```python
  path('post-list', views.PostList.as_view(pagenate_by=5), name='post_list'), #  name= 개발자가 이 주소를 부를 이름
  ```
  - 다음 페이지 이동을 위한 기능 추가로 필요 
<br><br>

- blog - 댓글 작성 및 수정
  ```python
  댓글 작성 - 글의 번호 blog/30/
  path('<ink:pk>/create-comment', views.create_comment, name='create_comment'),
  # 댓글 수정 - 댓글의 번호 
  path('update-comment/<ink:pk>', views.update_comment, name='update_comment'),
  ```
***
