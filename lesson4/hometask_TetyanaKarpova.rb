class LazyHash < Hash
  def lazy?(method_name)
    fetch(method_name).is_a? Proc
  end

  def method_missing(method_name, *args)
    if self.has_key?(method_name)
      fetch(method_name).is_a?(Proc) ? self[method_name] = fetch(method_name).call : self[method_name]
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    self.has_key?(method_name) || super
  end
end

lazy_h = LazyHash.new
lazy_h[:k] = proc {"!!!!!"}
puts lazy_h[:k]       # =>
puts lazy_h.lazy? :k  # => true
puts lazy_h.k         # => !!!!!
puts lazy_h[:k]       # => !!!!!
