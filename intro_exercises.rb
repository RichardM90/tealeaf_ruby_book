
# Exercise 1
# Use the each method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 
# and print out each value. 
def exercise1
  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].each { |e| puts e }
end
#exercise1


# Exercise 2
# Same as above, but only print out values greater than 5.
def exercise2
  arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  
  arr.each { |e| puts e if e > 5 }
end
#exercise2


# Exercise 3
# Now, using the same array from #2, use the select method to extract all odd 
# numbers into a new array.
def exercise3
  arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  # my answer 
  new_arr = arr.select { |e| e.odd? }
  p new_arr
  # the answer
  new_arr = arr.select { |number| number % 2 != 0 }
  p new_arr
end
#exercise3


# Exercise 4
# Append "11" to the end of the original array. Prepend "0" to the beginning.
def exercise4
  arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  arr.push(11)
  p arr
  # another possibility from the answer
  #arr << 11
  
  arr.unshift(0)
  p arr
  
end
#exercise4


# Exercise 5
# Get rid of "11". And append a "3".
def exercise5
  arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

  arr.delete(11)
  p arr
  # another possibility from the answer though assumes 11 is at the end
  #arr.pop

  arr.push(3)
  p arr
  
end
#exercise5


# Exercise 6
# Get rid of duplicates without specifically removing any one value.
def exercise6
  arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 3]

  p arr
  arr.uniq!
  p arr
end
#exercise6


# Exercise 7
# What's the major difference between an Array and a Hash?
def exercise7
  # An array is an indexed data structure
  # A hash is a named data structure of key-value pairs
  # The answer:
  # The major difference between an array and a hash is that a hash contains 
  # a key value pair for referencing by key.
end
# exercise7


# Exercise 8
# Create a Hash using both Ruby syntax styles.
def exercise8
  # Old style
  old_style_hash = { :name => "Richard", :age => 48, :height => "5ft 11in" }
  p old_style_hash
  # New style
  new_style_hash = { name: "Richard", age: 48, height: "5ft 11in" }
  p new_style_hash
end
#exercise8


# Exercise 9
# Suppose you have a hash h = {a:1, b:2, c:3, d:4}
# 1. Get the value of key `:b`.
# 2. Add to this hash the key:value pair `{e:5}`
# 3. Remove all key:value pairs whose value is less than 3.5
def exercise9
  h = {a:1, b:2, c:3, d:4} 
  p h
  # 1. Get the value of key `:b`.
  p h.fetch(:b)
  # 2. Add to this hash the key:value pair `{e:5}`
  h[:e] = 5
  p h
  # 3. Remove all key:value pairs whose value is less than 3.5
  h.delete_if { |k, v| v < 3.5 }
  p h
end
#exercise9


# Exercise 10
# Can hash values be arrays? Can you have an array of hashes? (give examples)
def exercise10
  
  # Can hash values be arrays?
  # Yes --> I didn't know this
  hash = {names: ['bob', 'joe', 'susan']}
  p hash
  
  # Can you have an array of hashes? 
  # Yes
  h = []
  h << { name: "Richard", age: 48 }
  h << { name: "Jo", age: 47 }
  h << { name: "Emma", age: 12 }
  p h[1]
  h.each_with_index { |e, i| p "Element #{i} is #{e}" }
  p h
end
#exercise10


# Exercise 12
# Given the following data structures. Write a program that moves the 
# information from the array into the empty hash that applies to the correct 
# person.
def exercise12
  
  contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

  contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
  
  # my answer
  contacts["Joe Smith"] = {
    email: contact_data[0][0],
    address: contact_data[0][1],
    phone: contact_data[0][2]
  }
  contacts["Sally Johnson"] = {
    email: contact_data[1][0],
    address: contact_data[1][1],
    phone: contact_data[1][2]
  }
  p contacts
  p contacts.fetch("Joe Smith").fetch(:email)
  
  # the answer
  contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
  contacts["Joe Smith"][:email] = contact_data[0][0]
  contacts["Joe Smith"][:address] = contact_data[0][1]
  contacts["Joe Smith"][:phone] = contact_data[0][2]
  contacts["Sally Johnson"][:email] = contact_data[1][0]
  contacts["Sally Johnson"][:address] = contact_data[1][1]
  contacts["Sally Johnson"][:phone] = contact_data[1][2]
  p contacts
  p contacts.fetch("Joe Smith").fetch(:email)
  
end
#exercise12


# Exercise 13
# Using the hash you created from the previous exercise, demonstrate how you 
# would access Joe's email and Sally's phone number?
def exercise13
  
  contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

  contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
  
  # my answer
  contacts["Joe Smith"] = {
    email: contact_data[0][0],
    address: contact_data[0][1],
    phone: contact_data[0][2]
  }
  contacts["Sally Johnson"] = {
    email: contact_data[1][0],
    address: contact_data[1][1],
    phone: contact_data[1][2]
  }
  p contacts
  p contacts.fetch("Joe Smith").fetch(:email)
  p contacts["Joe Smith"][:email]
  p contacts.fetch("Sally Johnson").fetch(:phone)
  p contacts["Sally Johnson"][:phone]
end
#exercise13


# Exercise 14
# In exercise 12, we manually set the contacts hash values one by one. Now, 
# programmatically loop or iterate over the contacts hash from exercise 12, and
# populate the associated data from the contact_data array.
def exercise14
  
  contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

  contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

  # my answer
  contacts["Joe Smith"] = {
    email: contact_data[0][0],
    address: contact_data[0][1],
    phone: contact_data[0][2]
  }
  contacts["Sally Johnson"] = {
    email: contact_data[1][0],
    address: contact_data[1][1],
    phone: contact_data[1][2]
  }
  p contacts
  
  # the answer
  contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
  contacts = {"Joe Smith" => {}}
  fields = [:email, :address, :phone]
  
  contacts.each do |name, hash|
    fields.each do |field|
      hash[field] = contact_data.shift
    end
  end
  p contacts
  
  # the bonus answer
  contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
  contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
  fields = [:email, :address, :phone]
  
  contacts.each_with_index do |(name, hash), idx|
    fields.each do |field|
      hash[field] = contact_data[idx].shift
    end
  end
  p contacts
end
#exercise14


# Exercise 15
# Use Ruby's Array method delete_if and String method start_with? to delete all 
# of the words that begin with an "s" in the following array.
def exercise15
  arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
  p arr
  arr.delete_if { |e| e.start_with?("s")   }
  p arr

  arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
  p arr
  arr.delete_if { |e| e.start_with?("s", "w") }
  p arr
end
#exercise15


# Exercise 16
# Turn the array into a new array that consists of strings containing one word.
# (ex. ["white snow", etc...] → ["white", "snow", etc...]. 
def exercise16
  arr = ['white snow', 'winter wonderland', 'melting ice',
          'slippery sidewalk', 'salted roads', 'white trees']
  p arr
  p arr.map { |e| e.split }.flatten.uniq.sort
end
#exercise16


# Exercise 17
# What will the following program output?
# my answer = false, they are not the same
# the answer = true, they are the same
def exercise17
  hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
  hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}
  
  p hash1, hash2
  
  if hash1 == hash2
    puts "These hashes are the same!"
  else
    puts "These hashes are not the same!"
  end
end
exercise17

