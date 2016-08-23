class Foo
end

f1 = Foo.new
f2 = Foo.new

def f1.my_singleton_method
  'f1 method'
end

f1.my_singleton_method # => f1 method
f2.my_singleton_method # => undefined method
# `my_singleton_method' for #<Foo:0x007fd84b872af0> (NoMethodError)

