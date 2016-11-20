class LazyHash < Hash

  def lazy?(key)
    self[key].respond_to? :call
  end

  def []=(key, value)
    unless self.respond_to? key
      define_singleton_method(key) do
        value.respond_to?(:call) ? result = value.call : value
        self[key] = result
      end
    end
    super
  end

  def self.[](key, value)
    unless self.respond_to? key
      define_method(key) do
        value.respond_to?(:call) ? result = value.call : value
        self[key] = result
      end
    end
    super
  end

end

########## EXAMPLES ###################
proc_2 = proc { 3*3 }
hash = LazyHash.new

p hash[:proc_key_2] = proc_2 # => <Proc:0x007fc7bd0b7f98@/Users/kristina/Betlab-ruby-courses/lesson5/argirovatina_hometask.rb>
p hash[:proc_key_2] # => <Proc:0x007fc7bd0b7f98@/Users/kristina/Betlab-ruby-courses/lesson5/argirovatina_hometask.rb>
p hash.lazy? :proc_key_2 # => true
p hash.proc_key_2 # => 9
p hash[:proc_key_2] # => 9
p hash.lazy? :proc_key_2 # => false

my_proc = proc { 2+2 }
hash = LazyHash[ :my_key, my_proc ]
p hash.my_key # => 4