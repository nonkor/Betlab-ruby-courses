module M

  def self.included(base)
    base.include M::InstanceMethods
    base.extend M::ClassMethods
    puts "Class methods:\t#{base.singleton_methods}"
    puts "Instance methods:\t#{base.instance_methods - Object.methods}"
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

class Foo

  include M

end


foo = Foo.new

