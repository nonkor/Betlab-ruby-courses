module M

  def self.included(some)
    some.extend(HookModule)
    p some.singleton_methods
    p some.instance_methods - Object.instance_methods
  end

  def instance_method
    'Wow, very method, such instance'
  end

  module HookModule
    def metaclass_method
      'Wow, very meta class method'
    end
  end

end

class Foo
  include M
end