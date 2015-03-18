

# exercise 1
# In this hash of people and their age, see if there is an age 
# present for "Spot".
def exercise1
  hash = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
  
  # my answer
  person = "Spot"
  if hash.include?(person)
    p "The age of #{person} is #{hash.fetch(person)}"
  else
    p "No entry for #{person}"
  end
  p hash["Spot"]
  p hash["Grandpa"]
  
  # the answer
  answer = hash.has_key?("Spot")
  p answer
  # bonus answer
  p hash.include?("Spot")
  p hash.member?("Spot")
  p hash.key?("Spot")
end
#exercise1


# exercise 2
# Add up all of the ages from our current Munster family hash:
def exercise2
  hash = {"Herman"=>32, "Lily"=>30, "Grandpa"=>5843, "Eddie"=>10, "Marilyn"=>22, "Spot"=>237}

  # my answers
  total = 0
  hash.values.each { |e| total += e }
  p total
  
  total = 0
  hash.each_value { |e| total += e }
  p total
  
  # the answer
  total_age = hash.values.inject(:+)
  p total_age
end
#exercise2


# exercise 3
# In the age hash: throw out the really old people.
def exercise3
  hash = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
  
  # my answer
  p hash
  hash.delete_if { |key, value| value > 65 }
  p hash
  
  # the answer
  hash = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
  p hash
  hash.keep_if{ |key, value| value < 65 }
  p hash
  
end
#exercise3


# exercise 4
# Convert the string in the following ways (code will be executed on original 
# str above):
def exercise4
  str = "The Munsters are creepy in a good way."
  p str.capitalize
  p str.swapcase
  p str.downcase
  p str.upcase
end
#exercise4


# exercise 5
# We have most of the Munster family in our age hash:
# add ages for Marilyn and Spot to the existing hash
def exercise5
  hash = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
  rest = { "Marilyn" => 22, "Spot" => 237 }
  
  p hash.merge(rest)
end
#exercise5


# exercise 6
# Pick out the minimum age from our current Munster family hash:
def exercise6
  hash = {"Herman"=>32, "Lily"=>30, "Grandpa"=>5843, "Eddie"=>10, 
    "Marilyn"=>22, "Spot"=>237}
  p hash.values.min
  p hash.select { |k,v| v == hash.values.min }
end
#exercise6


# exercise 7
# See if the string below calls out "Dino" by name:
def exercise7
  str = "Few things in life are as important as house training your pet dinosaur."
  
  # my answer
  p str.include?("Dino")
  
  # the answer
  p str.match("Dino")
end
#exercise7


# exercise 8
# In the array: Find the index of the first name that starts with "Be"
def exercise8
  arr = %w(Fred Barney Wilma Betty BamBam Pebbles)
  p arr
  
  # my answer
  arr.each_with_index do |name, index| 
    if name.start_with?("Be")
      p index
    end
  end
  
  # the answer
  p arr.index{ |name| name[0, 2] == "Be" }
end
#exercise8


# exercise 9
# Using array#map!, shorten each of these names to just 3 characters:
def exercise9
  arr = %w(Fred Barney Wilma Betty BamBam Pebbles)
  
  p arr.map! { |name| name[0,3] }
end
exercise9


# exercise 10
# Again, shorten each of these names to just 3 characters -- but this time do 
# it all on one line:
# Already did this ...


