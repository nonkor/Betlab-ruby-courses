module M

  module SingletonMethods
    def singleton_method
    end
  end

  module InstanceMethods
    def inst_method
    end
  end

  def self.included(base)
    base.include InstanceMethods
    base.extend SingletonMethods
    p base.instance_methods - Object.methods
    p base.singleton_methods
  end
end

class Foo
  include M
end
