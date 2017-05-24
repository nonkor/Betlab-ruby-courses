module MyEach
  def my_each
    obj = self.clone
    while i = obj.shift  do
      yield(i)
    end
  end
end

class Array
  include MyEach
end

class Hash
  include MyEach
end

[1,2,3,4].my_each { |i| puts i }
# puts 1
# puts 2
# puts 3
# puts 4
{'dog' => 'canine', 'cat' => 'feline', 'donkey' => 'asinine'}.my_each { |i,j| puts "#{i}-#{j}"}
# puts dog
# puts canine
# puts cat
# puts feline
# puts donkey
# puts asinine