class Foo
  private

  def private_method
    :private
  end
end

class Bar < Foo
  def public_method
    private_method
  end

  def public_method2
    self.private_method
  end
end

Bar.new.public_method # => private
Bar.new.public_method2 # => private method
# `private_method' called for #<Bar:0x007fe3699337e0> (NoMethodError)

