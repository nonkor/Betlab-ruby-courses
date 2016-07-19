
class Fraction
  def check_fraction(numerator, denominator)
    if ! numerator.is_a?(Integer) && (denominator.is_a?(Integer) && denominator>0)
      raise 'these are supposed to be numbers: '+numerator.inspect+' '+ denominator.inspect
    end
  end

  def initialize(numerator, denominator)
    check_fraction(numerator, denominator)
    @numerator = numerator
    @denominator = denominator
  end

  def numerator
    @numerator
  end

  def denominator
    @denominator
  end

  def simplify
    Fraction.new(@numerator / @numerator.gcd(@denominator), @denominator / @denominator.gcd(@numerator))
  end

  def view
      "#{@numerator}/#{@denominator}"
  end

  def +(fract)
    num = @numerator*fract.denominator+fract.numerator*@denominator
    den = @denominator*fract.denominator
    Fraction.new(num, den).simplify
  end

  def *(fract)
    num = @numerator*fract.numerator
    den = @denominator*fract.denominator
    Fraction.new(num, den).simplify
  end

  def /(fract)
    num = @numerator*fract.denominator
    den = @denominator*fract.numerator
    Fraction.new(num, den).simplify
  end

  def -(fract)
    num = @numerator*fract.denominator-fract.numerator*@denominator
    den = @denominator*fract.denominator
    Fraction.new(num, den).simplify
  end
end


fraction1 = Fraction.new(3,12)
fraction2 = Fraction.new(221,663)

puts (fraction1-fraction2).view

