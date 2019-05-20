# Pattern matching is the act of checking a given sequence of tokens for the presence of the constituents of some pattern.
# In contrast to pattern recognition, the match usually has to be exact: "either it will or will not be a match."

case 0
in 0 | 1
  true
end
# => true

case 10
in 0 | 1
  true
end
# => NoMatchingPatternError

case 0
in 0 => aux
  aux
else
end
# => 0

case [1, 2, 3, 4, 5]
in a, *b
  b
end
# => [2, 3, 4, 5]

case { a: 'ofoo', b: 'fddffd' }
in a: a, **h
  h
end
# => {:b=>"fddffd"}
