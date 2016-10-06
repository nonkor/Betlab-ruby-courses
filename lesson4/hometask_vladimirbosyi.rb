class LazyHash < Hash

  def method_missing(method)
    if self.has_key?(method)
      self[method].is_a?(Proc) ? self[method] = self[method].call : self[method]
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    if self.has_key? method_name
      true
    else
      super
    end
  end

end


lazy = LazyHash.new
lazy[:wow] = Proc.new { puts 'i am Proc'}

puts lazy[:wow].is_a?(Proc) # => true
lazy.wow  # => i am Proc