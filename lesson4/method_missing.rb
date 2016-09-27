class K
end

k = K.new

k.method(:method_missing)
#<Method: K(BasicObject)#method_missing>
k.missing_m # => undefined method `missing_m'
# for #<K:0x007fa05c81fd90> (NoMethodError)

