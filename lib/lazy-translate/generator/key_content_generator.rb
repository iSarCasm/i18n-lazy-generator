module LazyTranslate
  module KeyContentGenerator
    def self.generate(content)
      content = substitute_erb(content)
    end

    private

    def self.substitute_erb(text)
      used_variable_names = []
      ERB.substitute_erb_in_text(text) do |erb|
        variable_name = collision_handled_name(erb_to_variable(erb), used_variable_names)
        used_variable_names << variable_name
        YAML.formatted_variable variable_name
      end
    end

    def self.collision_handled_name(desired_name, used_names)
      unique_name = desired_name
      suffix = 2
      while used_names.include?(unique_name)
        unique_name = desired_name + suffix.to_s
        suffix += 1
      end
      unique_name
    end

    def self.erb_to_variable(erb)
      erb = ERB.escape_tags(erb)
      ERB.link?(erb) ? "link" : ERB.last_identifier(erb)
    end
  end
end
