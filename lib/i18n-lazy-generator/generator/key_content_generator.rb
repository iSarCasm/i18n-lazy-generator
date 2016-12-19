module I18n::Lazy::Generator
  module KeyContent
      def self.generate(content)
        content = substitute_variables(content)
        # text = content.gsub( /[ \t]{2,}/, " " )
        # text = "\n" << text
        # text = text.gsub( /\n/, "\n\t" )
        # text = text.gsub "\t ", "\t"
        # text = "%p" << text
        # text = text.gsub(/=.+$/, "SOME_VAR")
        # text = Haml::Engine.new(text).render
        # text = text.gsub("SOME_VAR", "%{}")
        # text = text[6..-6]
        # text = text.gsub( / *\s+/, " " )
        # text = text[0...text.size-1] if text[-1] == ' '
      end

      private

      def self.substitute_variables(text)
        used_variables = []
        I18n::Lazy::Generator::ERB.map(text) do |erb|
          new_variable = erb_to_var(erb)
          result_new_variable = new_variable

          while used_variables.include?(result_new_variable)
            i = 2
            result_new_variable = new_variable + i.to_s
            i+=1
          end

          used_variables << result_new_variable
          YAML.variable result_new_variable
        end
      end

      def self.erb_to_var(erb)
        erb = I18n::Lazy::Generator::ERB.escape(erb)
        if I18n::Lazy::Generator::ERB.link?(erb)
          "link"
        else
          I18n::Lazy::Generator::ERB.last_identifier(erb)
        end
      end
  end
end
