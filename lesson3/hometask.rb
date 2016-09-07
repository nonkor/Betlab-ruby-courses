module MyEach
  def self.my_each
    while true
      yield
    end
  end

 my_each do |i|
    p i
  end

end

class Array
  include MyEach

  [1, 2, 3].my_each
end

class Hash
  include MyEach
  {1 => '1', 2 => '2'}
end
