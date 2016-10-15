require_relative 'person'

class UserFactory

  extend Person::Factory

  person :nonkor do
    fullname 'Alex Mikitenko'
    sex :man
    age 31
  end

  person :zarina do
    fullname 'Zarina Mikitenko'
    sex :woman
    age 22
    file 'zarina_mikitenko.yml'
  end
end

# Read
puts Person.nonkor.inspect
puts Person.nonkor.fullname
puts Person.nonkor.sex
puts Person.nonkor.age
puts ''
puts Person.zarina.inspect
puts Person.zarina.fullname
puts Person.zarina.sex
puts Person.zarina.age
puts

# Write
Person.nonkor.fullname = 'New Full name'
puts Person.nonkor.fullname == 'New Full name'
Person.zarina.sex = :male
puts Person.zarina.sex == :male
Person.nonkor.age = 40
puts Person.nonkor.age == 40

# Serialize / Deserialize
Person.nonkor.fullname = 'New Full name'
Person.nonkor.save!
Person.nonkor.load!
puts Person.nonkor.fullname == 'New Full name'
Person.zarina.sex = :male
Person.zarina.load!
puts Person.zarina.sex == :woman
