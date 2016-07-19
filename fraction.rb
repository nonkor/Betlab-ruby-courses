class Fraction
  
  def initialize(numerator, denominator)
    @numerator = numerator
    @denominator = denominator
  end
  
  def numerator
    @numerator
  end
  
  def denominator
    @denominator
  end
  
  def simple
    a = @numerator
    b = @denominator
    while (a != 0) && (b != 0)
      if a > b
        a = a % b
      else
        b = b % a
      end
    end
    devider = a + b
=begin
    @numerator = @numerator/devider    # вот это другое дело!
    @denominator = @denominator/devider
=end
    Fraction.new(@numerator = @numerator/devider, @denominator = @denominator/devider) #непрозрачный способ!!!
  end
  
  def view
    "#{@numerator}/#{@denominator}"
  end
  
  def *(b)
    Fraction.new(@numerator * b.numerator, @denominator * b.denominator)
  end
  
  def /(b)
    Fraction.new(@numerator * b.denominator, @denominator * b.numerator)
  end
  
  def -(b)
    Fraction.new(@numerator*b.denominator-b.numerator*@denominator, @denominator*b.denominator)
  end
  
  def +(b)
    Fraction.new(@numerator*b.denominator+b.numerator*@denominator, @denominator*b.denominator)
  end
  
end

firstFr = Fraction.new(2, 3)
secondFr = Fraction.new(1, 2)
firstFr.simple
secondFr.simple

puts (firstFr + secondFr).simple.view
