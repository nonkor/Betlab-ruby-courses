class SomeMoney < Numeric
end
x = SomeMoney.new(5)
# => raise `wrong number of arguments (1 for 0) (ArgumentError)`

class Money
  def initialize(num)
    @numeric = num
  end
end
puts Money.new(5) # => #<Money:0x007f801985de50>
