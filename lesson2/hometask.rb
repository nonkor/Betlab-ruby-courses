
module M

  def self.included(base)
    base.include MInstanceMethods
    base.extend MMetaclassMethods
    puts "Instance methods of #{base}: #{(base.instance_methods - Object.methods).inspect}"
    puts "Metaclass methods of #{base}: #{base.singleton_methods.inspect}"
  end

  module MInstanceMethods

    def class_example_method
      puts 'Instance method called'
    end

  end

  module MMetaclassMethods

    def metaclass_method
      puts 'Metaclass method called'
    end

  end

end


class Foo

  include M

end
