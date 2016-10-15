require 'yaml'

module Person

  PATH_TO_SERIALIZED = 'serialized'

  module Factory

    class PersonBase
      attr_writer :fullname, :sex, :age

      def initialize(label, block)
        @label = label
        self.instance_eval &block
      end

      def fullname(name = '')
        raise ArgumentError unless name.is_a?(String)
        @fullname = name unless name.empty?
        @fullname
      end

      def sex(type = nil)
        raise ArgumentError unless [nil, :woman, :man, :male, :female].include?(type)
        @sex = type unless type.nil?
        @sex
      end

      def age(number = -1)
        raise ArgumentError unless number.is_a?(Numeric)
        @age = number unless number == -1
        @age
      end

      def file(file_name)
        raise ArgumentError unless file_name.is_a?(String)
        @file_name = file_name
      end

      def inspect
        text =  "Full Name : #{@fullname}\n"
        text << "Age       : #{@age}\n"
        text << "Sex       : #{@sex}\n"
        text
      end

      def save!
        serialized = YAML::dump(self)
        File.open(path, 'w') do |f|
          f.puts(serialized)
        end
      end

      def load!
        result = YAML::load(File.read(path))
        @fullname = result.fullname
        @sex = result.sex
        @age = result.age
      end

      private

      def path
        file_name = @file_name || @label
        "#{Dir.pwd}/#{PATH_TO_SERIALIZED}/#{file_name}.yml"
      end
    end

    def self.extended(klass)
      Dir.mkdir(PATH_TO_SERIALIZED) unless File.exists?(PATH_TO_SERIALIZED)
    end

    def person(label, &block)
      pers = PersonBase.new(label, block)
      pers.save!
      Person.define_singleton_method(label) do
        pers
      end
    end

  end

end
