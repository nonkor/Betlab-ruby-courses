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

uniq_instans = Foo.new          # first instance of Foo class

def uniq_instans.my_instance    # singleton method of uniq_instans - instance of Foo class
  :uniq
end

new_instans = Foo.new           # second instance of Foo class
next_instans = Foo.new          # third instance of Foo class
foo = Foo.new                   # fourth instance of Foo class

puts uniq_instans.my_instance   # => :uniq
puts new_instans.my_instance    # => :even
puts next_instans.my_instance   # => :odd
puts foo.my_instance            # => :even
