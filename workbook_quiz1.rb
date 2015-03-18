

# exercise 3
# Replace the word "important" with "urgent" in this string:
def exercise3
  str = "Few things in life are as important as house training your pet dinosaur."
  # my answer
  new_str = str.split.map {|e| e == "important" ? "urgent" : e }.join(" ")
  p new_str
  # the answer
  str.gsub!('important', 'urgent')
  p str
end
#exercise3

  
# exercise 4
# What would the following return?
def exercise4
  
  # my answer = [1, 3, 4, 5]
  arr = [1, 2, 3, 4, 5]
  arr.delete_at(1)
  p arr
  
  # my answer = [2, 3, 4, 5]
  arr = [1, 2, 3, 4, 5]
  arr.delete(1)
  p arr
end
#exercise4


# exercise 5
# Programmatically determine if 42 lies between 10 and 100.
def exercise5
  
  a = 42
  
  # my answer
  p (10..100) === a ? "yes, #{a} lies between 10 and 100" : "no, #{a} does not lie between 10 and 100"
  
  # the answer
  answer = (10..100).cover?(42)
  p answer
end
#exercise5


# exercise 6
# show two different ways to put the expected "Four score and " in front of it.
def exercise6
  str = "and seven years ago..."
  
  p "Four score and " + str
  p "Four score and #{str}"
  # other answer
  p str.prepend("Four score and ")
end
#exercise6

# exercise 7
# Fun with gsub:
def add1(num)
  num + 4
end
def exercise7
  num = 2
  
  how_deep = "num"
  10.times{ how_deep.gsub!("num", "add1(num)") }
  p how_deep
  p eval(how_deep)
  p num
end
# exercise7


# exercise 8
# Make this into an un-nested array.
def exercise8
  arr = ["Fred", "Wilma"]
  arr << ["Barney", "Betty"]
  arr << ["BamBam", "Pebbles"]
  # gives --> ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
  p arr
  p arr.flatten
  # the answer
  arr.flatten!
  p arr
end
#exercise8


# exercise 9
# Programmatically get an array with Barney's name and number
def exercise9
  arr_hash = {"Fred"=>0, "Wilma"=>1, "Barney"=>2, "Betty"=>3, "BamBam"=>4, 
    "Pebbles"=>5}
  arr = []  
  arr = arr_hash.assoc("Barney")
  p arr
end
exercise9


# exercise 10
# Turn this array into a hash where the names are the keys and the values are 
# the positions in the array.
def exercise10
  arr = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
  # my answer
  arr_hash = {}
  arr.each_with_index { |e, i| arr_hash.store(e, i) }
  p arr_hash
  # the answer
  arr_hash = {}
  arr.each_with_index do |value, index|
    arr_hash[value] = index
  end
  p arr_hash
end
exercise10