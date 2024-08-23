###  08.23 (34일차)
---
교육 내용: JS, Django
---
날씨가 정말 오락가락 한 것 같다. 비가 왔다가 안 왔다가 무한반복.. 🌩 감사하게도 또 학습일지 챌린지 우수 작성자에 선정되어서..! 요즘은 실습 위주의 수업 들이라 내용을 알차게 못 쓴 것 같은데 선정되어서 부끄럽지만 기분 좋았다. 이 영광을 요즘 숟가락도 씹어먹는 우리집 돼지 도마뱀에게... 
<p align="center">
<img src="https://github.com/user-attachments/assets/fc2c0352-cb0f-44b0-a8c5-f491ab975004" width="25%" /></p>
<p align="center">
<img src="https://github.com/user-attachments/assets/bd7e9034-ce1f-43a4-915b-e7d4c77d43dc" width="25%" /></p><br>

- **js의 형변환**: 대문자로 자료형을 호명해서 함수처럼 사용
  ```js
  a = String()
  ```
<br>

- js에서 비교연산자 사용 시 자료형까지 비교하지는 x
<br><br>

- Not a Number: 자료형이 Number
  - 오류 방지를 위해 사용
<br><br>

- **splice**: 배열의 요소를 삭제하거나 추가하는 메소드
<br><br>

- js의 **sort()** 는 기본적으로 유니코드 순으로 정렬
<br><br>

- **set**: 중복 거르고 싶을 때 사용
  ```js
  var set = new Ser([1,2,3,4,5])
  ```
<br>

- **익명함수**: 쓰고 버리기 위해 만들어 놓은 것
  - 필요하면 이름을 달아줄 수 o
    ```js
    function() {return hello}
    ```
    <br>

- **class**: js에 없는 문법 -> **function** 을 사용하기 편하게 class에 입혀놓음 
  - **this**: 새로 만드는 객체의 메모리 주소
    ```js
    function player(name, team, position){
      this.name = name;
      this.team = team;
      this.position = position;
     }
    ```
    ```js
    player1.play() // 인스턴스 메서드 동작
    ```
<br>

- **private 변수**: 클래스 안에서만 접근 가능한 변수를 #으로 숨길 수 o
  - class 안에 프라이빗 변수를 확인하거나 사용하는 함수 작성 가능 
