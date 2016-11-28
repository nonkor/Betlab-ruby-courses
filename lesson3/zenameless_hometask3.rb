
module MyEach

  def my_each
    return to_enum(:my_each) unless block_given?
    this = self.to_a
    while (i ||= 0) < length
      yield(this[i])
      i += 1      
    end
  end

end

Array.include MyEach
Hash.include MyEach

array = [54, 2, 64, 87, 654, 12, 15]
hash = {df: 45, ijfd: 54, sdf: 123, 'weffe': 'grrg'}

array.my_each { |x| puts "-#{x}-"}
hash.my_each  { |k, v| puts "#{k} : #{v}" }
