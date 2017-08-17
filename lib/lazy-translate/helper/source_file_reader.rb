module LazyTranslate
  class SourceFileReader
    def self.substitute_vars_in_text(text, &block)
      fail NotImplementedError, '#substitute_vars_in_text has to be implemented'
    end

    def self.extract_var(var_text)
      fail NotImplementedError, '#extract_var has to be implemented'
    end
  end
end
