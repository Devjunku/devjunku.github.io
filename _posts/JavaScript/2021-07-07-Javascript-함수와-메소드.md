---
title:  "Javascript 함수와 메소드"
excerpt: "Javascript function & method"

categories:
  - Gitlog
tags:
  - [Gitlog, jekyll, Github, Git, Js, Javascript, function, method, class]

toc: true
toc_sticky: true
 
date: 2021-07-07
last_modified_at: 2021-07-07
---


Devjunku의 Js 정복기 1편 `모든 것은 스프링5와 Vue.js2로 시작하는 모던 웹 애플리케이션 개발(제임스.J)에 근거합니다.`

# 1️⃣ (⊙_⊙)？ 함수와 메소드

Javascript에서 함수는 실제로 자바스크립트 내장 객체인 function생성자로 생성된 `객체`이기 때문에 일반적으로 우리가 아는 메소드(자바, 파이썬)과는 다르다. 즉 Function 자체가 하나의 객체이다. 자바스크립트에서 메소드는 함수가 객체의 프로퍼티일 때 메소드라고 부른다. 그럼 프로퍼티는 무엇일까? MDN에서 정의하고 있는 Property는 해당 object의 특징이라고 한다. 보통 데이터 구조와 연관된 속성을 나타낸다. 이때 프로퍼티는 2가지로 나눠진다.

1. Instance Property: 특정 object 인스턴스의 특정한 데이터를 가지고 있다.
2. Static Property: 모든 object 인스턴스들에게 공유된 데이터를 가지고 있다.

따라서 JS의 Method는 함수지만, 모든 함수가 method는 아니다. 또한 Js에서 함수는 객체이므로 프로퍼티와 메소드를 가질 수 있다. 아래의 코드를 입력하여 다음 객체가 함수인지 아닌지는 `instanceof` 명령어를 사용하여 확인할 수 있다.

```javascript
var workout = function () {} // (1)
console.log(workout instanceof Function) // True 출력됨 
```

그렇다면, 함수와 객체의 차이점은 무엇일까? 일단 함수는 호출 가능하지만, 다른 객체는 호출할 수 없다. 또 다른 점은 함수는 프로토타입의 프로퍼티를 가졌지만, 다른 객체는 그렇지 않았다. Js에서 객체를 생성하는 데 함수를 new와 함께 사용한다. 여기서는 함수는 생성자 역할을 한다. 또한 `함수가 만약 생성자 역할을 하는 경우 대문자로 시작해야 한다.` 다음은 함수를 User 생성자로 활용하는 간단한 예제를 확인해보자.

```javascript
function User () {} // (2)
var user = new User()
```

또한 Js에서 함수를 생성하는 방법은 함수 선언과 표현이 있다. 

- 함수 선언

```js
function () { // (3)
    return '함수 선언문'
}
```

- 함수 표현

```js
var funcName = function () { // (4)
    return '함수 표현문'
}
```

그럼 `(1)`은 함수 표현식이고 (2)는 함수 선언식이다.

다른 방법으로는 `new Function()`를 사용하여 함수를 선언할 수 있으나, 가독성이 떨어진다는 이야기가 있으므로 자제하자.

# 2️⃣ (⊙_⊙)？ 객체와 클래스

자바스크립에서도 객체를 생성할 수 있고 생성 방법은 다음과 같다.

- object 생성자
- 객체 리터럴
- 생성자 함수
- object.create()
- 생성 함수
- ES6 클래스

1. object 생성자를 이용하는 경우

```js
// new를 활용하여 object 생성자를 호출하는 경우 (5)
var user = new object()
user.name = 'Sunny'
user.interests = ['Traveling', 'Swimming']
user.greeting = function () {
    console.log('Hi, I\'m' + this.name + '.')
}
user.greeting()
```

user를 객체로 할당하기 위해 `new object()`를 입력한다. 이후 user.name에 'Sunny'를 할당, user.interests에 `['Traveling', 'Swimming']`를 할당한다. user라는 객체 안에 `greeting`이라는 함수를 선언한다. 이때 user.name을 참조한다. `user.greeting()`를 실행한다.

