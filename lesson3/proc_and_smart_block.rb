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
  i_am_dump_and_laborious do
    yield
  end
  puts '[end] action from #i_am_dump_and_lazy'
end

def i_am_dump_and_laborious
  puts '[begin] action from #i_am_dump_and_laborious'
  yield
  puts '[end] action from #i_am_dump_and_laborious'
end

my_proc = Proc.new do
  puts 'please, someone, perform me!'
end

my_proc # puts
# `#<Proc:0x007fef7082f070@lesson3/proc.rb:13>`

i_am_lazy(my_proc) # :
# puts `[begin] action from #i_am_lazy`
# puts `[begin] action from #i_am_laborious`
# puts `please, someone, perform me!`
# puts `[end] action from #i_am_laborious`
# puts `[end] action from #i_am_lazy`

puts

i_am_dump_and_lazy do
  puts 'whaaaat?'
end #
# puts `[begin] action from #i_am_dump_and_lazy`
# puts `[begin] action from #i_am_dump_and_laborious`
# puts `whaaaat?`
# puts `[end] action from #i_am_dump_and_laborious`
# puts `[end] action from #i_am_dump_and_lazy`
