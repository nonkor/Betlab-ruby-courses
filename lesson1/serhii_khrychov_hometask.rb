class Foo

  def initialize(uniq = :not_uniq)
    @@instance_num ||= 0
    @@instance_num += 1
    @instance_num = @@instance_num
    @uniq = uniq
  end

  def my_instance
    return ":uniq" if @uniq == :uniq
    @instance_num.even? ? ":even" : ":odd"
  end

end

instances = []

uniq_instance = Foo.new(:uniq)

for i in 0..5
  instances.push Foo.new
end

instances.each {|instance| puts instance.my_instance}
puts uniq_instance.my_instance

