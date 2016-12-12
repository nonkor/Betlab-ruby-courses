class LazyHash < Hash
  def lazy?(key)
    fetch(key).is_a? Proc
  end

  def []=(key, value)
    define_singleton_method(key) do
      value.is_a?(Proc) ? self[key] = value.call : value
    end
    super
  end

  def self.[](*params)
    hsh = super
    l_hsh = LazyHash.new
    hsh.each_pair do |key, value|
      l_hsh[key] = value
    end
    l_hsh
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
h[:b] = 3
p h.b                                # => 3
p h.lazy? :a                         # => true
p h.a                                # => "!"
p h.lazy? :a                         # => false
h2 = LazyHash.new
h2[:test] = 1
p h2.test                            # => 1
h2[:test] = 2
p h2.test                            # => 2
