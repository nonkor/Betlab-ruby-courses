Foo = Class.new
def Foo.my_class_method
  "Foo class method\n" \
  "and in the same time - singleton method of instance of Class class"
end

# class Foo
#   def self.my_class_method
#     "Foo class method\n" \
#     "and in the same time - singleton method of instance of Class class"
#   end
# end

class Foo
  def my_object_method
    "Common instance method for all Foo instances"
  end
end

f = Foo.new
another_f = Foo.new

def f.my_special_object_method
  "f special instance method\n" \
  "and in the same time - singleton method of instance of Foo class"
end

Foo.singleton_class.method_defined? :my_class_method # => true
Foo.singleton_class.method_defined? :my_object_method # => false
Foo.singleton_class.method_defined? :my_special_object_method # => false

f.singleton_class.method_defined? :my_class_method # => false
f.singleton_class.method_defined? :my_object_method # => true
f.singleton_class.method_defined? :my_special_object_method # => true

another_f.singleton_class.method_defined? :my_class_method # => false
another_f.singleton_class.method_defined? :my_object_method # => true
another_f.singleton_class.method_defined? :my_special_object_method # => false

Foo.methods(false) - Class.instance_methods #=> [:my_class_method]


