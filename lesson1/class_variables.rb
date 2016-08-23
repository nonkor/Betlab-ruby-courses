class Foo
  @@class_variable = 'Class variable'
  @class_instance_variable = 'Class instance variable'

  def self.class_variable # or Foo.class_variable
    @@class_variable
  end

  def self.class_instance_variable # or Foo.class_instance_variable
    @class_instance_variable
  end
end

class Bar < Foo

end

Foo.class_variable # => Class variable
Foo.class_instance_variable # => Class instance variable

Bar.class_variable # => Class variable
Bar.class_instance_variable # =>


