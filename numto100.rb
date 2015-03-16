
def evaluate_case1(numb)
  case 
  when numb >= 0 && numb <=50
    puts "Your number is in the range of 0 - 50"
  when numb >=51 && numb <=100
    puts "Your number is in the range of 51 - 100"
  else
    puts "Your number is outside the range of 0 - 100"
  end
end

def evaluate_case2(numb)
  case numb
  when 0..50
    puts "Your number is in the range of 0 - 50"
  when 51..100
    puts "Your number is in the range of 51 - 100"
  else
    puts "Your number is outside the range of 0 - 100"
  end
end

puts "Input a number between 0 and 100"
number = gets.chomp.to_i
evaluate_case1(number)
evaluate_case2(number)