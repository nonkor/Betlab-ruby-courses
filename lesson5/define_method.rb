class Foo
  def self.add_method_for_strings(*strings)
    strings.each do |str|
      define_method(str) do
        str.to_sym
      end
    end
  end
end

f = Foo.new

f.bar1
# => undefined method `bar1' for #<Foo:0x007fa6a882f0b8> (NoMethodError)

Foo.add_method_for_strings('bar1', 'bar2', 'bar3')

f.bar1 # => :bar1

