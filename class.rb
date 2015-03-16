class MyClass

  # Class variable declaration
  @@my_class_var = 1

  # Instance variable declaration
  @my_instance_var = 2

  attr :str

  def initialize(str)
    @str = str
  end

  def inspect
    @str
  end

end

var1 = MyClass.new("Hello")
var2 = MyClass.new("World!")

puts var1.str
puts var2.str
var2.my_instance_var = 3
#puts MyClass.my_class_var

puts MyClass.class_variables
puts MyClass.instance_variables