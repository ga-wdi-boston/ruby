![General Assembly Logo](http://i.imgur.com/ke8USTq.png)

# Programming Fundamentals in Ruby (versus JavaScript)

## Prerequisites

- **[try ruby](http://tryruby.org/levels/1/challenges/0)**
- A working knowledge of JavaScript and **[REPL](http://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop)**s

## Introduction

The depth and breadth of the Ruby Core and Standard Library are so extensive that we'll always want to check them before building something ourselves.  This also means that the docs are our friends.  We should use them liberally.  We'll learn to remember the more common methods, but we'll also find occasion where the less common methods are the answer.

## Objectives

By the end of this, students should be able to:

- Convert types using object methods
- Use ruby string interpolation
- Create and call methods
- Control the flow of execution in a method

## Instructions

Fork and clone this repository, then

```bash
$ cd wdi_4_ruby_fundamentals
$ subl .
$ gem install pry
$ pry
```

```ruby
[1] pry(main)>
```

**[Pry](http://pryrepl.org/)** is the **[REPL](http://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop)** we'll use to experiment with ruby. Pry shows the value of the expression you entered on a line starting with `=> ` (the hash rocket).  It's also a tool used to debug ruby scripts.  We'll see how to use that feature later.

## A comparison of some features of Ruby and JavaScript.

We don't declare variables in ruby, we just use them.

```ruby
[1] pry(main)> counter
NameError: undefined local variable or method `counter' for main:Object
from (pry):1:in `__pry__'
[2] pry(main)>
```

But only after we've assigned the variable a value.

```ruby
[2] pry(main)> counter = 0
=> 0
[3] pry(main)> counter
=> 0
[4] pry(main)>

```

We'll cover scoping rules in another lesson.

Ruby doesn't have an increment operator (pre or post).  Use `+=` instead.

```ruby
[4] pry(main)> counter += 1
=> 1
[5] pry(main)> counter += 1
=> 2
[6] pry(main)> counter
=> 2
[7] pry(main)>
```

In Ruby, everything is an expression.  And many things you "do" are method calls on an object.  The exceptions are assignment, logical composition, control flow and blocks.  But Ruby provides special support for common operators.

### Brief aside: syntactic sugar

We've already seen one example.  `counter += 1` is really just Ruby making you type fewer characters to accomplish `counter = counter + 1` (just like JavaScript).  But there's more.

```ruby
[1] pry(main)> counter ||= 0
=> 0
[2] pry(main)> counter.+(1)
=> 1
[3] pry(main)> counter.+ 1
=> 1
[4] pry(main)> counter + 1
=> 1
[5] pry(main)> counter = counter + 1
=> 1
[6] pry(main)> counter += 1
=> 2
[7] pry(main)>
```

This feature becomes even more important and useful as we use and create more complicated objects.

#### Pair and share

In Pry, try out the operators we've used in JavaScript on numbers and numeric variables.  Use the method form and the assignment form with variables.  Does anything surprising happen?  Confusing?  Write those things down to share with the class.  Have a look in `operator_examples.rb` if you need some prompts.

### Differences and possible gotchas learning Ruby after JavaScript

- In Ruby, use `==` to test for equality, it produces the most predictable result. <!-- === (case, when) -->

- Use `.equal?` if we *need* to test for identity (two variables that reference the same object).

- Ruby has several different numeric types (unlike JavaScript), but most operations "do what we expect".

- Booleans: Only `false` and `nil` are falsy in Ruby.  Everything else is truthy.

- We don't need to use parentheses when invoking a method (as we saw above with the `+` method - one exception later).  But sometimes they add clarity

- The end of a line marks the end of an expression except for blocks and expressions that are continued with an operator at the end of a line. Semicolons are only required if you have two distinct expressions on one line (e.g. `name = "Antony"; age = 35`).

- The Ruby comment character is `#`.  Everything following a `#` on a line is ignored by the interpreter.

- p, [$stdout.]puts, [$stdout.]print are not directly analogous to console.log but are often used for a similar purpose when writing scripts run from the terminal

- Ruby's convention is to use underscores between words in names.  Constants start with a capital letter.

- Use Sublime tab completion to avoid the common, and hard to find error of `def method_name` without the closing `end`.

- Ruby doesn't implicitly convert numbers to strings (but we'll see some useful string behavior later).

```ruby
[1] pry(main)> name = "Antony"
=> "Antony"
[2] pry(main)> age = 35
=> 35
[3] pry(main)> puts age
35
=> nil
[4] pry(main)> puts name + " is " + age + " years old"
TypeError: no implicit conversion of Fixnum into String
from (pry):3:in `+'
[5] pry(main)> puts name + " is " + age.to_s + " years old"
=> "Antony is 35 years old"
```

## Methods

`def is_max? name; name == "Max"; end` creates a method that tests if its argument is Max.  The question mark is conventional for predicates.  We'll also see a trailing exclamation point, which is a convention for mutators (methods that change the object they are called on rather than returning a new object).

The value of a method invocation is the last expression evaluated (which may be a return expression).

All methods are defined on an object, contra JavaScript.

## Flow control

A Ruby `if` looks much like we'd expect, but note that we use `elsif` not `else if`, and that the boolean expression often don't require parentheses

```ruby
if is_max? name then
  "It's Max"
elsif name == "Matt" then
  "Matt"
else
  "Not Max or Matt"
end
```

`unless` is often used to replace an `if` with a negated test and no `elsif` or `else`.

```ruby
if !is_max? name then
  puts "Not Max!"
end
```

Versus

```ruby
unless is_max? name then
  puts "Not Max!"
end
```

A `while` loop executes

```ruby
while is_max? name do
  $stdout.puts "Enter 'Max' to continue"
  name = $stdin.gets.chomp
end
```

## Strings

Strings objects have a large number of methods.  You can see what they are in Pry by type a `.` after a string variable name then hitting tab (or by running pet = "Manfred"; pet.methods.sort).

Strings objects come with several conversion methods that all start `to_` and then a letter or abbreviation hinting at what conversion they perform.  `to_i` and `to_f` are used commonly.

### String interpolation

Inside a pair of double quotes, Ruby will replace `#{<ruby expression>}` with the value of that expression

```ruby
[1] pry(main)> name = "Antony"
=> "Antony"
[2] pry(main)> age = 35
=> 35
[3] pry(main)> "#{name} is #{age} years old"
=> "Antony is 35 years old"
[4] pry(main)> "ten + seven == #{10 + 7}"
=> "ten + seven == 17"
[5] pry(main)>
```

## Numbers

Numbers come with conversion operators as well, including `to_i` and `to_f`.

## Pair and share

In Pry, or online, select one or more methods each on string and number objects that you think are especially useful or useless.  Be prepared to share your reasons with the rest of the class.

## Pry Demo

```bash
$ subl pry/demo.rb
```

## Pry lab

### We're stuck in loops!

- Run the script `pry/lab.rb` in a terminal: `$ ruby pry/lab.rb`
- At each binding.pry you'll be kicked into pry.
- Change the value of the strings to break out of the loop.  Be clever and prepared to share with the class!
- Type `exit` to resume program execution.
- Try typing `exit` without changing anything to see what happens.
- When you get to the bottom of the lab, you're done.

Check using Pry or ruby documentation for ways to change the values

## Additional Resources

- **[Links to a variety of offical language and api documentation](https://www.ruby-lang.org/en/documentation/)**
- **[rubymonk](https://rubymonk.com/)**
- **[why's (poignant) Guide to Ruby](http://mislav.uniqpath.com/poignant-guide/)**
