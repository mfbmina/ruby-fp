# function composition is an operation that takes two functions f and g and produces a function h such that h(x) = g(f(x)).
# In this operation, the function g is applied to the result of applying the function f to x.
# That is, the functions f : X → Y and g : Y → Z are composed to yield a function that maps x in X to g(f(x)) in Z.

# Translating to ruby:

def f(x)
  x + 1
end

def g(y)
  y + 2
end

def h(z)
  z + 3
end

puts h(g(f(1)))

# More readable

f_resp = f(1)
g_resp = g(f_resp)
h_resp = h(g_resp)

puts h_resp

# procs make it easier and beatiful:

f = ->(x) { x + 1 }

g = ->(y) { y + 2 }

h = ->(z) { z + 3 }

resp = f >> g >> h

puts resp.call(1)
