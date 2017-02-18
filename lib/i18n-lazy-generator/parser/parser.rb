require 'pry'
module I18n::Lazy::Generator
  class Parser
    def self.parser_elements
      []
    end

    def self.parse(data)
      elements = []
      current = I18n::Lazy::Generator::ParsedElement.new
      index = 0
      while index != data.length do
        char = data[index]
        char_addded = false
        if current.can_add? char, index then
          current = current.add char, index, self.parser_elements
          char_addded = true
        end
        if current.finished? then
          elements << current
          current = I18n::Lazy::Generator::ParsedElement.new
        end
        index += 1 if char_addded
      end
      elements << current
    end

    def self.parse_and_finalize(data)
      self.finalize self.parse(data)
    end
  end
end
