
# Global variables are defined starting with $
$name = "Richard"

# They are not a good programming technique, Rubyist's tend to avoid!
puts $name

# This global variable has not been defined but does not throw an error
puts $what

# Global variables can be declared within functions
def some_method
  $number = 'three'
end
some_method
puts $number