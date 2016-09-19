class MyClass
end

MyClass.instance_eval do
  def foo; 'foo'; end
end

MyClass.class_eval do
  def bar; 'bar' end
end

o = MyClass.new

MyClass.foo
# => foo
MyClass.bar
# => undefined method `bar' for
# => MyClass:Class (NoMethodError)

o.foo
# => undefined method `foo' for
# => #<MyClass:0x007f98a082f100> (NoMethodError)
o.bar
# => bar



