

# What do you expect to happen when the greeting variable is referenced in the 
# last line of the code below?
# my answer = the "if false" condition is not true so the greeting variable 
# will not be initialised, I therefore expect the greeting line to raise an
# unknown variable error message
# the answer = greeting is nil here, and no "undefined method or local variable"
# exception is thrown. Typically, when you reference an uninitialized variable, 
# Ruby will throw an exception, stating that it’s undefined. However, when you 
# initialize a local variable within an if block, even if that if block doesn’t 
# get executed, the local variable is initialized to nil.
def exercise1
  if false
    greeting = "hello world"
  end
  
  p greeting
end
#exercise1


# What is the result of the last line in the code below?
# my answer = this will output the contents of the hash
#   { :a => 'hi' }
# the answer = The output is {:a=>"hi there"}. The reason is because 
# informal_greeting is a reference to the original object. The line 
# informal_greeting << ' there' was using the String#<< method, which modifies 
# the object that called it. This means that the original object was changed, 
# thereby impacting the value in greetings. If instead of modifying the 
# original object, we wanted only modify informal_greeting but not greetings, 
# there are a couple of options:
# * we could initialize informal_greeting with a reference to a new object 
#   containing the same value by informal_greeting = greetings[:a].clone.
# * we can use string concatenation, informal_greeting = informal_greeting + 
#   ' there', which returns a new String object instead of modifying the 
#   original object.
def exercise2
  greetings = {a: 'hi'}
  informal_greeting = greetings[:a]
  informal_greeting << ' there'
  
  puts informal_greeting  #  => "hi there"
  puts greetings
end
#exercise2


# What will be printed?
# my answer = ???
# the answer = the string variables are unchanged by the method
def mess_with_vars1(one, two, three)
  one = two
  two = three
  three = one
end

def exercise3a
  one = "one"
  two = "two"
  three = "three"

  mess_with_vars1(one, two, three)

  puts "one is: #{one}"
  puts "two is: #{two}"
  puts "three is: #{three}"
end
#exercise3a