Object 생성자는 객체 래퍼(Wrapper)를 생성한다. 이 방법은 자바스크립트에서 활용할 수 있지만, 권장하진 않다는다고 한다. 실제로는 리터럴을 이용하는게 더 간편하면 해당 방법은 아래와 같다.

2. 리터럴을 이용하는 방법

```js
var user = { // (6)
    name: 'sunny',
    interests: ['Traveling', 'Swimming'],
    greeting: function () {
        console.log('Hi, I \'m ', + this.name + '.')
    }
}
user.greeting
```

Js에서 리터럴은 객체를 생성하기 위한 간단한 문법이며, `new object()`보다 더 권장한다. 또한 ES5부터 객체 리터럴에서 게터와 세터 접근자를 지원하기 시작했다.

```js
var user = { //(7)
    get role() {
        return 'Engineer'
    }
}
user.role
```

자세한건 더 나중에 알아봐야겠다. 일단 기초부터..

3. 생성자 함수를 이용하는 방법

```js
function User(name, interests) { // (8)
    this.name = name
    this.interests = interests
    this.greeting = function () {
        console.log('Hi, I \'m' + this.name + '.')
    }
}
var user = new User('sunny', ['Traveling', 'Swimming']) // user 객체를 생성하기 위해 new를 사용
user.greeting() // Hi, I'm Sunny
```

아래와 같이 작성시 생성자의 어떤 인자도 전달되지 않으니 조심하자.

```js
var user = new User // (9)
console.log(user.name)
```

괄호 생략은 Js에서 유효하지만, 권장하진 않는다.

4. Object.create()를 이용하는 방법

```js
// 위에서 생성한 User 생성자 함수의 프로토타입과 Object.create() method를 활용 // (10)
var user = Object.create(User.prototype, {
    name: { value: 'Sunny' },
    interests: { value: ['Traveling', 'Swimming'] }
})
user.greeting() // Uncaught TypeError: user.greeting() is not a function 출력
```

처음에 `Uncaught SyntaxError: missing ) after argument list`라는 에러가 떴는데, 이거 `User.prototype`뒤에 `,`를 붙이지 않아서 이다. 

본론으로 돌아가서, 10번 코드를 실행했을 때 `Uncaught TypeError: user.greeting() is not a function`라는 오류가 발생한 이유는 Object.create() method가 생성자의 프로토타입 객체로 새로운 객체를 생성하기 때문이다. 그리고 무엇보다 greeting함수를 user객체 안에서 정의를 하지 않았으며, 두번째 인자에 전달해주지도 않았다. 따라서 greeting 함수를 생성해주면 된다.

```js
User.prototype.greeting = function () { // (11)
    console.log('Hi, I \'m ' + this.name + '.')
}
user.greeting()
```

그러므로 실제로 Js에서 상위 클래스가 하위 클래스로 상속할 메소드를 제공하는 방법으로 프로토타입을 이용한다. 생성함수를 이용하여 해당 문제를 해결하면 다음과 같다.

```js
function createUser(name, interests) { // (12)
    this.name = name
    this.interests = interests
    this.greeting = function () {
        console.log('Hi, I \'m' + this.name + '.')
    }
    return user
}
var user = createUser('sunny', ['Traveling', 'Swimming']) // user 객체를 생성하기 위해 new를 사용
user.greeting() // Hi, I'm Sunny
```

5. ES6 클래스를 이용하는 방법

```js
class User { // (13)
    constructor(name, interests) {
        this.name = name
        this.interests = interests
    }
    greeting() {
        console.log('Hi, I \'m ' + this.name + '.')
    }
}
let user = new User('sunny', ['Traveling', 'Swimming'])
user.greeting()
```

다음과 같은 클래스 표현식으로도 만들 수 있음

```Js
let User = class { // (14)
    constructor(name, interests) {
        this.name = name
        this.interests = interests
    }
    greeting() {
        console.log('Hi, I \'m ' + this.name + '.')
    }
}
```

클래스라는 같은 단어를 사용하지만 Js의 클래스는 자바의 클래스와는 완전 다른 것을 알아야한다.