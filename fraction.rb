class Fraction
  def initialize(numerator, denominator)
    if ! numerator.is_a?(Integer) && denominator.is_a?(Integer)
      # TODO: Proper execption for this issue
      # TODO: Handle case when one or both parameters are not int but could be easily transformed to int
      raise 'these are supposed to be numbers: '+numerator.inspect+' '+ denominator.inspect
    end
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

=begin
     if @numerator > @denominator then b=@denominator else b=@numerator
    end
    end

    while b>1
     if (@numerator%b == 0 and @denominator%b == 0)
       @denominator = @denominator /b
       @numerator = @numerator /b
     end
      b=b-1
=end
    Fraction.new(@numerator / @numerator.gcd(@denominator), @denominator / @denominator.gcd(@numerator))
  end

  def view
      puts "#{@numerator}/#{@denominator}"
  end

  def +(a)
    Fraction.new(@numerator*a.denominator+a.numerator*@denominator, @denominator*a.denominator).simplify
  end

  def *(a)
    Fraction.new(@numerator = @numerator*a.numerator, @denominator = @denominator*a.denominator).simplify
  end

  def /(a)
    Fraction.new(@numerator*a.denominator, @denominator*a.numerator).simplify
  end

  def -(a)
    simplify
    a.simplify
    Fraction.new(@numerator*a.denominator-a.numerator*@denominator, @denominator*a.denominator).simplify
  end
end


fraction1 = Fraction.new(9,12)
fraction2 = Fraction.new(221,663)

(fraction1-fraction2).view
