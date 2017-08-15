module LazyTranslate
  module YAML
    def self.formatted_variable(name)
      "%{#{name}}"
    end
  end
end
