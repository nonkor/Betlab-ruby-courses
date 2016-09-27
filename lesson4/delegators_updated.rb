class Money
  def initialize(num)
    @numeric = num
  end

  def to_s
    @numeric.to_s << '$'
  end

  def inspect
    "\"#{self}\""
  end

  def method_missing(method_name, *agrs, &block)
    if @numeric.methods.include?(method_name)
      @numeric.send(method_name, *agrs, &block)
    else
      super(method_name, *agrs, &block)
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    @numeric.methods.include?(method_name) || super
  end
end

x = Money.new(5)
x.to_s # => 5$
x.inspect # => "5$"
x + 5 # => 10
x.respond_to?(:+) # => true

