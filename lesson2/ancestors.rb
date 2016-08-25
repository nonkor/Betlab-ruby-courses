class Foo
end

f = Foo.new

f.singleton_class.ancestors # =>
# %i[
#   #<Class:#<Foo:0x007fda0a013b28>>
#   Foo
#   Object
#   Kernel
#   BasicObject
# ]

Foo.singleton_class.ancestors
# %i[
#   #<Class:Foo>
#   #<Class:Object>
#   #<Class:BasicObject>
#   Class
#   Module
#   Object
#   Kernel
#   BasicObject
# ]

