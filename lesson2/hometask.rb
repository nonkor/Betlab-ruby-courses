module M

  module MetaclassMethods
    def metaclass_method_of_Foo
    end
  end

  def instance_method_of_Foo
  end

  def self.included(base)
    base.extend(MetaclassMethods)
    puts Foo.instance_methods - Object.instance_methods
    puts Foo.singleton_methods - Object.singleton_methods
  end

end

class Foo
  include M
end