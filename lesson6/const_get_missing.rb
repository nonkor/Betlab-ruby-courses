class MyClass
  module Consts
    MY_CONST = '1'
    MY_OLOLO = '2'

    def self.const_missing(name)
      "#{name} const is missing"
    end
  end
end

['const', 'ololo', 'foo'].each do |c|
  const_name = "Consts::MY_#{c.upcase}" # Use :: before const_name to search from root
  p MyClass.const_get const_name # =>
  # "1"
  # "2"
  # "MY_FOO const is missing"
end


