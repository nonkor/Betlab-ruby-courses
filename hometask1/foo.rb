class Foo
  @@counter = 0

  def initialize
    @@counter += 1
    @instance_counter = @@counter
  end

  def my_instance
  if @instance_counter.even?
      :even
    else
      :odd
    end
  end
end

bar = Foo.new
rar = Foo.new
nar = Foo.new

def bar.my_instance
  :uniq
end

puts bar.my_instance # => :uniq
puts rar.my_instance # => :even
puts nar.my_instance # => :odd
puts nar.my_instance # => :odd