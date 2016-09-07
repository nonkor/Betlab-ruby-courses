def i_am_lazy(given_proc)
  puts '[begin] action from #i_am_lazy'
  given_proc
  i_am_laborious(given_proc)
  puts '[end] action from #i_am_lazy'
end

def i_am_laborious(given_proc)
  puts '[begin] action from #i_am_laborious'
  given_proc.call
  puts '[end] action from #i_am_laborious'
end

def i_am_dump_and_lazy
  puts '[begin] action from #i_am_dump_and_lazy'
  i_am_dump_and_laborious#(yield)
  puts '[end] action from #i_am_dump_and_lazy'
end

def i_am_dump_and_laborious#(given_result_of_block)
  puts '[begin] action from #i_am_dump_and_laborious'
  #given_result_of_block
  yield
  puts '[end] action from #i_am_dump_and_laborious'
end

my_proc = Proc.new do
  puts 'please, someone, perform me!'
end

my_proc # puts
# `#<Proc:0x007fef7082f070@lesson3/proc.rb:13>`

i_am_lazy(my_proc) # :
# [begin] action from #i_am_lazy:
# [begin] action from #i_am_laborious:
# please, someone, perform me!
# [end] action from #i_am_laborious:
# [end] action from #i_am_lazy:

puts

i_am_dump_and_lazy do
  puts 'whaaaat?'
end # :
# [begin] action from #i_am_dump_and_lazy
# whaaaat?
# [begin] action from #i_am_dump_and_laborious
# [end] action from #i_am_dump_and_laborious
# [end] action from #i_am_dump_and_lazy

