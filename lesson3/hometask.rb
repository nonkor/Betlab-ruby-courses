module MyEach
  def my_each
    i = 0
    while i < self.length
    	case 
    	when self.class == Array
    		yield self[i]
    	when self.class == Hash
    		yield [self.keys[i], self.values[i]]
    	end
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
{abc: 1, zxc: 2}.my_each { |keys, values| puts keys, values }