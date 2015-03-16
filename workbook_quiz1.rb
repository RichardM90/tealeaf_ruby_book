

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
exercise5

