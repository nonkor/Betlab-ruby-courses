module MyEach

  def my_each
    object = self.clone.to_a
    index = 0
    until index == object.length do
      yield(object[index])
      index += 1
    end
    self
  end

end

Array.include MyEach
Hash.include MyEach

[1, 5, 7, 8].my_each { |item| puts item }
# puts 1
# puts 5
# puts 7
# puts 8

my_hash = {'a1' => 1, 'a2' => 5, 'a3' => 7, 'a4' => 8}

my_hash.my_each { |key, value| puts "key: #{key}, value: #{value}" }
# puts 'key: a1, value: 1'
# puts 'key: a2, value: 5'
# puts 'key: a3, value: 7'
# puts 'key: a4, value: 8'

my_hash.my_each { |pair| puts "#{pair}" }
# puts ["a1", 1]
# puts ["a2", 5]
# puts ["a3", 7]
# puts ["a4", 8]