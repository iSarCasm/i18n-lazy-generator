module I18n::Lazy::Generator
  module SourceUpdater
    def self.run(source_text, source_type)
      parse(source_text, source_type)
      substitute_text_with_keys
      join_text
    end

    private

    def self.parse(source_file, source_type)
      if source_type == :haml then
        @elements = I18n::Lazy::Generator::HAMLParser.parse_and_finalize(source_file)
      end
    end

    def self.substitute_text_with_keys
      @elements.each do |el|
        if el.class == I18n::Lazy::Generator::TextElement then
          el.content = "=t('.#{I18n::Lazy::Generator::KeyName.generate(el.content)}')"
        end
      end
    end

    def self.join_text
      @elements.each.with_object("") do |el, t|
        t << el.content
      end
    end
  end
end
