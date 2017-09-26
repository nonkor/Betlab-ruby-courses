class LazyHash < Hash
  def lazy?(key)
    self[key].kind_of?(Proc)
  end

  def []=(key, value)
    unless respond_to?(key)
      self.class.send(:define_method, key) do
        lazy?(key) ? self[key] = self[key].call : self[key]
      end
    end
    super
  end
end

hash = LazyHash.new
hash[:str] = '123'
hash[:proc] = proc {
  puts 'You should see the text only once, however that tricky numbers below should display twice'
  666
}
puts hash.lazy?(:str) # => false
puts hash.lazy?(:proc) # => true
puts hash.str # => 123
puts hash[:str] # => 123
puts hash[:proc] # => #<Proc:0x007fa3df04f120@hometask.rb:19>
puts hash.method(:proc) # => #<Method: LazyHash#proc>
puts hash.proc
# => You should see the text only once, however that tricky numbers below should display twice
# => 666
puts hash.proc # => 666