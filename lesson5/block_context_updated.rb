class Foo
  def in_block_context(&block)
    yield
  end

  def in_method_context(&block)
    instance_eval &block
  end
end

Foo.new.in_block_context { self.inspect }
# => "main"

Foo.new.in_method_context { self.inspect }
# => "#<Foo:0x007fa9530af790>"

