[1, 2, 3].each { |item| puts "#{item} is a number" }
# puts `1 is a number`
# puts `2 is a number`
# puts `3 is a number`

%i[first second third].map { |item| item.to_s }
# => %w[first second third]

%w[first second third].select do |item|
  item.include? 'i'
end # => %w[first third]

[1, 'a', :b].find do |item|
  item == :b
end # => :b

3.times { puts 'knock knock' }
# puts `knock knock`
# puts `knock knock`
# puts `knock knock`




