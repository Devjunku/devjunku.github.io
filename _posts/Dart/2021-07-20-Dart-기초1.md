---
title:  "📌 Dart 문법 정복기 1장"
excerpt: "Dart Grammer"

categories:
  - Gitlog
tags:
  - [Gitlog, jekyll, Github, Git, Dart, Flutter]

toc: true
toc_sticky: true
 
date: 2021-07-21
last_modified_at: 2021-07-21
---  

내가 Dart를 배우는 목적은 Flutter를 이용해서 개발해보고 싶은 마음 때문임.

기본적으로 Dart는 `vold main () {   ...   }`로 작동하게됨. 그리고 카멜케이스를 따른다고 함. 그냥 기본 구조는 OOP를 따르고 문법도 어느 정도 비슷하다고 생각하고 넘어가는게 좋을 듯. 그리고 필자는 이미 여러 언어를 경험했기 때문에, Dart만의 새로운 문법이나 특징이 아닌 이상 컴퓨터 문법의 고유한 특성은 작성하지 않을 것임.

Dart의 변수 선언은 매우 다양한 방식이 존재함.

`var`, `String`, `bool`, `int`, `dynamic`등등 매우 많은 것이 있기 때문에, 실습을 위주로 연습을 하는게 빠르게 문법을 익힐 수 있음을 알게 됨.

빠르게 기본 문법을 익혀보자.

```dart
void main() {
  var integer = 1;
  var string = '1';
  var boolean = true;
  
  int number = 1;
  String str = '1';
  bool isTrue = true;
  
  print(string + ' ' + str);
  print($string + ' ' + $str);
  print(${string + ' ' + $str}); // string을 다루는 법
}
```

일단 `var`로 변수 할당이 가능함. 그리고 따로 `int`, `String`, `bool` 등으로 특정 타입의 변수로 할당이 가능함. 물론 `int`, `String`, `bool`은 한 번 타입이 정해지면 타입을 변경하면서 변수 할당이 불가능함. var로 할당 할 때에도 타입을 지정하고 변수를 선언하면(`var integer = 1;`) 타입 변경이 불가능함. 이를 가능하게 하는게 `dynamic`임. 따라서 `dynamic`은 다음과 같이 작성할 수 있음.

```Dart
void main() {
  dynamic name = 'Code';
  print(name); // 'Code'
  
  name = 1;
  print(name); // 1
}
```

하지만 만약 var의 경우에도 변수만 선언하고 타입은 모르는 경우에는 변수 타입을 변경하여 재선언이 가능함.

```Dart
void main() {
  var data;
  data = 1;
  print(1) // 1
  data = '1';
  print('1') // '1'
}
```

다음으로 `List`를 선언하고 할당하는 방법도 있음. 기본적으로 아래와 같음

```Dart
void main() {
  List alphabetList = [ // 선언할 때 그냥 문자열로 할당 한 것임
    'a',
    'b',
    'c'
  ];
  // 같은 방식으로 선언하고 싶으면 다음과 같이 선언하면 됨.
  List<String> numList = [ // Java, C#과 비슷함. 이와 같은 코드는 아에 타입을 지정하고 들어간 것.
    '1',
    '2',
    '3'
  ];
	// 기본적으로 index의 경우 접근하는 것은 동일 해당 원소에 직접 slicing → [idx]
  print(numList[0]); // '1'
  // 길이 메소드 length
  print(numList.length) // 3
}
```

이제는 Map을 알아볼 것임.

```Dart
void main() {
  // python의 dictionary를 선언하는 것과 동일
  Map numList = {
    'one': '1',
    'two': '2',
    'three': '3'
  };
  // 위와 같은 의미의 코드를 짜게되면
  Map<String, String> numList2 = {
    'one': '1',
    'two': '2',
    'three': '3'
  };
  // 이렇게 짜주면 됨
  
  // 만약에 여기서 원소를 하나 추가하고 싶으면 다음과 같이 짜면 됨
  numList.addAll({
    'four': '4'
  });
  
  // 또는 특정 key의 value를 변경하고 싶으면 다음과 같이 하면 됨
  numList['one'] = '하나';
  
  // 그리고 만약에 key와 value를 삭제하고 싶으면 다음과 같이 하면 됨
  numList.remove('one');
  
  // Key value를 따로 따로 받고 싶으면 다음과 같이 코딩
  print(numList.keys.toList());
  print(numList.values.toLsit());
  // 참고로 toList()는 데이터 타입을 List로 변환하는 것임
  // 이게 그냥 하나의 변수로 선언한 객체는 사용이 불가능함.
}
```

이제 `final`, `const`를 알아볼것임

```Dart
void main() {
  final myName1 = 'junku';
  final String myName2 = 'Devjun';
  // final은 데이터를 바꿀 수 없음. 가변적이지 않음
  
  const myName3 = 'Dev';
  const myName4 = 'Dart';
  // const도 데이터를 바꿀 수 없음. 가변적이지 않음
}
```

그리고 또 하나의 특징은 final은 빌드 타임 값을 몰라도 선언 가능. 근데 const는 빌드 타임 값을 모르면 선언이 불가능함.

```Dart
void main() {
  final now1 = new DateTime.now(); // 선언 가능
  
  const now2 = new DateTime.now(); // 선언 불가능
  
  // DateTime.now()는 현재 시간을 의미함.
}
```

이제는 enum 타입임

```Dart
enum Status { // 앞은 항상 대문자
  A,
  B,
  C
}

void main() {
  Status status = Status.A;
  
  switch(status) {
    case Status.A:
      print('It is A');
      break;
      
    case Status.B:
      print('It is B');
      break;
      
    default:
      print('이건 뭡니까?');
      break;       
  }
}
```

이제 if문임

```Dart
void main() {
  int num1 = 2;
  var num2 = 2;
  
	if (num1 % 2 == 0) {
    print('짝수임');
  } else {
    print('홀수임')
  }
  
  if (num2 % 2 == 0) {
    print('짝수임');
  }
  
  // switch
  switch(num1 % 2) {
    case 1:
      print('홀수임');
      break;
    case 0:
      print('짝수임');
      break;
    default:
      print('일단 자연수는 아님');
      break;   
  }
}
```

다음은 for문임

```Dart
void main() {
  int total = 0;
  List naturalNumberList = [1, 2, 3, 4, 5];
  
  for(int i = 0; i < naturalNumberList.length; i++) {
    total += naturalNumberList[i];
  }
  print(total);
}
```