class Foo
  def Foo.singleton_as_class_method_of_Foo
  end
end

f = Foo.new

def f.singleton_as_instance_method_of_Foo
end

Foo # => Foo
Foo.singleton_class # => #<Class:Foo>
Foo.singleton_methods # => [:singleton_as_class_method_of_Foo]

f # => #<Foo:0x007fc81882f450>
f.singleton_class # => #<Class:#<Foo:0x007fc81882f450>>
f.singleton_methods # => [:singleton_as_instance_method_of_Foo]

