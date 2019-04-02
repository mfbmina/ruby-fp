# currying is the technique of translating the evaluation of a function that takes multiple arguments
# into evaluating a sequence of functions, each with a single argument.

# It provides a way of automatically managing how arguments are passed to functions.
# For example, a function that takes two arguments, one from X and one from Y, and produces outputs in Z,
# by currying is translated into a function that takes a single argument from X and produces as outputs functions from Y to Z.

add = ->(x, y, z) { x + y + z}

puts add.curry.(1).(2).(3)

# Currying is related to, but not the same as, partial function.

add_curry = add.curry

partial_function = add_curry.(1)
puts partial_function.(2).(3)
