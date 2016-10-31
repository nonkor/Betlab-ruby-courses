class LazyHash < Hash

  attr_accessor :hash_new

  def initialize(hash=nil)
    @hash_new = hash
  end

  def lazy?(key)
    self[key.to_s].respond_to? :call
  end

  class_eval do
  def []=(k, v)
    define_method(k) do
      self[k.to_s] = self[k.to_s].call
    end
  end
    end
end
########## EXAMPLES ###################
proc = proc { |h, k| h[k] = k*k }
proc_2 = proc { 2*2 }
hash = LazyHash.new

# hash['proc_key'] = proc
# p hash['proc_key']
# p hash.lazy?('proc_key')
# p hash.proc_key
# p hash['proc_key']
# p hash.lazy?('proc_key')
# p hash.respond_to? :proc_key

hash['proc_key_2'] = proc_2
p hash['proc_key_2']
#p hash.lazy?('proc_key_2')
p hash.proc_key_2
p hash['proc_key_2']
#p hash.lazy?('proc_key_2')
#p hash.respond_to? :proc_key_2
