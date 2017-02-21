module LazyTranslate
  module YAML
    def self.embedded_variable(name)
      "%{#{name}}"
    end
  end
end
