module M

  def self.included(base)
    def base.class_module_method
      puts 'class'
    end

    puts "Class methods: #{base.methods - Object.methods}"
    puts "Instance methods: #{base.instance_methods - Object.methods}"
  end

  def instance_module_method
    puts 'instance'
  end
end

class Foo
  include M
end