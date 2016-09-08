class Object
  def call
    ' Object '
  end
end

module M1
  def call
    super << ' M1 '
  end
end

module M2
  def call
    super << ' M2 '
  end
end

class K
  include M1
  include M2
end

puts K.new.call # => ' Object M1  M2 '

