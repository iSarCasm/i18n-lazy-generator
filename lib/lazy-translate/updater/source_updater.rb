module LazyTranslate
  module SourceUpdater
    def self.update(source_text, source_type)
      text_elements = parse(source_text, source_type)
      translation_elements = make_translation_elements(text_elements)
      apply_translations(translation_elements, source_text)
    end

    private

    def self.parse(source_file, source_type)
      Parser.get_parser(source_type).parse_and_finalize(source_file)
    end

    def self.make_translation_elements(text_elements)
      text_elements.map do |t_e|
        TranslationElement.new(translation: translate(t_e.content), start: t_e.start, finish: t_e.finish)
      end
    end

    def self.translate(text)
      "= t('.#{TextToKeyName.convert(text)}')"
    end

    def self.apply_translations(translations, text)
      new_text = text
      translations.each do |t|
        new_text = t.apply_translation(new_text)
      end
      new_text
    end

    def self.join_elements_to_text(elements)
      elements.each.with_object("") do |el, text|
        text << el.content
      end
    end
  end
end
