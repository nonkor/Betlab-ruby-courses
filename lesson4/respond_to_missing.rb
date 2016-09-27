class K
  def method_missing(method_name, *args)
    if method_name.to_s =~ /^missing_/
      "method :#{method_name} is missing"
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name.to_s =~ /^missing_/ || super
  end
end

k = K.new

k.respond_to?(:missing_m) # => true
k.missing_m # => method :missing_m is missing
k.method(:missing_m) # => #<Method: K#missing_m>

k.respond_to?(:other_method) # => false
k.other_method # =>
# raise `undefined method `other_method'
# for #<K:0x007fee5382ebc0> (NoMethodError)`
k.method(:other_method) # => #<Method: K#missing_m>
# raise `undefined method `other_method'
# for #<K:0x007fee5382ebc0> (NoMethodError)`


