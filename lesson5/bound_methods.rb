class Foo
  def bound_method
    "I am bound with #{self}"
  end
end

method_as_object = Foo.new.method(:bound_method)
# => #<Method: Foo#bound_method>
method_as_object.call
# => "I bound with #<Foo:0x007fbb1b02f7f0>"

