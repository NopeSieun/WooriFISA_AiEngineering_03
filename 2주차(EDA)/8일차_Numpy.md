###  07.17 (8일차)
---
교육 내용: Numpy 
---
비 진짜 싫 음 3분 늦어서 지각한거 실화고요.. 평소랑 똑같이 나왔는데 이럴수가 있고요.. 6시반에 나왔는데 그럼 대체 언제 나와야 되냐고요~~ 슬프다고요~~ 내가 정한 하루 밥 에산이 만원인데,, 한 번도 예산 내에서 밥 먹은 적 없는 것 같다. 카페를 가면 안 되는데 자꾸 가게 된다. 
<br><br>
**Numpy**: Numeric+Python, 수학/과학 연산 라이브러리 
- 배열 및 행렬 계산에 필요한 함수 제공<br>
- Numpy의 배열엔 모두 같은 자료형만 넣어주기
  - 다른 자료형일 경우 모두 포함 가능한 자료형으로 자동 변경됨
- list와는 내부 구조부터 다르게 되어있으며 빠른 연산이 큰 장점
  - list는 포인터의 배열(메모리가 흩어져 있을 수 o)
  - numpy는 원소 배열로 데이터 유지(다차원 데이터도 연속된 메모리 공간 할당됨) 
  
1. numpy를 쓰지않고 평균 구하기(sum을 써도 되지만 비교를 위해 길게 작성) 
      ```python
        testTotal = 0 #저장용 변수 
    
          for tes in test: 
            testTotal += tes
            
        print(testTotal/len(test))
      ```
    만약 test 리스트의 각 원소에 5를 더해주고 다시 평균을 구하려면
   ```python
        test = [tes+5 for tes in test]
        sum(test)/len(test)
   ```
3. numpy 라이브러리를 활용해서 평균 구하기 
      ```python
      import numpy as np
      np.average(test)
      ```
    각 원소에 5 더하기도 간편함 
    ```python
    test = np.add(test,5)
    np.avarage(test)
    ```
    <br>
- **ndarray**: numpy가 제공하는 특수 자료타입 `test = np.array([15, 20, 25, 30])`<br><br>
- **np.arrange**: ndarray 수열을 만들어주는 메소드 `np. arange(시작점, 끝+1, 공차)`<br><br>
- **np.append(ndarray, 추가할 원소)**: 구조가 무너짐
  - 원본을 보존하는 것이 우선이기 때문에 일반 파이썬과 달리 append 함수가 원본을 파괴하지 않고 결과를 리턴하도록 구현되어 있음
  - 만약 ndarray가 2차원이면 append로 원소를 추가했을 때 구조가 무너지고 1차원이 됨
  - axis를 사용해서 구조 보존 
    ```python
    np.append(ndarray3,[[9,10,11,12]], axis=0) #axis=0: 가로축(행) / axis=1: 세로축(열)
    #출력: array([[ 1,  2,  3,  4],
                  [ 5,  6,  7,  8],
                  [ 9, 10, 11, 12]])
    ```
    ```python
    np.append(ndarray3,[[9],[10]], axis=1)
    '''출력: array([[ 1,  2,  3,  4,  9],
                 [ 5,  6,  7,  8, 10]])'''
    ```
    <br>
  
- **사이즈에 관한 변수들**<br>
  ex) `ndarray = np.array([[1,2,3,4],[5,6,7,8]],dtype='int8')`
  - `ndarray.itemsize`: 방 하나(요소 한개)의 바이트 (1)
  - `ndarray.ndim`: 차원 (2)
  - `ndarray.size`: 요소의 개수 (8)
  - `ndarray.shape`: 행,열 ((2,4))
  - `ndarray.strides`: 다음 차원으로 넘어가기 위해 필요한 바이트 수 ((4,1))<br><br>
- 배열 크기가 다른 경우
  1. None을 사용할 경우 type이 NonType이 됨 <br>
    `wrong_example = np.array([[1,2,3,4],[5,6,7,None]])`
  2. **np.nan**: 파이썬의 None과 같은 numpy만의 '값없음'을 의미하는 데이터<br>
     `good_example = np.array([[1,2,3,4],[5,6,7,np.nan]])`
     - 행렬 자료형이 일치해야 broadcasting이 가능
     - float으로 내부적으로 구성되어 있음(numpy.float64) 
   - **np.isfinite(x)**: nan과 inf가 배열에 섞여있을 때 모두 false 처리 <br><br>
