class Foo
  def bind_me
    'please, bind me!'
  end
end

f = Foo.new
o = Object.new

bind_me_un = Foo.instance_method(:bind_me)
# => #<UnboundMethod: Foo#bind_me>
bind_me = bind_me_un.bind(f)
# => #<Method: Foo#bind_me>
bind_me.call
# => "please, bind me!"

try_to_bind_me = bind_me_un.bind(o)
# => bind argument must be an instance of Foo (TypeError)

f.kind_of?(Foo) # => true
o.kind_of?(Foo) # => false

