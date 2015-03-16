

# next loop
def next_loop
  i = 0
  loop do
    i += 2
    if i == 4
      next        # skip rest of the code in this iteration
    end
    puts "#{i}"
    if i == 10
      break
    end
  end
end


# while loop
def while_loop
  x = gets.chomp.to_i

  while x >= 0
    puts x
    x -= 1 # <- refactored this line
  end

  puts "Done!"
end


# until loop
def until_loop
  x = gets.chomp.to_i

  until x < 0
    puts x
    x -= 1
  end

  puts "Done!"
end


# do/while loop
def do_while_loop
  begin
    puts "Do you want to do that again?"
    answer = gets.chomp.upcase
  end while answer == 'Y'
  puts answer
end


# for loop 1
def for_loop1
  x = gets.chomp.to_i

  for i in 1..x do
    puts i
  end

  puts "Done!"
end


# for loop 2
def for_loop2
  x = [1, 2, 3, 4, 5]

  for i in x do
    puts i
  end

  puts "Done!"
end


# conditional_loop_with_break.rb
def loop_with_break_and_next
  for i in 1..10
    if i == 3
      puts "Skipping #{i}"
      next
    elsif i == 7
      puts "Stopping at #{i}"
      break
    elsif i.odd?
      puts "Odd number, #{i}"
    end
  end
end


# each
def each_block1
  names = ['Bob', 'Joe', 'Steve', 'Janice', 'Susan', 'Helen']
  names.each { |name| puts "#{name}" }
end


# each
def each_block2
  names = ['Bob', 'Joe', 'Steve', 'Janice', 'Susan', 'Helen']
  x = 1

  names.each do |name|
    puts "#{x}. #{name}"
    x += 1
  end
end


# fibonacci.rb
def fibonacci(number)
  if number < 2
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end


# first 10 numbers in fibonacci sequence
def first10()
  for i in 1..10 do
    puts "#{i} #{fibonacci(i)}"
  end
end

#next_loop()
#while_loop()
#until_loop()
#do_while_loop()
#for_loop1()
#for_loop2()
#loop_with_break_and_next()
#each_block1
#each_block2
#puts fibonacci(6)
#first10()


def exercise2
  begin
    puts "Type some text (type STOP to stop)"
    answer = gets.chomp.upcase
  end while answer != 'STOP'
end
#exercise2()


def exercise3
  star_trek = ["Richard", "Andrew M", "Tony", "Gary", "Andrew C"]
  star_trek.each_with_index { |item, index|
    puts "#{index}: #{item}"
  }
end
#exercise3()


def exercise4(num)
  if num <= 0
    puts num
  else
    puts num
    exercise4(num-1)
  end
end
exercise4(10)
exercise4(-3)

