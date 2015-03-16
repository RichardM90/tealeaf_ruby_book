puts "What is your first name?"
first_name = gets.chomp.capitalize
puts "What is your last name?"
last_name = gets.chomp.capitalize
name = first_name + ' ' + last_name
puts "Hello #{name}"
10.times do |i|
  puts (i+1).to_s + ' ' + name
end