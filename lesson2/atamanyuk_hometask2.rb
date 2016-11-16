module M

  def instance_method
    p 'instance_method'
  end

  def self.included(base)
    base.extend M::N
  end

  module N

    def class_method
      p 'class_method'
    end

  end

end

class Foo
  include M
end

f1 = Foo.new
f1.extend M

f1.instance_method
Foo.class_method
#f1.class_method # error   : undefined method `class_method'
#Foo.instance_method # error: in `instance_method': wrong number of arguments