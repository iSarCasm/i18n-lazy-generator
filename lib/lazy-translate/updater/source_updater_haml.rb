module LazyTranslate
  class SourceUpdaterHAML < SourceUpdater
    private

    def key_inside_ruby(key)
      "t('.#{key}')"
    end

    def key_inside_text(key)
      "= t('.#{key}')"
    end
  end
end
