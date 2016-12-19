module I18n::Lazy::Generator
  module YAML
    def self.variable(name)
      "%{#{name}}"
    end
  end
end
