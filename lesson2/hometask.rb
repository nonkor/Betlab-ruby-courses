module M

  module MetaclassMethods
    def metaclass_method_of_Foo
    end
  end

  def self.included(base)
    base.extend(MetaclassMethods)
  end

  def instance_method_of_Foo
  end
end

class Foo
  include M
end

puts Foo.instance_methods - Object.instance_methods
puts Foo.singleton_methods - Object.singleton_methods