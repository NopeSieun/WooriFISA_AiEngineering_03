###  08.21 (32일차)
---
교육 내용: HTML
---
비가 와서 평소보다 30분이나 늦게 도착했다. 사람들이 다 마음이 급해서 정류장 도착 전에 버스 문 앞에 우르르 서 있었는데 약간 슬펐다. 나도 직장인 되면 맘대로 지각 못 하겠지.. 짝꿍 언니가 졸업식 선물로 준 마우스패드가 와서 오늘 갖고 왔는데 폭신하고 좋다. 근데 조금 부끄럽다.
<p align="center">
<img src="https://github.com/user-attachments/assets/17f0f1f1-bab7-463a-bd68-15c96474926b" width="30%" /> </p><br>


- **html 표**
  ```html
  <table>   <!-- 테이블의 시작 -->
    <thead> <!-- 제목 라인 -->
      <tr>  <!-- 행을 표현 -->
        <th></th>  <!-- 컬럼 -->
      </tr>
    </thead>
  
    <tbody> <!-- 표에 들어갈 내용 -->
      <tr>  <!-- 행을 표현 -->
        <td> </td> <!-- 컬럼 -->
      </tr>
    </tbody>
  </table>  <!-- 테이블의 끝 -->
  ```
<br>

- **html 리스트**
  ```html
  <!--리스트-->
  <ol>
      <li>1</li>
      <li>2</li>
      <li>3</li>
  </ol>
  ```
<br>

- **일반속성**: 특정 태그 안엥서만 사용 가능한 태그별 속성<br><br>
- **글로벌속성**: 모든 태그에서 사용 가능
  - class, id, 이벤트 속성, 스타일 속성 ...
<b><br>

- **input 태그**: 입력받을 값에 달린 표삭
  ```html
  <label for="name">이름:</label>
  <input type="text" id="name" name="name" value="kim" size="30">
  ```
  <p align="center">
  <img src="https://github.com/user-attachments/assets/5b8a8ec1-ab55-4405-a2c6-48743596b41a" width="50%" /> </p><br>

- **레이아웃**
  - **div** 로 배치
  - **semantic tag**: header, nav, main, section, article, aside, footer
    ```html
    <div id="header" role="banner">
    <div id="container" role="main">
    ```
    <br>

- **block 태그**: h, p, ol, li, ul
  - 위치한 영역을 전체 줄로 차지
  - 수직으로 레이아웃 쌓이는 형태
<br><br>

- **inline 태그**: a, img, span
  - 위치한 영역 만큼만 차지
  - 수평으로 쌓이는 형태
  <br><br>

- sytle 설정
  
  
- **Bootstrap**: 웹사이트를 쉽게 만들 수 있게 도와주는 CSS, JS 프레임워크
  - css와 JS를 추가로 가져와서 사용 가능(띄어쓰기로 구분)
    <p align="center">
    <img src="https://github.com/user-attachments/assets/a49492a9-b564-49ba-8a3f-6fc89cfe91ea" width="50%" /> </p>
    <p align="center">
    <img src="https://github.com/user-attachments/assets/d88cc240-baaa-49cb-bc7b-6a0a80da2986" width="50%" /> </p>

  - **layout**: 12개의 column으로 한 행을 나누어 관리
    - 알아서 컬럼 등분해서 관리됨
  - **image tag**: 반응형으로 설정하는 경우 多 (창 크기가 변경될 때 유동적으로 크기 변경) 
***
