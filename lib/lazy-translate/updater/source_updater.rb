module LazyTranslate
  class SourceUpdater
    def update(source_text, new_translations)
      apply_translations source_text, new_translations
    end

    private

    def apply_translations(text, translations)
      new_text = text
      translations.each do |t|
        modify_translation_key(t)
        new_text = t.apply_translation(new_text)
      end
      new_text
    end

    def modify_translation_key(translation)
      case translation.location
      when :ruby then
        translation.translation_key = key_inside_ruby(translation.translation_key)
      when :text then
        translation.translation_key = key_inside_text(translation.translation_key)
      else raise 'Unknown translation location'
      end
    end

    def key_inside_ruby(key)
      key
    end

    def key_inside_text(key)
      key
    end
  end
end
