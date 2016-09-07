class Array
  def even
    self.each do |item|
      yield(item) if item.even?
    end
  end
end

[1,2,3,4].even { |item| puts item }
# puts `2`
# puts `4`

