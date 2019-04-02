# There is two basic principles to call a function pure:
# 1. It must return the same value if it has the same arguments
# 2. The function evaluation must have zero side effects. No mutation.

# I/O is inherently impure: input operations undermine referential transparency, and output operations create side effects.
# Nevertheless, there is a sense in which function can perform input or output and still be pure,
# if the sequence of operations on the I/O devices is modeled as an argument and a result,
# and I/O operations are taken to fail when the input sequence doesn't describe the operations taken since the program began execution.

# The second point ensures that the only sequence usable as an argument must change with each I/O action;
# the first allows different calls to an I/O function to return different results on account of the sequence arguments having changed.

# The I/O monad is a programming idiom typically used to perform I/O in pure functional languages.

# Pure function examples

def sum(a, b)
  a + b
end

def max(a, b)
  a > b ? a : b
end

def square(a)
  a**a
end

# Impure function examples

@a = 1

def f
  # Breaks rule 1. Same return value is not guaranteed.
  @a
end

def f
  # Breaks rule 1 and 2. Same return value is not guaranteed and it is mutating a variable.
  @a += 1
end

def f
  # Breaks rule 2. It is mutating a variable.
  x = 0
  x += 1
  x
end

def f
  # Breaks rule 2. It is mutating a string.
  string = "Hello"
  string << " world!"
end
