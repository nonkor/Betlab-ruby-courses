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

Foo.m_class_method    # => "Class method"
foo.m_instance_method # => "Instance method"
Foo.m_instance_method # => undefined method `m_instance_method' for Foo:Class (NoMethodError)
foo.m_class_method    # => undefined method `m_class_method' for #<Foo:0x00000003024c90>