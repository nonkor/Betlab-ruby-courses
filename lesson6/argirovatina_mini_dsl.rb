class Person

  def self.method_missing(method)
    define_singleton_method(method) do
      Person.new
    end
  end

end

class UserFactory

  class << self

    def method_missing(method, name)
      if method == :person
        @file_name = Person.send(name).to_s
        File.new(@file_name << '.yml', 'w+')
      end
      yield if block_given?
      create_attr_accessor_with(method, name)
      write_to_file(@file_name, "#{method}: #{name}")
    end

    private

    def create_attr_accessor_with(method, name)
      Person.class_eval { attr_accessor method }
      Person.new.send("#{method}=", name)
    end

    def write_to_file(file_name, text)
      File.open(file_name, 'a') do |file|
        file.write("#{text}\n")
        file.close
      end
    end
  end

end

class UserFactory
  person :nonkor do
    fullname 'Alex Mikitenko'
    sex :man
    age 31
  end

end

puts Person.nonkor.fullname

# у этих объектов может быть 4 свойства только: fullname, sex, age и file.
#
# доступ к ним должен происходить при помощи такого синтаксиса:
#
# puts Person.nonkor.inspect
# puts Person.nonkor.fullname
# puts Person.nonkor.sex
# puts Person.nonkor.age
#
# puts Person.zarina.inspect
# puts Person.zarina.fullname
# puts Person.zarina.sex
# puts Person.zarina.age
#
# кроме того, для сразу же после создания, пользователь должен сохраняться в yml файл
# как сериализованный объект с одноименным именем файла, если это имя не задано явно. т.е.,
# в нашем эти пользователи должно сохраниться в:
#
# nonkor.yml и zarina_mikitenko.yml
#
# все атрибуты пользователя должны быть переопределяемы. т.е.,
# нужно иметь возможность изменить fullname, sex, age и file для каждого из них.
#
# кроме того, должен существовать метод #load!, который произведет десериализацию
# (обновит объект данными из ассоциированного файла) и метода #save!, который повторно перезапишет
# ассоциированного файла актуальным пользователем.
#
# например
# Fabrica.zarina.age = 10
# Fabrica.zarina.save! # => обновили zarina_mikitenko.yml, там теперь age сохранен как 10.



