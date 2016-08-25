class Foo
  class << self # or Foo
    def singleton_as_class_method_of_Foo
    end
  end
end
# Foo = Class.new
# class << Foo
#   def singleton_as_class_method_of_Foo
#   end
# end

f = Foo.new

class << f
  def singleton_as_instance_method_of_Foo
  end
end


Foo # => Foo
Foo.singleton_class # => #<Class:Foo>
Foo.singleton_methods # => [:singleton_as_class_method_of_Foo]

f # => #<Foo:0x007fc81882f450>
f.singleton_class # => #<Class:#<Foo:0x007fc81882f450>>
f.singleton_methods # => [:singleton_as_instance_method_of_Foo]

