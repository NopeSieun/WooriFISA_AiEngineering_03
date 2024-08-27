###  08.27 (3일차)
---
교육 내용: Django 
---
벌써 8월 말이라니 시간이 너무 빨리 간다. 월말이라는 것은 달력이 아니라 나의 지갑을 보면 알 수 있는 것.. 
<br><br>

- 장고는 오류가 나면 친절하게 알려주는 편
  <p align="center">
  <img src="https://github.com/user-attachments/assets/d366c531-16f5-4193-afad-58bc3d3ce0e8" width="50%" /> </p><br>
  
- **media file**: 웹에서 웹 사용자가 업로드하는 파일 (예측 불가)
  - media url 을 설정해줌 - ``` MEDIA_URL = '/media/'```
 <br><br>
 
- 동적으로 변경되는 부분을 전달하는 방법: <> 사용
  ```python
  path('<int:pk>', views.PostDetail.as_view()) #<자료형: 필드명>
  ```
<br>

- shell 에서 DB 연결
  ```linux
  $ python manage.py shell
  >>> from blog.models import Post
  ```
  - 원하는 정보를 탐색하거나 코드 작성 가능
    ```linux
    In [4]:  Post.objects.all()
    Out[4]: <QuerySet [<Post: [[1] 첫 번째 글]>, <Post: [[3] 두 번째 글]>, <Post: [[4] 세 번째 글]>, <Post: [[5] shell 작성]>]
    ```
  - **create**
    ```linux
    p1 = Post() # 빈 객체 만들고 속성 따로 넣기
    p2 = Post(title="Second", content="Django")
    인스턴스명.save() # 저장
    
    Post.objects.create(title="Third", content="django") #저장 필요 x
    ```
  - **created_at**: 전체 데이터 가져와서 생성일이 최근인 글 순으로 정렬
  - **read**로 가져오기 
***
<br> 
