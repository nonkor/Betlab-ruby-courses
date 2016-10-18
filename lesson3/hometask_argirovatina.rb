module MyEach

  def my_each
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


x = [1, 2, 4]
x.my_each do |i|
  puts i.to_s
end
