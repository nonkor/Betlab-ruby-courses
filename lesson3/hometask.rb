module MyEach
  def my_each
    i = 0
    while i < self.length
      yield self.to_a[i]
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

[1,2,3].my_each { |kek| puts kek**kek }  
# puts `1`
# puts `4`
# puts `27`
{abc: 1, zxc: 2}.my_each { |keys, values| puts "Key = #{keys}, Value = #{values}" }
# puts `Key = abc, Value = 1`
# puts `Key = zxc, Value = 2`
