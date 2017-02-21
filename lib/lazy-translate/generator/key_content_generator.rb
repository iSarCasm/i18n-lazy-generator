module LazyTranslate
  module KeyContentGenerator
    def self.generate(content)
      content = substitute_erb(content)
    end

    private

    def self.substitute_erb(text)
      used_variable_names = []
      ERB.substitute_erb_with(text) do |erb|
        YAML.variable collision_handled(erb_to_variable(erb), used_variable_names)
      end
    end

    def self.collision_handled(variable_name, used_names)
      new_variable_name = variable_name
      suffix = 2
      while used_names.include?(new_variable_name)
        new_variable_name = variable_name + suffix.to_s
        suffix += 1
      end
      used_names << new_variable_name
      new_variable_name
    end

    def self.erb_to_variable(erb)
      erb = LazyTranslate::ERB.escape_tags(erb)
      ERB.link?(erb) ? "link" : ERB.last_identifier(erb)
    end
  end
end
