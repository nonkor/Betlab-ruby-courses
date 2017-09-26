class LazyHash < Hash

  def method_missing(method_name, *args, &block)
    if !self[*args] && self.keys.include?(method_name) && lazy?(method_name)
      if block_given?
        self[*args] = yield self[method_name].call(*args, &block)
      else
        self[*args] = self[method_name].call(*args, &block)
      end
    elsif self.keys.include?(*args)
      block_given? ? (yield self[*args]) : self[*args]
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private=false)
    self.methods.include?(method_name) || super
  end

  def lazy?(*args)
    key, value = args
    self[key].is_a?(Proc) ^ self.keys.include?(value)
  end
end


h = LazyHash.new
h[:factorial] = proc { |num| (1..num).reduce(:*) }

p h.lazy?(:factorial) # true
p h.lazy?(:factorial, 5) # true
p h[5] # nil
p h.factorial(5) # 120
p h[5] # 120
p h.lazy?(:factorial, 5) # false

p h[:factorial]
p h.factorial(1000) { |num| num.to_s.reverse }
p h[1000]
p h.factorial(1000) { |num| num.to_s.reverse! }
p h[1000]