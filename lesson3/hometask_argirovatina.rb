module MyEach

  def my_each
    return self.to_enum(:my_each) unless block_given?
    arr = self.to_a
    arr_size = self.count
    current_element = 0
    while current_element < arr_size
      yield arr[current_element]
      current_element += 1
    end
    self
  end

end


class Array
  include MyEach
end

class Hash
  include MyEach
end

########## Examples######################
[1, 2].my_each { |el| p el.to_s }
{a: 1, b: 2}.my_each { |pair| p pair }
{a: 1, b: 2}.my_each { |key, value| p "1: #{key}"; p "2: #{value}" }
p [1, 2].my_each
p ({a: 1, b: 2}.my_each)

