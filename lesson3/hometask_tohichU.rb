# 1. создайте бранч hometask2_<githubname> из мастера
# 2. создайте в папке lesson2  файл hometask_<githubname>.rb

module MyEach

  def my_each
    return self.to_enum(:my_each) unless block_given?
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

[1, 2, 3, 4].my_each { |i| puts "Array item: #{i}" }

{a => 1, b => 2}.my_each { |key, value| puts "Hash key: #{key}: Value #{value}" }







