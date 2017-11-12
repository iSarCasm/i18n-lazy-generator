module LazyTranslate
  class TranslationElement < TextElement
    attr_reader :original, :translation, :applied

    def initialize(original: nil, translation: nil, start: , finish: )
      @original     = original
      @translation  = translation
      @start        = start
      @finish       = finish
      @applied      = false
    end

    def translate_with(translation)
      @translation = translation
    end

    def apply_translation(text)
      raise 'Translation not provided' unless translation
      raise 'Translation already applied' if applied
      @applied = true
      new_text = remove_old_text_part(text)
      return add_translation_part(new_text)
    end

    private

    def remove_old_text_part(text)
      text[0...start] + text[finish+1..-1]
    end

    def add_translation_part(text)
      text[0...start] + translation + text[start..-1]
    end
  end
end
