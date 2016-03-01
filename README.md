# Latte
![Latte](https://github.com/ZHANITEST/Latte/blob/master/res/latte_icon.png?raw=true)

Simplest and dirty html parser for D programming language. and 한글도 파싱 되요!

# Example
app.d
```d
	auto cup = new LatteCup( "<a href='hello' style=\"font-size:12px;\">"~
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

# Debug mode
## Windows
```batch
dmd latte.d -debug=latte
```
## Linux
```shell
sudo dmd latte.d -debug=latte
```

# About the Logo
source here!(By Edward Boatman): https://thenounproject.com/edward/kit/favorites

Thx!..

# License
BSD v2

# Requirement
Only need phobos2. And tested at dmd 2.07. :-)
