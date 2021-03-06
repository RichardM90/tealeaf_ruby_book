

# Hashes are commonly found to be more complex than the simple one we saw 
# earlier:
#   hash = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# It is often the case that each key points to another hash instead of a single 
# value:
#   hash = { 
#     "Herman" => { "age" => 32, "gender" => "male" }, 
#     "Lily" => { "age" => 30, "gender" => "female" }, 
#     "Grandpa" => { "age" => 402, "gender" => "male" }, 
#     "Eddie" => { "age" => 10, "gender" => "male" } 
#   }
# Figure out the total age of just the male members of the family.

def exercise1
  hash = { 
    "Herman" => { "age" => 32, "gender" => "male" }, 
    "Lily" => { "age" => 30, "gender" => "female" }, 
    "Grandpa" => { "age" => 402, "gender" => "male" }, 
    "Eddie" => { "age" => 10, "gender" => "male" } 
    }

  # my answer
  total_age = 0
  hash.each do |key, value|
    if value.fetch("gender") == "male"
      total_age += value.fetch("age")
    end
  end
  p total_age
  
  # the answer
  total_male_age = 0
  hash.each do |key, value|
    male_family_member = value["gender"] == "male"
    total_male_age += male_family_member ? value["age"] : 0
  end
  p total_male_age
end
#exercise1


# Augment the following hash such that it has additional key value pairs that 
# can act as a "sort index" which will allow us to quickly re-arrange a list 
# of our family members as either sorted by name-length or sorted by their 
# original order as shown here:
# (hint...you will likely discover some "missing" methods that exist in Array, 
# but not in Hash. This is likely because a Hash object had no order at all in 
# earlier versions of Ruby.)
def exercise2_print_hash(hash)
  hash.each { |k,v| puts "#{k} => #{v}" }
end
def exercise2
  hash = { 
      "Herman" => { "age" => 32, "gender" => "male" }, 
      "Lily" => { "age" => 30, "gender" => "female" }, 
      "Grandpa" => { "age" => 402, "gender" => "male" }, 
      "Eddie" => { "age" => 10, "gender" => "male" } 
  }

  # my answer
  hash.each_with_index do |(key,value), index|
    value[:original_order] = index
    value[:name_length] = key.length
  end
  p "Original Order"
  exercise2_print_hash(hash)
  p "After Sort By Name Length"
  exercise2_print_hash(hash.sort_by { |key, value| value[:name_length] }.to_h)
  p "After Sort By Original Order"
  exercise2_print_hash(hash.sort_by { |key, value| value[:original_order] }.to_h)

  # the answer
  p "THE ANSWER"
  hash = { 
      "Herman" => { "age" => 32, "gender" => "male" }, 
      "Lily" => { "age" => 30, "gender" => "female" }, 
      "Grandpa" => { "age" => 402, "gender" => "male" }, 
      "Eddie" => { "age" => 10, "gender" => "male" } 
  }
  index = 0
  hash = hash.each{ |key, value| value[:original_order] = index; index += 1 }
  hash = hash.each{ |key, value| value[:length_order] = key.length }
  hash.to_a.sort{|a, b| a[1][:original_order] <=> b[1][:original_order] }.each{ |item| puts item }
  hash.to_a.sort{|a, b| a[1][:length_order] <=> b[1][:length_order] }.each{ |item| puts item }
end
#exercise2


# One of the most frequently used real-world string properties is that of 
# "string substitution", where we take a hard-coded string and modify it with 
# various parameters from our program.
# Given this previously seen family hash, print out the name, age and gender 
# of each family member:
# ...like this:
#   (Name) is a (age) year old (male or female).
def exercise3
  hash = { 
      "Herman" => { "age" => 32, "gender" => "male" }, 
      "Lily" => { "age" => 30, "gender" => "female" }, 
      "Grandpa" => { "age" => 402, "gender" => "male" }, 
      "Eddie" => { "age" => 10, "gender" => "male" },
      "Marilyn" => { "age" => 23, "gender" => "female"}
  }

  hash.each do |key, value|
    puts "#{key} is a #{value['age']} year old #{value['gender']}."
  end
end
#exercise3


# In an earlier exercise we saw that depending on variables to be modified by 
# called methods can be tricky:
# We learned that when the above "coincidentally" does what we think we wanted 
# "depends" upon what is going on inside the method.
# How can we refactor this exercise to make the result easier predict and 
# easier for the next programmer to maintain?
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabega"
  an_array_param << "rutabega"
end

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabega"
  # an_array_param = []
  an_array_return_param = []

  # this wasn't in the original but otherwise the original
  # array is mutated
  an_array_param.each do |n|
    an_array_return_param << n
  end
  an_array_return_param << "rutabega"

  # return a_string_param, an_array_param
  return a_string_param, an_array_return_param
end

def exercise4
  my_string = "pumpkins"
  my_array = ["pumpkins"]
  tricky_method(my_string, my_array)

  puts "My string looks like this now: #{my_string}"
  puts "My array looks like this now: #{my_array}"

  my_string = "pumpkins"
  my_array = ["pumpkins"]
  a_string_param, an_array_param = not_so_tricky_method(my_string, my_array)

  puts "My string looks like this now: #{my_string}"
  puts "My array looks like this now: #{my_array}"
end
#exercise4


