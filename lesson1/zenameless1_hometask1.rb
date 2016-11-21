class Foo
  @@counter = 0

  def initialize
    @@counter += 1
    @instance_id = @@counter
  end

  def my_instance
    @instance_id.even? ? :even : :odd
  end

end

foos = Array.new(10) { Foo.new } 
foos.sample.define_singleton_method('my_instance') { :uniq }
foos.each { |foo| puts foo.my_instance  }
