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


lazy_hash = LazyHash.new
lazy_hash[:test] = Proc.new { puts 'This is Proc'}