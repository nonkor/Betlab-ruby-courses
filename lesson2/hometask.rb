module M
  module SingletonMethods
    def singleton_method
      p "singleton method"
    end
  end

  def instance_method
    p "instance method"
  end

  def self.included(base)
    base.extend SingletonMethods
  end
end

class Foo
  include M
end

Foo.singleton_method
Foo.new.instance_method


##second variant##
#
# module M
#
#
#   def self.included(base)
#     base.extend(self)
#   end
#
#   def future_either_instance_or_singleton_method
#   end
#
# end
#
# class Foo
#   include M
# end
#
# p Foo.instance_methods - Object.instance_methods
# p Foo.singleton_methods