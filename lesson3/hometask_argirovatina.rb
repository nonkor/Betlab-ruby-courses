module MyEach

  def my_each
    self.to_a.flatten if self.is_a?(Hash)
    if block_given?
      new_array = []
      current_number = self.count
      while current_number > 0
        new_array << yield(self[current_number - 1])
        current_number -= 1
      end
    end
    p new_array.reverse!
  end

end


class Array
  include MyEach
end

class Hash
  include MyEach
end


x = Hash['a' => 2]
x.my_each do |i|
  i.to_s
end
