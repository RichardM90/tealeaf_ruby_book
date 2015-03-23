

# old syntax
old_syntax_hash = {:name => 'bob'}

# new syntax
new_hash = {name: 'bob'}

# hashes can also have  many key-value pairs
person = { height: '6 ft', weight: '160 lbs' }

# add to an existing hash
person[:hair] = 'brown'
person[:age] = 62

# remove from an existing hash
person.delete(:age)

# retrieve a piece of information from a hash
person[:weight]

# merge two hashes
person.merge!(new_hash)

# iterating over hashes
person = {name: 'bob', height: '6 ft', weight: '160 lbs', hair: 'brown'}

#person.each do |key, value|
#  puts "Bob's #{key} is #{value}"
#end


# hashes as optional parameters
def greeting(name, options = {})
  if options.empty?
    puts "Hi, my name is #{name}"
  else
    puts "Hi, my name is #{name} and I'm #{options[:age]}" +
         " years old and I live in #{options[:city]}."
  end
end


# hashes as parameters
my_hash = {
  "Herman"=>{"age"=>74, "gender"=>"other"}, 
  "Lily"=>{"age"=>72, "gender"=>"other"}
  }

def change_hash(hash_param)
  new_hash = {"age"=>444, "gender"=>"other"}
  hash_param['Grandpa'] = new_hash
end

p my_hash
change_hash(my_hash)
p my_hash

my_hash = {
  "Herman"=>{"age"=>74, "gender"=>"other"}, 
  "Lily"=>{"age"=>72, "gender"=>"other"}
  }

def dont_change_hash(hash_param)
  new_hash = {"age"=>444, "gender"=>"other"}
  local_hash = {}
  hash_param.each { |k, v| local_hash[k] = v }
  local_hash['Grandpa'] = new_hash
  local_hash
end

p my_hash
p dont_change_hash(my_hash)
p my_hash





#greeting("Bob")
#greeting("Bob", {age: 62, city: "New York City"})


# the key doesn't have to be a symbol, though only in old style
#{"height" => "6 ft"}     # string as key
#{["height"] => "6 ft"}   # array as key
#{1 => "one"}             # integer as key
#{45.324 => "forty-five point something"}  # float as key
#{{key: "key"} => "hash as a key"}  # hash as key


# has_key?
# The has_key? method allows you to check if a hash contains a specific key. It returns a boolean value.
#name_and_age = { "Bob" => 42, "Steve" => 31, "Joe" => 19}
#if name_and_age.has_key?("Steve")
#  puts "Steve is in the hashes"
#elsif name_and_age.has_key?("Richard")
#  puts "Steve is in the hashes"
#else
#  puts "Neither Steve nor Richard is in the hashes"
#end


# select
# The select method allows you to pass a block and will return any key-value pairs that evaluate to true when ran through the block.
#name_and_age = { "Bob" => 42, "Steve" => 31, "Joe" => 19}
#puts name_and_age.select { |k,v| k == "Bob" }
#puts name_and_age.select { |k,v| (k == "Bob") || (v == 19) }


# fetch
# The fetch method allows you to pass a given key and it will return the value for that key if it exists. You can also specify an option for return if that key is not present.
#puts name_and_age.fetch("Steve")
#puts name_and_age.fetch("Larry")
#puts name_and_age.fetch("Larry", "Larry isn't in this hash")


# to_a
# The to_a method returns an array version of your hash when called. Let's see it in action. It doesn't modify the hash permanently though.
#puts name_and_age.to_a


# key and values
#puts "Keys: " + name_and_age.keys.to_s
#puts "Values: " + name_and_age.values.to_s
#name_and_age.keys.each { |k| puts k }


# exercise 1
def exercise1
  family = {  uncles: ["bob", "joe", "steve"],
              sisters: ["jane", "jill", "beth"],
              brothers: ["frank","rob","david"],
              aunts: ["mary","sally","susan"]
            }
  puts "Exercise 1:"
  immediate_family = family.select { |k,v| k == :sisters || k == :brothers }
  arr = immediate_family.values.flatten
  puts arr
end
#exercise1


# exercise 2
def exercise2
  puts "Exercise 2:"
  a = { bob: 62, carl: 35, jason: 46 }
  b = { jason: 32, richard: 48 }
  new_a = a.merge(b)
  puts a
  puts new_a
  a = { bob: 62, carl: 35, jason: 46 }
  b = { jason: 32, richard: 48 }
  new_a = a.merge!(b)
  puts a
  puts new_a
end
#exercise2


# exercise 3
def exercise3
  puts "Exercise 3:"
  family = { mum: "Jo", dad: "Richard", daughter: "Emma" }
  # my answer
  family.each { |k,v| puts k } 
  family.each { |k,v| puts v } 
  family.each { |k,v| puts "#{k} = #{v}" } 
  # the answer
  family.each_key { |k| puts k } 
  family.each_value { |v| puts v } 
  family.each { |k,v| puts "#{k} = #{v}" } 
end
#exercise3


# exercise 4
def exercise4
  person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}
  # my answer
  name = person.fetch(:name)
  puts name
  # the answer
  puts person[:name]
end
#exercise4


# exercise 5
# determine if a hash contains a specific value
def exercise5(value)
  family = { mum: "Jo", dad: "Richard", daughter: "Emma" }
  if family.has_value?(value)
    puts "#{value} is in family"
  else
    puts "#{value} is NOT in family"
  end
end
#exercise5("Emma")
#exercise5("Dilbert")


def exercise6
  words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

  # my answer
  words_left = words.dup
  until words_left.empty?
  	matching_words = []
  	non_matching_words = []
    starting_word = words_left.first
    matching_words << starting_word
    words_left.delete(starting_word)
    words_left.each do |test_word|
      if exercise6_match(starting_word, test_word)
        matching_words << test_word
      else
        non_matching_words << test_word
      end
    end
    p matching_words
    words_left = non_matching_words.dup
  end
  
  # the answer
  result = {}

  words.each do |word|
    key = word.split('').sort.join
    if result.has_key?(key)
      result[key].push(word)
    else
      result[key] = [word]
    end
  end
  
  result.each do |k, v|
    puts "------"
    p v
  end
  
end
def exercise6_match(word1, word2)
  word1.each_char do |char|
    if word2.include? char
      next
    else
      return false
    end
  end
  return true
end
#exercise6


# merging a new key-value pair to an existing nested hash
def example6
  h = { "a" => { date: "Jan", value: 123  }   }
  p h.fetch("a")
  h["a"].merge!({ title: "hello"  })
  p h.fetch("a")
end
example6



