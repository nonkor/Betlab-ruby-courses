just_proc = Proc.new {}
lambda_proc = lambda {}

puts just_proc # :
# puts `#<Proc:0x007fd5e1855908@lesson3/lambda.rb:1>`
puts lambda_proc # :
# puts `#<Proc:0x007fd5e1855d90@lesson3/lambda.rb:2 (lambda)>`

lambda_stylish = ->(ending) { "i am so cool#{ending}" }
lambda_stylish.call('!') # => i am so cool!

