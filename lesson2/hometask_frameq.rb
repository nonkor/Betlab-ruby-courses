module M
  def self.included(base)
    base.extend(M2)
    puts base.methods - Object.methods
  end

  def object_instance

  end

  module M2
    def self.extended(base)
      puts base.new.methods - Object.methods
    end
    def class_instance

    end
  end

end

class Foo
include M
end
