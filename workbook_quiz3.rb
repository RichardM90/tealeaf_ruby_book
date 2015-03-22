

# Show an easier way to write this array:
def exercise1
  arr = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
  p arr
  
  arr = %w(Fred Barney Wilma Betty BamBam Pebbles)
  p arr
end
#exercise1


# How can we add the family pet "Dino" to our usual array:
def exercise2
  arr = %w(Fred Barney Wilma Betty BamBam Pebbles)
  arr << "Dino1"
  p arr
  
  arr.push("Dino2")
  p arr
  
  arr.unshift("Dino3")
  p arr
  
  arr.insert(0, "Dino4")
  p arr

  arr.concat(["Dino5"])
  p arr
end
#exercise2


# How can we add multiple items to our array? (Dino and Hoppy)
def exercise3
  arr = %w(Fred Barney Wilma Betty BamBam Pebbles)

  arr.concat(["Dino", "Hoppy"])
  p arr

  arr.insert(0, "Dino2", "Hoppy2")
  p arr
  
  # the answer
  arr.push("Dino3").push("Hoppy3")
  p arr

  arr << "Dino4" << "Hoppy4"
  p arr
  
  arr.concat(%w(Dino5 Hoppy5))
  p arr
end
#exercise3


# Shorten this sentence:
# ...remove everything starting with "house".
def exercise4
  str = "Few things in life are as important as house training your pet dinosaur."
  p str
  
  # my answer
  arr= str.scan(/\w+/)
  arr.delete("house")
  p arr.join(" ")
  
  # the answer
  p str.slice(0, str.index('house'))
  
  # my other after thought answer
  p str[0..str.index('house')-1]
end
#exercise4


# Write a one-liner to count the number of lower-case 't' characters in the 
# following string:
def exercise5
  str = "The Flintstones Rock!"
  
  # my answer
  p str.count("t")
  
  # the answer
  p str.scan('t').count
end
#exercise5

# Given these two strings:
# How can we easily compare their length?
def exercise6
  str1 = "Fred"
  str2 = "Barney"
  
  # my answer
  p str1.length
  p str2.length
  p str1.length == str2.length
  
  # the answer
  p comparison = str1.length <=> str2.length
end
#exercise6


# If we had a 40 character wide table of Flintstone family members, how could 
# we easily center that title above the table with spaces?
def exercise7
  title = "Flintstone Family Members"
  p title.center(40)
end
#exercise7


# Given our usual array:
# arrange the names in order of ascending length.
def exercise8
  arr = %w(Fred Barney Wilma Betty BamBam Pebbles)
  
  # my answer
  hash = {}
  arr.each { |e| hash[e] = e.length }
  p hash
  new_hash = Hash[hash.sort_by { |k,v| v }.map{|key, value| [key, value]}]
  puts "new_hash: #{new_hash.inspect}"
  p new_hash.keys
  
  # the answer
  p arr.sort{ |a, b| a.size <=> b.size }
end
#exercise8


# Sort our array:
# in the opposite order (descending length).
def exercise9
  arr = %w(Fred Barney Wilma Betty BamBam Pebbles)

  # my answer
  p arr.sort{ |a, b| a.size <=> b.size }.reverse
  
  # the answer
  p arr.sort{ |a, b| b.size <=> a.size }
end
#exercise9


# exercise10
# If we change our array just a bit (note the capitalization):
#   arr = %w( fred Barney Wilma betty BamBam Pebbles)
# and use the default alphabetical comparison of sort!, we get this odd result:
#   ["BamBam", "Barney", "Pebbles", "Wilma", "betty", "fred"]
# How can we use a built in method of string to get the intended result of a 
# normally alphabetically sorted list of names?
def exercise10
  arr = %w(fred Barney Wilma betty BamBam Pebbles)

  # my answer
  p arr.sort{ |a, b| a.upcase <=> b.upcase }
  
  # the answer
  p arr.sort { |a, b| a.casecmp(b) }
end
exercise10

