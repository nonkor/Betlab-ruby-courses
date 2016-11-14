module M

  def self.included(base)
    base.include InstanceMethods
    base.extend ClassMethods
  end

  module ClassMethods
    def first_method
      puts __method__
    end
  end

  module InstanceMethods
    def second_method
      puts __method__
    end
  end

end

Foo = Class.new
Foo.include M
puts "Class methods:\t#{Foo.singleton_methods}"
puts "Instance methods:\t#{Foo.new.methods - Object.methods}"
