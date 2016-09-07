module Myeach
  def my_each
    i = 0
    while i < self.size
      yield(self[i])
      i+=1
    end
    self
  end
end

class Array
  include Myeach
end

class Hash
  include Myeach
end

[1,2,3].my_each{|i|p i}
[1=>'1', 2=>'2', 3=>'3'].my_each{|i|p i}