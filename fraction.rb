class Fraction
  attr_reader :numerator, :denominator

  # InputError
  class InputError < StandardError
    def initialize(thing)
      super "#{thing.inspect} should be Integer object, but it is #{thing.class}"
    end
  end

  # DenominatorError
  class DenominatorError < StandardError
    def initialize
      super 'Denominator cannot be zero. Division by zero is prohibited'
    end
  end

  # FractionError
  class FractionError < StandardError
    def initialize(thing)
      super "Only Integer or Fraction is allowed as a second argument. But #{thing.inspect} is a #{thing.class}"
    end
  end

  def initialize(numerator, denominator = 1)
    validate(numerator)
    validate(denominator, true)
    @numerator = numerator
    @denominator = denominator
  end

  def show
    "#{@numerator}/#{@denominator}"
  end

  def reduction!
    nsd = gcd(@numerator.abs, @denominator)
    @numerator /= nsd
    @denominator /= nsd
    self
  end

  def reduction
    self.dup.reduction!
  end

  def +(another_value)
    another_value = to_fraction(another_value)
    den = @denominator * another_value.denominator
    num = @numerator * another_value.denominator + another_value.numerator * @denominator
    Fraction.new(den, num).reduction!
  end

  def -(another_value)
    another_value = to_fraction(another_value)
    den = @denominator * another_value.denominator
    num = @numerator * another_value.denominator - another_value.numerator * @denominator
    Fraction.new(den, num).reduction!
  end

  def *(another_value)
    another_value = to_fraction(another_value)
    num = @numerator * another_value.numerator
    den = @denominator * another_value.denominator
    Fraction.new(den, num).reduction!
  end

  def /(another_value)
    another_value = to_fraction(another_value)
    num = @numerator * another_value.denominator
    den = @denominator * another_value.numerator
    Fraction.new(den, num).reduction!
  end

  def **(another_value)
    validate(another_value)
    num = @numerator ** another_value.abs
    den = @denominator ** another_value.abs
    num, den = den, num if another_value < 0
    Fraction.new(den, num).reduction
  end

  def to_f
    @numerator.fdiv(@denominator)
  end

  def to_i
    to_f.to_i
  end

  def abs!
    @numerator, @denominator = @numerator.abs, @denominator.abs
  end

  def abs
    Fraction.new(@numerator.abs, @denominator.abs)
  end

  private

  def gcd(num1, num2)
    num2, num1 = num1, num2 if num1 > num2
    num2, num1 = num1, num2 % num1 while num2 % num1 != 0
    num1
  end

  def validate(num, divider = false)
    raise(InputError, num) unless num.is_a?(Integer)
    raise(DenominatorError) if num.zero? && divider
  end

  def to_fraction(fraction)
    return case fraction
           when Fraction
             fraction
           when Integer
             Fraction.new(fraction)
           else
             raise FractionError, fraction
           end
  end
end

# samples:
x1 = Fraction.new(3, -6)        #   -1/2
x2 = Fraction.new(15, 18)       #    5/6
x3 = Fraction.new(-3, -13)      #    3/13
x4 = Fraction.new(5)            #    5/1
x5 = Fraction.new(15, 8)        #    15/8

def show_operation(x1, x2)
  composition = x1 * x2
  division = x1 / x2
  difference = x1 - x2
  sum = x1 + x2
  puts sum.show
  puts difference.show
  puts composition.show
  puts division.show
  puts '##################'
end

show_operation(x1, x2)
show_operation(x1, x3)
show_operation(x1, x4)
show_operation(x2, x3)
show_operation(x2, x4)
show_operation(x3, x4)
show_operation(x5, x2)
show_operation(x5, x3)
show_operation(x5, x4)
show_operation(x5, x1)
