module LazyTranslate
  class TranslationElement < TextElement
    attr_reader :original, :applied
    attr_accessor :translation, :translation_key

    def initialize(original: nil, translation: nil, translation_key: nil, start: , finish: )
      @original     = original
      @translation  = translation
      @translation_key = @translation_key
      @start        = start
      @finish       = finish
      @applied      = false
    end

    def apply_translation(text)
      raise 'Translation key not provided' unless translation_key
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
      text[0...start] + translation_key + text[start..-1]
    end
  end
end
