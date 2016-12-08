class LazyHash < Hash

  def method_missing(method_name)
    self[method_name] = fetch(method_name).call if fetch(method_name).is_a? Proc
  end

  def respond_to_missing?(method_name)
    self.has_key? method_name
  end

  def lazy? method_name
    fetch(method_name).is_a? Proc
  end

end


a = LazyHash.new
a[:b] = Proc.new { 12 }
puts a[:b]
puts a.lazy? :b
puts a.b
puts a.lazy? :b



