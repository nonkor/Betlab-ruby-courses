module M

  def self.included(base)
    base.extend(C)
    p "instance methods: #{Foo.instance_methods - Object.instance_methods}"
    p "class methods: #{Foo.methods - Object.methods}"
  end

  def custom_instance_method
  end

  module C
    def custom_class_method
    end
  end

end

class Foo
  include M
end


