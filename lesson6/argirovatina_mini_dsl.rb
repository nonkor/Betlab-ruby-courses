module Person
  attr_accessor :fullname, :age, :sex, :file

  def initialize(name)
  end

  def self.method_missing(method, name)
  end

end

class UserFactory
  include Person
end

class UserFactory
  person :nonkor do
    fullname 'Alex Mikitenko'
    sex :man
    age 31
  end
end