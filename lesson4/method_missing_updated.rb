class K
  def method_missing(method_name, *args)
    puts "Что вы ходюте тут? Нет у нас никакого '#{method_name}'"
    unless args.empty?
      puts "И вот эти аргументики ваши заберите с собой: #{args}"
    end
  end
end


k = K.new

puts k.method(:method_missing)
# => #<Method: K#method_missing>
k.missing_m
# => puts `Что вы ходюте тут? Нет у нас никакого 'missing_m'`
k.second_attempt(:a, :b)
# => puts `Что вы ходюте тут? Нет у нас никакого 'second_attempt'`
# => puts `И вот эти аргументики ваши заберите с собой: [:a, :b]`

