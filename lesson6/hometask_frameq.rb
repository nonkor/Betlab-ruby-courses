require 'YAML'

class Person

  attr_accessor :age, :sex, :fullname, :file, :name

  def self.add(name, &block)
    self.class.send(:attr_accessor, name)
    instance_variable_set("@#{name.to_sym}", Person.new(name, &block))
  end

  def initialize(name, &block)
    @name = name
    instance_eval(&block)
    file if @file.nil?
    @info = {:name => @name, :fullname => @fullname, :age => @age, :sex => @sex, :file => @file}
    save!
  end

  def sex(sex = nil)
    @sex = sex unless sex.nil?
    @sex
  end

  def age(age = nil)
    @age = age unless age.nil?
    @age
  end

  def fullname(fullname = nil)
    @fullname = fullname unless fullname.nil?
    @fullname
  end

  def file(file = nil)
    file.nil? ?  @file = "#{@name}.yaml" : @file = file
  end

  def inspect
    @info
  end

  def save!
    data = YAML.dump(@info)
    File.open(@file, 'w') { |file| file.write(data) }
  end

  def load!
     data = YAML.load_file(@file)
     data.each do |k, v|
       send("#{k}=", v)
     end
  end

end


class UserFactory

  def self.person (name, &block)
    Person.add(name, &block)
  end

end

class UserFactory
  person 'one' do
    sex 'f'
    age 22
  end

  person 'two' do
    sex 'm'
    age 44
    file 'file_two.yaml'
  end

end

puts Person.one.age       #22
puts Person.one.file      #one.yaml
puts Person.one.inspect   #{:name=>"one", :fullname=>nil, :age=>22, :sex=>"f", :file=>"one.yaml"}
puts Person.one.age = 100 #100
Person.one.save!
Person.one.load!
puts Person.one.inspect    #{:name=>"one", :fullname=>nil, :age=>22, :sex=>"f", :file=>"one.yaml"}
puts Person.two.file       #file_two.yaml
