class K
  def method_missing(method_name, *args)
    if method_name.to_s =~ /^missing_/
      "method :#{method_name} is missing"
    else
      super
    end
  end
end

k = K.new
k.respond_to?(:missing_m) # => false
k.missing_m # => method :missing_m is missing
k.method(:missing_m)
# => raise `undefined method `missing_m' for class `K' (NameError)`

