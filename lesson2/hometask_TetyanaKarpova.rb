module M

  def self.included(base)
    base.include M::MInstanceMethods
    base.extend M::MClassMethods
  end

  module MInstanceMethods
    def m_instance_method
      puts 'Instance method'
    end
  end

  module MClassMethods
    def m_class_method
      puts 'Class method'
    end
  end
end

class Foo
  include M
end

foo = Foo.new

puts Foo.singleton_methods              # => m_class_method
puts Foo.new.methods - Object.methods   # => m_instance_method
