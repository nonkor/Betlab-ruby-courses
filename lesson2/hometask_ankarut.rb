module M
  def self.included(base)
    base.extend(self::A)
    puts "Added to #{base} metaclass on include module #{self}: #{base.singleton_methods - Object.singleton_methods}"
    base.include(self::B)
    puts "Added to #{base} instances on include module #{self}: #{base.instance_methods - Object.methods}"
  end

  module A
  def method_one
    puts "Hello from method_one"
  end
  end

  module B
  def method_two
    puts "Hello from method_two"
  end
  end

end

class Foo
  include M
end


f = Foo.new
Foo.method_one
f.method_two
