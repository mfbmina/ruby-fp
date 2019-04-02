# An immutable object is an object whose state cannot be modified after it is created.
# This is in contrast to a mutable object, which can be modified after it is created.

# Immutable variables are usually knows as constants. For example:

class Foo
  BAR = 'myconstant'.freeze
end

# In some cases, an object is considered immutable even if some internally used attributes change,
# but the object's state appears unchanging from an external point of view.
# This is called weakly immutability. Certain fields of an object can be immutable even though other parts of the object may be changeable.
# If all fields are immutable, then the object is immutable.
# If the whole object cannot be extended by another class, the object is called strongly immutable.

# For example, an object that uses memoization to cache the results of expensive computations could still be considered an immutable object.

def f
  @f ||= 1 # some expensive operation...
end

# Strings and other concrete objects are typically expressed as immutable objects
# to improve readability and runtime efficiency in object-oriented programming.
# There are two ways to achieve this:
# 1. Adding frozen_string_literal: true as a commenting in the beggining of the file
# 2. Running ruby  with --enable-frozen-string-literal option. E.g. ruby --enable-frozen-string-literal your_file.rb

# When using this option, all string literals are frozen by default.

name = 'Matheus'
name.upcase! #=> RuntimeError: can't modify frozen String

# If you want a mutable string you have to do it using the String methods .new or .dup

x = String.new('Matheus')
x.upcase!
puts x #=> 'MATHEUS'

# and so is this
y = 'Matheus'.dup
y.upcase!
puts y #=> 'MATHEUS'

# There are some techniques to deal with immutable objects such as copying references or copying on write. E.g.

class MyClass
  attr_reader :foo, :bar

  def initialize(**attributes)
    @foo = attributes[:foo]
    @bar = attributes[:bar]
  end

  def attributes
    { foo: foo, bar: bar}
  end
end

object = MyClass.new(foo: 'foo', bar: 'bar')
attributes = object.attributes.merge(bar: 'mynewvalue')
MyClass.new(attributes)

# Immutable objects are also useful because they are inherently thread-safe, simpler to understand and offer higher security.

# References:
# https://en.wikipedia.org/wiki/Immutable_object
