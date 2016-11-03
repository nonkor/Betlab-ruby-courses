class Foo
  instance_eval do |_context| # this var points to self, in our case Foo
    def bar(var)
      'try' << var
    end
  end
end

Foo.bar(' it') # => "try it"

