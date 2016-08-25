module M
  def module_method
  end
end

class Foo
  include M
end

Foo.instance_methods - Object.instance_methods # => [:module_method]

f = Foo.new

f.include(M) # => undefined method `include'
# for #<Foo:0x007f9f3c0cfb88> (NoMethodError)

f.singleton_class.include(M) # => #<Class:#<Foo:0x007fe75c013c18>>

