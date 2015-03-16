a = 5

def some_method
  a = 3
  puts "Method scope of a = #{a}"
end

some_method
puts "Execution scope of a = #{a}"