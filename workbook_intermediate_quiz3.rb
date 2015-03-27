

# Predict how the values and object ids will change throughout the flow of the 
# code below:

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block.\n\n"

  1.times do
    a_outer_inner_id = a_outer.object_id
    b_outer_inner_id = b_outer.object_id
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer.object_id} inside the block."
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer.object_id} inside the block."
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer.object_id} inside the block."
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer.object_id} inside the block.\n\n"

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0]

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after.\n\n"


    a_inner = a_outer
    b_inner = b_outer
    c_inner = c_outer
    d_inner = c_inner[0]

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer).\n\n"
  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block.\n\n"

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block.\n\n" rescue "ugh ohhhhh"
end

def exercise1
  fun_with_ids
end
#exercise1



# Let's call a method, and pass both a string and an array as parameters and 
# see how eventhough they are treated in the same way by Ruby, the results can 
# be different.
# Study the following code and state what will be printed...and why:

# my answer = the string is unchanged, the array is changed as a reference to 
# the original is passed rather than the values themselves

# the answer = The important distinction is that while a reference is passed, 
# the method makes up a new variable for both the string and the array, and 
# puts these references in these new variables...these are variables that only 
# live within the scope of the method.
# So if both parameters live inside the method as a new variable that stores a 
# reference to the passed object...why don't the string and the array behave 
# the same way in our output?????
# The difference lies in what Ruby does when the program executes either a 
# String#+= operation or an Array#<< operation.
# The string operation CREATES A NEW STRING OBJECT. The reference to this new 
# object is placed in the internal variable of the method, and the method
# considers this new string object to be the one true string. It has forgotten 
# about the one that was passed in now. That old stale parameter string is 
# still remembered by the caller of the method...but the method itself has 
# forgotten all about it.
# With the array, one array object can have any number of elements. When we 
# attach an additional element to an array using the << operator, Ruby simply
# keeps using the same object that was passed in, and appends the new element 
# to it.
# So, because the method's array variable still points to the original object, 
# the caller's array variable and the method's array variable are still
# pointing at the same object, and we see the results of what happened to the
# array "outside" of the method.

def tricky_method(a_string_param, an_array_param)
  puts "Within method before change"
  puts "Object ID for a_string_param = #{a_string_param.object_id}"
  puts "Object ID for an_array_param = #{an_array_param.object_id}"
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
  puts "Within method after change"
  puts "Object ID for a_string_param = #{a_string_param.object_id}"
  puts "Object ID for an_array_param = #{an_array_param.object_id}"
end

def exercise2
  my_string = "pumpkins"
  my_array = ["pumpkins"]
  puts "Before method"
  puts "Object ID for my_string = #{my_string.object_id}"
  puts "Object ID for my_array = #{my_array.object_id}"
  tricky_method(my_string, my_array)
  puts "After method"
  puts "Object ID for my_string = #{my_string.object_id}"
  puts "Object ID for my_array = #{my_array.object_id}"
  puts "My string looks like this now: #{my_string}"
  puts "My array looks like this now: #{my_array}"
end
#exercise2



def tricky_method_two(a_string_param, an_array_param)
  puts "Within method before change"
  puts "Object ID for a_string_param = #{a_string_param.object_id}"
  puts "Object ID for an_array_param = #{an_array_param.object_id}"
  a_string_param.gsub!('pumpkins', 'rutabaga')
  an_array_param = ['pumpkins', 'rutabaga']
  puts "Within method after change"
  puts "Object ID for a_string_param = #{a_string_param.object_id}"
  puts "Object ID for an_array_param = #{an_array_param.object_id}"
end

def exercise3
  my_string = "pumpkins"
  my_array = ["pumpkins"]
  puts "Before method"
  puts "Object ID for my_string = #{my_string.object_id}"
  puts "Object ID for my_array = #{my_array.object_id}"
  tricky_method_two(my_string, my_array)
  puts "After method"
  puts "Object ID for my_string = #{my_string.object_id}"
  puts "Object ID for my_array = #{my_array.object_id}"
  puts "My string looks like this now: #{my_string}"
  puts "My array looks like this now: #{my_array}"
end
#exercise3


# How could the un-needed duplication in this method be removed?
def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end
p color_valid("blue"), color_valid("green"), color_valid("red")

def my_color_valid(color)
  color == "blue" || color == "green"
end

def exercise5
  p my_color_valid("blue"), my_color_valid("green"), my_color_valid("red")
end
exercise5

