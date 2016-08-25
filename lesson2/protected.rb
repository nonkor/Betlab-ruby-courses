class Foo
  protected

  def protected_method
    :protected
  end
end

class Bar < Foo
  def public_method
    protected_method
  end

  def public_method2
    self.protected_method
  end
end

Bar.new.public_method # => protected
Bar.new.public_method2 # => protected

