require 'rspec/expectations'
include RSpec::Matchers

class Array

  def custom_each(obj_class=nil, &block)
    i = 0
    while i < self.length
      el = self[i]
      i+=1
      yield(el) if block_given?
    end
    if obj_class
      obj_class[self]
    else
      self
    end
  end
end

class Hash
  def custom_each(&block)
    if block_given?
      Array.new(self.to_a).custom_each(self.class, &block)
    else
      self
    end
  end
end


expect([4,6,8].custom_each { |x| puts x**x }).to eq([4,6,8].each { |x| puts x**x })
expect([4,6,8].custom_each { |x| p x**x }).to eq([4,6,8].each { |x| p x**x })

a = [1,2,3]
b = [1,2,3]
expect(a.custom_each { |x| x = x**x }).to eq(b.each { |x| x = x**x })

# expect([4,6,8].custom_each { |x| x**x }).to eq([4,6,8].each { |x| x**x })
# expect([4,6,8].custom_each).to eq([4,6,8].each)
# expected: #<Enumerator: [4, 6, 8]:each>
#     got: [4, 6, 8]

expect({one: 1, two: 2}.custom_each {|h| p h} ).to eq({one: 1, two: 2}.each {|h| p h} )
expect({one: 1, two: 2}.custom_each {|k,v| puts "#{k}:::#{v}" } ).to eq({one: 1, two: 2}.each {|k,v| puts "#{k}~~~#{v}" } )
expect({one: 1, two: 2}.custom_each {|h| h} ).to eq({one: 1, two: 2}.each {|h| h} )
# expect({one: 1, two: 2}.custom_each).to eq({one: 1, two: 2}.each)
# expected: #<Enumerator: {:one=>1, :two=>2}:each>
#     got: {:one=>1, :two=>2}




