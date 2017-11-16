module LazyTranslate
  module TextToKeyContent
    def self.convert(source_reader, content)
      variables = {}
      content = source_reader.substitute_vars_in_text(content) do |ruby_code|
        variable_name = collision_handled_name(ruby_to_variable(source_reader, ruby_code), variables)
        variables[variable_name] = source_reader.extract_var ruby_code
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

    def self.ruby_to_variable(source_reader, ruby_code)
      ruby_code = source_reader.escape_tags(ruby_code)
      source_reader.link?(ruby_code) ? "link" : source_reader.last_identifier(ruby_code)
    end
  end
end
