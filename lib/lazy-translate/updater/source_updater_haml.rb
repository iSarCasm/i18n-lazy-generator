module LazyTranslate
  class SourceUpdaterHAML
    def self.update(source_text, new_translations)
      apply_translations source_text, new_translations
    end

    private

    def self.apply_translations(text, translations)
      new_text = text
      translations.each do |t|
        new_text = t.apply_translation(new_text)
      end
      new_text
    end
  end
end
