class Foo
end

Bar = Class.new

Foo.new.class # => Foo
Foo.object_id # => 70137449608440
Foo.new.class.object_id # => 70137449608440

Bar.new.class # => Bar
Bar.object_id # => 70137449608380
Bar.new.class.object_id # => 70137449608380

Object.object_id # => 70137441352880
Class.object_id # => 70137441352800

