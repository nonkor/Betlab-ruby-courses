class LazyHash < Hash
  def lazy?(key)
    fetch(key).is_a? Proc
  end

  def []=(key, value)
    unless self.has_key? key
      define_singleton_method(key) do
        value.is_a?(Proc) ? self[key] = value.call : value
      end
    end
    super
  end

  def self.[](*params)
    super.each_pair do |key, value|
      define_method(key) do
        value.is_a?(Proc) ? self[key] = value.call : value
      end
    end
    super
  end
end

lazy_h = LazyHash.new
lazy_h[:k] = proc {"!!!!!"}
p lazy_h[:k].is_a?(Proc)             # => true
p lazy_h.lazy? :k                    # => true
p lazy_h.k                           # => "!!!!!"
p lazy_h[:k]                         # => "!!!!!"
p lazy_h.lazy? :k                    # => false
h = LazyHash[:a, proc {"!"}, :b, 2]
p h.b                                # => 2
p h.lazy? :a                         # => true
p h.a                                # => "!"
p h.lazy? :a                         # => false
