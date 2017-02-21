module LazyTranslate
  module SourceUpdater
    def self.update_source(source_text, source_type)
      parsed_elements = parse(source_text, source_type)
      parsed_elements = substitute_text_with_keys(parsed_elements)
      join_elements_to_text(parsed_elements)
    end

    private

    def self.parse(source_file, source_type)
      if source_type == :haml then
        LazyTranslate::HAMLParser.parse_and_finalize(source_file)
      end
    end

    def self.substitute_text_with_keys(elements)
      elements.each do |el|
        if el.class == TextElement then
          el.content = "=t('.#{KeyNameGenerator.generate(el.content)}')"
        end
      end
    end

    def self.join_elements_to_text(elements)
      elements.each.with_object("") do |el, t|
        t << el.content
      end
    end
  end
end
