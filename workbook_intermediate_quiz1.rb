

# For this exercise, write a one-line program that creates 10 lines of the 
# following:
# The Flintstones Rock!
# The Flintstones Rock!
#  The Flintstones Rock!
def exercise1
  str = 'The Flintstones Rock!'
  
  10.times { |index| puts " "*index + str }
  
  # the answer
  10.times{ |index| puts str.rjust(21 + index) }
end
#exercise1


# Create a hash that expresses the frequency with which each letter occurs in 
# this string:
def exercise2
  str = "The Flintstones Rock"
  
  # my answer
  hash = {}
  str.chars.each do |letter| 
    if hash.has_key?(letter)
      hash[letter] = hash.fetch(letter)+1
    else
      hash[letter] = 1
    end
  end
  p hash
  
  # the answer
  result = {}
  letters = ('A'..'Z').to_a.concat( ('a'..'z').to_a )
  letters.each do |letter|
    count = str.scan(letter.to_s).count
    result[letter] = count if count > 0
  end
  p result
end
#exercise2


# The result of the following statement will be an error:
#   puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix this?
def exercise3
  answer = (40 + 2)
  puts "the value of 40 + 2 is #{answer}"
  puts "the value of 40 + 2 is #{(40 + 2)}"
  # the answer
  puts "the value of 40 + 2 is " + (40+2).to_s
end
#exercise3


# What happens when we modify an array while we are iterating over it?
def exercise4
  # What would be output by this code?
  p "question 1"
  ary = [1, 2, 3, 4]
  ary.each do |item|
    p item
    ary.shift(1)
  end
  # What would be output by this code?
  p "question 2"
  ary = [1, 2, 3, 4]
  ary.each do |item|
    p item
    ary.pop(1)
  end
end
#exercise4


# Alan wrote the following method, which was intended to show all of the 
# factors of the input number:
# Alyssa noticed that this will fail if you call this with an input of 0 or a 
# negative number and asked Alan to change the loop. How can you change the 
# loop construct (instead of using begin/end/until) to make this work?
def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end
def my_factors(number)
  dividend = number
  divisors = []
  case 
    when number > 0
      begin
        divisors << number / dividend if number % dividend == 0
        dividend -= 1
      end until dividend == 0
    when number < 0
      begin
        divisors << number / dividend if number % dividend == 0
        dividend += 1
      end until dividend == 0
  end
  divisors
end
def the_answer_factors(number)
  dividend = number
  divisors = []
  while (dividend > 0) do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end
# Bonus 1
# What is the purpose of the number % dividend == 0 ?
# my answer = checks to see if number divides by dividend with no remainder
# Bonus 2
# What is the purpose of the second-to-last line in the method (the divisors 
# before the method's end)?
# my answer = returns the divisors array to the caller
def exercise5
  p the_answer_factors(-10)
end
#exercise5


# Exercise 6
# Is there a difference between the two, other than what operator she chose to 
# use to add an element to the buffer?
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end
# my answer = yes, the first one affects the input array where as the second 
# one doesn't, so the first mutates the input array



# Alyssa asked Ben to write up a basic implementation of a Fibonacci 
# calculator, A user passes in two numbers, and the calculator will keep 
# computing the sequence until some limit is reached.
# Ben coded up this implementation but complained that as soon as he ran it, 
# he got an error. Something about the limit variable. What's wrong with the 
# code?
limit = 15

def fib(first_num, second_num)
  while second_num < limit
    sum = first_num + second_num
    p "#{first_num} + #{second_num} = #{sum}"
    first_num = second_num
    second_num = sum
  end
  sum
end

def exercise7
  result = fib(0,1)
  puts "result is #{result}"
end
#exercise7



# my answer = the variable limit has not been defined as a global variable, 
# which should begin with $

# the answer = Ben defines limit before he calls fib. But limit is not visible 
# in the scope of fib because fib is a method and does not have access to any 
# local variables outside of its scope.
# You can make limit an additional argument to the definition of the fib method 
# and pass it in when you call fib.



# In another example we used some built-in string methods to change the case 
# of a string. A notably missing method is something provided in Rails, but 
# not in Ruby itself...titleize! This method in Ruby on Rails creates a string 
# that has each word capitalized as it would be in a title.

