!true # => false
true.! # => false

class TrueClass
  def !
    'I am not in a work mood. Fuck you!'
  end
end

!true # => 'I am not in a work mood. Fuck you!'
true.! # => 'I am not in a work mood. Fuck you!'

