# задание:
#     - создайте класс Foo и модуль M, который будет содержать два метода.
#     - подключите модуль к классу так, чтобы один метод стал "классовым" методом, а другой - методом для инстансов Foo.
#     - нужно сделать так, чтобы при подключении модуля, в output (в нашем случае в консоль) выводилось два списка:
#       методов, добавленных для метакласса Foo и методов, добавленных для инстансов. В нашем случае должно быть ровно
#       по одному методу для каждой категории.
#
#       подсказка: внутри модуля M можно создавать подмодули.


module M

  def self.included(base)
    base.include MetaclassInstanceMethods
    base.extend MetaclassMethods
    puts "Instance methods #{base.instance_methods - Object.methods}"
    puts "Metaclass methods #{base.singleton_methods}"
  end

  module MetaclassInstanceMethods

    def class_method
    end

  end

  module MetaclassMethods

    def metaclass_method
    end

  end

end


class Foo
  include M
end