# Write your own version of the rails titleize!

def titleise(title)
  #arr = title.split
  #str = arr.map! { |e| e.capitalize }
  #str = arr.join(" ")
  #return str
  # my answer
  p title.split.map { |e| e.capitalize }.join(" ")
  # the answer
  p title.split.map{ |one_word| one_word.downcase.capitalize }.join(' ')
end
def exercise8
  titleise("hello thEre, how are you")
end
#exercise8



# One of the more frequent issues we run into when designing an application 
# is a shortage of screen real-estate. We often find it necessary to show an 
# abbreviated form of a long text field. Following tradition, this is 
# typically done by chopping off the end of the string and punctuating it 
# with an "ellipsis" (also known as a "three dot", "…" ).

# Add a method to the Ruby String class that will take an input parameter and 
# apply this form of shortening and return a shortened string with an ellipsis 
# (but only when the string is too long to start with.)

# Once you have that done, use it to print out a table of this list of 
# characters with no field larger than 32 characters in width.

# my answer
class String
  def shorten(len = 32)
    ellipsis = ' ...'
    if self.length > (len - ellipsis.length - 1)
      return self[0..(len - ellipsis.length - 1)] + ellipsis
    else
      return self
    end
  end
end

# the answer
class String
  def short_version( length )
    result = self.dup
    starting_length = self.length
    if starting_length > length
      result = result[ 0, length - 1 ]
      result += "…"
    end
    return result
  end
end

def exercise9
  characters = [
    {:character=>"Batman", :real_name=>"Bruce Wayne", :description=>"Comic book superhero who fights crime while wearing a costume loosely based on a bat"}, 
    {:character=>"Robin", :real_name=>"Dick Grayson", :description=>"Loyal sidekick for batman -- much younger and smaller and sometimes portrayed by girl in later episodes"},
    {:character=>"Commisioner Gordon", :real_name=>"James Gordon", :description=>"Police Commisioner of Gotham City and loyal friend of Batman -- frequently communicates secretly with Batman via signals or a special red BatPhone"}, 
    {:character=>"Alfred", :real_name=>"Alfred", :description=>"The butler and also a key support player in many episodes providing communications, armament, and also moral support to Batman"}
    ]

    # my answer
    characters.each do |hero|
      p "Character: #{hero.fetch(:character).shorten}"
      p "Real name: #{hero.fetch(:real_name).shorten}"
      p "Description: #{hero.fetch(:description).shorten}"
    end
    
    # the answer
    characters.each{ |character| p character.values.map{|value| value.short_version(32) }.join("    ") }
    
end
#exercise9
 


# Augment the following hash such that it has additional key value pairs giving
# us a "demographic" key that has one of three values describing the age group 
# the family member is in (kid, adult, senior):

def exercise10
  hash = { 
    "Herman" => { "age" => 32, "gender" => "male" }, 
    "Lily" => { "age" => 30, "gender" => "female" }, 
    "Grandpa" => { "age" => 402, "gender" => "male" }, 
    "Eddie" => { "age" => 10, "gender" => "male" },
    "Marilyn" => { "age" => 23, "gender" => "female"}
  }
  
  # my answer 
  hash.each do |key, value|
    age = value.fetch("age")
    demographic = ""
    case
      when age < 18
        demographic = "kid"
      when age < 60
        demographic = "adult"
      else
        demographic = "senior"
    end
    demo_hash = { "demographic" => demographic }
    value.merge!(demo_hash)
    hash[key] = value
  end
  p hash

  hash = { 
    "Herman" => { "age" => 32, "gender" => "male" }, 
    "Lily" => { "age" => 30, "gender" => "female" }, 
    "Grandpa" => { "age" => 402, "gender" => "male" }, 
    "Eddie" => { "age" => 10, "gender" => "male" },
    "Marilyn" => { "age" => 23, "gender" => "female"}
  }

  # the answer
  age_of_majority = 18
  dotage = 65
  hash.each do | key, value |
    value[:demographics] = "kid" if value["age"] < age_of_majority
    value[:demographics] = "adult" if (age_of_majority..dotage).include? value["age"]
    value[:demographics] = "senior" if value["age"] >= dotage
  end

  p hash
end
exercise10


