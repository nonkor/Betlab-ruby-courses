module M
  def my_each
    if self.is_a?(Array)
      for item in 0..self.length - 1 do
        yield(self[item])
      end
    elsif self.is_a?(Hash)
      for item in 0..self.length - 1 do
        yield([self.keys[item], self.values[item]])
      end
    end
  end
end

class Array
  include M
end

class Hash
  include M
end