module LazyTranslate
  module KeyContent
      def self.generate(content)
        content = substitute_variables(content)
      end

      private

      def self.substitute_variables(text)
        used_variables = []
        LazyTranslate::ERB.substitute_erb_with(text) do |erb|
          variable = erb_to_variable(erb)
          YAML.variable collision_handled(variable, used_variables)
        end
      end

      def self.collision_handled(element, array)
        new_element = element
        suffix = 2
        while array.include?(new_element)
          new_element = element + suffix.to_s
          suffix += 1
        end
        array << new_element
        new_element
      end

      def self.erb_to_variable(erb)
        erb = LazyTranslate::ERB.escape_tags(erb)
        if LazyTranslate::ERB.link?(erb)
          "link"
        else
          LazyTranslate::ERB.last_identifier(erb)
        end
      end
  end
end
