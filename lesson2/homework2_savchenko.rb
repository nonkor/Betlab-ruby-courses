module M
  def self.included(base)
    base.extend N
    puts Foo.methods - Object.methods # => [:metaclassmethod]
    puts Foo.instance_methods - Object.methods #  => [:instancemethod]
  end

  def instancemethod
    puts :Instance
  end

  module N
    def metaclassmethod
      puts :MetaClass
    end
  end
end


class Foo
  include M
end

f = Foo.new

Foo.metaclassmethod # => [:MetaClass]
f.instancemethod # => [:Instance]
