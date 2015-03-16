

# exercise 1
# a program that checks to see if a given number appears in the array
def exercise1(number)
  arr = [1, 3, 5, 7, 9, 11]

  if arr.include?(number)
    puts "Number #{number} is in the array"
  else
    puts "Number #{number} is NOT in the array"
  end
end
#exercise1(3)
#exercise1(4)


# exercise 3
# How do you print the word "example" from the following array?
def exercise3()
  arr = [["test", "hello", "world"],["example", "mem"]]

  puts arr[1][0]
  puts arr.last.first
end
#exercise3()


# exercise4
# What does each method return in the following example?
def exercise4()

  arr = [15, 7, 18, 5, 12, 8, 5, 1]

  #1. arr.index(5)
  # my answer = 3 CORRECT
  puts arr.index(5)

  #2. arr.index[5]
  # my answer = ?
  # the answer = invalid syntax
  #arr.index[5]

  #3. arr[5]
  # my answer = 8 CORRECT
  puts arr[5]

end
#exercise4()



# exercise5
# What is the value of a, b, and c in the following program?
def exercise5()

  string = "Welcome to Tealeaf Academy!"
  a = string[6]
  b = string[11]
  c = string[19]

  # a = string[6]
  # my answer = e
  puts a

  # b = string[11]
  # my answer = T
  puts b

  # c = string[19]
  # my answer = A
  puts c

end
#exercise5()


# exercise 6
# whats the problem with this?
# => names = ['bob', 'joe', 'susan', 'margaret']
#    names['margaret'] = 'jody'
def exercise6
  names = ['bob', 'joe', 'susan', 'margaret']
  puts names
  names[3] = 'jody'
  puts names
end
#exercise6


# exercise 7
# Write a program that iterates over an array and builds a new array that is the result of incrementing each value in the original array by a value of 2. You should have two arrays at the end of this program, The original array and the new array you've created. Print both arrays to the screen using the p method instead of puts.
def exercise7

  # my answer
  a = [1, 2, 3, 4, 5, 6, 7]
  b = a.map { |x| x+2 }
  p a
  p b

  # the answer
  arr = [1, 2, 3, 4, 5]
  new_arr = []
  arr.each do |n|
    new_arr << n + 2
  end
  p arr
  p new_arr
end
exercise7

