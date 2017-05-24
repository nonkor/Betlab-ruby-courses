class MyClass
  def initialize
    @x = 'test'
  end
end

object = MyClass.new
object # => #<MyClass:0x007facb90662c0 @x="test">
object.instance_variable_set('@x', 10)
object # => #<MyClass:0x007facb90662c0 @x=10>
object.instance_variable_get('@x') # => 10
