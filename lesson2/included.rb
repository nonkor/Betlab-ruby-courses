module M
  def self.included(base)
    base.extend(self)
  end

  def module_method
  end
end

class Foo
  include M
end

f = Foo.new
Foo.respond_to? :module_method # => true
f.respond_to? :module_method # => true

