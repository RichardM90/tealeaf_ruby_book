

# Ruby passes parameters 'by value'. The value that gets passed is a reference
# to some object. String parameters are passed to methods as a reference to an
# object type of String. Similarly, an array parameter is passed to the method
# as a reference to an object type of Array.
# Although a reference is passed the method makes new variables for the passed
# parameters and puts these references in these new variables. The new variables
# only live within the scope of the method.

# A good explanation of how parameters work in Ruby ...
# http://robertheaton.com/2014/07/22/is-ruby-pass-by-reference-or-pass-by-value/

def put_result(before, after, method)
  if before == after
    puts "#{method} before=#{before} after=#{after}"
  else
    puts "#{method} before=#{before} after=#{after} DIFFERENT"
  end
end

def str_append(str)
  str << " world"
end
def str_concat(str)
  str += " world"
end
def str_assign(str)
  str = " world"
end

str = "hello"
before = "#{str}"
str_append(str)
after = "#{str}"
put_result(before, after, "str_append")

str = "hello"
before = "#{str}"
str_concat(str)
after = "#{str}"
put_result(before, after, "str_concat")

str = "hello"
before = "#{str}"
str_assign(str)
after = "#{str}"
put_result(before, after, "str_assign")

def arr_append(arr)
  arr << "world"
end
def arr_concat(arr)
  arr += ["world"]
end
def arr_assign(arr)
  arr = ["world"]
end
def arr_push(arr)
  arr.push("world")
end
def arr_pop(arr)
  arr.pop
end

arr = ["hello"]
before = "#{arr}"
arr_append(arr)
after = "#{arr}"
put_result(before, after, "arr_append")

arr = ["hello"]
before = "#{arr}"
arr_concat(arr)
after = "#{arr}"
put_result(before, after, "arr_concat")

arr = ["hello"]
before = "#{arr}"
arr_assign(arr)
after = "#{arr}"
put_result(before, after, "arr_assign")

arr = ["hello"]
before = "#{arr}"
arr_push(arr)
after = "#{arr}"
put_result(before, after, "arr_push")

arr = ["hello"]
before = "#{arr}"
arr_pop(arr)
after = "#{arr}"
put_result(before, after, "arr_pop")