- **ndarray형변환**
  - 실수를 정수 ndarray로 형변환 시 소수점 이하는 버리는 데이터 손실 발생
    - ex) `np.array([0.3, 1.3, 4.5, 2],'int') #array([0, 1, 4, 2])`
  - str로 된 자료가 섞여있으면 나머지도 str로 형변환 -> 숫자만 있으면 float으로 변환 가능
    - ex) `np.array([0.3, '1.3', 4.5, 2],'float') #array([0.3, 1.3, 4.5, 2. ])`
<br><br>
- **bool**: 수치자료형(0=False, 1=True)
  - `boolArrya+1`도 가능<br><br>
- **부호없는 정수형(0포함 양수)**: default data type이 'uint64'
  - 음수 출력 명령 시 정수 넘어서는 범위에서 이상한 값 출력됨
  - 양의 정수만 필요하고 데이터를 아껴야 하는 경우 사용(ex-나이, 물건개수, 반복횟수)<br><br>
- **복소수형**: default data type이 'complex128'(ex-양자역학, 반도체, 전기회로) <br><br>
- 자료의 형태
  - **Scalar**: 점, 수 하나, 방향은 없고 양만 있음
    - 파이썬에서는 변하지 않는 숫자(상수)를 의미
  - **Vector**: 선, 한 열이나 행으로 이루어진 수 조합
    - 양과 방향성 가짐
    - 파이썬에서는 행이 n개이고 열이 1인 형태의 배열을 의미 
  - **Matrix1**: 면
    - 여러개의 벡터가 모여 이룬 하나의 행렬<br><br>
- **영벡터, 일벡터**
  - ex) `np.zeros((4,1), dtype=int) `: 1행 4열의 영벡터를 int형으로 만들기 <br><br>
- **random 배열 생성**: 파이썬/넘파이의 random은 균등분포를 의미 `np.random.choice(a,4)`
  - 중복될 수 o -> replace=False 추가하면 됨 `np.random.choice(a,4, replace=False) `
  - 똑같은 결과를 보고싶으면 **seed**사용: 가장 최초값을 지정 가능
    - 초기값을 동일하게 지정해서 난수를 생성
    - 난수의 결과가 같이 작업하는 사람 / 동일 모델에서 같은 결과가 나오도록 `np.random.seed(42)`
    - 같은 코드셀 내에서만 심어야 기능<br><br>
- **np.random.rand(행,열)**: 0~1 사이에 균등분포의 확률로 값 1개를 뽑아냄
  - **np.randn(행,열)**: 정규분포 확률로 값을 뽑아냄
  - **np.randint(시작범위,끝범위,(행,열))**: low, high 사이의 균등분포 따라 int값을 하나 뽑아냄<br><br>
- **x.sort()**: 원본을 파괴해버림, ndarray로 결과 리턴
  - cf) python의 sorted() 함수는 list로 결과를 리턴함
  - **np.sort(x)**: 원본은 두고 결과만 리턴<br><br>
- numpy 배열도 **슬라이싱** 가능 `a[행 슬라이싱 시장:끝+1, 열 슬라이싱 시작:끝+1]`
  - cf) 얕은 복사이므로 원본이 바뀌는 상황을 주의
    ```python
    d = ar[:2,:2]
    d[0][0] = 100
    ar

    '''출력 array([[100,   2,   3,   4],
                [  5,   6,   7,   8],
                [  9,  10,  11,  12]])'''
    ```
  - `c = ar.copy()` 처럼 하나 깊은복사해두고 진행하기 (되돌리지 못할 상황을 대비) <br><br>
- **reshape(행,열,-1)**: -1을 계산해서 나머지를 알아서 유지하도록 차원이 만들어짐<br><br>
- **np.insert(원본, 넣을 위치, 넣을 값)**: 배열의 지정된 위치에 새로운 값 삽입
  - 새로운 값을 삽입하지만 원본을 변경하는 게 아니라 새로운 배열을 새로운 메모리공간에 할당
  - 빠르게 동작하기 위해 순서대로 값을 빠르게 메모리 공간에 저장하기 때문

***
<br> 
