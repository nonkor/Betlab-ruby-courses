class LazyHash < Hash

  def method_missing(method_name)
    fetch(method_name).call
    self[method_name] = fetch(method_name).call
  end

  def lazy? method_name
    if fetch(method_name).instance_of? Proc
      true
    else
      false
    end
  end
end

a = LazyHash.new
a[:b] = Proc.new { 12 }
puts a[:b]
puts a.lazy? :b
a.b
puts a[:b]
puts a.lazy? :b