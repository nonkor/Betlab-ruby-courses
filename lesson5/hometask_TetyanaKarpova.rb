class LazyHash < Hash
  def lazy?(method_name)
    fetch(method_name).is_a? Proc
  end

  def []=(key, value)
    unless self.has_key? key
      define_singleton_method(key) do
        value.is_a?(Proc) ? self[key] = fetch(key).call : value
      end
    end
    super
  end
end

lazy_h = LazyHash.new
lazy_h[:k] = proc {"!!!!!"}
puts lazy_h[:k].is_a?(Proc)   # => true
puts lazy_h.lazy? :k          # => true
puts lazy_h.k                 # => !!!!!
puts lazy_h[:k]               # => !!!!!
puts lazy_h.lazy? :k          # => false
