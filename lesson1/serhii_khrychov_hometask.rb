class Foo
  def initialize(uniq = :not_uniq)
    @@counter ||= 0
    @@counter += 1
    @instance_num = @@counter
    @uniq = uniq
  end

  def my_instance
    return :uniq if @uniq == :uniq
    @instance_num.even? ? :even : :odd
  end
end

instances = []

uniq_instance = Foo.new(:uniq)

5.times { instances.push Foo.new }

instances.each { |instance| puts instance.my_instance }
puts uniq_instance.my_instance

# => even
# => odd
# => even
# => odd
# => even
# => odd
# => uniq