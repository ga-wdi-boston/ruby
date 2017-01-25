[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# Programming Fundamentals in Ruby

You've already learned the basics of programming with JavaScript, and you've
begun to think like a problem-solver. You've had practice reading JS code and
predicting execution by evaluating expressions in your mind.

We'll continue to reinforce the basics of programming, but this time with Ruby.
This may seem like a lot of material to cover in a short time, but the truth is
our task is simpler than it was when we introduced JS. Instead of teaching you
how to program, we'll focus on the *differences* between Ruby and JS with the
goal of utilizing the foundation we've already built.

"Polyglot" is a term used to refer to someone who can use two or more
programming languages. By learning two languages, we increase your understanding
of basic programming concepts, as well as give you an edge in job the market.

You will reference this material again and again over the next few weeks. Focus
on noting the differences between Ruby and JS. You should use this material as
you would the [HyperPolyglot](http://hyperpolyglot.org/scripting) reference: not
as reading material, but as a handy place to define and experiment with the basics of Ruby.

## Prerequisites

-   [ga-wdi-boston/js-basics](https://github.com/ga-wdi-boston/js-basics)
-   [ga-wdi-boston/js-reference-types](https://github.com/ga-wdi-boston/js-reference-types)

## Objectives

By the end of this, developers should be able to:

-   Use Ruby REPL and interpreter to run Ruby code.
-   Understand basic language features and types in Ruby.
-   Write a fizzbuzz script in Ruby.
-   List and use common operators in Ruby.
-   Identify operators in an expression and explain what it does.
-   List all 6 Ruby object types and give an example of each.

## Preparation

1.  [Fork and clone](https://github.com/ga-wdi-boston/meta/wiki/ForkAndClone)
    this repository.
1.  Install dependencies with `bundle install`.

## Outline

In order to accomplish our learning objectives, we've got quite a number of Ruby features to cover. These include:

-   Running scripts from the command line.
-   Evaluating code interactively in a REPL.
-   Variable declaration and naming conventions.
-   Strings, interpolation, and concatenation.
-   Methods and functions, including predicates.
-   Fixnums, Floats, and Numbers.
-   Falsiness.
-   Flow control.
-   Loops, ranges, and enumerable iteration.
-   Implicit and explicit returns.
-   Expression evaluation and conditional assignment.
-   Type coercion.
-   Logic, shortcut evaluation, and operator precedence.

## Foreword

The depth and breadth of the [Ruby Core](http://ruby-doc.org/core-2.2.0/) and
[Standard Library](http://ruby-doc.org/stdlib-2.2.0/) are so extensive that
we'll always want to check them before building something ourselves.  The
official Ruby docs are our friends, and we should use them liberally.  Over
time, we'll learn to remember the more common methods, but even then it can be
extremely useful to consult the documentation.

## Pry

```sh
gem install pry
pry
```

**[Pry](http://pryrepl.org/)** is a console-based **[REPL](http://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop)** for working with Ruby. Simply type in an expression into Pry, and it returns the result (preceded by `=> `, also known as a 'hash rocket').

```ruby
[1] pry(main)> 1 + 1
=> 2
[2] pry(main)>
```

> In addition to allowing us to run code one line at a time, Pry can also be
> used (like the `node-debug` REPL we saw in Unit 1) to interactively debug our
> code. Though we won't be focusing on that aspect of Pry today, it'll be a
> critical tool throughout the rest of this unit.

Let's use `pry` to explore some of the fundamentals of the Ruby language.

## Ruby :: Core Syntax, Variables, and Operators

### Semicolons

One of the first things you might notice about Ruby is a conspicuous lack of
semicolons.

```ruby
[1] pry(main)> 1
=> 1
```

The end of a line (almost always) marks the end of an expression; semicolons
are only required if you have two distinct expressions on one line
(e.g. `name = "Antony"; age = 35`). The most likely place where you might spot
a semicolon in Ruby is inside a `for` loop, and those (as you'll soon see) are
used *very* infrequently in Ruby.

### Variable Declaration

Ruby handles variables differently than we've seen in previously. In Ruby,
variables can be simply defined, **without previously being declared.** This
means that with Ruby, we don't need keywords like `let` and `const` before variables.
We can simply declare the variable and assign it a value `variable = value`


```ruby
[1] pry(main)> a = 1
=> 1
```

However, this only works if we assign the variable a value. Why? Because
otherwise, Ruby will default to trying to *evaluate* your variable, and because
 you haven't defined it yet, Ruby will throw an error.

```ruby
[1] pry(main)> counter
NameError: undefined local variable or method 'counter' for main:Object
from (pry):1:in '__pry__'
[2] pry(main)> counter = 0
=> 0
[3] pry(main)> counter
=> 0
[4] pry(main)>
```

Ruby has its own set of scoping rules for variables, just like JavaScript does,
and they work in (mostly) similar ways.

### Operators

In Ruby, everything is an expression - a statement composed of a combination
 of operands (data) and operations. In JavaScript, things like `+` and `-` are
 *true operators* - keywords built into the language itself, and embued with
 fixed, unchangeable meanings. In Ruby, in contrast, most "operators" you
 encounter are actually method calls on some object; the main exceptions
 are assignment operators (e.g. `=`), logical operators
 (e.g. `||`, `&&`, `!`), and control flow operators (e.g. `and`, `or`, `not`).

#### Brief Aside: Syntactic Sugar

Ruby doesn't have an increment operator, either pre (`++i`) or post (`i++`).
Use `+=` instead.

```ruby
[4] pry(main)> counter += 1
=> 1
[5] pry(main)> counter += 1
=> 2
[6] pry(main)> counter
=> 2
[7] pry(main)>
```

`counter += 1` is really just Ruby making you type fewer characters to
accomplish `counter = counter + 1`. This is commonly referred to as
'syntactic sugar' - when a programming language has syntax that's deliberately
designed to make code shorter/more semantic/easier to write. Ruby has a *ton*
of syntactic sugar. JavaScript allows us to use this shorthand too; however,
Ruby takes things a step further, providing this 'syntactic sugar' for a
variety of operators, including `*`, `-`, and even `||`.

```ruby
[1] pry(main)> counter ||= 0          # counter = counter || 0
=> 0
[2] pry(main)> counter += 1           # counter = counter + 1
=> 1
[3] pry(main)> counter *= 5           # counter = counter * 5
=> 5
[4] pry(main)> counter -= 1           # counter = counter - 1
=> 4
```

#### Lab: Pry

In pairs, open up `pry` and take five minutes trying out the operators we've
used in JavaScript on numbers and numeric variables. Does anything surprising
or confusing happen? Write those things down to share with the class.  Have a
look in [operator_examples.rb](bin/operator_examples.rb) if you need some
prompts.

## Ruby :: Strings

To see all the methods that strings have in Ruby, open up `pry`, type a string followed by
a '.', and hit tab; alternatively, you can call `"some string".methods.sort`
for a full list. And, of course, the Ruby documentation has
[a full list](http://ruby-doc.org/core-2.2.0/String.html) as well.

Strings objects come with several conversion methods that all start `to_` and
then a letter or abbreviation hinting at what conversion they perform.
`to_i` and `to_f` are used commonly - these convert the string into one of two
types of numbers, *integers* (whole numbers) and *floats* (decimal numbers).

### String Interpolation

Ruby attributes different meanings to single-quoted and
double-quoted strings. Single-quoted strings are referred to as
*'string literals'*; they interpret their contents as a literal sequence
of characters, with only two recognized escape sequences - `\'` and `\\`.
Double-quoted strings, in contrast, support a much wider variety of escape
characters, including `\n` (new line), `\t` (tab), and `\s` (space); if `\n`
appeared in a single-quoted string, it would be interpreted as the
character `\` followed by the character `\n`, rather than a new line.

One neat thing that comes out of this is the ability to do
*string interpolation*, inserting variables directly into the middle of a
string.

In Ruby,because Ruby doesn't implicitly convert numbers to strings, so all those
string conversions need to be done manually using `.to_s`.

```ruby
[1] pry(main)> name = "Lauren"
=> "Lauren"
[2] pry(main)> age = 28
=> 28
[3] pry(main)> puts age
28
=> nil
[4] pry(main)> puts name + " is " + age + " years old"
TypeError: no implicit conversion of Fixnum into String
from (pry):3:in '+'
[5] pry(main)> puts name + " is " + age.to_s + " years old"
=> "Lauren is 28 years old"
```

Fortunately, Ruby does give us an alternative - at least with double-quoted
strings. If the sequence `#{ ... }` appears inside a double-quoted string,
Ruby will replace it with the value of the expression inside the curly braces,
converted to a string.

So instead of:

```ruby
[1] pry(main)> name = "Lauren"
=> "Lauren"
[2] pry(main)> age = 28
=> 35
[3] pry(main)> name + " is " + age.to_s + " years old."
=> "Lauren is 28 years old."
```

We can use:

```ruby
[1] pry(main)> name = "Lauren"
=> "Lauren"
[2] pry(main)> age = 28
=> 28
[4] pry(main)> "#{name} is #{age} years old"
=> "Lauren is 28 years old"
```

This also works:

```ruby
[5] pry(main)> "ten + seven == #{10 + 7}"
=> "ten + seven == 17"
```

### Lab: String Methods

In your pairs, go to the Ruby documentation for strings (link above), and look
up three of the methods available to Ruby strings. Open up `pry` and test them
out on some sample strings. Try to incorporate string interpolation at least
once. Once you're done, we'll reconvene as a class and discuss the methods
we've explored.

## Ruby :: Flow Control

### Conditionals

```ruby
# Ruby version
if name == "Jason"
  puts "It's Jason"
elsif name == "Lauren"
  puts "It's Lauren"
else
  puts "Not Jason or Lauren"
end
```

A Ruby `if` looks quite similar to a JavaScript `if`. Some of the major
differences are:

-   In Ruby, we use `elsif`, not `else if`.
-   Conditions don't require parentheses (though they can still accept them).
-   No curly braces required. Simply break up your condition from your code
-   with a newline (as above), a semicolon, or the keyword `then`
-   (e.g. `if .... then `).
-   The end of the `if` is indicated by the keyword `end`. `end` is an extremely
-   common keyword in Ruby, appearing at the end of pretty much any contiguous
-   section of code.

`unless` can sometimes be used to replace an `if` with a negated test and no
`elsif` or `else`.

```ruby
if !(name == "Jason")
  puts "Not Jason!"
end
```

becomes

```ruby
unless name == "Jason"
  puts "Not Jason!"
end
```

### Loops

Similarly to `if`, a `while` loop also looks almost the same in Ruby as it does
 in JavaScript.

```ruby
i = 0
while i < 10 do |i|
  i += 1
end
```

The `do ... end`
 is a common construction in Ruby because it specifies what's known as a
 **block**, a grouping of several lines of code. We'll learn more about
 blocks soon.

`for` loops in Ruby exist, but are not commonly used. Instead, we use the
[upto](http://ruby-doc.org/core-2.2.0/Integer.html#method-i-upto) enumerator.
We'll learn more about enumerators soon.

```ruby
1.upto(max) do |i|
  # code to execute in loop
end
```


### Code Along: `upto`

In our `pry` consoles, let's enter:

```ruby
1.upto(10) do |i|
  puts i
end
```

What do you expect to print? What does print?

### Lab: FizzBuzz

This time, rather than using `pry`, we're going to write a longer program in
Atom, and then run it in the terminal using `ruby`, a command line Ruby
environment. Open up the file [fizzbuzz.rb](lib/fizzbuzz.rb);
in pairs, you're going to solve "FizzBuzz", a simple programming challenge
based on a childrens' game. Essentially, your program should print out all of
the numbers from 1 up to `max_num`, which is a variable to which you can assign
 an arbitrary (positive, integer) value. However, if a number is divisible by
 3, instead of printing the number, your program should print the word "fizz";
 for numbers divisible by 5, it should print "buzz"; for numbers divisible by
 both 3 **and** five, it should print "fizzbuzz".

To run your code, simply type navigate to the root of this repository and run
`ruby lib/fizzbuzz.rb`

> This should seem familiar, since it's exactly what we were doing with `node`
> in Unit 1. It's a deliberate similarity - Node was modeled off of other
> console-based runtime environments, as a way of giving JavaScript a solid
> platform for running on the server side.

## Ruby :: Methods

Ruby draws no distinction between functions that are properties of objects and
functions that aren't; in Ruby, all of them are called 'methods'.

To define a method, you use the following syntax:

```ruby
def square? (num)
  Math.sqrt(num).to_i**2 == num
end
```

The question mark is conventional for methods that return a boolean.  Another
common convention in Ruby is a trailing exclamation point, which indicates that
 a method is a 'mutator' - this means that the method changes the object that
 it is called from, rather than returning a new object.

> This behavior is also sometimes referred to as operating 'in place'.

Ruby methods use an *implicit return* - by default, they will return the value
last expression evaluated (which may or may not be a return expression).
However, Ruby does also have a `return` keyword which, as it does in
JavaScript, immediately terminates the function/method and sends back a value.
In the case of the method above, `square?` will return the value of that last
expression, `Math.sqrt(num).to_i**2 == num`.

### Lab: Fizzbuzz Method

Take your code from the previous exercise and turn it into a method called
`fizzbuzz`; this method should accept an argument, `max_num`.

At the end of your program, add the following two lines:

```ruby
binding.pry
''
```

`binding.pry` inserts a breakpoint into the program; this will cause the
program to stop and let us look around. The second line, with the empty
string, is only necessary because `binding.pry` won't work if it's the last
line in your program - it needs to stop *before* something else.

Once you're finished writing your method, run the program with
`ruby fizzbuzz.rb`; the console should take you to `pry`, allowing you to
read from (and even write to) your program. Once there, try calling your
`fizzbuzz` method with the following arguments : 10, 15, 30, 50. Does your
code work like you'd expect?

## Ruby :: Collections

### Arrays

Arrays in Ruby are almost identical to arrays in JavaScript, down to the
square braces.

```ruby
[1] pry(main)> my_array = ["a","b","c"]
=> ["a","b","c"]
[2] pry(main)> my_array[0]
=> "a"
[4] pry(main)> my_array[2] = "z"
=> "z"
[5] pry(main)> my_array
=> ["a","b","z"]
```

### Hashes

A Ruby hash acts somewhat like a dictionary in JavaScript, in that it consists
of pairs of keys and values.

```ruby
[1] pry(main)> dict = {}
=> {}
[2] pry(main)> dict["a"] = 23
=> 23
[3] pry(main)> dict["a"]
=> 23
```

However, there are a couple of important differences. For instance, Ruby
hashes do not allow you to access their keys through a dot notation; you
*must* use square braces.

### Lab: FizzBuzz with Hashes

In pairs, edit your fizzbuzz code, adding a hash containing keys `"fizz"`,
`"buzz"`, `"fizzbuzz"`, and `"other"`, each with arrays as values. As you
iterate through all the numbers from 1 to `max_num`, add each number to one
of the arrays mentioned above; numbers divisible by 3 *only* should go into
the `"fizz"` array, numbers divisible by 5 *only* should go into the ``"buzz"``
 array, numbers divisible by both should go into the `"fizzbuzz"` array, and
 numbers divisible by neither should go into the `"other"` array. Finally,
 once you're done, return the hash as the result of `fizzbuzz`.

Run your code from the console using `ruby`, and check your work using `pry`.

## Common Gotchas When Learning Ruby After JavaScript

-   `==` and `===` mean different things between the two languages. In
JavaScript, `===` is a 'strict equality' comparator, while `==` is a
'loose equality' comparator; since `==` has some weird exceptions, the
convention is to almost always use `===`.

**In Ruby, however, the reverse is true; you should `==` to test for equality,
and *not* use `===`** (which does something different).

-   Use `.equal?` if we *need* to test for identity (two variables that
reference the same object).

-   Ruby has several different numeric types (unlike JavaScript),
but most operations "do what we expect".

-   Booleans: Only `false` and `nil` are falsy in Ruby.
Everything else is truthy.

-   We don't need to use parentheses when invoking a method (as we saw above
with the `+` method - one exception later).  But sometimes they add clarity,
so it can be beneficial to include them.

-   The Ruby comment character is `#`.  Everything following a `#` on a line
is ignored by the interpreter.

-   p, [$stdout.]puts, [$stdout.]print are not directly analogous to
console.log but are often used for a similar purpose when writing scripts
run from the terminal

-   Ruby's convention is to use underscores between words in names (a.k.a.
'snake_case').  Constants start with a capital letter.

-   Use Atom tab completion to avoid the common, and hard to find error of
writing `def method_name` and forgetting the closing `end`. Good indentation
will help with this as well.

-   Ruby doesn't implicitly convert numbers to strings.

## Additional Resources

-   **[Links to a variety of offical language and api documentation](https://www.ruby-lang.org/en/documentation/)**
-   **[why's (poignant) Guide to Ruby](http://mislav.uniqpath.com/poignant-guide/)**

## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.
