class Foo
  def unbound_method
    "I am bound with #{self}, but that's temporary!"
  end

  def another_unbound_method
    "I wish do the same as my brother did. FREEDOM!!!"
  end
end

unbound_method_as_object = Foo.instance_method(:unbound_method)
# => #<UnboundMethod: Foo#unbound_method>
unbound_method_as_object.call
# => undefined method `call' for
# => #<UnboundMethod: Foo#unbound_method> (NoMethodError)

method_as_object = Foo.new.method(:another_unbound_method)
# => #<Method: Foo#another_unbound_method>
method_as_object.call
# => "I wish do the same as my brother did. FREEDOM!!!"
unbound_method_as_object = method_as_object.unbind
# => #<UnboundMethod: Foo#another_unbound_method>
unbound_method_as_object.call
# => undefined method `call' for
# => #<UnboundMethod: Foo#another_unbound_method> (NoMethodError)

