module I18n::Lazy::Generator
  module KeyContent
      def self.generate(content)
        content = substitute_variables(content)
      end

      private

      def self.substitute_variables(text)
        used_variables = []
        I18n::Lazy::Generator::ERB.map(text) do |erb|
          variable = erb_to_variable(erb)
          YAML.variable collision_handled(variable, used_variables)
        end
      end

      def self.collision_handled(element, array)
        new_element = element
        i = 2
        while array.include?(new_element)
          new_element = element + i.to_s
          i += 1
        end
        array << new_element
        new_element
      end

      def self.erb_to_variable(erb)
        erb = I18n::Lazy::Generator::ERB.escape(erb)
        if I18n::Lazy::Generator::ERB.link?(erb)
          "link"
        else
          I18n::Lazy::Generator::ERB.last_identifier(erb)
        end
      end
  end
end
