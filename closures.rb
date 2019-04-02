# Closure is a technique for implementing lexically scoped name binding in a language with first-class functions.
# Operationally, a closure is a record storing a function together with an environment.

# The environment is a mapping associating each variable of the function (variables that are used locally, but defined in an enclosing scope)
# with the value or reference to which the name was bound when the closure was created.

# Unlike a plain function, a closure allows the function to access those captured variables
# through the closure's copies of their values or references, even when the function is invoked outside their scope

# The term closure is often used as a synonym for anonymous function but an anonymous function is a function literal without a name,
# while a closure is an instance of a function, a value, whose non-local variables have been bound either to values or to storage locations

# Closures typically appear in languages in which functions are first-class values—in other words,
# such languages enable functions to be passed as arguments, returned from function calls, bound to variable names, etc.,
# just like simpler types such as strings and integers.

# In ruby, you can find four closure types: blocks, lambdas, procs and methods. They can be executed like this:

class Array
  def my_each(&block)
    i = 0
    while i < size
      yield at(i)
      i += 1
    end
  end
end

# Blocks is a chunck of code that can be passed to an object/method and is executed under the context of that object.

[1, 2, 3, 4, 5].my_each  { |element| puts element }

# proc is an instance of Proc, which holds a code block to be executed, and can be stored in a variable.

my_proc = Proc.new { |element| puts element }

my_proc.call(100)

[1, 2, 3, 4, 5].my_each(&my_proc)

# ambda is a way to define a block & its parameters with some special syntax

my_lambda = ->(element) { puts element }

my_lambda.call(100)

[1, 2, 3, 4, 5].my_each(&my_lambda)

# lambdas are like procs with two main differences:
# 1. lambdas raises an error when the number of parameters does not match.
# 2. using return inside a proc (which is inside a function), it behaves as though using return inside the function

# Return using a Proc
def foo
  f = Proc.new { return "return from proc" }
  f.call # control leaves foo here
  return "return from foo"
end

# Return using a lambda
def bar
  f = lambda { return "return from lambda" }
  f.call # control does not leave bar here
  return "return from bar"
end

puts foo # prints "return from proc"
puts bar # prints "return from bar"

# When using the function `method`, it makes the function executable from another function

def my_method(element)
  puts element
end

[1, 2, 3, 4, 5].my_each(&method(:my_method))

# References:
# https://en.wikipedia.org/wiki/Closure_(computer_programming)
# https://www.sitepoint.com/functional-programming-techniques-with-ruby-part-ii/
