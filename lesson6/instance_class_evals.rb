str = 'string'
str = "string"
str = '''
  string
'''
str = %{
  string
}
str = <<-END_OF_STRING
  def my_method
    'some simple result'
  end
END_OF_STRING

self.instance_eval(str) # => :my_method
my_method # => 'some simple result'
Object.new.my_method # => undefined method `my_method' for #<Object:0x007fa9820463d8>

self.class.class_eval(str) # => :my_method
Object.new.my_method # => 'some simple result'
