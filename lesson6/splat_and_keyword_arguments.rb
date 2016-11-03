def my_method(_name, *params)
  [params[0], params[1]]
end

my_method('name1', true) # => [true, nil]
my_method('name2', 0, 1, 2) # => [0, 1]

def my_method2(name:, params:)
  [name, params]
end

my_method2(name: 'a', lol: true) # => ['a', true]

def my_method3(name, visible: true, enabled: true)
  [name, visible, enabled]
end

h = {:enabled => false}
my_method3('checkbox', h) # => ['checkbox', true, false]
