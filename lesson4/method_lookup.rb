module A
  def foo ; end
  def bar ; end
end

module B
  def hello ; end
  def bye ; end
end

module C
  include B
  def start ; end
  def stop ; end
end

module D
  include A
  include C
end

D.ancestors
# => [D, C, B, A]
D.instance_method(:foo)
# => #<UnboundMethod: D(A)#foo>
D.instance_method(:hello)
# => #<UnboundMethod: D(B)#hello>
D.instance_method(:start)
# => #<UnboundMethod: D(C)#start>

class K
  include D
end

k = K.new
k.method(:start)
# => #<Method: K(C)#start>

def k.for_k ; end
k.method(:for_k)
# => #<Method: #<K:0x007feabc11a0b8>.for_k>

k.singleton_class.ancestors
# => [K, D, C, B, A, Object, Kernel, BasicObject]

D.singleton_class.ancestors
# => [#<Class:D>, Module, Object, Kernel, BasicObject]
