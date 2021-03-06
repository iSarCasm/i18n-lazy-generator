module LazyTranslate
  module CLI
    def self.start
      Translator.translate(source_path: source_path, config_path: config_path, context_string: context)
    end

    private

    def self.source_path
      ARGV[0]
    end

    def self.config_path
      ARGV[1]
    end

    def self.context
      ARGV[2]
    end
  end
end
