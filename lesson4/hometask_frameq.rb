class LazyHash < Hash
  def method_missing(name)
    key = name.to_s
    super(name) unless self.key?(key)
    if self[key].respond_to?(:call)
      self[key] = self[key].call
    end
    self[key]
  end

  def lazy?(key)
    self[key.to_s].respond_to?(:call)
  end
end

b = Proc.new do
  'hello world'
end

a = LazyHash.new
a['key'] = 1
a['ku'] = b
puts a             #{"key"=>1, "ku"=>#<Proc:0x007fe6fe101d68@/Users/dmytro.martyshevskyi/RubymineProjects/met/hometask_frameq.rb:17>}
puts a.lazy?('ku') #true
puts a.ku          #hello world
puts a.lazy?('ku') #false
puts a             #{"key"=>1, "ku"=>"hello world"}
a.kkk              #method_missing': undefined method `kkk'