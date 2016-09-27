module M1
  def hello
    puts 1; super
  end
end

module M2
  def hello
    puts 2; super
  end
end

class SuperK
  def hello
    puts 'super_k'
  end
end

class K < SuperK
  prepend M1
  include M2

  def hello
   puts 'k'; super
  end
end

K.new.hello # => puts `1 k 2 super_k`
K.ancestors # => [M1, K, M2, SuperK, Object, Kernel, BasicObject]

