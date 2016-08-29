module M
  def regular_instance_method
  end

  def self.included(base)
  	base.extend(ClassMethods)
  	puts "Added class methods: #{base.singleton_methods}"
  	puts "Added instance methods: #{base.instance_methods - Object.methods}"
  end
  
  module ClassMethods
    def class_method_3000
    end
  end
end

class Foo
  include M
end