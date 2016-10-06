def test(klass)
  lazy_hash = klass.new
  lazy_hash[:proc] = proc { Time.now }
  lazy_hash[:lambda] = lambda { Time.now }
  lazy_hash[:raw] = Time.now

  result = true

  result = result && lazy_hash[:proc].is_a?(Proc)
  result = result && lazy_hash[:lambda].is_a?(Proc)
  result = result && lazy_hash[:raw].is_a?(Time)

  result = result && lazy_hash.lazy?(:proc)
  result = result && lazy_hash.lazy?(:lambda)
  result = result && !lazy_hash.lazy?(:raw)

  result = result && lazy_hash.respond_to?(:proc)
  result = result && lazy_hash.respond_to?(:lambda)
  result = result && lazy_hash.respond_to?(:raw)

  result = result && Time.now < lazy_hash.proc
  result = result && Time.now < lazy_hash.lambda
  result = result && Time.now > lazy_hash.raw

  result = result && lazy_hash.proc.is_a?(Time)
  result = result && lazy_hash.lambda.is_a?(Time)
  result = result && lazy_hash.raw.is_a?(Time)

  result = result && Time.now > lazy_hash.proc
  result = result && Time.now > lazy_hash.lambda
  result = result && Time.now > lazy_hash.raw

  result = result && lazy_hash[:proc] == lazy_hash.proc
  result = result && lazy_hash[:lambda] == lazy_hash.lambda
  result = result && lazy_hash[:raw] == lazy_hash.raw

  result = result && !lazy_hash.lazy?(:proc)
  result = result && !lazy_hash.lazy?(:lambda)
  result = result && !lazy_hash.lazy?(:raw)

  puts result
end


#==============================================
# SimpleDelegator usage and no method missing
#==============================================

require 'delegate'

class LazyHashDelegator < SimpleDelegator
  def initialize(initial_hash = {})
    self.__setobj__(initial_hash)
    initial_hash.each_key { |key| create_accessor(key) }
  end

  def []=(key, value)
    raise ArgumentError, 'Unable to symbolize key!' unless key.respond_to?(:to_sym)
    key = key.to_sym
    super(key, value)
    create_accessor(key)
  end

  def [](key)
    raise ArgumentError, 'Unable to symbolize key!' unless key.respond_to?(:to_sym)
    super(key.to_sym)
  end

  def lazy?(key)
    self[key].is_a?(Proc)
  end

  private
  def create_accessor(key)
    unless self.respond_to?(key)
      define_singleton_method(key) do
        obj = self[key]
        obj.is_a?(Proc) ? self[key] = obj.call : obj
      end
    end
  end
end

test(LazyHashDelegator)

#==============================================
# Inheritance usage and method missing
#==============================================

class LazyHash < Hash
  def []=(key, value)
    raise ArgumentError, 'Unable to symbolize key!' unless key.respond_to?(:to_sym)
    super(key.to_sym, value)
  end

  def [](key)
    raise ArgumentError, 'Unable to symbolize key!' unless key.respond_to?(:to_sym)
    super(key.to_sym)
  end

  def method_missing(method_name, *args)
    if self.has_key?(method_name) && args.empty?
      obj = self[method_name]
      obj.is_a?(Proc) ? self[method_name] = obj.call : obj
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    if self.has_key? method_name
      true
    else
      super
    end
  end

  def lazy?(key)
    self[key].is_a?(Proc)
  end
end

test(LazyHash)
