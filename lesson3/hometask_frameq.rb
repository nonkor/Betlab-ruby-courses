module MyEach
  def my_each
    return to_enum(:my_each) unless block_given?
    i = 0
    a = self.to_a
    count = a.length
    while i < count
      yield(a[i]) if block_given?
      i += 1
    end
  end
end

class Array
  include MyEach
end

class Hash
  include MyEach
end

[1, 2, 3, 4].my_each do |i|
  puts i
end

enum = {:a => 1, :b => 2, :c => 3}.my_each
