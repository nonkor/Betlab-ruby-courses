def i_manage_only_one_arg(arg, &proc)
  yield
end

i_manage_only_one_arg('i am useless') do
  :nothing_to_do_here
end # => :nothing_to_do_here

i_manage_only_one_arg('i am useless', &Proc.new {}) # ok

i_manage_only_one_arg('i am useless', Proc.new {})
# `i_manage_only_one_arg':
# wrong number of arguments (2 for 1) (ArgumentError)


