class Fraction
  def initialize(numerator, denominator)
    if !(numerator.is_a?(Integer) && denominator.is_a?(Integer))
      # TODO: create a proper exception for that issue
      # TODO: handle case when one or both parameters are not Integer but could be easily transformed into it
      # by using #to_i
      raise 'At least some arguments are incorrect: ' + numerator.inspect + ', ' + denominator.inspect
    end
    @numerator = numerator
    @denominator = denominator
  end
end

# puts Fraction.new('s_numerator', 's_denominator') #=> fail
# puts Fraction.new('s_numerator', 1) #=> fail
# puts Fraction.new(2, '1') #=> fail
puts Fraction.new(1, 2) #=> ok
