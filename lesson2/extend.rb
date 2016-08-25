module M
  def module_method
  end
end

module M2
  def module_method2
  end
end

class Foo
  extend M
end

f = Foo.new

f.extend M2

Foo.methods - Object.methods # => [:module_method]
# we could not use #methods(false) because
# module methods would not be included in that cases

f.methods - Object.methods # => [:module_method2]

