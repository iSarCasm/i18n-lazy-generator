module LazyTranslate
  module TextToKeyContent
    def self.convert(source_class, content)
      variables = {}
      content = source_class.substitute_vars_in_text(content) do |ruby_code|
        variable_name = collision_handled_name(ruby_to_variable(source_class, ruby_code), variables)
        variables[variable_name] = source_class.extract_var ruby_code
        YAML.formatted_variable variable_name
      end
      KeyContent.new(content, variables)
    end

    private

    def self.collision_handled_name(desired_name, used_names)
      unique_name = desired_name
      suffix = 2
      while used_names.include?(unique_name)
        unique_name = desired_name + suffix.to_s
        suffix += 1
      end
      unique_name
    end

    def self.ruby_to_variable(source_class, ruby_code)
      ruby_code = source_class.escape_tags(ruby_code)
      source_class.link?(ruby_code) ? "link" : source_class.last_identifier(ruby_code)
    end
  end
end
