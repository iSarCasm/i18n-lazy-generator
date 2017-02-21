module LazyTranslate
  module YAML
    def self.variable(name)
      "%{#{name}}"
    end
  end
end
