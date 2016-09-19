class Foo
  def in_block_context(&block)
    yield
  end
end

Foo.new.in_block_context { self.inspect }
# => "main"













