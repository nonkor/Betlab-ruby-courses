module MyEach

  def my_each
    if block_given?
      current_number = self.count
      while current_number > 0
        yield self[current_number - 1]
        current_number -= 1
      end
    end
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
