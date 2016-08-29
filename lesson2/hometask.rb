module M
  module SingletonMethods
    def singleton_method
      p Foo.singleton_methods
    end
  end
  module InstanceMethods
    def instance_method
      p Foo.instance_methods - Object.instance_methods
    end
  end


  def self.included(base)
    base.extend SingletonMethods
    base.include InstanceMethods
    Foo.singleton_method
    Foo.new.instance_method
  end
end

class Foo
  include M
end


