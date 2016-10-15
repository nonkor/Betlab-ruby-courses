class Foo
  instance_eval do |var|
    def bar(var)
      'try' << var
    end
  end
end

Foo.bar(' it') # => "try it"

