print("Hello Wokrld!")

x = 1
y = 2

print(x)
print(y)

z = "안녕"
print(z)

### 1. 타입 공부
## 숫자
x = 1
y = 2
z = 1.2

print(z + y)
print(x - y)
print(x * y)
print(x / y)
print(x ** y)
print(x % y) # 나머지구하기

## 문자
m = "hello"
n = "bye"

mm = """
안녕하세요
최나은입니다
"""

print(m)
print(n)
print(mm)

## 문자 + 문자
print("안녕" + "잘 지내니")

# print("너 혹시 몇 살이니?" + 4) # 에러 발생
## 캐스팅
print("너 혹시 몇 살이니?" + str(4))

x = 4 # 숫자 타입
y = "4" # 문자 타입
print(str(x) + y)
print(x + int(y))

### 2. 분리안(True * False): boolean
x = True
y = False

print(x)
print(y)

### 3. 조건문: if else
if 2 > 1:
  print("Hello")

if not 1 > 2:
  print("Hello")

if 1 > 0 and 2 > 1:
  print("Hello")

x = 3

if x > 5:
  print("Hello")
elif x ==3:
  print("Bye")
else: 
  print("See you")

### 4. 함수(function)
def chat(): # 함수 이름 임의 설정
  print("jane: 안녕? 넌 몇 살이니?")
  print("judy: 나? 나는 20")

chat()
chat()

## 이름이 바뀔 경우
def chat(name1, name2):
  print("%s: 안녕? 넌 몇 살이니?" % name1)
  print("%s: 나? 나는 20" % name2)

chat("donna", "chris")
chat("james", "duke")

## 이름과 나이 바뀔 경우
def chat(name1, name2, age):
  print("%s: 안녕? 넌 몇 살이니?" % name1)
  print("%s: 나? 나는 %d" % (name2,age))

chat("donna", "chris", 30)
chat("james", "duke", 27)

## 아래 공식을 함수로 만들기
a = 1
b = 2
c = a + b

x = 1
y = 2
z = x + y

def dsum(a, b):
  result = a + b
  return result

d = dsum(1, 2)
print(d)

d = dsum(2, 2)
print(d)

## return 대신 print를 쓰면?
def dsum(a, b):
  result = a + b
  print(result)

## 복습: 인사하는 함수 만들기
# 이름과 나이를 받아라
# 나이가 10살 미만이면 "안녕"이라고 말해라
# 나이가 10살에서 20살 사이면 "안녕하세요"라고 말해라
# 그 외의 나이에는 "안녕하십니까"라고 말해라

def sayHello(name, age):
  if age < 10:
    print("안녕! " + name)
  elif age <= 20 and age >=10:
    print("안녕하세요! " + name)
  else:
    print("안녕하십니까! " + name)

sayHello("나은", 26)
sayHello("선호", 30)

### 5. 반복문
## (1) for
for i in range(3): # 10번 반복해라
  print("나은: 안녕 선호야 뭐해?")
  print("선호: 안녕 나은아, 그냥 있어")

## (2) while
i = 0
while i < 3:
  print(i) # 0
  print("나은: 안녕 선호야 뭐해?")
  print("선호: 안녕 나은아, 그냥 있어")
  i = i + 1 # i = 1 + 1 = 2 + 1 = 3

## while True: 무한루프
## break: 루프 끝내고 싶을 때
## continue: 

# while문으로 실습
while True: # 루프가 계속 돌아감
  print(i)
  print("나은: 안녕 선호야 뭐해?")
  print("선호: 안녕 나은아, 그냥 있어")
  i = i + 1

  if i > 2:
    break

# for문으로 실습
for i in range(100): # 반복 100번
  print(i)
  print("나은: 안녕 선호야 뭐해?")
  print("선호: 안녕 나은아, 그냥 있어")
  i = i + 1

  if 1 > 2:
    break

# continue 실습
for i in range(3): # 반복 100번
  print(i)
  print("나은: 안녕 선호야 뭐해?")
  print("선호: 안녕 나은아, 그냥 있어")
  
  if i == 1: # 1일 때는 밑으로 넘어가지 마라
    continue # 루프 첫 라인으로 돌아가라

  print("제인: 안녕 나은아 선호야!")


### 6. 자료 구조
## (1) 리스트
# 여러 속성을 담을 수 있음
# 리스트끼리 합칠 수 있음

x = [1,2,3,4]
y = ["hello", "world"]
z = ["hello", 1,2,3,4]

print(x)
print(y)
print(z)

print(x+y)

# 리스트 element 자리 바꾸기
x = [1,2,3,4]
#순서0,1,2,3
print(x[0]) # x의 0번째 자리 element를 보여라

x[3] = 10 # x의 3번째 자리를 10으로 바꿔라
print(x)

# 함수 이용하기
x = [1,2,3,4]

num_elements = len(x) # 길이 보기
print(num_elements)

y = [4,2,3,1]

