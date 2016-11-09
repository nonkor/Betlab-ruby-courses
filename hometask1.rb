class Foo
  def initialize
    @@counter ||= 0
    @@counter +=1
    @number = @@counter
  end

  def my_instance
    @number.even? ? :even : :odd
  end
end

uniq_instans = Foo.new


def uniq_instans.my_instance
  :uniq
end

new_instans = Foo.new
next_instans = Foo.new
foo = Foo.new

puts uniq_instans.my_instance
puts new_instans.my_instance
puts next_instans.my_instance
puts foo.my_instance
