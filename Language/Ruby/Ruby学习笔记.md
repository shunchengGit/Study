# Ruby学习笔记

## 基础知识

### 语言简介

Ruby是一种纯粹的面向对象编程语言。脚本语言，跟Python和Perl类似。

### Ruby环境

**Ruby 中文编码**

Ruby 使用用 ASCII 编码来读源码，中文会出现乱码，解决方法为只要在文件开头加入

```ruby
#-*- coding: UTF-8 -*-（EMAC写法）
```

**Ruby 命令行选项**

[http://www.runoob.com/ruby/ruby-command-line-options.html](http://www.runoob.com/ruby/ruby-command-line-options.html)

**Ruby 环境变量**

[http://www.runoob.com/ruby/ruby-environment-variables.html](http://www.runoob.com/ruby/ruby-environment-variables.html)

**交互式 Ruby （IRb）**

需要在命令提示符中键入 irb，一个交互式 Ruby Session 将会开始，quit命令退出irb

### Ruby 语法

**Ruby 程序中的行尾**

Ruby 把分号和换行符解释为语句的结尾。但是，如果 Ruby 在行尾遇到运算符，比如 +、- 或反斜杠，它们表示一个语句的延续。

**Ruby 标识符**

大小写敏感，包含字母、数字和下划线字符

**保留字**

保留字不能作为常量或变量的名称。但是，它们可以作为方法名

**Here Document**

"Here Document" 是指建立多行字符串。在 << 之后，您可以指定一个字符串或标识符来终止字符串，且当前行之后直到终止符为止的所有行是字符串的值。

```ruby 
print <<EOF
    这是第一种方式创建here document 。
    多行字符串。
EOF
```

**BEGIN END**

- BEGIN声明 code 会在程序运行之前被调用。
- END声明 声明 code 会在程序的结尾被调用。

```ruby

#!/usr/bin/ruby

BEGIN {
	puts "开始啦"
}

END {
	puts "结束啦"
}

puts "这是主程序"

```

**注释**

```ruby

# 我是注释，请忽略我。

=begin
这是注释。
这也是注释。
这也是注释。
这还是注释。
=end

```

### Ruby数据类型

Ruby支持的数据类型包括基本的Number、String、Ranges、Symbols，以及true、false和nil这几个特殊值，同时还有两种重要的数据结构——Array和Hash。

**数值类型**

- 整型(Integer)
- 浮点型
- 算术操作 

**字符串类型**

- 转义字符
- \#{expr} 类似format string

```ruby
puts "#{20*20}"

name = "ruby string"
puts name
puts "#{name + " test"}"
```

**数组**

```ruby
# 初始化
test = Array.new(10) { |i| i = i * 2 }

# 插入0位置
test.insert(0, "开始") 

# 添加到末尾
test<<"结束" 

# 删除
test.delete_if { |e| e == 10 }

# 遍历
test.each { |e| puts e  }
puts test.size
```

[Ruby 数组](http://www.runoob.com/ruby/ruby-array.html)

**哈希类型**

```ruby
# 初始化
test = Hash.new

# 赋值
test["chengshun"] = 27
test["zhangjing"] = 28

# 取值
puts test["chengshun"]

# 删除
test.delete_if { |k, v| k == "chengshun" }

# 遍历
test.each {|k,v| puts "#{k} #{v}"}
```

[Ruby 哈希](http://www.runoob.com/ruby/ruby-hash.html)

**范围类型**

```ruby
# 作为序列范围(2个点包含最大值)
puts (1..5).to_a

# 作为范围序列(3个点不包含最大值)
puts ('a'...'e').to_a

# 作为条件判断
score = 59
result = case score
when 1...60
	"不及格"
when 60...80
	"及格"
when 80..100
	"优秀"
else
	"出错"
end

puts result

# 作为间隔的范围
age = 17
if (1...18) === age
	puts "未成年"
end
```

[Ruby 范围](http://www.runoob.com/ruby/ruby-range.html)


### Ruby 类和对象

```ruby
# 全局变量
$g_test = "test"
puts "#{$g_test}"

class Person
	# 类变量在变量名之前放置符号（@@）
	@@cls_loaded = false

	# 初始化函数
	def initialize(name, age)
		# 实例变量在变量名之前放置符号（@）
		@name, @age = name, age
		@@cls_loaded = true
	end

	# 成员函数
	def print_info
		# 局部变量以小写字母或 _ 开始
		name = @name
		age = @age
		puts "name is #{name}, age is #{age}"
	end
end

a = Person.new("chengshun", 27)
a.print_info
```

### Ruby 运算符

**算数运算符**

=、-、\*、/、%、\*\*

**比较运算符**

**<=>**

如果第一个操作数等于第二个操作数则返回 0，如果第一个操作数大于第二个操作数则返回 1，如果第一个操作数小于第二个操作数则返回 -1

**===**

用于测试 case 语句的 when 子句内的相等。

**eql? （值和类型相同）**
如果接收器和参数具有相同的类型和相等的值，则返回 true。

**equal? (指针相同）** 
如果接收器和参数具有相同的对象 id，则返回 true。


```ruby
a = [1, 2, 3]
b = [1, 2, 3] 
puts a.eql?b
puts a.equal?b

puts 2 <=> 1
puts 1 <=> 1
puts 1 <=> 2
```

**逻辑运算符**

and && 

and运算符优先级低

**Ruby defined?**

defined? 是一个特殊的运算符，以方法调用的形式来判断传递的表达式是否已定义。它返回表达式的描述字符串，如果表达式未定义则返回 nil。

```ruby
$g = 123
foo = 10
puts defined? $g
puts defined? foo
puts defined? puts
puts defined? a
```

**Ruby 点运算符**

你可以通过在方法名称前加上类或模块名称和 . 来调用类或模块中的方法。你可以使用类或模块名称和两个冒号 :: 来引用类或模块中的常量。

```ruby
CONST = "Out There"

class Inside_one
	CONST = "inside one"
	def hello
		::CONST+" inside one"
	end
end

class Inside_two
	CONST = "inside two"
	def hello
		CONST
	end
end

puts Inside_one.new.hello
puts Inside_two.new.hello
```

### Ruby 判断

**if...else语句**

```ruby
x = 1
if x > 2
	puts "x大于2"
elsif x > 1
	puts "x位于1和2之间"
else
	puts "不知道x的值"
end
```

**Ruby if修饰符**

```ruby
$debug = true
puts "debug环境" if $debug
```

**Ruby case语句**

```ruby
$age =  5
case $age
when 0 .. 2
    puts "婴儿"
when 3 .. 6
    puts "小孩"
when 7 .. 12
    puts "child"
when 13 .. 18
    puts "少年"
else
    puts "其他年龄段的"
end
```

### Ruby 循环

**while**

```ruby
$ix = 0
$cnt = 5
while $ix < $cnt
	puts $ix
	$ix += 1
end
```

**for**

```ruby
$ix = 0
for $ix in 0..5
	puts $ix
end
```

### Ruby 方法

方法名应以小写字母开头。如果您以大写字母作为方法名的开头，Ruby 可能会把它当作常量，从而导致不正确地解析调用。

```ruby
def foo (a = "ruby", b = "python")
	puts "第一个编程语言#{a}"
	puts "第二个编程语言#{b}"
end

puts "===无参数调用==="
foo
puts "===单参数调用==="
foo("c")
puts "===二参数调用==="
foo("c", "c++")
```

**返回值**

Ruby 中的每个方法默认都会返回一个值。这个返回的值是最后一个语句的值。

Ruby 中的 return 语句用于从 Ruby 方法中返回一个或多个值

```ruby
def foo1
	i = 0
	j = 1
	k = 3
end

puts foo1

def foo2
	i = 0
	j = 1
	k = 3
return i, j, k
end

var = foo2
puts foo2.size
var.each { |e| puts e }
```

**可变数量的参数**

```ruby
def foo (*params)
	puts "参数个数是#{params.size}个"
	params.each { |e| puts e }
end

foo "Hello", 2, 3
```

**类方法和成员方法**

```ruby
class Foo
	def Foo.static_method
		puts "类方法"
	end

	def member_method
		puts "成员方法"
	end
end

puts Foo.static_method
puts Foo.new.member_method
```

**alias**

这个语句用于为方法或全局变量起别名。别名不能在方法主体内定义。即使方法被重写，方法的别名也保持方法的当前定义。为编号的全局变量（$1, $2,...）起别名是被禁止的。重写内置的全局变量可能会导致严重的问题。

```ruby
# 全局变量别名
$a = 0
alias $b $a
$a = 123

puts "$a = #{$a}, $b = #{$b}"

# 方法别名

def foo
	puts "before"
end

alias bar foo

def foo
	puts "after"
end

bar
foo
```

**undef**

这个语句用于取消方法定义。undef不能出现在方法主体内。

```ruby
def foo
	puts "foo"
end

foo

undef foo

foo
```


### Ruby 块

- 块总是从与其具有相同名称的函数调用。这意味着如果您的块名称为 test，那么您要使用函数 test 来调用这个块。
- 您可以使用 yield 语句来调用块。

```ruby
def test
	yield 1, 2
end
test {|a, b| puts "a元素是#{a}, b元素是#{b}"}
```

### Ruby Module

- 命名空间
- mixin

模块常量命名与类常量命名类似，以大写字母开头。方法定义看起来也相似：模块方法定义与类方法定义类似。

```ruby
module Foo
	PI = 3.14
	def Foo.sin(x)
		puts "调用了sin函数，参数为#{x}"
	end
end

# 方法调用
Foo.sin 10

# 常量
puts Foo::PI
```

**require**

require 语句类似于 C 和 C++ 中的 include 语句以及 Java 中的 import 语句。

```ruby
$LOAD_PATH << '.'

require "test"

Test.sin Test::PI
```


**include**

您可以在类中嵌入模块。为了在类中嵌入模块，您可以在类中使用 include 语句

```ruby
# test.rb
module Test
	def cos(x)
		puts "调用了cos函数，参数是#{x}"
	end
end

# ruby.rb
$LOAD_PATH << '.'
require "test"

class Foo
include Test
	 def Foo.static_method
	 	Test::sin Test::PI
	 end

	 def member_method(x)
	 	Test::sin x
	 end
end

Foo.new.cos 10
```

### 面向对象

[面向对象](http://www.runoob.com/ruby/ruby-object-oriented.html)

```ruby
# box.rb文件
module Box
	class MainBox
		attr_accessor :width, :height
		def initialize (w, h)
			@width = w
			@height = h
		end

		def getArea
			@width * @height
		end
	end

	class BigBox < MainBox
		def getArea
			area = @width * @height
			puts "面积是#{area}"
		end
	end
end

# ruby.rb文件
$LOAD_PATH << '.'
require "box"

a = Box::MainBox.new(2, 3)
puts a.getArea

b = Box::BigBox.new(4, 5)
b.getArea

```
