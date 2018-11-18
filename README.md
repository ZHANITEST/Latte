# Latte
![Latte](https://github.com/ZHANITEST/Latte/blob/master/res/latte_icon.png?raw=true)

* Simplest and dirty html parser for D programming language.
* 눈물나게 단순한 HTML 파서
* 한글도 파싱 되요!

# Example
```d
auto cup = new LatteCup(
	"<a href='hello' style=\"font-size:12px;\">"~
	"<b>hello! 그리고 안녕!</b></a>"~
	"my name is ditto.<br><br/></div>"
);
foreach( e; cup.takeAll("a") )
	{ writeln(e); }
```
result:
```
[
  "style":"font-size:12px;",
  "body":"hello! 그리고 안녕!",
  "href":"hello"
]
```

# How to use
## Requirment
  - git
  - dmd 2.x
  - dub
## Clone it
```shell
git clone https://github.com/zhanitest/latte-d.git
cd latte-d
```
## Library
```shell
cd latte-d
dub add-local ./
```
and add this line in your `dub.json`:
```shell
"dependencies":{
	"latte-d":"~master"
}
```

## Document
```shell
cd latte-d
dub build --build=docs
```

# About the Logo
source here!(By Edward Boatman): https://thenounproject.com/edward/kit/favorites

Thx!..

# License
LGPL v2.1
