module MyEach

  # as far we are using only Array and Hash i let myself
  # make conclusion if not class is not Array, than class is Hash

  def my_each
    i = 0
    while i < self.size do
      self.class == Array ? yield(self[i]) : yield(self.keys[i], self.values[i])
      i +=1
    end
  end

end

class Array

  include MyEach

end

class Hash

  include MyEach

end


[1,2,3,4,5].my_each { |item| puts  "wow #{item}" }
#wow 1
#wow 2
#wow 3
#wow 4
#wow 5

{:wow => 'some', :wow1 => 'some1'}.my_each { |k, v| puts "key = #{k}, val = #{v}" }
#key = wow, val = some
#key = wow1, val = some1