arange_y = sorted(y)
print(arange_y)

z = sum(x)
print(z)

# 반복문 이용하기
x = [4,2,3,1]
y = ["hello", "there"]
for n in x:
  print(n)

for c in y:
  print(c)

# 리스트에서 element 위치 찾기
x = [4,2,3,1]
y = ["hello", "there"]

print(x.index(3))
print(x.index(1))
print("hello" in y)
print("bye" in y)

if "hello" in y:
  print("hello가 있어요.")

## (2) 튜플(tuples)
# () 사용
# 리스트와의 차이: 튜플에서는 assignment가 불가 = immutable
# assignment: element를 바꾸는 것

x = (1,2,3)
y = ('a', 'b', 'c')
z = (1, "hello", "there")

print(x + y)
print('a' in y)
print(z.index(1))

## (3) 딕셔너리(Dictionary)
# {} 사용
# key와 value로 이루어짐

x = dict()
y = {}

print(x)
print(y)

x = {
  0: "naeun",
  1: "seonho",
  "name": "나은",
  "age": 26
}

print(x["name"])
print(x["age"])
print(x[0])
print("age" in x)

for key in x:
  print("key: " + str(key))
  print("value: " + str(x[key]))

x[0] = "나은"
print(x)

## 복습: 과일별로 세기

fruit = ["사과", "사과", "바나나", "바나나", "딸기", "키위", "복숭아", "복숭아", "복숭아"]

d = {}

for f in fruit:
  if f in d: # "사과"라는 키가 d라는 딕셔너리에 들어 있나?
    d[f] = d[f] + 1
  else:
    d[f] = 1 # "사과"라는 키가 없으면 딕셔너리에 넣고 벨류는 1로 만들어라
  
print(d)

### 7. 클래스와 오브젝트
## (1) 클래스(class): 함수 + 변수 모아둔 것(빵틀)
## (2) 오브젝트(object, instance): 클래스를 이용해 만들어 낸 물체(빵)

class Person:
  def __init__(self, name):
    self.name = name

  def say_hello(self, to_name):
    print("안녕!" + to_name + " 나는 " + self.name)

nani = Person("나니")
seonho = Person("선호")
nani.say_hello("선호")
seonho.say_hello("나니")

class Person:
  def __init__(self, name, age):
    self.name = name
    self.age = age

  def say_hello(self, to_name):
    print("안녕!" + to_name + "나는 " + self.name)

  def introduce(self):
    print("내 이름은 " + self.name + " 그리고 나는 " + str(self.age) + "살이야.")

nani = Person("나니", 26)
nani.introduce()

# 상속
# 경찰, 프로그래머 만들기
# 각각 하는 일은 달라야 하지만, 사람이 하는 일은 둘 다 할 수 있어야 함

class Police(Person): # Police 클래스가 Person 클래스 상속
  def arrest(self, to_arrest):
    print("넌 체포됐다, " + to_arrest)

class Programmer(Person):
  def program(self, to_program):
    print("다음엔 뭘 만들지? 아 이걸 만들어야겠다: " + to_program)

naeun = Person("나은", 26)
seonho = Police("선호", 35)
zzail = Programmer("짜일", 53)

seonho.introduce()
seonho.arrest("나은")
zzail.program("카드 내역 분석")


### 8. 패키지 & 모듈
## 패키지: 모듈들의 합
## 모듈: 코드가 든 파일

# animal package
# dog, cat modules
# dog, cat modules can say "hi"
# (1) 폴더를 만든다. 이름은 패키지명으로
# (2) 폴더 내 파일을 만든다

from animal import dog # animal 패키지에서 dog 모듈을 가지고 와라
from animal import cat

d = dog.Dog() # instance
d.hi()

c = cat.Cat()
c.hi()

# 모든 모듈 한 번에 불러오기
from animal import * # animal 패키지가 가진 모듈을 모두 불러라

d = Dog()
c = Cat()

d.hi()
c.hi()

# 다른 사람 패키지 사용해보기
from geopy.geocoders import Nominatim
geolocator = Nominatim(user_agent="NAEUN")
location = geolocator.geocode("Seoul, South Korea")
print(location)

### 9. 라이브러리, API
## 라이브러리: 8번의 패키지
## API: 서비스 제공자가, 개발자가 데이터를 가져갈 수 있도록 만들어 둔 길
# 번호, 아이디, 코드 확인 후 사용하면 됨

# Download the helper library from https://www.twilio.com/docs/python/install
import os
from twilio.rest import Client # twilio 패키지에서 Client 모듈 가져오기

# Your Account Sid and Auth Token from twilio.com/console
# and set the environment variables. See http://twil.io/secure
account_sid = '아이디'
auth_token = '토큰'
client = Client(account_sid, auth_token)

message = client.messages \
                .create(
                     body="나은이 뭐해?",
                     from_='얻은 번호'',
                     to='수신자 번호'
                 )

print(message.sid)