class LazyHash < Hash
  def lazy?(method_name)
    fetch(method_name).is_a? Proc
  end

  def method_missing(method_name, *args)
    if fetch(method_name).is_a? Proc
      self[method_name] = fetch(method_name).call
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    fetch(method_name).is_a? Proc || super
  end
end

lazy_h = LazyHash.new
lazy_h[:k] = proc {"!!!!!"}
puts lazy_h[:k].is_a? Proc # => true
puts lazy_h.lazy? :k       # => true
puts lazy_h.k              # => !!!!!
puts lazy_h[:k]            # => !!!!!
