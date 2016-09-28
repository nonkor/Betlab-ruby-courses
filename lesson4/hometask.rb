class LazyHash < Hash

  def method_missing(method_name)
    self[method_name] = fetch(method_name).call
  end

  def respond_to_missing?(method_name, include_private = false)
    self[method_name] || super
  end

  def lazy? method_name
    fetch(method_name).instance_of? Proc
  end

end


a = LazyHash.new
a[:b] = Proc.new { 12 }
puts a[:b]
puts a.lazy? :b
puts a.b
puts a.lazy? :b



