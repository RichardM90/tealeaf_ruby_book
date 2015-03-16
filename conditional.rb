
# example 1
# conditional.rb
def example1
  puts "Type a number"
  a = gets.chomp.to_i
  
  if a == 3
    puts "a is 3"
  elsif a == 4
    puts "a is 4"
  else
    puts "a is neither 3 or 4"
  end
end
#example1


# example 2
# the ternary operator
def example2
  p true ? "this is true" : "this is not true"
  # this is true
  p false ? "this is true" : "this is not true"
  # this is not true
end
# example2


# example 3 
# more ternary operator
def example3 
  a = 2
  if a > 1
    p "a > 1"
  else
    p "a <= 1"
  end
  
  # using ternary operator
  a > 1 ? "a > 1" : "a <= 1"
end
#example3


# example 4
# ranges as a conditional
def example4
  a = 42
  p (10..100) === a ? "yes" : "no"
  p "#{a} does lie between 10 and 100"
end
example4  


