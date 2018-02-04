module LazyTranslate
  class SourceParserHAML
    def parse(source_text)
      [
        TranslationElement.new(original: 'Some Text', location: :text, line: 1, start: 2, finish: 12)
      ]
    end
  end
end
