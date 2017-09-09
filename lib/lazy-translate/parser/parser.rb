require 'pry'
module LazyTranslate
  class Parser
    def self.get_parser(type)
      LazyTranslate.const_get(type.to_s.upcase+'Parser', true)
    end

    def self.parser_elements
      []
    end

    def self.parse(data)
      elements = []
      current = ParsedElement.new
      index = 0
      while index != data.length do
        char = data[index]
        char_addded = false
        if current.can_add? char, index
          current = current.add char, index, self.parser_elements
          char_addded = true
        end
        if current.finished? then
          elements << current
          current = ParsedElement.new
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
