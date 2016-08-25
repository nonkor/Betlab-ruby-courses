class Foo
  def public_method
    :public
  end

  def public_method_get_private
    private_method
  end

  def public_method_get_protected
    protected_method
  end

  private

  def private_method
    :private
  end

  protected

  def protected_method
    :protected
  end
end

class Bar < Foo
end

f = Foo.new
b = Bar.new

Bar.private_instance_methods
  - Object.private_instance_methods
    # => [:private_method]
Bar.protected_instance_methods
  - Object.protected_instance_methods
    # => [:protected_method]

f.private_method # => private method
  # `private_method' called for
  # #<Foo:0x007f842281a990> (NoMethodError)
f.protected_method # => protected method
  # `protected_method' called for
  # #<Foo:0x007fee2b153b48> (NoMethodError)

f.public_method # => public
f.public_method_get_private # => private
f.public_method_get_protected # => protected

b.public_method # => public
b.public_method_get_private # => private
b.public_method_get_protected # => protected
