class Foo
  def self.class_method
    'Foo class method'
  end

  def class_instance_method
    'Common class method'
  end
end

class Bar < Foo
end

Foo.class_method # => class method
Foo.class_instance_method # => undefined method
# `class_instance_method' for Foo:Class (NoMethodError)

Bar.class_method # => class method
Bar.class_instance_method # => undefined method
# `class_instance_method' for Bar:Class (NoMethodError)