# What will be printed?
# my answer = the same result as a, the string variables are
# unchanged
def mess_with_vars2(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

def exercise3b
  one = "one"
  two = "two"
  three = "three"

  mess_with_vars2(one, two, three)

  puts "one is: #{one}"
  puts "two is: #{two}"
  puts "three is: #{three}"
end
#exercise3b



# What will be printed?
# my answer = the string variables are affected by the method so one = "two", 
# two = "three", and three = "one"
def mess_with_vars3(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

def exercise3c
  one = "one"
  two = "two"
  three = "three"

  mess_with_vars3(one, two, three)

  puts "one is: #{one}"
  puts "two is: #{two}"
  puts "three is: #{three}"
end
#exercise3c



# What will be printed?
# my answer = 1, 2, 3, 4; the each method does not affect the original
# array, it returns the original array
# the answer= the lambda is working on its own local variable
def exercise4a
  numbers = [1, 2, 3, 4]
  da_lamb = lambda { |input| input *= 10 }
  numbers.each &da_lamb
  puts numbers.inspect
end
#exercise4a


# What will be printed?
# my answer = 40; the regexp will match a numeric digit followed by 0 and will
# mutate da_string with the result
def exercise4b
  da_string = "10"
  puts da_string.object_id
  numbers = [1, 2, 3, 4]
  da_lamb = lambda { |input| da_string.gsub!(/\d0/,(input * 10).to_s) }
  numbers.each &da_lamb
  puts da_string
  puts da_string.object_id
end
#exercise4b


# What will be printed?
# my answer = the << operator appends to the existing object (mutates) so 
# da_string will contain "10203040"
def exercise4c
  da_string = ""
  puts da_string.object_id
  numbers = [1, 2, 3, 4]
  da_lamb = lambda { |input| da_string << (input * 10).to_s }
  numbers.each &da_lamb
  puts da_string
  puts da_string.object_id
end
#exercise4c


# What will be printed?
# my answer = the + operator returns a new string so da_string will become a 
# new object for each iteration, the result will be "10203040"
# the answer = A lambda gets it's scope from the scope where it is defined. It 
# does not have a scope of its own.
def exercise4d
  da_string = ""
  puts da_string.object_id
  numbers = [1, 2, 3, 4]
  da_lamb = lambda { |input| da_string = da_string + (input * 10).to_s }
  numbers.each &da_lamb
  puts da_string
  puts da_string.object_id
end
#exercise4d


# What will be printed?
# my answer = da_string is not affected by the method as a new string is 
# assigned to the variable, it is a local variable
# the result will be "original"
def exercise4e
  da_string = "original"
  puts da_string.object_id
  numbers = [1, 2, 3, 4]
  def call_me(da_string, numbers)
    da_string = "not so original"
    da_lamb = lambda { |input| da_string = da_string + (input * 10).to_s }
    numbers.each &da_lamb
  end
  call_me(da_string, numbers)
  puts da_string
  puts da_string.object_id
end
#exercise4e


# Write a method that returns one UUID when called with no parameters.
# 8-4-4-4-12
# f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91
# my answer 
def get_uuid
  str = ""
  32.times { |i| str << rand(16).to_s(16) }
  str = str[0..7] + '-' + str[8..11] + '-' + str[12..15] + '-' + str[16..19] + '-' + str[20..31]
  return str
end
# the answer
def generate_UUID
    characters = [] 
    (0..9).each{ | digit | characters << digit.to_s}
    ('a'..'f').each{ | digit | characters << digit}

    uuid = ""
    sections = [8, 4, 4, 4, 12]
    sections.each_with_index do |section, index|
      section.times{ uuid += characters.sample }
      uuid += '-' unless index >= sections.size - 1
    end

    return uuid
end
# my adapted answer
def generate_uuid
  hex_characters = [] 
  (0..15).each { |digit| hex_characters << digit.to_s(16) }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    uuid += hex_characters.sample(section).join
    uuid += '-' unless index >= sections.size - 1
  end

  return uuid
end
def exercise5
  puts get_uuid
  puts generate_UUID
  puts generate_uuid
end
#exercise5


# In a previous exercise we mentioned the absence of a very useful 
# String#map_words! method in Ruby. We used String#split and Array#join methods 
# to approximate such a method.
# In this exercise, use this method together with "monkey patching" and yield to 
# add a map_words! method to the String class.
# Once you have that, use it to word-by-word reverse the following string:
#   statement = "Herman Munster is a BIG BIG man." 
#   should become: "namreH retsnuM si a GIB GIB nam."
# my answer
class String
  def my_map_words!
    arr = self.split(/\W/)
    arr.map! { |e| e.reverse }
    replace(arr.join(' ') + '.')
  end
end
# the answer
class String
  def map_words!
    punctuation = self.match(/\p{Punct}$/)[0] || ''
    words = self.split(/\W/)
    words.map! { |word| yield word }
    self.replace( words.join(' ') + punctuation )
    return self
  end
end
# my adapted answer
class String
  def my_adapted_map_words!
    punctuation = self.match(/\p{Punct}$/)[0] || ''
    words = self.split(/\W/)
    if block_given? 
      words.map! { |word| yield word }
    end
    self.replace( words.join(' ') + punctuation )
    return self
  end
end
def exercise6
  my_str = "Herman Munster is a BIG BIG man."
  my_str.my_map_words!
  puts my_str
  my_str = "Herman Munster is a BIG BIG man."
  my_str.map_words! {|word| word.reverse}
  puts my_str
  my_str = "Herman Munster is a BIG BIG man."
  my_str.my_adapted_map_words! {|word| word.reverse}
  puts my_str
  my_str = "Herman Munster is a BIG BIG man."
  my_str.my_adapted_map_words!
  puts my_str
end
#exercise6


# Ben was tasked to write a simple ruby method to determine if an input string 
# is an IP address representing dot-separated numbers. e.g. "10.4.5.11".
# He is not familiar with regular expressions.
# Alyssa supplied Ben with a method - is_a_number? to determine if a string is 
# a number and asked Ben to use it.

# def dot_separated_ip_address?(input_string)
#   dot_separated_words = input_string.split(".")
#   while dot_separated_words.size > 0 do
#     word = dot_separated_words.pop
#     break if !is_a_number?(word)
#   end
#   return true
# end

# Alyssa reviewed Ben's code and says "It's a good start, but you missed a few 
# things. You're not returning a false condition, and not handling the case that
# there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or 
# "1.2.3.4.5" should be invalid)."

# Help Ben fix his code.

def is_an_integer?(input)
  str = input.to_s
  return false if str.empty?
  !str.match(/[^0-9]/)
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false if !is_an_integer?(word)
    return false if word.to_i < 0 or word.to_i > 255
  end
  return true
end
def print_ip_address_validity(ip)
  if dot_separated_ip_address?(ip)
    puts "#{ip} is a valid IP address"
  else
    puts "#{ip} is NOT a valid IP address"
  end
end
def test_case_for_is_an_integer?
  arr = ["1", 2, "three", "4our", "1.2", 2.5, ""]
  arr.each { |e| puts "Is #{e} an integer? " + is_an_integer?(e).to_s }
end
def exercise7
  print_ip_address_validity("192.168.1.1")
  print_ip_address_validity("192.168.1.255")
  print_ip_address_validity("192.168.1.256")
  print_ip_address_validity("192.168.1")
  print_ip_address_validity("192.168.1.1.1")
  print_ip_address_validity("192.168..1")
  print_ip_address_validity("192.168.one.2")
  print_ip_address_validity(".192.168.1.1")
  print_ip_address_validity(".192.168.1")
  print_ip_address_validity("wibble")
  print_ip_address_validity("")
end
#test_case_for_is_an_integer?
exercise7