# A quick glance at the docs for the Ruby String class will have you scratching
# your head over the absence of any "word iterator" methods.
# Our natural inclination is to think of the words in a sentence as a 
# collection. We would like to be able to operate on those words the same way 
# we operate on the elements of an array. Where are the String#each_word and 
# the Array#map_words methods?
# A common idiom used to solve this conundrum is to use the String#split and 
# String#join methods to break our string up and then put it back together 
# again.
# Use this technique to break up the following string and put it back together 
# with the words in reverse order:
#   str = "Humpty Dumpty sat on a wall."
def my_exercise5(str)
  # my answer
  str.split.reverse.join(" ")
end

def the_exercise5(str)
  # the answer
  ary = str.split(/\W/)
  ary.reverse!
  str = ary.join(' ') + '.'
end

#p my_exercise5("Humpty Dumpty sat on a wall.")
#p the_exercise5("Humpty Dumpty sat on a wall.")


# What is the output of the following code?
def mess_with_it(some_number)
  some_number += 8
end

def exercise6
  answer = 42
  new_answer = mess_with_it(answer)
  p answer - 8
end

# my answer = 34
#exercise6


# Did the family's data get ransacked, or did the mischeif only mangle a local 
# copy of the original hash? (why?)

def mess_with_demographics(demo_hash)
    demo_hash.values.each do | family_member |
      family_member["age"] += 42
      family_member["gender"] = "other"
    end
end

def exercise7
  munster_hash = { 
       "Herman" => { "age" => 32, "gender" => "male" }, 
       "Lily" => { "age" => 30, "gender" => "female" }, 
       "Grandpa" => { "age" => 402, "gender" => "male" }, 
       "Eddie" => { "age" => 10, "gender" => "male" },
       "Marilyn" => { "age" => 23, "gender" => "female"}
      }

  mess_with_demographics(munster_hash)
  p munster_hash
end
#exercise7


# In a previous exercise we created a monkey patch for the Ruby String class
# which could be used to get a shortened version of the string. That solution 
# uncerimoniously lopped off the end of the string at a specific character 
# count. That works, but it can be ugly when it cuts a word down the middle.

# Write a new patch called pretty_short_version which will return a string that 
# ends on a word boundary and is never longer than the length parameter.

# If the first word is too long, the solution should fall back to just 
# shortening the first word.

# Don't forget to leave room for and append the ellipsis at the end.


# my answer
class String
  def pretty_shorten(len = 32)
    ellipsis = '...'
    len_less_ellipsis = len - ellipsis.length - 1
    result = self.dup
    if self.length > len
      result = self[/^.{0,#{len_less_ellipsis}}\W/]
      if result == nil
        result = self[0..len_less_ellipsis]
      end
      result += ellipsis
    end
    return result
  end
end

# the answer
class String
  def pretty_short_version( length )
    result = self.dup
    starting_length = self.length
    if starting_length > length
        length -= 1   # leave room for ellipsis
        words = result.split
        result = words.shift
        result = result[0, length] if result.length > length
        result += ' ' + words.shift while(!words.empty? && ((result.length + words.first.length + 1) < length))
        result += "…"
    end

    return result
  end
end

def exercise8
  characters = [
    {:character=>"Batman", :real_name=>"Bruce Wayne", :description=>"Comic book superhero who fights crime while wearing a costume loosely based on a bat"}, 
    {:character=>"Robin", :real_name=>"Dick Grayson", :description=>"Loyal sidekick for batman -- much younger and smaller and sometimes portrayed by girl in later episodes"},
    {:character=>"Commisioner Gordon", :real_name=>"James Gordon", :description=>"Police Commisioner of Gotham City and loyal friend of Batman -- frequently communicates secretly with Batman via signals or a special red BatPhone"}, 
    {:character=>"Alfred", :real_name=>"Alfred", :description=>"The butler and also a key support player in many episodes providing communications, armament, and also moral support to Batman"},
    {:character=>"OneWord", :real_name=>"One Word", :description=>"123456789012345678901234567890"},
    {:character=>"LongWord", :real_name=>"One Long Word", :description=>"1234567890123456789012345678901234567890"}
    ]

    # my answer
    characters.each do |hero|
      p "Character: #{hero.fetch(:character).pretty_shorten}"
      p "Real name: #{hero.fetch(:real_name).pretty_shorten}"
      p "Description: #{hero.fetch(:description).pretty_shorten}"
    end
    
    # the answer
    characters.each{ |character| p character.values.map{|value| value.pretty_short_version(32) }.join("    ") }
    
end
#exercise8


# Method calls can take expressions as arguments. Suppose we define a function 
# called rps as follows, which follows the classic rules of rock-paper-scissors 
# game, but with a slight twist that it declares whatever hand was used in the 
# tie as the result of that tie.
# What is the result of the following call?
def rps(fist1, fist2)
  if (fist1 == "rock")
    (fist2 == "paper") ? "paper" : "rock"
  elsif (fist1 == "paper")
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

# my answer = paper 
def exercise9
  puts rps( rps( rps("rock", "paper"), rps("rock", "scissors")), "rock")
end
# exercise9


# Consider these two simple methods:
def foo(param="no")
  "yes"
end

def bar(param="no")
  param == "no" ? "yes" : "no"
end

# What would be the output of this code?
# my answer = no
def exercise10
  p maybe = bar(foo())
end
exercise10


