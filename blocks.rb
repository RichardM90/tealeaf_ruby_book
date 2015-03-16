


# blocks can be passed as parameters but must be the last
# parameter for a method
def take_block(number, &block)
  block.call
end

[1, 2, 3, 4, 5].each do |number|
  take_block number do
    puts "Block being called in the method! #{number}"
  end
end


# What will the following program print to the screen? What will it return?
# answer = Nothing is printed to the screen because the block is never 
#   activated with the .call method. The method returns a Proc object. 
def exercise2(&block)
  block
end
exercise2 { puts "Hello from inside the execute method!" }



# What will the following program print to the screen? What will it return?
# answer = Nothing is printed to the screen because the block is never 
#   activated with the .call method. The method returns a Proc object. 
def exercise4(&block)
  block.call
end
exercise4 { puts "Hello from inside the execute method!" }

