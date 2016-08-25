class Foo
  def public_method
    :public
  end

  def public_method_get_private
    private_method
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
  def public_method
    Foo.new.public_method
  end

  def private_method
    Foo.new.private_method
  end

  def protected_method
    Foo.new.protected_method
  end

  private :private_method
  protected :protected_method
end

f = Foo.new
b = Bar.new

f.public_method # => public
f.public_method_get_private # => private
f.public_method_get_protected # => protected

b.public_method # => public
b.public_method_get_private # => private method
# `private_method' called for
# #<Foo:0x007f8d6282d6c8> (NoMethodError)
b.public_method_get_protected # => protected
