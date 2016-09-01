var = 'var'

def my_method
  var = 'var from method'
  yield('var to block', "string which won't be used") if block_given?
  var
end

result = my_method do |var_to_block|
  puts var_to_block # puts `var to block`
  puts var          # puts `var`
  var = 'var from block'
end

puts result # puts `var from method`
puts var    # puts `var from block`

