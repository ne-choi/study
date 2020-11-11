# Lists, Tuples, and Dictionary
[* 출처: dschloe.github.io](https://dschloe.github.io/python/python_edu/01_basic/chapter_3_1_lists_and_tuples)

## Lists
- List는 [] 형태로 정의
- List는 정렬(ordered)됨
- List는 다양한 형태의 데이터 유형을 담을 수 있음
- List 안에 있는 값에는 인덱스로 접근
- List 안에 또 List를 담을 수 있음
- List는 변하기 쉬움
- List는 동적임

### 1) List는 정렬(ordered)됨


```python
# 파이썬의 기초 자료형
alphabet = [["a", "b"], ["c", "d"]]
print(alphabet)

# List 자료형은 Matplolib 시각화에, Numpy 기초 자료(행렬, 딥러닝 연산에 자주 활용)로 활용됨
```

    [['a', 'b'], ['c', 'd']]
    


```python
# a1 = a2?
a1 = [1, 2, 3, 4]
a2 = [2, 3, 4, 1]

a1 == a2
# False가 나온 이유? 순서가 다르면 서로 다른 자료
```




    False



### 2) 다양한 형태의 List
- 리스트 하나에 여러 형태의 자료를 담을 수 있다


```python
multi_values = [11.1, 'foo', 3, 5, True]
print(multi_values)
```

    [11.1, 'foo', 3, 5, True]
    


```python
float # 하나의 함수이자 클래스, List에 담을 수도 있음
```




    float




```python
len # 값의 길이, 값이 몇 개인지 표시, 하나의 함수지만 List에 담을 수 있음
len(multi_values)
```




    5




```python
# 사용자 정의 함수, List에 담을 수 있음
def temp():
    pass

temp
```




    <function __main__.temp()>




```python
# 리스트에 다양한 형태 담아보기
fun_list = [float, temp, len]
print(fun_list)
```

    [<class 'float'>, <function temp at 0x000001D5446B4700>, <built-in function len>]
    

### 3) List 접근 방법_index
- 순서는 `0`부터 시작
- 역순으로 할 경우 `-1`부터 시작


```python
alphabet_temp = ["A", "B", "C", "D", "E"]

# python에서 순서는 '0'부터 시작
alphabet_temp[0]
```




    'A'




```python
# Negative List
# python에서 거꾸로 지시하는 순서는 ''-1'부터 시작
alphabet_temp[-1]
```




    'E'



*** 슬라이싱**
- ':' 기호를 이용해 연속한 데이터를 슬라이싱해서 추출
- temp[M:N]: M번째부터 N 미만까지 값을 가져옴
- i.g temp[0:5]를 해야 알파벳 5개를 모두 가져올 수 있음


```python
# alphabet 슬라이싱으로 추출해보기
alphabet_temp[2:4]
```




    ['C', 'D']




```python
alphabet_temp[0:5]
```




    ['A', 'B', 'C', 'D', 'E']



### 4) List 안에 List 담기
- List 안에 다양한 데이터를 넣을 수 있는데, 여기에는 List도 포함됨


```python
x = ['a', ['bb', ['ccc', 'ddd'], 'ee', 'ff'], 'g', ['hh', 'ii'], 'j']
x
```




    ['a', ['bb', ['ccc', 'ddd'], 'ee', 'ff'], 'g', ['hh', 'ii'], 'j']




```python
# 인덱스로 접근해보기
x[0]
```




    'a'




```python
x[1]
```




    ['bb', ['ccc', 'ddd'], 'ee', 'ff']




```python
x[1][0] # x의 2번째 list 중 1번째 값 불러오기
```




    'bb'




```python
x[1][1][0] # x의 2번째 list 중, 2번째 list의 1번째 값 불러오기
```




    'ccc'




```python
x[3][0] # x의 5번째 list 중, 1번째 값 불러오기
```




    'hh'



### 5) List는 변하기 쉬움
- Mutable


```python
message = "string immutable"
message[0]
```




    's'




```python
# 문자열은 바로 치환되지 않아 에러가 나타남 = Immutable
message[0] = 'p'
print(message)
```


    ---------------------------------------------------------------------------

    TypeError                                 Traceback (most recent call last)

    <ipython-input-45-e59a77b7a4e6> in <module>
          1 # 문자열은 바로 치환되지 않아 에러가 나타남 = Immutable
    ----> 2 message[0] = 'p'
          3 print(message)
    

    TypeError: 'str' object does not support item assignment



```python
# List의 경우 살펴보기
a = ['foo', 'bar', 'baz', 'qux', 'quux', 'corge']
a[1]
```




    'bar'




```python
a[1]=10
a
```




    ['foo', 10, 'baz', 'qux', 'quux', 'corge']



- string에서 바뀌지 않던 것이 list에서는 쉽게 바뀜
- 쉽게 바뀌는 list의 성질을 `Mutable`이라고 표현  
  (Tuple은 immutable)

### 6) List는 동적임
- Mutable이라는 뜻 자체가 매우 동적임을 나타냄
- 다양한 형태로 작업이 가능함


```python
temp = ['A', 'B', 'C', 'D', 'E', 'F']
temp[3:3] = [1, 2, 3]
temp
```




    ['A', 'B', 'C', 1, 2, 3, 'D', 'E', 'F']




```python
# list에 값 추가하기
temp += [1000]
temp
```




    ['A', 'B', 'C', 1, 2, 3, 'D', 'E', 'F', 1000]




```python
# list에서 값 삭제하기
temp[3:6] = []
temp
```




    ['A', 'B', 'C', 'D', 'E', 'F', 1000]




```python
del temp[6]
temp
```




    ['A', 'B', 'C', 'D', 'E', 'F']



## Tuples
- Lists와 비슷하지만 세부 특성이 다름
- List는 []로 표현하나, Tuple은 ()라고 표현
- Tuple은 immutable: 처음부터 바꾸는 것 외에는 방법이 없음


```python
temp = ('A', 'B', 'C', 'D', 'E', 'F')
temp
```




    ('A', 'B', 'C', 'D', 'E', 'F')




```python
# immutable이기 때문에 바뀌지 않음
temp[2] = "Cat"
```


    ---------------------------------------------------------------------------

    TypeError                                 Traceback (most recent call last)

    <ipython-input-75-266ec228a7d8> in <module>
          1 # immutable이기 때문에 바뀌지 않음
    ----> 2 temp[2] = "Cat"
    

    TypeError: 'tuple' object does not support item assignment


### 1) Tuples을 사용하는 이유?
- 데이터 분석에서 접근하면, 특정 데이터가 변하지 않도록 방지하는 기법
- 프로그래밍적으로 Tuple이 List보다 연산 속도가 빠름
- Dictionary도 문자열과 같은 immutable type을 요구
- Tuples은 Packing & Unpacking 기법이 강력함(일종의 여행용 가방)


```python
t = ("foo", "bar", "hey", "yeah")
t
```




    ('foo', 'bar', 'hey', 'yeah')



- **Unpacking**: 각각의 `element`를 다른 이름으로 저장해보기


```python
(s1, s2, s3, s4) = t
s2
```




    'bar'



- 이때, 반드시 좌우 값이 동일하게 작동해야 함
- 만약 좌우 값이 일치하지 않으면 에러가 발생


```python
# 코드를 통해 확인
(a1, a2, a3) = t
```


    ---------------------------------------------------------------------------

    ValueError                                Traceback (most recent call last)

    <ipython-input-89-76bce831b49d> in <module>
    ----> 1 (a1, a2, a3) = t
    

    ValueError: too many values to unpack (expected 3)


### 2) swap
- 스왑은 맞바꾸다의 뜻
- `Tuple`에서는 매우 쉽게 `swap`이 가능


```python
a1 = "chloe"
v1 = "loves"
a2 = "evan"

temp = a1, v1, a2 # Tuple 형태로 표시됨
temp
```




    ('chloe', 'loves', 'evan')




```python
a1, a2 = a2, a1
temp = a1, v1, a2 # Tuple 형태로 표시
temp
```




    ('evan', 'loves', 'chloe')



## Dictionary
- 영어 원뜻 그대로 `사전`이라는 개념
- Dictionary는 {}로 표현
- List와 유사한 부분이 많음
  - Mutable이라는 뜻을 포함
  - 다른 Dictionary, List 등을 포함할 수 있음
- List와의 차이
  - List에서 각 원소에 접근하기 위해 index를 사용
  - Dictionary에서는 각 원소에 접근하기 위해 key를 사용
- Rename할 때 자주 사용
  
### 1) Dictionary 정의
- Dictionary의 기본적인 문법
```python
d = {
    <키>: <값>,
    <키>: <값>,
      .
      .
      .
    <키>: <값>,
}
```


```python
# 국내 야구팀을 Dictionary 형태로 만들기
kbo = {
    "인천" : "SK",
    "수원" : "KT",
    "광주" : "기아"
}

print(kbo)
```

    {'인천': 'SK', '수원': 'KT', '광주': '기아'}
    

### 2) Dictionary 접근법
- indexing이 아닌 `key 값`으로 접근 가능


```python
print(kbo[1]) # index로 추출할 수 없음
```


    ---------------------------------------------------------------------------

    KeyError                                  Traceback (most recent call last)

    <ipython-input-81-8f1aa6e7486b> in <module>
    ----> 1 print(kbo[1]) # index로 추출할 수 없음
    

    KeyError: 1



```python
# Dictionary는 key 값을 넣어줘야 호출할 수 있음
print(kbo["수원"])
```

    KT
    


```python
# Dictionary에 값 추가하기
kbo["대구"] = "삼성"
print(kbo)
```

    {'인천': 'SK', '수원': 'KT', '광주': '기아', '대구': '삼성'}
    


```python
# Dictionary에서 값 삭제하기
del kbo["대구"]
kbo
```




    {'인천': 'SK', '수원': 'KT', '광주': '기아'}



### 3) Dictionary Using Integer
- 이전까지 접근한 것은 문자를 이요해 접근
- `Integer`로 활용하는 방법은?


```python
dic = {0: 'a', 1: 'b', 2: 'c', 3: 'd'}
dic
```




    {0: 'a', 1: 'b', 2: 'c', 3: 'd'}




```python
print(dic[0])
print(dic[1])
```

    a
    b
    

*** 주의할 점**
- dic는 `list`가 아님
- list에서 할 수 있던, sclicing이나 append를 사용할 수 없음


```python
# 에러 1: dictionary에는 append라는 속성값이 없음
dic.append("e")
```


    ---------------------------------------------------------------------------

    AttributeError                            Traceback (most recent call last)

    <ipython-input-101-ea0dea029ae5> in <module>
          1 # 에러 1: dictionary에는 append라는 속성값이 없음
    ----> 2 dic.append("e")
    

    AttributeError: 'dict' object has no attribute 'append'



```python
# 에러 2: slice 작동하지 않음
dic[0:2]
```


    ---------------------------------------------------------------------------

    TypeError                                 Traceback (most recent call last)

    <ipython-input-103-4e3c8d53df26> in <module>
          1 # 에러 2: slice 작동하지 않음
    ----> 2 dic[0:2]
    

    TypeError: unhashable type: 'slice'


### 4) Dictionary와 관련된 함수 소개
- Dictionary와 함께 사용하면 좋은 함수들

#### d.clear()


```python
dic = {'A': 1, 'B': 2, 'C': 3}
dic
```




    {'A': 1, 'B': 2, 'C': 3}




```python
# clear() 함수 적용 뒤 결괏값 확인
dic.clear()
dic
```




    {}



#### d.get()
- `key` 값을 활용해서 `value` 값을 가져오는 함수


```python
dic = {'A': 1, 'B': 2, 'C': 3}
print(dic.get('B'))
print(dic.get('Z'))
```

    2
    None
    

- .get('B')에 해당하는 Dictionary값이 존재하기 때문에 2를 반환
- .get('Z')에 해당하는 Dictionary값이 존재하지 않기 때문에 None을 반환


```python
# None 반환보다 특정 숫자나 문자로 출력하고 싶은 경우
print(dic.get('z', 0))
print(dic.get('z', "없음"))
```

    0
    없음
    

### d.keys()
- Dictionary는 key와 value로 구성되어 있는데, keys()의 뜻은 현재 구성된 Dictionary에서 keys()를 dict_keys 형태로 반환
  - 이때, list로 변환하려면 list()를 활용하면 됨


```python
dic = {'A': 1, 'B': 2, 'C': 3}
print(dic.keys())
print(list(dic.keys()))
```

    dict_keys(['A', 'B', 'C'])
    ['A', 'B', 'C']
    

#### d.values()
- keys()를 활용하여 key를 반환한 것처럼, values()를 활용하여 value 진행 가능


```python
dic = {'A': 1, 'B': 2, 'C': 3}
print(dic.values())
print(list(dic.values()))
```

    dict_values([1, 2, 3])
    [1, 2, 3]
    
