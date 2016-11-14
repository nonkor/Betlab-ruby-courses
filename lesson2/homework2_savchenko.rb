module M
  def self.included(base)
    base.extend ForMetaClass
  end

  def initialize
    puts Foo.methods - Object.methods # => [:MetaClassMethod]
    puts self.methods - Object.methods #  => [:InstanceMethod]
  end

  def InstanceMethod
    puts :Instance
  end

  module ForMetaClass
    def MetaClassMethod
      puts :MetaClass
    end
  end
end


class Foo
  include M
end

f = Foo.new

Foo.MetaClassMethod # => [:MetaClass]
f.InstanceMethod # => [:Instance]