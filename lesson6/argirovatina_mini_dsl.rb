class Person
  #attr_accessor :fullname, :age, :sex, :file

  # def initialize(fullname=nil, age=nil, sex=nil, file=nil)
  #   @fullname = fullname
  #   @age = age
  #   @sex = sex
  #   @file = file
  # end

  def self.method_missing(method, name)
    define_method(method) do |method_name|
      name
    end
  end

end

class UserFactory
  def self.method_missing(method, name)
    Person.send(method, name)
    yield if block_given?
      Person.class_eval {attr_accessor method}
      Person.new.send("#{method}=", name)
  end

end

class UserFactory
  person :nonkor do
    fullname 'Alex Mikitenko'
    sex :man
    age 31
  end

end



