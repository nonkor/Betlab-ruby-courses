module M

  def self.included(some)
  	some.extend(HookModule)
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


p Foo.singleton_methods
p Foo.instance_methods - Object.instance_methods