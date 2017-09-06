module LazyTranslate
  class TranslationElement < TextElement
    attr_reader :applied, :translation

    def initialize(translation: , start: , finish: )
      @translation  = translation
      @start        = start
      @finish       = finish
      @applied      = false
    end

    def apply_translation(text)
      return text if applied
      @applied = true
      new_text = remove_old_text_part(text)
      return add_translation_part(new_text)
    rescue StandardError
      text
    end

    private

    def remove_old_text_part(text)
      text[0...start] + text[finish..-1]
    end

    def add_translation_part(text)
      text[0...start] + translation + text[start..-1]
    end
  end
end
