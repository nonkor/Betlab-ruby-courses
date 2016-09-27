define_method(:test1) do |required, optional = :none|
  [required, optional]
end

define_method(:test2) do |*args|
  required = args[0]
  optional = args[1] || :none
  [required, optional]
end

define_method(:test3) do |required:, optional: :none|
  [required, optional]
end

test1 :one # => [:one, :none]
test2 :one # => [:one, :none]
test3 required: :one # => [:one, :none]

test1 # => wrong number of arguments (0 for 1..2) (ArgumentError)
test2 # => [nil, :none]
test3 # => missing keyword: required (ArgumentError)

