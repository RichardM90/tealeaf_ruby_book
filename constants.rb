
# Constant declaration
MY_CONSTANT = 'one'

# What happens if you attempt to change a constant?
MY_CONSTANT = 'two'

# Constants have a global scope and cannot be defined within functions
def some_method
  puts MY_CONSTANT
  #MY_NEW_CONSTANT = 'three'
end
some_method