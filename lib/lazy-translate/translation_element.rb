module LazyTranslate
  class TranslationElement
    attr_reader :original, :applied, :line, :start, :finish, :location
    attr_accessor :translation_content, :translation_key

    def initialize(line:, start:, finish:, location: nil, original: nil, translation_content: nil, translation_key: nil)
      @original             = original
      @translation_content  = translation_content
      @translation_key      = translation_key
      @line         = line
      @start        = start
      @finish       = finish
      @location     = location
      @applied      = false
    end

    def apply_translation(text)
      raise 'Translation key not provided' unless translation_key
      raise 'Translation already applied' if applied
      @applied = true
      new_text = remove_old_text_part(text)
      add_translation_part(new_text)
    end

    private

    def remove_old_text_part(text)
      lines = text.split "\n"
      lines[line] = lines[line][0...start] + lines[line][finish..-1]
      lines.join "\n"
    end

    def add_translation_part(text)
      lines = text.split "\n"
      lines[line] = lines[line][0...start] + translation_key + lines[line][start..-1]
      lines.join("\n") + "\n"
    end
  end
end
