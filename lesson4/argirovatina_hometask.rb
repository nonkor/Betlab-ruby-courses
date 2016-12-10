class LazyHash < Hash

  def method_missing(method_name)
    key = get_correct_key(method_name)
    self[key] = self[key].call if lazy?(key)
  end

  def lazy?(key)
    key = get_correct_key(key)
    self[key].respond_to? :call
  end

  def respond_to_missing?(method_name, include_private = false)
    self.has_key? method_name || super
  end

  private

  def get_correct_key(hash_key)
    [hash_key.to_s, hash_key.to_sym].find { |key| self.has_key?(key) } || raise("Method #{hash_key} is missing")
  end

end

########## EXAMPLES ###################
test_proc = proc { 2*2 }
hash = LazyHash.new

p hash['proc_key'] = test_proc # => #<Proc:0x007feec0887a00@/Users/tina/Betlab-ruby-courses/lesson4/argirovatina_hometask.rb:33>
#p hash[:proc_key] = test_proc # => `method_missing': Keys proc_key as string and as symbol are present (RuntimeError)
p hash.lazy?('proc_key') # => true
p hash.proc_key # => 4
p hash['proc_key'] # => 4
p hash.lazy?('proc_key') # => false
p hash.respond_to? :proc_key # => true
p hash.proc_key1 # => `get_correct_key': Method proc_key1 is missing (RuntimeError)
hash[:my_key] = proc { 5 }
p hash.my_key # => 5
