
module MyEach

  def my_each
    return self.to_enum unless block_given?
    clone = self.clone
    while item = clone.shift
      yield(item)
    end
  end

end

class Array

  include MyEach

end

class Hash

  include MyEach

end

# Array custom iterator
[1, 2, 3, 4].my_each { |i| puts "Array item: #{i}" }

# Hash custom iterator
{a: 1, b: 2}.my_each { |k, v| puts "Hash key: #{k}: Value #{v}" }